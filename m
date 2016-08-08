Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B773E77184
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 07:13:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u787DM6W008675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Aug 2016 00:13:22 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 00:13:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 03:13:12 -0400
Message-ID: <722cd73396c5984f377556749366b3bf0592f1c4.1470640304.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470640304.git.hongxu.jia@windriver.com>
References: <cover.1470640304.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] fontforge-native: support python module
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
X-List-Received-Date: Mon, 08 Aug 2016 07:13:23 -0000
Content-Type: text/plain

>>> import fontforge

The python module is required by lohit.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index 6f876aa..544149d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git"
 SRCREV = "07d5ccff2704f8a56f1b3cc6695a4e31f85f88e6"
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF_append_class-native = " with_x=no --disable-python-extension --disable-python-scripting"
+EXTRA_OECONF_append_class-native = " with_x=no"
 
 do_configure_prepend() {
     # uthash sources are expected in uthash/src
-- 
2.8.1


