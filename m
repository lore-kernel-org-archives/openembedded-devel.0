Return-Path: <radovan.scasny@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3CB7ED16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 12:19:47 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6ACJlP4007671
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:19:47 +0200
Received: from dev.vm6.ccp.siemens.com (md1yarhc.ad001.siemens.net
	[163.242.44.42])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x6ACJjuN025825;
	Wed, 10 Jul 2019 14:19:45 +0200
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B6A58233CC4F;
	Wed, 10 Jul 2019 14:19:45 +0200 (CEST)
From: Radovan Scasny <radovan.scasny@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 14:18:14 +0200
Message-Id: <20190710121814.5113-1-radovan.scasny@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] dhcpcd: enable udev by default
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
X-List-Received-Date: Wed, 10 Jul 2019 12:19:48 -0000

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
index e2759f47a..0447234d4 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d3
 
 inherit autotools-brokensep
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
-- 
2.11.0


