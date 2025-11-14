Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91287CE7AA0
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 09:47:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14458.1763113634756757199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 01:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YWGEHNPn;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297e239baecso26798225ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763113634; x=1763718434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=veDcah7bhL3BusLJ0uc9IfANh2EGQLIPqmBmZiU0e78=;
        b=YWGEHNPnIIeDF0elIe2eKo3SkLwtQCj1PgORbEB6r1ezONnWGDZwFgHlhOGSbO3jiW
         WuJG2NBCh08tcUePCbb5fBctVx0O3391pnaMG3LHZ+fgehRvmZVL3px09gtm7jvt/4NU
         0AYhNM4md5bC57FRqMR4FDMjYb5d3WbhS/CrM2eTVZEy9GM5f60Zi9AZ7Qaw+LU9m4U9
         +/+5gbnFfmg6KlUdqmd+dKTpT5GAyIsOHqFsPvtOCQGPChV9e3MWxRwls+1YIZbSme24
         lM0yXRq85p3Y0VuPyyy5aKYb/1CDd9Z9td5sgLZ4X4yeiqCPTnkf78bE51rouBCj7U7T
         xnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113634; x=1763718434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veDcah7bhL3BusLJ0uc9IfANh2EGQLIPqmBmZiU0e78=;
        b=wvsXh3HYff1xbY2OG7N3MT5i0CRp+kcFX3hynif1NY3/rLKM0efHtJFL2HS7ZMcd6Z
         j8Abdrj1PLKIUur/t2kmDr39XAp25lc8mQ/O+AgzPBzfDp6u0flRPSyWJ+VKgGO9QvzG
         NmuZlo0mtKJswuA0tRHM1CS4EdMCChMbPWiwj2EbMScmgUfDHrYXffqNNbanuoRkr/NO
         ClsafGvNul0Aewjrv7P3KmCpQPBlA6C1ZN2KmLijIZcNoRSZgG8X9KlX4lqPNK9myKlJ
         UA8FgnB4ciFqQap074X0om25pQW57b5MRQz6BJjiAW9X5yNLqh/qMXZhZFoISY+Yw2G/
         Vo9g==
X-Gm-Message-State: AOJu0YwQRYFuvDevOH59vTuqkXB1N1avX3vHp3QezqIkCIqQZo9qqXhK
	Ee/G1nzpCCjhtZm/FKzuGqO9z/6T4F+6QYxFqgneeeKrPV4bJt1VY7a755ElSQ==
X-Gm-Gg: ASbGncu9Bb/F6VoVCLcXCMG4cPWnNUCmTA5FXMZtSFAKwAM806NFNQ5ZgZAYtrpDbmp
	Y4t6dbGxD0jzJ/DXc8Mim9Cf4tTppo5JeGXZ7VoZs600VRdpW9eftIc91pzhM8qdFLa9MBKE9b/
	Qc/p21wL/xpLOdAADVyKtsF+X06iN6ujGBzaJazp9rSsglK3XxfnYz8oUOL07l5FyxIHH5GBuIo
	aLFiJp6C+k3rffhEVOhxYrnM6EzqUVpIj4NN13Cl/3V90KtncECmo2JjlRMX/4z+Xjhok2Lj+4b
	7sPKq8RxeyXr3+wrNlpwS5+bDdisUgQVgvf8a9leb9oUEM/gj/m46PDUQ67/ExZ+csqhI83DOQO
	dXQs8Ax3dCi61OSSqdcHJyKfV6Lb0qyj5nQ1yyZqpEbhELWWeH35K6QkYWuKApbVXu+XpXKLtPm
	eHp/KBRo2ILssk
X-Google-Smtp-Source: AGHT+IG7rm4cCB9+Jat3hhWSIhvEgocmw91fvHb3HuMGbtlwcDJM5bdOs74of/5a3QvgA+s7nqNSLw==
X-Received: by 2002:a17:903:990:b0:298:5fde:5a77 with SMTP id d9443c01a7336-29867fd195amr28902085ad.22.1763113633950;
        Fri, 14 Nov 2025 01:47:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c103asm49413995ad.96.2025.11.14.01.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:47:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 1/5] libbpf: upgrade 1.5.0 -> 1.6.2
Date: Fri, 14 Nov 2025 22:46:59 +1300
Message-ID: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 09:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121702

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches which are now merged in the upstream

