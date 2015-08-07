Return-Path: <marek.belisko@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7D9767A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:33:35 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so64006760wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Aug 2015 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=M/8MYaI/xZfnzUYbwpB57o99tngC7u+dAPKEXRIm+7I=;
	b=mO6Hpx1mcuaaJ6KSm4zRN9vlUzNztR4CONAtawEZumOsbrYZE3sRY5GjKBoDLsAbwS
	2OektkY9L93j1YOMPyhTkF4WGqxbdCiU42CZ+LPR+yob25l3X5kMrl+Qz2fskVG4FmSe
	GK4Tlp3WHGc6VBb8AAMyYjEvhiUJwe0qAj6r1Xd0M/nMUn8FCxVKsGE9Ge7L/nEygYTI
	7yGWWAKYsl2gr86FsHQtXH7jNd0iKkAV6/7wIm6Ldjn2ZBhEBKNwtxIuKJAA8cIgGqtY
	u0EUvQUfXngOX+3M3FicULjHy7qnfiMKqOhlCY6jrm5AUDKjYz2ZUe1i792B4A+HUdi0
	jYxw==
X-Received: by 10.180.72.241 with SMTP id g17mr6979229wiv.81.1438950814255;
	Fri, 07 Aug 2015 05:33:34 -0700 (PDT)
Received: from mbuntu.sueba (81.89.61.168.vnet.sk. [81.89.61.168])
	by smtp.gmail.com with ESMTPSA id
	yu4sm14458656wjc.43.2015.08.07.05.33.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Aug 2015 05:33:33 -0700 (PDT)
From: Marek Belisko <marek.belisko@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Aug 2015 14:33:16 +0200
Message-Id: <1438950796-21610-1-git-send-email-marek.belisko@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [meta-qt5][PATCH] qt5.inc: Fix packaging of qtquickcontrols
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
X-List-Received-Date: Fri, 07 Aug 2015 12:33:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes following:
ERROR: QA Issue: qtquickcontrols: Files/directories were installed but not shipped
  /usr/lib/qt5/qml/QtQuick/Controls/Styles/Flat/.debug
  /usr/lib/qt5/qml/QtQuick/Controls/Styles/Flat/.debug/libqtquickextrasflatplugin.so
  /usr/lib/qt5/qml/QtQuick/Extras/designer/qtquickextras.metainfo
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/gauge-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/statusindicator-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/dial-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/statusindicator-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/delaybutton-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/piemenu-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/piemenu-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/togglebutton-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/circulargauge-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/picture-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/picture-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/togglebutton-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/delaybutton-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/dial-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/tumbler-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/gauge-icon16.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/circulargauge-icon.png
  /usr/lib/qt5/qml/QtQuick/Extras/designer/images/tumbler-icon.png
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

Signed-off-by: Marek Belisko <marek.belisko@gmail.com>
---

This patch is against jansa/master as I was trying to build Qt5.5

 recipes-qt/qt5/qt5.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 2fc5367..d0309ae 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -52,6 +52,7 @@ FILES_${PN}-qmlplugins-dbg = " \
     ${OE_QMAKE_PATH_QML}/*/.debug \
     ${OE_QMAKE_PATH_QML}/*/*/.debug \
     ${OE_QMAKE_PATH_QML}/*/*/*/.debug \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*/.debug \
     ${OE_QMAKE_PATH_IMPORTS}/*/.debug \
     ${OE_QMAKE_PATH_IMPORTS}/*/*/.debug \
     ${OE_QMAKE_PATH_IMPORTS}/*/*/*/.debug \
@@ -80,10 +81,12 @@ FILES_${PN}-qmlplugins = " \
     ${OE_QMAKE_PATH_QML}/*/*/*.js \
     ${OE_QMAKE_PATH_QML}/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/*/qmldir \
+    ${OE_QMAKE_PATH_QML}/*/*/*/images \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.qml \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.js \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.png \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*.metainfo \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmltypes \
-- 
1.7.9.5


