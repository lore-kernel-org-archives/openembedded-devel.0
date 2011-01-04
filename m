Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1Pa4rU-0001CP-Ea
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 12:15:32 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id 91D16275D035; Tue,  4 Jan 2011 12:08:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (brmn-4d0aa6bf.pool.mediaWays.net [77.10.166.191])
	by gravedo.de (Postfix) with ESMTPSA id B578947A004E;
	Tue,  4 Jan 2011 12:08:40 +0100 (CET)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 12:08:36 +0100
Message-Id: <1294139317-28208-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1294139317-28208-1-git-send-email-morphis@gravedo.de>
References: <1294139317-28208-1-git-send-email-morphis@gravedo.de>
Subject: [PATCH 1/2] compat-wireless-2.6-old: add initial recipe
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

compat-wireless-2.6-old provides more recent wireless drivers than kernels <= 2.6.26
provides on their own. On some machines you are stucked to that quite old kernel version
but need a more recent wireless driver to get wifi working.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 .../compat-wireless-2.6-old/fix-makefile.patch     |  164 ++++++++++++++++++++
 .../compat-wireless/compat-wireless-2.6-old_git.bb |   20 +++
 2 files changed, 184 insertions(+), 0 deletions(-)
 create mode 100644 recipes/compat-wireless/compat-wireless-2.6-old/fix-makefile.patch
 create mode 100644 recipes/compat-wireless/compat-wireless-2.6-old_git.bb

