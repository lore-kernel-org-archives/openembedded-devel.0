Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1426A9E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 02:31:35 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr13so2580939pbb.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2013 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NbdQ5k4EX59ObvWCEeBQmI04/GDUKB179t+S/8s5eY0=;
	b=Yx1ywVKE9zMg7xxbmyvLZJ9GeUz5KPrdwyCsnfAC6BlCdjtrxPDiEivr3BOtE1xAZ7
	dgRFD/Rdg5bxVCL6Slr7T99wIPiqqkllwhWfkLMtc2a/RwfLrrVnC4WGeejlJlV9v2rz
	7U2q1NvA/xWUIeSJRMAximKPga+LW1nqm42HwM9MUb8gWZf8SBuBp/EF59VlFIKpUSvr
	xl9mKsm98JwuX6e0ydn03S19cKhdUiERunGRnKAE/wYENkNdf66x4gjJMjVImn3BgwZ4
	XJ/SMc5N04uRPbEBPYcneAYS5oYzOfPy4dW8ghTzP6+jIz6duKv50hUgbrgTNnA6UnrD
	xLfA==
X-Received: by 10.68.239.164 with SMTP id vt4mr2005616pbc.115.1373077896160;
	Fri, 05 Jul 2013 19:31:36 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fn9sm10812236pab.2.2013.07.05.19.31.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Jul 2013 19:31:35 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 12:46:58 +1000
Message-Id: <1373078818-18530-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] qt-creator: add new recipe for version 2.7.2
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
X-List-Received-Date: Sat, 06 Jul 2013 02:31:35 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
new file mode 100644
index 0000000..2948d81
--- /dev/null
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Lightweight, cross-platform integrated development environment"
+
+HOMEPAGE = "http://qt-project.org/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b528 \
+                    file://LICENSE.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
+SECTION = "qt/app"
+
+SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.7/${PV}/${BP}-src.tar.gz"
+SRC_URI[md5sum] = "7f1c10740784d3edf2347c27be21fd1a"
+SRC_URI[sha256sum] = "5df913faa43a5fbf44fb1f25faaf6d258134b8f9e6b8ef8a21277136dec9e189"
+
+S = "${WORKDIR}/${BP}-src"
+
+inherit qt4x11
+
+do_install() {
+	oe_runmake INSTALL_ROOT=${D}${prefix} install
+	oe_runmake INSTALL_ROOT=${D}${prefix} install_docs
+	rm -f ${D}${libdir}/qtcreator/lib*.so
+}
+
+FILES_${PN} += "${datadir}/icons \
+                ${datadir}/qtcreator \
+                ${libdir}/qtcreator/*"
+FILES_${PN}-dbg += "${datadir}/qtcreator/*/*/*/*/.debug \
+                    ${libdir}/qtcreator/.debug \
+                    ${libdir}/qtcreator/*/*/.debug"
+RRECOMMENDS_${PN} += "packagegroup-core-buildessential \
+                      packagegroup-qt-toolchain-target"
-- 
1.8.3.2


