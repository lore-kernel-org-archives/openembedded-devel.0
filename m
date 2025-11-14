Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50385CDE002
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:50:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10472.1763092237518336675
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=drz6IOVG;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so943797b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763092237; x=1763697037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIUkMiNqIJqh6b27BUlWuL8XrTVfA3Iai+8N0U5IzRU=;
        b=drz6IOVG1goe1o9FI3WcPZKSctfKWeZNP8qM9YV6U7wABDOBsmVGtccw765BGs6Xh+
         SL1pAY5USOA+SFoAxJjuPNAbmNDlnpjjvBciR/BF1lahbRrsleBxfMtEoKHc2+WTVB/b
         DIVXTqCFd0cplyP3KdCFHM5e/3ZNHbFjGxziCSutKPyD87WBTeSvtei3wS6C39HRmQnx
         43K5BhIlDLt1zwNAQPuDYNzcpYpqfAftzaAcm9Ngn71aoAU+nbH7767hJLOFnFvLZhkk
         3epAHbZZOhsxYm/6cKPt38bdwGH1xKKx1xr/7IjYgTidYb8h1UBigtmHITrQPKMGdVcv
         TEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092237; x=1763697037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIUkMiNqIJqh6b27BUlWuL8XrTVfA3Iai+8N0U5IzRU=;
        b=NFad6kgoJHvcV76/kWqKHXBR3X0f+s95N2cD422qFOHMWgjbdOGVvu1MN/GFu2RoQ5
         S7Zhs+qhZk6mM4mc9w4J/JN8++qy1jsUj42AhXGYdT2D8IG59+L7CKH98Nn/qXUzbi1c
         JEZYp4zOfQ8kA/qKRIPf+kL8Oh/ghWdUgcY+TFhV08k8dU90DeQq9UxmvinIvvT4tZ/O
         SLIz6mtFG//Jmh9whXlkoNhxTliRl3wr9CnGvUCoInx/quOeVvSV8vtsDzcH6xrNtRO8
         3PPMmoqDkNE78Wu4J/xmZ+4fVfrxg7TySj23JRIc2Ul/3pkgMf64WlqsIazc7jF18/we
         ou2A==
X-Gm-Message-State: AOJu0Yw0Fhhy8A6Wkvm9ZKqfVkvf9OBHlVYMHFU45ioJnAiZnJPdYuJ3
	KppcawFpNOpWBW0TU4nWhJZbkt5UiEThYl1NvXrphTkFaRmBXKdsMei7lchnHg==
X-Gm-Gg: ASbGncukkE5Pz6A9p+dyZfmFmXk5ec5CDRlOrt7Ac/+D88MNIcEmBq1T7KMUf+w0mSb
	L5GxbIM1ohjQb5TGaTcHAQkDgWkhFOgmKTFE0mcIyaFeAYje6ZQ14U96JracpTjUhzNu0zsWau+
	tvDU9WBvaiSsXCCMYoTC66O50xU9GvSj6EDoQNhSbLrrwqButd/t9gu6ORGH27eG4xLp18xy+m8
	afJdK9uhHdh6nhD5E+gCZbMK1ZQ3rrp/cGP4sADETKjGGnCSFwNwSeD9kuXuGiR1RxkLhZVetJ4
	OBFGtMvYleqX/FUcAxFfny2MX7A7aCZ7/zn/LHICi605aPm2RjbIL7/s0HA7Q9CoZDGwBiTtTye
	sN60Wc2M5fUSthp9z9NmhHs03QB/Jj1aN/aBDIWVEiZLMirZFoKKRy6WuhNps3FTbw24UlCVwcX
	7DqURgGXqB31rJXw==
X-Google-Smtp-Source: AGHT+IGpCAq3qnu7i5GvV3tG+pa3iJjMO58ADAucUSyJIMRkc9kLoO2a2Zz9uWlvBwseK3K5quPDgg==
X-Received: by 2002:a05:6a20:7f98:b0:355:1add:c28a with SMTP id adf61e73a8af0-35b9f88d179mr2443640637.2.1763092236470;
        Thu, 13 Nov 2025 19:50:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm3478092a12.23.2025.11.13.19.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:50:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/5] libbpf: upgrade 1.5.0 -> 1.6.2
Date: Fri, 14 Nov 2025 16:50:26 +1300
Message-ID: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121677

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches which are now merged in the upstream

Changelog:
https://github.com/libbpf/libbpf/releases/tag/v1.5.1
https://github.com/libbpf/libbpf/releases/tag/v1.6.0
https://github.com/libbpf/libbpf/releases/tag/v1.6.1
https://github.com/libbpf/libbpf/releases/tag/v1.6.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

