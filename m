Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B80C773172
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 09:09:14 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u4A99D3a025389; Tue, 10 May 2016 04:09:13 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016051004082723-884366 ;
	Tue, 10 May 2016 04:08:27 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2016 12:08:18 +0300
Message-Id: <1462871298-17207-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.8.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/10/2016 04:08:27 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/10/2016 04:08:27 AM,
	Serialize complete at 05/10/2016 04:08:27 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-10_03:, , signatures=0
Subject: [meta-oe][PATCH] gnulib: bump git revision
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
X-List-Received-Date: Tue, 10 May 2016 09:09:15 -0000

The revision currently used is quite ancient (beginning of 2014) and we
need bugfixes commited since then. Rather than backport patches it's
cleaner to uprev.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-support/gnulib/gnulib_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_git.bb b/meta-oe/recipes-support/gnulib/gnulib_git.bb
index 766e41a..5b2ed49 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_git.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_git.bb
@@ -11,7 +11,7 @@ SECTION = "devel"
 LICENSE = "LGPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4cf3810f33a067ea7ccd2cd889fed21"
-SRCREV = "24379a9217fa4bd62685795aaaa010fd90ced9e3"
+SRCREV = "b6b3ed1fa4c6de12908a9f01d1689f156c3cd441"
 SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
 "
 S = "${WORKDIR}/git"
-- 
2.8.2


