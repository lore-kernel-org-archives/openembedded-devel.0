Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0BEAF731A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 13:53:52 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u4BDrmf4028394
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 15:53:48 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.79.34])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u4BDrmUA017329;
	Wed, 11 May 2016 15:53:48 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 May 2016 15:53:45 +0200
Message-Id: <1462974825-8264-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCHv2] cmake_qt5: prepend the Qt5 specific CMake variables to EXTRA_OECMAKE
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
X-List-Received-Date: Wed, 11 May 2016 13:53:53 -0000

Using the prepend function instead of "=+" makes sure the variables
are set even if the user overrides EXTRA_OECMAKE with "=" instead of just
appending to it.

Prepending also allows overriding because later arguments take precedence
ever earlier ones in CMake.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 classes/cmake_qt5.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
index 813ea0c..4dc897b 100644
--- a/classes/cmake_qt5.bbclass
+++ b/classes/cmake_qt5.bbclass
@@ -3,7 +3,7 @@ inherit qmake5_paths
 
 DEPENDS_prepend = "qtbase "
 
-EXTRA_OECMAKE += " \
+EXTRA_OECMAKE_prepend = " \
     -DOE_QMAKE_PATH_PREFIX=${OE_QMAKE_PATH_PREFIX} \
     -DOE_QMAKE_PATH_HEADERS=${OE_QMAKE_PATH_HEADERS} \
     -DOE_QMAKE_PATH_LIBS=${OE_QMAKE_PATH_LIBS} \
-- 
2.1.4


