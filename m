Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1F371A3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 23:56:40 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v186so32068899wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 15:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M+94zLaU8offTnuXU0Fylb0bNJfI4MlBmpNL6fEcnno=;
	b=IJSTjEZxHwHlYK517LfyB5fgxOn0h37XEAV7sLAEhIDj12TSN+S1/D02X21BePaAhe
	Sg/RQoKUG2Exun18ZNKgrsnJhPhUMSF7SCTFub6llodvzSlXj4dSQIChklzvv7qRSTKQ
	GolyV8cCvwVDIHwSIY6P8YpBA38jGHUti8qNVV4gAR8kupBE+8k4wRu4bmdQsOYrFtAh
	LtdJ15zZUKpwUbEPlEJVXzSez0Lcuyz7f61pLdOMsNMYbFSPAM5b7IylnD76R7Nmj6K4
	8gITmvWOzZSmHqMeqEVuBIwEM+eruKNeGoodNmvVtzr7PGKhRPKoOYmF7fPn36h65CGP
	GNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+94zLaU8offTnuXU0Fylb0bNJfI4MlBmpNL6fEcnno=;
	b=nHMpjazm7pO+WlYieyrzOz4ysHBqdybspuNn6fyOkM3GUOyW4rfalB4/74jQ6tbeQ4
	mgwX3GkHJMZZriATCVGD9VNMQdIgbzECeGhUvz/lZgoDQhIViTNMUruH5UpBMFqpyX/q
	6RpmXIo3y+YRok1mZmKsQ9bgVbOzP5lKQFJBmB2KaBGzC2oPZ3WCUVtueTqmA7r0D+wp
	l4cHS0TbRxF6QwtA4bX+w1QdEeURTjdrpHXR+sRXVYXGbEpZLMhq3wMkDzcm3pb2FYNX
	UvbCaTZTdjyxztADmFAu6ulsgDR5iB8k+1vIRLrnQSXW1WHslJiMlhIDgpwmlouMI+9P
	YgAw==
X-Gm-Message-State: AMke39lbkq6pHIghij4xjHXDhQSW2Edt/PTg4nGB6VIMGkUlK7LQSuCTzakC8ddSIE5VqA==
X-Received: by 10.28.84.88 with SMTP id p24mr14476310wmi.52.1486511800025;
	Tue, 07 Feb 2017 15:56:40 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id e74sm284462wmd.2.2017.02.07.15.56.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Feb 2017 15:56:38 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 00:56:24 +0100
Message-Id: <1486511784-32175-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] initramfs-kexecboot-image: disable runtime dependency on run-postinsts
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
X-List-Received-Date: Tue, 07 Feb 2017 23:56:45 -0000

The runtime dependency chain leads to the install of unneeded files:

 /usr/sbin/run-postinsts
 /usr/sbin/update-rc.d

This comes from the default value of ROOTFS_BOOTSTRAP_INSTALL='run-postinsts'
To fix this, for this image we need an empty var.

While there, do the same for KERNELDEPMODDEPEND as suggested in image.bbclass.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index 45ff50d..835b307 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -3,10 +3,13 @@ DESCRIPTION = "This image provides kexecboot (linux as bootloader) and helpers."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+inherit image
+
 IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
+KERNELDEPMODDEPEND = ""
 
 # We really need just kexecboot, kexec and ubiattach
 IMAGE_INSTALL = "kexecboot kexec mtd-utils-ubifs"
@@ -18,7 +21,8 @@ IMAGE_LINGUAS = ""
 
 FEED_DEPLOYDIR_BASE_URI = ""
 LDCONFIGDEPEND = ""
-
 IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
-inherit image
+# disable runtime dependency on run-postinsts -> update-rc.d
+ROOTFS_BOOTSTRAP_INSTALL = ""
+
-- 
2.7.4


