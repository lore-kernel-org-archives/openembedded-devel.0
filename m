Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1Pa4rU-0001CR-F9
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 12:15:32 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id 7D569275D08B; Tue,  4 Jan 2011 12:08:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (brmn-4d0aa6bf.pool.mediaWays.net [77.10.166.191])
	by gravedo.de (Postfix) with ESMTPSA id 1E789275CD2A;
	Tue,  4 Jan 2011 12:08:42 +0100 (CET)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 12:08:37 +0100
Message-Id: <1294139317-28208-3-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1294139317-28208-1-git-send-email-morphis@gravedo.de>
References: <1294139317-28208-1-git-send-email-morphis@gravedo.de>
Subject: [PATCH 2/2] compat-wireless-2.6-old: make recipe even support the palmpre machine
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
X-List-Received-Date: Tue, 04 Jan 2011 11:15:32 -0000

To support compat-wireless-2.6-old for the palmpre machine we need several patches to let
it build with the modified 2.6.24 based kernel.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 ...ig-disable-all-but-libertas-and-ieee80211.patch |  320 ++++++++++++++++++++
 .../palmpre/ignore-compat-devname.patch            |   30 ++
 .../palmpre/libertas-fix-padding.patch             |   61 ++++
 .../compat-wireless/compat-wireless-2.6-old_git.bb |    9 +-
 4 files changed, 419 insertions(+), 1 deletions(-)
 create mode 100644 recipes/compat-wireless/compat-wireless-2.6-old/palmpre/config-disable-all-but-libertas-and-ieee80211.patch
 create mode 100644 recipes/compat-wireless/compat-wireless-2.6-old/palmpre/ignore-compat-devname.patch
 create mode 100644 recipes/compat-wireless/compat-wireless-2.6-old/palmpre/libertas-fix-padding.patch

