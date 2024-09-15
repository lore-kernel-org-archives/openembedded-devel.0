Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B111DC3ABA0
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:30:43 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.117602.1726417843168314529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iw659QgJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0b7efa1c1bso3487541276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726417842; x=1727022642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O26Exi1LUuB/rrlLhSneQ5kZj1RPAB1VvhKCtFzPwO4=;
        b=iw659QgJM20ECBikxEHXK4Xcj9dVxpyqU2e+3h9b2hFEZeADT3LjdCghr7aGdepH46
         u4oghD37YnaMRpFHst+3szm4l/XRnbfzuet9VXTvXBPwGGsWHYDNSTP5CqeVQRR06ZxG
         cDIcJA/ynUu0uZyFHcSX5fa92uJlHI7g5fV6GIlVvprN97n04/kpzQAR9fL2T2SIJnED
         Vbqypoxa4ST23FIQhEI34WnWICE8Nj+qQJZPAi98rq7J5EhzkPpv6hJ3yXDjxv1RKtwF
         yLBZ7DQvYvEnSyRUvxpD1KwMIFsfvU0BAQ8nnN55WO8ke8jJetGPBz1BaZ67u2TTaZxJ
         tmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726417842; x=1727022642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O26Exi1LUuB/rrlLhSneQ5kZj1RPAB1VvhKCtFzPwO4=;
        b=DmTc3ivAhxT1Ac5LRi/FxsYBWP3U7JFUqiBLhbkYE3nO+VfPqVSmVa7KSvy13WKDM7
         5AZpA+x98Ed3JF7uqfHdBsbLn4DaDqptw1yY17ZKog/LW22hfMl8PuwIkM+hID5kP6X4
         YXSfAeQzfPuBUDo6YqajWClPTItgcGIRc3bSY34la8YMlQPIsMWfcpsd2rpbqWOa9PuQ
         8IVHsS5uHT7LCHfFke2iJEd2AZlBmXiZyA/jIwTZSS6tvlz8gZLXaYpvpOIltnofnD2o
         VnvnqZ8MTo2OI/zqOKUGOqDJSQrkFOQU0gD1n3zbANJCFUPvW6EiEKFI0wcL8U8P9jqL
         mi3A==
X-Gm-Message-State: AOJu0YxrW2WT7TPKmSU/IrLZ79Au05b83WtLCgi95ObFfMZ9durJTy82
	qoMLjH83gWEi92q7/x5A9VuxyA4jnH+WX7cvUSSZvSeBfoZv2m358DEfIQ==
X-Google-Smtp-Source: AGHT+IEiuLcr8afuqO3MWAy5RJiwKHfzDcePcJRBdDku1Bojvq6Y7q7hU8Cv9WBbYJn7lTvyEjN8HQ==
X-Received: by 2002:a05:690c:6c82:b0:6db:c7d6:8d3c with SMTP id 00721157ae682-6dbc7d68e5emr106111417b3.40.1726417841947;
        Sun, 15 Sep 2024 09:30:41 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e28e55sm5777867b3.70.2024.09.15.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:30:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/5] xerces-c: fix buildpaths QA issue
Date: Sun, 15 Sep 2024 12:30:37 -0400
Message-ID: <20240915163040.189190-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240915163040.189190-1-akuster808@gmail.com>
References: <20240915163040.189190-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112305

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bbcb7d6023a516f3d432fbf01b78cdcc486e31ba)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-use-full-path-of-with_curl-in-xerce.patch | 58 +++++++++++++++++++
 .../xerces-c/xerces-c_3.2.5.bb                |  8 +--
 2 files changed, 61 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/xerces-c/xerces-c/0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c/0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch b/meta-oe/recipes-devtools/xerces-c/xerces-c/0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch
new file mode 100644
index 0000000000..2ad7beb51c
--- /dev/null
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c/0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch
@@ -0,0 +1,58 @@
+From d001f12d428f7adaeaadee5263a22c797c99d67b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 30 Aug 2024 11:42:27 +0200
+Subject: [PATCH] aclocal.m4: don't use full path of $with_curl in xerces-c.pc
+
+* fixes:
+  ERROR: QA Issue: File /usr/lib32/pkgconfig/xerces-c.pc in package lib32-libxerces-c-dev contains reference to TMPDIR [buildpaths]
+
+* xerces-c was blacklisted due to tmpdir since 2016:
+  https://git.openembedded.org/meta-openembedded/commit/?id=1af196e42c811947bb483df30bfce758adee83d1
+
+* then sed call:
+  sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
+  was added to do_install:append and blacklist dropped in:
+  https://git.openembedded.org/meta-openembedded/commit/?id=87b9efff79e62f569525e4760adc594d0d9ac476
+
+* sed call was adjusted in:
+  https://git.openembedded.org/meta-openembedded/commit/?id=87c9e9537dc43468a6aaf706853b784ce6de14e0
+  sed -i s:-L${STAGING_LIBDIR}::g ${B}/xerces-c.pc
+
+* but it was still failing in some cases, e.g. with multilib where libdir is /usr/lib64, so the sed call is:
+  sed -i s:-L{WORKDIR}/recipe-sysroot/usr/lib64::g ${WORKDIR}/build/xerces-c.pc
+  but the actual xerces-c.pc file still has:
+
+  Libs: -L${libdir} -lxerces-c
+  Libs.private: -L${WORKDIR}/recipe-sysroot/usr/lib -lcurl
+
+  because this aclocal was always hardcoding "lib" (appended to --with-curl
+  value which is passed together with ${prefix}) and not respecting the libdir value:
+  PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_TARGET}${prefix},--with-curl=no,curl"
+  PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_TARGET}${prefix},--with-icu=no,icu"
+
+* xerces-c supports CMake since 2017:
+  https://github.com/apache/xerces-c/commit/2606b2924c3e2bf0cf50f72b79378721b6bcf04e
+  switching from autotools to CMake would probably resolve some of this as well
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Pending [It would be better to just switch to CMake]
+
+ m4/xerces_curl_prefix.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/xerces_curl_prefix.m4 b/m4/xerces_curl_prefix.m4
+index d1d015c..7928bdc 100644
+--- a/m4/xerces_curl_prefix.m4
++++ b/m4/xerces_curl_prefix.m4
+@@ -39,8 +39,8 @@ AC_DEFUN([XERCES_CURL_PREFIX],
+ 			curl_libs=`$curl_config --libs`
+ 		else
+ 			if test -n "$with_curl"; then
+-				curl_flags="-I$with_curl/include"
+-				curl_libs="-L$with_curl/lib -lcurl"
++				curl_flags=""
++				curl_libs="-lcurl"
+ 			else
+ 				# Default compiler paths.
+ 				#
diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
index 1643af2546..9fd7e8fbab 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
@@ -9,7 +9,9 @@ SECTION =  "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2"
+SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2 \
+    file://0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch \
+"
 SRC_URI[sha256sum] = "1db4028c9b7f1f778efbf4a9462d65e13f9938f2c22f9e9994e12c49ba97e252"
 
 inherit autotools
@@ -18,10 +20,6 @@ PACKAGECONFIG ??= "curl icu"
 PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_TARGET}${prefix},--with-curl=no,curl"
 PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_TARGET}${prefix},--with-icu=no,icu"
 
-do_install:prepend () {
-    sed -i s:-L${STAGING_LIBDIR}::g ${B}/xerces-c.pc
-}
-
 PACKAGES = "libxerces-c \
     libxerces-c-dev \
     xerces-c-samples \
-- 
2.43.0


