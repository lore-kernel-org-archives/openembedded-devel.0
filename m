Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0617060FC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 05:37:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0265bwRY022508
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Mar 2020 21:37:58 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.487.0; Thu, 5 Mar 2020 21:37:57 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Mar 2020 13:37:56 +0800
Message-ID: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] layer.conf: add meta-python to LAYERDEPENDS
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
X-List-Received-Date: Fri, 06 Mar 2020 05:37:58 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

yocto-check-layer/test_world failed since error:
ERROR: test_world (common.CommonCheckLayer)
ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
DEPENDS on or otherwise requires it). Close matches:
  python3-numpy-native
  python3-pycairo-native
  python3-rpm-native
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'mozjs', 'python3-pytoml-native']

mozjs depend on recipe under meta-python, but meta-python
isn't in LAYERDEPENDS, so error occurred. Fix by add
it into LAYERDEPENDS.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/layer.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index c537736..0ce0ad2 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -27,7 +27,10 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 # cause compatibility issues with other layers
 LAYERVERSION_openembedded-layer = "1"
 
-LAYERDEPENDS_openembedded-layer = "core"
+LAYERDEPENDS_openembedded-layer = " \
+    core \
+    meta-python \
+"
 
 LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
 
-- 
2.7.4


