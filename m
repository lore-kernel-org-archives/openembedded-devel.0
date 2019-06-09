Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 670777E403
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jun 2019 10:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45MC4Y5KHsz2C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jun 2019 12:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560075741;
	bh=gi2qNWLLkBQMZhgCFFLOT+kvcgZ7yLIKDIagFFKLKwI=;
	h=From:To:Subject:Date:From;
	b=CFT65jS1LKZBCIfELyPyDWs+IS/9/ioTJwpAHgpFTCaggCNAubU/CythPXT8kAgxJ
	1UL0tsT2MRvIF2v0yzVVw60+eMP3/hLZy3a3e3VxwwqmGYGouPUv1ZUvOUNVKct1lr
	umVK5YpFwcS1EyAkbtYhGhMbr6ea5zwaxl6uKrMpugjXmCps61u1YOlfpOqxmBTMT4
	zILlntHKdf4ruVbRIN+elEeWdI92pumHO5SrsONx66s9cVtLhpwZOjLZg/m5gppGFs
	0hOCM78jlW4dOlFU7LQwUZ3Yy7ezt0HR8QoHPyPebQcRXYoCHUki1r/nm58UKGIgxn
	z+8If8hb/XuhMHsoXHcuDu/aKoSPZtmkj7Syx1mW74QPRvQC3jY80Uj2Ra0TxPWLAY
	ZYvFfmm2LKSWyWniBOjgAV7fA+aCWsu9gmmIeyaZSlAi3IKZsOSKY2B/PbayAjb6q6
	d2uMI83JHKdz3cY2TN5YSO6sXeIhbbP6APHty111RFUbyUMKJxF6FbtkpPtls6YHjA
	nw/3gwkECqKc00fK2Bx5KbSWpak9GcrntIqkYYAlANp6EFz9XS610fl/oP2DrD4Y2V
	itHvlGsONB8e/yzhVoftuLlvJVENDWUc9V4qWINt0VNMbr+0XBpXaI2w7lA0QPnnax
	VKepTJBl5nrejhThTkXl2ACk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jun 2019 13:22:20 +0300
Message-Id: <20190609102220.22075-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] mcelog: Remove manual RDEPENDS from PN-ptest to PN package
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
X-List-Received-Date: Sun, 09 Jun 2019 10:22:21 -0000

They are now added automatically by the ptest class.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-support/mcelog/mcelog_162.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_162.bb b/meta-oe/recipes-support/mcelog/mcelog_162.bb
index dfca3855b..1aee674ec 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_162.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_162.bb
@@ -32,4 +32,4 @@ do_install_ptest() {
     sed -i 's#../../mcelog#mcelog#' ${D}${PTEST_PATH}/tests/test
 }
 
-RDEPENDS_${PN}-ptest += "${PN} make bash mce-inject"
+RDEPENDS_${PN}-ptest += "make bash mce-inject"
-- 
2.17.1


