Return-Path: <robert_joslyn@selinc.com>
X-Greylist: delayed 3015 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Apr 2017 21:08:31 UTC
Received: from valiant.selinc.com (valiant.selinc.com [74.117.214.141])
	by mail.openembedded.org (Postfix) with ESMTP id 095F377CE8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 21:08:31 +0000 (UTC)
Received: from pps.filterd (valiant.selinc.com [127.0.0.1])
	by valiant.selinc.com (8.16.0.17/8.16.0.17) with SMTP id v33KGPpv003581
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Apr 2017 13:18:18 -0700
Received: from edison2.ad.selinc.com (mail.ad.selinc.com [10.100.0.115])
	by valiant.selinc.com with ESMTP id 29ja9skmyj-1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 13:18:18 -0700
Received: from robejoslpc.ad.selinc.com ([10.203.80.174])
	by edison2.ad.selinc.com (IBM Domino Release 9.0.1FP3 HF515)
	with ESMTP id 2017040313181776-271748 ;
	Mon, 3 Apr 2017 13:18:17 -0700 
From: Robert Joslyn <robert_joslyn@selinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Apr 2017 13:18:10 -0700
Message-Id: <20170403201810.4721-1-robert_joslyn@selinc.com>
X-Mailer: git-send-email 2.10.2
X-MIMETrack: Itemize by SMTP Server on Edison2/SEL(Release 9.0.1FP3
	HF515|April 25, 2015) at 04/03/2017 01:18:17 PM,
	Serialize by Router on Edison2/SEL(Release 9.0.1FP3 HF515|April 25,
	2015) at 04/03/2017 01:18:18 PM,
	Serialize complete at 04/03/2017 01:18:18 PM
X-TNEFEvaluated: 1
X-Proofpoint-Virus-Version: vendor=nai engine=5800 definitions=8487
	signatures=668452
Subject: [meta-oe][PATCH] plymouth: Fix virtual RPROVIDES
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
X-List-Received-Date: Mon, 03 Apr 2017 21:08:32 -0000

Runtime package names cannot have slashes in them, so replace "virtual/"
with "virtual-" in RPROVIDES.

Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 1c1a02d..6163cff 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libcap libpng cairo dbus udev"
 PROVIDES = "virtual/psplash"
-RPROVIDES_${PN} = "virtual/psplash virtual/psplash-support"
+RPROVIDES_${PN} = "virtual-psplash virtual-psplash-support"
 
 SRC_URI = "http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
-- 
2.10.2


