Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393B8D6C295
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 20:28:22 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.31695.1732048092189116881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 12:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DmBp0T01;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83aad8586d3so136545039f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 12:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732048091; x=1732652891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5UDRvsdzcbjpm/0Ve64oX3mAHUgARLsGPQ9uhuQunFk=;
        b=DmBp0T01SrYzqv/EH4G2guwBszn0coFcM8gzl/kwpj6jmkRX2qLlGrEtlxq+KTniXx
         vko7pB72zvvvnnE3nrfkTeZHu11M8Fc2+dzZ0oJ2d4/1p4y3qocYj+4s8cM77ncNvgW3
         0Rur/4HwCPwgCpJwPlAPQz8TZW++gx0hkEVD6KkKE9zY1Lr028VS8CkBAF9xgWDhhPxy
         ni3TQ2DY0MAnKkbS349LKvb4dYdAB9C4CM4a6ZDH37R+zfXBN2i02+5F6LiLXbrhGaK0
         UYLz2Ib4ikwRVXPx/9qNQiH50HyipIXU+tW6xOXEAmq0Cq/hpNvPCtA1PXgWYAwxu+83
         D91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048091; x=1732652891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UDRvsdzcbjpm/0Ve64oX3mAHUgARLsGPQ9uhuQunFk=;
        b=S6cP1cmdCI3JcjN3oeIYhdwZjxevvihiebZtlpCZxjZctU6tbjjQK/qP4kkcTXbFAI
         XoxEdxHN7sHQI7vQxk+HFuQZPYYh7sngFdbtML+HTPBVRrGO9/OxCS8oFBd6mwiQokd6
         BCZ+GbOPwWdRumiDu+vhZTSkSkcm6Q5n4KYw3/BDWubd8fwPKuIpXJkwozvjaaMcW51T
         ls/RSGzvnr9f4Zq5cx09vB8kN6Ru6huSHjaRbrZEVdngJ+zU9RjZkUWqomt15VKMW/aL
         OyhvY8QpAxKydBvQhVDE5QhoUa7Pi5G1gnqZdasVoKMaLQzKTBeWJXL9BMLK16QYu3nL
         dctg==
X-Gm-Message-State: AOJu0YytIj8S3FC782R90EQbHa7UN80hHbl9VuLki9LjCHcs939UXYgM
	dXYBzC9/zRqfoZGuygg6aTU8OKXTJswfNw7oaseI4XzNy+W9jnktFW89Bg==
X-Google-Smtp-Source: AGHT+IF+WVV8kY4CUFh3Cg7o0mNtnJyftvRL4dSAGhOc9pMbc9WgADsnDs/Ep1tPZ3PN2T8IY12lpA==
X-Received: by 2002:a05:6602:3f85:b0:82c:f8fb:2c23 with SMTP id ca18e2360f4ac-83eb6086b5emr48305939f.15.1732048091043;
        Tue, 19 Nov 2024 12:28:11 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e06d6eb702sm2816971173.4.2024.11.19.12.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:28:10 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] hplip: Address reproducibility issues
Date: Tue, 19 Nov 2024 14:27:53 -0600
Message-ID: <20241119202753.838121-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 20:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113914

From: Dan McGregor <dan.mcgregor@usask.ca>

The distributed configure script removes the existing CFLAGS if it
finds python3. Correct this, so that our prefix mapping flags and
other OpenEmbedded flags get applied.

