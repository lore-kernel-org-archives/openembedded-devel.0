Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FD9CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:33:29 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.12253.1760697204043486890
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aHhTmIzZ;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-793021f348fso1719454b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760697203; x=1761302003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BoqBbTtDhtThbsUT6jqC5DY9n0+zT39YvAqb0om5TiQ=;
        b=aHhTmIzZBRr9juLiOJOa6uIiBW+s6rQmIlrGFsbUCpy7jmnIaT+NbEoWKAB7d1YpIX
         WkRs1av3Bo8NukjW/tBPROD36OYPQAGOJ4DQ+db5hng4RD4mSZWyd/4U1jm0IJqibDMJ
         KVe/F1XYGhY1dJidmptiuOlW6H6RK6CTxSi1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697203; x=1761302003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoqBbTtDhtThbsUT6jqC5DY9n0+zT39YvAqb0om5TiQ=;
        b=KjiN0QPgy/6piKeSAlPQ6OOlDv4eovrVutWnG/UsU5ck49rEi/fFdsTbS2Lm4dP46J
         XR+3XAdWvIy57FpGHRlaFSG8TcLt0hdNHVSYsytJAMApvNIxWDyWSEfgxx4znct6grWx
         WxJhNlQmgsKNxjQTBeEnrdeeuE87LynDkon2Q62s6r4WmsLeY7f9mkm2sfJwkMMv0fCX
         dIJZ3oBXkI8E9EuXFWh+SfCR3M2UeGQa1Wkk/1hPHPZ6ue7oF1FbSMYQmxHCKTOKI2M1
         Hwu8aCxql16pLsp1RiELDtRu37EbOEqfSMFD+pO8nbaAf5j9UsP7ANf796OZVj7tdPX8
         WgwA==
X-Gm-Message-State: AOJu0YxWeuUuB3mKG/oq35qP9DiQxiQkPX1GqZvTtkebBcEKyI+zF2J+
	09wD3vXokEGllOON7QMWpwdBh/XgWC/Ojc/KuPXiTsSpUOEwK917aBjrL0sEq9dCmFi9Jy85LOj
	jYb6Bba0=
X-Gm-Gg: ASbGncvUVvvDrOQryLvxtk5K3ssVIFQOd/CsMoNpaT+nM8Mq9E75YAlftLLdg9nKkVp
	Z6nim3IY9yQA9cmDUJdoTAQC7j6gxGXTqUiC3rsBnwFpvla+KkU+/ntGeevecrcyl0ELXld3bam
	CJLc0yT9H7aw7KMfX5P4KEAf5ePJRhBCjZcuLFnulxzR8ocjSWXqY4INMw3r4mR6ejay9sT9BGk
	HgkRZ8hCoVIP0wPRTbYHhBEtD46lzYHtBvLN216A0qB2QJ5pHo//w4niXlFd+Vf75SvRPtR2A3T
	FSEqkPX5HDKQg4J0YMe77TvgZ8TsWUfZSwavyV7Ixp7XML+W1bPQqfSBVILOBmZJr5ZkiGgY4Zr
	rTKhCAu5XgpTdPMswCdsIYrKqncpXH10xJ64VPaFjM5O0rPVMW5ZWwaPotGyOUelOtwy0PLFzn+
	DAzyrRS7S0PfxfMj1CApp0I5g=
X-Google-Smtp-Source: AGHT+IFjq7TB1b/BYcaqOKbYKoZh8ybDOih3hDcuU5w8Xjpj1dUoYRwySDdRPkAkVv867qGuGLbGhw==
X-Received: by 2002:a05:6a00:1808:b0:78a:f45f:8740 with SMTP id d2e1a72fcca58-7a220b16a0cmr3932883b3a.19.1760697202903;
        Fri, 17 Oct 2025 03:33:22 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:8fcf:39c2:65bd:7218:e888:ad29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e198bsm25330111b3a.60.2025.10.17.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:33:22 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-multimedia][patch] vorbis-tools: upgrade 1.4.2 -> 1.4.3
Date: Fri, 17 Oct 2025 16:03:09 +0530
Message-ID: <20251017103309.847216-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120747

Refreshed gettext.patch
Dropped 0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch & CVE-2023-43361.patch
Dropped patches fixed in newer version
Dropped md5sum

