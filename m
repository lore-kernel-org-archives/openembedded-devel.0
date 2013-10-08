Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7A96CF09
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:47:56 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id F312DA6309
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:47:53 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:31 +0200
Message-Id: <1381222066-2737-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 06/21] qtdeclarative: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:47:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../0001-qmltestexample-fix-link.patch                                | 0
 .../0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch      | 0
 recipes-qt/qt5/{qtdeclarative_5.1.0.bb => qtdeclarative_5.1.1.bb}     | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-qt/qt5/{qtdeclarative-5.1.0 => qtdeclarative-5.1.1}/0001-qmltestexample-fix-link.patch (100%)
 rename recipes-qt/qt5/{qtdeclarative-5.1.0 => qtdeclarative-5.1.1}/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch (100%)
 rename recipes-qt/qt5/{qtdeclarative_5.1.0.bb => qtdeclarative_5.1.1.bb} (68%)

diff --git a/recipes-qt/qt5/qtdeclarative-5.1.0/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-5.1.1/0001-qmltestexample-fix-link.patch
similarity index 100%
rename from recipes-qt/qt5/qtdeclarative-5.1.0/0001-qmltestexample-fix-link.patch
rename to recipes-qt/qt5/qtdeclarative-5.1.1/0001-qmltestexample-fix-link.patch
diff --git a/recipes-qt/qt5/qtdeclarative-5.1.0/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch b/recipes-qt/qt5/qtdeclarative-5.1.1/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
similarity index 100%
rename from recipes-qt/qt5/qtdeclarative-5.1.0/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
rename to recipes-qt/qt5/qtdeclarative-5.1.1/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
diff --git a/recipes-qt/qt5/qtdeclarative_5.1.0.bb b/recipes-qt/qt5/qtdeclarative_5.1.1.bb
similarity index 68%
rename from recipes-qt/qt5/qtdeclarative_5.1.0.bb
rename to recipes-qt/qt5/qtdeclarative_5.1.1.bb
index 2421bdb..be72469 100644
--- a/recipes-qt/qt5/qtdeclarative_5.1.0.bb
+++ b/recipes-qt/qt5/qtdeclarative_5.1.1.bb
@@ -6,8 +6,8 @@ SRC_URI += " \
     file://0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch \
 "
 
-SRC_URI[md5sum] = "604a6e3ae051a21aac0024694d55cb3b"
-SRC_URI[sha256sum] = "d8849755c17fca9bb44c09c442001bc5593c24986ea616c536719414e85d90cc"
+SRC_URI[md5sum] = "486fc16ad7b7d0c1488ba5482536d66c"
+SRC_URI[sha256sum] = "0ee989a5d45a94e927609b22e2413c7f2788a7b4a23af66ecfa15c31db2a9b31"
 
 # /usr/lib/qt5/qml/QtQuick/Dialogs/images/*.png
 FILES_${PN}-qmlplugins += " \
-- 
1.8.4.rc3


