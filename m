Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1U67LU-00060S-Q2
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 23:32:01 +0100
Received: by mail-ee0-f49.google.com with SMTP id d4so1513297eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 14:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=YNMQ82x2nCf+nDnZllhcoKBm7BAvKo4w1wMvHTRigW8=;
	b=toZOTw8mjjIstSo2pYfy4JqiuJac9Jc9LV/Vb+adJfPPz79o7DkzI3MWtq5XkQ/QSb
	clEG8m/r6ppKLTCFbLT3L5ocsCDYHo/8XgGo1iqgcbsGcAbMPY07d9X6xZ4uKPunagNb
	n7/cq5O9pkVpGwjX/FGMD4G1Zew8vBhk7gZgizRUZz4jWeVo+373R917RZXq90HwRkOD
	wuiqn4HzEtjCZLHXJwtuaYEorXB4kdau1jV+SdmuB9mi2sCN/ANcGaoR4GkrW3JtItCU
	NY03M+if8aXXrb6coSkOkYqsKive7UTvamZLbQ2XdAw2Zgruez8v47JRDWrs0Ak2hTFI
	996Q==
X-Received: by 10.14.0.73 with SMTP id 49mr886010eea.21.1360880158147;
	Thu, 14 Feb 2013 14:15:58 -0800 (PST)
Received: from mizar.localdomain
	(host124-251-dynamic.0-87-r.retail.telecomitalia.it. [87.0.251.124])
	by mx.google.com with ESMTPS id d47sm21979974eem.9.2013.02.14.14.15.56
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 14:15:57 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2013 23:15:53 +0100
Message-Id: <1360880153-8526-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-oe][meta-initramfs][PATCH] initramfs-kexecboot-image: update IMAGE_INSTALL after mtd-utils split
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
X-List-Received-Date: Thu, 14 Feb 2013 22:32:01 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index 7e617ad..01e5b84 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -9,9 +9,9 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
 
-# for ubiattach we have to install full mtd-utils (>700KiB)
+# for ubiattach we have to install mtd-utils-ubifs
 # or use ubiattach-klibc instead
-IMAGE_INSTALL = "kexec kexecboot mtd-utils"
+IMAGE_INSTALL = "kexec kexecboot mtd-utils-ubifs"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-- 
1.7.12.4



