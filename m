Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4441C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:59:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.9120.1646301561489036194
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=XxUj0mhW;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.126, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646301561; x=1677837561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D0eoFXeJZ+FCsR0UwVvnTZ7PlMFD/JFhy7bwJlKwj0c=;
  b=XxUj0mhWRCjSNO/+fvuowpwCWepzcHA1jyNQxb7fV2rVvPEg1gmLlROz
   Ce0Ul0oDcLNP+gtGeInfRIVbhskAa6b0v104pPrshoiA59r+7BjHXwyaS
   0cipeusYIa09agshMDMEvBZn20c6zJoZjvXs4hW7XY40CIkUiJUYrz0uT
   RVPSFEignz64DfqurOX2W/2bnkWdXx+1FMvmVMYG1HrnMv1aRN1B73pJY
   WABqFSI6lYhtYWmPjhfAVBFSQ/orrSyUtaddTbilEGsclhfSfZ1dDVUXY
   VR9ekRdRiJIlYTThSCDujEmz4JHIGRil0yo9OMSRshA17jf7otXZBkDHO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237143517"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400";
   d="scan'208";a="237143517"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:59:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400";
   d="scan'208";a="686450859"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:59:15 -0800
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-networking][PATCH 1/2] libesmtp: bump 1.0.6 -> 1.1.0
Date: Thu,  3 Mar 2022 09:58:59 +0000
Message-Id: <20220303095900.2533635-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220303095900.2533635-1-jiaqing.zhao@linux.intel.com>
References: <20220303095900.2533635-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 09:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95735

This also fixes CVE-2019-19977.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../libesmtp/libesmtp/include-topdir.patch    | 48 -------------------
 .../libesmtp/libesmtp/snprintf.patch          | 19 --------
 .../libesmtp/libesmtp_1.0.6.bb                | 38 ---------------
 .../libesmtp/libesmtp_1.1.0.bb                | 32 +++++++++++++
 4 files changed, 32 insertions(+), 105 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
 delete mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch
 delete mode 100644 meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch b/meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
