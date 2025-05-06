Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74AEC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 17:52:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.82501.1746553924308484964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 10:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FJzIDReD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250506175201af12f0c666435479e1-tlckin@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250506175201af12f0c666435479e1
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 06 May 2025 19:52:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=M6XHQURb7K7oIjGOpdrM7Y+HmLL1NXJ5AE/QuTuOl8I=;
 b=FJzIDReDMKGKPc3cAOQVwGkqOVWQfCdMTRRcWa42mYEAOIpmHubZnKAhUnA8/IdFSyRsXg
 CkgqXOWm4rYvAzRa0oLe10ixQAbAaKSp4o8437TVew7yYBIkcCFgTcpj6Dg7rwhjPJY+p3hZ
 Oqp2SSGn0uRTx7bE7IClnUyQrMAOM/BYALvtfIPKn7yVqiEUUx+cWIPpgRoLZqlTRM2y/SDm
 Sn6YX6VocOZh8CzUkBWe8xreky2el4I23mDmKnSgegyOxh4PbP1w7JknEqSzi7510ZeJxX37
 rpOmbTEedM/mF+dZsYU1aAAfinmY09AnOTJdl3OzIS8uGbzTgCPh3Ieg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libbpf: patch CVE-2025-29481
Date: Tue,  6 May 2025 19:51:11 +0200
Message-Id: <20250506175111.428874-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 17:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117355

From: Peter Marko <peter.marko@siemens.com>

Backport patch which mentions PoC [1] which is also linked from [2].

[1] https://github.com/libbpf/libbpf/commit/806b4e0a9f658d831119cece11a082ba1578b800
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-29481

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libbpf/files/CVE-2025-29481.patch         | 102 ++++++++++++++++++
 meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch

