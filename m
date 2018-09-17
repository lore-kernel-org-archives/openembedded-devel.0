Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 350BB79620
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:57:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HFvCUf014277
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:57:13 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:57:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:17 +0800
Message-ID: <90ff7cd5208ab08224e6f516307795ebd27bcb27.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/19] konkretcmpi: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:57:12 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index 0f798d2..f62cf6b 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -30,9 +30,10 @@ do_install_append() {
     rm -rf ${D}${datadir}
 }
 
-PACKAGES =+ "${PN}-python ${PN}-python-dbg"
+PACKAGES =+ "${PN}-python"
+
+RPROVIDES_${PN}-dbg += "${PN}-python-dbg"
 
 FILES_${PN}-python = "${libdir}/python2.7/site-packages/konkretmof.py* ${libdir}/python2.7/site-packages/_konkretmof.so"
-FILES_${PN}-python-dbg = "${libdir}/python2.7/site-packages/.debug/*"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


