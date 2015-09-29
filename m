Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3374B7701A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:15:24 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8TAFOso032411 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 05:15:24 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092905152422-702821 ;
	Tue, 29 Sep 2015 05:15:24 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2015 13:15:22 +0300
Message-Id: <1443521722-15792-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443440681-5009-1-git-send-email-adrian.ratiu@ni.com>
References: <1443440681-5009-1-git-send-email-adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/29/2015 05:15:24 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/29/2015 05:15:24 AM,
	Serialize complete at 09/29/2015 05:15:24 AM
X-Proofpoint-Virus-Version: vendor=nai engine=5600 definitions=5800
	signatures=585085
Subject: [meta-oe][PATCH v2] vim: provide the xxd tool (package vim-xxd)
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
X-List-Received-Date: Tue, 29 Sep 2015 10:15:26 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-support/vim/vim_7.4.481.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index 2ece53b..44e6571 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -76,11 +76,12 @@ do_install() {
 
 PARALLEL_MAKEINST = ""
 
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc"
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-xxd"
 FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
 FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
+FILES_${PN}-xxd = "${bindir}/xxd"
 FILES_${PN}-data = "${datadir}/${BPN}"
 FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \
-- 
2.1.4