diff --git a/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/config-disable-all-but-libertas-and-ieee80211.patch b/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/config-disable-all-but-libertas-and-ieee80211.patch
new file mode 100644
index 0000000..ee8cbd0
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/config-disable-all-but-libertas-and-ieee80211.patch
@@ -0,0 +1,320 @@
+From 44faa7d5f354b1d0e7fac1f13a432491bb62cc3e Mon Sep 17 00:00:00 2001
+From: Ryan Hope <rmh3093@gmail.com>
+Date: Mon, 6 Dec 2010 23:14:48 -0500
+Subject: [PATCH 3/5] config.mk: disable everything but libertas and ieee80211 modules
+
+---
+ config.mk |  162 +++++++++++++++++++++++++++++-------------------------------
+ 1 files changed, 78 insertions(+), 84 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index 8cb19c9..442f30c 100644
+--- a/config.mk
++++ b/config.mk
+@@ -7,14 +7,14 @@ export
+ ifeq ($(wildcard $(KLIB_BUILD)/.config),)
+ # These will be ignored by compat autoconf
+  CONFIG_PCI=y
+- CONFIG_USB=y
+- CONFIG_PCMCIA=y
++ CONFIG_USB=n
++ CONFIG_PCMCIA=n
+ else
+ include $(KLIB_BUILD)/.config
+ endif
+ 
+ # Wireless subsystem stuff
+-CONFIG_MAC80211=m
++CONFIG_MAC80211=n
+ 
+ # Enable QOS for 2.6.22, we'll do some hacks here to enable it.
+ # You will need this for HT support (802.11n) and WME (802.11e).
+@@ -51,7 +51,7 @@ ifeq ($(QOS_REQS_MISSING),) # if our dependencies match for MAC80211_QOS
+ ifneq ($(CONFIG_MAC80211_QOS),) # Your kernel has CONFIG_MAC80211_QOS defined already, too bad
+ $(error "ERROR: CONFIG_MAC80211_QOS is somehow enabled in your kernel, how did that happen if it wasn't an option in your kernel? Please report this to the linux-wireless mailing list!")
+ endif
+-CONFIG_MAC80211_QOS=y
++CONFIG_MAC80211_QOS=n
+ else
+ # Complain about our missing dependencies, at this point we know
+ # CONFIG_MAC80211_QOS is not enabled by this kernel so
+@@ -73,21 +73,21 @@ endif # kernel release check
+ endif # kernel Makefile check
+ 
+ CONFIG_MAC80211_RC_DEFAULT=pid
+-CONFIG_MAC80211_RC_PID=y
++CONFIG_MAC80211_RC_PID=n
+ 
+ # enable mesh networking too
+-CONFIG_MAC80211_MESH=y
++CONFIG_MAC80211_MESH=n
+ 
+-CONFIG_CFG80211=m
+-CONFIG_NL80211=y
++CONFIG_CFG80211=n
++CONFIG_NL80211=n
+ 
+ # mac80211 test driver
+-CONFIG_MAC80211_HWSIM=m
++CONFIG_MAC80211_HWSIM=n
+ 
+ # PCI Drivers
+ ifneq ($(CONFIG_PCI),)
+ 
+-CONFIG_ATH5K=m
++CONFIG_ATH5K=n
+ CONFIG_ATH5K_DEBUG=n
+ 
+ # For now we build ath9k only on kernel 2.6.26
+@@ -95,57 +95,57 @@ ifeq ($(shell test -e $(KLIB_BUILD)/Makefile && echo yes),yes)
+ KERNEL_SUBLEVEL = $(shell $(MAKE) -C $(KLIB_BUILD) kernelversion | sed -n 's/^2\.6\.\([0-9]\+\).*/\1/p')
+ ifeq ($(shell test $(KERNEL_SUBLEVEL) -gt 25 && echo yes),yes)
+ endif
+-CONFIG_ATH9K=m
++CONFIG_ATH9K=n
+ endif
+ 
+ # Required for older kernels which still use this flag.
+ 
+-CONFIG_IWL3945=m
++CONFIG_IWL3945=n
+ CONFIG_IWL3945_DEBUG=n
+-CONFIG_IWL3945_LEDS=y
++CONFIG_IWL3945_LEDS=n
+ # CONFIG_IWL3945_RFKILL=y
+-CONFIG_IWL3945_SPECTRUM_MEASUREMENT=y
+-CONFIG_IWL4965=y
+-CONFIG_IWL5000=y
+-CONFIG_IWLAGN=m
+-CONFIG_IWLAGN_LEDS=y
+-CONFIG_IWLAGN_SPECTRUM_MEASUREMENT=y
+-CONFIG_IWLCORE=m
+-CONFIG_IWLWIFI=m
++CONFIG_IWL3945_SPECTRUM_MEASUREMENT=n
++CONFIG_IWL4965=n
++CONFIG_IWL5000=n
++CONFIG_IWLAGN=n
++CONFIG_IWLAGN_LEDS=n
++CONFIG_IWLAGN_SPECTRUM_MEASUREMENT=n
++CONFIG_IWLCORE=n
++CONFIG_IWLWIFI=n
+ CONFIG_IWLWIFI_DEBUG=n
+-CONFIG_IWLWIFI_LEDS=y
++CONFIG_IWLWIFI_LEDS=n
+ # CONFIG_IWLWIFI_RFKILL=y
+ 
+-CONFIG_B43=m
++CONFIG_B43=n
+ # B43 uses PCMCIA only for Compact Flash. The Cardbus cards uses PCI
+ # Example, bcm4318:
+ # http://www.multicap.biz/wireless-lan/indoor-wlan-hardware/sdc-cf10g-80211g-compact-flash-module
+ ifneq ($(CONFIG_PCMCIA),)
+-CONFIG_B43_PCMCIA=y
++CONFIG_B43_PCMCIA=n
+ endif
+-CONFIG_B43_PIO=y
++CONFIG_B43_PIO=n
+ # B43_PIO selects SSB_BLOCKIO
+-CONFIG_SSB_BLOCKIO=y
+-CONFIG_B43_PCI_AUTOSELECT=y
++CONFIG_SSB_BLOCKIO=n
++CONFIG_B43_PCI_AUTOSELECT=n
+ # CONFIG_B43_RFKILL=y
+-CONFIG_B43_LEDS=y
+-CONFIG_B43_PHY_LP=y
+-CONFIG_B43_NPHY=y
++CONFIG_B43_LEDS=n
++CONFIG_B43_PHY_LP=n
++CONFIG_B43_NPHY=n
+ CONFIG_B43_DEBUG=n
+ 
+-CONFIG_B43LEGACY=m
+-CONFIG_B43LEGACY_PCI_AUTOSELECT=y
+-CONFIG_B43LEGACY_DMA=y
+-CONFIG_B43LEGACY_PIO=y
++CONFIG_B43LEGACY=n
++CONFIG_B43LEGACY_PCI_AUTOSELECT=n
++CONFIG_B43LEGACY_DMA=n
++CONFIG_B43LEGACY_PIO=n
+ 
+ # The Intel ipws
+-CONFIG_IPW2100=m
++CONFIG_IPW2100=n
+ CONFIG_IPW2100_DEBUG=n
+-CONFIG_IPW2100_MONITOR=y
+-CONFIG_IPW2200=m
+-CONFIG_IPW2200_MONITOR=y
+-CONFIG_IPW2200_RADIOTAP=y
+-CONFIG_IPW2200_PROMISCUOUS=y
++CONFIG_IPW2100_MONITOR=n
++CONFIG_IPW2200=n
++CONFIG_IPW2200_MONITOR=n
++CONFIG_IPW2200_RADIOTAP=n
++CONFIG_IPW2200_PROMISCUOUS=n
+ # The above enables use a second interface prefixed 'rtap'.
+ #           Example usage:
+ #
+@@ -158,49 +158,49 @@ CONFIG_IPW2200_PROMISCUOUS=y
+ # it on via sysfs:
+ #
+ # % echo 1 > /sys/bus/pci/drivers/ipw2200/*/rtap_iface
+-CONFIG_IPW2200_QOS=y
++CONFIG_IPW2200_QOS=n
+ 
+-NEED_IEEE80211=y
++NEED_IEEE80211=n
+ 
+-CONFIG_P54_PCI=m
++CONFIG_P54_PCI=n
+ 
+-CONFIG_SSB_PCIHOST=y
+-CONFIG_SSB_DRIVER_PCICORE=y
+-CONFIG_SSB_B43_PCI_BRIDGE=y
++CONFIG_SSB_PCIHOST=n
++CONFIG_SSB_DRIVER_PCICORE=n
++CONFIG_SSB_B43_PCI_BRIDGE=n
+ ifeq ($(shell test $(KERNEL_SUBLEVEL) -gt 22 && echo yes),yes)
+ # b44 is not ported to 2.6.22
+-CONFIG_B44=m
++CONFIG_B44=n
+ endif
+ 
+-CONFIG_RTL8180=m
+-CONFIG_ADM8211=m
++CONFIG_RTL8180=n
++CONFIG_ADM8211=n
+ 
+-CONFIG_RT2X00_LIB_PCI=m
+-CONFIG_RT2400PCI=m
+-CONFIG_RT2500PCI=m
+-NEED_RT2X00=y
++CONFIG_RT2X00_LIB_PCI=n
++CONFIG_RT2400PCI=n
++CONFIG_RT2500PCI=n
++NEED_RT2X00=n
+ 
+ # Two rt2x00 drivers require firmware: rt61pci and rt73usb. They depend on
+ # CRC to check the firmware. We check here first for the PCI
+ # driver as we're in the PCI section.
+ ifneq ($(CONFIG_CRC_ITU_T),)
+-CONFIG_RT61PCI=m
+-NEED_RT2X00_FIRMWARE=y
++CONFIG_RT61PCI=n
++NEED_RT2X00_FIRMWARE=n
+ endif
+ 
+ endif
+ ## end of PCI
+ 
+ # This is required for some cards
+-CONFIG_EEPROM_93CX6=m
++CONFIG_EEPROM_93CX6=n
+ 
+ # USB Drivers
+ ifneq ($(CONFIG_USB),)
+-CONFIG_ZD1211RW=m
++CONFIG_ZD1211RW=n
+ 
+ # support for USB Wireless devices using Atmel at76c503,
+ # at76c505 or at76c505a chips.
+-CONFIG_USB_ATMEL=m
++CONFIG_USB_ATMEL=n
+ 
+ # Stuff here things which depend on kernel versions for USB
+ ifeq ($(shell test -e $(KLIB_BUILD)/Makefile && echo yes),yes)
+@@ -214,57 +214,57 @@ ifeq ($(shell test $(KERNEL_SUBLEVEL) -gt 21 && echo yes),yes)
+ # is only wireless RNDIS chip known to date.
+ # Note: this depends on CONFIG_USB_NET_RNDIS_HOST and CONFIG_USB_NET_CDCETHER
+ # it also requires new RNDIS_HOST and CDC_ETHER modules which we add
+-CONFIG_USB_NET_RNDIS_HOST=m
+-CONFIG_USB_NET_RNDIS_WLAN=m
+-CONFIG_USB_NET_CDCETHER=m
++CONFIG_USB_NET_RNDIS_HOST=n
++CONFIG_USB_NET_RNDIS_WLAN=n
++CONFIG_USB_NET_CDCETHER=n
+ 
+ endif
+ endif
+ 
+-CONFIG_P54_USB=m
+-CONFIG_RTL8187=m
++CONFIG_P54_USB=n
++CONFIG_RTL8187=n
+ 
+ # RT2500USB does not require firmware
+-CONFIG_RT2500USB=m
+-CONFIG_RT2X00_LIB_USB=m
+-NEED_RT2X00=y
++CONFIG_RT2500USB=n
++CONFIG_RT2X00_LIB_USB=n
++NEED_RT2X00=n
+ # RT73USB requires firmware
+ ifneq ($(CONFIG_CRC_ITU_T),)
+-CONFIG_RT73USB=m
+-NEED_RT2X00_FIRMWARE=y
++CONFIG_RT73USB=n
++NEED_RT2X00_FIRMWARE=n
+ endif
+ 
+ # we're in kernel >= 2.6.24, this has been only tested on 2.6.24.
+ # If you add/test backport to older kernels please expand reduce this
+ # or remove it if its backported down to 2.6.22 or 2.6.21.
+ ifeq ($(shell test $(KERNEL_SUBLEVEL) -gt 23 && echo yes),yes)
+-CONFIG_AR9170=m
++CONFIG_AR9170=n
+ endif
+ 
+ endif # end of USB driver list
+ 
+ # Common rt2x00 requirements
+ ifeq ($(NEED_RT2X00),y)
+-CONFIG_RT2X00=m
+-CONFIG_RT2X00_LIB=m
++CONFIG_RT2X00=n
++CONFIG_RT2X00_LIB=n
+ # CONFIG_RT2X00_LIB_DEBUGFS is not set
+ # CONFIG_RT2X00_DEBUG is not set
+ endif
+ 
+ ifeq ($(NEED_RT2X00_FIRMWARE),y)
+-CONFIG_RT2X00_LIB_FIRMWARE=y
++CONFIG_RT2X00_LIB_FIRMWARE=n
+ endif
+ 
+ # p54
+-CONFIG_P54_COMMON=m
++CONFIG_P54_COMMON=n
+ 
+ # Sonics Silicon Backplane
+-CONFIG_SSB_POSSIBLE=y
+-CONFIG_SSB=m
+-CONFIG_SSB_SPROM=y
++CONFIG_SSB_POSSIBLE=n
++CONFIG_SSB=n
++CONFIG_SSB_SPROM=n
+ 
+ ifneq ($(CONFIG_PCMCIA),)
+-CONFIG_SSB_PCMCIAHOST=y
++CONFIG_SSB_PCMCIAHOST=n
+ endif
+ 
+ # These two are for mips
+@@ -273,14 +273,8 @@ CONFIG_SSB_PCICORE_HOSTMODE=n
+ # CONFIG_SSB_DEBUG is not set
+ # CONFIG_SSB_DRIVER_EXTIF=y
+ 
+-ifneq ($(CONFIG_USB),)
+-CONFIG_LIBERTAS_USB=m
++CONFIG_LIBERTAS_SDIO=m
+ NEED_LIBERTAS=y
+-endif
+-ifneq ($(CONFIG_PCMCIA),)
+-CONFIG_LIBERTAS_CS=m
+-NEED_LIBERTAS=y
+-endif
+ ifeq ($(NEED_LIBERTAS),y)
+ CONFIG_LIBERTAS=m
+ # Libertas uses the old stack but not fully, it will soon 
+-- 
+1.7.1
+
diff --git a/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/ignore-compat-devname.patch b/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/ignore-compat-devname.patch
new file mode 100644
index 0000000..a7fcfe5
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/ignore-compat-devname.patch
@@ -0,0 +1,30 @@
+From 723224de36f461fde40367e302bc341f4f68846a Mon Sep 17 00:00:00 2001
+From: Ryan Hope <rmh3093@gmail.com>
+Date: Mon, 6 Dec 2010 22:39:44 -0500
+Subject: [PATCH 2/5] compat: remove dev_name method as it is already in our kernel
+
+---
+ include/net/compat.h |    7 -------
+ 1 files changed, 0 insertions(+), 7 deletions(-)
+
+diff --git a/include/net/compat.h b/include/net/compat.h
+index 0ccabcd..8eb48ef 100644
+--- a/include/net/compat.h
++++ b/include/net/compat.h
+@@ -559,13 +559,6 @@ static inline int list_is_singular(const struct list_head *head)
+ 	return !list_empty(head) && (head->next == head->prev);
+ }
+ 
+-/* This is from include/linux/device.h, which was added as of 2.6.26 */
+-static inline const char *dev_name(struct device *dev)
+-{
+-	/* will be changed into kobject_name(&dev->kobj) in the near future */
+-	return dev->bus_id;
+-}
+-
+ /* This is from include/linux/kernel.h, which was added as of 2.6.26 */ 
+ 
+ /**
+-- 
+1.7.1
+
diff --git a/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/libertas-fix-padding.patch b/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/libertas-fix-padding.patch
new file mode 100644
index 0000000..d1de7fa
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-2.6-old/palmpre/libertas-fix-padding.patch
@@ -0,0 +1,61 @@
+From 29e0f1a155e84e2975ea96c2a9009bd10bbb1d43 Mon Sep 17 00:00:00 2001
+From: Ryan Hope <rmh3093@gmail.com>
+Date: Mon, 6 Dec 2010 21:57:25 -0500
+Subject: [PATCH 1/5] libertas_sdio: use sdio helper function for transfer padding
+
+The transfer (of the firmware) must be in one transaction or the firmware goes suicidal.
+There's no way to guarantee that for all controllers, but we can at least try.
+---
+ drivers/net/wireless/libertas/if_sdio.c |   20 +++++++-------------
+ 1 files changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_sdio.c b/drivers/net/wireless/libertas/if_sdio.c
+index 51f664b..8dbd16a 100644
+--- a/drivers/net/wireless/libertas/if_sdio.c
++++ b/drivers/net/wireless/libertas/if_sdio.c
+@@ -1,7 +1,7 @@
+ /*
+  *  linux/drivers/net/wireless/libertas/if_sdio.c
+  *
+- *  Copyright 2007 Pierre Ossman
++ *  Copyright 2007-2008 Pierre Ossman
+  *
+  * Inspired by if_cs.c, Copyright 2007 Holger Schurig
+  *
+@@ -266,13 +266,10 @@ static int if_sdio_card_to_host(struct if_sdio_card *card)
+ 
+ 	/*
+ 	 * The transfer must be in one transaction or the firmware
+-	 * goes suicidal.
++	 * goes suicidal. There's no way to guarantee that for all
++	 * controllers, but we can at least try.
+ 	 */
+-	chunk = size;
+-	if ((chunk > card->func->cur_blksize) || (chunk > 512)) {
+-		chunk = (chunk + card->func->cur_blksize - 1) /
+-			card->func->cur_blksize * card->func->cur_blksize;
+-	}
++	chunk = sdio_align_size(card->func, size);
+ 
+ 	ret = sdio_readsb(card->func, card->buffer, card->ioport, chunk);
+ 	if (ret)
+@@ -696,13 +693,10 @@ static int if_sdio_host_to_card(struct lbs_private *priv,
+ 
+ 	/*
+ 	 * The transfer must be in one transaction or the firmware
+-	 * goes suicidal.
++	 * goes suicidal. There's no way to guarantee that for all
++	 * controllers, but we can at least try.
+ 	 */
+-	size = nb + 4;
+-	if ((size > card->func->cur_blksize) || (size > 512)) {
+-		size = (size + card->func->cur_blksize - 1) /
+-			card->func->cur_blksize * card->func->cur_blksize;
+-	}
++	size = sdio_align_size(card->func, nb + 4);
+ 
+ 	packet = kzalloc(sizeof(struct if_sdio_packet) + size,
+ 			GFP_ATOMIC);
+-- 
+1.7.1
+
diff --git a/recipes/compat-wireless/compat-wireless-2.6-old_git.bb b/recipes/compat-wireless/compat-wireless-2.6-old_git.bb
index 5dcfe24..2e6b663 100644
--- a/recipes/compat-wireless/compat-wireless-2.6-old_git.bb
+++ b/recipes/compat-wireless/compat-wireless-2.6-old_git.bb
@@ -4,13 +4,20 @@ SECTION = "kernel/modules"
 LICENSE = "GPL"
 RDEPENDS = "wireless-tools"
 DEPENDS = "virtual/kernel"
-PR = "r0"
+PR = "r1"
 PV = "5.2.0+gitr${SRCPV}"
 
 SRC_URI = " \
  git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/compat-wireless-2.6-old.git;protocol=git;branch=master \
  file://fix-makefile.patch \
 "
+
+SRC_URI_append_palmpre = " \
+ file://ignore-compat-devname.patch \
+ file://libertas-fix-padding.patch \
+ file://config-disable-all-but-libertas-and-ieee80211.patch \
+"
+
 S = "${WORKDIR}/git"
 
 SRCREV = "9972065b4339af63d0d0eeb09b8aa224b8a3cada"
-- 
1.7.1



