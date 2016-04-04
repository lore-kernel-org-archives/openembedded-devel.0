Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0653376651
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 10:03:53 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u34A3rVZ001339; Mon, 4 Apr 2016 05:03:53 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016040405035400-519426 ;
	Mon, 4 Apr 2016 05:03:54 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Apr 2016 13:03:27 +0300
Message-Id: <1459764207-23076-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/04/2016 05:03:54 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/04/2016 05:03:54 AM,
	Serialize complete at 04/04/2016 05:03:54 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-04_03:, , signatures=0
Subject: [meta-oe][PATCH] ti-wifi-utils: fix CC variable flags
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
X-List-Received-Date: Mon, 04 Apr 2016 10:03:55 -0000

Use bitbake's provided $CC variable instead of the custom one because
bitbake $CC usually is a superset and includes flags to correctly build
for things like hard-fload ABI's (-mfloat-abi).

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
index fcae729..58b40fb 100644
--- a/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
+++ b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
@@ -11,8 +11,7 @@ SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;branch=r5-jb"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} \
-                CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" \
                 CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3 -DCONFIG_LIBNL20" NLVER=3 \
                 LDFLAGS="${LDFLAGS} ${TOOLCHAIN_OPTIONS}" \
 '
-- 
2.7.4


