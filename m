Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1T4IyY-000694-3x
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2012 00:00:34 +0200
Received: by wibhq4 with SMTP id hq4so184014wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 14:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RWORQ/EcxE4JIhS/7iGSHbNjiuAl45PcTxWkuQgQPb4=;
	b=ngl2/asfFcUs5GlDWVMHo9JCWCnoE3QZgj2rgaSapBo0Jd4KSffBDnl8Ivi1AESc6e
	6ItPNK6NKvUh5Wd51w1tci3pI1TnZa4IinxhQqoo0KIa/oz4u8YMQSyMGILGUEqBBHgC
	sfI4jVPE81T5dXFwQRpw+81IS8sS7MoC61J/Jctj/lgdPqxq1Zv802gbpUt6MqEyULB9
	1CjaVUkeyEoUJpCgj8v7HeMi3DIkcIvGUmjiGkBlAzoC4Zletynhpb1oy/Y6zSwrMP8c
	ACdOIDcqi/PuVPIktoCk+ZDV14xjEuLfOwtlKNdvE/yh0Hhc6f8zpsxLSJaZ9Wd51iDl
	hjkA==
Received: by 10.180.97.106 with SMTP id dz10mr9042120wib.21.1345672108781;
	Wed, 22 Aug 2012 14:48:28 -0700 (PDT)
Received: from mizar.localdomain
	(host178-223-dynamic.7-79-r.retail.telecomitalia.it. [79.7.223.178])
	by mx.google.com with ESMTPS id ef5sm15654210wib.3.2012.08.22.14.48.24
	(version=SSLv3 cipher=OTHER); Wed, 22 Aug 2012 14:48:27 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 23:48:20 +0200
Message-Id: <1345672100-4366-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-initramfs][PATCH] initramfs-kexecboot-image: zap LDCONFIGDEPEND
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
X-List-Received-Date: Wed, 22 Aug 2012 22:00:34 -0000

* Override the settings of image.bbclass:
* we don't need ld.so.cache in our minimal image.
* While there, remove now unused ONLINE_PACKAGE_MANAGEMENT var.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../images/initramfs-kexecboot-image.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index 33ceca4..7e617ad 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -25,6 +25,6 @@ IMAGE_INITSCRIPTS = ""
 IMAGE_DEV_MANAGER = ""
 
 FEED_DEPLOYDIR_BASE_URI = ""
-ONLINE_PACKAGE_MANAGEMENT = "none"
+LDCONFIGDEPEND = ""
 
 inherit image
-- 
1.7.8.6



