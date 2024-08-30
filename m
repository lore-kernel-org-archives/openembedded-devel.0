Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C09CA0FE0
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 10:06:07 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.9626.1725012366449569247
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 03:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mvzccnmZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so1637915a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725012365; x=1725617165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nCv1f2tlaatnh1BAxB8Jn346ourQ5ja2uUsvdqeiGvg=;
        b=mvzccnmZ69TvXakP1cvHhI3NTBMWdvwdJXzkDJykOruuXpC8djw4iFOFcZ6yn5+OCA
         6RXgyzSkq0/IKUB1YujH9DAj0hTgo7JWayOkUzx3EvHYQSUTiu8b9awIxoN/UspixLzN
         xvps6xOoI1A+7ik+KV1vvDhfyng2ypKn68XF+9ObMzw3OPRkHIFJ7gGlJd/GV+F7E8TM
         B7dXnm95FJLtPp4mbr/h+YQqh0MLXmY4oBbvQIGkST5UVw4j3wvG8LpffRQNAy2/wS27
         di7IBRMxisBCASzpiXwhjYWAqxaTmOsD/xF4iyO9v0vRC6hO93pCSPJ+s6VecPNFJ+A+
         uofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725012365; x=1725617165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCv1f2tlaatnh1BAxB8Jn346ourQ5ja2uUsvdqeiGvg=;
        b=pYejj4ib3QyaDF2vfgszf9Ua+oZOvsyd+AroD6sQMiuTAL5Ci8cTETB0S9mYHKjw5n
         2epQZpIcoYH4wQGV4dLEyWdF1oFrI5qsqeFLcln9mxq0vrlIu2jOjVAE0R1cYpPe3Ptj
         z4HvzfVvK6V69OchGDdWfzUD95K3PImsjl/fbMHSxrp6/+PMVQ9rzOcHwNHEtrC13Esr
         5RA0t6yn5z/YJ84r7T4hvUtRtYErOpcDu5L2UepDcGY7ucOmnAivxALwRVV0f9a04B7F
         cThur1BwLCgHU48pUp8mXh6d/UkzQNWIHNEIlOkHnMxDUn5KGIkW03HJ6Fcdu00dldYO
         WNGg==
X-Gm-Message-State: AOJu0YykRpSZciNXUWaP7pSek5cSx1GWCd26vHsh43EyR4ez9m1UEazY
	ras1FZExqeF+DsVrkuTYW+khdEFGlTh6yCLsd68nWyqeV15IpggRJZRIPw==
X-Google-Smtp-Source: AGHT+IFVVkj3KDxqzZiPVTqBTA3x+uPsKzTZ5t1cSjMJxB7iyf/s0UPP0eFKN/6YVwqNgCZlWK/YxQ==
X-Received: by 2002:a05:6402:13d6:b0:5be:e01c:6b5c with SMTP id 4fb4d7f45d1cf-5c21ed2ffdbmr5267554a12.4.1725012364146;
        Fri, 30 Aug 2024 03:06:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226cd211bsm1730132a12.61.2024.08.30.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:06:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] xerces-c: fix buildpaths QA issue
Date: Fri, 30 Aug 2024 12:05:57 +0200
Message-ID: <20240830100557.2466479-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112055

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
2.46.0