diff --git a/recipes/compat-wireless/compat-wireless-2.6-old/fix-makefile.patch b/recipes/compat-wireless/compat-wireless-2.6-old/fix-makefile.patch
new file mode 100644
index 0000000..9dff5c3
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-2.6-old/fix-makefile.patch
@@ -0,0 +1,164 @@
+From af47c5b7686ca91a32eab8b7c83def34bd55e4c0 Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Sat, 18 Dec 2010 18:23:59 +0100
+Subject: [PATCH 5/5] Remove not working uninstall logic and rename install to modules_install
+
+Default uninstall/install logic is not working for cross compile environments like OE so
+we fix that here.
+---
+ Makefile |  130 +-------------------------------------------------------------
+ 1 files changed, 2 insertions(+), 128 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 72ea85b..8201140 100644
+--- a/Makefile
++++ b/Makefile
+@@ -57,136 +57,9 @@ $(CREL_CHECK):
+ 	@touch $@
+ 	@md5sum $(COMPAT_CONFIG) > $(CONFIG_CHECK)
+ 
+-install: uninstall modules
++modules_install: modules
+ 	$(MAKE) -C $(KLIB_BUILD) M=$(PWD) $(KMODDIR_ARG) $(KMODPATH_ARG) \
+ 		modules_install
+-	@# All the scripts we can use
+-	@mkdir -p /usr/lib/compat-wireless/
+-	@install scripts/modlib.sh	/usr/lib/compat-wireless/
+-	@install scripts/madwifi-unload	/usr/sbin/
+-	@# This is to allow switching between drivers without blacklisting
+-	@install scripts/athenable	/usr/sbin/
+-	@install scripts/b43enable	/usr/sbin/
+-	@install scripts/athload	/usr/sbin/
+-	@install scripts/b43load	/usr/sbin/
+-	@if [ ! -z $(MADWIFI) ]; then \
+-		echo ;\
+-		echo -n "Note: madwifi detected, we're going to disable it. "  ;\
+-		echo "If you would like to enable it later you can run:"  ;\
+-		echo "    sudo athenable madwifi"  ;\
+-		echo ;\
+-		echo Running athenable ath5k...;\
+-		/usr/sbin/athenable ath5k ;\
+-	fi
+-	@/sbin/depmod -ae
+-	@echo
+-	@echo "Currently detected wireless subsystem modules:"
+-	@echo 
+-	@$(MODPROBE) -l mac80211
+-	@# rc80211_simple is a module only on 2.6.22 and 2.6.23
+-	@$(MODPROBE) -l cfg80211
+-	@$(MODPROBE) -l adm8211
+-	@$(MODPROBE) -l ar9170
+-	@$(MODPROBE) -l at76_usb
+-	@$(MODPROBE) -l ath5k
+-	@$(MODPROBE) -l ath9k
+-	@$(MODPROBE) -l b43
+-	@$(MODPROBE) -l b43legacy
+-	@$(MODPROBE) -l ssb
+-	@$(MODPROBE) -l iwlcore
+-	@$(MODPROBE) -l iwl3945
+-	@$(MODPROBE) -l iwlagn
+-	@$(MODPROBE) -l ipw2100
+-	@$(MODPROBE) -l ipw2200
+-	@$(MODPROBE) -l ieee80211
+-	@$(MODPROBE) -l ieee80211_crypt
+-	@$(MODPROBE) -l libertas_cs
+-	@$(MODPROBE) -l ub8xxx
+-	@$(MODPROBE) -l p54_pci
+-	@$(MODPROBE) -l p54_usb
+-	@$(MODPROBE) -l rt2400pci
+-	@$(MODPROBE) -l rt2500pci
+-	@$(MODPROBE) -l rt2500usb
+-	@$(MODPROBE) -l rt61pci
+-	@$(MODPROBE) -l rt73usb
+-	@$(MODPROBE) -l usbnet
+-	@$(MODPROBE) -l cdc_ether
+-	@$(MODPROBE) -l rndis_host
+-	@$(MODPROBE) -l rndis_wlan
+-	@$(MODPROBE) -l rtl8180
+-	@$(MODPROBE) -l rtl8187
+-	@# rc80211_simple is no longer a module
+-	@#$(MODPROBE) -l rc80211_simple
+-	@$(MODPROBE) -l zd1211rw
+-	@echo 
+-	@echo Now run:
+-	@echo 
+-	@echo make unload
+-	@echo
+-	@echo And then load the wireless module you need. If unsure run:
+-	@echo
+-	@echo make load
+-	@echo
+-
+-uninstall:
+-	@# New location, matches upstream
+-	@rm -rf $(KLIB)/$(KMODDIR)/net/mac80211/
+-	@rm -rf $(KLIB)/$(KMODDIR)/net/wireless/
+-	@rm -rf $(KLIB)/$(KMODDIR)/net/ieee80211/
+-	@rm -rf $(KLIB)/$(KMODDIR)/drivers/ssb/
+-	@rm -rf $(KLIB)/$(KMODDIR)/drivers/net/usb/
+-	@rm -rf $(KLIB)/$(KMODDIR)/drivers/net/wireless/
+-	@# Lets only remove the stuff we are sure we are providing
+-	@# on the misc directory.
+-	@rm -f $(KLIB)/$(KMODDIR)/drivers/misc/eeprom_93cx6.ko
+-	@/sbin/depmod -ae
+-	@if [ -x /usr/sbin/athenable ]; then /usr/sbin/athenable madwifi; fi
+-	@if [ -x /usr/sbin/b43enable ]; then /usr/sbin/b43enable bcm43xx; fi
+-	@echo
+-	@echo "Your old wireless subsystem modules were left intact:"
+-	@echo 
+-	@$(MODPROBE) -l mac80211
+-	@$(MODPROBE) -l cfg80211
+-	@# rc80211_simple is a module on 2.6.22 and 2.6.23 though
+-	@$(MODPROBE) -l adm8211
+-	@$(MODPROBE) -l ar9170
+-	@$(MODPROBE) -l ath5k
+-	@$(MODPROBE) -l ath9k
+-	@$(MODPROBE) -l at76_usb
+-	@$(MODPROBE) -l b43
+-	@$(MODPROBE) -l b43legacy
+-	@$(MODPROBE) -l ssb
+-	@$(MODPROBE) -l rc80211_simple
+-	@$(MODPROBE) -l iwlcore
+-	@$(MODPROBE) -l iwl3945
+-	@$(MODPROBE) -l iwlagn
+-	@$(MODPROBE) -l ipw2100
+-	@$(MODPROBE) -l ipw2200
+-	@$(MODPROBE) -l ieee80211
+-	@$(MODPROBE) -l ieee80211_crypt
+-	@$(MODPROBE) -l libertas_cs
+-	@$(MODPROBE) -l mac80211
+-	@$(MODPROBE) -l ub8xxx
+-	@$(MODPROBE) -l p54pci
+-	@$(MODPROBE) -l p54usb
+-	@$(MODPROBE) -l rt2400pci
+-	@$(MODPROBE) -l rt2500pci
+-	@$(MODPROBE) -l rt2500usb
+-	@$(MODPROBE) -l rt61pci
+-	@$(MODPROBE) -l rt73usb
+-	@$(MODPROBE) -l usbnet
+-	@$(MODPROBE) -l cdc_ether
+-	@$(MODPROBE) -l rndis_host
+-	@$(MODPROBE) -l rndis_wlan
+-	@$(MODPROBE) -l rtl8180
+-	@$(MODPROBE) -l rtl8187
+-	@# rc80211_simple is no longer a module
+-	@#$(MODPROBE) -l rc80211_simple
+-	@$(MODPROBE) -l zd1211rw
+-	@# Old kernels have ieee80211softmac, this will be removed soon :)
+-	@$(MODPROBE) -l ieee80211softmac
+-	@
+-	@echo 
+ 
+ clean:
+ 	@rm -f compat-release
+@@ -194,6 +67,7 @@ clean:
+ 		$(MAKE) -C $(KLIB_BUILD) M=$(PWD) clean ;\
+ 	fi
+ 	@rm -f $(CREL_PRE)*
++
+ unload:
+ 	@./scripts/unload.sh
+ 
+-- 
+1.7.1
+
diff --git a/recipes/compat-wireless/compat-wireless-2.6-old_git.bb b/recipes/compat-wireless/compat-wireless-2.6-old_git.bb
new file mode 100644
index 0000000..5dcfe24
--- /dev/null
+++ b/recipes/compat-wireless/compat-wireless-2.6-old_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Latest wireless drivers for kernels <= 2.6.26"
+HOMEPAGE = "http://wireless.kernel.org/en/users/Download"
+SECTION = "kernel/modules"
+LICENSE = "GPL"
+RDEPENDS = "wireless-tools"
+DEPENDS = "virtual/kernel"
+PR = "r0"
+PV = "5.2.0+gitr${SRCPV}"
+
+SRC_URI = " \
+ git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/compat-wireless-2.6-old.git;protocol=git;branch=master \
+ file://fix-makefile.patch \
+"
+S = "${WORKDIR}/git"
+
+SRCREV = "9972065b4339af63d0d0eeb09b8aa224b8a3cada"
+
+inherit module
+
+EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
-- 
1.7.1