deleted file mode 100644
index 90c4ce75e..000000000
--- a/meta-networking/recipes-support/libesmtp/libesmtp/include-topdir.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-diff -Nurp libesmtp-1.0.6.org/crammd5/Makefile.am libesmtp-1.0.6/crammd5/Makefile.am
---- libesmtp-1.0.6.org/crammd5/Makefile.am	2010-08-08 23:45:57.000000000 +0800
-+++ libesmtp-1.0.6/crammd5/Makefile.am	2014-11-17 11:17:21.663624295 +0800
-@@ -2,7 +2,7 @@
- 
- libdir = @plugindir@
- 
--INCLUDES = -I@srcdir@
-+INCLUDES = -I@srcdir@ -I@srcdir@/../
- AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
- 
- lib_LTLIBRARIES = sasl-cram-md5.la
-diff -Nurp libesmtp-1.0.6.org/login/Makefile.am libesmtp-1.0.6/login/Makefile.am
---- libesmtp-1.0.6.org/login/Makefile.am	2010-08-08 23:45:56.000000000 +0800
-+++ libesmtp-1.0.6/login/Makefile.am	2014-11-17 11:17:54.339623018 +0800
-@@ -2,7 +2,7 @@
- 
- libdir = @plugindir@
- 
--INCLUDES = -I@srcdir@
-+INCLUDES = -I@srcdir@ -I@srcdir@/../
- 
- lib_LTLIBRARIES = sasl-login.la
- AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
-diff -Nurp libesmtp-1.0.6.org/ntlm/Makefile.am libesmtp-1.0.6/ntlm/Makefile.am
---- libesmtp-1.0.6.org/ntlm/Makefile.am	2010-08-08 23:45:56.000000000 +0800
-+++ libesmtp-1.0.6/ntlm/Makefile.am	2014-11-17 11:18:10.551622385 +0800
-@@ -2,7 +2,7 @@
- 
- libdir = @plugindir@
- 
--INCLUDES = -I@srcdir@
-+INCLUDES = -I@srcdir@ -I@srcdir@/../
- AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
- 
- lib_LTLIBRARIES = sasl-ntlm.la
-diff -Nurp libesmtp-1.0.6.org/plain/Makefile.am libesmtp-1.0.6/plain/Makefile.am
---- libesmtp-1.0.6.org/plain/Makefile.am	2010-08-08 23:45:54.000000000 +0800
-+++ libesmtp-1.0.6/plain/Makefile.am	2014-11-17 11:18:33.355621494 +0800
-@@ -2,7 +2,7 @@
- 
- libdir = @plugindir@
- 
--INCLUDES = -I@srcdir@
-+INCLUDES = -I@srcdir@ -I@srcdir@/../
- AM_CFLAGS = @CFLAGS@ @EXTRA_CFLAGS@
- 
- lib_LTLIBRARIES = sasl-plain.la
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch b/meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch
deleted file mode 100644
index d0d203ead..000000000
--- a/meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Use HAVE_WORKING_SNPRINTF to check for snprintf()
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libesmtp-1.0.6/missing.h
-===================================================================
---- libesmtp-1.0.6.orig/missing.h
-+++ libesmtp-1.0.6/missing.h
-@@ -43,7 +43,7 @@ int strncasecmp (const char *a, const ch
- void *memrchr (const void *a, int c, size_t len);
- #endif
- 
--#ifndef HAVE_SNPRINTF
-+#ifndef HAVE_WORKING_SNPRINTF
- #include <sys/types.h>
- int snprintf(char *s, size_t n, const char *format, ...);
- #endif
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
deleted file mode 100644
index ed2a5d904..000000000
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "SMTP client library"
-DESCRIPTION = "LibESMTP is a library to manage posting \
-(or submission of) electronic mail using SMTP to a \
-preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
-HOMEPAGE = "http://www.stafford.uklinux.net/libesmtp/"
-LICENSE = "LGPLv2+"
-SECTION = "libs"
-
-DEPENDS = "openssl"
-
-SRC_URI = "http://www.stafford.uklinux.net/libesmtp/libesmtp-${PV}.tar.bz2 \
-           file://include-topdir.patch \
-           file://snprintf.patch \
-          "
-SRC_URI[md5sum] = "bf3915e627fd8f35524a8fdfeed979c8"
-SRC_URI[sha256sum] = "d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
-
-inherit autotools binconfig
-
-EXTRA_OECONF = " \
-    --with-auth-plugin-dir=${libdir}/esmtp-plugins \
-    --enable-pthreads                              \
-    --enable-debug                                 \
-    --enable-etrn                                  \
-    --disable-isoc                                 \
-    --disable-more-warnings                        \
-    --disable-static                               \
-"
-
-FILES:${PN} = "${libdir}/lib*${SOLIBS} \
-               ${libdir}/esmtp-plugins/*${SOLIBSDEV}"
-
-FILES:${PN}-dev  += "${libdir}/esmtp-plugins/*.la"
-FILES:${PN}-static += "${libdir}/esmtp-plugins/*.a"
-FILES:${PN}-dbg += "${libdir}/esmtp-plugins/.debug/"
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
new file mode 100644
index 000000000..7d65133c5
--- /dev/null
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "SMTP client library"
+DESCRIPTION = "LibESMTP is a library to manage posting \
+(or submission of) electronic mail using SMTP to a \
+preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
+HOMEPAGE = "https://libesmtp.github.io/"
+LICENSE = "LGPLv2+"
+SECTION = "libs"
+
+DEPENDS = "openssl"
+
+SRC_URI = "git://github.com/libesmtp/libESMTP.git;branch=master;protocol=https"
+SRCREV = "1d0af244310a66943ab400be56b15a9087f181eb"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742 \
+                    file://COPYING.GPL;md5=393a5ca445f6965873eca0259a17f833"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = " \
+    -Dpthreads=enabled \
+    -Dtls=enabled \
+    -Dxdg=false \
+    -Dlwres=disabled \
+    -Dbdat=true \
+    -Detrn=true \
+    -Dxusr=true \
+"
+
+FILES:${PN} = "${libdir}/lib*${SOLIBS} \
+               ${libdir}/esmtp-plugins-6.2.0/*${SOLIBSDEV}"
-- 
2.32.0


