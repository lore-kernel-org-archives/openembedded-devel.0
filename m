Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id E3D3F6B130
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:51:15 +0000 (UTC)
Received: (qmail 5901 invoked by uid 89); 5 Sep 2013 09:51:05 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 5 Sep 2013 09:51:05 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:50:44 +0200
Message-Id: <1378374644-10201-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libdevice-gsm-perl: modified
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
X-List-Received-Date: Thu, 05 Sep 2013 09:51:16 -0000

Time::HiRes is a core module so removed from RDEPENDS

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb b/meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb
index 1be3d5e..884a92c 100644
--- a/meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb
+++ b/meta-perl/recipes-perl/libdevice-gsm-perl/libdevice-gsm-perl_1.60.bb
@@ -6,7 +6,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;md5=3f0b149e4ed2b3520632c786f3d1ba9a"
 
 RDEPENDS_${PN} += "libdevice-modem-perl \
-                   libtime-hires-perl \
                    libdevice-serialport-perl \
                    "
 
-- 
1.8.4.rc3