Changelog:
https://gitlab.xiph.org/xiph/vorbis-tools/-/blob/release-1.4.3/CHANGES

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...clude-utf8.h-for-missing-utf8_decode.patch | 27 ------------
 .../vorbis-tools/CVE-2023-43361.patch         | 38 ----------------
 .../vorbis-tools/vorbis-tools/gettext.patch   | 44 ++++++++++++-------
 ...s-tools_1.4.2.bb => vorbis-tools_1.4.3.bb} |  5 +--
 4 files changed, 29 insertions(+), 85 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
 rename meta-multimedia/recipes-multimedia/vorbis-tools/{vorbis-tools_1.4.2.bb => vorbis-tools_1.4.3.bb} (75%)

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch
deleted file mode 100644
index 36a31a85cd..0000000000
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8c10181547c93438fc10f753e7164ee004add6d1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Aug 2022 10:28:47 -0700
-Subject: [PATCH] ogginfo: Include utf8.h for missing utf8_decode
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ogginfo/codec_skeleton.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
-index a27f8da..3ac13f6 100644
---- a/ogginfo/codec_skeleton.c
-+++ b/ogginfo/codec_skeleton.c
-@@ -25,6 +25,7 @@
- #include <ogg/ogg.h>
- 
- #include "i18n.h"
-+#include "utf8.h" /* utf8_decode */
- 
- #include "private.h"
- 
--- 
-2.37.2
-
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
deleted file mode 100644
index 7f5b634115..0000000000
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 6ca16244ba70cd1c0c8d062d1416bdc79bf20898 Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Fri, 17 Jan 2025 18:49:12 +0100
-Subject: [PATCH] oggenc: Don't assume the output path ends in a file name.
-
-oggenc attempts to create any specified directories in the output
-file path if they don't exist. The parser was assuming there was
-a final filename after the last directory separator, and so would
-try to read off the end of the argument if it was a bare directory
-such as `./` or `outdir/`. This adds a check to make sure the
-scan isn't starting off the end of the path string.
-
-Thanks to Frank-Z7 (Zeng Yunxiang) at Huazhong University of Science
-and Technology (cse.hust.edu.cn) for the report.
-
-CVE: CVE-2023-43361
-Upstream-Status: Submitted [https://gitlab.xiph.org/xiph/vorbis-tools/-/merge_requests/7]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- oggenc/platform.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/oggenc/platform.c b/oggenc/platform.c
-index 6d9f4ef..1ff02ca 100644
---- a/oggenc/platform.c
-+++ b/oggenc/platform.c
-@@ -147,7 +147,7 @@ int create_directories(char *fn, int isutf8)
-         start = start+2;
- #endif
- 
--    while((end = strpbrk(start+1, PATH_SEPS)) != NULL)
-+    while((end = strpbrk(start + strspn(start, PATH_SEPS), PATH_SEPS)) != NULL)
-     {
-         int rv;
-         memcpy(segment, fn, end-fn);
--- 
-2.30.2
-
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
index dd03fa9524..5044427a95 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
@@ -3,18 +3,40 @@ Fix build with gettext 0.20.x
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+---
+ Makefile.am  | 4 ++--
+ configure.ac | 3 +--
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 62c36d7..201c69c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,8 +2,8 @@
+ 
+ AUTOMAKE_OPTIONS = foreign dist-zip
+ 
+-SUBDIRS = po intl include share win32 @OPT_SUBDIRS@ tests
+-DIST_SUBDIRS = po intl include share win32 ogg123 oggenc oggdec ogginfo \
++SUBDIRS = po include share win32 @OPT_SUBDIRS@ tests
++DIST_SUBDIRS = po include share win32 ogg123 oggenc oggdec ogginfo \
+ 	vcut vorbiscomment m4 tests
+ 
+ EXTRA_DIST = config.rpath README AUTHORS COPYING CHANGES
+diff --git a/configure.ac b/configure.ac
+index 6751ec8..67746ce 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -34,7 +34,7 @@
+@@ -34,7 +34,7 @@ CFLAGS="$cflags_save"
  AC_PROG_LIBTOOL
  
- ALL_LINGUAS="be cs da en_GB eo es fr hr hu nl pl ro ru sk sv uk vi"
+ ALL_LINGUAS="be cs da de en_GB eo es fr hr hu id ka nb nl pl ro ru sk sl sr sv uk vi "
 -AM_GNU_GETTEXT
 +AM_GNU_GETTEXT([external])
  
  dnl --------------------------------------------------
  dnl System checks
-@@ -397,7 +397,6 @@
+@@ -413,7 +413,6 @@ AC_CONFIG_FILES([
  Makefile
  m4/Makefile
  po/Makefile.in
@@ -22,16 +44,6 @@ Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
  include/Makefile
  share/Makefile
  win32/Makefile
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,8 +2,8 @@
- 
- AUTOMAKE_OPTIONS = foreign dist-zip
- 
--SUBDIRS = po intl include share win32 @OPT_SUBDIRS@
--DIST_SUBDIRS = po intl include share win32 ogg123 oggenc oggdec ogginfo \
-+SUBDIRS = po include share win32 @OPT_SUBDIRS@
-+DIST_SUBDIRS = po include share win32 ogg123 oggenc oggdec ogginfo \
- 	vcut vorbiscomment m4
- 
- EXTRA_DIST = config.rpath README AUTHORS COPYING CHANGES
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.3.bb
similarity index 75%
rename from meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
rename to meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.3.bb
index 2cbd840138..778b848534 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.3.bb
@@ -12,12 +12,9 @@ DEPENDS = "libogg libvorbis"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://gettext.patch \
-           file://0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch \
-           file://CVE-2023-43361.patch \
           "
 
-SRC_URI[md5sum] = "998fca293bd4e4bdc2b96fb70f952f4e"
-SRC_URI[sha256sum] = "db7774ec2bf2c939b139452183669be84fda5774d6400fc57fde37f77624f0b0"
+SRC_URI[sha256sum] = "a1fe3ddc6777bdcebf6b797e7edfe0437954b24756ffcc8c6b816b63e0460dde"
 
 inherit autotools pkgconfig gettext
 
-- 
2.43.0


