Received: from mail-gh0-f173.google.com ([209.85.160.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPeKD-000877-TZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 21:35:27 +0200
Received: by mail-gh0-f173.google.com with SMTP id g16so1116516ghb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=DgcSsbN7T4J4uauXlP1ttX6T3uVNleMXdgYqGb9LIdI=;
	b=BX05EIhvoRahmjshf1xWWc/0YYbogYIQxu204V81Cu3Kmi2rIiTM6ko620Xo4yUFGN
	xrS//FTEpmkvfg8nMxua2LV8ZBJGEIcwGKn0+PvXNloKyRXpHFc78KdGz18qgQWbZoQh
	NN8E+v6zkPrM+1PrWNBS/0KNv45EUsTRd+ydNIkdmsUqu6Z62Osq4UZpIQ6K/QgfrnEZ
	mG6m1/lZ1LBgLDkO37rrNFKmXr+X4azknsuw1bW/IanUnJUV4SyrOxaHrp+pa5hg+Lgt
	/0PcpR4ycU1b5vTTlBtXDkIria1HtiAwYN0PskdF1xkloO3IHMBwuNIuJBiCl+bPUc/m
	JO8Q==
X-Received: by 10.236.114.132 with SMTP id c4mr7846731yhh.205.1365535085095;
	Tue, 09 Apr 2013 12:18:05 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t9sm45013110yhh.0.2013.04.09.12.18.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 12:18:04 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  9 Apr 2013 16:17:38 -0300
Message-Id: <1365535059-27254-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1365535059-27254-1-git-send-email-otavio@ossystems.com.br>
References: <1365535059-27254-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v2 3/4] imx23evk: Use U-Boot by default
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
X-List-Received-Date: Tue, 09 Apr 2013 19:35:27 -0000

The U-Boot now supports the imx23evk board so we now use it by
default. The imx-bootlets support is still available in case someone
needs it.

Change-Id: I321e1b8e461e5bdfa9995964e4ab1c779c222c6b
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/machine/imx23evk.conf | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/conf/machine/imx23evk.conf b/conf/machine/imx23evk.conf
index 759e4ab..a5c0f98 100644
--- a/conf/machine/imx23evk.conf
+++ b/conf/machine/imx23evk.conf
@@ -7,13 +7,12 @@ include conf/machine/include/mxs-base.inc
 SOC_FAMILY = "mx23:mxs"
 
 IMXBOOTLETS_MACHINE = "stmp378x_dev"
+UBOOT_MACHINE = "mx23evk_config"
 
-KERNEL_IMAGETYPE = "zImage"
+KERNEL_IMAGETYPE = "uImage"
 KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/imx23-evk.dts"
 
-IMAGE_BOOTLOADER = "imx-bootlets"
-
 SDCARD_ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
-IMAGE_FSTYPES ?= "tar.bz2 ext3 linux.sb sdcard"
+IMAGE_FSTYPES ?= "tar.bz2 ext3 uboot.mxsboot-sdcard sdcard"
 
 MACHINE_FEATURES = "apm usbgadget usbhost vfat alsa touchscreen"
-- 
1.8.1



