Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B06E676ACA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:47:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L6lJFw007985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:47:20 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 20 Aug 2015 23:47:19 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 14:46:48 +0800
Message-ID: <8c25573a395e435e77888474cb195cc0101bb683.1440139197.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 7/8] libqofono: fix the hardcoded libdir
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
X-List-Received-Date: Fri, 21 Aug 2015 06:47:20 -0000
Content-Type: text/plain

Fix QA issue when enable multilib:
ERROR: QA Issue: libqofono: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libqofono.so.0.1.0
  /usr/lib/libqofono.so.0
  /usr/lib/libqofono.so.0.1
  /usr/lib/libqofono.so
  /usr/lib/libqofono.prl
  [snip]
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
index d526044..9349372 100644
--- a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
+++ b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
@@ -66,6 +66,7 @@ do_configure_prepend() {
     # Hack *.pro variables
     find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
     find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_PREFIX\],$$INSTALL_ROOT$$PREFIX,g' '{}' ';'
+    find . -iname '*.pro' -exec sed -i -e 's,$$INSTALL_ROOT$$PREFIX/lib,$$INSTALL_ROOT$$PREFIX/${baselib},g' '{}' ';'
 }
 
 do_install() {
-- 
1.7.9.5


