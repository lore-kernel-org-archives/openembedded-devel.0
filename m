Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1ORSGP-0003N2-9m
	for Openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 17:53:23 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id DBEE1107F88;
	Wed, 23 Jun 2010 11:40:37 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 23 Jun 2010 11:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id; s=smtpout;
	bh=2x3Uq63LJSokfM8TnFOtsjWFKRg=;
	b=LDmQuqeXqeVvVdJAwmhhJ07JUdY4JUQ8vxfOgT7acEuH33rgqcTTnHG8MCU5dGEHRx0SeuRmc8+vWiOn+OG/DY5QyWlwEcNrK+NpO3urw4EEjGPL876UTuIYiUNWCUCAtkUASQwnXVZ7yj41F3bvzUHrfJ3BCcv4PkEgD3067WQ=
X-Sasl-enc: YT2pfWVcmWTwkX+zC19T8AbROYspV9cY1EudTibwqhuD 1277307635
Received: from localhost.localdomain (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id C1DE14EAD98;
	Wed, 23 Jun 2010 11:40:34 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jun 2010 17:40:26 +0200
Message-Id: <1277307626-24691-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>, Vitus Jensen <vjensen@gmx.de>
Subject: [STABLE][PATCH] kernel bbclass: switch to u-boot-mkimage-native
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
X-List-Received-Date: Wed, 23 Jun 2010 15:53:23 -0000

From: Koen Kooi <koen@openembedded.org>

This is a long demanded change. The u-boot-mkimage is up to date to OE standards, while the openmoko one is not
(cherry picked from commit 7425e92b1c7918c8c3b609950dbdb44dd488f1fe)

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 39a9af5..7279e00 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -14,7 +14,7 @@ python __anonymous () {
     kerneltype = bb.data.getVar('KERNEL_IMAGETYPE', d, 1) or ''
     if kerneltype == 'uImage':
     	depends = bb.data.getVar("DEPENDS", d, 1)
-    	depends = "%s u-boot-mkimage-openmoko-native" % depends
+    	depends = "%s u-boot-mkimage-native" % depends
     	bb.data.setVar("DEPENDS", depends, d)
 
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
-- 
1.5.6.5



