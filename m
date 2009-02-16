Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LZ8cD-0003mb-Iz
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 19:54:49 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id F3F267148CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 13:52:54 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.294
X-Spam-Level: 
X-Spam-Status: No, score=0.294 tagged_above=-10 required=5 tests=[AWL=-0.438, 
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeQu3vOerkT9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 13:52:52 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id 8FBBC715407
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 13:52:51 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Feb 2009 18:52:19 -0000
Message-ID: <012601c99067$b2d3b560$187b2020$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmQZ7FtbkmXRsWpTruEqDP08ApgQw==
Subject: [RFC/PATCH] Modify libgles-omap3 package to make /dev/pvrsrvkm accessible by non ROOT users.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2009 18:54:49 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Tested by running several OGLES apps on the Pandora as a normal user, should
also be fine on the Beagle/Overo/OMAP3EVM etc.

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 packages/powervr-drivers/libgles-omap3/rc.pvr      |    1 +
 .../powervr-drivers/libgles-omap3_3.00.00.06.bb    |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)
 mode change 100644 => 100755
packages/powervr-drivers/libgles-omap3_3.00.00.06.bb

diff --git a/packages/powervr-drivers/libgles-omap3/rc.pvr
b/packages/powervr-drivers/libgles-omap3/rc.pvr
index 4476a9d..1f63d4e 100755
--- a/packages/powervr-drivers/libgles-omap3/rc.pvr
+++ b/packages/powervr-drivers/libgles-omap3/rc.pvr
@@ -15,6 +15,7 @@ if [ -e /dev/pvrsrvkm ] ; then
 fi
 
 mknod /dev/pvrsrvkm c $pvr_maj 0 
+chmod 666 /dev/pvrsrvkm
 
 /usr/bin/pvrsrvinit
 
diff --git a/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
b/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
index aba613c..7af52a2
--- a/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
+++ b/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
@@ -2,7 +2,7 @@ require libgles-omap3.inc
 
 # Not released yet
 #DEFAULT_PREFERENCE = "-1"
-PR = "r5"
+PR = "r6"
 
 SGXPV = "3_00_00_06"
 IMGPV = "1.3.13.1397"
-- 
1.6.0.5





