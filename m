Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A78FB79558
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:56:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HFuhiJ014214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:56:43 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:56:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:14 +0800
Message-ID: <ad5efbb8d1a9ed9e6df5e346a8764a3ef4e310e0.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/19] isomd5sum: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:56:42 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
index d88df5b..83e8385 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
@@ -25,10 +25,11 @@ do_install () {
     oe_runmake install
 }
 
-PACKAGES += "${PYTHON_PN}-${PN} ${PYTHON_PN}-${PN}-dbg"
+PACKAGES += "${PYTHON_PN}-${PN}"
+
+RPROVIDES_${PN}-dbg += "${PYTHON_PN}-${PN}-dbg"
 
 FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
-FILES_${PYTHON_PN}-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug/pyisomd5sum.so"
 
 SRCREV = "7860901f726f5d92689cb67243cc7f981f21f74b"
 
-- 
2.7.4


