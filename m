Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 52D2E73243
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:31:04 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1Za04G-00075w-Nl from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2015 04:31:04 -0700
Received: from gemini.alm.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 10 Sep 2015 04:31:04 -0700
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])	by
	gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id t8ABV1KB010846;
	Thu, 10 Sep 2015 06:31:03 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Sep 2015 16:30:48 +0500
Message-ID: <1441884648-4113-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] qtbase: Fix qeglplatformscreen.c compilation issue due refinition on None.
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
X-List-Received-Date: Thu, 10 Sep 2015 11:31:06 -0000
Content-Type: text/plain

From: Noor <noor_ahsan@mentor.com>

* In Qt5.5 qeglplatformscreen.c includes qurl.h and X.h (via eglvivante.h). X.h
  define None to 0L but qurl.h set None to 0 in enum. Due to this do_compile task
  fails saying "qurl.h:131:9: error: expected identifier before numeric constant".
  This patch undefine None in qurl.h if it is define earlier.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../qtbase/fix_multiple_definition_of_None.patch   |   41 ++++++++++++++++++++
 qt5-layer/recipes-qt/qt5/qtbase_%.bbappend         |    4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/qt5-layer/recipes-qt/qt5/qtbase/fix_multiple_definition_of_None.patch b/qt5-layer/recipes-qt/qt5/qtbase/fix_multiple_definition_of_None.patch
new file mode 100644
index 0000000..f5b2abf
--- /dev/null
+++ b/qt5-layer/recipes-qt/qt5/qtbase/fix_multiple_definition_of_None.patch
@@ -0,0 +1,41 @@
+Workaround qeglplatformscreen.c failure in Qt5.5 due to inclusion of qurl.h and X.h. X.h define None to 0L and qurl.h set None to 0 in enum. Due to this following error occur. Undef None in qurl.h if it is defined.
+
+In file included from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx6qsabresd/usr/include/X11/Xlib.h:44:0,
+                 from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx6qsabresd/usr/include/EGL/eglvivante.h:244,
+                 from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx6qsabresd/usr/include/EGL/eglplatform.h:38,
+                 from /home/noor/SB/release_2015.12/build/tmp/sysroots/imx6qsabresd/usr/include/EGL/egl.h:39,
+                 from /home/noor/SB/release_2015.12/build/tmp/work/cortexa9hf-vfp-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
+                 from /home/noor/SB/release_2015.12/build/tmp/work/cortexa9hf-vfp-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected identifier before numeric constant
+         None = 0x0,
+         ^
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected '}' before numeric constant
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected unqualified-id before numeric constant
+In file included from ../../include/QtCore/qurl.h:1:0,
+                 from ../../include/QtGui/../../../git/src/gui/kernel/qevent.h:48,
+                 from ../../include/QtGui/qevent.h:1,
+                 from ../../include/QtGui/QTouchEvent:1,
+                 from ../../include/QtGui/5.5.0/QtGui/qpa/../../../../../../git/src/gui/kernel/qwindowsysteminterface.h:53,
+                 from ../../include/QtGui/5.5.0/QtGui/qpa/qwindowsysteminterface.h:1,
+                 from /home/noor/SB/release_2015.12/build/tmp/work/cortexa9hf-vfp-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:37:
+../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:26: error: 'UrlFormattingOption' was not declared in this scope
+     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOption> FormattingOptions;
+....
+
+
+Upstream-Status: Inappropriate [workaround]
+
+diff --git a/src/corelib/io/qurl.h b/src/corelib/io/qurl.h
+index e6c570d..06de3af 100644
+--- a/src/corelib/io/qurl.h
++++ b/src/corelib/io/qurl.h
+@@ -128,6 +128,9 @@ public:
+ 
+     // encoding / toString values
+     enum UrlFormattingOption {
++#ifdef None
++#undef None
++#endif
+         None = 0x0,
+         RemoveScheme = 0x1,
+         RemovePassword = 0x2,
diff --git a/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend b/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend
index e0979bf..4ad4c5c 100644
--- a/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend
+++ b/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend
@@ -2,7 +2,9 @@
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://Force_egl_visual_ID_33.patch"
+SRC_URI += "file://Force_egl_visual_ID_33.patch \
+            file://fix_multiple_definition_of_None.patch \
+"
 
 HAS_X11 = "${@base_contains('DISTRO_FEATURES', 'x11', 1, 0, d)}"
 
-- 
1.7.9.5


