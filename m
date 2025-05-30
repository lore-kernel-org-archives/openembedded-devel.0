Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561B5C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:11:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.710.1748625108973243652
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 May 2025 10:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cvk+yVVO;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450d37d4699so8717535e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748625107; x=1749229907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7teKBYz17g808p+ftpJNsyLKK8Fo6q2ND3+Mj2H+Is=;
        b=Cvk+yVVO7AUrqVDt5LPA2w0dvInlMLWPIC+cdnq2sxdZGNG+SvpSs+fqva3OQ48JBR
         qwNgQJx8RU3EejMdVdw2VcGWPsocdN3vkg1hQxPGQzIFb4Ce45967l0uEkFB315tooe/
         ycjgPcTowdKhrDNYE1iv0Q3i2uTTKe/TlKXCkmvOr4+GdAtNHOu7mQMEZwON6sFKUGwn
         sdsKFK5EIN8XwRwOMoJHyvVk6Z4qPk5M8v6cQgl9AIelnOG3Ups2OYX2K4vlIBDo5TfI
         FkOFtI0TFzZ6CMntnjka0Ouq6Hdb02IaJh5NmGWWdKukG5nYJQJANy8I3avlKuxWBXa6
         U/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748625107; x=1749229907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7teKBYz17g808p+ftpJNsyLKK8Fo6q2ND3+Mj2H+Is=;
        b=LSdK6YbTtO8ZuMgjONpSMiCFs0raHk6CnzKavgWGD5U//ZOZN7/ivyCrIx0UxDoraH
         8lNpjnHfp2uH9GK+Z5U4UZPlRSpaq4dI+B9GZKuE+AezOAzjF1NNY7HobWkpSH4iYZ4A
         deFMVyGArqWCn3GkY72Q5c8sasR2cXhHqEr5cE/dUFfmZV32b+i4QNK5vif4fRiqfkAT
         mDS2Ve/w/6p5cOKeme1ZtKHN2LSr/tucjQlM0TQ5Ydfrj80SZ/upDjcoCztWeSHFRVMg
         AS2LUoVtdxLRtg3VJgMmeAlxaX4o9jMJPQ/CxKQzuh5j0Ftg8m53CSMaF7bpav2Ylgy4
         YUEw==
X-Gm-Message-State: AOJu0YwRhqWwcKn5JHffImx5RDwQmxMEMm0t7UPFdt6aC/pA13bm0n5B
	BPxFmXDqzercUweAV17DnY4ITA/WDyYrKW7V82ZZp746FehDznUOpw1XgbXX/Q==
X-Gm-Gg: ASbGncu4w+BLzh15yQENm3uW6RebF/PyKSNesCQnn2LWe0UllRh20WKH/q7trXMujzn
	QSP7KF4B7NSrU8s4Gr1UYzDao1ow+cmsT/zDiPu14QD4zvOb85VGrEhzLZCsfjcEtHrazt7EYhl
	u22g/naGHtJWbCDHjiJUY5/GCHMbFsZetE+no1RTQMhVm3UENXpX7+4HURuUF7TcMhTQctQOyHc
	3C35f22s3ZGyyO+pDmT2nonLN2M4NmQrT8O4fMFi4oL9NOVVJ7C8dbWTqck7Ggl6sCAMpxJ324z
	s/DkiyjCwL3BV/PlSsLbaFLNX6D7/za9DQZeyFwaupMsfvByr7zDMtgmL+80klMk/x3DDwdyn+t
	NSspMGIz5+NWYh+JOFMSU1zmC1RLquVnkNNjB5n8t3FcO5w+IJl3P9erIRnjNHH9TZ9hx
X-Google-Smtp-Source: AGHT+IG6bXsEKPuly0PlwWiM3R54VUMN1WeMfzPRQmf0H+Mb3vgDjno/3Rnj1wby5RP5qBwomVjZag==
X-Received: by 2002:a05:600c:4688:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-450d655b5c1mr49298595e9.31.1748625106945;
        Fri, 30 May 2025 10:11:46 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa270csm23307305e9.16.2025.05.30.10.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:11:46 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] freeglut: version bump (3.4.0 -> 3.6.0)
Date: Fri, 30 May 2025 19:11:39 +0200
Message-Id: <20250530171139.525281-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 17:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117675

- apply upstream patch to compile at master
- added HOMEPAGE
- downloads are not from github
  "Stable releases are available on our releases page on github, where you can find more information about each release. All releases are also mirrored on the old downloads page on sourceforge."
  @see: https://freeglut.sourceforge.net/
- fixed 'devtool check-upgrade-status'

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...formDestroyContext-prototype-for-C23.patch | 30 +++++++++++++++++++
 .../{freeglut_3.4.0.bb => freeglut_3.6.0.bb}  | 14 +++++++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
 rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb => freeglut_3.6.0.bb} (69%)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch b/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
new file mode 100644
index 0000000000..13ba2316f3
--- /dev/null
+++ b/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
@@ -0,0 +1,30 @@
+From 800772e993a3ceffa01ccf3fca449d3279cde338 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sun, 17 Nov 2024 01:14:26 +0000
+Subject: [PATCH 1/1] egl: fix fgPlatformDestroyContext prototype for C23
+
+C23 removes unprototyped functions, so this conflicted with the definition
+in fg_init_x11.c.
+
+Bug: https://github.com/freeglut/freeglut/issues/186
+
+Upstream-Status: Backport [https://github.com/freeglut/freeglut/commit/800772e993a3ceffa01ccf3fca449d3279cde338]
+---
+ src/egl/fg_init_egl.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/egl/fg_init_egl.h b/src/egl/fg_init_egl.h
+index 592c5221..8753dc0b 100644
+--- a/src/egl/fg_init_egl.h
++++ b/src/egl/fg_init_egl.h
+@@ -28,6 +28,6 @@
+ 
+ extern void fghPlatformInitializeEGL();
+ extern void fghPlatformCloseDisplayEGL();
+-extern void fgPlatformDestroyContext();
++extern void fgPlatformDestroyContext ( SFG_PlatformDisplay pDisplay, SFG_WindowContextType MContext );
+ 
+ #endif
+-- 
+2.39.5
+
diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
similarity index 69%
rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
rename to meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
index 2cd00b0349..ebd5fbcbce 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
@@ -1,10 +1,15 @@
 DESCRIPTION = "FreeGLUT is a free-software/open-source alternative to the OpenGL \
                Utility Toolkit (GLUT) library"
+HOMEPAGE = "https://freeglut.sourceforge.net"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
-SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
+SRC_URI = "\
+    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+    file://0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch \
+"
+
+SRC_URI[sha256sum] = "9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf37d269e3288a6c3ea52"
 
 inherit cmake features_check pkgconfig
 
@@ -22,7 +27,10 @@ CFLAGS += "-Wno-implicit-function-declaration"
 
 PROVIDES += "mesa-glut"
 
-DEPENDS = "virtual/libgl libxi"
+DEPENDS += "virtual/libgl libxi"
+
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
 do_install:append() {
     # Remove buildpaths
-- 
2.39.5


