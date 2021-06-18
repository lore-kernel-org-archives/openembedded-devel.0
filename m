Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.11080.1624037337995529779
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 10:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Fz1J8tgd;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1624037338;
  x=1655573338;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4YttBzl20SFHRhQMBeI8EmGPtLWayK7oBwRLlVqjhH0=;
  b=Fz1J8tgdBnAHkiZN7dJPJGeZdz1THqf1EUC1D54ua8JBCDXNCoIrTGfA
   IBxQ6BVSFn2+wQ/uGC4vyYzT9SXNm6Y+Gz19RbkhzEbTjlhwNKiNZOO35
   pAKjXlVHyheSi2Qaus8Pd+YVzQ7a6rZR+HCAn5X9jrfQYgoWejXSZTwIb
   B+srv24/KQzK5t5hE2EO4BjM0YxzQFVWaLErVIHUrGeUz+OfYEd+4SXK1
   3GrI57uesbqD9pT+3QPiTPllP/C8a+Lfgf9s181gywQjaj7GR/EIeaOEo
   RS1PSf9cZpg+0lIP6Um4AKpJNa7qRpcJwiW2iWSQmy+qLSeU2II4/Z87x
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cryptsetup: Only recommend kernel modules when building for target
Date: Fri, 18 Jun 2021 19:28:47 +0200
Message-ID: <20210618172847.1024-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Otherwise cryptsetup-native depends on the target kernel and thus the
target compiler, as can be seen by:

  $ bitbake -g cryptsetup-native
  $ grep 'cryptsetup.*linux-yocto' task-depends.dot
  "cryptsetup-native.do_build" -> "linux-yocto.do_deploy"
  "cryptsetup-native.do_build" -> "linux-yocto.do_package_write_rpm"
  "cryptsetup-native.do_populate_sysroot" -> "linux-yocto.do_populate_sysroot"
  $ grep 'linux-yocto.*gcc-cross' task-depends.dot
  "linux-yocto.do_kernel_configme" -> "gcc-cross-x86_64.do_populate_sysroot"
  "linux-yocto.do_prepare_recipe_sysroot" -> "gcc-cross-x86_64.do_populate_sysroot"

This also moves the runtime dependencies to near the end of the recipe,
which is more customary.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../cryptsetup/cryptsetup_2.3.6.bb            | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
index 562ac83fb..9e83b90ea 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
@@ -16,10 +16,6 @@ DEPENDS = " \
     util-linux-libuuid \
 "
 
-RDEPENDS_${PN} = " \
-    libdevmapper \
-"
-
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
 SRC_URI[md5sum] = "504d1ab22cbc4d1a59a8d8c7ee5ed3bf"
 SRC_URI[sha256sum] = "b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f"
@@ -71,14 +67,6 @@ PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
 PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
 PACKAGECONFIG[luks2] = "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
 
-RRECOMMENDS_${PN} = "kernel-module-aes-generic \
-                     kernel-module-dm-crypt \
-                     kernel-module-md5 \
-                     kernel-module-cbc \
-                     kernel-module-sha256-generic \
-                     kernel-module-xts \
-"
-
 EXTRA_OECONF = "--enable-static"
 # Building without largefile is not supported by upstream
 EXTRA_OECONF += "--enable-largefile"
@@ -89,4 +77,17 @@ EXTRA_OECONF += "--disable-libargon2"
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
 
+RDEPENDS_${PN} = " \
+    libdevmapper \
+"
+
+RRECOMMENDS_${PN}_class-target = " \
+    kernel-module-aes-generic \
+    kernel-module-dm-crypt \
+    kernel-module-md5 \
+    kernel-module-cbc \
+    kernel-module-sha256-generic \
+    kernel-module-xts \
+"
+
 BBCLASSEXTEND = "native nativesdk"
