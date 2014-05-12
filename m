Return-Path: <schnitzeltony@googlemail.com>
X-Greylist: delayed 354 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 09:47:39 UTC
Received: from mail-ee0-f50.google.com (unknown [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8A060167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 09:47:39 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id e51so4568917eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 02:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=a6M0vQBL2P4stcrJmFYXN78diUpT1fIGC1cqqSW3fuE=;
	b=uC29rTNTU4pLjDzj1z8w9elCBEA+tYLYzZACKiMqdPGHVBMY8XD1hs0jHNrpQHIqLD
	B2Rqumb82RQzf64DvGSJOT89lcBA7MdjWtTVu5YvMOaU1kLAEJHUC0m4eplKklIL91JU
	ey3LGt0mwcoWi8ye2g8ryBbZMljvy/36rGTbcIzzAvFQj2wjDk9f0fUhgmbl/B24Vd4r
	BQOpixw8WJVKWqYLcycrIRiEUYzBLUXiW40uqex/+GM3wpQEAdDsXrAfGuEnBF6HyIYh
	rGUTasXAN9jexn1RaaBmBcWX7/R+IXEgYRi/pQ2wmeYI43YIkPVsuc/CgHB8iGk3/0z1
	7yoA==
X-Received: by 10.14.205.196 with SMTP id j44mr31269987eeo.72.1399887707601;
	Mon, 12 May 2014 02:41:47 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-161-153.unitymediagroup.de.
	[95.222.161.153]) by mx.google.com with ESMTPSA id
	x45sm31617322eeu.23.2014.05.12.02.41.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 02:41:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 11:41:36 +0200
Message-Id: <1399887698-19336-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC][meta-qt5 1/3] qtwayland: move to latest revision
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 09:47:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

latest hawaii has moved to frame-sync support

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch | 91 ----------------------
 recipes-qt/qt5/qtwayland_git.bb                    |  3 +-
 2 files changed, 1 insertion(+), 93 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwayland/0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch

