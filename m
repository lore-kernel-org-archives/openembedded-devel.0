Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 07AAF734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 10:58:41 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t96Awgmq026390 for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Oct 2015 05:58:42 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015100605584173-1246795 ;
	Tue, 6 Oct 2015 05:58:41 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 6 Oct 2015 13:58:40 +0300
Message-Id: <1444129120-5101-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/06/2015 05:58:41 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/06/2015 05:58:41 AM,
	Serialize complete at 10/06/2015 05:58:41 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-06_07:, , signatures=0
Subject: [meta-security][PATCH] clamav: Update source mirror
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
X-List-Received-Date: Tue, 06 Oct 2015 10:58:43 -0000

The source archive was deleted from the debian mirror; get it from
launchpad for now

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 recipes-security/clamav/clamav_0.98.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-security/clamav/clamav_0.98.5.bb b/recipes-security/clamav/clamav_0.98.5.bb
index 08604a7..8820461 100644
--- a/recipes-security/clamav/clamav_0.98.5.bb
+++ b/recipes-security/clamav/clamav_0.98.5.bb
@@ -7,7 +7,7 @@ DEPENDS = "libtool db openssl zlib ncurses bzip2 libmspack"
 
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;beginline=2;endline=3;md5=4b89c05acc71195e9a06edfa2fa7d092"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}+dfsg.orig.tar.xz;name=archive \
+SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/clamav_0.98.5%2Bdfsg.orig.tar.xz;name=archive \
     file://0001-Change-paths-in-sample-conf-file-to-match-Debian.patch \
     file://0002-Add-an-additional-n-after-the-number-in-the-pidfile.patch \
     file://0003-unit_tests-increment-test-timeout-from-40secs-to-5mi.patch \
-- 
2.1.4


