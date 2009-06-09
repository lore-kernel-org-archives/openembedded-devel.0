Received: from [151.189.21.54] (helo=mail-in-14.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1MDtMl-0007bC-Iz
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 06:55:19 +0200
Received: from mail-in-18-z2.arcor-online.net (mail-in-18-z2.arcor-online.net
	[151.189.8.35]) by mx.arcor.de (Postfix) with ESMTP id 43A2A28B133;
	Tue,  9 Jun 2009 06:45:44 +0200 (CEST)
Received: from mail-in-17.arcor-online.net (mail-in-17.arcor-online.net
	[151.189.21.57])
	by mail-in-18-z2.arcor-online.net (Postfix) with ESMTP id 366D3510886; 
	Tue,  9 Jun 2009 06:45:44 +0200 (CEST)
Received: from localhost.localdomain (p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
	[114.177.118.77]) (Authenticated sender: leggewie@arcor.de)
	by mail-in-17.arcor-online.net (Postfix) with ESMTPSA id E7D4B3B2697;
	Tue,  9 Jun 2009 06:45:42 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-17.arcor-online.net E7D4B3B2697
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jun 2009 13:45:37 +0900
Message-Id: <1244522737-19251-1-git-send-email-no2spam@nospam.arcornews.de>
X-Mailer: git-send-email 1.6.0.4
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [PATCH] rootfs_ipk.bbclass: use force-defaults (Bug 5133)
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
X-List-Received-Date: Tue, 09 Jun 2009 04:55:19 -0000

From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>

Without -force-defaults, I currently cannot build any image because opkg hangs, waiting for
user input that of course never comes.

I'm explicitly not sure if this is the right way to fix this, but we should we fix it soon.

---
 classes/rootfs_ipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index f5714bd..bdb4f57 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -8,7 +8,7 @@
 do_rootfs[depends] += "opkg-native:do_populate_staging ipkg-utils-native:do_populate_staging"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
 
-IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
+IPKG_ARGS = "-f ${IPKGCONF_TARGET} -force-defaults -o ${IMAGE_ROOTFS} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
 
 PACKAGE_INSTALL_NO_DEPS ?= "0"
 
-- 
1.6.0.4



