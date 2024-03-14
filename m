Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01C2C54E66
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 02:55:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.2629.1710384936654179905
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 19:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=CnIezGQO;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D951D87DE3;
	Thu, 14 Mar 2024 03:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710384933;
	bh=QQ+A8kRPxoaglD2nHgckUle5AE/AedjrylOndsjeCwg=;
	h=From:To:Cc:Subject:Date:From;
	b=CnIezGQOCYjYzG4YX0xrXw4tkypGKMcs+5vNn5Z+TcBpnKlAFVeKxG2uA3OtpaYQw
	 yGgkZM/3oqWDsqYkFLsfzUTrY1oZpOzKDpEMmVw3zEalNMFRrbRskYaaPKCFJQWCt8
	 tWQUMoxAk4VwOsuQ+6qebn/GClf7ArGjmWXvuwddDemSuf8ukJ/l5woSBPmeXcn6Hj
	 p+Dg0ENLkmHzkQFNFBE7hJmOFagBDG78HnBkts0prbIok62CrJLmiuf+cH+uXGeFSQ
	 UHrUTVjH6vzsfI1yIYJHuDj8L60Oddbn0iWLytZU+kxq2Sj+BZY3X8tKthbfA/sMcH
	 XkpE77FLzM78w==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] lvgl: Generate proper shared libraries with version suffix
Date: Thu, 14 Mar 2024 03:54:44 +0100
Message-ID: <20240314025504.44148-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 02:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109310

Add missing version suffix to shared libraries. Currently the filename of
generated shared libraries is only liblvgl.so, which prevents coexistence
of different versions of LVGL on the same system. Set VERSION and SOVERSI=
ON
to make cmake add the version suffix to generated shared libraries. That
changes the filename to liblvgl.so.9.0.0 and includes symlink with major
ABI version, i.e. liblvgl.so.9 .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 ...-generate-versioned-shared-libraries.patch | 68 +++++++++++++++++++
 .../lvgl/lvgl-demo-fb_9.0.0.bb                |  1 +
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb   |  3 +-
 3 files changed, 70 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-ge=
nerate-versioned-shared-libraries.patch

diff --git a/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-=
versioned-shared-libraries.patch b/meta-oe/recipes-graphics/lvgl/files/00=
07-fix-cmake-generate-versioned-shared-libraries.patch
new file mode 100644
index 000000000..6997d8415
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-version=
ed-shared-libraries.patch
@@ -0,0 +1,68 @@
+From 40657a770baadfff30abfecf7638e7b1c340db4d Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 14 Mar 2024 03:23:10 +0100
+Subject: [PATCH] fix(cmake): generate versioned shared libraries
+
+Add missing version suffix to shared libraries. Currently the filename o=
f
+generated shared libraries is only liblvgl.so, which prevents coexistenc=
e
+of different versions of LVGL on the same system. Set VERSION and SOVERS=
ION
+to make cmake add the version suffix to generated shared libraries. That
+changes the filename to liblvgl.so.9.0.0 and includes symlink with major
+ABI version, i.e. liblvgl.so.9 .
+
+Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/5865]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ env_support/cmake/custom.cmake | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/env_support/cmake/custom.cmake b/env_support/cmake/custom.c=
make
+index 9800468eb..6f33f1cc8 100644
+--- a/env_support/cmake/custom.cmake
++++ b/env_support/cmake/custom.cmake
+@@ -1,3 +1,6 @@
++set(LVGL_VERSION "9.0.0")
++set(LVGL_SOVERSION "9")
++
+ # Option to define LV_LVGL_H_INCLUDE_SIMPLE, default: ON
+ option(LV_LVGL_H_INCLUDE_SIMPLE
+        "Use #include \"lvgl.h\" instead of #include \"../../lvgl.h\"" O=
N)
+@@ -119,6 +122,8 @@ install(
+ set_target_properties(
+   lvgl
+   PROPERTIES OUTPUT_NAME lvgl
++             VERSION ${LVGL_VERSION}
++             SOVERSION ${LVGL_SOVERSION}
+              ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+              LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+              RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
+@@ -137,6 +142,8 @@ if(NOT LV_CONF_BUILD_DISABLE_THORVG_INTERNAL)
+   set_target_properties(
+     lvgl_thorvg
+     PROPERTIES OUTPUT_NAME lvgl_thorvg
++               VERSION ${LVGL_VERSION}
++               SOVERSION ${LVGL_SOVERSION}
+                ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+                LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
+@@ -155,6 +162,8 @@ if(NOT LV_CONF_BUILD_DISABLE_DEMOS)
+   set_target_properties(
+     lvgl_demos
+     PROPERTIES OUTPUT_NAME lvgl_demos
++               VERSION ${LVGL_VERSION}
++               SOVERSION ${LVGL_SOVERSION}
+                ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+                LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
+@@ -173,6 +182,8 @@ if(NOT LV_CONF_BUILD_DISABLE_EXAMPLES)
+   set_target_properties(
+     lvgl_examples
+     PROPERTIES OUTPUT_NAME lvgl_examples
++               VERSION ${LVGL_VERSION}
++               SOVERSION ${LVGL_SOVERSION}
+                ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+                LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
+                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
index 70df822cc..6d3ae1ec3 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "\
 	file://0004-Factor-out-fbdev-initialization-code.patch \
 	file://0005-Add-DRM-KMS-example-support.patch \
 	file://0006-Add-SDL2-example-support.patch \
+	file://0007-fix-cmake-generate-versioned-shared-libraries.patch;patchdi=
r=3Dlvgl \
 	"
 SRCREV_demo =3D "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
 SRCREV_lvgl =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
index b84fc5a3d..8d0848508 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "\
 	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster \
 	file://0001-fix-drm-Default-to-XRGB8888-framebuffer.patch \
 	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch =
\
+	file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
 	"
 SRCREV =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
 PV .=3D "+git${SRCPV}"
@@ -30,5 +31,3 @@ FILES:${PN}-dev +=3D "\
     ${includedir}/${PN}/ \
     ${includedir}/${PN}/lvgl/ \
     "
-SOLIBS =3D ".so"
-FILES_SOLIBSDEV =3D ""
--=20
2.43.0


