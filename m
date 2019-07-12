Return-Path: <radovan.scasny@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id C78767EE18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:56:46 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6C7uk2T002611
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:56:46 +0200
Received: from dev.vm6.ccp.siemens.com (md1yarhc.ad001.siemens.net
	[163.242.44.42])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x6C7uid9022413;
	Fri, 12 Jul 2019 09:56:44 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 3CC35233CC4F;
	Fri, 12 Jul 2019 09:56:44 +0200 (CEST)
From: Radovan Scasny <radovan.scasny@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 09:56:41 +0200
Message-Id: <20190712075641.4896-1-radovan.scasny@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] dhcpcd: fix building with pkgconfig
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
X-List-Received-Date: Fri, 12 Jul 2019 07:56:47 -0000

PKGCONFIG was used, but not inherited

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
index 0447234d4..3cd13884d 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
 SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
 SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
 
-inherit autotools-brokensep
+inherit pkgconfig autotools-brokensep
 
 PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
-- 
2.11.0


