Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77205C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 05:15:48 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.13760.1710479747622105106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 22:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ps0fYzsc;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a468616ed70so29861366b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 22:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710479746; x=1711084546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpR4MFay6Or1+i7ky1vkuhIPFYpLHXiXIalU8mtB20E=;
        b=Ps0fYzscpOp2be6WBeLeHDW7+TTQQqOlLtK68BEtP++rOMKoZt4dDEwEP48wLqKbK8
         8QJsjpplQD8ZjdcrgEa5r44VkebwA+kJJRf1tijSTAQiwejVF/pmKsbF0gWXHYG54kHa
         TN07Vl14SQch1HjRoef3lsrchhjGgT7tq4F5tw94n0mDU7RhEOroJ4ShRSpwcMECcfnf
         Re7XNyHiG+nKPdaCW31eoPAkrOT5Kyz0HuVpvjfVdYnoXgNZVjaire4p7vq8ptuVwHsH
         zBp6hdmVbWacrBOig2/63Om+hk/Q/GEbhFACeY1OQqpbggVkTeVZQvDJG8DLPfaK524Q
         762Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710479746; x=1711084546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpR4MFay6Or1+i7ky1vkuhIPFYpLHXiXIalU8mtB20E=;
        b=dMgYwGq1iE9Nz6/pcg5u0J+SarcK2lLyU0X0jDUb/TV6T5gnxHn06flmmlWtdnLA5M
         d6mo07VF3jR4Y+Zsdl60uUIWZ65+M+fm8Baqakmjj7+RsH0l++k0N18BFoupSTvDFyg0
         UUTW3oPqzFZIeZDv8Fz+qwxD+VEDfamT5dE+b8AstUp8xy5NqHAv7fzWEJBW3hMy8lRF
         1x2zLl24j5ikLen9jb7QRVVDIGJdVeoJR8yW/HND2Q0nW879vtFUr197QhWr8f8OcjHy
         siEMbVAl5rOwhxKmTML5PPa8Ku649NTEOHPm2TLohYYuknazyjQAldQcjNUqW0fp+PaV
         rJJg==
X-Gm-Message-State: AOJu0YybawddyrlYv3REp2Q0AvNPHgHFBW4l1IGs2CYOXzTNwcbhGVVp
	UUtIrlktjoythY8/LFOdWMijQppkfGVVEdd3G5k4EjJozYIdTttqBfIrqkJQ
X-Google-Smtp-Source: AGHT+IH2e7VGCJORWjOMx3dopSRNNw9K+RQFQyCZuP+SIkUUepNNPjxPfM5eq/F+y6h6IB4pnRTJSw==
X-Received: by 2002:a17:906:3716:b0:a46:5b72:6d38 with SMTP id d22-20020a170906371600b00a465b726d38mr2324201ejc.63.1710479745651;
        Thu, 14 Mar 2024 22:15:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k4-20020a170906578400b00a464b3ee655sm1378909ejq.13.2024.03.14.22.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 22:15:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: changqing.li@windriver.com,
	alperyasinak1@gmail.com,
	chen_heyun@163.com,
	omatiush@cisco.com,
	niko.mauno@vaisala.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] unionfs-fuse, dropwatch, postgresql, yasm, multipath-tools, python3-pybind11: add missing Upstream-Status
Date: Fri, 15 Mar 2024 06:15:29 +0100
Message-ID: <20240315051529.3751-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109329

* add Pending to .patch files where it was accidentally droped
  with upgrades or modifications in:

  f88e5b146e postgresql: upgrade 15.5 -> 16.2
  c904e169db multipath-tools: upgrade 0.9.3 -> 0.9.8
  105be9b3d9 unionfs-fuse: upgrade 2.2 --> 3.4

  or new patches where the author didn't notice/care:

  2a7f74cdb0 dropwatch: Use header files from sysroot instead of build host
  f5cc9f272a yasm: improve reproducibility
  39028d0d9d python3-pybind11: Restore strip prevention patch

  authors of these added to CC, please be more careful with removing
  or not adding these or enable patch-status in ERROR_QA for your
  builds, see:
  https://lists.openembedded.org/g/openembedded-core/topic/104922136#197113

