Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGvJv-0006sl-47
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 16:41:32 +0200
Received: by pwi5 with SMTP id 5so702901pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 07:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=3mZAx2i99Gqeu6vm0fQ93ZskCCQgU5oH60XeiEXxM7U=;
	b=CRzJWaTsooqbIQFc+DQVMHEM8m8y77KRMvag0795w9ElREgM0sLpHB9y0fQPZcn4Vw
	VYbjb4EcGdEv/Or/sMBLAmRwqtmGUoVQHq+mWac2d/AL89hl4awNzVeaMkMNJYj6GqnG
	DbOclkLUVDDs3pWiS6odylWLr/rhltirh/hoM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=aD0zX8Qj5Q7Me/HlvgOO+SK8mCO3mXBPL5eumSW9TOfi5csfCMXMGENTR1yXVjYbfY
	JpN/3w0+7zdn2QP6XhC9CznHv9KW1F664VlFhp4koNDubavw6YJ3EXadFxY0IswrcYCR
	aMjCp7HXiHT4l11grsyMZrJPLvFWPmvMENYAE=
Received: by 10.115.21.20 with SMTP id y20mr6232535wai.84.1274798238141;
	Tue, 25 May 2010 07:37:18 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f11sm48284903wai.11.2010.05.25.07.37.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 07:37:15 -0700 (PDT)
