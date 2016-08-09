Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40990771DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:42:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u791gmgt026859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Aug 2016 18:42:48 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 18:42:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 21:42:40 -0400
Message-ID: <2aaa9a9943edda741b22f487fbd30831dff2cb88.1470706569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470706568.git.hongxu.jia@windriver.com>
References: <cover.1470706568.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Tue, 09 Aug 2016 01:42:48 -0000
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


