Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6949AC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 03:05:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.1746.1646967937325240577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 19:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GdFMRMEI;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id v4so7021724pjh.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 19:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4R+7HPuNNz4sZ0IYR/mazfFk1LpMr099mNCqFDlG/4=;
        b=GdFMRMEI1vO29Lg9pZp6OjORHaIkpkAeSbd148xlB3CERIAol0qfGfCb1qrGXp50/i
         HWuTWvEXyiqc+luuHc1sMCPQHWtwoAGhyYgQ7dCRgZ+hatJlzbCBCVGNGUACX5lMnQY8
         IErpAmnUYJSDxtLwXd+EcgU9HR8dvFwmW8DpvZ9/XBNhZW+o0qARO5d+JN98P0u1XpIK
         HzB2/icJZDH0lUsH2PRHIpETg9jOz0KmIGG2CgcsNQmrsTMqGHUHO5qtRycGbqku5aza
         otGE4VOQMC7F2cpX2odEECiN6y2dteSgYprkM8ofNseKK1YDwDjq0MNHdp8nzwAGc0AL
         ugMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4R+7HPuNNz4sZ0IYR/mazfFk1LpMr099mNCqFDlG/4=;
        b=Fi/s7paapj3M3tdp825l0fe6l/tyIrnTOEOayo9oUKj9W7kFi6nn7OBAUr0jNM92CA
         vmFcfajtdoSbpgtgBtoPp1G50oY568yi/zWwXa4OgowMkfb5XJHuNWVYuiyFli7ZXiDq
         zsDpAK+//vrGHvyCaSDW96NNa4UCzBZBWHZt/RqtAZaXSCB0F9z/5ZxgiNpCsVdbajyb
         9oOR0gZ0BXN+IuXo0LIh9mYpuSyTR9BtQ6nw7AXXOg0ruowBmPgg1hM3xKdp3TZ98/Nu
         BcFxwz9/Gkjk6XiWw+J3SJRwmwVFJq16dWb/+NzBUhTN+Dzlw4ye2V2O80UD/zXHeLG+
         awXQ==
X-Gm-Message-State: AOAM531AHpwSJCKhTT3I4RSN8kzDGMVIBHN80t6IuekhZVIb41b+Fw8Y
	OdrGzSltuHXbfy9JpQFK7ZWCEnZC3jA0UA==
X-Google-Smtp-Source: 
 ABdhPJzthQeI8qPgx9UzYVVbBzpkIPt2EQmYmeUG3DJI/3vZYEB9Ek9x+VVuVSJu0aGMicW0FgfFJQ==
X-Received: by 2002:a17:902:b582:b0:14c:a63d:3df6 with SMTP id
 a2-20020a170902b58200b0014ca63d3df6mr8220171pls.51.1646967936369;
        Thu, 10 Mar 2022 19:05:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 q11-20020a63f94b000000b00373c5319642sm6674277pgk.93.2022.03.10.19.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 19:05:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pcp: Do not search headers on build host during
 cross compile
Date: Thu, 10 Mar 2022 19:05:33 -0800
Message-Id: <20220311030533.1985352-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 03:05:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95944

This is required for cross-compile to work correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp.inc           |  3 +-
 ...e-Limit-the-header-search-to-sysroot.patch | 88 +++++++++++++++++++
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 1c1a977b97..708ebfe7ab 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
 COMPATIBLE_HOST:libc-musl = "null"
 
 SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/${BP}.src.tar.gz \
