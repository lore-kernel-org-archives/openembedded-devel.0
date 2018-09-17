Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAAA7969B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:58:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFvQ67006616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:57:47 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:57:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:20 +0800
Message-ID: <850d56c5aa2a2b19dcecd04b6e9ad5d09ae62a58.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/19] fontforge: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:58:06 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
index 481fedf..947d36e 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb
@@ -45,7 +45,9 @@ EOF
     cd $currdir
 }
 
-PACKAGES =+ "${PN}-python-dbg ${PN}-python"
+PACKAGES =+ "${PN}-python"
+
+RPROVIDES_${PN}-dbg += "${PN}-python-dbg"
 
 FILES_${PN} += " \
     ${datadir}/mime \
@@ -53,7 +55,6 @@ FILES_${PN} += " \
 "
 
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${PN}/python"
-FILES_${PN}-python-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug"
 RDEPENDS_${PN}-python = "python"
 
 # for e.g kde's oxygen-fonts
-- 
2.7.4


