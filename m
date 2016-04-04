Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4A676710
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 12:44:11 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u34CiCkV000451; Mon, 4 Apr 2016 07:44:12 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016040407441277-523334 ;
	Mon, 4 Apr 2016 07:44:12 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Apr 2016 15:43:45 +0300
Message-Id: <79b27b412f7fb085cc4525907858cb072b6da7e2.1459773737.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/04/2016 07:44:12 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/04/2016 07:44:13 AM,
	Serialize complete at 04/04/2016 07:44:13 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-04_05:, , signatures=0
Subject: [meta-oe][PATCH v2 1/2] vpnc: stage vpnc-script
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
X-List-Received-Date: Mon, 04 Apr 2016 12:44:13 -0000

The vpn connection handling script is used during building openconnect
so we need to stage it.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 0670c5e..ccb4494 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -24,6 +24,13 @@ do_install () {
     install ${WORKDIR}/default.conf ${D}${sysconfdir}/vpnc/default.conf
 }
 
+SYSROOT_PREPROCESS_FUNCS += "vpnc_sysroot_preprocess"
+
+vpnc_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${sysconfdir}/vpnc
+    install -m 755 ${D}${sysconfdir}/vpnc/vpnc-script ${SYSROOT_DESTDIR}${sysconfdir}/vpnc
+}
+
 CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf"
 RDEPENDS_${PN} = "perl-module-io-file"
 RRECOMMENDS_${PN} = "kernel-module-tun"
-- 
2.7.4