-	   file://config.linux \
+           file://0001-configure-Limit-the-header-search-to-sysroot.patch \
+           file://config.linux \
 	   "
 SRC_URI[sha256sum] = "6ef33b7aa14c09860ba7cd8873e76d38ccd24eab0c94a50e235f813e77fe3610"
 
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch b/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
new file mode 100644
index 0000000000..591f94f374
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
@@ -0,0 +1,88 @@
+From 1eb68f65fd73443d862ca5f36f3b6041e2b0f13a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Mar 2022 18:53:13 -0800
+Subject: [PATCH] configure: Limit the header search to sysroot
+
+Hardcoded paths in configure.ac means it starts to poke at host system
+include paths, which is least we want in a cross build, therefore prefix
+these paths with STAGING_SYSROOT
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5d24714..4e2d8ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -913,7 +913,7 @@ AC_DEFUN([PCP_CHECK_PYTHON_HEADER],
+   [ PY_MAJOR="$1"
+     PY_MINOR="$2"
+     PY_VERSION="python$PY_MAJOR.$PY_MINOR"
+-    PY_INCLUDE_DIRS="-I/usr/include/${PY_VERSION}m -I/usr/include/${PY_VERSION}"
++    PY_INCLUDE_DIRS="-I${STAGING_INCDIR}/${PY_VERSION}m -I${STAGING_INCDIR}/${PY_VERSION}"
+     saved_CFLAGS="$CFLAGS"
+     saved_CPPFLAGS="$CPPFLAGS"
+     CFLAGS="$CFLAGS $PY_INCLUDE_DIRS"
+@@ -1524,7 +1524,7 @@ AC_SUBST(qmake)
+ 
+ enable_qt3d=false
+ AS_IF([test "x$do_qt3d" != "xno"], [
+-    if test -f /usr/include/Coin3/Inventor/Qt/SoQt.h -o -f /usr/include/Inventor/Qt/SoQt.h
++    if test -f ${STAGING_INCDIR}/Coin3/Inventor/Qt/SoQt.h -o -f ${STAGING_INCDIR}/Inventor/Qt/SoQt.h
+     then
+ 	enable_qt3d=$enable_qt
+     elif test x"$do_qt3d" = x"yes"
+@@ -3810,13 +3810,13 @@ then
+ 
+     saved_CFLAGS="$CFLAGS"
+     saved_CPPFLAGS="$CPPFLAGS"
+-    NSS_INC_DIRS="-I/usr/include/nss -I/usr/include/nss3"
+-    NSPR_INC_DIRS="-I/usr/include/nspr -I/usr/include/nspr4"
++    NSS_INC_DIRS="-I${STAGING_INCDIR}/nss -I${STAGING_INCDIR}/nss3"
++    NSPR_INC_DIRS="-I${STAGING_INCDIR}/nspr -I${STAGING_INCDIR}/nspr4"
+     CFLAGS="$CFLAGS $NSS_INC_DIRS $NSPR_INC_DIRS"
+     CPPFLAGS="$CPPFLAGS $NSS_INC_DIRS $NSPR_INC_DIRS"
+ 
+-    AC_CHECK_HEADERS([nss/nss.h], [NSSCFLAGS=-I/usr/include/nss], [
+-	AC_CHECK_HEADERS([nss3/nss.h], [NSSCFLAGS=-I/usr/include/nss3], [
++    AC_CHECK_HEADERS([nss/nss.h], [NSSCFLAGS=-I${STAGING_INCDIR}/nss], [
++	AC_CHECK_HEADERS([nss3/nss.h], [NSSCFLAGS=-I${STAGING_INCDIR}/nss3], [
+ 	    enable_secure=false
+ 	    if test "$do_secure" = "yes"
+ 	    then
+@@ -3826,8 +3826,8 @@ then
+     ])
+     AC_SUBST(NSSCFLAGS)
+ 
+-    AC_CHECK_HEADERS([nspr/nspr.h], [NSPRCFLAGS=-I/usr/include/nspr], [
+-	AC_CHECK_HEADERS([nspr4/nspr.h], [NSPRCFLAGS=-I/usr/include/nspr4], [
++    AC_CHECK_HEADERS([nspr/nspr.h], [NSPRCFLAGS=-I${STAGING_INCDIR}/nspr], [
++	AC_CHECK_HEADERS([nspr4/nspr.h], [NSPRCFLAGS=-I${STAGING_INCDIR}/nspr4], [
+ 	    enable_secure=false
+ 	    if test "$do_secure" = "yes"
+ 	    then
+@@ -3837,7 +3837,7 @@ then
+     ])
+     AC_SUBST(NSPRCFLAGS)
+ 
+-    AC_CHECK_HEADERS([sasl/sasl.h], [SASLCFLAGS=-I/usr/include/sasl], [
++    AC_CHECK_HEADERS([sasl/sasl.h], [SASLCFLAGS=-I${STAGING_INCDIR}/sasl], [
+ 	enable_secure=false
+ 	if test "$do_secure" = "yes"
+ 	then
+@@ -3938,7 +3938,7 @@ AC_SUBST(enable_decompression)
+ AC_SUBST(enable_lzma)
+ 
+ dnl check for array sessions
+-if test -f /usr/include/sn/arsess.h
++if test -f ${STAGING_INCDIR}/sn/arsess.h
+ then
+     pcp_mpi_dirs=libpcp_mpi\ libpcp_mpiread
+ else
+-- 
+2.35.1
+
-- 
2.35.1


