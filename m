Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pfxm4-0002b8-6l
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 17:54:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 9BF4A314C8A1;
	Thu, 20 Jan 2011 17:53:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id GgHAK7Fc9q9h; Thu, 20 Jan 2011 17:53:29 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 8A9AC314D0C2;
	Thu, 20 Jan 2011 17:53:28 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 20 Jan 2011 16:53:28 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jan 2011 16:53:26 +0000
Message-Id: <1295542406-7879-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1295542406-7879-1-git-send-email-obi@opendreambox.org>
References: <1295542406-7879-1-git-send-email-obi@opendreambox.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 3/3] madwifi-ng-r3314: Apply patches from OpenWrt 10.03
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
X-List-Received-Date: Thu, 20 Jan 2011 16:54:16 -0000

[This revision is not pinned in OE, but used by opendreambox.]

* Update HAL to 20090508.
* Use SRCREV 20550 of OpenWrt.
* Skip 446-single_module.patch (breaks install target).
* Remove dependency on OpenWrt's wprobe API.
* Fix HAL selection for mips32.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---

 ...ine-ioreadwrite32be-for-little-endian-too.patch |   13 ---
 recipes/madwifi/files/fix-target-mips32.patch      |   16 +++
 recipes/madwifi/files/remove-wprobe.patch          |  115 ++++++++++++++++++++
 recipes/madwifi/madwifi-ng_r3314-20080131.bb       |   31 +++++-
 4 files changed, 157 insertions(+), 18 deletions(-)
 delete mode 100644 recipes/madwifi/files/30-define-ioreadwrite32be-for-little-endian-too.patch
 create mode 100644 recipes/madwifi/files/fix-target-mips32.patch
 create mode 100644 recipes/madwifi/files/remove-wprobe.patch