* added with:
  for p in `/OE/layers/openembedded-core/scripts/contrib/patchreview.py -v . | grep Missing.Upstream-Status.tag | sed 's/.*(//g;s/)$//g'`; do grep -q ^Upstream-Status: $p || sed -i "s/^---$/\nUpstream-Status: Pending\n---/g" $p;         grep -q ^Upstream-Status: $p || sed -i "1iUpstream-Status: Pending\n" $p;     done

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../unionfs-fuse/files/0001-support-cross-compiling.patch       | 2 ++
 ...1-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch | 2 ++
 .../postgresql/files/0001-Add-support-for-RISC-V.patch          | 2 ++
 .../yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch    | 2 ++
 .../yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch     | 2 ++
 .../files/0001-RH-fixup-udev-rules-for-redhat.patch             | 2 ++
 ...002-RH-Remove-the-property-blacklist-exception-builtin.patch | 2 ++
 .../files/0011-fix-bug-of-do_compile-and-do_install.patch       | 2 ++
 .../python/python3-pybind11/0001-Do-not-strip-binaries.patch    | 2 ++
 9 files changed, 18 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
index 13e782fa70..9b4d0f6cae 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
@@ -7,6 +7,8 @@ Do not override OE CMAKE variables
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch b/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch
index 33b72e05f0..d0baceb15b 100755
--- a/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch
+++ b/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] fix bug: build with sysroot head file instead of local head
  file:net_dropmon.h
 
 Signed-off-by: chenheyun <chen_heyun@163.com>
+
+Upstream-Status: Pending
 ---
  src/main.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index 34d34ecad9..ebd3e03685 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/5] Add support for RISC-V.
 
 The architecture is sufficiently similar to aarch64 that simply
 extending the existing aarch64 macro works.
+
+Upstream-Status: Pending
 ---
  src/include/storage/s_lock.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
index e65c9853e0..42f5559e3f 100644
--- a/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
+++ b/meta-oe/recipes-devtools/yasm/yasm/0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch
@@ -7,6 +7,8 @@ If SOURCE_DATE_EPOCH is set, use it to generate a reproducible
 string for BUILD_DATE.
 
 Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
+
+Upstream-Status: Pending
 ---
  configure.ac | 8 ++++++++
  1 file changed, 8 insertions(+)
diff --git a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
index 665f3afc9f..4b9c933d01 100644
--- a/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
+++ b/meta-oe/recipes-devtools/yasm/yasm/0002-yasm-Use-BUILD_DATE-for-reproducibility.patch
@@ -7,6 +7,8 @@ Use reproducible build date instead of compilation time and date.
 
 Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
 
+
+Upstream-Status: Pending
 ---
  tools/re2c/parser.c | 5 +++++
  1 file changed, 5 insertions(+)
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
index 0ec5b5b1cd..74ae1530cb 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-RH-fixup-udev-rules-for-redhat.patch
@@ -16,6 +16,8 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
 Rebase to 0.9.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Upstream-Status: Pending
 ---
  Makefile.inc        | 2 +-
  kpartx/kpartx.rules | 2 +-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
index a24c827dc7..4b24bd2d35 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0002-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -20,6 +20,8 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
 Rebase to 0.9.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Upstream-Status: Pending
 ---
  libmultipath/blacklist.c | 16 +++++-----------
  1 file changed, 5 insertions(+), 11 deletions(-)
diff --git a/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
index f32d789b04..abaea2cfb6 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0011-fix-bug-of-do_compile-and-do_install.patch
@@ -11,6 +11,8 @@ Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 [OP: Rebase to 0.9.3]
 [OP: Drop dependencies that are already present in the 0.9.3 Makefile]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
+Upstream-Status: Pending
 ---
  Makefile | 10 ++++++++++
  1 file changed, 10 insertions(+)
diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
index 37cb78a308..91575d2712 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] Do not strip binaries.
 
 Signed-off-by: Philip Balister <philip@balister.org>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+
+Upstream-Status: Pending
 ---
  tools/pybind11NewTools.cmake | 7 -------
  tools/pybind11Tools.cmake    | 6 ------
-- 
2.44.0


