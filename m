Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4BE71BA1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 12:43:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3HCh7ST022620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 05:43:07 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 17 Apr 2018 05:43:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Apr 2018 20:50:36 +0800
Message-ID: <1523969436-20902-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target/qttranslations: fix nothing provides qttranslations-qtconfig
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
X-List-Received-Date: Tue, 17 Apr 2018 12:43:06 -0000
Content-Type: text/plain

It failed to build meta-toolchain-qt5:
...
Error:
 Problem: conflicting requests
  - nothing provides qttranslations-qtconfig needed by packagegroup-qt5-toolchain-target-1.0-r0.noarch
...

The upstream removed qtconfig translations:
...
commit a6b3446cb023e7b3a5f8aa12ea0d650d2b804334
Author: Alexander Volkov <a.volkov@rusbitech.ru>
Date:   Thu Sep 14 19:33:25 2017 +0300

    Remove qtconfig translations
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 1 -
 recipes-qt/qt5/qttranslations_git.bb                          | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 234cde8..df80514 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -45,7 +45,6 @@ RDEPENDS_${PN} += " \
     qtbase-staticdev \
     qttranslations-qt \
     qttranslations-qtbase \
-    qttranslations-qtconfig \
     qttranslations-qthelp \
     qtconnectivity-dev \
     qtconnectivity-mkspecs \
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 430c54f..afe0d74 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -22,7 +22,6 @@ PACKAGES =. " \
     ${PN}-qtwebsockets \
     ${PN}-qtwebengine \
     ${PN}-qtxmlpatterns \
-    ${PN}-qtconfig \
     ${PN}-qtquick1 \
     ${PN}-qtscript \
     ${PN}-qtserialport \
@@ -83,10 +82,6 @@ FILES_${PN}-qtxmlpatterns = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
 "
 
-FILES_${PN}-qtconfig = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtconfig_*.qm \
-"
-
 FILES_${PN}-qtquick1 = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qtquick1_*.qm \
 "
-- 
2.7.4


