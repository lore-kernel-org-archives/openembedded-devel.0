Return-Path: <stephan.binner@basyskom.com>
X-Greylist: delayed 1806 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Feb 2015 16:17:31 UTC
Received: from mx1.basyskom.com (groupware.basyskom.com [144.76.148.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57F5F72E41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:17:31 +0000 (UTC)
X-Footer: YmFzeXNrb20uY29t
Received: from fridolin.localnet ([193.158.222.114])
	(authenticated user sbin@basyskom.com)
	by mx1.basyskom.com (Kerio Connect 8.4.0)
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256 bits))
	for openembedded-devel@lists.openembedded.org;
	Fri, 6 Feb 2015 16:47:25 +0100
From: Stephan Binner <stephan.binner@basyskom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 06 Feb 2015 16:47:23 +0100
Message-ID: <6968631.gt1QZ91jDt@fridolin>
Organization: basysKom GmbH
User-Agent: KMail/4.8.5 (Linux/3.2.0-75-generic; KDE/4.8.5; x86_64; ; )
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] Add qtwebchannel recipe
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
X-List-Received-Date: Fri, 06 Feb 2015 16:17:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

From: Stephan Binner <stephan.binner@basyskom.com>

Signed-off-by: Stephan Binner <stephan.binner@basyskom.com>
---
 conf/distro/include/qt5-versions.inc                          | 1 +
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 3 +++
 recipes-qt/qt5/qtwebchannel.inc                               | 6 ++++++
 recipes-qt/qt5/qtwebchannel_5.4.0.bb                          | 5 +++++
 recipes-qt/qt5/qtwebchannel_git.bb                            | 4 ++++
 5 files changed, 19 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebchannel.inc
 create mode 100644 recipes-qt/qt5/qtwebchannel_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtwebchannel_git.bb

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-
versions.inc
index 7530a24..d973fd5 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -26,6 +26,7 @@ PREFERRED_VERSION_qttools-native = "${QT5_VERSION}"
 PREFERRED_VERSION_nativesdk-qttools = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwayland = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwayland-native = "${QT5_VERSION}"
+PREFERRED_VERSION_qtwebchannel = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebengine = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit-examples = "${QT5_VERSION}"
diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb 
b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 25a5003..6318dc6 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -90,6 +90,9 @@ RDEPENDS_${PN} += " \
     qtwebsockets-dev \
     qtwebsockets-mkspecs \
     qtwebsockets-qmlplugins \
+    qtwebchannel-dev \
+    qtwebchannel-mkspecs \
+    qtwebchannel-qmlplugins \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
 "
diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebchannel.inc
new file mode 100644
index 0000000..46c3c8a
--- /dev/null
+++ b/recipes-qt/qt5/qtwebchannel.inc
@@ -0,0 +1,6 @@
+require qt5.inc
+
+DEPENDS += "qtdeclarative qtwebsockets"
+
+LIC_FILES_CHKSUM = 
"file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7"
+LICENSE = "LGPL-2.1"
diff --git a/recipes-qt/qt5/qtwebchannel_5.4.0.bb b/recipes-
qt/qt5/qtwebchannel_5.4.0.bb
new file mode 100644
index 0000000..c26e6bb
--- /dev/null
+++ b/recipes-qt/qt5/qtwebchannel_5.4.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "d11e86da2f585ea48f38d4107356edd7"
+SRC_URI[sha256sum] = 
"24eb0125198270f8595babb6c0df74dd13e0ccc8c8a5e665151cf68c3306594c"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-
qt/qt5/qtwebchannel_git.bb
new file mode 100644
index 0000000..51176f6
--- /dev/null
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -0,0 +1,4 @@
+require qt5-git.inc
+require ${PN}.inc
+
+SRCREV = "86d77a900852691267f556fbde98406a12ee4310"
-- 
1.9.1




