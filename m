Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF777871B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2018 22:00:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m129-v6so17810160wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2018 15:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TQz8K8xZlvDap/tMk+KOOYVjI1hkpQbMT/DcaJyYJAg=;
	b=qi7fTbhuuxlcf9dkzmjj3/soRLdG4LzT+gurmwYvURjj1NPGOYBhgP1nlP0p2tf2qN
	RB1tZ5N4IVQ3Gup1O755zChIheejwHq1SJmdsCjcFIW3J5jzDjLbhVRwLSBYdHJfMfkH
	FGNnmaI8aorM2o8SwKetvu1j/9PDmkxVKUYS61tIYXHtu9FBsnJ8UTydG4z4EzJS95aO
	0N1U92+qiqo24DpaObVhxjgGVi8BGR1NwHdEtN3wGCVyVm+6gy86wLnCyIE3HCc+ptv5
	UpKlCcWDg/1tUnY+6rqmzZGqTsQmffgWgfgTaqgEdrI41WsndJH3duqmGW76l1duB+75
	VIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TQz8K8xZlvDap/tMk+KOOYVjI1hkpQbMT/DcaJyYJAg=;
	b=LrGN9UWSl38Zrvu/+qC5CB6/3NC+cG933B30yFiF696S3uAjQ2I5v4gjW7SwVUegsE
	D5OxWds4TL7AjJVnI+fozJ04VzLsnihslKoRO0s4bStD4Yx0xSNsBKryeaumy5ZFevqa
	XLLY22TUJ7rBdTTJnEnO/yBISSvb8C2Ql8owvuioyjKI1hfNyR6v++Vje+tPzA82yKsw
	tWccdnpdhyMpZKm7pca+/c38lakZySbMQ0K+2pqXgCw2MPHVBKCCN9EACFNi2Hy4pdr8
	IcY6kQDJUY/dd6PADJ7CiWLTkI/wNPE2VKDCSYu9ufrcvzwzp5UQrctG6u+BjrDuAA7i
	Ntjw==
X-Gm-Message-State: ALKqPwc7jYXGrOZZaTDew+FEIeG8OsMigRCnss90Y9vYL2zlSnmX3sA9
	jFTppDJLJktzwOHjlAMthBMAxA==
X-Google-Smtp-Source: AB8JxZqMG47MEUPSsM0jRgH8m9lBvV3iAWnHUU85s9YIthpLoT3WuPrNRzWQZ1Fkvzylg9w++dmCTg==
X-Received: by 2002:a1c:5451:: with SMTP id
	p17-v6mr6286973wmi.26.1526335237595; 
	Mon, 14 May 2018 15:00:37 -0700 (PDT)
Received: from localhost.localdomain
	(host10-248-dynamic.0-87-r.retail.telecomitalia.it. [87.0.248.10])
	by smtp.gmail.com with ESMTPSA id
	q7-v6sm13633847wrf.49.2018.05.14.15.00.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 15:00:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2018 00:00:33 +0200
Message-Id: <1526335233-14789-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH] linux-handheld(-kexecboot)_4.4: upgrade to 4.4.131
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
X-List-Received-Date: Mon, 14 May 2018 22:00:37 -0000

Remove backported pxa_dma fix.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...aengine-mmp-pdma-add-number-of-requestors.patch | 34 ----------------------
 recipes-kernel/linux/linux-handheld_4.4.bb         |  6 ++--
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-handheld-4.4/dmaengine-mmp-pdma-add-number-of-requestors.patch

diff --git a/recipes-kernel/linux/linux-handheld-4.4/dmaengine-mmp-pdma-add-number-of-requestors.patch b/recipes-kernel/linux/linux-handheld-4.4/dmaengine-mmp-pdma-add-number-of-requestors.patch
deleted file mode 100644
index 02287a4..0000000
--- a/recipes-kernel/linux/linux-handheld-4.4/dmaengine-mmp-pdma-add-number-of-requestors.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4ab014655ebad342c6e7beae427c5cc0f8141d2b Mon Sep 17 00:00:00 2001
-From: Robert Jarzmik <robert.jarzmik@free.fr>
-Date: Mon, 15 Feb 2016 21:57:46 +0100
-Subject: dmaengine: mmp-pdma: add number of requestors
-
-commit c283e41ef32442f41e7180f9bb1c5aedf9255bfe upstream.
-
-The DMA chip has a fixed number of requestor lines used for flow
-control. This number is platform dependent. The pxa_dma dma driver will
-use this value to activate or not the flow control.
-
-There won't be any impact on mmp_pdma driver.
-
-Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- include/linux/platform_data/mmp_dma.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/linux/platform_data/mmp_dma.h b/include/linux/platform_data/mmp_dma.h
-index 2a330ec..d1397c8 100644
---- a/include/linux/platform_data/mmp_dma.h
-+++ b/include/linux/platform_data/mmp_dma.h
-@@ -14,6 +14,7 @@
- 
- struct mmp_dma_platdata {
- 	int dma_channels;
-+	int nb_requestors;
- };
- 
- #endif /* MMP_DMA_H */
--- 
-cgit v0.12
-
diff --git a/recipes-kernel/linux/linux-handheld_4.4.bb b/recipes-kernel/linux/linux-handheld_4.4.bb
index 6403fc7..603073d 100644
--- a/recipes-kernel/linux/linux-handheld_4.4.bb
+++ b/recipes-kernel/linux/linux-handheld_4.4.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 COMPATIBLE_MACHINE = "akita|c7x0|collie|h3600|hx4700|poodle|spitz|tosa"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v4.x/linux-${PV}.tar.xz;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v4.x/patch-${PV}.90.xz;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v4.x/patch-${PV}.131.xz;apply=yes;name=stablepatch \
            "
 SRC_URI[kernel.md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
 SRC_URI[kernel.sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
-SRC_URI[stablepatch.md5sum] = "8186b1fec7b797f341040ccd4ae45ce0"
-SRC_URI[stablepatch.sha256sum] = "fe52e3ae90ea5cc2bc6da70efcb085cb80257cfb2dd058d09e5efcadcc7ed275"
+SRC_URI[stablepatch.md5sum] = "e03be4613183558867bc1342e295485e"
+SRC_URI[stablepatch.sha256sum] = "6d55f660482213c8fcd2ccd89592eccaa020d047976733909a457d9b0e56f3af"
 
 SRC_URI += "\
            file://ASoC-pxa-fix-module-autoload-for-platform-drivers.patch \
-- 
2.7.4


