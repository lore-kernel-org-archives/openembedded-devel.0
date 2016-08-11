Return-Path: <razvan.heghedus@ni.com>
X-Greylist: delayed 1319 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Aug 2016 15:55:16 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 408F173190
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 15:55:15 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7BFXIZC007782 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:33:18 -0500
Received: from localhost.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016081110331775-247172 ;
	Thu, 11 Aug 2016 10:33:17 -0500 
From: Heghedus Razvan <razvan.heghedus@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 18:33:06 +0300
Message-Id: <20160811153306.9517-1-razvan.heghedus@ni.com>
X-Mailer: git-send-email 2.9.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/11/2016 10:33:18 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/11/2016 10:33:18 AM,
	Serialize complete at 08/11/2016 10:33:18 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-11_11:, , signatures=0
Subject: [meta-oe][PATCH] xf86-video-ati: Set RRECOMMENDS to linux-firmware-radeon
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
X-List-Received-Date: Thu, 11 Aug 2016 15:55:17 -0000

xf86-video-ati has linux-firmware in RRECOMMENDS_${PN} because it needs
linux-firmware-radeon. But beside linux-firmware-radeon, linux-firmware
adds unneeded packages, these packages having ~ 110MB.

Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
index f1d06f2..bffa7b0 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
@@ -17,4 +17,4 @@ SRC_URI[sha256sum] = "2516d9eeb8da8bcd3a01365ed1314919777910fa904ab268af342b5693
 EXTRA_OECONF += "--disable-glamor"
 
 RDEPENDS_${PN} += "xserver-xorg-module-exa"
-RRECOMMENDS_${PN} += "linux-firmware"
+RRECOMMENDS_${PN} += "linux-firmware-radeon"
-- 
2.9.0


