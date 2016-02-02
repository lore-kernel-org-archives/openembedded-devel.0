Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id C0AEB770E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:37:17 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u12AbHr0001375 for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Feb 2016 04:37:17 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020204371781-547594 ;
	Tue, 2 Feb 2016 04:37:17 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Feb 2016 12:36:58 +0200
Message-Id: <1454409418-23337-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 04:37:18 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 04:37:18 AM,
	Serialize complete at 02/02/2016 04:37:18 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_07:, , signatures=0
Subject: [meta-oe][PATCH 1/1] xterm: make xft PACKAGECONFIG depend on freetype-native
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
X-List-Received-Date: Tue, 02 Feb 2016 10:37:18 -0000

meta-cloud-services enables this dependency unconditionally. Add it
here in the PACKAGECONFIG and we can remove it from there entirely.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_320.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
index f67d890..f2abc3c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
@@ -10,7 +10,7 @@ SRC_URI[md5sum] = "0d7f0e6390d132ae59876b3870e5783d"
 SRC_URI[sha256sum] = "a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e252461798bce24a7"
 
 PACKAGECONFIG ?= ""
-PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig"
+PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
-- 
2.7.0