Changelog:
https://github.com/libbpf/libbpf/releases/tag/v1.5.1
https://github.com/libbpf/libbpf/releases/tag/v1.6.0
https://github.com/libbpf/libbpf/releases/tag/v1.6.1
https://github.com/libbpf/libbpf/releases/tag/v1.6.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---

v2: no change

---

 ...-empty-BTF-data-section-in-btf_parse.patch |  43 --------
 .../libbpf/files/CVE-2025-29481.patch         | 102 ------------------
 .../{libbpf_1.5.0.bb => libbpf_1.6.2.bb}      |   7 +-
 3 files changed, 2 insertions(+), 150 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch
 delete mode 100644 meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.5.0.bb => libbpf_1.6.2.bb} (80%)

diff --git a/meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch b/meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch
deleted file mode 100644
index 873995b644..0000000000
--- a/meta-oe/recipes-kernel/libbpf/files/0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ff2eb6e134ebfc225b97b46182af3cc58ed481f6 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 10 Apr 2025 11:50:04 +0800
-Subject: [PATCH] libbpf: check for empty BTF data section in btf_parse_elf
-
-A valid ELF file may contain a SHT_NOBITS .BTF section. This case is
-not handled correctly in btf_parse_elf, which leads to a segfault.
-
-Add a null check for a buffer returned by elf_getdata() before
-proceeding with its processing.
-
-Bug report: https://github.com/libbpf/libbpf/issues/894
-
-Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
-Acked-by: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
-
-Upstream-Status: Backport [https://github.com/kernel-patches/bpf-rc/commit/b02b669fd9398d246c8c9ae901c0d8f5bb36a588]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- btf.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/btf.c b/btf.c
-index e9673c0e..21d38dcf 100644
---- a/btf.c
-+++ b/btf.c
-@@ -1199,6 +1199,12 @@ static struct btf *btf_parse_elf(const char *path, struct btf *base_btf,
- 		goto done;
- 	}
- 
-+	if (!secs.btf_data->d_buf) {
-+		pr_warn("BTF data is empty in %s\n", path);
-+		err = -ENODATA;
-+		goto done;
-+	}
-+
- 	if (secs.btf_base_data) {
- 		dist_base_btf = btf_new(secs.btf_base_data->d_buf, secs.btf_base_data->d_size,
- 					NULL);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch b/meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch
deleted file mode 100644
index ebfcb94a2f..0000000000
--- a/meta-oe/recipes-kernel/libbpf/files/CVE-2025-29481.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 806b4e0a9f658d831119cece11a082ba1578b800 Mon Sep 17 00:00:00 2001
-From: Viktor Malik <vmalik@redhat.com>
-Date: Tue, 15 Apr 2025 17:50:14 +0200
-Subject: [PATCH] libbpf: Fix buffer overflow in bpf_object__init_prog
-
-As shown in [1], it is possible to corrupt a BPF ELF file such that
-arbitrary BPF instructions are loaded by libbpf. This can be done by
-setting a symbol (BPF program) section offset to a large (unsigned)
-number such that <section start + symbol offset> overflows and points
-before the section data in the memory.
-
-Consider the situation below where:
-- prog_start = sec_start + symbol_offset    <-- size_t overflow here
-- prog_end   = prog_start + prog_size
-
-    prog_start        sec_start        prog_end        sec_end
-        |                |                 |              |
-        v                v                 v              v
-    .....................|################################|............
-
-The report in [1] also provides a corrupted BPF ELF which can be used as
-a reproducer:
-
-    $ readelf -S crash
-    Section Headers:
-      [Nr] Name              Type             Address           Offset
-           Size              EntSize          Flags  Link  Info  Align
-    ...
-      [ 2] uretprobe.mu[...] PROGBITS         0000000000000000  00000040
-           0000000000000068  0000000000000000  AX       0     0     8
-
-    $ readelf -s crash
-    Symbol table '.symtab' contains 8 entries:
-       Num:    Value          Size Type    Bind   Vis      Ndx Name
-    ...
-         6: ffffffffffffffb8   104 FUNC    GLOBAL DEFAULT    2 handle_tp
-
-Here, the handle_tp prog has section offset ffffffffffffffb8, i.e. will
-point before the actual memory where section 2 is allocated.
-
-This is also reported by AddressSanitizer:
-
-    =================================================================
-    ==1232==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c7302fe0000 at pc 0x7fc3046e4b77 bp 0x7ffe64677cd0 sp 0x7ffe64677490
-    READ of size 104 at 0x7c7302fe0000 thread T0
-        #0 0x7fc3046e4b76 in memcpy (/lib64/libasan.so.8+0xe4b76)
-        #1 0x00000040df3e in bpf_object__init_prog /src/libbpf/src/libbpf.c:856
-        #2 0x00000040df3e in bpf_object__add_programs /src/libbpf/src/libbpf.c:928
-        #3 0x00000040df3e in bpf_object__elf_collect /src/libbpf/src/libbpf.c:3930
-        #4 0x00000040df3e in bpf_object_open /src/libbpf/src/libbpf.c:8067
-        #5 0x00000040f176 in bpf_object__open_file /src/libbpf/src/libbpf.c:8090
-        #6 0x000000400c16 in main /poc/poc.c:8
-        #7 0x7fc3043d25b4 in __libc_start_call_main (/lib64/libc.so.6+0x35b4)
-        #8 0x7fc3043d2667 in __libc_start_main@@GLIBC_2.34 (/lib64/libc.so.6+0x3667)
-        #9 0x000000400b34 in _start (/poc/poc+0x400b34)
-
-    0x7c7302fe0000 is located 64 bytes before 104-byte region [0x7c7302fe0040,0x7c7302fe00a8)
-    allocated by thread T0 here:
-        #0 0x7fc3046e716b in malloc (/lib64/libasan.so.8+0xe716b)
-        #1 0x7fc3045ee600 in __libelf_set_rawdata_wrlock (/lib64/libelf.so.1+0xb600)
-        #2 0x7fc3045ef018 in __elf_getdata_rdlock (/lib64/libelf.so.1+0xc018)
-        #3 0x00000040642f in elf_sec_data /src/libbpf/src/libbpf.c:3740
-
-The problem here is that currently, libbpf only checks that the program
-end is within the section bounds. There used to be a check
-`while (sec_off < sec_sz)` in bpf_object__add_programs, however, it was
-removed by commit 6245947c1b3c ("libbpf: Allow gaps in BPF program
-sections to support overriden weak functions").
-
-Add a check for detecting the overflow of `sec_off + prog_sz` to
-bpf_object__init_prog to fix this issue.
-
-[1] https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
-
-Fixes: 6245947c1b3c ("libbpf: Allow gaps in BPF program sections to support overriden weak functions")
-Reported-by: lmarch2 <2524158037@qq.com>
-Signed-off-by: Viktor Malik <vmalik@redhat.com>
-Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
-Reviewed-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
-Link: https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
-Link: https://lore.kernel.org/bpf/20250415155014.397603-1-vmalik@redhat.com
-
-CVE: CVE-2025-29481
-Upstream-Status: Backport [https://github.com/libbpf/libbpf/commit/806b4e0a9f658d831119cece11a082ba1578b800]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/libbpf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libbpf.c b/src/libbpf.c
-index b2591f5..56250b5 100644
---- a/src/libbpf.c
-+++ b/src/libbpf.c
-@@ -889,7 +889,7 @@ bpf_object__add_programs(struct bpf_object *obj, Elf_Data *sec_data,
- 			return -LIBBPF_ERRNO__FORMAT;
- 		}
- 
--		if (sec_off + prog_sz > sec_sz) {
-+		if (sec_off + prog_sz > sec_sz || sec_off + prog_sz < sec_off) {
- 			pr_warn("sec '%s': program at offset %zu crosses section boundary\n",
- 				sec_name, sec_off);
- 			return -LIBBPF_ERRNO__FORMAT;
diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.6.2.bb
similarity index 80%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.6.2.bb
index 36312c386b..28732b1e66 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.5.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.6.2.bb
@@ -8,11 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master \
-           file://0001-libbpf-check-for-empty-BTF-data-section-in-btf_parse.patch \
-           file://CVE-2025-29481.patch;striplevel=2 \
-"
-SRCREV = "09b9e83102eb8ab9e540d36b4559c55f3bcdb95d"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=${BPN}-${PV}"
+SRCREV = "45e89348ec74617c11cd5241ccd0ffc91dfd03c4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"