diff --git a/recipes/madwifi/files/30-define-ioreadwrite32be-for-little-endian-too.patch b/recipes/madwifi/files/30-define-ioreadwrite32be-for-little-endian-too.patch
deleted file mode 100644
index 3752a55..0000000
--- a/recipes/madwifi/files/30-define-ioreadwrite32be-for-little-endian-too.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Reported as http://madwifi.org/ticket/1783 ...
-
---- madwifi-ng-r3314-20080131/ath_hal/ah_os.h~	2007-11-23 20:08:18.000000000 +1030
-+++ madwifi-ng-r3314-20080131/ath_hal/ah_os.h	2008-02-11 23:12:11.000000000 +1030
-@@ -168,7 +168,7 @@
-  * for the second time, so the native implementations should be preferred.
-  */
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)) && \
--	!defined(CONFIG_GENERIC_IOMAP) && (AH_BYTE_ORDER == AH_BIG_ENDIAN) && \
-+	!defined(CONFIG_GENERIC_IOMAP) && \
- 	!defined(__mips__) && !defined(__hppa__) && !defined(__powerpc__)
- # ifndef iowrite32be
- #  define iowrite32be(_val, _addr) iowrite32(swab32((_val)), (_addr))
diff --git a/recipes/madwifi/files/fix-target-mips32.patch b/recipes/madwifi/files/fix-target-mips32.patch
new file mode 100644
index 0000000..7439304
--- /dev/null
+++ b/recipes/madwifi/files/fix-target-mips32.patch
@@ -0,0 +1,16 @@
+Upstream: unmaintained version
+
+diff -Naur madwifi-ng-r3314-20080131.orig/ath_hal/ah_target.inc madwifi-ng-r3314-20080131/ath_hal/ah_target.inc
+--- madwifi-ng-r3314-20080131.orig/ath_hal/ah_target.inc	2006-11-17 23:34:30.000000000 +0000
++++ madwifi-ng-r3314-20080131/ath_hal/ah_target.inc	2010-10-26 01:36:47.000000000 +0000
+@@ -26,8 +26,8 @@
+ # Determine the target (i.e. which HAL to use).
+ # The default is $(ARCH)-elf
+ TARGET-$(CONFIG_CPU_32v4) = armv4-$(ENDIAN)-elf
+-TARGET-$(CONFIG_CPU_MIPS32_R1) = mips1-$(ENDIAN)-elf
+-TARGET-$(CONFIG_CPU_MIPS32_R2) = mips-$(ENDIAN)-elf
++TARGET-$(CONFIG_CPU_MIPS32_R1) = mips32-$(ENDIAN)-elf
++TARGET-$(CONFIG_CPU_MIPS32_R2) = mips32r2-$(ENDIAN)-elf
+ TARGET-$(CONFIG_CPU_R4X00) = mipsisa32-$(ENDIAN)-elf
+ TARGET-$(CONFIG_CPU_TX49XX) = mipsisa32-$(ENDIAN)-elf
+ TARGET-$(CONFIG_PPC32) = powerpc-be-elf
diff --git a/recipes/madwifi/files/remove-wprobe.patch b/recipes/madwifi/files/remove-wprobe.patch
new file mode 100644
index 0000000..b251461
--- /dev/null
+++ b/recipes/madwifi/files/remove-wprobe.patch
@@ -0,0 +1,115 @@
+Upstream: OE-only
+
+Wprobe is "a module that exports measurement data from wireless driver to user space",
+which requires an additional out-of-tree kernel module.
+
+See https://dev.openwrt.org/browser/trunk/package/wprobe/.
+
+diff -Naur madwifi-ng-r3314-20080131.orig/ath/if_ath.c madwifi-ng-r3314-20080131/ath/if_ath.c
+--- madwifi-ng-r3314-20080131.orig/ath/if_ath.c	2010-10-26 11:15:51.000000000 +0000
++++ madwifi-ng-r3314-20080131/ath/if_ath.c	2010-10-26 11:19:02.000000000 +0000
+@@ -396,7 +396,6 @@
+ static int rfkill = 0;
+ static int tpc = 1;
+ static int xchanmode = -1;
+-#include "ath_wprobe.c"
+ 
+ static const struct ath_hw_detect generic_hw_info = {
+ 	.vendor_name = "Unknown",
+@@ -1539,7 +1538,6 @@
+ 		ath_hal_intrset(ah, sc->sc_imask);
+ 	}
+ 
+-	ath_init_wprobe_dev(avp);
+ 	return vap;
+ }
+ 
+@@ -1621,7 +1619,6 @@
+ 		decrease = 0;
+ 
+ 	ieee80211_vap_detach(vap);
+-	ath_remove_wprobe_dev(ATH_VAP(vap));
+ 	/* NB: memory is reclaimed through dev->destructor callback */
+ 	if (decrease)
+ 		sc->sc_nvaps--;
+@@ -6008,7 +6005,6 @@
+ 	/* Clean up node-specific rate things - this currently appears to 
+ 	 * always be a no-op */
+ 	sc->sc_rc->ops->node_cleanup(sc, ATH_NODE(ni));
+-	ath_wprobe_node_leave(ni->ni_vap, ni);
+ 
+ 	ATH_NODE_UAPSD_LOCK_IRQ(an);
+ #ifdef IEEE80211_DEBUG_REFCNT
+@@ -7046,8 +7042,6 @@
+ 				goto lookup_slowpath;
+ 			}
+ 			ATH_RSSI_LPF(ATH_NODE(ni)->an_avgrssi, rs->rs_rssi);
+-			ath_node_sample_rx(ni, rs);
+-			ath_wprobe_report_rx(ni->ni_vap, rs, skb);
+ 			type = ieee80211_input(ni->ni_vap, ni, skb, rs->rs_rssi, bf->bf_tsf);
+ 			ieee80211_unref_node(&ni);
+ 		} else {
+@@ -7063,12 +7057,8 @@
+ 				vap = ieee80211_find_rxvap(ic, wh->i_addr1);
+ 
+ 			if (vap) {
+-				ath_wprobe_report_rx(vap, rs, skb);
+ 				ni = ieee80211_find_rxnode(ic, vap, wh);
+ 			} else {
+-				TAILQ_FOREACH(vap, &ic->ic_vaps, iv_next) {
+-					ath_wprobe_report_rx(vap, rs, skb);
+-				}
+ 				ni = NULL;
+ 			}
+ 
+@@ -7076,7 +7066,6 @@
+ 				ieee80211_keyix_t keyix;
+ 
+ 				ATH_RSSI_LPF(ATH_NODE(ni)->an_avgrssi, rs->rs_rssi);
+-				ath_node_sample_rx(ni, rs);
+ 				type = ieee80211_input(vap, ni, skb, rs->rs_rssi, bf->bf_tsf);
+ 				/*
+ 				 * If the station has a key cache slot assigned
+@@ -8662,7 +8651,6 @@
+ 				sc->sc_stats.ast_tx_rssi = ts->ts_rssi;
+ 				ATH_RSSI_LPF(an->an_halstats.ns_avgtxrssi,
+ 					ts->ts_rssi);
+-					ath_node_sample_tx(&an->an_node, ts, bf->bf_skb);
+ 				if (bf->bf_skb->priority == WME_AC_VO ||
+ 				    bf->bf_skb->priority == WME_AC_VI)
+ 					ni->ni_ic->ic_wme.wme_hipri_traffic++;
+@@ -10175,7 +10163,6 @@
+ 	struct ath_softc *sc = netdev_priv(ic->ic_dev);
+ 
+ 	sc->sc_rc->ops->newassoc(sc, ATH_NODE(ni), isnew);
+-	ath_wprobe_node_join(ni->ni_vap, ni);
+ 
+ 	/* are we supporting compression? */
+ 	if (!(vap->iv_ath_cap & ni->ni_ath_flags & IEEE80211_NODE_COMP))
+diff -Naur madwifi-ng-r3314-20080131.orig/ath/if_athvar.h madwifi-ng-r3314-20080131/ath/if_athvar.h
+--- madwifi-ng-r3314-20080131.orig/ath/if_athvar.h	2010-10-26 11:15:51.000000000 +0000
++++ madwifi-ng-r3314-20080131/ath/if_athvar.h	2010-10-26 11:17:20.000000000 +0000
+@@ -46,7 +46,6 @@
+ #include "ah_desc.h"
+ #include "ah_os.h"
+ #include "if_athioctl.h"
+-#include <linux/wprobe.h>
+ #include "net80211/ieee80211.h"		/* XXX for WME_NUM_AC */
+ #include <asm/io.h>
+ #include <linux/list.h>
+@@ -361,7 +360,6 @@
+ /* driver-specific node state */
+ struct ath_node {
+ 	struct ieee80211_node an_node;		/* base class */
+-	struct wprobe_link an_wplink;
+ 	uint8_t an_wplink_active;
+ 	struct work_struct an_destroy;
+ 	u_int16_t an_decomp_index; 		/* decompression mask index */
+@@ -533,7 +531,6 @@
+ #else
+ 	unsigned int av_beacon_alloc;
+ #endif
+-	struct wprobe_iface av_wpif;
+ 	u32 av_rxframes;
+ 	u32 av_rxprobereq;
+ };
diff --git a/recipes/madwifi/madwifi-ng_r3314-20080131.bb b/recipes/madwifi/madwifi-ng_r3314-20080131.bb
index 38f63f3..6a2c2a6 100644
--- a/recipes/madwifi/madwifi-ng_r3314-20080131.bb
+++ b/recipes/madwifi/madwifi-ng_r3314-20080131.bb
@@ -2,12 +2,33 @@
 
 require madwifi-ng_r.inc
 
-SRC_URI += " \
-	file://30-define-ioreadwrite32be-for-little-endian-too.patch \
-	"
-
 # PR set after the include, to override what's set in the included file.
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+# versions of OpenWrt backfire (10.03)
+HAL_VERSION = "20090508"
+SRCREV = "20550"
 
+SRC_URI += " \
+        svn://svn.openwrt.org/openwrt/trunk/package/madwifi;module=patches \
+        http://mirror2.openwrt.org/sources/ath_hal-${HAL_VERSION}.tgz;name=hal \
+        file://fix-target-mips32.patch \
+        file://remove-wprobe.patch;apply=no \
+        "
 SRC_URI[md5sum] = "2c7352cbbdac995de8c3bce5b80db5f2"
 SRC_URI[sha256sum] = "0599c75b95ba63bdc554cb8124192e62c75fbeb71b9e8a5a7bc351c8e0666758"
+SRC_URI[hal.md5sum] = "4ab7ae8bdb96c0be388c98bf8f92d5ca"
+SRC_URI[hal.sha256sum] = "ced93d25aea7ee43807147a0269e69a072e718d59e7dab904bbe48b900409483"
+
+addtask postpatch after do_patch before do_configure
+
+do_postpatch() {
+        rm -rf hal
+        cp -a ${WORKDIR}/ath_hal-${HAL_VERSION} hal
+        rm -f ${WORKDIR}/patches/446-single_module.patch
+        for i in ${WORKDIR}/patches/*.patch; do
+                oenote "Applying openwrt patch '$i'"
+                patch -p1 -i $i
+        done
+        patch -p1 -i ${WORKDIR}/remove-wprobe.patch
+}
-- 
1.7.2.3