This patch was acquired from the comments in
https://bugs.launchpad.net/hplip/+bug/1879445

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/conf/include/non-repro-meta-oe.inc    |  2 -
 .../0001-Fix-upstream-CFLAGS-override.patch   | 68 +++++++++++++++++++
 .../recipes-extended/hplip/hplip_3.22.10.bb   | 15 ++--
 3 files changed, 73 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0001-Fix-upstream-CFLAGS-override.patch

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index 7961d851f92..3441cb119a8 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -33,8 +33,6 @@ KNOWN_NON_REPRO_META_OE = " \
     hdf5-dbg \
     hdf5-src \
     hdf5-staticdev \
-    hplip \
-    hplip-dbg \
     jpnevulator-doc \
     jsonrpc-dev \
     kpatch-build \
diff --git a/meta-oe/recipes-extended/hplip/hplip/0001-Fix-upstream-CFLAGS-override.patch b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-upstream-CFLAGS-override.patch
new file mode 100644
index 00000000000..c8c892c5e12
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-upstream-CFLAGS-override.patch
@@ -0,0 +1,68 @@
+From 297e517d302469fa27dd96c091021b53f9ac2254 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Fri, 26 Apr 2024 14:17:54 -0600
+Subject: [PATCH] Fix upstream CFLAGS override
+
+Upstream check for python clears OS build system CFLAGS
+
+Upstream-Status: Submitted [https://bugs.launchpad.net/hplip/+bug/1879445]
+---
+ configure.in | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index ebea052..80c4618 100644
+--- a/configure.in
++++ b/configure.in
+@@ -628,20 +628,31 @@ if test "$class_driver" = "no" && test "$hpijs_only_build" = "no" && test "$hpcu
+    fi
+ fi
+ 
+-SAVE_CPPFLAGS="$CPPFLAGS"
+-CFLAGS=`python-config --includes`
+-if [ $? -eq 0 ] 
+-then
+-   echo $FLAGS
+-else
+-CFLAGS=`python3-config --includes`
+-   if [ $? -eq 0 ]
+-   then
+-   echo $FLAGS
+-   fi
++AC_PATH_PROG(python3_config_path, python3-config, [AC_MSG_ERROR([python3-config not installed], 6)])
++
++PYTHON_INCLUDES=`$python3_config_path --includes`
++if test "X$PYTHON_INCLUDES" == "X" ; then
++  AC_MSG_ERROR([Cannot get Python includes via python3-config], 6)
++fi
++
++PYTHON_LIBS=`$python3_config_path --libs`
++if test "X$PYTHON_LIBS" == "X" ; then
++  AC_MSG_ERROR([Cannot get Python libs via python3-config], 6)
++fi
++
++SAVE_CFLAGS=$CFLAGS
++SAVE_LIBS=$LIBS
++
++CFLAGS="$CFLAGS $PYTHON_INCLUDES"
++LIBS="$LIBS $PYTHON_LIBS"
++
++AC_TRY_LINK(,[ ], AC_MSG_RESULT(yes); python_includes="ok", AC_MSG_ERROR([no: PYTHON DISABLED], 6))
++
++if test "X$python_includes" != "Xok" ; then
++  CFLAGS="$SAVE_CFLAGS"
++  LIBS="$SAVE_LIBS"
+ fi
+ 
+-#CFLAGS=`(python-config --includes)`
+ if test "$class_driver" = "no" && test "$hpijs_only_build" = "no" && test "$lite_build" = "no" && test "$hpcups_only_build" = "no"; then
+    AC_ARG_VAR([PYTHON], [Python interpreter/compiler command])
+    AC_CHECK_PROGS(PYTHON,[python python3 python2])
+@@ -664,7 +675,6 @@ if test "$class_driver" = "no" && test "$hpijs_only_build" = "no" && test "$lite
+    AS_IF([test "x$FOUND_HEADER" != "xyes"],
+           [AC_MSG_ERROR([cannot find python-devel support], 6)])
+ fi
+-CFLAGS="$save_CFLAGS"
+ 
+ if test "$hpijs_only_build" = "no" && test "$scan_build" = "yes" && test "$hpcups_only_build" = "no"; then
+    AC_CHECK_LIB([sane], [sane_open], [LIBS="$LIBS"], [AC_MSG_ERROR([cannot find sane-backends-devel support (or --disable-scan-build)], 12)])
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index c54b2e0d88f..4ee333de33a 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -16,7 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch \
            file://0006-Workaround-patch-for-missing-Python3-transition-of-t.patch \
            file://0001-Fix-installing-ipp-usb-quirk.patch \
-           file://0001-Drop-using-register-storage-classifier.patch"
+           file://0001-Drop-using-register-storage-classifier.patch \
+           file://0001-Fix-upstream-CFLAGS-override.patch"
 SRC_URI[sha256sum] = "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a8382d0c1366624"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/p/hplip/activity"
@@ -25,11 +26,6 @@ DEPENDS += "cups python3 libusb1 python3-setuptools-native"
 
 inherit autotools-brokensep python3-dir python3native python3targetconfig pkgconfig systemd
 
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-CFLAGS += "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}"
-
 EXTRA_OECONF += "\
         --enable-cups-drv-install \
         --enable-cups-ppd-install \
@@ -51,7 +47,7 @@ EXTRA_OECONF += "\
         --with-cupsfilterdir=${libexecdir}/cups/filter \
 "
 
-EXTRA_OEMAKE = "CPPFLAGS='${CFLAGS}' rulessystemdir=${systemd_unitdir}/system/"
+EXTRA_OEMAKE = "rulessystemdir=${systemd_unitdir}/system/"
 
 do_install:append() {
     rm -rf ${D}${datadir}/hplip/upgrade.py
@@ -76,7 +72,8 @@ RDEPENDS:${PN} += " \
 "
 RDEPENDS:${PN}-filter += "perl ghostscript"
 
-FILES:${PN} += "${datadir}/ipp-usb/quirks/HPLIP.conf"
+FILES:${PN} += "${datadir}/ipp-usb/quirks/HPLIP.conf \
+        ${systemd_system_unitdir}/hplip-printer@.service"
 FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 FILES:${PN}-ppd = "${datadir}/ppd"
 FILES:${PN}-cups = "${datadir}/cups"
@@ -86,6 +83,4 @@ FILES:${PN}-hal = "${datadir}/hal"
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/*.so"
 
-SYSTEMD_SERVICE:${PN} = "hplip-printer@.service"
-
 CLEANBROKEN = "1"
-- 
2.47.0