diff --git a/recipes-qt/qt5/qtwayland/0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch b/recipes-qt/qt5/qtwayland/0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch
deleted file mode 100644
index 2266f4c..0000000
--- a/recipes-qt/qt5/qtwayland/0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From c5c23a37b230b426ed1eeea66544af438f48d05d Mon Sep 17 00:00:00 2001
-From: Taeyeon Mori <orochimarufan.x3@gmail.com>
-Date: Sun, 9 Feb 2014 23:43:06 +0100
-Subject: [PATCH] xcomposite-glx: Fix build on Qt 5.2.1
-
-* it was made private in
-  commit b6713ec4262c05f7d103bc3b75ab81aedc690853
-  Author: Jorgen Lind <jorgen.lind@digia.com>
-  Date:   Wed Dec 18 07:59:53 2013 +0100
-
-  Make classes in client private
-
-  and qwayland-xcomposite-glx wasn't adapted to it
-
-* found in
-  http;//oro.sodimm.me/~hinata/devel/.../0001-Fix-build-on-Qt-5.2.1.patch.htm
-  but because it was already gone, here is the cache:
-  http://webcache.googleusercontent.com/search?q=cache:5L0rSgqrKMoJ:oro.sodimm.me/~hinata/devel/qt5-wayland-git/0001-Fix-build-on-Qt-5.2.1.patch.htm&hl=en&gl=cz&strip=1
-
-Change-Id: I8eed3645ccacc43e2c9febba2bc6544c7068207a
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- .../compositor/xcomposite-glx/xcompositeglxintegration.cpp |  2 +-
- src/plugins/platforms/qwayland-xcomposite-glx/main.cpp     |  2 +-
- .../qwaylandxcompositeglxplatformintegration.h             | 14 ++++++++------
- 3 files changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/src/hardwareintegration/compositor/xcomposite-glx/xcompositeglxintegration.cpp b/src/hardwareintegration/compositor/xcomposite-glx/xcompositeglxintegration.cpp
-index dce1fdc..8403c78 100644
---- a/src/hardwareintegration/compositor/xcomposite-glx/xcompositeglxintegration.cpp
-+++ b/src/hardwareintegration/compositor/xcomposite-glx/xcompositeglxintegration.cpp
-@@ -112,7 +112,7 @@ void XCompositeGLXClientBufferIntegration::initializeHardware(QtWayland::Display
-     delete glContext;
- }
- 
--void XCompositeGLXClientBufferIntegration::updateTextureFromBuffer(struct ::wl_resource *buffer)
-+void XCompositeGLXClientBufferIntegration::bindTextureToBuffer(struct ::wl_resource *buffer)
- {
-     XCompositeBuffer *compositorBuffer = XCompositeBuffer::fromResource(buffer);
-     Pixmap pixmap = XCompositeNameWindowPixmap(mDisplay, compositorBuffer->window());
-diff --git a/src/plugins/platforms/qwayland-xcomposite-glx/main.cpp b/src/plugins/platforms/qwayland-xcomposite-glx/main.cpp
-index 17b20f9..c9450a5 100644
---- a/src/plugins/platforms/qwayland-xcomposite-glx/main.cpp
-+++ b/src/plugins/platforms/qwayland-xcomposite-glx/main.cpp
-@@ -40,7 +40,7 @@
- ****************************************************************************/
- 
- #include <qpa/qplatformintegrationplugin.h>
--#include "qwaylandintegration.h"
-+#include "qwaylandxcompositeglxplatformintegration.h"
- 
- QT_BEGIN_NAMESPACE
- 
-diff --git a/src/plugins/platforms/qwayland-xcomposite-glx/qwaylandxcompositeglxplatformintegration.h b/src/plugins/platforms/qwayland-xcomposite-glx/qwaylandxcompositeglxplatformintegration.h
-index fe8c5b7..fb63fea 100644
---- a/src/plugins/platforms/qwayland-xcomposite-glx/qwaylandxcompositeglxplatformintegration.h
-+++ b/src/plugins/platforms/qwayland-xcomposite-glx/qwaylandxcompositeglxplatformintegration.h
-@@ -42,7 +42,7 @@
- #ifndef QWAYLANDXCOMPOSITEGLXPLATFORMINTEGRATION_H
- #define QWAYLANDXCOMPOSITEGLXPLATFORMINTEGRATION_H
- 
--#include <QtWaylandClient/qwaylandintegration.h>
-+#include <QtWaylandClient/private/qwaylandintegration_p.h>
- 
- #include "qwaylandxcompositeglxintegration.h"
- 
-@@ -51,14 +51,16 @@ class QWaylandXCompositeGlxPlatformIntegration : public QWaylandIntegration
- public:
-     QWaylandXCompositeGlxPlatformIntegration()
-         : QWaylandIntegration()
--        , m_gl_integration(new QWaylandXCompositeGLXIntegration(display()))
--    { }
-+        , m_client_buffer_integration(new QWaylandXCompositeGLXIntegration())
-+    {
-+        m_client_buffer_integration->initialize(display());
-+    }
- 
--    QWaylandGLIntegration *glIntegration() const Q_DECL_OVERRIDE
--    { return m_gl_integration; }
-+    QWaylandClientBufferIntegration *clientBufferIntegration() const Q_DECL_OVERRIDE
-+    { return m_client_buffer_integration; }
- 
- private:
--    QWaylandGLIntegration *m_gl_integration;
-+    QWaylandClientBufferIntegration *m_client_buffer_integration;
- };
- 
- #endif
--- 
-1.8.5.3
-
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 789a882..ebdda82 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -4,9 +4,8 @@ require ${PN}.inc
 # qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
-SRCREV = "573d0ee5ba86d99095f217ea9e19172bfc5e75fd"
+SRCREV = "f9ebbd6c618488f9b671f5504528ced3350754fb"
 
 SRC_URI += " \
-    file://0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch \
     file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
 "
-- 
1.8.3.1


