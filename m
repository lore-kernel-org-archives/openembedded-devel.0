Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E00A379605
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:57:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFuuP5006607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:57:06 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:56:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:16 +0800
Message-ID: <8479ce378f259dc5956cf896ce908946a0d6408f.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/19] scsirastools: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:57:31 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index e202d16..77d3cfe 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -33,16 +33,14 @@ INITSCRIPT_PARAMS_${PN}-diskmon = "defaults 80 20"
 INITSCRIPT_NAME_${PN}-raidmon = "sgraid"
 INITSCRIPT_PARAMS_${PN}-raidmon = "defaults 80 20"
 
-PACKAGES =+ "${PN}-diskmon ${PN}-diskmon-dbg"
-PACKAGES =+ "${PN}-raidmon ${PN}-raidmon-dbg"
+PACKAGES =+ "${PN}-diskmon"
+PACKAGES =+ "${PN}-raidmon"
 
-FILES_${PN}-dbg += "/usr/share/scsirastools/.debug"
+RPROVIDES_${PN}-dbg += "${PN}-diskmon-dbg ${PN}-raidmon-dbg"
 
 FILES_${PN}-diskmon = "${sbindir}/sgdiskmon ${sysconfdir}/init.d/sgdisk"
-FILES_${PN}-diskmon-dbg = "${sbindir}/.debug/sgdiskmon"
 
 FILES_${PN}-raidmon = "${sbindir}/sgraidmon ${sysconfdir}/init.d/sgraid"
-FILES_${PN}-raidmon-dbg = "${sbindir}/.debug/sgraidmon"
 
 RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN}-diskmon += "${PN}"
-- 
2.7.4


