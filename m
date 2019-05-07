Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 73B2E7D795
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykV4011z6Y
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230194;
	bh=PQMKFH4Iq2PQVKQfkjE6iaGHItp9O8iLARqQ2i/jrEA=;
	h=From:To:Subject:Date:From;
	b=uKeto3zUQHuGBUAtSo5q2l0B1vO5DwcynZ8s3i7o1gB84mib6I45rj3c2M1TWTc/v
	UVW4g9hnG++3dDSrdtoWc5dSl4eCN9SQ+O05YFkTEOeva7iqb1CvqNL0vnGK1HXfOd
	4hGVF3OM+YnRTpkO456z6LEeO1VGeo7S2aTr+hUtgm+Gyg834DjV2nqzuotDXPL3Yr
	e7EftLgisVFx6tisTxf7nRF0ImH/Z2jkza+mUxeTlTx7STHqdR2Bj14msWmvqyFaId
	xrfxjGilapPQXoH+ECAKlMRgmeEddQtj2UIsS+tCopp6M+Uw4WqCIt4fEwpsSHxyXN
	My9vATW9NI0MqO1qTfbsAObCI0Ijmj16MDANOaGajZ2D/ukJ2fXv5tlCuufmxaXR9E
	jZHr4VVTKCMlkhAsFa1O54CNiJMJF4aPD9tBLwabDVmau7rCxoTVPXpV/KRWORH2k3
	kdU+5KbbAE8HqXMyXJV3OBN9wzbIkb1vvQpQJp8/ryHRocU/nDDvaCaoKf5idb51m5
	9CV0vPRHxA5SNGgNBsRQBWX6iw211Tq3d/eX0kAVXAHGnNnNma9xsn1lpkUiOsZ9e1
	rtZp8I03spR5EtdPWQiv2wLtjvYjozkobc75yaVVg7JcIFOVyDpG85NikPKxIizJzd
	qOVqkiSps0+22atn/8NWCjIU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:27 +0300
Message-Id: <20190507115630.30368-9-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] cogl: upgrade 1.22.2 -> 1.22.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2019 11:56:33 -0000

Remove backported patch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...n-incorrect-preprocessor-conditional.patch | 32 -------------------
 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb |  8 -----
 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb |  8 +++++
 3 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
deleted file mode 100644
index 2a9d8f829b..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport
-
-
-Original upstream commit follows:
-
-From b583e21d8698dbd58013320cfb47739102efdea7 Mon Sep 17 00:00:00 2001
-From: Kalev Lember <klember@redhat.com>
-Date: Wed, 19 Oct 2016 23:38:28 +0200
-Subject: [PATCH] Fix an incorrect preprocessor conditional
-
-This fixes the build with wayland wayland egl server support disabled.
----
- cogl/winsys/cogl-winsys-egl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cogl/winsys/cogl-winsys-egl.c b/cogl/winsys/cogl-winsys-egl.c
-index 39bfd884..4a9f3aa6 100644
---- a/cogl/winsys/cogl-winsys-egl.c
-+++ b/cogl/winsys/cogl-winsys-egl.c
-@@ -1029,7 +1029,7 @@ _cogl_egl_create_image (CoglContext *ctx,
-     egl_ctx = EGL_NO_CONTEXT;
-   else
- #endif
--#if COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
-+#ifdef COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
-   /* The WL_bind_wayland_display spec states that EGL_NO_CONTEXT is to be used
-    * in conjunction with the EGL_WAYLAND_BUFFER_WL target */
-   if (target == EGL_WAYLAND_BUFFER_WL)
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
deleted file mode 100644
index 5901062a4c..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
-            file://0001-Fix-an-incorrect-preprocessor-conditional.patch"
-SRC_URI[archive.md5sum] = "d53b708ca7c4af03d7254e46945d6b33"
-SRC_URI[archive.sha256sum] = "39a718cdb64ea45225a7e94f88dddec1869ab37a21b339ad058a9d898782c00d"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
new file mode 100644
index 0000000000..432025233b
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
@@ -0,0 +1,8 @@
+require cogl-1.0.inc
+
+SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
+"
+SRC_URI[archive.md5sum] = "31755015a865c4af51ac84f6e53af8ab"
+SRC_URI[archive.sha256sum] = "5217bf94cbca3df63268a3b79d017725382b9e592b891d1e7dc6212590ce0de0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-- 
2.17.1


