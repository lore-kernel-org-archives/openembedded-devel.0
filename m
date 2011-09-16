Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Z68-0003o2-69
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:08:56 +0200
Received: by fxi1 with SMTP id 1so1794653fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Exr/k35s8vVONoVRqZYZC6OfA3QbbPInCiq8I9cwHlY=;
	b=pNpGadO/Ng0QAsHJfZxOrkMc0CZTTSxM9PICtn+bRvLiaAKo/YWGIlsWWkG7mutMfH
	Umu42HHTcSjkogml4njThmHliCyfFZHBOqbfseWbq5Fv6ZzC2BxQc7wOpOdpPB9djZ3I
	W5zSMNDwZZullqdNQLdRA4K2lT6yJUiExJnEg=
Received: by 10.223.18.73 with SMTP id v9mr1712784faa.70.1316181425648;
	Fri, 16 Sep 2011 06:57:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r3sm10603606fam.26.2011.09.16.06.57.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:57:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:11 +0200
Message-Id: <ae9ebc59e5f878a6e5786e117a7f043b13e9fb6b.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/10] xcb: drop from meta-oe, now it's in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2011 14:08:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/xcb/libpthread-stubs_0.3.bb   |   25 --------------------
 meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend   |    2 -
 .../recipes-graphics/xcb/xcb-proto_1.6.bbappend    |    2 -
 3 files changed, 0 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xcb/libpthread-stubs_0.3.bb
 delete mode 100644 meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bbappend

diff --git a/meta-oe/recipes-graphics/xcb/libpthread-stubs_0.3.bb b/meta-oe/recipes-graphics/xcb/libpthread-stubs_0.3.bb
deleted file mode 100644
index 4c6a43b..0000000
--- a/meta-oe/recipes-graphics/xcb/libpthread-stubs_0.3.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Library that provides weak aliases for pthread functions"
-DESCRIPTION = "This library provides weak aliases for pthread functions \
-not provided in libc or otherwise available by default."
-HOMEPAGE = "http://xcb.freedesktop.org"
-BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=XCB"
-SECTION = "x11/libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
-PR = "r0"
-
-BBCLASSEXTEND = "native nativesdk"
-
-PARALLEL_MAKE = ""
-#DEPENDS = "xcb-proto xproto libxau libxslt-native"
-# DEPENDS += "xsltproc-native gperf-native"
-
-SRC_URI = "http://xcb.freedesktop.org/dist/libpthread-stubs-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "e8fa31b42e13f87e8f5a7a2b731db7ee"
-SRC_URI[sha256sum] = "35b6d54e3cc6f3ba28061da81af64b9a92b7b757319098172488a660e3d87299"
-
-inherit autotools pkgconfig
-
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
diff --git a/meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend b/meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend
deleted file mode 100644
index 3bc71e0..0000000
--- a/meta-oe/recipes-graphics/xcb/libxcb_1.7.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bbappend b/meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bbappend
deleted file mode 100644
index efc347a..0000000
--- a/meta-oe/recipes-graphics/xcb/xcb-proto_1.6.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND += "nativesdk"
-
-- 
1.7.6.1



