Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFBA76ACA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:47:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6lGtL027089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:47:16 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:47:13 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:47 +0800
Message-ID: <5c7090967793406d45e8ad0088fb3a89e1222139.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 6/8] qt-creator: pass correct IDE_LIBRARY_BASENAME
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
X-List-Received-Date: Fri, 21 Aug 2015 06:47:17 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
ERROR: QA Issue: qt-creator: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/qtcreator
  /usr/lib/qtcreator/libQmlJS.so.1
  /usr/lib/qtcreator/libQmlEditorWidgets.so
  /usr/lib/qtcreator/libUtils.so.1
  /usr/lib/qtcreator/libCPlusPlus.so
  [snip]
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
index ca73cda..d911db1 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
@@ -16,6 +16,8 @@ S = "${WORKDIR}/${BP}-src"
 
 inherit qt4x11
 
+EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}"
+
 do_install() {
 	oe_runmake INSTALL_ROOT=${D}${prefix} install
 	oe_runmake INSTALL_ROOT=${D}${prefix} install_docs
-- 
1.7.9.5