Date: Tue, 25 May 2010 07:37:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525143703.GA26493@gmail.com>
References: <1274794225-16222-1-git-send-email-Martin.Jansa@gmail.com>
	<1274794225-16222-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274794225-16222-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] linux-openmoko: drop 2.6.31 and shr-drm-devel (2.6.29-rc3+drm patches) version
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
X-List-Received-Date: Tue, 25 May 2010 14:41:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (25/05/10 15:30), Martin Jansa wrote:
> * 2.6.32 version is superior in all aspects
> * this versions have WSOD issue on every resume (so not as usable as
>   2.6.32 where it's fixed)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  .../0001-DRM-for-platform-devices.patch            |  458 ---
>  .../0001-gta02_defconfig-Enable-GLAMO_DRM.patch    |   37 -
>  ...build-with-gcc-4.4.2-which-works-ok-with-.patch |   27 -
>  .../0002-Glamo-DRM-and-KMS-driver.patch            | 3818 --------------------
>  .../0003-Work-on-Glamo-core-for-DRM.patch          |  252 --
>  .../0004-Add-JBT6k74-hook-for-use-by-KMS.patch     |   49 -
>  .../0004-gta02_defconfig-Enable-UBI-support.patch  |   67 -
>  .../0005-gta02_defconfig-Enable-UBI-debug.patch    |   88 -
>  ...a02-defconfig-enable-NFS-and-INOTIFY_USER.patch |  124 -
>  ...a02_defconfig-disable-LEDS_GTA02_VIBRATOR.patch |   25 -
>  recipes/linux/linux-openmoko-2.6.31_git.bb         |   38 -
>  .../0001-Add-drm-to-Makefile-version.patch         |   25 -
>  ...efconfig-start-from-gta02_packaging_defco.patch |  129 -
>  .../0005-Enable-DRM-and-MFD_GLAMO_DRM.patch        |   51 -
>  ...06-Enable-I2C_ALGOBIT-from-make-oldconfig.patch |   33 -
>  .../0007-Enable-UBI-UBIFS.patch                    |   81 -
>  .../linux-openmoko-shr-drm-devel/fix-install.patch |   23 -
>  recipes/linux/linux-openmoko-shr-drm-devel_git.bb  |   31 -
>  18 files changed, 0 insertions(+), 5356 deletions(-)
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0001-DRM-for-platform-devices.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0001-gta02_defconfig-Enable-GLAMO_DRM.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0002-Glamo-DRM-and-KMS-driver.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0003-Work-on-Glamo-core-for-DRM.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0004-Add-JBT6k74-hook-for-use-by-KMS.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0004-gta02_defconfig-Enable-UBI-support.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0005-gta02_defconfig-Enable-UBI-debug.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0006-gta02-defconfig-enable-NFS-and-INOTIFY_USER.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31/0007-gta02_defconfig-disable-LEDS_GTA02_VIBRATOR.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.31_git.bb
>  delete mode 100644 recipes/linux/linux-openmoko-shr-drm-devel/0001-Add-drm-to-Makefile-version.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-drm-devel/0004-gta02_drm_defconfig-start-from-gta02_packaging_defco.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-drm-devel/0005-Enable-DRM-and-MFD_GLAMO_DRM.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-drm-devel/0006-Enable-I2C_ALGOBIT-from-make-oldconfig.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-drm-devel/0007-Enable-UBI-UBIFS.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-drm-devel/fix-install.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-drm-devel_git.bb
> 
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0001-DRM-for-platform-devices.patch b/recipes/linux/linux-openmoko-2.6.31/0001-DRM-for-platform-devices.patch
> deleted file mode 100644
> index 2c9b611..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0001-DRM-for-platform-devices.patch
> +++ /dev/null
> @@ -1,458 +0,0 @@
> -From da270cf61e67d912b38e314719511efc4c2ea085 Mon Sep 17 00:00:00 2001
> -From: Thomas White <taw@bitwiz.org.uk>
> -Date: Tue, 20 Oct 2009 15:52:30 +0200
> -Subject: [PATCH 1/4] DRM for platform devices
> -
> -This modifies the DRM core in a small number of places to allow platform
> -devices to be used for direct rendering, alongside PCI devices.
> -
> -Signed-off-by: Thomas White <taw@bitwiz.org.uk>
> ----
> - drivers/gpu/drm/Kconfig     |    2 +-
> - drivers/gpu/drm/drm_bufs.c  |    2 +-
> - drivers/gpu/drm/drm_drv.c   |   27 ++++++++++
> - drivers/gpu/drm/drm_info.c  |   27 ++++++++--
> - drivers/gpu/drm/drm_ioctl.c |  118 ++++++++++++++++++++++++++++++-------------
> - drivers/gpu/drm/drm_stub.c  |   76 +++++++++++++++++++++++++++-
> - drivers/gpu/drm/drm_sysfs.c |    6 ++-
> - include/drm/drmP.h          |   13 +++++
> - 8 files changed, 224 insertions(+), 47 deletions(-)
> -
> -diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> -index 39b393d..cef3d2c 100644
> ---- a/drivers/gpu/drm/Kconfig
> -+++ b/drivers/gpu/drm/Kconfig
> -@@ -6,7 +6,7 @@
> - #
> - menuconfig DRM
> - 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
> --	depends on (AGP || AGP=n) && PCI && !EMULATED_CMPXCHG && MMU
> -+	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && MMU
> - 	select I2C
> - 	select I2C_ALGOBIT
> - 	help
> -diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> -index 6246e3f..b9f15bf 100644
> ---- a/drivers/gpu/drm/drm_bufs.c
> -+++ b/drivers/gpu/drm/drm_bufs.c
> -@@ -188,7 +188,7 @@ static int drm_addmap_core(struct drm_device * dev, resource_size_t offset,
> - 	switch (map->type) {
> - 	case _DRM_REGISTERS:
> - 	case _DRM_FRAME_BUFFER:
> --#if !defined(__sparc__) && !defined(__alpha__) && !defined(__ia64__) && !defined(__powerpc64__) && !defined(__x86_64__)
> -+#if !defined(__sparc__) && !defined(__alpha__) && !defined(__ia64__) && !defined(__powerpc64__) && !defined(__x86_64__) && !defined(__arm__)
> - 		if (map->offset + (map->size-1) < map->offset ||
> - 		    map->offset < virt_to_phys(high_memory)) {
> - 			kfree(map);
> -diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> -index b39d7bf..a7861e8 100644
> ---- a/drivers/gpu/drm/drm_drv.c
> -+++ b/drivers/gpu/drm/drm_drv.c
> -@@ -247,6 +247,7 @@ int drm_lastclose(struct drm_device * dev)
> -  */
> - int drm_init(struct drm_driver *driver)
> - {
> -+#ifdef CONFIG_PCI
> - 	struct pci_dev *pdev = NULL;
> - 	const struct pci_device_id *pid;
> - 	int i;
> -@@ -280,11 +281,37 @@ int drm_init(struct drm_driver *driver)
> - 			drm_get_dev(pdev, pid, driver);
> - 		}
> - 	}
> -+#endif
> - 	return 0;
> - }
> - 
> - EXPORT_SYMBOL(drm_init);
> - 
> -+/**
> -+ * Call this to associate a drm_driver with a platform_device.
> -+ *
> -+ * \return zero on success or a negative number on failure.
> -+ *
> -+ * This is a replacement for drm_init(), but for platform drivers.
> -+ * In this case, the caller must provide the matching platform_device
> -+ *
> -+ * since there is no physical bus to scan through.
> -+ *
> -+ * \sa drm_init
> -+ *
> -+ */
> -+int drm_platform_init(struct drm_driver *driver, struct platform_device *pdev,
> -+		      void *priv)
> -+{
> -+	DRM_DEBUG("\n");
> -+
> -+	INIT_LIST_HEAD(&driver->device_list);
> -+
> -+	return drm_get_platform_dev(pdev, driver, priv);
> -+}
> -+
> -+EXPORT_SYMBOL(drm_platform_init);
> -+
> - void drm_exit(struct drm_driver *driver)
> - {
> - 	struct drm_device *dev, *tmp;
> -diff --git a/drivers/gpu/drm/drm_info.c b/drivers/gpu/drm/drm_info.c
> -index f0f6c6b..838c2ee 100644
> ---- a/drivers/gpu/drm/drm_info.c
> -+++ b/drivers/gpu/drm/drm_info.c
> -@@ -52,12 +52,28 @@ int drm_name_info(struct seq_file *m, void *data)
> - 		return 0;
> - 
> - 	if (master->unique) {
> --		seq_printf(m, "%s %s %s\n",
> --			   dev->driver->pci_driver.name,
> --			   pci_name(dev->pdev), master->unique);
> -+
> -+		if (drm_core_is_platform(dev)) {
> -+			seq_printf(m, "%s %s %s\n",
> -+				   dev->driver->name,
> -+				   dev_name(&dev->platform_dev->dev),
> -+				   master->unique);
> -+		} else {
> -+			seq_printf(m, "%s %s %s\n",
> -+				   dev->driver->pci_driver.name,
> -+				   pci_name(dev->pdev), master->unique);
> -+		}
> -+
> - 	} else {
> --		seq_printf(m, "%s %s\n", dev->driver->pci_driver.name,
> --			   pci_name(dev->pdev));
> -+
> -+		if (drm_core_is_platform(dev)) {
> -+			seq_printf(m, "%s %s\n", dev->driver->name,
> -+				   dev_name(&dev->platform_dev->dev));
> -+		} else {
> -+			seq_printf(m, "%s %s\n", dev->driver->pci_driver.name,
> -+				   pci_name(dev->pdev));
> -+		}
> -+
> - 	}
> - 
> - 	return 0;
> -@@ -325,4 +341,3 @@ int drm_vma_info(struct seq_file *m, void *data)
> - }
> - 
> - #endif
> --
> -diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> -index 9b9ff46..133ef29 100644
> ---- a/drivers/gpu/drm/drm_ioctl.c
> -+++ b/drivers/gpu/drm/drm_ioctl.c
> -@@ -83,7 +83,6 @@ int drm_setunique(struct drm_device *dev, void *data,
> - {
> - 	struct drm_unique *u = data;
> - 	struct drm_master *master = file_priv->master;
> --	int domain, bus, slot, func, ret;
> - 
> - 	if (master->unique_len || master->unique)
> - 		return -EBUSY;
> -@@ -101,28 +100,46 @@ int drm_setunique(struct drm_device *dev, void *data,
> - 
> - 	master->unique[master->unique_len] = '\0';
> - 
> --	dev->devname = kmalloc(strlen(dev->driver->pci_driver.name) +
> --			       strlen(master->unique) + 2, GFP_KERNEL);
> --	if (!dev->devname)
> --		return -ENOMEM;
> -+	if ( !drm_core_is_platform(dev) ) {
> - 
> --	sprintf(dev->devname, "%s@%s", dev->driver->pci_driver.name,
> --		master->unique);
> -+		int domain, bus, slot, func, ret;
> - 
> --	/* Return error if the busid submitted doesn't match the device's actual
> --	 * busid.
> --	 */
> --	ret = sscanf(master->unique, "PCI:%d:%d:%d", &bus, &slot, &func);
> --	if (ret != 3)
> --		return -EINVAL;
> --	domain = bus >> 8;
> --	bus &= 0xff;
> -+		/* PCI device */
> -+		dev->devname = kmalloc(strlen(dev->driver->pci_driver.name) +
> -+				       strlen(master->unique) + 2, GFP_KERNEL);
> -+		if (!dev->devname)
> -+			return -ENOMEM;
> - 
> --	if ((domain != drm_get_pci_domain(dev)) ||
> --	    (bus != dev->pdev->bus->number) ||
> --	    (slot != PCI_SLOT(dev->pdev->devfn)) ||
> --	    (func != PCI_FUNC(dev->pdev->devfn)))
> --		return -EINVAL;
> -+		sprintf(dev->devname, "%s@%s", dev->driver->pci_driver.name,
> -+			master->unique);
> -+
> -+		/* Return error if the busid submitted doesn't match the
> -+		 * device's actual busid.
> -+		 */
> -+		ret = sscanf(master->unique, "PCI:%d:%d:%d", &bus, &slot, &func);
> -+		if (ret != 3)
> -+			return -EINVAL;
> -+		domain = bus >> 8;
> -+		bus &= 0xff;
> -+
> -+		if ((domain != drm_get_pci_domain(dev)) ||
> -+		    (bus != dev->pdev->bus->number) ||
> -+		    (slot != PCI_SLOT(dev->pdev->devfn)) ||
> -+		    (func != PCI_FUNC(dev->pdev->devfn)))
> -+			return -EINVAL;
> -+
> -+	} else {
> -+
> -+		/* Platform device */
> -+		dev->devname = kmalloc(strlen(dev->driver->name) +
> -+		                       strlen(master->unique) + 2, GFP_KERNEL);
> -+		if (!dev->devname)
> -+			return -ENOMEM;
> -+
> -+		sprintf(dev->devname, "%s@%s", dev->driver->name,
> -+			master->unique);
> -+
> -+	}
> - 
> - 	return 0;
> - }
> -@@ -141,23 +158,52 @@ static int drm_set_busid(struct drm_device *dev, struct drm_file *file_priv)
> - 	if (master->unique == NULL)
> - 		return -ENOMEM;
> - 
> --	len = snprintf(master->unique, master->unique_len, "pci:%04x:%02x:%02x.%d",
> --		       drm_get_pci_domain(dev),
> --		       dev->pdev->bus->number,
> --		       PCI_SLOT(dev->pdev->devfn),
> --		       PCI_FUNC(dev->pdev->devfn));
> --	if (len >= master->unique_len)
> --		DRM_ERROR("buffer overflow");
> --	else
> --		master->unique_len = len;
> --
> --	dev->devname = kmalloc(strlen(dev->driver->pci_driver.name) +
> --			       master->unique_len + 2, GFP_KERNEL);
> --	if (dev->devname == NULL)
> --		return -ENOMEM;
> -+	if ( !drm_core_is_platform(dev) ) {
> -+
> -+		/* PCI device */
> - 
> --	sprintf(dev->devname, "%s@%s", dev->driver->pci_driver.name,
> --		master->unique);
> -+		len = snprintf(master->unique, master->unique_len,
> -+			       "pci:%04x:%02x:%02x.%d",
> -+			       drm_get_pci_domain(dev),
> -+			       dev->pdev->bus->number,
> -+			       PCI_SLOT(dev->pdev->devfn),
> -+			       PCI_FUNC(dev->pdev->devfn));
> -+		if (len >= master->unique_len)
> -+			DRM_ERROR("buffer overflow");
> -+		else
> -+			master->unique_len = len;
> -+
> -+		dev->devname = kmalloc(strlen(dev->driver->pci_driver.name) +
> -+				       master->unique_len + 2, GFP_KERNEL);
> -+		if (dev->devname == NULL)
> -+			return -ENOMEM;
> -+
> -+		sprintf(dev->devname, "%s@%s", dev->driver->pci_driver.name,
> -+			master->unique);
> -+
> -+	} else {
> -+
> -+		/* Platform device */
> -+
> -+		int len;
> -+
> -+		len = snprintf(master->unique, master->unique_len,
> -+				"platform:%s", dev->platform_dev->name);
> -+
> -+		if (len >= master->unique_len)
> -+			DRM_ERROR("buffer overflow");
> -+		else
> -+			master->unique_len = len;
> -+
> -+		dev->devname = kmalloc(strlen(dev->driver->name)
> -+		                        + master->unique_len + 2, GFP_KERNEL);
> -+		if (dev->devname == NULL)
> -+			return -ENOMEM;
> -+
> -+		sprintf(dev->devname, "%s@%s", dev->driver->name,
> -+			master->unique);
> -+
> -+	}
> - 
> - 	return 0;
> - }
> -diff --git a/drivers/gpu/drm/drm_stub.c b/drivers/gpu/drm/drm_stub.c
> -index 55bb8a8..a7069ad 100644
> ---- a/drivers/gpu/drm/drm_stub.c
> -+++ b/drivers/gpu/drm/drm_stub.c
> -@@ -230,8 +230,10 @@ static int drm_fill_in_dev(struct drm_device * dev, struct pci_dev *pdev,
> - 	idr_init(&dev->drw_idr);
> - 
> - 	dev->pdev = pdev;
> --	dev->pci_device = pdev->device;
> --	dev->pci_vendor = pdev->vendor;
> -+	if (pdev) {
> -+		dev->pci_device = pdev->device;
> -+		dev->pci_vendor = pdev->vendor;
> -+	}
> - 
> - #ifdef __alpha__
> - 	dev->hose = pdev->sysdata;
> -@@ -449,6 +451,76 @@ err_g1:
> - EXPORT_SYMBOL(drm_get_dev);
> - 
> - /**
> -+ *
> -+ * Register a platform device as a DRM device
> -+ *
> -+ * \param pdev - platform device structure
> -+ * \param driver - the matching drm_driver structure
> -+ * \return zero on success or a negative number on failure.
> -+ *
> -+ * Attempt to gets inter module "drm" information. If we are first
> -+ * then register the character device and inter module information.
> -+ * Try and register, if we fail to register, backout previous work.
> -+ *
> -+ * \sa drm_get_dev
> -+ */
> -+int drm_get_platform_dev(struct platform_device *pdev,
> -+                         struct drm_driver *driver, void *priv)
> -+{
> -+	struct drm_device *dev;
> -+	int ret;
> -+	DRM_DEBUG("\n");
> -+
> -+	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
> -+	if (!dev)
> -+		return -ENOMEM;
> -+	dev->dev_private = priv;
> -+
> -+	if ((ret = drm_fill_in_dev(dev, NULL, NULL, driver))) {
> -+		printk(KERN_ERR "DRM: Fill_in_dev failed.\n");
> -+		goto err_g1;
> -+	}
> -+	dev->platform_dev = pdev;
> -+
> -+	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> -+		ret = drm_get_minor(dev, &dev->control, DRM_MINOR_CONTROL);
> -+		if (ret)
> -+			goto err_g2;
> -+	}
> -+
> -+	if ((ret = drm_get_minor(dev, &dev->primary, DRM_MINOR_LEGACY)))
> -+		goto err_g3;
> -+
> -+	if (dev->driver->load) {
> -+		ret = dev->driver->load(dev, 0);
> -+		if (ret)
> -+			goto err_g3;
> -+	}
> -+
> -+        /* setup the grouping for the legacy output */
> -+	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> -+		ret = drm_mode_group_init_legacy_group(dev, &dev->primary->mode_group);
> -+		if (ret)
> -+			goto err_g3;
> -+	}
> -+
> -+	list_add_tail(&dev->driver_item, &driver->device_list);
> -+
> -+	DRM_INFO("Initialized %s %d.%d.%d %s on minor %d\n",
> -+	driver->name, driver->major, driver->minor, driver->patchlevel,
> -+	driver->date, dev->primary->index);
> -+
> -+	return 0;
> -+
> -+err_g3:
> -+	drm_put_minor(&dev->primary);
> -+err_g2:
> -+err_g1:
> -+	kfree(dev);
> -+	return ret;
> -+}
> -+
> -+/**
> -  * Put a secondary minor number.
> -  *
> -  * \param sec_minor - structure to be released
> -diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> -index f7a615b..fea2b71 100644
> ---- a/drivers/gpu/drm/drm_sysfs.c
> -+++ b/drivers/gpu/drm/drm_sysfs.c
> -@@ -482,7 +482,11 @@ int drm_sysfs_device_add(struct drm_minor *minor)
> - 	int err;
> - 	char *minor_str;
> - 
> --	minor->kdev.parent = &minor->dev->pdev->dev;
> -+	if (minor->dev->pdev) {
> -+		minor->kdev.parent = &minor->dev->pdev->dev;
> -+	} else {
> -+		minor->kdev.parent = &minor->dev->platform_dev->dev;
> -+	}
> - 	minor->kdev.class = drm_class;
> - 	minor->kdev.release = drm_sysfs_device_release;
> - 	minor->kdev.devt = minor->device;
> -diff --git a/include/drm/drmP.h b/include/drm/drmP.h
> -index 45b67d9..66253f9 100644
> ---- a/include/drm/drmP.h
> -+++ b/include/drm/drmP.h
> -@@ -55,6 +55,7 @@
> - #include <linux/mm.h>
> - #include <linux/cdev.h>
> - #include <linux/mutex.h>
> -+#include <linux/platform_device.h>
> - #if defined(__alpha__) || defined(__powerpc__)
> - #include <asm/pgtable.h>	/* For pte_wrprotect */
> - #endif
> -@@ -113,6 +114,7 @@ extern void drm_ut_debug_printk(unsigned int request_level,
> - #define DRIVER_IRQ_VBL2    0x800
> - #define DRIVER_GEM         0x1000
> - #define DRIVER_MODESET     0x2000
> -+#define DRIVER_IS_PLATFORM 0x4000
> - 
> - /***********************************************************************/
> - /** \name Begin the DRM... */
> -@@ -981,6 +983,7 @@ struct drm_device {
> - 	wait_queue_head_t buf_writers;	/**< Processes waiting to ctx switch */
> - 
> - 	struct drm_agp_head *agp;	/**< AGP data */
> -+	struct platform_device *platform_dev;  /**< platform device structure */
> - 
> - 	struct pci_dev *pdev;		/**< PCI device structure */
> - 	int pci_vendor;			/**< PCI vendor id */
> -@@ -1091,12 +1094,20 @@ static inline int drm_mtrr_del(int handle, unsigned long offset,
> - }
> - #endif
> - 
> -+static inline int drm_core_is_platform(struct drm_device *dev)
> -+{
> -+	return drm_core_check_feature(dev, DRIVER_IS_PLATFORM);
> -+}
> -+
> - /******************************************************************/
> - /** \name Internal function definitions */
> - /*@{*/
> - 
> - 				/* Driver support (drm_drv.h) */
> - extern int drm_init(struct drm_driver *driver);
> -+extern int drm_platform_init(struct drm_driver *driver,
> -+			     struct platform_device *pdev,
> -+			     void *dev_private);
> - extern void drm_exit(struct drm_driver *driver);
> - extern int drm_ioctl(struct inode *inode, struct file *filp,
> - 		     unsigned int cmd, unsigned long arg);
> -@@ -1314,6 +1325,8 @@ extern int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> - 				struct drm_file *file_priv);
> - struct drm_master *drm_master_create(struct drm_minor *minor);
> - extern struct drm_master *drm_master_get(struct drm_master *master);
> -+extern int drm_get_platform_dev(struct platform_device *pdev,
> -+				struct drm_driver *driver, void *priv);
> - extern void drm_master_put(struct drm_master **master);
> - extern int drm_get_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
> - 		       struct drm_driver *driver);
> --- 
> -1.6.5.3
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0001-gta02_defconfig-Enable-GLAMO_DRM.patch b/recipes/linux/linux-openmoko-2.6.31/0001-gta02_defconfig-Enable-GLAMO_DRM.patch
> deleted file mode 100644
> index 94fced1..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0001-gta02_defconfig-Enable-GLAMO_DRM.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 6cc1ca971b357db4760a40729728c05e403857d7 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Thu, 19 Nov 2009 11:39:51 +0100
> -Subject: [PATCH] gta02_defconfig: Enable GLAMO_DRM
> -
> ----
> - arch/arm/configs/gta02_defconfig |    7 ++++++-
> - 1 files changed, 6 insertions(+), 1 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_defconfig b/arch/arm/configs/gta02_defconfig
> -index 0f53baf..1cce709 100644
> ---- a/arch/arm/configs/gta02_defconfig
> -+++ b/arch/arm/configs/gta02_defconfig
> -@@ -1000,14 +1000,19 @@ CONFIG_PCF50633_GPIO=y
> - # CONFIG_EZX_PCAP is not set
> - # CONFIG_MFD_PCF50606 is not set
> - CONFIG_MFD_GLAMO=y
> --CONFIG_MFD_GLAMO_FB=y
> -+# CONFIG_MFD_GLAMO_FB is not set
> - CONFIG_MFD_GLAMO_GPIO=y
> - CONFIG_MFD_GLAMO_MCI=y
> -+CONFIG_MFD_GLAMO_DRM=y
> - # CONFIG_MEDIA_SUPPORT is not set
> - 
> - #
> - # Graphics support
> - #
> -+CONFIG_DRM=y
> -+# CONFIG_DRM_MGA is not set
> -+# CONFIG_DRM_VIA is not set
> -+# CONFIG_DRM_SAVAGE is not set
> - # CONFIG_VGASTATE is not set
> - CONFIG_VIDEO_OUTPUT_CONTROL=y
> - CONFIG_FB=y
> --- 
> -1.6.5.3
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch b/recipes/linux/linux-openmoko-2.6.31/0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch
> deleted file mode 100644
> index c6b989f..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 63b619f9466dc36648d082dc4e4fad714a343d80 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 7 Nov 2009 20:33:06 +0100
> -Subject: [PATCH 1/5] wm8753: fix build with gcc-4.4.2, which works ok with 4.1.2
> -
> ----
> - sound/soc/codecs/wm8753.c |    4 +++-
> - 1 files changed, 3 insertions(+), 1 deletions(-)
> -
> -diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
> -index d80d414..1e685b2 100644
> ---- a/sound/soc/codecs/wm8753.c
> -+++ b/sound/soc/codecs/wm8753.c
> -@@ -709,7 +709,9 @@ static void pll_factors(struct _pll_div *pll_div, unsigned int target,
> - 	Nmod = target % source;
> - 	Kpart = FIXED_PLL_SIZE * (long long)Nmod;
> - 
> --	do_div(Kpart, source);
> -+	// with this, gcc-4.4.2 emits the reference to uldivmod, but then optimizes it out
> -+	//do_div(Kpart, source);
> -+	__do_div_asm(Kpart, source);
> - 
> - 	K = Kpart & 0xFFFFFFFF;
> - 
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0002-Glamo-DRM-and-KMS-driver.patch b/recipes/linux/linux-openmoko-2.6.31/0002-Glamo-DRM-and-KMS-driver.patch
> deleted file mode 100644
> index 4a837e9..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0002-Glamo-DRM-and-KMS-driver.patch
> +++ /dev/null
> @@ -1,3818 +0,0 @@
> -From 01435b6f8fba2031e6941756a6a4e42be553f4a0 Mon Sep 17 00:00:00 2001
> -From: Thomas White <taw@bitwiz.org.uk>
> -Date: Tue, 20 Oct 2009 16:14:55 +0200
> -Subject: [PATCH 2/4] Glamo DRM and KMS driver
> -
> -This adds the Glamo DRM and KMS driver, but not the modifications needed
> -elsewhere to support it.
> -
> -Signed-off-by: Thomas White <taw@bitwiz.org.uk>
> ----
> - drivers/gpu/drm/drm_stub.c            |    2 +-
> - drivers/mfd/glamo/Kconfig             |   15 +
> - drivers/mfd/glamo/Makefile            |    5 +-
> - drivers/mfd/glamo/glamo-buffer.c      |  372 ++++++++++++++
> - drivers/mfd/glamo/glamo-buffer.h      |   60 +++
> - drivers/mfd/glamo/glamo-cmdq.c        |  528 ++++++++++++++++++++
> - drivers/mfd/glamo/glamo-cmdq.h        |   49 ++
> - drivers/mfd/glamo/glamo-display.c     |  875 +++++++++++++++++++++++++++++++++
> - drivers/mfd/glamo/glamo-display.h     |   39 ++
> - drivers/mfd/glamo/glamo-drm-drv.c     |  453 +++++++++++++++++
> - drivers/mfd/glamo/glamo-drm-private.h |  156 ++++++
> - drivers/mfd/glamo/glamo-fence.c       |  329 +++++++++++++
> - drivers/mfd/glamo/glamo-fence.h       |   36 ++
> - drivers/mfd/glamo/glamo-kms-fb.c      |  540 ++++++++++++++++++++
> - drivers/mfd/glamo/glamo-kms-fb.h      |   41 ++
> - include/drm/Kbuild                    |    1 +
> - include/drm/glamo_drm.h               |  153 ++++++
> - 17 files changed, 3652 insertions(+), 2 deletions(-)
> - create mode 100644 drivers/mfd/glamo/glamo-buffer.c
> - create mode 100644 drivers/mfd/glamo/glamo-buffer.h
> - create mode 100644 drivers/mfd/glamo/glamo-cmdq.c
> - create mode 100644 drivers/mfd/glamo/glamo-cmdq.h
> - create mode 100644 drivers/mfd/glamo/glamo-display.c
> - create mode 100644 drivers/mfd/glamo/glamo-display.h
> - create mode 100644 drivers/mfd/glamo/glamo-drm-drv.c
> - create mode 100644 drivers/mfd/glamo/glamo-drm-private.h
> - create mode 100644 drivers/mfd/glamo/glamo-fence.c
> - create mode 100644 drivers/mfd/glamo/glamo-fence.h
> - create mode 100644 drivers/mfd/glamo/glamo-kms-fb.c
> - create mode 100644 drivers/mfd/glamo/glamo-kms-fb.h
> - create mode 100644 include/drm/glamo_drm.h
> -
> -diff --git a/drivers/gpu/drm/drm_stub.c b/drivers/gpu/drm/drm_stub.c
> -index a7069ad..5e3d65a 100644
> ---- a/drivers/gpu/drm/drm_stub.c
> -+++ b/drivers/gpu/drm/drm_stub.c
> -@@ -471,7 +471,7 @@ int drm_get_platform_dev(struct platform_device *pdev,
> - 	int ret;
> - 	DRM_DEBUG("\n");
> - 
> --	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
> -+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> - 	if (!dev)
> - 		return -ENOMEM;
> - 	dev->dev_private = priv;
> -diff --git a/drivers/mfd/glamo/Kconfig b/drivers/mfd/glamo/Kconfig
> -index 8c93bcb..375e5db 100644
> ---- a/drivers/mfd/glamo/Kconfig
> -+++ b/drivers/mfd/glamo/Kconfig
> -@@ -39,3 +39,18 @@ config MFD_GLAMO_MCI
> - 	  neo1973 GTA-02.
> - 
> - 	  If unsure, say N.
> -+
> -+config MFD_GLAMO_DRM
> -+	tristate "Glamo direct rendering and kernel modesetting support"
> -+	depends on MFD_GLAMO && DRM
> -+	select FB_CFB_FILLRECT
> -+	select FB_CFB_COPYAREA
> -+	select FB_CFB_IMAGEBLIT
> -+	help
> -+	  Direct Rendering Manager interface for the S-Media Glamo chip, as
> -+	  used in Openmoko FreeRunner (GTA02).
> -+
> -+	  This DRM driver includes kernel modesetting (KMS) support.  As such,
> -+	  do not select MFD_GLAMO_FB above if you choose to enable this option.
> -+
> -+	  If unsure, say N.
> -diff --git a/drivers/mfd/glamo/Makefile b/drivers/mfd/glamo/Makefile
> -index ebf26f7..d5ebf8f 100644
> ---- a/drivers/mfd/glamo/Makefile
> -+++ b/drivers/mfd/glamo/Makefile
> -@@ -1,5 +1,5 @@
> - #
> --# Makefile for the Smedia Glamo framebuffer driver
> -+# Makefile for the Smedia Glamo driver(s)
> - #
> - 
> - obj-$(CONFIG_MFD_GLAMO)			+= glamo-core.o
> -@@ -8,4 +8,7 @@ obj-$(CONFIG_MFD_GLAMO_SPI)		+= glamo-spi.o
> - 
> - obj-$(CONFIG_MFD_GLAMO_FB)		+= glamo-fb.o
> - obj-$(CONFIG_MFD_GLAMO_MCI)		+= glamo-mci.o
> -+obj-$(CONFIG_MFD_GLAMO_DRM)		+= glamo-drm.o
> - 
> -+glamo-drm-objs	:=  glamo-drm-drv.o glamo-cmdq.o glamo-buffer.o \
> -+                    glamo-display.o glamo-kms-fb.o glamo-fence.o
> -diff --git a/drivers/mfd/glamo/glamo-buffer.c b/drivers/mfd/glamo/glamo-buffer.c
> -new file mode 100644
> -index 0000000..45500d3
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-buffer.c
> -@@ -0,0 +1,372 @@
> -+/*
> -+ * SMedia Glamo 336x/337x memory management
> -+ *
> -+ * Copyright (c) 2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> -+ *
> -+ *
> -+ * Memory mapping functions based on i915_gem.c, to which the following
> -+ * notice applies:
> -+ *
> -+ * Copyright Â© 2008 Intel Corporation
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtaining a
> -+ * copy of this software and associated documentation files (the "Software"),
> -+ * to deal in the Software without restriction, including without limitation
> -+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> -+ * and/or sell copies of the Software, and to permit persons to whom the
> -+ * Software is furnished to do so, subject to the following conditions:
> -+ *
> -+ * The above copyright notice and this permission notice (including the next
> -+ * paragraph) shall be included in all copies or substantial portions of the
> -+ * Software.
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> -+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> -+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> -+ * IN THE SOFTWARE.
> -+ *
> -+ * Authors:
> -+ *    Eric Anholt <eric@anholt.net>
> -+ */
> -+
> -+
> -+#include <drm/drmP.h>
> -+#include <drm/glamo_drm.h>
> -+
> -+#include "glamo-drm-private.h"
> -+#include "glamo-cmdq.h"	/* For glamo_cmdq_blank() */
> -+
> -+
> -+struct drm_gem_object *glamo_gem_object_alloc(struct drm_device *dev, int size,
> -+                                              int alignment)
> -+{
> -+	struct drm_gem_object *obj;
> -+	struct glamodrm_handle *gdrm;
> -+	struct drm_glamo_gem_object *gobj;
> -+
> -+	gdrm = dev->dev_private;
> -+
> -+	size = roundup(size, PAGE_SIZE);
> -+
> -+	obj = drm_gem_object_alloc(dev, size);
> -+	if (obj == NULL) return NULL;
> -+
> -+	/* See glamodrm_gem_init_object() below */
> -+	gobj = obj->driver_private;
> -+
> -+	/* Allocate memory for this object in VRAM */
> -+	gobj->block = drm_mm_search_free(gdrm->mmgr, size, alignment, 1);
> -+	if (!gobj->block) {
> -+		goto fail;
> -+	}
> -+	gobj->block = drm_mm_get_block(gobj->block, size, alignment);
> -+	if (!gobj->block) {
> -+		goto fail;
> -+	}
> -+
> -+	/* Arrange for the contents to be set to zero */
> -+	glamo_cmdq_blank(gdrm, obj);
> -+
> -+	return obj;
> -+
> -+fail:
> -+	mutex_lock(&dev->struct_mutex);
> -+	drm_gem_object_unreference(obj);
> -+	mutex_unlock(&dev->struct_mutex);
> -+	printk(KERN_INFO "[glamo-drm] Failed to allocate object\n");
> -+
> -+	return NULL;
> -+}
> -+
> -+
> -+int glamo_ioctl_gem_create(struct drm_device *dev, void *data,
> -+			   struct drm_file *file_priv)
> -+{
> -+	struct drm_glamo_gem_create *args = data;
> -+	struct drm_gem_object *obj;
> -+	int handle, ret, alignment, size;
> -+
> -+	/* Alignment must be a non-zero multiple of 2 */
> -+	alignment = args->alignment;
> -+	if ( alignment < 2 ) alignment = 2;
> -+	if ( alignment % 2 ) alignment *= 2;
> -+
> -+	/* Size must be similarly sanitised */
> -+	size = args->size;
> -+	if ( size < 2 ) size = 2;
> -+	if ( size % 2 ) size += 1;
> -+
> -+	/* Create an object */
> -+	obj = glamo_gem_object_alloc(dev, size, alignment);
> -+	if ( obj == NULL ) return -ENOMEM;
> -+
> -+	/* Create a handle for it */
> -+	ret = drm_gem_handle_create(file_priv, obj, &handle);
> -+	mutex_lock(&dev->struct_mutex);
> -+	drm_gem_object_handle_unreference(obj);
> -+	mutex_unlock(&dev->struct_mutex);
> -+	if (ret) goto fail;
> -+
> -+	/* Return */
> -+	args->handle = handle;
> -+	return 0;
> -+
> -+fail:
> -+	mutex_lock(&dev->struct_mutex);
> -+	drm_gem_object_unreference(obj);
> -+	mutex_unlock(&dev->struct_mutex);
> -+	printk(KERN_INFO "[glamo-drm] Failed to allocate object\n");
> -+	return ret;
> -+}
> -+
> -+
> -+int glamodrm_gem_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
> -+{
> -+	struct drm_gem_object *obj = vma->vm_private_data;
> -+	struct drm_device *dev = obj->dev;
> -+	struct drm_glamo_gem_object *gobj = obj->driver_private;
> -+	struct glamodrm_handle *gdrm = dev->dev_private;
> -+	pgoff_t page_offset;
> -+	unsigned long pfn;
> -+	int ret = 0;
> -+
> -+	/* We don't use vmf->pgoff since that has the fake offset */
> -+	page_offset = ((unsigned long)vmf->virtual_address - vma->vm_start) >>
> -+	               PAGE_SHIFT;
> -+
> -+	mutex_lock(&dev->struct_mutex);
> -+	pfn = ((gdrm->vram->start + GLAMO_OFFSET_FB + gobj->block->start)
> -+	       >> PAGE_SHIFT) + page_offset;
> -+	ret = vm_insert_pfn(vma, (unsigned long)vmf->virtual_address, pfn);
> -+	mutex_unlock(&dev->struct_mutex);
> -+
> -+	switch (ret) {
> -+	case -ENOMEM:
> -+	case -EAGAIN:
> -+		return VM_FAULT_OOM;
> -+	case -EFAULT:
> -+	case -EBUSY:
> -+		DRM_ERROR("can't insert pfn??  fault or busy...\n");
> -+		return VM_FAULT_SIGBUS;
> -+	default:
> -+		return VM_FAULT_NOPAGE;
> -+	}
> -+}
> -+
> -+
> -+static int glamo_gem_create_mmap_offset(struct drm_gem_object *obj)
> -+{
> -+	struct drm_device *dev = obj->dev;
> -+	struct drm_gem_mm *mm = dev->mm_private;
> -+	struct drm_glamo_gem_object *gobj = obj->driver_private;
> -+	struct drm_map_list *list;
> -+	struct drm_local_map *map;
> -+	int ret = 0;
> -+
> -+	/* Set the object up for mmap'ing */
> -+	list = &obj->map_list;
> -+	list->map = kzalloc(sizeof(struct drm_map_list), GFP_KERNEL);
> -+	if (!list->map)
> -+		return -ENOMEM;
> -+
> -+	map = list->map;
> -+	map->type = _DRM_GEM;
> -+	map->size = obj->size;
> -+	map->handle = obj;
> -+
> -+	/* Get a DRM GEM mmap offset allocated... */
> -+	list->file_offset_node = drm_mm_search_free(&mm->offset_manager,
> -+	                                            obj->size / PAGE_SIZE, 0, 0);
> -+	if (!list->file_offset_node) {
> -+		DRM_ERROR("failed to allocate offset for bo %d\n", obj->name);
> -+		ret = -ENOMEM;
> -+		goto out_free_list;
> -+	}
> -+
> -+	list->file_offset_node = drm_mm_get_block(list->file_offset_node,
> -+						  obj->size / PAGE_SIZE, 0);
> -+	if (!list->file_offset_node) {
> -+		ret = -ENOMEM;
> -+		goto out_free_list;
> -+	}
> -+
> -+	list->hash.key = list->file_offset_node->start;
> -+	if (drm_ht_insert_item(&mm->offset_hash, &list->hash)) {
> -+		DRM_ERROR("failed to add to map hash\n");
> -+		goto out_free_mm;
> -+	}
> -+
> -+	/* By now we should be all set, any drm_mmap request on the offset
> -+	 * below will get to our mmap & fault handler */
> -+	gobj->mmap_offset = ((uint64_t) list->hash.key) << PAGE_SHIFT;
> -+
> -+	return 0;
> -+
> -+out_free_mm:
> -+	drm_mm_put_block(list->file_offset_node);
> -+out_free_list:
> -+	kfree(list->map);
> -+
> -+	return ret;
> -+}
> -+
> -+
> -+int glamo_ioctl_gem_mmap(struct drm_device *dev, void *data,
> -+			 struct drm_file *file_priv)
> -+{
> -+	struct drm_glamo_gem_mmap *args = data;
> -+	struct drm_gem_object *obj;
> -+	struct drm_glamo_gem_object *gobj;
> -+	int ret;
> -+
> -+	obj = drm_gem_object_lookup(dev, file_priv, args->handle);
> -+	if (obj == NULL)
> -+		return -EBADF;
> -+
> -+	mutex_lock(&dev->struct_mutex);
> -+
> -+	gobj = obj->driver_private;
> -+	if (!gobj->mmap_offset) {
> -+		ret = glamo_gem_create_mmap_offset(obj);
> -+		if (ret) {
> -+			mutex_unlock(&dev->struct_mutex);
> -+			return ret;
> -+		}
> -+	}
> -+
> -+	args->offset = gobj->mmap_offset;
> -+
> -+	drm_gem_object_unreference(obj);
> -+	mutex_unlock(&dev->struct_mutex);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+int glamo_ioctl_gem_pin(struct drm_device *dev, void *data,
> -+			struct drm_file *file_priv)
> -+{
> -+	printk(KERN_INFO "glamo_ioctl_gem_pin\n");
> -+	return 0;
> -+}
> -+
> -+
> -+int glamo_ioctl_gem_unpin(struct drm_device *dev, void *data,
> -+			  struct drm_file *file_priv)
> -+{
> -+	printk(KERN_INFO "glamo_ioctl_gem_unpin\n");
> -+	return 0;
> -+}
> -+
> -+
> -+int glamo_ioctl_gem_pread(struct drm_device *dev, void *data,
> -+			  struct drm_file *file_priv)
> -+{
> -+	printk(KERN_INFO "glamo_ioctl_gem_pread\n");
> -+	return 0;
> -+}
> -+
> -+
> -+int glamo_ioctl_gem_pwrite(struct drm_device *dev, void *data,
> -+			   struct drm_file *file_priv)
> -+{
> -+	printk(KERN_INFO "glamo_ioctl_gem_pwrite\n");
> -+	return 0;
> -+}
> -+
> -+
> -+int glamodrm_gem_init_object(struct drm_gem_object *obj)
> -+{
> -+	struct drm_glamo_gem_object *gobj;
> -+
> -+	/* Allocate a private structure */
> -+	gobj = kzalloc(sizeof(*gobj), GFP_KERNEL);
> -+	if (!gobj) return -ENOMEM;
> -+
> -+	obj->driver_private = gobj;
> -+	gobj->obj = obj;
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+void glamodrm_gem_free_object(struct drm_gem_object *obj)
> -+{
> -+	struct drm_glamo_gem_object *gobj;
> -+	struct drm_map_list *list;
> -+	struct drm_device *dev;
> -+	struct drm_gem_mm *mm;
> -+	struct drm_local_map *map;
> -+
> -+	dev = obj->dev;
> -+	mm = dev->mm_private;
> -+	gobj = obj->driver_private;
> -+
> -+	/* Free the VRAM */
> -+	if ( gobj->block != NULL ) {
> -+		drm_mm_put_block(gobj->block);
> -+	}
> -+
> -+	/* Release mappings */
> -+	list = &obj->map_list;
> -+	drm_ht_remove_item(&mm->offset_hash, &list->hash);
> -+	if (list->file_offset_node) {
> -+		drm_mm_put_block(list->file_offset_node);
> -+		list->file_offset_node = NULL;
> -+	}
> -+	map = list->map;
> -+	if (map) {
> -+		kfree(map);
> -+		list->map = NULL;
> -+	}
> -+
> -+	/* Free the private structure */
> -+	kfree(obj->driver_private);
> -+}
> -+
> -+
> -+/* Memory management initialisation */
> -+int glamo_buffer_init(struct glamodrm_handle *gdrm)
> -+{
> -+	gdrm->mmgr = kzalloc(sizeof(struct drm_mm), GFP_KERNEL);
> -+	drm_mm_init(gdrm->mmgr, 0, gdrm->vram_size);
> -+
> -+	/* Reserve a scratch buffer.  We do this outside the protections
> -+	 * of the other GEM code.  To do this safely, the allocation must
> -+	 * be a multiple of PAGE_SIZE. */
> -+	gdrm->scratch = drm_mm_search_free(gdrm->mmgr, PAGE_SIZE, 4, 1);
> -+	if ( gdrm->scratch ) {
> -+		gdrm->scratch = drm_mm_get_block(gdrm->scratch, PAGE_SIZE, 4);
> -+	}
> -+	if ( !gdrm->scratch ) {
> -+		printk(KERN_WARNING "[glamo-drm] Couldn't allocate"
> -+		                    " scratch buffer!\n");
> -+	}
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+/* Memory management finalisation */
> -+int glamo_buffer_final(struct glamodrm_handle *gdrm)
> -+{
> -+	drm_mm_takedown(gdrm->mmgr);
> -+	kfree(gdrm->mmgr);
> -+	return 0;
> -+}
> -diff --git a/drivers/mfd/glamo/glamo-buffer.h b/drivers/mfd/glamo/glamo-buffer.h
> -new file mode 100644
> -index 0000000..41f18fd
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-buffer.h
> -@@ -0,0 +1,60 @@
> -+/*
> -+ * SMedia Glamo 336x/337x memory management
> -+ *
> -+ * Copyright (c) 2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ *
> -+ */
> -+
> -+#ifndef __GLAMO_BUFFER_H
> -+#define __GLAMO_BUFFER_H
> -+
> -+#include <drm/drmP.h>
> -+
> -+#include "glamo-drm-private.h"
> -+
> -+extern int glamo_buffer_init(struct glamodrm_handle *gdrm);
> -+extern int glamo_buffer_final(struct glamodrm_handle *gdrm);
> -+
> -+extern int glamodrm_gem_fault(struct vm_area_struct *vma, struct vm_fault *vmf);
> -+
> -+extern int glamodrm_gem_init_object(struct drm_gem_object *obj);
> -+
> -+extern void glamodrm_gem_free_object(struct drm_gem_object *obj);
> -+
> -+extern struct drm_gem_object *glamo_gem_object_alloc(struct drm_device *dev,
> -+                                                     int size, int alignment);
> -+
> -+extern int glamo_ioctl_gem_create(struct drm_device *dev, void *data,
> -+				  struct drm_file *file_priv);
> -+
> -+extern int glamo_ioctl_gem_mmap(struct drm_device *dev, void *data,
> -+				struct drm_file *file_priv);
> -+
> -+extern int glamo_ioctl_gem_pin(struct drm_device *dev, void *data,
> -+			       struct drm_file *file_priv);
> -+
> -+extern int glamo_ioctl_gem_unpin(struct drm_device *dev, void *data,
> -+				 struct drm_file *file_priv);
> -+
> -+extern int glamo_ioctl_gem_pread(struct drm_device *dev, void *data,
> -+				 struct drm_file *file_priv);
> -+
> -+extern int glamo_ioctl_gem_pwrite(struct drm_device *dev, void *data,
> -+				  struct drm_file *file_priv);
> -+
> -+#endif /* __GLAMO_BUFFER_H */
> -diff --git a/drivers/mfd/glamo/glamo-cmdq.c b/drivers/mfd/glamo/glamo-cmdq.c
> -new file mode 100644
> -index 0000000..caedc27
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-cmdq.c
> -@@ -0,0 +1,528 @@
> -+/*
> -+ * SMedia Glamo 336x/337x command queue handling
> -+ *
> -+ * Copyright (C) 2008-2009 Thomas White <taw@bitwiz.org.uk>
> -+ * Copyright (C) 2009 Andreas Pokorny <andreas.pokorny@gmail.com>
> -+ * Based on xf86-video-glamo (see below for details)
> -+ *
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ *
> -+ * Command queue handling functions based on those from xf86-video-glamo, to
> -+ * which the following licence applies:
> -+ *
> -+ * Copyright  2007 OpenMoko, Inc.
> -+ * Copyright Â© 2009 Lars-Peter Clausen <lars@metafoo.de>
> -+ *
> -+ * This driver is based on Xati,
> -+ * Copyright  2004 Eric Anholt
> -+ *
> -+ * Permission to use, copy, modify, distribute, and sell this software and its
> -+ * documentation for any purpose is hereby granted without fee, provided that
> -+ * the above copyright notice appear in all copies and that both that copyright
> -+ * notice and this permission notice appear in supporting documentation, and
> -+ * that the name of the copyright holders not be used in advertising or
> -+ * publicity pertaining to distribution of the software without specific,
> -+ * written prior permission.  The copyright holders make no representations
> -+ * about the suitability of this software for any purpose.  It is provided "as
> -+ * is" without express or implied warranty.
> -+ *
> -+ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> -+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> -+ * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> -+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> -+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> -+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
> -+ * OF THIS SOFTWARE.
> -+ */
> -+
> -+
> -+#include <drm/drmP.h>
> -+#include <drm/glamo_drm.h>
> -+
> -+#include "glamo-core.h"
> -+#include "glamo-drm-private.h"
> -+#include "glamo-regs.h"
> -+
> -+
> -+static inline void reg_write(struct glamodrm_handle *gdrm,
> -+                             u_int16_t reg, u_int16_t val)
> -+{
> -+	iowrite16(val, gdrm->reg_base + reg);
> -+}
> -+
> -+
> -+static inline u16 reg_read(struct glamodrm_handle *gdrm, u_int16_t reg)
> -+{
> -+	return ioread16(gdrm->reg_base + reg);
> -+}
> -+
> -+
> -+static u32 glamo_get_read(struct glamodrm_handle *gdrm)
> -+{
> -+	/* we could turn off clock here */
> -+	u32 ring_read = reg_read(gdrm, GLAMO_REG_CMDQ_READ_ADDRL);
> -+	ring_read |= (reg_read(gdrm, GLAMO_REG_CMDQ_READ_ADDRH) & 0x7) << 16;
> -+
> -+	return ring_read;
> -+}
> -+
> -+
> -+static u32 glamo_get_write(struct glamodrm_handle *gdrm)
> -+{
> -+	u32 ring_write = reg_read(gdrm, GLAMO_REG_CMDQ_WRITE_ADDRL);
> -+	ring_write |= (reg_read(gdrm, GLAMO_REG_CMDQ_WRITE_ADDRH) & 0x7) << 16;
> -+
> -+	return ring_write;
> -+}
> -+
> -+
> -+/* Add commands to the ring buffer */
> -+int glamo_add_to_ring(struct glamodrm_handle *gdrm, u16 *addr,
> -+                      unsigned int count)
> -+{
> -+	size_t ring_write, ring_read;
> -+	size_t new_ring_write;
> -+
> -+	if ( count >= GLAMO_CMDQ_SIZE ) {
> -+		printk(KERN_WARNING "[glamo-drm] CmdQ submission too large\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	down(&gdrm->add_to_ring);
> -+
> -+	ring_write = glamo_get_write(gdrm);
> -+
> -+	/* Calculate where we'll end up */
> -+	new_ring_write = (ring_write + count) % GLAMO_CMDQ_SIZE;
> -+
> -+	/* Wait until there is enough space to queue the cmd buffer */
> -+	if (new_ring_write > ring_write) {
> -+		/* Loop while the read pointer is between the old and new
> -+		 * positions */
> -+		do {
> -+			ring_read = glamo_get_read(gdrm);
> -+		} while (ring_read > ring_write && ring_read < new_ring_write);
> -+	} else {
> -+		/* Same, but kind of inside-out */
> -+		do {
> -+			ring_read = glamo_get_read(gdrm);
> -+		} while (ring_read > ring_write || ring_read < new_ring_write);
> -+	}
> -+
> -+	/* Are we about to wrap around? */
> -+	if (ring_write >= new_ring_write) {
> -+
> -+		u32 rest_size;
> -+
> -+		/* Wrap around */
> -+		rest_size = GLAMO_CMDQ_SIZE - ring_write; /* Space left */
> -+
> -+		/* Write from current position to end */
> -+		memcpy_toio(gdrm->cmdq_base+ring_write, addr, rest_size);
> -+
> -+		/* Write from start */
> -+		memcpy_toio(gdrm->cmdq_base, addr+(rest_size>>1),
> -+		            count - rest_size);
> -+
> -+		/* ring_write being 0 will result in a deadlock because the
> -+		 * cmdq read will never stop. To avoid such an behaviour insert
> -+		 * an empty instruction. */
> -+		if (new_ring_write == 0) {
> -+			iowrite16(0x0000, gdrm->cmdq_base);
> -+			iowrite16(0x0000, gdrm->cmdq_base + 2);
> -+			new_ring_write = 4;
> -+		}
> -+
> -+	} else {
> -+
> -+		memcpy_toio(gdrm->cmdq_base+ring_write, addr, count);
> -+
> -+	}
> -+
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_WRITE_ADDRH,
> -+			(new_ring_write >> 16) & 0x7f);
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_WRITE_ADDRL,
> -+			new_ring_write & 0xffff);
> -+
> -+	if ( !(reg_read(gdrm, GLAMO_REG_CMDQ_STATUS) & 1<<3)  ) {
> -+		printk(KERN_ERR "[glamo-drm] CmdQ decode failure.\n");
> -+	}
> -+
> -+	up(&gdrm->add_to_ring);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+/* Return true for a legal sequence of commands, otherwise false */
> -+static int glamo_sanitize_buffer(u16 *cmds, unsigned int count)
> -+{
> -+	/* XXX FIXME TODO: Implementation... */
> -+	return 1;
> -+}
> -+
> -+
> -+/* Substitute the real addresses in VRAM for any required buffer objects */
> -+static int glamo_do_relocation(struct glamodrm_handle *gdrm,
> -+                               drm_glamo_cmd_buffer_t *cbuf, u16 *cmds,
> -+                               struct drm_device *dev,
> -+                               struct drm_file *file_priv)
> -+{
> -+	u32 *handles;
> -+	int *offsets;
> -+	int nobjs =  cbuf->nobjs;
> -+	int i;
> -+
> -+	if ( nobjs > 32 ) return -EINVAL;	/* Get real... */
> -+
> -+	handles = kmalloc(nobjs*sizeof(u32), GFP_KERNEL);
> -+	if ( handles == NULL ) return -1;
> -+	if ( copy_from_user(handles, cbuf->objs, nobjs*sizeof(u32)) )
> -+		return -1;
> -+
> -+	offsets = kmalloc(nobjs*sizeof(int), GFP_KERNEL);
> -+	if ( offsets == NULL ) return -1;
> -+	if ( copy_from_user(offsets, cbuf->obj_pos, nobjs*sizeof(int)) )
> -+		return -1;
> -+
> -+	for ( i=0; i<nobjs; i++ ) {
> -+
> -+		u32 handle = handles[i];
> -+		int offset = offsets[i];
> -+		struct drm_gem_object *obj;
> -+		struct drm_glamo_gem_object *gobj;
> -+		u32 addr;
> -+		u16 addr_low, addr_high;
> -+
> -+		if ( offset > cbuf->bufsz ) {
> -+			printk(KERN_WARNING "[glamo-drm] Offset out of range"
> -+			                    " for this relocation!\n");
> -+			goto fail;
> -+		}
> -+
> -+		obj = drm_gem_object_lookup(dev, file_priv, handle);
> -+		if ( obj == NULL ) return -1;
> -+
> -+		/* Unref the object now, or it'll never get freed.
> -+		 * This should really happen after the GPU has finished
> -+		 * the commands which are about to be submitted. */
> -+		drm_gem_object_unreference(obj);
> -+
> -+		gobj = obj->driver_private;
> -+		if ( gobj == NULL ) {
> -+			printk(KERN_WARNING "[glamo-drm] This object has no"
> -+			                    " private data!\n");
> -+			goto fail;
> -+		}
> -+
> -+		addr = GLAMO_OFFSET_FB + gobj->block->start;
> -+		addr_low = addr & 0xffff;
> -+		addr_high = (addr >> 16) & 0x7f;
> -+
> -+		/* FIXME: Should really check that the register is a
> -+		 * valid one for this relocation. */
> -+
> -+		*(cmds+(offset/2)+1) = addr_low;
> -+		*(cmds+(offset/2)+3) = addr_high;
> -+
> -+	}
> -+
> -+	kfree(handles);
> -+	kfree(offsets);
> -+	return 0;
> -+
> -+fail:
> -+	kfree(handles);
> -+	kfree(offsets);
> -+	return -1;
> -+}
> -+
> -+
> -+/* This is DRM_IOCTL_GLAMO_CMDBUF */
> -+int glamo_ioctl_cmdbuf(struct drm_device *dev, void *data,
> -+                       struct drm_file *file_priv)
> -+{
> -+	int ret = 0;
> -+	struct glamodrm_handle *gdrm;
> -+	unsigned int count;
> -+	drm_glamo_cmd_buffer_t *cbuf = data;
> -+	u16 *cmds;
> -+
> -+	gdrm = dev->dev_private;
> -+
> -+	count = cbuf->bufsz;
> -+
> -+	if ( count > PAGE_SIZE ) return -EINVAL;
> -+
> -+	cmds = kmalloc(count, GFP_KERNEL);
> -+	if ( cmds == NULL ) return -ENOMEM;
> -+	if ( copy_from_user(cmds, cbuf->buf, count) ) 	{
> -+		printk(KERN_WARNING "[glamo-drm] copy from user failed\n");
> -+		ret = -EINVAL;
> -+		goto cleanup;
> -+	}
> -+
> -+	/* Check the buffer isn't going to tell Glamo to enact naughtiness */
> -+	if ( !glamo_sanitize_buffer(cmds, count) ) {
> -+		printk(KERN_WARNING "[glamo-drm] sanitize buffer failed\n");
> -+		ret = -EINVAL;
> -+		goto cleanup;
> -+	}
> -+
> -+	/* Perform relocation, if necessary */
> -+	if ( cbuf->nobjs ) {
> -+		if ( glamo_do_relocation(gdrm, cbuf, cmds, dev, file_priv) )
> -+		{
> -+			printk(KERN_WARNING "[glamo-drm] Relocation failed\n");
> -+			ret = -EINVAL;
> -+			goto cleanup;
> -+		}
> -+	}
> -+
> -+	glamo_add_to_ring(gdrm, cmds, count);
> -+
> -+cleanup:
> -+	kfree(cmds);
> -+
> -+	return ret;
> -+}
> -+
> -+
> -+/* Return true for a legal sequence of commands, otherwise false */
> -+static int glamo_sanitize_burst(u16 base, u16 *cmds, unsigned int count)
> -+{
> -+	/* XXX FIXME TODO: Implementation... */
> -+	return 1;
> -+}
> -+
> -+
> -+static int glamo_relocate_burst(struct glamodrm_handle *gdrm,
> -+                                drm_glamo_cmd_burst_t *cbuf, u16 *data,
> -+                                struct drm_device *dev,
> -+                                struct drm_file *file_priv)
> -+{
> -+	u32 *handles;
> -+	int *offsets;
> -+	int nobjs =  cbuf->nobjs;
> -+	int i;
> -+
> -+	if ( nobjs > 32 ) return -EINVAL;	/* Get real... */
> -+
> -+	handles = kmalloc(nobjs*sizeof(u32), GFP_KERNEL);
> -+	if ( handles == NULL ) return -1;
> -+	if ( copy_from_user(handles, cbuf->objs, nobjs*sizeof(u32)) )
> -+		return -1;
> -+
> -+	offsets = kmalloc(nobjs*sizeof(int), GFP_KERNEL);
> -+	if ( offsets == NULL ) return -1;
> -+	if ( copy_from_user(offsets, cbuf->obj_pos, nobjs*sizeof(int)) )
> -+		return -1;
> -+
> -+	for ( i=0; i<nobjs; i++ ) {
> -+
> -+		u32 handle = handles[i];
> -+		int offset = offsets[i];
> -+		struct drm_gem_object *obj;
> -+		struct drm_glamo_gem_object *gobj;
> -+		u32 addr;
> -+		u16 addr_low, addr_high;
> -+
> -+		if ( offset > cbuf->bufsz ) {
> -+			printk(KERN_WARNING "[glamo-drm] Offset out of range"
> -+			                    " for this relocation!\n");
> -+			goto fail;
> -+		}
> -+
> -+		obj = drm_gem_object_lookup(dev, file_priv, handle);
> -+		if ( obj == NULL ) return -1;
> -+
> -+		/* Unref the object now, or it'll never get freed.
> -+		 * FIXME: This should really happen after the GPU has
> -+		 * finished executing these commands. */
> -+		drm_gem_object_unreference(obj);
> -+
> -+		gobj = obj->driver_private;
> -+		if ( gobj == NULL ) {
> -+			printk(KERN_WARNING "[glamo-drm] This object has no"
> -+			                    " private data!\n");
> -+			goto fail;
> -+		}
> -+
> -+		addr = GLAMO_OFFSET_FB + gobj->block->start;
> -+		addr_low = addr & 0xffff;
> -+		addr_high = (addr >> 16) & 0x7f;
> -+
> -+		/* FIXME: Should really check that the register is a
> -+		 * valid one for this relocation. */
> -+
> -+		*(data+(offset/2)+0) = addr_low;
> -+		*(data+(offset/2)+1) = addr_high;
> -+
> -+	}
> -+
> -+	kfree(handles);
> -+	kfree(offsets);
> -+	return 0;
> -+
> -+fail:
> -+	kfree(handles);
> -+	kfree(offsets);
> -+	return -1;
> -+}
> -+
> -+
> -+/* This is DRM_IOCTL_GLAMO_CMDBURST */
> -+int glamo_ioctl_cmdburst(struct drm_device *dev, void *data,
> -+                         struct drm_file *file_priv)
> -+{
> -+	int ret = 0;
> -+	struct glamodrm_handle *gdrm;
> -+	drm_glamo_cmd_burst_t *cbuf = data;
> -+	u16 *burst;
> -+	size_t burst_size;
> -+	size_t data_size;
> -+
> -+	gdrm = dev->dev_private;
> -+
> -+	data_size = cbuf->bufsz;
> -+	if ( data_size % 4 ) data_size += 2;
> -+	if ( data_size % 4 ) return -EINVAL;
> -+	burst_size = data_size + 4;  /* Add space for header */
> -+	if ( burst_size > PAGE_SIZE ) return -EINVAL;
> -+
> -+	burst = kmalloc(burst_size, GFP_KERNEL);
> -+	if ( burst == NULL ) return -ENOMEM;
> -+
> -+	/* Get data from userspace */
> -+	if ( copy_from_user(burst+2, cbuf->data, cbuf->bufsz) ) 	{
> -+		printk(KERN_WARNING "[glamo-drm] copy from user failed\n");
> -+		ret = -EINVAL;
> -+		goto cleanup;
> -+	}
> -+
> -+	/* Sanitise */
> -+	if ( !glamo_sanitize_burst(cbuf->base, burst+2, cbuf->bufsz) ) {
> -+		printk(KERN_WARNING "[glamo-drm] sanitize buffer failed\n");
> -+		ret = -EINVAL;
> -+		goto cleanup;
> -+	}
> -+
> -+	/* Relocate */
> -+	if ( cbuf->nobjs ) {
> -+		if ( glamo_relocate_burst(gdrm, cbuf, burst+2, dev, file_priv) )
> -+		{
> -+			printk(KERN_WARNING "[glamo-drm] Relocation failed\n");
> -+			ret = -EINVAL;
> -+			goto cleanup;
> -+		}
> -+	}
> -+
> -+	/* Add burst header */
> -+	burst[0] = 1<<15 | cbuf->base;
> -+	burst[1] = data_size / 2;  /* -> 2-byte words */
> -+	if ( burst[1] & 0x01 ) {
> -+		printk(KERN_CRIT "Burst not aligned!\n");
> -+		goto cleanup;
> -+	}
> -+
> -+	/* Zero-pad if necessary */
> -+	if ( data_size % 4 ) {
> -+		burst[burst_size-1] = 0x0000;
> -+	}
> -+
> -+	/* Add to command queue */
> -+	glamo_add_to_ring(gdrm, burst, burst_size);
> -+
> -+cleanup:
> -+	kfree(burst);
> -+
> -+	return ret;
> -+}
> -+
> -+
> -+int glamo_cmdq_init(struct glamodrm_handle *gdrm)
> -+{
> -+	unsigned int i;
> -+
> -+	init_MUTEX(&gdrm->add_to_ring);
> -+
> -+	/* Enable 2D and 3D */
> -+	glamo_engine_enable(gdrm->glamo_core, GLAMO_ENGINE_2D);
> -+	glamo_engine_reset(gdrm->glamo_core, GLAMO_ENGINE_2D);
> -+
> -+	/* Start by zeroing the command queue memory */
> -+	for ( i=0; i<GLAMO_CMDQ_SIZE; i+=2 ) {
> -+		iowrite16(0x0000, gdrm->cmdq_base+i);
> -+	}
> -+
> -+	glamo_engine_enable(gdrm->glamo_core, GLAMO_ENGINE_CMDQ);
> -+	glamo_engine_reset(gdrm->glamo_core, GLAMO_ENGINE_CMDQ);
> -+
> -+	/* Set up command queue location */
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_BASE_ADDRL,
> -+					GLAMO_OFFSET_CMDQ & 0xffff);
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_BASE_ADDRH,
> -+					(GLAMO_OFFSET_CMDQ >> 16) & 0x7f);
> -+
> -+	/* Length of command queue in 1k blocks, minus one */
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_LEN, (GLAMO_CMDQ_SIZE >> 10)-1);
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_WRITE_ADDRH, 0);
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_WRITE_ADDRL, 0);
> -+	reg_write(gdrm, GLAMO_REG_CMDQ_CONTROL,
> -+	                                 1 << 12 |   /* Turbo flip (?) */
> -+	                                 5 << 8  |   /* no interrupt */
> -+	                                 8 << 4);    /* HQ threshold */
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+int glamo_cmdq_shutdown(struct glamodrm_handle *gdrm)
> -+{
> -+	return 0;
> -+}
> -+
> -+
> -+void glamo_cmdq_suspend(struct glamodrm_handle *gdrm)
> -+{
> -+	/* Placeholder... */
> -+}
> -+
> -+
> -+void glamo_cmdq_resume(struct glamodrm_handle *gdrm)
> -+{
> -+	glamo_cmdq_init(gdrm);
> -+}
> -+
> -+
> -+/* Initialise an object's contents to zero.
> -+ * This is in glamo-cmdq.c in the hope that we can accelerate it later. */
> -+void glamo_cmdq_blank(struct glamodrm_handle *gdrm, struct drm_gem_object *obj)
> -+{
> -+	char __iomem *cookie;
> -+	struct drm_glamo_gem_object *gobj;
> -+	int i;
> -+
> -+	gobj = obj->driver_private;
> -+
> -+	cookie = ioremap(gdrm->vram->start + gobj->block->start, obj->size);
> -+	for ( i=0; i<obj->size; i+=2 ) {
> -+		iowrite16(0, cookie+i);
> -+	}
> -+	iounmap(cookie);
> -+}
> -diff --git a/drivers/mfd/glamo/glamo-cmdq.h b/drivers/mfd/glamo/glamo-cmdq.h
> -new file mode 100644
> -index 0000000..510d195
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-cmdq.h
> -@@ -0,0 +1,49 @@
> -+/* Smedia Glamo 336x/337x command queue handling
> -+ *
> -+ * Copyright (c) 2008-2009 Thomas White <taw@bitwiz.org.uk>
> -+ * Copyright (c) 2009 Andreas Pokorny <andreas.pokorny@gmail.com>
> -+ * Based on xf86-video-glamo
> -+ * Copyright  2007 OpenMoko, Inc.
> -+ * Copyright Â© 2009 Lars-Peter Clausen <lars@metafoo.de>
> -+ *
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ */
> -+
> -+#ifndef __GLAMO_CMDQ_H
> -+#define __GLAMO_CMDQ_H
> -+
> -+#include <drm/drmP.h>
> -+
> -+#include "glamo-drm-private.h"
> -+
> -+extern int glamo_ioctl_cmdbuf(struct drm_device *dev, void *data,
> -+			      struct drm_file *file_priv);
> -+extern int glamo_ioctl_cmdburst(struct drm_device *dev, void *data,
> -+			        struct drm_file *file_priv);
> -+extern void glamo_cmdq_blank(struct glamodrm_handle *gdrm,
> -+                             struct drm_gem_object *obj);
> -+
> -+extern int glamo_cmdq_init(struct glamodrm_handle *gdrm);
> -+extern int glamo_cmdq_shutdown(struct glamodrm_handle *gdrm);
> -+extern void glamo_cmdq_suspend(struct glamodrm_handle *gdrm);
> -+extern void glamo_cmdq_resume(struct glamodrm_handle *gdrm);
> -+
> -+extern int glamo_add_to_ring(struct glamodrm_handle *gdrm, u16 *addr,
> -+                             unsigned int count);
> -+
> -+#endif /* __GLAMO_CMDQ_H */
> -diff --git a/drivers/mfd/glamo/glamo-display.c b/drivers/mfd/glamo/glamo-display.c
> -new file mode 100644
> -index 0000000..93aa917
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-display.c
> -@@ -0,0 +1,875 @@
> -+/*
> -+ * SMedia Glamo 336x/337x display
> -+ *
> -+ * Copyright (C) 2008-2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * Based on glamo-fb.c (C) 2007-2008 by Openmoko, Inc.
> -+ * Author: Harald Welte <laforge@openmoko.org>
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ *
> -+ *
> -+ * Based on intel_display.c and intel_crt.c from drivers/gpu/drm/i915
> -+ *  to which the following licence applies:
> -+ *
> -+ * Copyright Â© 2006-2007 Intel Corporation
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtaining a
> -+ * copy of this software and associated documentation files (the "Software"),
> -+ * to deal in the Software without restriction, including without limitation
> -+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> -+ * and/or sell copies of the Software, and to permit persons to whom the
> -+ * Software is furnished to do so, subject to the following conditions:
> -+ *
> -+ * The above copyright notice and this permission notice (including the next
> -+ * paragraph) shall be included in all copies or substantial portions of the
> -+ * Software.
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> -+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> -+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> -+ * DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * Authors:
> -+ *	Eric Anholt <eric@anholt.net>
> -+ *
> -+ */
> -+
> -+#define DEBUG 1
> -+
> -+#include <drm/drmP.h>
> -+#include <drm/glamo_drm.h>
> -+#include <drm/drm_crtc_helper.h>
> -+#include <drm/drm_crtc.h>
> -+
> -+#include "glamo-core.h"
> -+#include "glamo-drm-private.h"
> -+#include "glamo-regs.h"
> -+#include "glamo-kms-fb.h"
> -+#include "glamo-display.h"
> -+#include <linux/glamofb.h>
> -+
> -+
> -+#define GLAMO_LCD_WIDTH_MASK 0x03FF
> -+#define GLAMO_LCD_HEIGHT_MASK 0x03FF
> -+#define GLAMO_LCD_PITCH_MASK 0x07FE
> -+#define GLAMO_LCD_HV_TOTAL_MASK 0x03FF
> -+#define GLAMO_LCD_HV_RETR_START_MASK 0x03FF
> -+#define GLAMO_LCD_HV_RETR_END_MASK 0x03FF
> -+#define GLAMO_LCD_HV_RETR_DISP_START_MASK 0x03FF
> -+#define GLAMO_LCD_HV_RETR_DISP_END_MASK 0x03FF
> -+
> -+
> -+struct glamofb_par {
> -+	struct drm_device *dev;
> -+	struct drm_display_mode *our_mode;
> -+	struct glamo_framebuffer *glamo_fb;
> -+	int crtc_count;
> -+	/* crtc currently bound to this */
> -+	uint32_t crtc_ids[2];
> -+};
> -+
> -+
> -+static int reg_read_lcd(struct glamodrm_handle *gdrm, u_int16_t reg)
> -+{
> -+	int i = 0;
> -+
> -+	for (i = 0; i != 2; i++)
> -+		nop();
> -+
> -+	return ioread16(gdrm->lcd_base + reg);
> -+}
> -+
> -+
> -+static void reg_write_lcd(struct glamodrm_handle *gdrm,
> -+                          u_int16_t reg, u_int16_t val)
> -+{
> -+	int i = 0;
> -+
> -+	for (i = 0; i != 2; i++)
> -+		nop();
> -+
> -+	iowrite16(val, gdrm->lcd_base + reg);
> -+}
> -+
> -+
> -+static void reg_set_bit_mask_lcd(struct glamodrm_handle *gdrm,
> -+                                 u_int16_t reg, u_int16_t mask,
> -+                                 u_int16_t val)
> -+{
> -+	u_int16_t tmp;
> -+
> -+	val &= mask;
> -+
> -+	tmp = reg_read_lcd(gdrm, reg);
> -+	tmp &= ~mask;
> -+	tmp |= val;
> -+	reg_write_lcd(gdrm, reg, tmp);
> -+}
> -+
> -+
> -+/* Note that this has nothing at all to do with the engine command queue
> -+ * in glamo-cmdq.c */
> -+static inline int glamo_lcd_cmdq_empty(struct glamodrm_handle *gdrm)
> -+{
> -+	/* DGCMdQempty -- 1 == command queue is empty */
> -+	return reg_read_lcd(gdrm, GLAMO_REG_LCD_STATUS1) & (1 << 15);
> -+}
> -+
> -+
> -+/* call holding gfb->lock_cmd  when locking, until you unlock */
> -+int glamo_lcd_cmd_mode(struct glamodrm_handle *gdrm, int on)
> -+{
> -+	int timeout = 2000000;
> -+
> -+	dev_dbg(gdrm->dev, "glamofb_cmd_mode(on=%d)\n", on);
> -+	if (on) {
> -+
> -+		while ((!glamo_lcd_cmdq_empty(gdrm)) && (timeout--))
> -+			/* yield() */;
> -+		if (timeout < 0) {
> -+			printk(KERN_ERR "*************"
> -+			                " LCD command queue never got empty "
> -+			                "*************\n");
> -+			return -EIO;
> -+		}
> -+
> -+		/* display the entire frame then switch to command */
> -+		reg_write_lcd(gdrm, GLAMO_REG_LCD_COMMAND1,
> -+			  GLAMO_LCD_CMD_TYPE_DISP |
> -+			  GLAMO_LCD_CMD_DATA_FIRE_VSYNC);
> -+
> -+		/* wait until lcd idle */
> -+		timeout = 2000000;
> -+		while ((!reg_read_lcd(gdrm, GLAMO_REG_LCD_STATUS2) & (1 << 12))
> -+		          && (timeout--))
> -+			/* yield() */;
> -+		if (timeout < 0) {
> -+			printk(KERN_ERR"*************"
> -+				       " LCD never idle "
> -+				       "*************\n");
> -+			return -EIO;
> -+		}
> -+
> -+		mdelay(100);
> -+
> -+	} else {
> -+		/* RGB interface needs vsync/hsync */
> -+		int mode;
> -+		mode = reg_read_lcd(gdrm, GLAMO_REG_LCD_MODE3);
> -+		if ( mode & GLAMO_LCD_MODE3_RGB)
> -+			reg_write_lcd(gdrm, GLAMO_REG_LCD_COMMAND1,
> -+				  GLAMO_LCD_CMD_TYPE_DISP |
> -+				  GLAMO_LCD_CMD_DATA_DISP_SYNC);
> -+
> -+		reg_write_lcd(gdrm, GLAMO_REG_LCD_COMMAND1,
> -+			  GLAMO_LCD_CMD_TYPE_DISP |
> -+			  GLAMO_LCD_CMD_DATA_DISP_FIRE);
> -+	}
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static struct glamo_script lcd_init_script[] = {
> -+	{ GLAMO_REG_LCD_MODE1, 0x0020 },
> -+	/* no display rotation, no hardware cursor, no dither, no gamma,
> -+	 * no retrace flip, vsync low-active, hsync low active,
> -+	 * no TVCLK, no partial display, hw dest color from fb,
> -+	 * no partial display mode, LCD1, software flip,  */
> -+	{ GLAMO_REG_LCD_MODE2, 0x9020 },
> -+	  /* video flip, no ptr, no ptr, dhclk off,
> -+	   * normal mode,  no cpuif,
> -+	   * res, serial msb first, single fb, no fr ctrl,
> -+	   * cpu if bits all zero, no crc
> -+	   * 0000 0000 0010  0000 */
> -+	{ GLAMO_REG_LCD_MODE3, 0x0b40 },
> -+	  /* src data rgb565, res, 18bit rgb666
> -+	   * 000 01 011 0100 0000 */
> -+	{ GLAMO_REG_LCD_POLARITY, 0x440c },
> -+	  /* DE high active, no cpu/lcd if, cs0 force low, a0 low active,
> -+	   * np cpu if, 9bit serial data, sclk rising edge latch data
> -+	   * 01 00 0 100 0 000 01 0 0 */
> -+	/* The following values assume 640*480@16bpp */
> -+	/* FIXME: fb0 has not yet been allocated! */
> -+	{ GLAMO_REG_LCD_A_BASE1, PAGE_SIZE }, /* display A base address 15:0 */
> -+	{ GLAMO_REG_LCD_A_BASE2, 0x0000 }, /* display A base address 22:16 */
> -+	{ GLAMO_REG_LCD_B_BASE1, 0x6000 }, /* display B base address 15:0 */
> -+	{ GLAMO_REG_LCD_B_BASE2, 0x0009 }, /* display B base address 22:16 */
> -+	{ GLAMO_REG_LCD_CURSOR_BASE1, 0xC000 }, /* cursor base address 15:0 */
> -+	{ GLAMO_REG_LCD_CURSOR_BASE2, 0x0012 }, /* cursor base address 22:16 */
> -+	{ GLAMO_REG_LCD_COMMAND2, 0x0000 }, /* display page A */
> -+};
> -+
> -+
> -+static int glamo_run_lcd_script(struct glamodrm_handle *gdrm,
> -+                                struct glamo_script *script, int len)
> -+{
> -+	int i;
> -+
> -+	for (i = 0; i < len; i++) {
> -+		struct glamo_script *line = &script[i];
> -+
> -+		if (line->reg == 0xffff)
> -+			return 0;
> -+		else if (line->reg == 0xfffe)
> -+			msleep(line->val);
> -+		else
> -+			reg_write_lcd(gdrm, script[i].reg, script[i].val);
> -+	}
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+extern void jbt6k74_action(int val);
> -+
> -+/* Power on/off */
> -+static void glamo_crtc_dpms(struct drm_crtc *crtc, int mode)
> -+{
> -+}
> -+
> -+
> -+static bool glamo_crtc_mode_fixup(struct drm_crtc *crtc,
> -+                                  struct drm_display_mode *mode,
> -+                                  struct drm_display_mode *adjusted_mode)
> -+{
> -+	return true;
> -+}
> -+
> -+
> -+static int glamo_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
> -+                                    struct drm_framebuffer *old_fb)
> -+{
> -+	struct glamodrm_handle *gdrm;
> -+	struct glamo_crtc *gcrtc;
> -+	struct glamo_framebuffer *gfb;
> -+	struct drm_gem_object *obj;
> -+	struct drm_glamo_gem_object *gobj;
> -+	u32 addr;
> -+	u16 addr_low, addr_high;
> -+
> -+	if (!crtc->fb) {
> -+		DRM_DEBUG("No FB bound\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	/* Dig out our handle */
> -+	gcrtc = to_glamo_crtc(crtc);
> -+	gdrm = gcrtc->gdrm;	/* Here it is! */
> -+
> -+	gfb = to_glamo_framebuffer(crtc->fb);
> -+	obj = gfb->obj;
> -+	gobj = obj->driver_private;
> -+
> -+	addr = GLAMO_OFFSET_FB + gobj->block->start;
> -+	addr_low = addr & 0xffff;
> -+	addr_high = ((addr >> 16) & 0x7f) | 0x4000;
> -+
> -+	glamo_lcd_cmd_mode(gdrm, 1);
> -+	reg_write_lcd(gdrm, GLAMO_REG_LCD_A_BASE1, addr_low);
> -+	reg_write_lcd(gdrm, GLAMO_REG_LCD_A_BASE2, addr_high);
> -+	glamo_lcd_cmd_mode(gdrm, 0);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamo_crtc_mode_set(struct drm_crtc *crtc,
> -+                               struct drm_display_mode *mode,
> -+                               struct drm_display_mode *adjusted_mode,
> -+                               int x, int y,
> -+                               struct drm_framebuffer *old_fb)
> -+{
> -+	struct glamodrm_handle *gdrm;
> -+	struct glamo_crtc *gcrtc;
> -+	int retr_start, retr_end, disp_start, disp_end;
> -+
> -+	/* Dig out our handle */
> -+	gcrtc = to_glamo_crtc(crtc);
> -+	gdrm = gcrtc->gdrm;	/* Here it is! */
> -+
> -+	glamo_lcd_cmd_mode(gdrm, 1);
> -+
> -+	glamo_engine_reclock(gdrm->glamo_core, GLAMO_ENGINE_LCD, mode->clock);
> -+	gdrm->saved_clock = mode->clock;
> -+
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_WIDTH,
> -+	                     GLAMO_LCD_WIDTH_MASK, mode->hdisplay);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HEIGHT,
> -+	                     GLAMO_LCD_HEIGHT_MASK, mode->vdisplay);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_PITCH,
> -+	                     GLAMO_LCD_PITCH_MASK, mode->hdisplay*2);
> -+
> -+	/* Convert "X modeline timings" into "Glamo timings" */
> -+	retr_start = 0;
> -+	retr_end = retr_start + mode->hsync_end - mode->hsync_start;
> -+	disp_start = mode->htotal - mode->hsync_start;
> -+	disp_end = disp_start + mode->hdisplay;
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_TOTAL,
> -+	                     GLAMO_LCD_HV_TOTAL_MASK, mode->htotal);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_RETR_START,
> -+	                     GLAMO_LCD_HV_RETR_START_MASK, retr_start);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_RETR_END,
> -+	                     GLAMO_LCD_HV_RETR_END_MASK, retr_end);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_DISP_START,
> -+	                     GLAMO_LCD_HV_RETR_DISP_START_MASK, disp_start);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_DISP_END,
> -+	                     GLAMO_LCD_HV_RETR_DISP_END_MASK, disp_end);
> -+
> -+	/* The same in the vertical direction */
> -+	retr_start = 0;
> -+	retr_end = retr_start + mode->vsync_end - mode->vsync_start;
> -+	disp_start = mode->vtotal - mode->vsync_start;
> -+	disp_end = disp_start + mode->vdisplay;
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_TOTAL,
> -+	                     GLAMO_LCD_HV_TOTAL_MASK, mode->vtotal);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_RETR_START,
> -+	                     GLAMO_LCD_HV_RETR_START_MASK, retr_start);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_RETR_END,
> -+	                     GLAMO_LCD_HV_RETR_END_MASK, retr_end);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_DISP_START,
> -+	                     GLAMO_LCD_HV_RETR_DISP_START_MASK, disp_start);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_DISP_END,
> -+	                     GLAMO_LCD_HV_RETR_DISP_END_MASK, disp_end);
> -+
> -+	glamo_lcd_cmd_mode(gdrm, 0);
> -+
> -+	glamo_crtc_mode_set_base(crtc, 0, 0, old_fb);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static void glamo_crtc_prepare(struct drm_crtc *crtc)
> -+{
> -+}
> -+
> -+
> -+static void glamo_crtc_commit(struct drm_crtc *crtc)
> -+{
> -+}
> -+
> -+
> -+static int glamo_crtc_cursor_set(struct drm_crtc *crtc,
> -+                                 struct drm_file *file_priv,
> -+                                 uint32_t handle,
> -+                                 uint32_t width, uint32_t height)
> -+{
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamo_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
> -+{
> -+	return 0;
> -+}
> -+
> -+
> -+static void glamo_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
> -+                                 u16 *blue, uint32_t size)
> -+{
> -+}
> -+
> -+
> -+static void glamo_crtc_destroy(struct drm_crtc *crtc)
> -+{
> -+	struct glamo_crtc *glamo_crtc = to_glamo_crtc(crtc);
> -+	drm_crtc_cleanup(crtc);
> -+	kfree(glamo_crtc);
> -+}
> -+
> -+
> -+static enum drm_connector_status
> -+glamo_connector_detect(struct drm_connector *connector)
> -+{
> -+	/* One hopes it hasn't been de-soldered... */
> -+	return connector_status_connected;
> -+}
> -+
> -+
> -+static void glamo_connector_destroy(struct drm_connector *connector)
> -+{
> -+	drm_sysfs_connector_remove(connector);
> -+	drm_connector_cleanup(connector);
> -+	kfree(connector);
> -+}
> -+
> -+
> -+static int glamo_connector_get_modes(struct drm_connector *connector)
> -+{
> -+	struct drm_display_mode *mode;
> -+	struct glamo_fb_platform_data *fb_info;
> -+	struct glamo_output *goutput = to_glamo_output(connector);
> -+	struct glamodrm_handle *gdrm = goutput->gdrm;
> -+
> -+	/* Dig out the record which will tell us about the hardware */
> -+	fb_info = gdrm->glamo_core->pdata->fb_data;
> -+
> -+	mode = drm_mode_create(connector->dev);
> -+	if (!mode)
> -+		return 0;
> -+	/* Fill in 'mode' here */
> -+	mode->type = DRM_MODE_TYPE_DEFAULT | DRM_MODE_TYPE_PREFERRED;
> -+
> -+	/* Convert framebuffer timings into KMS timings */
> -+	mode->clock = 1000000000UL / fb_info->modes[0].pixclock; /* ps -> kHz */
> -+	mode->clock *= 1000; /* kHz -> Hz */
> -+	mode->hdisplay = fb_info->modes[0].xres;
> -+	mode->hsync_start = fb_info->modes[0].right_margin + mode->hdisplay;
> -+	mode->hsync_end = mode->hsync_start + fb_info->modes[0].hsync_len;
> -+	mode->htotal = mode->hsync_end + fb_info->modes[0].left_margin;
> -+	mode->hskew = 0;
> -+
> -+	mode->vdisplay = fb_info->modes[0].yres;
> -+	mode->vsync_start = fb_info->modes[0].lower_margin + mode->vdisplay;
> -+	mode->vsync_end = mode->vsync_start + fb_info->modes[0].vsync_len;
> -+	mode->vtotal = mode->vsync_end + fb_info->modes[0].upper_margin;
> -+	mode->vscan = 0;
> -+
> -+	/* Physical size */
> -+	mode->width_mm = fb_info->width;
> -+	mode->height_mm = fb_info->height;
> -+
> -+	drm_mode_set_name(mode);
> -+	drm_mode_probed_add(connector, mode);
> -+
> -+	return 1;	/* one mode, for now */
> -+}
> -+
> -+
> -+static int glamo_connector_set_property(struct drm_connector *connector,
> -+				  struct drm_property *property,
> -+				  uint64_t value)
> -+{
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamo_connector_mode_valid(struct drm_connector *connector,
> -+                                      struct drm_display_mode *mode)
> -+{
> -+	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> -+		return MODE_NO_DBLESCAN;
> -+
> -+	return MODE_OK;
> -+}
> -+
> -+
> -+struct drm_encoder *
> -+glamo_connector_best_encoder(struct drm_connector *connector)
> -+{
> -+	struct glamo_output *glamo_output = to_glamo_output(connector);
> -+	return &glamo_output->enc;
> -+}
> -+
> -+
> -+static void glamo_encoder_dpms(struct drm_encoder *encoder, int mode)
> -+{
> -+}
> -+
> -+
> -+static bool glamo_encoder_mode_fixup(struct drm_encoder *encoder,
> -+                                 struct drm_display_mode *mode,
> -+                                 struct drm_display_mode *adjusted_mode)
> -+{
> -+	return true;
> -+}
> -+
> -+
> -+void glamo_encoder_prepare(struct drm_encoder *encoder)
> -+{
> -+}
> -+
> -+
> -+void glamo_encoder_commit(struct drm_encoder *encoder)
> -+{
> -+}
> -+
> -+
> -+static void glamo_encoder_mode_set(struct drm_encoder *encoder,
> -+                               struct drm_display_mode *mode,
> -+                               struct drm_display_mode *adjusted_mode)
> -+{
> -+}
> -+
> -+
> -+static void glamo_encoder_destroy(struct drm_encoder *encoder)
> -+{
> -+	drm_encoder_cleanup(encoder);
> -+}
> -+
> -+
> -+static void glamo_framebuffer_destroy(struct drm_framebuffer *fb)
> -+{
> -+	struct glamo_framebuffer *glamo_fb = to_glamo_framebuffer(fb);
> -+	struct drm_device *dev = fb->dev;
> -+
> -+	drm_framebuffer_cleanup(fb);
> -+	mutex_lock(&dev->struct_mutex);
> -+	drm_gem_object_unreference(glamo_fb->obj);
> -+	mutex_unlock(&dev->struct_mutex);
> -+
> -+	kfree(glamo_fb);
> -+}
> -+
> -+static int glamo_framebuffer_create_handle(struct drm_framebuffer *fb,
> -+						struct drm_file *file_priv,
> -+						unsigned int *handle)
> -+{
> -+	struct glamo_framebuffer *glamo_fb = to_glamo_framebuffer(fb);
> -+	struct drm_gem_object *object = glamo_fb->obj;
> -+
> -+	return drm_gem_handle_create(file_priv, object, handle);
> -+}
> -+
> -+
> -+static const struct drm_framebuffer_funcs glamo_fb_funcs = {
> -+	.destroy = glamo_framebuffer_destroy,
> -+	.create_handle = glamo_framebuffer_create_handle,
> -+};
> -+
> -+
> -+int glamo_framebuffer_create(struct drm_device *dev,
> -+			     struct drm_mode_fb_cmd *mode_cmd,
> -+			     struct drm_framebuffer **fb,
> -+			     struct drm_gem_object *obj)
> -+{
> -+	struct glamo_framebuffer *glamo_fb;
> -+	int ret;
> -+
> -+	glamo_fb = kzalloc(sizeof(*glamo_fb), GFP_KERNEL);
> -+	if (!glamo_fb)
> -+		return -ENOMEM;
> -+
> -+	ret = drm_framebuffer_init(dev, &glamo_fb->base, &glamo_fb_funcs);
> -+	if (ret) {
> -+		DRM_ERROR("framebuffer init failed %d\n", ret);
> -+		return ret;
> -+	}
> -+
> -+	drm_helper_mode_fill_fb_struct(&glamo_fb->base, mode_cmd);
> -+
> -+	glamo_fb->obj = obj;
> -+
> -+	*fb = &glamo_fb->base;
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static struct drm_framebuffer *
> -+glamo_user_framebuffer_create(struct drm_device *dev,
> -+			      struct drm_file *filp,
> -+			      struct drm_mode_fb_cmd *mode_cmd)
> -+{
> -+	struct drm_gem_object *obj;
> -+	struct drm_framebuffer *fb;
> -+	int ret;
> -+
> -+	obj = drm_gem_object_lookup(dev, filp, mode_cmd->handle);
> -+	if (!obj)
> -+		return NULL;
> -+
> -+	ret = glamo_framebuffer_create(dev, mode_cmd, &fb, obj);
> -+	if (ret) {
> -+		drm_gem_object_unreference(obj);
> -+		return NULL;
> -+	}
> -+
> -+	return fb;
> -+}
> -+
> -+
> -+int glamo_fbchanged(struct drm_device *dev)
> -+{
> -+	return 0;
> -+}
> -+
> -+
> -+/* CRTC functions */
> -+static const struct drm_crtc_funcs glamo_crtc_funcs = {
> -+	.cursor_set = glamo_crtc_cursor_set,
> -+	.cursor_move = glamo_crtc_cursor_move,
> -+	.gamma_set = glamo_crtc_gamma_set,
> -+	.set_config = drm_crtc_helper_set_config,
> -+	.destroy = glamo_crtc_destroy,
> -+};
> -+
> -+
> -+/* CRTC helper functions */
> -+static const struct drm_crtc_helper_funcs glamo_crtc_helper_funcs = {
> -+	.dpms = glamo_crtc_dpms,
> -+	.mode_fixup = glamo_crtc_mode_fixup,
> -+	.mode_set = glamo_crtc_mode_set,
> -+	.mode_set_base = glamo_crtc_mode_set_base,
> -+	.prepare = glamo_crtc_prepare,
> -+	.commit = glamo_crtc_commit,
> -+};
> -+
> -+
> -+/* Connector functions */
> -+static const struct drm_connector_funcs glamo_connector_funcs = {
> -+	.detect = glamo_connector_detect,
> -+	.fill_modes = drm_helper_probe_single_connector_modes,
> -+	.destroy = glamo_connector_destroy,
> -+	.set_property = glamo_connector_set_property,
> -+};
> -+
> -+
> -+/* Connector helper functions */
> -+static const struct drm_connector_helper_funcs glamo_connector_helper_funcs = {
> -+	.mode_valid = glamo_connector_mode_valid,
> -+	.get_modes = glamo_connector_get_modes,
> -+	.best_encoder = glamo_connector_best_encoder,
> -+};
> -+
> -+
> -+/* Encoder functions */
> -+static const struct drm_encoder_funcs glamo_encoder_funcs = {
> -+	.destroy = glamo_encoder_destroy,
> -+};
> -+
> -+
> -+/* Encoder helper functions */
> -+static const struct drm_encoder_helper_funcs glamo_encoder_helper_funcs = {
> -+	.dpms = glamo_encoder_dpms,
> -+	.mode_fixup = glamo_encoder_mode_fixup,
> -+	.prepare = glamo_encoder_prepare,
> -+	.commit = glamo_encoder_commit,
> -+	.mode_set = glamo_encoder_mode_set,
> -+};
> -+
> -+
> -+/* Mode functions */
> -+static const struct drm_mode_config_funcs glamo_mode_funcs = {
> -+	.fb_create = glamo_user_framebuffer_create,
> -+	.fb_changed = glamo_fbchanged
> -+};
> -+
> -+
> -+static struct drm_mode_set kernelfb_mode;
> -+
> -+
> -+/* Restore's the kernel's fbcon mode, used for panic path */
> -+void glamo_display_restore(void)
> -+{
> -+	drm_crtc_helper_set_config(&kernelfb_mode);
> -+}
> -+
> -+
> -+static int glamo_display_panic(struct notifier_block *n, unsigned long ununsed,
> -+                               void *panic_str)
> -+{
> -+	DRM_ERROR("panic occurred, switching back to text console\n");
> -+
> -+	glamo_display_restore();
> -+	return 0;
> -+}
> -+
> -+
> -+static struct notifier_block paniced = {
> -+	.notifier_call = glamo_display_panic,
> -+};
> -+
> -+
> -+int glamo_display_init(struct drm_device *dev)
> -+{
> -+	struct glamodrm_handle *gdrm;
> -+	struct glamo_crtc *glamo_crtc;
> -+	struct glamo_output *glamo_output;
> -+	struct drm_connector *connector;
> -+	struct glamo_framebuffer *glamo_fb;
> -+	struct fb_info *info;
> -+	struct glamofb_par *par;
> -+	struct drm_mode_set *modeset;
> -+
> -+	gdrm = dev->dev_private;
> -+
> -+	/* Initial setup of the LCD controller */
> -+	glamo_engine_enable(gdrm->glamo_core, GLAMO_ENGINE_LCD);
> -+	glamo_engine_reset(gdrm->glamo_core, GLAMO_ENGINE_LCD);
> -+
> -+	glamo_run_lcd_script(gdrm, lcd_init_script,
> -+	                           ARRAY_SIZE(lcd_init_script));
> -+
> -+	drm_mode_config_init(dev);
> -+
> -+	dev->mode_config.min_width = 240;
> -+	dev->mode_config.min_height = 320;
> -+	dev->mode_config.max_width = 480;
> -+	dev->mode_config.max_height = 640;
> -+
> -+	dev->mode_config.funcs = (void *)&glamo_mode_funcs;
> -+
> -+	/* Initialise our CRTC object.
> -+	 * Only one connector per CRTC.  We know this: it's kind of soldered. */
> -+	glamo_crtc = kzalloc(sizeof(struct glamo_crtc)
> -+	                   + sizeof(struct drm_connector *), GFP_KERNEL);
> -+	if (glamo_crtc == NULL) return 1;
> -+	glamo_crtc->gdrm = gdrm;
> -+	glamo_crtc->blank_mode = DRM_MODE_DPMS_OFF;
> -+	drm_crtc_init(dev, &glamo_crtc->base, &glamo_crtc_funcs);
> -+	drm_crtc_helper_add(&glamo_crtc->base, &glamo_crtc_helper_funcs);
> -+
> -+	glamo_crtc->mode_set.crtc = &glamo_crtc->base;
> -+	glamo_crtc->mode_set.connectors =
> -+	                              (struct drm_connector **)(glamo_crtc + 1);
> -+	glamo_crtc->mode_set.num_connectors = 0;
> -+
> -+	/* Create our "output" object: consists of an output and an encoder */
> -+	glamo_output = kzalloc(sizeof(struct glamo_output), GFP_KERNEL);
> -+	if (glamo_output == NULL) return 1;
> -+	connector = &glamo_output->base;
> -+	glamo_output->gdrm = gdrm;
> -+
> -+	/* Initialise the connector */
> -+	drm_connector_init(dev, connector, &glamo_connector_funcs,
> -+	                   DRM_MODE_CONNECTOR_Unknown);
> -+	drm_sysfs_connector_add(connector);
> -+	connector->interlace_allowed = 0;
> -+	connector->doublescan_allowed = 0;
> -+
> -+	/* Initialise the encoder */
> -+	drm_encoder_init(dev, &glamo_output->enc, &glamo_encoder_funcs,
> -+	                 DRM_MODE_ENCODER_DAC);
> -+	glamo_output->enc.possible_crtcs = 1 << 0;
> -+	drm_mode_connector_attach_encoder(&glamo_output->base,
> -+	                                  &glamo_output->enc);
> -+
> -+	drm_encoder_helper_add(&glamo_output->enc, &glamo_encoder_helper_funcs);
> -+	drm_connector_helper_add(connector, &glamo_connector_helper_funcs);
> -+
> -+	drm_helper_initial_config(dev);
> -+
> -+	if (list_empty(&dev->mode_config.fb_kernel_list)) {
> -+		int ret, cols, cols_g;
> -+		cols_g = reg_read_lcd(gdrm, GLAMO_REG_LCD_MODE3) & 0xc000;
> -+		switch ( cols_g ) {
> -+		case GLAMO_LCD_SRC_RGB565 :
> -+			cols = GLAMO_FB_RGB565; break;
> -+		case GLAMO_LCD_SRC_ARGB1555 :
> -+			cols = GLAMO_FB_ARGB1555; break;
> -+		case GLAMO_LCD_SRC_ARGB4444 :
> -+			cols = GLAMO_FB_ARGB4444; break;
> -+		default :
> -+			printk(KERN_WARNING "Unrecognised LCD colour mode\n");
> -+			cols = GLAMO_FB_RGB565; break; /* Take a guess */
> -+		}
> -+		ret = glamofb_create(dev, 480, 640, 480, 640, cols, &glamo_fb);
> -+		if (ret) return -EINVAL;
> -+	}
> -+
> -+	info = glamo_fb->base.fbdev;
> -+	par = info->par;
> -+
> -+	modeset = &glamo_crtc->mode_set;
> -+	modeset->fb = &glamo_fb->base;
> -+	modeset->connectors[0] = connector;
> -+
> -+	par->crtc_ids[0] = glamo_crtc->base.base.id;
> -+
> -+	modeset->num_connectors = 1;
> -+	modeset->mode = modeset->crtc->desired_mode;
> -+
> -+	par->crtc_count = 1;
> -+
> -+	if (register_framebuffer(info) < 0)
> -+		return -EINVAL;
> -+
> -+	printk(KERN_INFO "[glamo-drm] fb%d: %s frame buffer device\n",
> -+	       info->node, info->fix.id);
> -+
> -+	/* Switch back to kernel console on panic */
> -+	kernelfb_mode = *modeset;
> -+	atomic_notifier_chain_register(&panic_notifier_list, &paniced);
> -+	printk(KERN_INFO "[glamo-drm] Registered panic notifier\n");
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+void glamo_display_suspend(struct glamodrm_handle *gdrm)
> -+{
> -+	gdrm->saved_width = reg_read_lcd(gdrm, GLAMO_REG_LCD_WIDTH);
> -+	gdrm->saved_height = reg_read_lcd(gdrm, GLAMO_REG_LCD_HEIGHT);
> -+	gdrm->saved_pitch = reg_read_lcd(gdrm, GLAMO_REG_LCD_PITCH);
> -+	gdrm->saved_htotal = reg_read_lcd(gdrm, GLAMO_REG_LCD_HORIZ_TOTAL);
> -+	gdrm->saved_hrtrst = reg_read_lcd(gdrm, GLAMO_REG_LCD_HORIZ_RETR_START);
> -+	gdrm->saved_hrtren = reg_read_lcd(gdrm, GLAMO_REG_LCD_HORIZ_RETR_END);
> -+	gdrm->saved_hdspst = reg_read_lcd(gdrm, GLAMO_REG_LCD_HORIZ_DISP_START);
> -+	gdrm->saved_hdspen = reg_read_lcd(gdrm, GLAMO_REG_LCD_HORIZ_DISP_END);
> -+	gdrm->saved_vtotal = reg_read_lcd(gdrm, GLAMO_REG_LCD_VERT_TOTAL);
> -+	gdrm->saved_vrtrst = reg_read_lcd(gdrm, GLAMO_REG_LCD_VERT_RETR_START);
> -+	gdrm->saved_vrtren = reg_read_lcd(gdrm, GLAMO_REG_LCD_VERT_RETR_END);
> -+	gdrm->saved_vdspst = reg_read_lcd(gdrm, GLAMO_REG_LCD_VERT_DISP_START);
> -+	gdrm->saved_vdspen = reg_read_lcd(gdrm, GLAMO_REG_LCD_VERT_DISP_END);
> -+}
> -+
> -+
> -+void glamo_display_resume(struct glamodrm_handle *gdrm)
> -+{
> -+	glamo_engine_enable(gdrm->glamo_core, GLAMO_ENGINE_LCD);
> -+	glamo_engine_reset(gdrm->glamo_core, GLAMO_ENGINE_LCD);
> -+	glamo_run_lcd_script(gdrm, lcd_init_script,
> -+	                           ARRAY_SIZE(lcd_init_script));
> -+
> -+	/* Enable pixel clock */
> -+	glamo_engine_clkreg_set(gdrm->glamo_core,
> -+	                        GLAMO_ENGINE_LCD,
> -+	                        GLAMO_CLOCK_LCD_EN_DCLK,
> -+	                        GLAMO_CLOCK_LCD_EN_DCLK);
> -+
> -+	/* Restore timings */
> -+	glamo_lcd_cmd_mode(gdrm, 1);
> -+	glamo_engine_reclock(gdrm->glamo_core, GLAMO_ENGINE_LCD,
> -+	                     gdrm->saved_clock);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_WIDTH, GLAMO_LCD_WIDTH_MASK,
> -+	                     gdrm->saved_width);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HEIGHT, GLAMO_LCD_HEIGHT_MASK,
> -+	                     gdrm->saved_height);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_PITCH, GLAMO_LCD_PITCH_MASK,
> -+	                     gdrm->saved_pitch);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_TOTAL,
> -+	                     GLAMO_LCD_HV_TOTAL_MASK, gdrm->saved_htotal);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_RETR_START,
> -+	                     GLAMO_LCD_HV_RETR_START_MASK, gdrm->saved_hrtrst);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_RETR_END,
> -+	                     GLAMO_LCD_HV_RETR_END_MASK, gdrm->saved_hrtren);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_DISP_START,
> -+	                     GLAMO_LCD_HV_RETR_DISP_START_MASK,
> -+	                     gdrm->saved_hdspst);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_HORIZ_DISP_END,
> -+	                     GLAMO_LCD_HV_RETR_DISP_END_MASK,
> -+	                     gdrm->saved_hdspen);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_TOTAL,
> -+	                     GLAMO_LCD_HV_TOTAL_MASK, gdrm->saved_vtotal);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_RETR_START,
> -+	                     GLAMO_LCD_HV_RETR_START_MASK, gdrm->saved_vrtrst);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_RETR_END,
> -+	                     GLAMO_LCD_HV_RETR_END_MASK, gdrm->saved_vrtren);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_DISP_START,
> -+	                     GLAMO_LCD_HV_RETR_DISP_START_MASK,
> -+	                     gdrm->saved_vdspst);
> -+	reg_set_bit_mask_lcd(gdrm, GLAMO_REG_LCD_VERT_DISP_END,
> -+	                     GLAMO_LCD_HV_RETR_DISP_END_MASK,
> -+	                     gdrm->saved_vdspen);
> -+	glamo_lcd_cmd_mode(gdrm, 0);
> -+}
> -diff --git a/drivers/mfd/glamo/glamo-display.h b/drivers/mfd/glamo/glamo-display.h
> -new file mode 100644
> -index 0000000..d6f21bc
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-display.h
> -@@ -0,0 +1,39 @@
> -+/* Smedia Glamo 336x/337x Display
> -+ *
> -+ * Copyright (c) 2008-2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ */
> -+
> -+#ifndef __GLAMO_DISPLAY_H
> -+#define __GLAMO_DISPLAY_H
> -+
> -+#include <drm/drmP.h>
> -+#include "glamo-drm-private.h"
> -+
> -+extern int glamo_display_init(struct drm_device *dev);
> -+
> -+extern int glamo_framebuffer_create(struct drm_device *dev,
> -+                                    struct drm_mode_fb_cmd *mode_cmd,
> -+                                    struct drm_framebuffer **fb,
> -+                                    struct drm_gem_object *obj);
> -+
> -+extern void glamo_display_suspend(struct glamodrm_handle *gdrm);
> -+extern void glamo_display_resume(struct glamodrm_handle *gdrm);
> -+
> -+#endif /* __GLAMO_DISPLAY_H */
> -diff --git a/drivers/mfd/glamo/glamo-drm-drv.c b/drivers/mfd/glamo/glamo-drm-drv.c
> -new file mode 100644
> -index 0000000..81215f4
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-drm-drv.c
> -@@ -0,0 +1,453 @@
> -+/* Smedia Glamo 336x/337x Graphics Driver
> -+ *
> -+ * Copyright (C) 2009 Openmoko, Inc. Jorge Luis Zapata <turran@openmoko.com>
> -+ * Copyright (C) 2008-2009 Thomas White <taw@bitwiz.org.uk>
> -+ * Copyright (C) 2009 Andreas Pokorny <andreas.pokorny@gmail.com>
> -+ *
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ */
> -+
> -+
> -+#include <linux/module.h>
> -+#include <linux/platform_device.h>
> -+#include <drm/drmP.h>
> -+#include <drm/glamo_drm.h>
> -+#include <linux/glamofb.h>
> -+
> -+#include "glamo-core.h"
> -+#include "glamo-cmdq.h"
> -+#include "glamo-buffer.h"
> -+#include "glamo-drm-private.h"
> -+#include "glamo-display.h"
> -+#include "glamo-kms-fb.h"
> -+#include "glamo-fence.h"
> -+
> -+#define DRIVER_AUTHOR           "Openmoko, Inc."
> -+#define DRIVER_NAME             "glamo-drm"
> -+#define DRIVER_DESC             "SMedia Glamo 3362"
> -+#define DRIVER_DATE             "20090614"
> -+
> -+
> -+static int glamo_ioctl_swap(struct drm_device *dev, void *data,
> -+			    struct drm_file *file_priv)
> -+{
> -+	printk(KERN_INFO "glamo_ioctl_swap\n");
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamo_ioctl_gem_info(struct drm_device *dev, void *data,
> -+				struct drm_file *file_priv)
> -+{
> -+	printk(KERN_INFO "glamo_ioctl_gem_info\n");
> -+	return 0;
> -+}
> -+
> -+
> -+struct drm_ioctl_desc glamo_ioctls[] = {
> -+	DRM_IOCTL_DEF(DRM_GLAMO_CMDBUF, glamo_ioctl_cmdbuf, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_SWAP, glamo_ioctl_swap, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_CMDBURST, glamo_ioctl_cmdburst, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_INFO, glamo_ioctl_gem_info, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_CREATE, glamo_ioctl_gem_create, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_MMAP, glamo_ioctl_gem_mmap, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_PIN, glamo_ioctl_gem_pin, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_UNPIN, glamo_ioctl_gem_unpin, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_PREAD, glamo_ioctl_gem_pread, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_PWRITE, glamo_ioctl_gem_pwrite, DRM_AUTH),
> -+	DRM_IOCTL_DEF(DRM_GLAMO_GEM_WAIT_RENDERING,
> -+	              glamo_ioctl_wait_rendering, DRM_AUTH),
> -+};
> -+
> -+
> -+static int glamodrm_firstopen(struct drm_device *dev)
> -+{
> -+	DRM_DEBUG("\n");
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamodrm_open(struct drm_device *dev, struct drm_file *fh)
> -+{
> -+	DRM_DEBUG("\n");
> -+	return 0;
> -+}
> -+
> -+
> -+static void glamodrm_preclose(struct drm_device *dev, struct drm_file *fh)
> -+{
> -+	DRM_DEBUG("\n");
> -+}
> -+
> -+static void glamodrm_postclose(struct drm_device *dev, struct drm_file *fh)
> -+{
> -+	DRM_DEBUG("\n");
> -+}
> -+
> -+
> -+static void glamodrm_lastclose(struct drm_device *dev)
> -+{
> -+	DRM_DEBUG("\n");
> -+}
> -+
> -+
> -+static int glamodrm_master_create(struct drm_device *dev,
> -+				  struct drm_master *master)
> -+{
> -+	DRM_DEBUG("\n");
> -+
> -+        return 0;
> -+}
> -+
> -+
> -+static void glamodrm_master_destroy(struct drm_device *dev,
> -+				    struct drm_master *master)
> -+{
> -+	DRM_DEBUG("\n");
> -+}
> -+
> -+
> -+static int glamodrm_load(struct drm_device *dev, unsigned long flags)
> -+{
> -+	struct glamodrm_handle *gdrm;
> -+	gdrm = dev->dev_private;
> -+
> -+	glamo_buffer_init(gdrm);
> -+	glamo_cmdq_init(gdrm);
> -+	glamo_fence_init(gdrm);
> -+	glamo_display_init(dev);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamodrm_unload(struct drm_device *dev)
> -+{
> -+	struct glamodrm_handle *gdrm;
> -+
> -+	gdrm = dev->dev_private;
> -+
> -+	glamo_engine_disable(gdrm->glamo_core, GLAMO_ENGINE_2D);
> -+	glamo_engine_disable(gdrm->glamo_core, GLAMO_ENGINE_3D);
> -+	glamo_buffer_final(gdrm);
> -+	glamo_fence_shutdown(gdrm);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static struct vm_operations_struct glamodrm_gem_vm_ops = {
> -+	.fault = glamodrm_gem_fault,
> -+};
> -+
> -+static struct drm_driver glamodrm_drm_driver = {
> -+	.driver_features = DRIVER_IS_PLATFORM | DRIVER_GEM | DRIVER_MODESET,
> -+	.firstopen = glamodrm_firstopen,
> -+	.load = glamodrm_load,
> -+	.unload = glamodrm_unload,
> -+	.open = glamodrm_open,
> -+	.preclose = glamodrm_preclose,
> -+	.postclose = glamodrm_postclose,
> -+	.lastclose = glamodrm_lastclose,
> -+	.reclaim_buffers = drm_core_reclaim_buffers,
> -+	.get_map_ofs = drm_core_get_map_ofs,
> -+	.get_reg_ofs = drm_core_get_reg_ofs,
> -+	.master_create = glamodrm_master_create,
> -+	.master_destroy = glamodrm_master_destroy,
> -+	.gem_init_object = glamodrm_gem_init_object,
> -+	.gem_free_object = glamodrm_gem_free_object,
> -+	.gem_vm_ops = &glamodrm_gem_vm_ops,
> -+	.ioctls = glamo_ioctls,
> -+	.fops = {
> -+		.owner = THIS_MODULE,
> -+		.open = drm_open,
> -+		.release = drm_release,
> -+		.ioctl = drm_ioctl,
> -+		.mmap = drm_gem_mmap,
> -+		.poll = drm_poll,
> -+		.fasync = drm_fasync,
> -+	},
> -+	.major = 0,
> -+	.minor = 1,
> -+	.patchlevel = 0,
> -+	.name = DRIVER_NAME,
> -+	.desc = DRIVER_DESC,
> -+	.date = DRIVER_DATE,
> -+};
> -+
> -+
> -+static int glamodrm_probe(struct platform_device *pdev)
> -+{
> -+	int rc;
> -+	struct glamodrm_handle *gdrm;
> -+	struct glamo_core *core = dev_get_drvdata(pdev->dev.parent);
> -+
> -+	printk(KERN_INFO "[glamo-drm] SMedia Glamo Direct Rendering Support\n");
> -+
> -+	gdrm = kzalloc(sizeof(*gdrm), GFP_KERNEL);
> -+	if ( !gdrm )
> -+		return -ENOMEM;
> -+	platform_set_drvdata(pdev, gdrm);
> -+	gdrm->glamo_core = core;
> -+	gdrm->dev = &pdev->dev;
> -+
> -+	/* Find the command queue registers */
> -+	gdrm->reg = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -+	                                         "glamo-cmdq-regs");
> -+	if ( !gdrm->reg ) {
> -+		dev_err(&pdev->dev, "Unable to find cmdq registers.\n");
> -+		rc = -ENOENT;
> -+		goto out_free;
> -+	}
> -+	gdrm->reg = request_mem_region(gdrm->reg->start,
> -+					  resource_size(gdrm->reg), pdev->name);
> -+	if ( !gdrm->reg ) {
> -+		dev_err(&pdev->dev, "failed to request MMIO region\n");
> -+		rc = -ENOENT;
> -+		goto out_free;
> -+	}
> -+	gdrm->reg_base = ioremap_nocache(gdrm->reg->start,
> -+	                                 resource_size(gdrm->reg));
> -+	if ( !gdrm->reg_base ) {
> -+		dev_err(&pdev->dev, "failed to ioremap() MMIO registers\n");
> -+		rc = -ENOENT;
> -+		goto out_release_regs;
> -+	}
> -+
> -+	/* Find the command queue itself */
> -+	gdrm->cmdq = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -+	                                          "glamo-command-queue");
> -+	if ( !gdrm->cmdq ) {
> -+		dev_err(&pdev->dev, "Unable to find command queue.\n");
> -+		rc = -ENOENT;
> -+		goto out_unmap_regs;
> -+	}
> -+	gdrm->cmdq = request_mem_region(gdrm->cmdq->start,
> -+	                                resource_size(gdrm->cmdq), pdev->name);
> -+	if ( !gdrm->cmdq ) {
> -+		dev_err(&pdev->dev, "failed to request command queue region\n");
> -+		rc = -ENOENT;
> -+		goto out_unmap_regs;
> -+	}
> -+	gdrm->cmdq_base = ioremap_nocache(gdrm->cmdq->start,
> -+	                                  resource_size(gdrm->cmdq));
> -+	if ( !gdrm->cmdq_base ) {
> -+		dev_err(&pdev->dev, "failed to ioremap() command queue\n");
> -+		rc = -ENOENT;
> -+		goto out_release_cmdq;
> -+	}
> -+
> -+	/* Find the VRAM */
> -+	gdrm->vram = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -+	                                          "glamo-fb-mem");
> -+	if ( !gdrm->vram ) {
> -+		dev_err(&pdev->dev, "Unable to find VRAM.\n");
> -+		rc = -ENOENT;
> -+		goto out_unmap_cmdq;
> -+	}
> -+	gdrm->vram = request_mem_region(gdrm->vram->start,
> -+	                                resource_size(gdrm->vram), pdev->name);
> -+	if ( !gdrm->vram ) {
> -+		dev_err(&pdev->dev, "failed to request VRAM region\n");
> -+		rc = -ENOENT;
> -+		goto out_unmap_cmdq;
> -+	}
> -+
> -+	/* Find the LCD controller */
> -+	gdrm->lcd_regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -+	                                              "glamo-fb-regs");
> -+	if ( !gdrm->lcd_regs ) {
> -+		dev_err(&pdev->dev, "Unable to find LCD registers.\n");
> -+		rc = -ENOENT;
> -+		goto out_release_vram;
> -+	}
> -+	gdrm->lcd_regs = request_mem_region(gdrm->lcd_regs->start,
> -+	                                    resource_size(gdrm->lcd_regs),
> -+	                                    pdev->name);
> -+	if ( !gdrm->lcd_regs ) {
> -+		dev_err(&pdev->dev, "failed to request LCD registers\n");
> -+		rc = -ENOENT;
> -+		goto out_release_vram;
> -+	}
> -+	gdrm->lcd_base = ioremap_nocache(gdrm->lcd_regs->start,
> -+	                                 resource_size(gdrm->lcd_regs));
> -+	if ( !gdrm->lcd_base ) {
> -+		dev_err(&pdev->dev, "failed to ioremap() LCD registers\n");
> -+		rc = -ENOENT;
> -+		goto out_release_lcd;
> -+	}
> -+
> -+	/* Find the 2D engine */
> -+	gdrm->twod_regs = platform_get_resource(pdev, IORESOURCE_MEM, 4);
> -+	if ( !gdrm->twod_regs ) {
> -+		dev_err(&pdev->dev, "Unable to find 2D registers.\n");
> -+		rc = -ENOENT;
> -+		goto out_unmap_lcd;
> -+	}
> -+	gdrm->twod_regs = request_mem_region(gdrm->twod_regs->start,
> -+	                                     resource_size(gdrm->twod_regs),
> -+	                                     pdev->name);
> -+	if ( !gdrm->twod_regs ) {
> -+		dev_err(&pdev->dev, "failed to request 2D registers\n");
> -+		rc = -ENOENT;
> -+		goto out_unmap_lcd;
> -+	}
> -+	gdrm->twod_base = ioremap(gdrm->twod_regs->start,
> -+	                          resource_size(gdrm->twod_regs));
> -+	if ( !gdrm->twod_base ) {
> -+		dev_err(&pdev->dev, "failed to ioremap() 2D registers\n");
> -+		rc = -ENOENT;
> -+		goto out_release_2d;
> -+	}
> -+
> -+	/* Hook up IRQ handle for fence processing */
> -+	gdrm->twod_irq = platform_get_irq_byname(pdev, "glamo-2d-irq");
> -+	rc = request_irq(gdrm->twod_irq, glamo_fence_irq_handler,
> -+	                 IRQF_SHARED, pdev->name, gdrm);
> -+	if ( rc ) {
> -+		dev_err(&pdev->dev, "failed to register irq.\n");
> -+		goto out_unmap_2d;
> -+	}
> -+
> -+	gdrm->vram_size = GLAMO_FB_SIZE;
> -+	printk(KERN_INFO "[glamo-drm] %lli bytes of VRAM\n",
> -+	                 (long long int)gdrm->vram_size);
> -+
> -+	/* Initialise DRM */
> -+	drm_platform_init(&glamodrm_drm_driver, pdev, (void *)gdrm);
> -+
> -+	return 0;
> -+
> -+out_unmap_2d:
> -+	iounmap(gdrm->twod_base);
> -+out_release_2d:
> -+	release_mem_region(gdrm->twod_regs->start,
> -+	                   resource_size(gdrm->twod_regs));
> -+out_unmap_lcd:
> -+	iounmap(gdrm->lcd_base);
> -+out_release_lcd:
> -+	release_mem_region(gdrm->lcd_regs->start,
> -+	                   resource_size(gdrm->lcd_regs));
> -+out_release_vram:
> -+	release_mem_region(gdrm->vram->start, resource_size(gdrm->vram));
> -+out_unmap_cmdq:
> -+	iounmap(gdrm->cmdq_base);
> -+out_release_cmdq:
> -+	release_mem_region(gdrm->cmdq->start, resource_size(gdrm->cmdq));
> -+out_unmap_regs:
> -+	iounmap(gdrm->reg_base);
> -+out_release_regs:
> -+	release_mem_region(gdrm->reg->start, resource_size(gdrm->reg));
> -+out_free:
> -+	kfree(gdrm);
> -+	pdev->dev.driver_data = NULL;
> -+	return rc;
> -+}
> -+
> -+
> -+static int glamodrm_remove(struct platform_device *pdev)
> -+{
> -+	struct glamodrm_handle *gdrm = platform_get_drvdata(pdev);
> -+
> -+	glamo_buffer_final(gdrm);
> -+	glamo_cmdq_shutdown(gdrm);
> -+
> -+	drm_exit(&glamodrm_drm_driver);
> -+
> -+	platform_set_drvdata(pdev, NULL);
> -+
> -+	/* Release registers */
> -+	iounmap(gdrm->reg_base);
> -+	release_mem_region(gdrm->reg->start, resource_size(gdrm->reg));
> -+
> -+	/* Release VRAM */
> -+	release_mem_region(gdrm->vram->start, resource_size(gdrm->vram));
> -+
> -+	/* Release command queue */
> -+	iounmap(gdrm->cmdq_base);
> -+	release_mem_region(gdrm->cmdq->start, resource_size(gdrm->cmdq));
> -+
> -+	/* Release 2D engine  */
> -+	free_irq(gdrm->twod_irq, gdrm);
> -+	iounmap(gdrm->twod_base);
> -+	release_mem_region(gdrm->twod_regs->start,
> -+	                   resource_size(gdrm->twod_regs));
> -+
> -+	kfree(gdrm);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamodrm_suspend(struct platform_device *pdev, pm_message_t state)
> -+{
> -+	struct glamodrm_handle *gdrm = platform_get_drvdata(pdev);
> -+
> -+	glamo_kmsfb_suspend(gdrm);
> -+	glamo_display_suspend(gdrm);
> -+	glamo_cmdq_suspend(gdrm);
> -+
> -+	/* glamo_core.c will suspend the engines for us */
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static int glamodrm_resume(struct platform_device *pdev)
> -+{
> -+	struct glamodrm_handle *gdrm = platform_get_drvdata(pdev);
> -+
> -+	glamo_cmdq_resume(gdrm);
> -+	glamo_display_resume(gdrm);
> -+	glamo_kmsfb_resume(gdrm);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+static struct platform_driver glamodrm_driver = {
> -+	.probe          = glamodrm_probe,
> -+	.remove         = glamodrm_remove,
> -+	.suspend	= glamodrm_suspend,
> -+	.resume		= glamodrm_resume,
> -+	.driver         = {
> -+		.name   = "glamo-fb",
> -+		.owner  = THIS_MODULE,
> -+	},
> -+};
> -+
> -+
> -+static int __devinit glamodrm_init(void)
> -+{
> -+	glamodrm_drm_driver.num_ioctls = DRM_ARRAY_SIZE(glamo_ioctls);
> -+	return platform_driver_register(&glamodrm_driver);
> -+}
> -+
> -+
> -+static void __exit glamodrm_exit(void)
> -+{
> -+	platform_driver_unregister(&glamodrm_driver);
> -+}
> -+
> -+
> -+module_init(glamodrm_init);
> -+module_exit(glamodrm_exit);
> -+
> -+MODULE_AUTHOR(DRIVER_AUTHOR);
> -+MODULE_DESCRIPTION(DRIVER_DESC);
> -+MODULE_LICENSE("GPL");
> -diff --git a/drivers/mfd/glamo/glamo-drm-private.h b/drivers/mfd/glamo/glamo-drm-private.h
> -new file mode 100644
> -index 0000000..7949a2e
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-drm-private.h
> -@@ -0,0 +1,156 @@
> -+/* Smedia Glamo 336x/337x DRM private bits
> -+ *
> -+ * Copyright (C) 2008-2009 Thomas White <taw@bitwiz.org.uk>
> -+ * Copyright (C) 2009 Andreas Pokorny <andreas.pokorny@gmail.com>
> -+ * Based on xf86-video-glamo
> -+ * Copyright  2007 OpenMoko, Inc.
> -+ * Copyright Â© 2009 Lars-Peter Clausen <lars@metafoo.de>
> -+ *
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ */
> -+
> -+#ifndef __GLAMO_DRMPRIV_H
> -+#define __GLAMO_DRMPRIV_H
> -+
> -+
> -+#include <linux/module.h>
> -+#include <linux/platform_device.h>
> -+#include <linux/semaphore.h>
> -+#include <linux/spinlock.h>
> -+#include <linux/wait.h>
> -+
> -+#include "glamo-core.h"
> -+
> -+
> -+/* Memory to allocate for the framebuffer.
> -+ * The rest is reserved for the DRM memory manager */
> -+#define GLAMO_FRAMEBUFFER_ALLOCATION (2*480*640)
> -+
> -+
> -+struct glamodrm_handle {
> -+
> -+	/* This device */
> -+	struct device *dev;
> -+
> -+	/* The parent device handle */
> -+	struct glamo_core *glamo_core;
> -+
> -+	/* Framebuffer handle for the console (i.e. /dev/fb0) */
> -+	struct fb_info *fb;
> -+
> -+	/* Command queue registers */
> -+	struct resource *reg;
> -+	char __iomem *reg_base;
> -+
> -+	/* VRAM region */
> -+	struct resource *vram;
> -+
> -+	/* Command queue region */
> -+	struct resource *cmdq;
> -+	char __iomem *cmdq_base;
> -+
> -+	/* LCD controller registers */
> -+	struct resource *lcd_regs;
> -+	char __iomem *lcd_base;
> -+
> -+	/* 2D engine registers and IRQ */
> -+	struct resource *twod_regs;
> -+	char __iomem *twod_base;
> -+	unsigned int twod_irq;
> -+
> -+	ssize_t vram_size;
> -+
> -+	/* Memory management */
> -+	struct drm_mm *mmgr;
> -+
> -+	/* semaphore against concurrent ioctl */
> -+	struct semaphore add_to_ring;
> -+
> -+	/* Saved state */
> -+	u_int16_t saved_clock;
> -+	u_int16_t saved_width;
> -+	u_int16_t saved_height;
> -+	u_int16_t saved_pitch;
> -+	u_int16_t saved_htotal;
> -+	u_int16_t saved_hrtrst;
> -+	u_int16_t saved_hrtren;
> -+	u_int16_t saved_hdspst;
> -+	u_int16_t saved_hdspen;
> -+	u_int16_t saved_vtotal;
> -+	u_int16_t saved_vrtrst;
> -+	u_int16_t saved_vrtren;
> -+	u_int16_t saved_vdspst;
> -+	u_int16_t saved_vdspen;
> -+
> -+	/* Fencing */
> -+	atomic_t curr_seq;              /* The last used stamp number */
> -+	struct list_head fence_list;    /* List of active fences */
> -+	rwlock_t fence_list_lock;       /* Lock to protect fence_list */
> -+	wait_queue_head_t fence_queue;  /* Waitqueue */
> -+	struct tasklet_struct fence_tl; /* Tasklet for fence IRQ */
> -+
> -+	/* A scratch block */
> -+	struct drm_mm_node *scratch;
> -+};
> -+
> -+
> -+/* Private data.  This is where we keep our memory management bits */
> -+struct drm_glamo_gem_object {
> -+	struct drm_gem_object *obj;	/* The GEM object this refers to */
> -+	struct drm_mm_node *block;	/* Block handle for drm_mm */
> -+	uint64_t mmap_offset;
> -+};
> -+
> -+
> -+struct glamo_crtc {
> -+	struct drm_crtc base;
> -+	struct glamodrm_handle *gdrm;
> -+	/* a mode_set for fbdev users on this crtc */
> -+	struct drm_mode_set mode_set;
> -+	int blank_mode;
> -+};
> -+
> -+
> -+struct glamo_framebuffer {
> -+	struct drm_framebuffer base;
> -+	struct drm_gem_object *obj;
> -+};
> -+
> -+
> -+struct glamo_output {
> -+	struct drm_connector base;
> -+	struct drm_encoder enc;
> -+	struct glamodrm_handle *gdrm;
> -+};
> -+
> -+
> -+/* Colour mode for KMS framebuffer */
> -+enum {
> -+	GLAMO_FB_RGB565,
> -+	GLAMO_FB_ARGB1555,
> -+	GLAMO_FB_ARGB4444
> -+};
> -+
> -+
> -+#define to_glamo_crtc(x) container_of(x, struct glamo_crtc, base)
> -+#define to_glamo_output(x) container_of(x, struct glamo_output, base)
> -+#define enc_to_glamo_output(x) container_of(x, struct glamo_output, enc)
> -+#define to_glamo_framebuffer(x) container_of(x, struct glamo_framebuffer, base)
> -+
> -+
> -+#endif /* __GLAMO_DRMPRIV_H */
> -diff --git a/drivers/mfd/glamo/glamo-fence.c b/drivers/mfd/glamo/glamo-fence.c
> -new file mode 100644
> -index 0000000..ab77241
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-fence.c
> -@@ -0,0 +1,329 @@
> -+/*
> -+ * SMedia Glamo 336x/337x fence objects
> -+ *
> -+ * Copyright (c) 2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> -+ *
> -+ *
> -+ * Loosely based on radeon_fence.c, to which the following notice applies:
> -+ *
> -+ * Copyright 2009 Jerome Glisse.
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtaining a
> -+ * copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject to
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> -+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> -+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> -+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial portions
> -+ * of the Software.
> -+ *
> -+ */
> -+/*
> -+ * Authors:
> -+ *    Jerome Glisse <glisse@freedesktop.org>
> -+ *    Dave Airlie
> -+ */
> -+
> -+
> -+#include <drm/drmP.h>
> -+#include <drm/glamo_drm.h>
> -+#include <linux/kernel.h>
> -+#include <linux/irq.h>
> -+#include <linux/interrupt.h>
> -+#include <linux/spinlock.h>
> -+#include <linux/lockdep.h>
> -+
> -+#include "glamo-drm-private.h"
> -+#include "glamo-regs.h"
> -+#include "glamo-core.h"
> -+#include "glamo-cmdq.h"
> -+
> -+
> -+static struct lock_class_key glamo_fence_lock_key;
> -+
> -+
> -+struct glamo_fence
> -+{
> -+	struct list_head list;
> -+	uint16_t               seq;       /* Wait for at least this ID */
> -+	int                    signalled; /* Non-zero when fence has passed */
> -+	struct glamodrm_handle *gdrm;
> -+};
> -+
> -+
> -+static void glamo_fence_emit(struct glamo_fence *fence)
> -+{
> -+	u16 fring[6];
> -+
> -+	fring[0] = 0x8000 | GLAMO_REG_2D_ID1;
> -+	fring[1] = 3;
> -+	fence->seq = atomic_inc_return(&fence->gdrm->curr_seq);
> -+	if ( fence->seq > 1<<14 ) {
> -+		atomic_set(&fence->gdrm->curr_seq, 0);
> -+		fence->seq = atomic_inc_return(&fence->gdrm->curr_seq);
> -+	}
> -+	fring[2] = 1<<15 | fence->seq;
> -+	fring[3] = 0;  /* Unused */
> -+	fring[4] = 0;  /* Unused */
> -+	fring[5] = 0;  /* Padding */
> -+
> -+	glamo_add_to_ring(fence->gdrm, fring, 12);
> -+}
> -+
> -+
> -+static void glamo_fence_enable(struct glamodrm_handle *gdrm)
> -+{
> -+	glamo_enable_irq(gdrm->glamo_core, GLAMO_IRQ_2D);
> -+}
> -+
> -+
> -+static inline u16 reg_read_2d(struct glamodrm_handle *gdrm, u_int16_t reg)
> -+{
> -+	/* For command queue, the address is given relative to
> -+	 * the overall base of Glamo.  This isn't the case here. */
> -+	return ioread16(gdrm->twod_base + reg-GLAMO_REGOFS_2D);
> -+}
> -+
> -+
> -+static inline u16 reg_read_cmdq(struct glamodrm_handle *gdrm, u_int16_t reg)
> -+{
> -+	return ioread16(gdrm->reg_base + reg);
> -+}
> -+
> -+
> -+static void glamo_cmdq_wait(struct glamodrm_handle *gdrm,
> -+                            enum glamo_engine engine)
> -+{
> -+	u16 mask, val, status;
> -+	int i;
> -+
> -+	switch (engine)
> -+	{
> -+		case GLAMO_ENGINE_ALL:
> -+			mask = 1 << 2;
> -+			val  = mask;
> -+			break;
> -+		default:
> -+			return;
> -+	}
> -+
> -+	for ( i=0; i<1000; i++ ) {
> -+		status = reg_read_cmdq(gdrm, GLAMO_REG_CMDQ_STATUS);
> -+		if ((status & mask) == val) break;
> -+		mdelay(1);
> -+	}
> -+	if ( i == 1000 ) {
> -+		size_t ring_read;
> -+		printk(KERN_WARNING "[glamo-drm] CmdQ timeout!\n");
> -+		printk(KERN_WARNING "[glamo-drm] status = %x\n", status);
> -+		ring_read = reg_read_cmdq(gdrm, GLAMO_REG_CMDQ_READ_ADDRL);
> -+		ring_read |= ((reg_read_cmdq(gdrm, GLAMO_REG_CMDQ_READ_ADDRH)
> -+				& 0x7) << 16);
> -+		printk(KERN_INFO "[glamo-drm] ring_read now 0x%x\n",
> -+				 ring_read);
> -+	}
> -+}
> -+
> -+
> -+irqreturn_t glamo_fence_irq_handler(unsigned int irq, void *data)
> -+{
> -+	struct glamodrm_handle *gdrm = data;
> -+
> -+	if (!gdrm) {
> -+		printk(KERN_ERR "[glamo-drm] 2D IRQ called with no data\n");
> -+		return IRQ_NONE;
> -+	}
> -+	glamo_clear_irq(gdrm->glamo_core, GLAMO_IRQ_2D);
> -+
> -+	tasklet_schedule(&gdrm->fence_tl);
> -+
> -+	return IRQ_HANDLED;
> -+}
> -+
> -+
> -+/* This is nasty.  I'm sorry. */
> -+static void glamo_fence_debodge(struct glamodrm_handle *gdrm)
> -+{
> -+	struct list_head *tmp;
> -+
> -+	printk(KERN_ERR "[glamo-drm] Attempting to recover...\n");
> -+
> -+	glamo_cmdq_wait(gdrm, GLAMO_ENGINE_ALL);
> -+	glamo_engine_reset(gdrm->glamo_core, GLAMO_ENGINE_2D);
> -+
> -+	read_lock(&gdrm->fence_list_lock);
> -+	list_for_each(tmp, &gdrm->fence_list) {
> -+
> -+		struct glamo_fence *fence;
> -+
> -+		fence = list_entry(tmp, struct glamo_fence, list);
> -+
> -+		if ( fence->signalled != 1 ) {
> -+			printk(KERN_ERR "[glamo-drm] Fence seq#%i was not"
> -+			                " signalled\n", fence->seq);
> -+		}
> -+		fence->signalled = 1;
> -+
> -+	}
> -+	read_unlock(&gdrm->fence_list_lock);
> -+
> -+	wake_up_all(&gdrm->fence_queue);
> -+}
> -+
> -+
> -+static void glamo_fence_tl(unsigned long data)
> -+{
> -+	struct glamodrm_handle *gdrm = (struct glamodrm_handle *)data;
> -+	int wake = 0;
> -+	u16 seq;
> -+	struct list_head *tmp;
> -+
> -+	seq = reg_read_2d(gdrm, GLAMO_REG_2D_ID1) & 0x7fff;
> -+
> -+	read_lock(&gdrm->fence_list_lock);
> -+	list_for_each(tmp, &gdrm->fence_list) {
> -+
> -+		struct glamo_fence *fence;
> -+
> -+		fence = list_entry(tmp, struct glamo_fence, list);
> -+		if ( seq >= fence->seq ) {
> -+			fence->signalled = 1;
> -+			wake = 1;
> -+		}
> -+
> -+	}
> -+	read_unlock(&gdrm->fence_list_lock);
> -+
> -+	if ( wake ) wake_up_all(&gdrm->fence_queue);
> -+}
> -+
> -+
> -+static struct glamo_fence *glamo_fence_new(struct glamodrm_handle *gdrm)
> -+{
> -+	struct glamo_fence *fence;
> -+	unsigned long irq_flags;
> -+
> -+	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> -+	fence->signalled = 0;
> -+	fence->gdrm = gdrm;
> -+
> -+	/* Add to list */
> -+	write_lock_irqsave(&gdrm->fence_list_lock, irq_flags);
> -+	list_add(&fence->list, &gdrm->fence_list);
> -+	write_unlock_irqrestore(&gdrm->fence_list_lock, irq_flags);
> -+
> -+	return fence;
> -+}
> -+
> -+
> -+static struct glamo_fence *glamo_fence_destroy(struct glamo_fence *fence)
> -+{
> -+	unsigned long irq_flags;
> -+	struct glamodrm_handle *gdrm = fence->gdrm;
> -+
> -+	/* Remove from list */
> -+	write_lock_irqsave(&gdrm->fence_list_lock, irq_flags);
> -+	list_del(&fence->list);
> -+	write_unlock_irqrestore(&gdrm->fence_list_lock, irq_flags);
> -+
> -+	kfree(fence);
> -+
> -+	return fence;
> -+}
> -+
> -+
> -+int glamo_ioctl_wait_rendering(struct drm_device *dev, void *data,
> -+                               struct drm_file *file_priv)
> -+{
> -+	struct glamodrm_handle *gdrm;
> -+	struct drm_glamo_gem_wait_rendering *args = data;
> -+	struct glamo_fence *fence;
> -+	int r;
> -+
> -+	gdrm = dev->dev_private;
> -+
> -+	if ( !args->have_handle ) {
> -+		glamo_cmdq_wait(gdrm, GLAMO_ENGINE_ALL);
> -+		return 0;
> -+	}
> -+
> -+	fence = glamo_fence_new(gdrm);
> -+	if ( fence == NULL ) {
> -+		printk(KERN_WARNING "[glamo-drm] Couldn't allocate fence -"
> -+		                    " falling back to busy wait.\n");
> -+		glamo_cmdq_wait(gdrm, GLAMO_ENGINE_ALL);
> -+		return 0;
> -+	}
> -+
> -+	glamo_fence_emit(fence);
> -+
> -+	/* Wait... */
> -+	r = wait_event_interruptible_timeout(gdrm->fence_queue,
> -+	                                     fence->signalled, HZ);
> -+	if ( r == 0 ) {
> -+		printk(KERN_ERR "[glamo-drm] Timeout!\n");
> -+		glamo_fence_debodge(gdrm);
> -+	}
> -+
> -+	glamo_fence_destroy(fence);
> -+
> -+	return 0;
> -+}
> -+
> -+
> -+void glamo_fence_init(struct glamodrm_handle *gdrm)
> -+{
> -+	unsigned long irq_flags;
> -+
> -+	if ( gdrm->twod_irq == 0 ) {
> -+		printk(KERN_ERR "[glamo-drm] Attempted to initialise fence"
> -+		                " system before 2D IRQ registered\n");
> -+		return;
> -+	}
> -+
> -+	gdrm->fence_list_lock = __RW_LOCK_UNLOCKED(gdrm->fence_list_lock);
> -+	lockdep_set_class(&gdrm->fence_list_lock, &glamo_fence_lock_key);
> -+	init_waitqueue_head(&gdrm->fence_queue);
> -+
> -+	atomic_set(&gdrm->curr_seq, 0);
> -+
> -+	write_lock_irqsave(&gdrm->fence_list_lock, irq_flags);
> -+	INIT_LIST_HEAD(&gdrm->fence_list);
> -+	write_unlock_irqrestore(&gdrm->fence_list_lock, irq_flags);
> -+
> -+	tasklet_init(&gdrm->fence_tl, glamo_fence_tl, (unsigned long)gdrm);
> -+
> -+	glamo_fence_enable(gdrm);
> -+}
> -+
> -+
> -+void glamo_fence_shutdown(struct glamodrm_handle *gdrm)
> -+{
> -+	wake_up_all(&gdrm->fence_queue);
> -+	tasklet_kill(&gdrm->fence_tl);
> -+}
> -diff --git a/drivers/mfd/glamo/glamo-fence.h b/drivers/mfd/glamo/glamo-fence.h
> -new file mode 100644
> -index 0000000..948fae3
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-fence.h
> -@@ -0,0 +1,36 @@
> -+/*
> -+ * SMedia Glamo 336x/337x fence objects
> -+ *
> -+ * Copyright (c) 2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> -+ *
> -+ */
> -+
> -+#ifndef __GLAMO_FENCE_H
> -+#define __GLAMO_FENCE_H
> -+
> -+#include <drm/drmP.h>
> -+
> -+#include "glamo-drm-private.h"
> -+
> -+extern void glamo_fence_irq_handler(unsigned int irq, struct irq_desc *desc);
> -+
> -+extern void glamo_fence_init(struct glamodrm_handle *gdrm);
> -+extern void glamo_fence_shutdown(struct glamodrm_handle *gdrm);
> -+
> -+extern int glamo_ioctl_wait_rendering(struct drm_device *dev, void *data,
> -+                                      struct drm_file *file_priv);
> -+
> -+#endif /* __GLAMO_FENCE_H */
> -diff --git a/drivers/mfd/glamo/glamo-kms-fb.c b/drivers/mfd/glamo/glamo-kms-fb.c
> -new file mode 100644
> -index 0000000..61cd605
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-kms-fb.c
> -@@ -0,0 +1,540 @@
> -+/*
> -+ * SMedia Glamo 336x/337x KMS Framebuffer
> -+ *
> -+ * Copyright (C) 2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * Based on glamo-fb.c (C) 2007-2008 by Openmoko, Inc.
> -+ * Author: Harald Welte <laforge@openmoko.org>
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ *
> -+ *
> -+ * Based on intel_fb.c from drivers/gpu/drm/i915
> -+ *  to which the following licence applies:
> -+ *
> -+ * Copyright Â© 2006-2007 Intel Corporation
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtaining a
> -+ * copy of this software and associated documentation files (the "Software"),
> -+ * to deal in the Software without restriction, including without limitation
> -+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> -+ * and/or sell copies of the Software, and to permit persons to whom the
> -+ * Software is furnished to do so, subject to the following conditions:
> -+ *
> -+ * The above copyright notice and this permission notice (including the next
> -+ * paragraph) shall be included in all copies or substantial portions of the
> -+ * Software.
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> -+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> -+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> -+ * DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * Authors:
> -+ *	Eric Anholt <eric@anholt.net>
> -+ *
> -+ */
> -+
> -+
> -+#include <drm/drmP.h>
> -+#include <drm/glamo_drm.h>
> -+#include <drm/drm_crtc_helper.h>
> -+#include <drm/drm_crtc.h>
> -+
> -+#include "glamo-core.h"
> -+#include "glamo-drm-private.h"
> -+#include "glamo-display.h"
> -+#include "glamo-buffer.h"
> -+
> -+
> -+struct glamofb_par {
> -+	struct drm_device *dev;
> -+	struct drm_display_mode *our_mode;
> -+	struct glamo_framebuffer *glamo_fb;
> -+	int crtc_count;
> -+	/* crtc currently bound to this */
> -+	uint32_t crtc_ids[2];
> -+};
> -+
> -+
> -+static int glamofb_setcolreg(unsigned regno, unsigned red, unsigned green,
> -+			unsigned blue, unsigned transp,
> -+			struct fb_info *info)
> -+{
> -+	struct glamofb_par *par = info->par;
> -+	struct drm_device *dev = par->dev;
> -+	struct drm_crtc *crtc;
> -+	int i;
> -+
> -+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -+		struct glamo_crtc *glamo_crtc = to_glamo_crtc(crtc);
> -+		struct drm_mode_set *modeset = &glamo_crtc->mode_set;
> -+		struct drm_framebuffer *fb = modeset->fb;
> -+
> -+		for (i = 0; i < par->crtc_count; i++)
> -+			if (crtc->base.id == par->crtc_ids[i])
> -+				break;
> -+
> -+		if (i == par->crtc_count)
> -+			continue;
> -+
> -+
> -+		if (regno > 255)
> -+			return 1;
> -+
> -+		if (regno < 16) {
> -+			switch (fb->depth) {
> -+			case 15:
> -+				fb->pseudo_palette[regno] = ((red & 0xf800) >> 1) |
> -+					((green & 0xf800) >>  6) |
> -+					((blue & 0xf800) >> 11);
> -+				break;
> -+			case 16:
> -+				fb->pseudo_palette[regno] = (red & 0xf800) |
> -+					((green & 0xfc00) >>  5) |
> -+					((blue  & 0xf800) >> 11);
> -+				break;
> -+			case 24:
> -+			case 32:
> -+				fb->pseudo_palette[regno] = ((red & 0xff00) << 8) |
> -+					(green & 0xff00) |
> -+					((blue  & 0xff00) >> 8);
> -+				break;
> -+			}
> -+		}
> -+	}
> -+	return 0;
> -+}
> -+
> -+static int glamofb_check_var(struct fb_var_screeninfo *var,
> -+			struct fb_info *info)
> -+{
> -+	struct glamofb_par *par = info->par;
> -+	struct glamo_framebuffer *glamo_fb = par->glamo_fb;
> -+	struct drm_framebuffer *fb = &glamo_fb->base;
> -+	int depth;
> -+
> -+	/* Need to resize the fb object !!! */
> -+	if (var->xres > fb->width || var->yres > fb->height) {
> -+		DRM_ERROR("Cannot resize framebuffer object (%dx%d > %dx%d)\n",
> -+		          var->xres,var->yres,fb->width,fb->height);
> -+		DRM_ERROR("Need resizing code.\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	switch (var->bits_per_pixel) {
> -+	case 16:
> -+		depth = (var->green.length == 6) ? 16 : 15;
> -+		break;
> -+	case 32:
> -+		depth = (var->transp.length > 0) ? 32 : 24;
> -+		break;
> -+	default:
> -+		depth = var->bits_per_pixel;
> -+		break;
> -+	}
> -+
> -+	switch (depth) {
> -+	case 16:
> -+		var->red.offset = 11;
> -+		var->green.offset = 5;
> -+		var->blue.offset = 0;
> -+		var->red.length = 5;
> -+		var->green.length = 6;
> -+		var->blue.length = 5;
> -+		var->transp.length = 0;
> -+		var->transp.offset = 0;
> -+		break;
> -+	default:
> -+		return -EINVAL;
> -+	}
> -+
> -+	return 0;
> -+}
> -+
> -+/* this will let fbcon do the mode init */
> -+/* FIXME: take mode config lock? */
> -+static int glamofb_set_par(struct fb_info *info)
> -+{
> -+	struct glamofb_par *par = info->par;
> -+	struct drm_device *dev = par->dev;
> -+	struct fb_var_screeninfo *var = &info->var;
> -+	int i;
> -+
> -+	DRM_DEBUG("%d %d\n", var->xres, var->pixclock);
> -+
> -+	if (var->pixclock != -1) {
> -+
> -+		DRM_ERROR("PIXEL CLOCK SET\n");
> -+		return -EINVAL;
> -+	} else {
> -+		struct drm_crtc *crtc;
> -+		int ret;
> -+
> -+		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -+			struct glamo_crtc *glamo_crtc = to_glamo_crtc(crtc);
> -+
> -+			for (i = 0; i < par->crtc_count; i++)
> -+				if (crtc->base.id == par->crtc_ids[i])
> -+					break;
> -+
> -+			if (i == par->crtc_count)
> -+				continue;
> -+
> -+			if (crtc->fb == glamo_crtc->mode_set.fb) {
> -+				mutex_lock(&dev->mode_config.mutex);
> -+				ret = crtc->funcs->set_config(&glamo_crtc->mode_set);
> -+				mutex_unlock(&dev->mode_config.mutex);
> -+				if (ret)
> -+					return ret;
> -+			}
> -+		}
> -+		return 0;
> -+	}
> -+}
> -+
> -+static int glamofb_pan_display(struct fb_var_screeninfo *var,
> -+				struct fb_info *info)
> -+{
> -+	struct glamofb_par *par = info->par;
> -+	struct drm_device *dev = par->dev;
> -+	struct drm_mode_set *modeset;
> -+	struct drm_crtc *crtc;
> -+	struct glamo_crtc *glamo_crtc;
> -+	int ret = 0;
> -+	int i;
> -+
> -+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -+		for (i = 0; i < par->crtc_count; i++)
> -+			if (crtc->base.id == par->crtc_ids[i])
> -+				break;
> -+
> -+		if (i == par->crtc_count)
> -+			continue;
> -+
> -+		glamo_crtc = to_glamo_crtc(crtc);
> -+		modeset = &glamo_crtc->mode_set;
> -+
> -+		modeset->x = var->xoffset;
> -+		modeset->y = var->yoffset;
> -+
> -+		if (modeset->num_connectors) {
> -+			mutex_lock(&dev->mode_config.mutex);
> -+			ret = crtc->funcs->set_config(modeset);
> -+			mutex_unlock(&dev->mode_config.mutex);
> -+			if (!ret) {
> -+				info->var.xoffset = var->xoffset;
> -+				info->var.yoffset = var->yoffset;
> -+			}
> -+		}
> -+	}
> -+
> -+	return ret;
> -+}
> -+
> -+static void glamofb_on(struct fb_info *info)
> -+{
> -+	struct glamofb_par *par = info->par;
> -+	struct drm_device *dev = par->dev;
> -+	struct drm_crtc *crtc;
> -+	struct drm_encoder *encoder;
> -+	int i;
> -+
> -+	/*
> -+	 * For each CRTC in this fb, find all associated encoders
> -+	 * and turn them off, then turn off the CRTC.
> -+	 */
> -+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -+		struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
> -+
> -+		for (i = 0; i < par->crtc_count; i++)
> -+			if (crtc->base.id == par->crtc_ids[i])
> -+				break;
> -+
> -+		crtc_funcs->dpms(crtc, DRM_MODE_DPMS_ON);
> -+
> -+		/* Found a CRTC on this fb, now find encoders */
> -+		list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
> -+			if (encoder->crtc == crtc) {
> -+				struct drm_encoder_helper_funcs *encoder_funcs;
> -+				encoder_funcs = encoder->helper_private;
> -+				encoder_funcs->dpms(encoder, DRM_MODE_DPMS_ON);
> -+			}
> -+		}
> -+	}
> -+}
> -+
> -+static void glamofb_off(struct fb_info *info, int dpms_mode)
> -+{
> -+	struct glamofb_par *par = info->par;
> -+	struct drm_device *dev = par->dev;
> -+	struct drm_crtc *crtc;
> -+	struct drm_encoder *encoder;
> -+	int i;
> -+
> -+	/*
> -+	 * For each CRTC in this fb, find all associated encoders
> -+	 * and turn them off, then turn off the CRTC.
> -+	 */
> -+	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -+		struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
> -+
> -+		for (i = 0; i < par->crtc_count; i++)
> -+			if (crtc->base.id == par->crtc_ids[i])
> -+				break;
> -+
> -+		/* Found a CRTC on this fb, now find encoders */
> -+		list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
> -+			if (encoder->crtc == crtc) {
> -+				struct drm_encoder_helper_funcs *encoder_funcs;
> -+				encoder_funcs = encoder->helper_private;
> -+				encoder_funcs->dpms(encoder, dpms_mode);
> -+			}
> -+		}
> -+		if (dpms_mode == DRM_MODE_DPMS_OFF)
> -+			crtc_funcs->dpms(crtc, dpms_mode);
> -+	}
> -+}
> -+
> -+static int glamofb_blank(int blank, struct fb_info *info)
> -+{
> -+	switch (blank) {
> -+	case FB_BLANK_UNBLANK:
> -+		glamofb_on(info);
> -+		break;
> -+	case FB_BLANK_NORMAL:
> -+		glamofb_off(info, DRM_MODE_DPMS_STANDBY);
> -+		break;
> -+	case FB_BLANK_HSYNC_SUSPEND:
> -+		glamofb_off(info, DRM_MODE_DPMS_STANDBY);
> -+		break;
> -+	case FB_BLANK_VSYNC_SUSPEND:
> -+		glamofb_off(info, DRM_MODE_DPMS_SUSPEND);
> -+		break;
> -+	case FB_BLANK_POWERDOWN:
> -+		glamofb_off(info, DRM_MODE_DPMS_OFF);
> -+		break;
> -+	}
> -+	return 0;
> -+}
> -+
> -+static struct fb_ops glamofb_ops = {
> -+	.owner = THIS_MODULE,
> -+	.fb_check_var = glamofb_check_var,
> -+	.fb_set_par = glamofb_set_par,
> -+	.fb_setcolreg = glamofb_setcolreg,
> -+	.fb_fillrect = cfb_fillrect,
> -+	.fb_copyarea = cfb_copyarea,
> -+	.fb_imageblit = cfb_imageblit,
> -+	.fb_pan_display = glamofb_pan_display,
> -+	.fb_blank = glamofb_blank,
> -+};
> -+
> -+
> -+#define RESSIZE(ressource) (((ressource)->end - (ressource)->start)+1)
> -+
> -+
> -+/* Here, we create a GEM object of the correct size, and then turn it into
> -+ * /dev/fbX so that the kernel can put a console on it. */
> -+int glamofb_create(struct drm_device *dev, uint32_t fb_width,
> -+                   uint32_t fb_height, uint32_t surface_width,
> -+                   uint32_t surface_height, int colour_mode,
> -+                   struct glamo_framebuffer **glamo_fb_p)
> -+{
> -+	struct fb_info *info;
> -+	struct glamofb_par *par;
> -+	struct drm_framebuffer *fb;
> -+	struct glamo_framebuffer *glamo_fb;
> -+	struct drm_mode_fb_cmd mode_cmd;
> -+	struct drm_gem_object *fbo = NULL;
> -+	struct drm_glamo_gem_object *gobj;
> -+	struct device *device = &dev->platform_dev->dev;
> -+	struct glamodrm_handle *gdrm;
> -+	int size, ret;
> -+	unsigned long offs;
> -+
> -+	gdrm = dev->dev_private;
> -+
> -+	mode_cmd.width = surface_width;
> -+	mode_cmd.height = surface_height;
> -+
> -+	mode_cmd.bpp = 16;
> -+	mode_cmd.pitch = ALIGN(mode_cmd.width * ((mode_cmd.bpp + 1) / 8), 64);
> -+	mode_cmd.depth = 16;
> -+
> -+	size = mode_cmd.pitch * mode_cmd.height;
> -+	size = ALIGN(size, PAGE_SIZE);
> -+	if ( size > GLAMO_FRAMEBUFFER_ALLOCATION ) {
> -+		printk(KERN_ERR "[glamo-drm] Not enough memory for fb\n");
> -+		ret = -ENOMEM;
> -+		goto out;
> -+	}
> -+	fbo = glamo_gem_object_alloc(dev, GLAMO_FRAMEBUFFER_ALLOCATION, 2);
> -+	if (!fbo) {
> -+		printk(KERN_ERR "[glamo-drm] Failed to allocate framebuffer\n");
> -+		ret = -ENOMEM;
> -+		goto out;
> -+	}
> -+	gobj = fbo->driver_private;
> -+
> -+	mutex_lock(&dev->struct_mutex);
> -+
> -+	ret = glamo_framebuffer_create(dev, &mode_cmd, &fb, fbo);
> -+	if (ret) {
> -+		DRM_ERROR("failed to allocate fb.\n");
> -+		goto out_unref;
> -+	}
> -+
> -+	list_add(&fb->filp_head, &dev->mode_config.fb_kernel_list);
> -+
> -+	glamo_fb = to_glamo_framebuffer(fb);
> -+	*glamo_fb_p = glamo_fb;
> -+
> -+	info = framebuffer_alloc(sizeof(struct glamofb_par), device);
> -+	if (!info) {
> -+		ret = -ENOMEM;
> -+		goto out_unref;
> -+	}
> -+
> -+	par = info->par;
> -+
> -+	strcpy(info->fix.id, "glamodrmfb");
> -+	info->fix.type = FB_TYPE_PACKED_PIXELS;
> -+	info->fix.visual = FB_VISUAL_TRUECOLOR;
> -+	info->fix.type_aux = 0;
> -+	info->fix.xpanstep = 1; /* doing it in hw */
> -+	info->fix.ypanstep = 1; /* doing it in hw */
> -+	info->fix.ywrapstep = 0;
> -+	info->fix.accel = FB_ACCEL_GLAMO;
> -+	info->fix.type_aux = 0;
> -+	info->flags = FBINFO_DEFAULT;
> -+
> -+	info->fbops = &glamofb_ops;
> -+
> -+	info->fix.line_length = fb->pitch;
> -+	info->fix.smem_start = dev->mode_config.fb_base
> -+	                        + (unsigned long) gdrm->vram->start;
> -+	info->fix.smem_len = size;
> -+
> -+	info->flags = FBINFO_DEFAULT;
> -+
> -+	offs = gobj->block->start;
> -+	info->screen_base = ioremap(gdrm->vram->start + offs + GLAMO_OFFSET_FB,
> -+	                            GLAMO_FRAMEBUFFER_ALLOCATION);
> -+	if (!info->screen_base) {
> -+		printk(KERN_ERR "[glamo-drm] Couldn't map framebuffer!\n");
> -+		ret = -ENOSPC;
> -+		goto out_unref;
> -+	}
> -+	info->screen_size = size;
> -+
> -+	info->pseudo_palette = fb->pseudo_palette;
> -+	info->var.xres_virtual = fb->width;
> -+	info->var.yres_virtual = fb->height;
> -+	info->var.bits_per_pixel = fb->bits_per_pixel;
> -+	info->var.xoffset = 0;
> -+	info->var.yoffset = 0;
> -+	info->var.activate = FB_ACTIVATE_NOW;
> -+	info->var.height = -1;
> -+	info->var.width = -1;
> -+	info->var.xres = fb_width;
> -+	info->var.yres = fb_height;
> -+
> -+	info->fix.mmio_start = 0;
> -+	info->fix.mmio_len = 0;
> -+
> -+	info->pixmap.size = 64*1024;
> -+	info->pixmap.buf_align = 8;
> -+	info->pixmap.access_align = 32;
> -+	info->pixmap.flags = FB_PIXMAP_SYSTEM;
> -+	info->pixmap.scan_align = 1;
> -+
> -+	switch (fb->depth) {
> -+	case 16:
> -+		switch ( colour_mode ) {
> -+		case GLAMO_FB_RGB565:
> -+			info->var.red.offset	= 11;
> -+			info->var.green.offset	= 5;
> -+			info->var.blue.offset	= 0;
> -+			info->var.red.length	= 5;
> -+			info->var.green.length	= 6;
> -+			info->var.blue.length	= 5;
> -+			info->var.transp.length	= 0;
> -+			break;
> -+		case GLAMO_FB_ARGB1555:
> -+			info->var.transp.offset	= 15;
> -+			info->var.red.offset	= 10;
> -+			info->var.green.offset	= 5;
> -+			info->var.blue.offset	= 0;
> -+			info->var.transp.length	= 1;
> -+			info->var.red.length	= 5;
> -+			info->var.green.length	= 5;
> -+			info->var.blue.length	= 5;
> -+			break;
> -+		case GLAMO_FB_ARGB4444:
> -+			info->var.transp.offset	= 12;
> -+			info->var.red.offset	= 8;
> -+			info->var.green.offset	= 4;
> -+			info->var.blue.offset	= 0;
> -+			info->var.transp.length	= 4;
> -+			info->var.red.length	= 4;
> -+			info->var.green.length	= 4;
> -+			info->var.blue.length	= 4;
> -+			break;
> -+		}
> -+		break;
> -+	case 24:
> -+	case 32:
> -+	default:
> -+		/* The Smedia Glamo doesn't support anything but 16bit color */
> -+		printk(KERN_ERR "[glamo-drm] Only 16bpp is supported.\n");
> -+		return -EINVAL;
> -+	}
> -+
> -+	fb->fbdev = info;
> -+	par->glamo_fb = glamo_fb;
> -+	par->dev = dev;
> -+	gdrm->fb = info;
> -+
> -+	info->var.pixclock = -1;
> -+
> -+	printk(KERN_INFO "[glamo-drm] Allocated %dx%d fb: bo %p\n",
> -+	       glamo_fb->base.width, glamo_fb->base.height, fbo);
> -+	mutex_unlock(&dev->struct_mutex);
> -+	return 0;
> -+
> -+out_unref:
> -+	drm_gem_object_unreference(fbo);
> -+	mutex_unlock(&dev->struct_mutex);
> -+out:
> -+	return ret;
> -+}
> -+
> -+
> -+void glamo_kmsfb_suspend(struct glamodrm_handle *gdrm)
> -+{
> -+	fb_set_suspend(gdrm->fb, 1);
> -+}
> -+
> -+
> -+void glamo_kmsfb_resume(struct glamodrm_handle *gdrm)
> -+{
> -+	fb_set_suspend(gdrm->fb, 0);
> -+}
> -diff --git a/drivers/mfd/glamo/glamo-kms-fb.h b/drivers/mfd/glamo/glamo-kms-fb.h
> -new file mode 100644
> -index 0000000..1960e76
> ---- /dev/null
> -+++ b/drivers/mfd/glamo/glamo-kms-fb.h
> -@@ -0,0 +1,41 @@
> -+/*
> -+ * SMedia Glamo 336x/337x KMS framebuffer
> -+ *
> -+ * Copyright (C) 2009 Thomas White <taw@bitwiz.org.uk>
> -+ *
> -+ * Based on glamo-fb.c (C) 2007-2008 by Openmoko, Inc.
> -+ * Author: Harald Welte <laforge@openmoko.org>
> -+ * All rights reserved.
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of
> -+ * the License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+ * GNU General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License
> -+ * along with this program; if not, write to the Free Software
> -+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> -+ * MA 02111-1307 USA
> -+ *
> -+ */
> -+
> -+#ifndef __GLAMO_KMS_FB_H
> -+#define __GLAMO_KMS_FB_H
> -+
> -+#include <drm/drmP.h>
> -+#include "glamo-drm-private.h"
> -+
> -+extern int glamofb_create(struct drm_device *dev, uint32_t fb_width,
> -+                          uint32_t fb_height, uint32_t surface_width,
> -+                          uint32_t surface_height, int colour_mode,
> -+                          struct glamo_framebuffer **glamo_fb_p);
> -+
> -+extern void glamo_kmsfb_suspend(struct glamodrm_handle *gdrm);
> -+extern void glamo_kmsfb_resume(struct glamodrm_handle *gdrm);
> -+
> -+#endif /* __GLAMO_KMS_FB_H */
> -diff --git a/include/drm/Kbuild b/include/drm/Kbuild
> -index b940fdf..48b7b55 100644
> ---- a/include/drm/Kbuild
> -+++ b/include/drm/Kbuild
> -@@ -8,3 +8,4 @@ unifdef-y += radeon_drm.h
> - unifdef-y += sis_drm.h
> - unifdef-y += savage_drm.h
> - unifdef-y += via_drm.h
> -+unifdef-y += glamo_drm.h
> -diff --git a/include/drm/glamo_drm.h b/include/drm/glamo_drm.h
> -new file mode 100644
> -index 0000000..4c194dc
> ---- /dev/null
> -+++ b/include/drm/glamo_drm.h
> -@@ -0,0 +1,153 @@
> -+/* glamo_drm.h -- Public header for the Glamo driver
> -+ *
> -+ * Copyright 2009 Thomas White
> -+ * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
> -+ * Copyright 2000 VA Linux Systems, Inc., Fremont, California.
> -+ * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
> -+ * All rights reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtaining a
> -+ * copy of this software and associated documentation files (the "Software"),
> -+ * to deal in the Software without restriction, including without limitation
> -+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> -+ * and/or sell copies of the Software, and to permit persons to whom the
> -+ * Software is furnished to do so, subject to the following conditions:
> -+ *
> -+ * The above copyright notice and this permission notice (including the next
> -+ * paragraph) shall be included in all copies or substantial portions of the
> -+ * Software.
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> -+ * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> -+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> -+ * DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * Authors:
> -+ *    Thomas White <taw@bitwiz.org.uk>
> -+ *    Kevin E. Martin <martin@valinux.com>
> -+ *    Gareth Hughes <gareth@valinux.com>
> -+ *    Keith Whitwell <keith@tungstengraphics.com>
> -+ */
> -+
> -+#ifndef __GLAMO_DRM_H__
> -+#define __GLAMO_DRM_H__
> -+
> -+#include "drm.h"
> -+
> -+#define GLAMO_GEM_DOMAIN_VRAM (0x1)
> -+
> -+/* Glamo specific ioctls */
> -+#define DRM_GLAMO_CMDBUF     0x01
> -+#define DRM_GLAMO_SWAP       0x02
> -+#define DRM_GLAMO_CMDBURST   0x03
> -+
> -+#define DRM_GLAMO_GEM_INFO     0x1c
> -+#define DRM_GLAMO_GEM_CREATE   0x1d
> -+#define DRM_GLAMO_GEM_MMAP     0x1e
> -+#define DRM_GLAMO_GEM_PIN      0x1f
> -+#define DRM_GLAMO_GEM_UNPIN    0x20
> -+#define DRM_GLAMO_GEM_PREAD    0x21
> -+#define DRM_GLAMO_GEM_PWRITE   0x22
> -+#define DRM_GLAMO_GEM_WAIT_RENDERING 0x24
> -+
> -+#define DRM_IOCTL_GLAMO_CMDBUF     DRM_IOW(DRM_COMMAND_BASE + DRM_GLAMO_CMDBUF, drm_glamo_cmd_buffer_t)
> -+#define DRM_IOCTL_GLAMO_SWAP       DRM_IO(DRM_COMMAND_BASE + DRM_GLAMO_SWAP)
> -+#define DRM_IOCTL_GLAMO_CMDBURST     DRM_IOW(DRM_COMMAND_BASE + DRM_GLAMO_CMDBURST, drm_glamo_cmd_burst_t)
> -+
> -+#define DRM_IOCTL_GLAMO_GEM_INFO   DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAMO_GEM_INFO, struct drm_glamo_gem_info)
> -+#define DRM_IOCTL_GLAMO_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAMO_GEM_CREATE, struct drm_glamo_gem_create)
> -+#define DRM_IOCTL_GLAMO_GEM_MMAP   DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAMO_GEM_MMAP, struct drm_glamo_gem_mmap)
> -+#define DRM_IOCTL_GLAMO_GEM_PIN    DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAMO_GEM_PIN, struct drm_glamo_gem_pin)
> -+#define DRM_IOCTL_GLAMO_GEM_UNPIN  DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAMO_GEM_UNPIN, struct drm_glamo_gem_unpin)
> -+#define DRM_IOCTL_GLAMO_GEM_PREAD  DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAMO_GEM_PREAD, struct drm_glamo_gem_pread)
> -+#define DRM_IOCTL_GLAMO_GEM_PWRITE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAMO_GEM_PWRITE, struct drm_glamo_gem_pwrite)
> -+#define DRM_IOCTL_GLAMO_GEM_WAIT_RENDERING DRM_IOW(DRM_COMMAND_BASE + DRM_GLAMO_GEM_WAIT_RENDERING, struct drm_glamo_gem_wait_rendering)
> -+
> -+
> -+/* Simple command submission - a list of 16-bit address-data pairs */
> -+typedef struct drm_glamo_cmd_buffer {
> -+	unsigned int bufsz;	/* Size of buffer, in bytes */
> -+	char __user *buf;	/* Buffer of stuff to go onto the ring buffer */
> -+	unsigned int *obj_pos;	/* Offsets (in bytes) at which to put objs */
> -+	uint32_t *objs;		/* List of buffer object (handles) to use */
> -+	unsigned int nobjs;	/* Number of objects referenced */
> -+	int nbox;
> -+	struct drm_clip_rect __user *boxes;
> -+} drm_glamo_cmd_buffer_t;
> -+
> -+
> -+/* Burst command submission - base address and data:
> -+ *  - Data can be 32-bit (more easily)
> -+ *  - Easier for the kernel to validate */
> -+typedef struct drm_glamo_cmd_burst {
> -+	uint16_t base;		/* Base address (command) */
> -+	int bufsz;		/* Size of data, in bytes */
> -+	uint16_t *data;		/* Pointer to data */
> -+	unsigned int *obj_pos;	/* Offsets (in bytes) at which to put objs */
> -+	uint32_t *objs;		/* List of buffer object (handles) to use */
> -+	unsigned int nobjs;	/* Number of objects referenced */
> -+} drm_glamo_cmd_burst_t;
> -+
> -+struct drm_glamo_gem_info {
> -+	uint64_t vram_start;
> -+	uint64_t vram_size;
> -+};
> -+
> -+struct drm_glamo_gem_create {
> -+	uint64_t size;
> -+	uint64_t alignment;
> -+	uint32_t handle;
> -+	uint32_t initial_domain; // to allow VRAM to be created
> -+	uint32_t no_backing_store;
> -+};
> -+
> -+struct drm_glamo_gem_mmap {
> -+	uint32_t handle;	/* Handle goes in... */
> -+	uint64_t offset;	/* ...offset comes out */
> -+};
> -+
> -+struct drm_glamo_gem_wait_rendering {
> -+	uint32_t handle;
> -+	int have_handle;
> -+};
> -+
> -+struct drm_glamo_gem_pin {
> -+	uint32_t handle;
> -+	uint32_t pin_domain;
> -+	uint64_t alignment;
> -+	uint64_t offset;
> -+};
> -+
> -+struct drm_glamo_gem_unpin {
> -+	uint32_t handle;
> -+	uint32_t pad;
> -+};
> -+
> -+struct drm_glamo_gem_pread {
> -+	/** Handle for the object being read. */
> -+	uint32_t handle;
> -+	uint32_t pad;
> -+	/** Offset into the object to read from */
> -+	uint64_t offset;
> -+	/** Length of data to read */
> -+	uint64_t size;
> -+	/** Pointer to write the data into. */
> -+	uint64_t data_ptr;	/* void *, but pointers are not 32/64 compatible */
> -+};
> -+
> -+struct drm_glamo_gem_pwrite {
> -+	/** Handle for the object being written to. */
> -+	uint32_t handle;
> -+	uint32_t pad;
> -+	/** Offset into the object to write to */
> -+	uint64_t offset;
> -+	/** Length of data to write */
> -+	uint64_t size;
> -+	/** Pointer to read the data from. */
> -+	uint64_t data_ptr;	/* void *, but pointers are not 32/64 compatible */
> -+};
> -+
> -+#endif
> --- 
> -1.6.5.3
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0003-Work-on-Glamo-core-for-DRM.patch b/recipes/linux/linux-openmoko-2.6.31/0003-Work-on-Glamo-core-for-DRM.patch
> deleted file mode 100644
> index 76223ed..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0003-Work-on-Glamo-core-for-DRM.patch
> +++ /dev/null
> @@ -1,252 +0,0 @@
> -From 50c9919c9bc7d3e1db72dcbdd62d73efad409720 Mon Sep 17 00:00:00 2001
> -From: Thomas White <taw@bitwiz.org.uk>
> -Date: Tue, 17 Nov 2009 23:45:29 +0100
> -Subject: [PATCH 3/4] Work on Glamo-core for DRM
> -
> -This adds modifications to the core of the Glamo driver to expose functionality
> -to support DRM and KMS.
> -
> -Signed-off-by: Thomas White <taw@bitwiz.org.uk>
> ----
> - drivers/mfd/glamo/glamo-core.c |   85 +++++++++++++++++++++++++++++++++++++---
> - drivers/mfd/glamo/glamo-core.h |   45 ++++++++++++++++-----
> - drivers/mfd/glamo/glamo-regs.h |   24 +++++++++++
> - include/linux/mfd/glamo.h      |    7 +--
> - 4 files changed, 140 insertions(+), 21 deletions(-)
> -
> -diff --git a/drivers/mfd/glamo/glamo-core.c b/drivers/mfd/glamo/glamo-core.c
> -index e0e3940..32aeff1 100644
> ---- a/drivers/mfd/glamo/glamo-core.c
> -+++ b/drivers/mfd/glamo/glamo-core.c
> -@@ -221,10 +221,31 @@ static struct resource glamo_fb_resources[] = {
> - 		.flags	= IORESOURCE_MEM,
> - 	}, {
> - 		.name	= "glamo-fb-mem",
> --		.start	= GLAMO_OFFSET_FB,
> --		.end	= GLAMO_OFFSET_FB + GLAMO_FB_SIZE - 1,
> -+		.start	= GLAMO_MEM_BASE + GLAMO_OFFSET_FB,
> -+		.end	= GLAMO_MEM_BASE + GLAMO_OFFSET_FB + GLAMO_FB_SIZE - 1,
> - 		.flags	= IORESOURCE_MEM,
> --	},
> -+	}, {
> -+		.name	= "glamo-cmdq-regs",
> -+		.start  = GLAMO_REGOFS_CMDQUEUE,
> -+		.end    = GLAMO_REGOFS_RISC - 1,
> -+		.flags  = IORESOURCE_MEM,
> -+	}, {
> -+		.name	= "glamo-command-queue",
> -+		.start  = GLAMO_MEM_BASE + GLAMO_OFFSET_CMDQ,
> -+		.end    = GLAMO_MEM_BASE + GLAMO_OFFSET_CMDQ +
> -+			  GLAMO_CMDQ_SIZE - 1,
> -+		.flags  = IORESOURCE_MEM,
> -+	}, {
> -+		.name	= "glamo-2d-regs",
> -+		.start  = GLAMO_REGOFS_2D,
> -+		.end    = GLAMO_REGOFS_3D- 1,
> -+		.flags  = IORESOURCE_MEM,
> -+	}, {
> -+		.name	= "glamo-2d-irq",
> -+		.start	= GLAMO_IRQ_2D,
> -+		.end	= GLAMO_IRQ_2D,
> -+		.flags	= IORESOURCE_IRQ,
> -+	}
> - };
> - 
> - static struct resource glamo_mmc_resources[] = {
> -@@ -235,9 +256,9 @@ static struct resource glamo_mmc_resources[] = {
> - 		.flags	= IORESOURCE_MEM
> - 	}, {
> - 		.name	= "glamo-mmc-mem",
> --		.start	= GLAMO_OFFSET_FB + GLAMO_FB_SIZE,
> --		.end	= GLAMO_OFFSET_FB + GLAMO_FB_SIZE +
> --				  GLAMO_MMC_BUFFER_SIZE - 1,
> -+		.start	= GLAMO_MEM_BASE + GLAMO_OFFSET_MMC,
> -+		.end	= GLAMO_MEM_BASE + GLAMO_OFFSET_MMC
> -+		                         + GLAMO_MMC_BUFFER_SIZE - 1,
> - 		.flags	= IORESOURCE_MEM
> - 	}, {
> - 		.start	= GLAMO_IRQ_MMC,
> -@@ -354,6 +375,24 @@ static void glamo_irq_demux_handler(unsigned int irq, struct irq_desc *desc)
> - sysfs
> - */
> - 
> -+void glamo_clear_irq(struct glamo_core *glamo, unsigned int irq)
> -+{
> -+	/* set interrupt source */
> -+	__reg_write(glamo, GLAMO_REG_IRQ_CLEAR, irq);
> -+}
> -+
> -+
> -+void glamo_enable_irq(struct glamo_core *glamo, unsigned int irq)
> -+{
> -+	u_int16_t tmp;
> -+
> -+	/* set bit in enable register */
> -+	tmp = __reg_read(glamo, GLAMO_REG_IRQ_ENABLE);
> -+	tmp |= irq;
> -+	__reg_write(glamo, GLAMO_REG_IRQ_ENABLE, tmp);
> -+}
> -+
> -+
> - static ssize_t regs_write(struct device *dev, struct device_attribute *attr,
> - 				const char *buf, size_t count)
> - {
> -@@ -579,6 +618,40 @@ int glamo_engine_disable(struct glamo_core *glamo, enum glamo_engine engine)
> - }
> - EXPORT_SYMBOL_GPL(glamo_engine_disable);
> - 
> -+
> -+static const u_int16_t engine_clock_regs[__NUM_GLAMO_ENGINES] = {
> -+	[GLAMO_ENGINE_LCD]	= GLAMO_REG_CLOCK_LCD,
> -+	[GLAMO_ENGINE_MMC]	= GLAMO_REG_CLOCK_MMC,
> -+	[GLAMO_ENGINE_ISP]	= GLAMO_REG_CLOCK_ISP,
> -+	[GLAMO_ENGINE_JPEG]	= GLAMO_REG_CLOCK_JPEG,
> -+	[GLAMO_ENGINE_3D]	= GLAMO_REG_CLOCK_3D,
> -+	[GLAMO_ENGINE_2D]	= GLAMO_REG_CLOCK_2D,
> -+	[GLAMO_ENGINE_MPEG_ENC] = GLAMO_REG_CLOCK_MPEG,
> -+	[GLAMO_ENGINE_MPEG_DEC] = GLAMO_REG_CLOCK_MPEG,
> -+};
> -+
> -+void glamo_engine_clkreg_set(struct glamo_core *glamo,
> -+			     enum glamo_engine engine,
> -+			     u_int16_t mask, u_int16_t val)
> -+{
> -+	reg_set_bit_mask(glamo, engine_clock_regs[engine], mask, val);
> -+}
> -+EXPORT_SYMBOL_GPL(glamo_engine_clkreg_set);
> -+
> -+u_int16_t glamo_engine_clkreg_get(struct glamo_core *glamo,
> -+				  enum glamo_engine engine)
> -+{
> -+	u_int16_t val;
> -+
> -+	spin_lock(&glamo->lock);
> -+	val = __reg_read(glamo, engine_clock_regs[engine]);
> -+	spin_unlock(&glamo->lock);
> -+
> -+	return val;
> -+}
> -+EXPORT_SYMBOL_GPL(glamo_engine_clkreg_get);
> -+
> -+
> - int __glamo_engine_suspend(struct glamo_core *glamo, enum glamo_engine engine)
> - {
> - 	int i;
> -diff --git a/drivers/mfd/glamo/glamo-core.h b/drivers/mfd/glamo/glamo-core.h
> -index e5b1a35..ea6caa3 100644
> ---- a/drivers/mfd/glamo/glamo-core.h
> -+++ b/drivers/mfd/glamo/glamo-core.h
> -@@ -3,18 +3,33 @@
> - 
> - #include <linux/mfd/glamo.h>
> - 
> -+/* Amount of Glamo memory */
> -+#define GLAMO_INTERNAL_RAM_SIZE 0x800000
> -+
> -+/* Arbitrarily determined amount for the hardware cursor */
> -+#define GLAMO_CURSOR_SIZE (4096)
> -+#define GLAMO_MMC_BUFFER_SIZE (64 * 1024) /* 64k MMC buffer */
> -+#define GLAMO_CMDQ_SIZE (128 * 1024)    /* 128k ring buffer */
> -+/* Remaining memory will be used for 2D and 3D graphics */
> -+#define GLAMO_FB_SIZE (GLAMO_INTERNAL_RAM_SIZE     \
> -+			 - GLAMO_CURSOR_SIZE       \
> -+			 - GLAMO_MMC_BUFFER_SIZE   \
> -+			 - GLAMO_CMDQ_SIZE)
> -+/* A 640x480, 16bpp, double-buffered framebuffer */
> -+#if (GLAMO_FB_SIZE < (640 * 480 * 4))	/* == 0x12c000 */
> -+#error Not enough Glamo VRAM for framebuffer!
> -+#endif
> -+
> - /* for the time being, we put the on-screen framebuffer into the lowest
> -  * VRAM space.  This should make the code easily compatible with the various
> -- * 2MB/4MB/8MB variants of the Smedia chips */
> --#define GLAMO_OFFSET_VRAM	0x800000
> --#define GLAMO_OFFSET_FB	(GLAMO_OFFSET_VRAM)
> --
> --/* we only allocate the minimum possible size for the framebuffer to make
> -- * sure we have sufficient memory for other functions of the chip */
> --/*#define GLAMO_FB_SIZE	(640*480*4)	*//* == 0x12c000 */
> --#define GLAMO_INTERNAL_RAM_SIZE 0x800000
> --#define GLAMO_MMC_BUFFER_SIZE (64 * 1024)
> --#define GLAMO_FB_SIZE	(GLAMO_INTERNAL_RAM_SIZE - GLAMO_MMC_BUFFER_SIZE)
> -+ * 2MB/4MB/8MB variants of the Smedia chips
> -+ * glamo-fb.c assumes FB comes first, followed by cursor, so DON'T MOVE THEM
> -+ * (see glamo_regs[] in glamo-fb.c for more information) */
> -+#define GLAMO_MEM_BASE 		(0x800000)
> -+#define GLAMO_OFFSET_FB		(0x000000)
> -+#define GLAMO_OFFSET_CURSOR	(GLAMO_OFFSET_FB + GLAMO_FB_SIZE)
> -+#define GLAMO_OFFSET_MMC	(GLAMO_OFFSET_CURSOR + GLAMO_CURSOR_SIZE)
> -+#define GLAMO_OFFSET_CMDQ	(GLAMO_OFFSET_MMC + GLAMO_MMC_BUFFER_SIZE)
> - 
> - enum glamo_pll {
> -     GLAMO_PLL1,
> -@@ -57,4 +72,14 @@ void glamo_reg_read_batch(struct glamo_core *glamo, uint16_t reg,
> - 				uint16_t count, uint16_t *values);
> - void glamo_reg_write_batch(struct glamo_core *glamo, uint16_t reg,
> - 				uint16_t count, uint16_t *values);
> -+void glamo_engine_clkreg_set(struct glamo_core *glamo,
> -+			     enum glamo_engine engine,
> -+			     u_int16_t mask, u_int16_t val);
> -+
> -+extern void glamo_clear_irq(struct glamo_core *glamo, unsigned int irq);
> -+extern void glamo_enable_irq(struct glamo_core *glamo, unsigned int irq);
> -+
> -+u_int16_t glamo_engine_clkreg_get(struct glamo_core *glamo,
> -+				  enum glamo_engine engine);
> -+
> - #endif /* __GLAMO_CORE_H */
> -diff --git a/drivers/mfd/glamo/glamo-regs.h b/drivers/mfd/glamo/glamo-regs.h
> -index 59848e1..8b2fd47 100644
> ---- a/drivers/mfd/glamo/glamo-regs.h
> -+++ b/drivers/mfd/glamo/glamo-regs.h
> -@@ -627,4 +627,28 @@ enum glamo_core_revisions {
> - 	GLAMO_CORE_REV_A3		= 0x0003,
> - };
> - 
> -+enum glamo_register_cq {
> -+	GLAMO_REG_CMDQ_BASE_ADDRL     = 0x00,
> -+	GLAMO_REG_CMDQ_BASE_ADDRH     = 0x02,
> -+	GLAMO_REG_CMDQ_LEN            = 0x04,
> -+	GLAMO_REG_CMDQ_WRITE_ADDRL    = 0x06,
> -+	GLAMO_REG_CMDQ_WRITE_ADDRH    = 0x08,
> -+	GLAMO_REG_CMDQ_FLIP           = 0x0a,
> -+	GLAMO_REG_CMDQ_CONTROL        = 0x0c,
> -+	GLAMO_REG_CMDQ_READ_ADDRL     = 0x0e,
> -+	GLAMO_REG_CMDQ_READ_ADDRH     = 0x10,
> -+	GLAMO_REG_CMDQ_STATUS         = 0x12,
> -+};
> -+
> -+#define REG_2D(x)		(GLAMO_REGOFS_2D+(x))
> -+
> -+enum glamo_register_2d {
> -+	GLAMO_REG_2D_DST_X		= REG_2D(0x0a),
> -+	GLAMO_REG_2D_COMMAND1           = REG_2D(0x3a),
> -+	GLAMO_REG_2D_STATUS		= REG_2D(0x42),
> -+	GLAMO_REG_2D_ID1		= REG_2D(0x44),
> -+	GLAMO_REG_2D_ID2		= REG_2D(0x46),
> -+	GLAMO_REG_2D_ID3		= REG_2D(0x48),
> -+};
> -+
> - #endif /* _GLAMO_REGS_H */
> -diff --git a/include/linux/mfd/glamo.h b/include/linux/mfd/glamo.h
> -index 529d4f0..ea91a06 100644
> ---- a/include/linux/mfd/glamo.h
> -+++ b/include/linux/mfd/glamo.h
> -@@ -41,12 +41,9 @@ enum glamo_engine {
> - 	GLAMO_ENGINE_RISC = 11,
> - 	GLAMO_ENGINE_MICROP1_MPEG_ENC = 12,
> - 	GLAMO_ENGINE_MICROP1_MPEG_DEC = 13,
> --#if 0
> --	GLAMO_ENGINE_H264_DEC = 14,
> --	GLAMO_ENGINE_RISC1 = 15,
> --	GLAMO_ENGINE_SPI = 16,
> --#endif
> - 	__NUM_GLAMO_ENGINES
> - };
> - 
> -+#define GLAMO_ENGINE_ALL (__NUM_GLAMO_ENGINES)
> -+
> - #endif
> --- 
> -1.6.5.3
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0004-Add-JBT6k74-hook-for-use-by-KMS.patch b/recipes/linux/linux-openmoko-2.6.31/0004-Add-JBT6k74-hook-for-use-by-KMS.patch
> deleted file mode 100644
> index a223f5b..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0004-Add-JBT6k74-hook-for-use-by-KMS.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 6035b76b940c71e30824921271e8c3da8047f869 Mon Sep 17 00:00:00 2001
> -From: Thomas White <taw@bitwiz.org.uk>
> -Date: Sat, 21 Nov 2009 21:42:16 +0100
> -Subject: [PATCH 4/4] Add JBT6k74 hook for use by KMS
> -
> -Signed-off-by: Thomas White <taw@bitwiz.org.uk>
> ----
> - drivers/video/backlight/jbt6k74.c |   18 ++++++++++++++++++
> - 1 files changed, 18 insertions(+), 0 deletions(-)
> -
> -diff --git a/drivers/video/backlight/jbt6k74.c b/drivers/video/backlight/jbt6k74.c
> -index b1aacb7..b9d02f2 100644
> ---- a/drivers/video/backlight/jbt6k74.c
> -+++ b/drivers/video/backlight/jbt6k74.c
> -@@ -688,6 +688,22 @@ static int jbt6k74_get_power(struct lcd_device *ld)
> - 	}
> - }
> - 
> -+/* This is utterly, totally horrible.  I'm REALLY sorry... */
> -+struct jbt_info *jbt_global;
> -+void jbt6k74_action(int val)
> -+{
> -+	if ( !jbt_global ) {
> -+		printk(KERN_CRIT "JBT not initialised!!!\n");
> -+		return;
> -+	}
> -+	if ( val == 0 ) {
> -+		jbt6k74_enter_power_mode(jbt_global, JBT_POWER_MODE_SLEEP);
> -+	} else {
> -+		jbt6k74_enter_power_mode(jbt_global, JBT_POWER_MODE_NORMAL);
> -+	}
> -+}
> -+EXPORT_SYMBOL_GPL(jbt6k74_action);
> -+
> - struct lcd_ops jbt6k74_lcd_ops = {
> - 	.set_power = jbt6k74_set_power,
> - 	.get_power = jbt6k74_get_power,
> -@@ -718,6 +734,8 @@ static int __devinit jbt_probe(struct spi_device *spi)
> - 	if (!jbt)
> - 		return -ENOMEM;
> - 
> -+	jbt_global = jbt;
> -+
> - 	jbt->spi = spi;
> - 
> - 	jbt->lcd_dev = lcd_device_register("jbt6k74-lcd", &spi->dev, jbt,
> --- 
> -1.6.5.3
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0004-gta02_defconfig-Enable-UBI-support.patch b/recipes/linux/linux-openmoko-2.6.31/0004-gta02_defconfig-Enable-UBI-support.patch
> deleted file mode 100644
> index 4ab88d3..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0004-gta02_defconfig-Enable-UBI-support.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From 513b35171de9efbbc0699bff5f2e5a324d2cd8ef Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 11:22:13 +0100
> -Subject: [PATCH 4/5] gta02_defconfig: Enable UBI support
> -
> ----
> - arch/arm/configs/gta02_defconfig |   22 +++++++++++++++++++---
> - 1 files changed, 19 insertions(+), 3 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_defconfig b/arch/arm/configs/gta02_defconfig
> -index b0a6d72..3f1b60b 100644
> ---- a/arch/arm/configs/gta02_defconfig
> -+++ b/arch/arm/configs/gta02_defconfig
> -@@ -648,7 +648,15 @@ CONFIG_MTD_NAND_S3C2410=y
> - #
> - # UBI - Unsorted block images
> - #
> --# CONFIG_MTD_UBI is not set
> -+CONFIG_MTD_UBI=y
> -+CONFIG_MTD_UBI_WL_THRESHOLD=4096
> -+CONFIG_MTD_UBI_BEB_RESERVE=1
> -+CONFIG_MTD_UBI_GLUEBI=y
> -+
> -+#
> -+# UBI debugging options
> -+#
> -+# CONFIG_MTD_UBI_DEBUG is not set
> - # CONFIG_PARPORT is not set
> - CONFIG_BLK_DEV=y
> - # CONFIG_BLK_DEV_COW_COMMON is not set
> -@@ -1478,6 +1486,12 @@ CONFIG_JFFS2_ZLIB=y
> - # CONFIG_JFFS2_LZO is not set
> - CONFIG_JFFS2_RTIME=y
> - # CONFIG_JFFS2_RUBIN is not set
> -+CONFIG_UBIFS_FS=y
> -+# CONFIG_UBIFS_FS_XATTR is not set
> -+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> -+CONFIG_UBIFS_FS_LZO=y
> -+CONFIG_UBIFS_FS_ZLIB=y
> -+# CONFIG_UBIFS_FS_DEBUG is not set
> - # CONFIG_CRAMFS is not set
> - # CONFIG_SQUASHFS is not set
> - # CONFIG_VXFS_FS is not set
> -@@ -1670,9 +1684,9 @@ CONFIG_CRYPTO_MD5=y
> - #
> - # Compression
> - #
> --# CONFIG_CRYPTO_DEFLATE is not set
> -+CONFIG_CRYPTO_DEFLATE=y
> - CONFIG_CRYPTO_ZLIB=y
> --# CONFIG_CRYPTO_LZO is not set
> -+CONFIG_CRYPTO_LZO=y
> - 
> - #
> - # Random Number Generation
> -@@ -1695,6 +1709,8 @@ CONFIG_CRC7=y
> - # CONFIG_LIBCRC32C is not set
> - CONFIG_ZLIB_INFLATE=y
> - CONFIG_ZLIB_DEFLATE=y
> -+CONFIG_LZO_COMPRESS=y
> -+CONFIG_LZO_DECOMPRESS=y
> - CONFIG_DECOMPRESS_GZIP=y
> - CONFIG_DECOMPRESS_BZIP2=y
> - CONFIG_DECOMPRESS_LZMA=y
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0005-gta02_defconfig-Enable-UBI-debug.patch b/recipes/linux/linux-openmoko-2.6.31/0005-gta02_defconfig-Enable-UBI-debug.patch
> deleted file mode 100644
> index 9aecf64..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0005-gta02_defconfig-Enable-UBI-debug.patch
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -From 5ae14aa9c5eea7178a8de28515b45d600ecb7a13 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 11:24:01 +0100
> -Subject: [PATCH 5/5] gta02_defconfig: Enable UBI debug
> -
> ----
> - arch/arm/configs/gta02_defconfig |   23 +++++++++++++++++++++--
> - 1 files changed, 21 insertions(+), 2 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_defconfig b/arch/arm/configs/gta02_defconfig
> -index 3f1b60b..0f53baf 100644
> ---- a/arch/arm/configs/gta02_defconfig
> -+++ b/arch/arm/configs/gta02_defconfig
> -@@ -76,6 +76,7 @@ CONFIG_ANON_INODES=y
> - CONFIG_UID16=y
> - CONFIG_SYSCTL_SYSCALL=y
> - CONFIG_KALLSYMS=y
> -+CONFIG_KALLSYMS_ALL=y
> - # CONFIG_KALLSYMS_EXTRA_PASS is not set
> - CONFIG_HOTPLUG=y
> - CONFIG_PRINTK=y
> -@@ -110,6 +111,7 @@ CONFIG_HAVE_CLK=y
> - #
> - # GCOV-based kernel profiling
> - #
> -+# CONFIG_GCOV_KERNEL is not set
> - # CONFIG_SLOW_WORK is not set
> - CONFIG_HAVE_GENERIC_DMA_COHERENT=y
> - CONFIG_SLABINFO=y
> -@@ -656,7 +658,21 @@ CONFIG_MTD_UBI_GLUEBI=y
> - #
> - # UBI debugging options
> - #
> --# CONFIG_MTD_UBI_DEBUG is not set
> -+CONFIG_MTD_UBI_DEBUG=y
> -+# CONFIG_MTD_UBI_DEBUG_MSG is not set
> -+# CONFIG_MTD_UBI_DEBUG_PARANOID is not set
> -+CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set
> -+
> -+#
> -+# Additional UBI debugging messages
> -+#
> -+# CONFIG_MTD_UBI_DEBUG_MSG_BLD is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_EBA is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_WL is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_IO is not set
> - # CONFIG_PARPORT is not set
> - CONFIG_BLK_DEV=y
> - # CONFIG_BLK_DEV_COW_COMMON is not set
> -@@ -1238,6 +1254,7 @@ CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> - # CONFIG_USB_VST is not set
> - CONFIG_USB_GADGET=y
> - # CONFIG_USB_GADGET_DEBUG_FILES is not set
> -+# CONFIG_USB_GADGET_DEBUG_FS is not set
> - CONFIG_USB_GADGET_VBUS_DRAW=500
> - CONFIG_USB_GADGET_SELECTED=y
> - # CONFIG_USB_GADGET_AT91 is not set
> -@@ -1419,6 +1436,7 @@ CONFIG_EXT3_FS=y
> - # CONFIG_EXT3_FS_XATTR is not set
> - # CONFIG_EXT4_FS is not set
> - CONFIG_JBD=y
> -+# CONFIG_JBD_DEBUG is not set
> - # CONFIG_REISERFS_FS is not set
> - # CONFIG_JFS_FS is not set
> - # CONFIG_FS_POSIX_ACL is not set
> -@@ -1577,7 +1595,7 @@ CONFIG_NLS_DEFAULT="iso8859-1"
> - CONFIG_FRAME_WARN=1024
> - # CONFIG_MAGIC_SYSRQ is not set
> - # CONFIG_UNUSED_SYMBOLS is not set
> --# CONFIG_DEBUG_FS is not set
> -+CONFIG_DEBUG_FS=y
> - # CONFIG_HEADERS_CHECK is not set
> - # CONFIG_DEBUG_KERNEL is not set
> - CONFIG_DEBUG_BUGVERBOSE=y
> -@@ -1589,6 +1607,7 @@ CONFIG_FRAME_POINTER=y
> - CONFIG_HAVE_FUNCTION_TRACER=y
> - CONFIG_TRACING_SUPPORT=y
> - # CONFIG_FTRACE is not set
> -+# CONFIG_DYNAMIC_DEBUG is not set
> - # CONFIG_SAMPLES is not set
> - CONFIG_HAVE_ARCH_KGDB=y
> - # CONFIG_ARM_UNWIND is not set
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0006-gta02-defconfig-enable-NFS-and-INOTIFY_USER.patch b/recipes/linux/linux-openmoko-2.6.31/0006-gta02-defconfig-enable-NFS-and-INOTIFY_USER.patch
> deleted file mode 100644
> index 31d2b65..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0006-gta02-defconfig-enable-NFS-and-INOTIFY_USER.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From 20aa0022f765e702f76fe1cae429b1d58faa9ec4 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 28 Nov 2009 19:24:49 +0100
> -Subject: [PATCH] gta02-defconfig: enable NFS and INOTIFY_USER
> -
> ----
> - arch/arm/configs/gta02_defconfig |   48 ++++++++++++++++++++++++++++++-------
> - 1 files changed, 39 insertions(+), 9 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_defconfig b/arch/arm/configs/gta02_defconfig
> -index 1cce709..acf225e 100644
> ---- a/arch/arm/configs/gta02_defconfig
> -+++ b/arch/arm/configs/gta02_defconfig
> -@@ -860,7 +860,7 @@ CONFIG_I2C_CHARDEV=y
> - #
> - # I2C Algorithms
> - #
> --# CONFIG_I2C_ALGOBIT is not set
> -+CONFIG_I2C_ALGOBIT=y
> - # CONFIG_I2C_ALGOPCF is not set
> - # CONFIG_I2C_ALGOPCA is not set
> - 
> -@@ -953,6 +953,7 @@ CONFIG_POWER_SUPPLY=y
> - CONFIG_CHARGER_PCF50633=y
> - CONFIG_BATTERY_BQ27000_HDQ=y
> - CONFIG_HDQ_GPIO_BITBANG=y
> -+# CONFIG_BATTERY_PLATFORM is not set
> - # CONFIG_HWMON is not set
> - # CONFIG_THERMAL is not set
> - # CONFIG_THERMAL_HWMON is not set
> -@@ -1444,15 +1445,15 @@ CONFIG_JBD=y
> - # CONFIG_JBD_DEBUG is not set
> - # CONFIG_REISERFS_FS is not set
> - # CONFIG_JFS_FS is not set
> --# CONFIG_FS_POSIX_ACL is not set
> -+CONFIG_FS_POSIX_ACL=y
> - # CONFIG_XFS_FS is not set
> - # CONFIG_OCFS2_FS is not set
> - # CONFIG_BTRFS_FS is not set
> - CONFIG_FILE_LOCKING=y
> --# CONFIG_FSNOTIFY is not set
> -+CONFIG_FSNOTIFY=y
> - # CONFIG_DNOTIFY is not set
> - CONFIG_INOTIFY=y
> --# CONFIG_INOTIFY_USER is not set
> -+CONFIG_INOTIFY_USER=y
> - # CONFIG_QUOTA is not set
> - # CONFIG_AUTOFS_FS is not set
> - # CONFIG_AUTOFS4_FS is not set
> -@@ -1526,7 +1527,31 @@ CONFIG_UBIFS_FS_ZLIB=y
> - # CONFIG_SYSV_FS is not set
> - # CONFIG_UFS_FS is not set
> - # CONFIG_NILFS2_FS is not set
> --# CONFIG_NETWORK_FILESYSTEMS is not set
> -+CONFIG_NETWORK_FILESYSTEMS=y
> -+CONFIG_NFS_FS=m
> -+CONFIG_NFS_V3=y
> -+CONFIG_NFS_V3_ACL=y
> -+CONFIG_NFS_V4=y
> -+# CONFIG_NFS_V4_1 is not set
> -+CONFIG_NFSD=m
> -+CONFIG_NFSD_V2_ACL=y
> -+CONFIG_NFSD_V3=y
> -+CONFIG_NFSD_V3_ACL=y
> -+CONFIG_NFSD_V4=y
> -+CONFIG_LOCKD=m
> -+CONFIG_LOCKD_V4=y
> -+CONFIG_EXPORTFS=m
> -+CONFIG_NFS_ACL_SUPPORT=m
> -+CONFIG_NFS_COMMON=y
> -+CONFIG_SUNRPC=m
> -+CONFIG_SUNRPC_GSS=m
> -+CONFIG_RPCSEC_GSS_KRB5=m
> -+# CONFIG_RPCSEC_GSS_SPKM3 is not set
> -+# CONFIG_SMB_FS is not set
> -+# CONFIG_CIFS is not set
> -+# CONFIG_NCP_FS is not set
> -+# CONFIG_CODA_FS is not set
> -+# CONFIG_AFS_FS is not set
> - 
> - #
> - # Partition Types
> -@@ -1634,13 +1659,18 @@ CONFIG_CRYPTO=y
> - # CONFIG_CRYPTO_FIPS is not set
> - CONFIG_CRYPTO_ALGAPI=y
> - CONFIG_CRYPTO_ALGAPI2=y
> -+CONFIG_CRYPTO_AEAD2=y
> -+CONFIG_CRYPTO_BLKCIPHER=m
> -+CONFIG_CRYPTO_BLKCIPHER2=y
> - CONFIG_CRYPTO_HASH=y
> - CONFIG_CRYPTO_HASH2=y
> -+CONFIG_CRYPTO_RNG2=y
> - CONFIG_CRYPTO_PCOMP=y
> --# CONFIG_CRYPTO_MANAGER is not set
> --# CONFIG_CRYPTO_MANAGER2 is not set
> -+CONFIG_CRYPTO_MANAGER=m
> -+CONFIG_CRYPTO_MANAGER2=y
> - # CONFIG_CRYPTO_GF128MUL is not set
> - # CONFIG_CRYPTO_NULL is not set
> -+CONFIG_CRYPTO_WORKQUEUE=y
> - # CONFIG_CRYPTO_CRYPTD is not set
> - # CONFIG_CRYPTO_AUTHENC is not set
> - # CONFIG_CRYPTO_TEST is not set
> -@@ -1655,7 +1685,7 @@ CONFIG_CRYPTO_PCOMP=y
> - #
> - # Block modes
> - #
> --# CONFIG_CRYPTO_CBC is not set
> -+CONFIG_CRYPTO_CBC=m
> - # CONFIG_CRYPTO_CTR is not set
> - # CONFIG_CRYPTO_CTS is not set
> - # CONFIG_CRYPTO_ECB is not set
> -@@ -1696,7 +1726,7 @@ CONFIG_CRYPTO_MD5=y
> - # CONFIG_CRYPTO_CAMELLIA is not set
> - # CONFIG_CRYPTO_CAST5 is not set
> - # CONFIG_CRYPTO_CAST6 is not set
> --# CONFIG_CRYPTO_DES is not set
> -+CONFIG_CRYPTO_DES=m
> - # CONFIG_CRYPTO_FCRYPT is not set
> - # CONFIG_CRYPTO_KHAZAD is not set
> - # CONFIG_CRYPTO_SALSA20 is not set
> --- 
> -1.6.5.3
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31/0007-gta02_defconfig-disable-LEDS_GTA02_VIBRATOR.patch b/recipes/linux/linux-openmoko-2.6.31/0007-gta02_defconfig-disable-LEDS_GTA02_VIBRATOR.patch
> deleted file mode 100644
> index a6fa77d..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31/0007-gta02_defconfig-disable-LEDS_GTA02_VIBRATOR.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From f0acf76b4f0f16f0e5934daaccbfbec67b875bdd Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 17 Jan 2010 19:08:17 +0100
> -Subject: [PATCH] gta02_defconfig: disable LEDS_GTA02_VIBRATOR
> -
> ----
> - arch/arm/configs/gta02_defconfig |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_defconfig b/arch/arm/configs/gta02_defconfig
> -index acf225e..fec7b03 100644
> ---- a/arch/arm/configs/gta02_defconfig
> -+++ b/arch/arm/configs/gta02_defconfig
> -@@ -1338,7 +1338,7 @@ CONFIG_LEDS_GPIO_PLATFORM=y
> - # CONFIG_LEDS_DAC124S085 is not set
> - # CONFIG_LEDS_PWM is not set
> - # CONFIG_LEDS_BD2802 is not set
> --CONFIG_LEDS_GTA02_VIBRATOR=y
> -+# CONFIG_LEDS_GTA02_VIBRATOR is not set
> - 
> - #
> - # LED Triggers
> --- 
> -1.6.6
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.31_git.bb b/recipes/linux/linux-openmoko-2.6.31_git.bb
> deleted file mode 100644
> index c11e41b..0000000
> --- a/recipes/linux/linux-openmoko-2.6.31_git.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DESCRIPTION_${PN} = "Linux ${KERNEL_VERSION} kernel for the Openmoko Neo GSM Smartphones"
> -
> -KERNEL_RELEASE = "2.6.31"
> -KERNEL_VERSION = "${KERNEL_RELEASE}"
> -
> -SRCREV = "dd32737aa524e09c1d141a0e735dd58674552244"
> -OEV = "oe1"
> -PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> -PR = "r6"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-2.6.31 \
> -# build fix
> -  file://0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch;patch=1 \
> -# patches from Weiss's gdrm-2.6.31 branch
> -  file://0001-DRM-for-platform-devices.patch;patch=1 \
> -  file://0002-Glamo-DRM-and-KMS-driver.patch;patch=1 \
> -  file://0003-Work-on-Glamo-core-for-DRM.patch;patch=1 \
> -  file://0004-Add-JBT6k74-hook-for-use-by-KMS.patch;patch=1 \
> -# enable UBI+DRM+NFS+INOTIFY_USER
> -  file://0004-gta02_defconfig-Enable-UBI-support.patch;patch=1 \
> -  file://0005-gta02_defconfig-Enable-UBI-debug.patch;patch=1 \
> -  file://0001-gta02_defconfig-Enable-GLAMO_DRM.patch;patch=1 \
> -  file://0006-gta02-defconfig-enable-NFS-and-INOTIFY_USER.patch;patch=1 \
> -  file://0007-gta02_defconfig-disable-LEDS_GTA02_VIBRATOR.patch;patch=1 \
> -"
> -
> -S = "${WORKDIR}/git"
> -
> -CONFIG_NAME_om-gta01 = "gta01_defconfig"
> -CONFIG_NAME_om-gta02 = "gta02_defconfig"
> -
> -do_configure_prepend() { 
> -	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> -}
> diff --git a/recipes/linux/linux-openmoko-shr-drm-devel/0001-Add-drm-to-Makefile-version.patch b/recipes/linux/linux-openmoko-shr-drm-devel/0001-Add-drm-to-Makefile-version.patch
> deleted file mode 100644
> index 99345f7..0000000
> --- a/recipes/linux/linux-openmoko-shr-drm-devel/0001-Add-drm-to-Makefile-version.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 153af7f8e784e03401dc103f16741397ce6ca914 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 12:50:40 +0100
> -Subject: [PATCH] Add -drm to Makefile version
> -
> ----
> - Makefile |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index ebf0aa4..16b189f 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -1,7 +1,7 @@
> - VERSION = 2
> - PATCHLEVEL = 6
> - SUBLEVEL = 29
> --EXTRAVERSION += -rc3
> -+EXTRAVERSION += -rc3-drm
> - NAME = Erotic Pickled Herring
> - 
> - # *DOCUMENTATION*
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-shr-drm-devel/0004-gta02_drm_defconfig-start-from-gta02_packaging_defco.patch b/recipes/linux/linux-openmoko-shr-drm-devel/0004-gta02_drm_defconfig-start-from-gta02_packaging_defco.patch
> deleted file mode 100644
> index adb3ce8..0000000
> --- a/recipes/linux/linux-openmoko-shr-drm-devel/0004-gta02_drm_defconfig-start-from-gta02_packaging_defco.patch
> +++ /dev/null
> @@ -1,129 +0,0 @@
> -From ab6c9baa5cc8ae3a922ae4baef2550d399b41550 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 10:48:28 +0100
> -Subject: [PATCH 4/7] gta02_drm_defconfig: start from gta02_packaging_defconfig
> -
> ----
> - arch/arm/configs/gta02_drm_defconfig |   40 +++++++++++++--------------------
> - 1 files changed, 16 insertions(+), 24 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_drm_defconfig b/arch/arm/configs/gta02_drm_defconfig
> -index 5349014..e2dbbef 100644
> ---- a/arch/arm/configs/gta02_drm_defconfig
> -+++ b/arch/arm/configs/gta02_drm_defconfig
> -@@ -1,7 +1,7 @@
> - #
> - # Automatically generated make config: don't edit
> - # Linux kernel version: 2.6.29-rc3
> --# Thu Jul  2 20:40:33 2009
> -+# Fri Oct  2 20:51:57 2009
> - #
> - CONFIG_ARM=y
> - CONFIG_HAVE_PWM=y
> -@@ -35,7 +35,7 @@ CONFIG_EXPERIMENTAL=y
> - CONFIG_BROKEN_ON_SMP=y
> - CONFIG_LOCK_KERNEL=y
> - CONFIG_INIT_ENV_ARG_LIMIT=32
> --CONFIG_LOCALVERSION=""
> -+CONFIG_LOCALVERSION="-mokodev"
> - # CONFIG_LOCALVERSION_AUTO is not set
> - CONFIG_SWAP=y
> - CONFIG_SYSVIPC=y
> -@@ -180,7 +180,7 @@ CONFIG_S3C24XX_PWM=y
> - CONFIG_S3C24XX_GPIO_EXTRA=0
> - CONFIG_S3C2410_DMA=y
> - # CONFIG_S3C2410_DMA_DEBUG is not set
> --# CONFIG_S3C24XX_ADC is not set
> -+CONFIG_S3C24XX_ADC=y
> - CONFIG_MACH_SMDK=y
> - CONFIG_MACH_NEO1973=y
> - CONFIG_PLAT_S3C=y
> -@@ -1084,7 +1084,6 @@ CONFIG_I2C=y
> - CONFIG_I2C_BOARDINFO=y
> - CONFIG_I2C_CHARDEV=y
> - CONFIG_I2C_HELPER_AUTO=y
> --CONFIG_I2C_ALGOBIT=y
> - 
> - #
> - # I2C Hardware Bus support
> -@@ -1181,7 +1180,7 @@ CONFIG_APM_POWER=y
> - CONFIG_CHARGER_PCF50633=y
> - CONFIG_BATTERY_BQ27000_HDQ=y
> - CONFIG_HDQ_GPIO_BITBANG=y
> --# CONFIG_BATTERY_GTA01 is not set
> -+CONFIG_BATTERY_GTA01=m
> - CONFIG_HWMON=y
> - # CONFIG_HWMON_VID is not set
> - # CONFIG_SENSORS_AD7414 is not set
> -@@ -1283,14 +1282,11 @@ CONFIG_PCF50633_ADC=y
> - CONFIG_PCF50633_GPIO=y
> - # CONFIG_MFD_PCF50606 is not set
> - CONFIG_MFD_GLAMO=y
> --
> --#
> --# SMedia Glamo 336x/337x engine drivers
> --#
> --# CONFIG_MFD_GLAMO_FB is not set
> -+CONFIG_MFD_GLAMO_FB=y
> -+CONFIG_MFD_GLAMO_FB_XGLAMO_WORKAROUND=y
> - CONFIG_MFD_GLAMO_SPI_GPIO=y
> -+CONFIG_MFD_GLAMO_SPI_FB=y
> - CONFIG_MFD_GLAMO_MCI=y
> --CONFIG_MFD_GLAMO_DRM=y
> - 
> - #
> - # Multimedia devices
> -@@ -1312,7 +1308,6 @@ CONFIG_DAB=y
> - #
> - # Graphics support
> - #
> --CONFIG_DRM=y
> - # CONFIG_VGASTATE is not set
> - CONFIG_VIDEO_OUTPUT_CONTROL=y
> - CONFIG_FB=y
> -@@ -1790,17 +1785,14 @@ CONFIG_STAGING=y
> - #
> - # Android
> - #
> --CONFIG_ANDROID=y
> --CONFIG_ANDROID_BINDER_IPC=y
> --CONFIG_ANDROID_LOGGER=y
> --CONFIG_ANDROID_RAM_CONSOLE=y
> --CONFIG_ANDROID_RAM_CONSOLE_ENABLE_VERBOSE=y
> --# CONFIG_ANDROID_RAM_CONSOLE_ERROR_CORRECTION is not set
> --# CONFIG_ANDROID_RAM_CONSOLE_EARLY_INIT is not set
> --CONFIG_ANDROID_TIMED_GPIO=y
> --CONFIG_ANDROID_LOW_MEMORY_KILLER=y
> -+# CONFIG_ANDROID is not set
> -+# CONFIG_ANDROID_BINDER_IPC is not set
> -+# CONFIG_ANDROID_LOGGER is not set
> -+# CONFIG_ANDROID_RAM_CONSOLE is not set
> -+# CONFIG_ANDROID_TIMED_GPIO is not set
> -+# CONFIG_ANDROID_LOW_MEMORY_KILLER is not set
> - # CONFIG_ANDROID_WAKELOCK is not set
> --CONFIG_ANDROID_PARANOID_NETWORK=y
> -+# CONFIG_ANDROID_PARANOID_NETWORK is not set
> - 
> - #
> - # File systems
> -@@ -1958,7 +1950,7 @@ CONFIG_NLS_CODEPAGE_850=m
> - # CONFIG_NLS_CODEPAGE_863 is not set
> - # CONFIG_NLS_CODEPAGE_864 is not set
> - # CONFIG_NLS_CODEPAGE_865 is not set
> --# CONFIG_NLS_CODEPAGE_866 is not set
> -+CONFIG_NLS_CODEPAGE_866=m
> - # CONFIG_NLS_CODEPAGE_869 is not set
> - CONFIG_NLS_CODEPAGE_936=m
> - CONFIG_NLS_CODEPAGE_950=m
> -@@ -1967,7 +1959,7 @@ CONFIG_NLS_CODEPAGE_950=m
> - # CONFIG_NLS_CODEPAGE_874 is not set
> - # CONFIG_NLS_ISO8859_8 is not set
> - # CONFIG_NLS_CODEPAGE_1250 is not set
> --# CONFIG_NLS_CODEPAGE_1251 is not set
> -+CONFIG_NLS_CODEPAGE_1251=m
> - # CONFIG_NLS_ASCII is not set
> - CONFIG_NLS_ISO8859_1=y
> - # CONFIG_NLS_ISO8859_2 is not set
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-shr-drm-devel/0005-Enable-DRM-and-MFD_GLAMO_DRM.patch b/recipes/linux/linux-openmoko-shr-drm-devel/0005-Enable-DRM-and-MFD_GLAMO_DRM.patch
> deleted file mode 100644
> index c9d56fa..0000000
> --- a/recipes/linux/linux-openmoko-shr-drm-devel/0005-Enable-DRM-and-MFD_GLAMO_DRM.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 8fe4cb1bee0c8af760d8911c248e0904e44fa0b3 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 10:49:43 +0100
> -Subject: [PATCH 5/7] Enable DRM and MFD_GLAMO_DRM
> -
> ----
> - arch/arm/configs/gta02_drm_defconfig |   12 ++++++++----
> - 1 files changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_drm_defconfig b/arch/arm/configs/gta02_drm_defconfig
> -index e2dbbef..aac2832 100644
> ---- a/arch/arm/configs/gta02_drm_defconfig
> -+++ b/arch/arm/configs/gta02_drm_defconfig
> -@@ -35,7 +35,7 @@ CONFIG_EXPERIMENTAL=y
> - CONFIG_BROKEN_ON_SMP=y
> - CONFIG_LOCK_KERNEL=y
> - CONFIG_INIT_ENV_ARG_LIMIT=32
> --CONFIG_LOCALVERSION="-mokodev"
> -+CONFIG_LOCALVERSION="-drm"
> - # CONFIG_LOCALVERSION_AUTO is not set
> - CONFIG_SWAP=y
> - CONFIG_SYSVIPC=y
> -@@ -1282,11 +1282,14 @@ CONFIG_PCF50633_ADC=y
> - CONFIG_PCF50633_GPIO=y
> - # CONFIG_MFD_PCF50606 is not set
> - CONFIG_MFD_GLAMO=y
> --CONFIG_MFD_GLAMO_FB=y
> --CONFIG_MFD_GLAMO_FB_XGLAMO_WORKAROUND=y
> -+
> -+#
> -+# SMedia Glamo 336x/337x engine drivers
> -+#
> -+# CONFIG_MFD_GLAMO_FB is not set
> - CONFIG_MFD_GLAMO_SPI_GPIO=y
> --CONFIG_MFD_GLAMO_SPI_FB=y
> - CONFIG_MFD_GLAMO_MCI=y
> -+CONFIG_MFD_GLAMO_DRM=y
> - 
> - #
> - # Multimedia devices
> -@@ -1308,6 +1311,7 @@ CONFIG_DAB=y
> - #
> - # Graphics support
> - #
> -+CONFIG_DRM=y
> - # CONFIG_VGASTATE is not set
> - CONFIG_VIDEO_OUTPUT_CONTROL=y
> - CONFIG_FB=y
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-shr-drm-devel/0006-Enable-I2C_ALGOBIT-from-make-oldconfig.patch b/recipes/linux/linux-openmoko-shr-drm-devel/0006-Enable-I2C_ALGOBIT-from-make-oldconfig.patch
> deleted file mode 100644
> index 79305ce..0000000
> --- a/recipes/linux/linux-openmoko-shr-drm-devel/0006-Enable-I2C_ALGOBIT-from-make-oldconfig.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 315bd3c8c368cf8097e3b0aecd21907755b617e1 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 10:54:55 +0100
> -Subject: [PATCH 6/7] Enable I2C_ALGOBIT, from make oldconfig
> -
> ----
> - arch/arm/configs/gta02_drm_defconfig |    3 ++-
> - 1 files changed, 2 insertions(+), 1 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_drm_defconfig b/arch/arm/configs/gta02_drm_defconfig
> -index aac2832..e17ddc3 100644
> ---- a/arch/arm/configs/gta02_drm_defconfig
> -+++ b/arch/arm/configs/gta02_drm_defconfig
> -@@ -1,7 +1,7 @@
> - #
> - # Automatically generated make config: don't edit
> - # Linux kernel version: 2.6.29-rc3
> --# Fri Oct  2 20:51:57 2009
> -+# Sun Nov  8 10:53:31 2009
> - #
> - CONFIG_ARM=y
> - CONFIG_HAVE_PWM=y
> -@@ -1084,6 +1084,7 @@ CONFIG_I2C=y
> - CONFIG_I2C_BOARDINFO=y
> - CONFIG_I2C_CHARDEV=y
> - CONFIG_I2C_HELPER_AUTO=y
> -+CONFIG_I2C_ALGOBIT=y
> - 
> - #
> - # I2C Hardware Bus support
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-shr-drm-devel/0007-Enable-UBI-UBIFS.patch b/recipes/linux/linux-openmoko-shr-drm-devel/0007-Enable-UBI-UBIFS.patch
> deleted file mode 100644
> index b74e496..0000000
> --- a/recipes/linux/linux-openmoko-shr-drm-devel/0007-Enable-UBI-UBIFS.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From 8f907c17c068beb94264a4a6d40314658a0c1393 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 10:58:28 +0100
> -Subject: [PATCH 7/7] Enable UBI/UBIFS
> -
> ----
> - arch/arm/configs/gta02_drm_defconfig |   39 ++++++++++++++++++++++++++++++---
> - 1 files changed, 35 insertions(+), 4 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_drm_defconfig b/arch/arm/configs/gta02_drm_defconfig
> -index e17ddc3..7506963 100644
> ---- a/arch/arm/configs/gta02_drm_defconfig
> -+++ b/arch/arm/configs/gta02_drm_defconfig
> -@@ -806,7 +806,30 @@ CONFIG_MTD_NAND_S3C2410_HWECC=y
> - #
> - # UBI - Unsorted block images
> - #
> --# CONFIG_MTD_UBI is not set
> -+CONFIG_MTD_UBI=y
> -+CONFIG_MTD_UBI_WL_THRESHOLD=4096
> -+CONFIG_MTD_UBI_BEB_RESERVE=1
> -+CONFIG_MTD_UBI_GLUEBI=y
> -+
> -+#
> -+# UBI debugging options
> -+#
> -+CONFIG_MTD_UBI_DEBUG=y
> -+# CONFIG_MTD_UBI_DEBUG_MSG is not set
> -+# CONFIG_MTD_UBI_DEBUG_PARANOID is not set
> -+CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
> -+# CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set
> -+
> -+#
> -+# Additional UBI debugging messages
> -+#
> -+# CONFIG_MTD_UBI_DEBUG_MSG_BLD is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_EBA is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_WL is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_IO is not set
> - # CONFIG_PARPORT is not set
> - CONFIG_BLK_DEV=y
> - # CONFIG_BLK_DEV_COW_COMMON is not set
> -@@ -1877,6 +1900,12 @@ CONFIG_JFFS2_ZLIB=y
> - # CONFIG_JFFS2_LZO is not set
> - CONFIG_JFFS2_RTIME=y
> - # CONFIG_JFFS2_RUBIN is not set
> -+CONFIG_UBIFS_FS=y
> -+# CONFIG_UBIFS_FS_XATTR is not set
> -+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> -+CONFIG_UBIFS_FS_LZO=y
> -+CONFIG_UBIFS_FS_ZLIB=y
> -+# CONFIG_UBIFS_FS_DEBUG is not set
> - CONFIG_CRAMFS=y
> - CONFIG_SQUASHFS=m
> - # CONFIG_SQUASHFS_EMBEDDED is not set
> -@@ -2151,8 +2180,8 @@ CONFIG_CRYPTO_TWOFISH_COMMON=m
> - #
> - # Compression
> - #
> --CONFIG_CRYPTO_DEFLATE=m
> --# CONFIG_CRYPTO_LZO is not set
> -+CONFIG_CRYPTO_DEFLATE=y
> -+CONFIG_CRYPTO_LZO=y
> - 
> - #
> - # Random Number Generation
> -@@ -2174,6 +2203,8 @@ CONFIG_CRC32=y
> - CONFIG_LIBCRC32C=m
> - CONFIG_ZLIB_INFLATE=y
> - CONFIG_ZLIB_DEFLATE=y
> -+CONFIG_LZO_COMPRESS=y
> -+CONFIG_LZO_DECOMPRESS=y
> - CONFIG_TEXTSEARCH=y
> - CONFIG_TEXTSEARCH_KMP=m
> - CONFIG_TEXTSEARCH_BM=m
> --- 
> -1.6.5.2
> -
> diff --git a/recipes/linux/linux-openmoko-shr-drm-devel/fix-install.patch b/recipes/linux/linux-openmoko-shr-drm-devel/fix-install.patch
> deleted file mode 100644
> index b14ca7d..0000000
> --- a/recipes/linux/linux-openmoko-shr-drm-devel/fix-install.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From: Steve Sakoman <steve@sakoman.com>
> -Date: Mon, 18 Aug 2008 16:07:31 +0000 (-0700)
> -Subject: scripts/Makefile.fwinst: add missing space when setting mode in cmd_install
> -X-Git-Url: http://www.sakoman.net/cgi-bin/gitweb.cgi?p=linux-omap-2.6.git;a=commitdiff_plain;h=f039944bdd491cde7327133e9976881d3133ae70
> -
> -scripts/Makefile.fwinst: add missing space when setting mode in cmd_install
> -
> -This was causing build failures on some machines
> ----
> -
> -diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
> -index 6bf8e87..fb20532 100644
> ---- a/scripts/Makefile.fwinst
> -+++ b/scripts/Makefile.fwinst
> -@@ -37,7 +37,7 @@
> -        @true
> -
> - quiet_cmd_install = INSTALL $(subst $(srctree)/,,$@)
> --      cmd_install = $(INSTALL) -m0644 $< $@
> -+      cmd_install = $(INSTALL) -m 0644 $< $@
> -
> - $(installed-fw-dirs):
> -        $(call cmd,mkdir)
> diff --git a/recipes/linux/linux-openmoko-shr-drm-devel_git.bb b/recipes/linux/linux-openmoko-shr-drm-devel_git.bb
> deleted file mode 100644
> index da7c93d..0000000
> --- a/recipes/linux/linux-openmoko-shr-drm-devel_git.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DESCRIPTION_${PN} = "Linux ${KERNEL_VERSION} kernel for the Openmoko Neo GSM Smartphones"
> -
> -DEFAULT_PREFERENCE = "-1"
> -KERNEL_RELEASE = "2.6.29"
> -KERNEL_VERSION = "2.6.29-rc3-drm"
> -
> -SRCREV = "e62a4ae1c6783f41b41a9ac3d258786586b65a40"
> -OMV = "oe15"
> -PV = "${KERNEL_RELEASE}-drm-${OMV}+gitr${SRCPV}"
> -PR = "r5"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=drm-tracking \
> -  file://fix-install.patch;patch=1 \
> -  file://0001-Add-drm-to-Makefile-version.patch;patch=1 \
> -  file://0004-gta02_drm_defconfig-start-from-gta02_packaging_defco.patch;patch=1 \
> -  file://0005-Enable-DRM-and-MFD_GLAMO_DRM.patch;patch=1 \
> -  file://0006-Enable-I2C_ALGOBIT-from-make-oldconfig.patch;patch=1 \
> -  file://0007-Enable-UBI-UBIFS.patch;patch=1 \
> -"
> -S = "${WORKDIR}/git"
> -
> -CONFIG_NAME_om-gta01 = "gta01_moredrivers_defconfig"
> -CONFIG_NAME_om-gta02 = "gta02_drm_defconfig"
> -
> -do_configure_prepend() { 
> -	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> -}
> -- 
> 1.7.1
> 
> 

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