diff --git a/meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch b/meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch
new file mode 100644
index 0000000000..ebfcb94a2f
--- /dev/null
+++ b/meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch
@@ -0,0 +1,102 @@
+From 806b4e0a9f658d831119cece11a082ba1578b800 Mon Sep 17 00:00:00 2001
+From: Viktor Malik <vmalik@redhat.com>
+Date: Tue, 15 Apr 2025 17:50:14 +0200
+Subject: [PATCH] libbpf: Fix buffer overflow in bpf_object__init_prog
+
+As shown in [1], it is possible to corrupt a BPF ELF file such that
+arbitrary BPF instructions are loaded by libbpf. This can be done by
+setting a symbol (BPF program) section offset to a large (unsigned)
+number such that <section start + symbol offset> overflows and points
+before the section data in the memory.
+
+Consider the situation below where:
+- prog_start = sec_start + symbol_offset    <-- size_t overflow here
+- prog_end   = prog_start + prog_size
+
+    prog_start        sec_start        prog_end        sec_end
+        |                |                 |              |
+        v                v                 v              v
+    .....................|################################|............
+
+The report in [1] also provides a corrupted BPF ELF which can be used as
+a reproducer:
+
+    $ readelf -S crash
+    Section Headers:
+      [Nr] Name              Type             Address           Offset
+           Size              EntSize          Flags  Link  Info  Align
+    ...
+      [ 2] uretprobe.mu[...] PROGBITS         0000000000000000  00000040
+           0000000000000068  0000000000000000  AX       0     0     8
+
+    $ readelf -s crash
+    Symbol table '.symtab' contains 8 entries:
+       Num:    Value          Size Type    Bind   Vis      Ndx Name
+    ...
+         6: ffffffffffffffb8   104 FUNC    GLOBAL DEFAULT    2 handle_tp
+
+Here, the handle_tp prog has section offset ffffffffffffffb8, i.e. will
+point before the actual memory where section 2 is allocated.
+
+This is also reported by AddressSanitizer:
+
+    =================================================================
+    ==1232==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c7302fe0000 at pc 0x7fc3046e4b77 bp 0x7ffe64677cd0 sp 0x7ffe64677490
+    READ of size 104 at 0x7c7302fe0000 thread T0
+        #0 0x7fc3046e4b76 in memcpy (/lib64/libasan.so.8+0xe4b76)
+        #1 0x00000040df3e in bpf_object__init_prog /src/libbpf/src/libbpf.c:856
+        #2 0x00000040df3e in bpf_object__add_programs /src/libbpf/src/libbpf.c:928
+        #3 0x00000040df3e in bpf_object__elf_collect /src/libbpf/src/libbpf.c:3930
+        #4 0x00000040df3e in bpf_object_open /src/libbpf/src/libbpf.c:8067
+        #5 0x00000040f176 in bpf_object__open_file /src/libbpf/src/libbpf.c:8090
+        #6 0x000000400c16 in main /poc/poc.c:8
+        #7 0x7fc3043d25b4 in __libc_start_call_main (/lib64/libc.so.6+0x35b4)
+        #8 0x7fc3043d2667 in __libc_start_main@@GLIBC_2.34 (/lib64/libc.so.6+0x3667)
+        #9 0x000000400b34 in _start (/poc/poc+0x400b34)
+
+    0x7c7302fe0000 is located 64 bytes before 104-byte region [0x7c7302fe0040,0x7c7302fe00a8)
+    allocated by thread T0 here:
+        #0 0x7fc3046e716b in malloc (/lib64/libasan.so.8+0xe716b)
+        #1 0x7fc3045ee600 in __libelf_set_rawdata_wrlock (/lib64/libelf.so.1+0xb600)
+        #2 0x7fc3045ef018 in __elf_getdata_rdlock (/lib64/libelf.so.1+0xc018)
+        #3 0x00000040642f in elf_sec_data /src/libbpf/src/libbpf.c:3740
+
+The problem here is that currently, libbpf only checks that the program
+end is within the section bounds. There used to be a check
+`while (sec_off < sec_sz)` in bpf_object__add_programs, however, it was
+removed by commit 6245947c1b3c ("libbpf: Allow gaps in BPF program
+sections to support overriden weak functions").
+
+Add a check for detecting the overflow of `sec_off + prog_sz` to
+bpf_object__init_prog to fix this issue.
+
+[1] https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
+
+Fixes: 6245947c1b3c ("libbpf: Allow gaps in BPF program sections to support overriden weak functions")
+Reported-by: lmarch2 <2524158037@qq.com>
+Signed-off-by: Viktor Malik <vmalik@redhat.com>
+Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
+Reviewed-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
+Link: https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
+Link: https://lore.kernel.org/bpf/20250415155014.397603-1-vmalik@redhat.com
+
+CVE: CVE-2025-29481
+Upstream-Status: Backport [https://github.com/libbpf/libbpf/commit/806b4e0a9f658d831119cece11a082ba1578b800]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/libbpf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libbpf.c b/src/libbpf.c
+index b2591f5..56250b5 100644
+--- a/src/libbpf.c
++++ b/src/libbpf.c
+@@ -889,7 +889,7 @@ bpf_object__add_programs(struct bpf_object *obj, Elf_Data *sec_data,
+ 			return -LIBBPF_ERRNO__FORMAT;
+ 		}
+ 
+-		if (sec_off + prog_sz > sec_sz) {
++		if (sec_off + prog_sz > sec_sz || sec_off + prog_sz < sec_off) {
+ 			pr_warn("sec '%s': program at offset %zu crosses section boundary\n",
+ 				sec_name, sec_off);
+ 			return -LIBBPF_ERRNO__FORMAT;
diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
index 58bb7bca09..45caca0114 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
@@ -10,6 +10,7 @@ DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master \
            file://0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch \
+           file://CVE-2025-29481.patch;striplevel=2 \
 "
 SRCREV = "09b9e83102eb8ab9e540d36b4559c55f3bcdb95d"
 

