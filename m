Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id EDE5D6014F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:49:44 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3RCnhf3029415; Wed, 27 Apr 2016 07:49:43 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016042707491552-376836 ;
	Wed, 27 Apr 2016 07:49:15 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2016 15:49:06 +0300
Message-Id: <1461761346-22151-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.8.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/27/2016 07:49:15 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/27/2016 07:49:15 AM,
	Serialize complete at 04/27/2016 07:49:15 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-27_07:, , signatures=0
Subject: [meta-oe][PATCH] openconnect: add missing dependencies
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
X-List-Received-Date: Wed, 27 Apr 2016 12:49:47 -0000

They were autodetected and triggered QA warnings

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-networking/recipes-connectivity/openconnect/openconnect_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
index 0a8b875..6d3c252 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-DEPENDS = "vpnc libxml2 gnutls"
+DEPENDS = "vpnc libxml2 gnutls lz4 krb5 libproxy pcsc-lite"
 RDEPENDS_${PN} = "vpnc"
 
 PV = "7.06"
-- 
2.8.0


