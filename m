Received: from usps2.crhc.illinois.edu ([130.126.143.231]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PBJEX-0003cG-PV
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 05:33:11 +0200
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id 60532340009B;
	Wed, 27 Oct 2010 22:32:11 -0500 (CDT)
Received: from localhost.localdomain (corezilla.crhc.uiuc.edu [130.126.143.45])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id 52E4B3400090;
	Wed, 27 Oct 2010 22:32:11 -0500 (CDT)
From: Matt Johnson <johnso87@crhc.illinois.edu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Oct 2010 22:31:30 -0500
Message-Id: <1288236690-6136-2-git-send-email-johnso87@crhc.illinois.edu>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1288236690-6136-1-git-send-email-johnso87@crhc.illinois.edu>
References: <1288236690-6136-1-git-send-email-johnso87@crhc.illinois.edu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.231
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-omap-2.6.36rc -- Consistent MAC address for BeagleBoard xM Adding a patch to linux-omap-2.6.36rc for beagleboard. Patch is adapted from one submitted by Mark Crichton to the Beagleboard Google Group (see http://groups.google.com/group/beagleboard/browse_thread/thread/92d41bb344f8939b?fwc=1). BeagleBoard xM now uses the OMAP's die ID as a MAC instead of generating a random one (since it doesn't have an EEPROM to store it), so you have a consistent MAC across boots. Signed-off-by: Matt Johnson <johnso87@crhc.illinois.edu>
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
X-List-Received-Date: Thu, 28 Oct 2010 03:33:13 -0000

---
 ...e-beagleboard-xm-a-consistent-MAC-address.patch |   82 ++++++++++++++++++++
 recipes/linux/linux-omap_2.6.36rc.bb               |    1 +
 2 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch

diff --git a/recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch b/recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch
new file mode 100644
index 0000000..0526e0d
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch
@@ -0,0 +1,82 @@
+From 60ec781c775e8413ef8ca521b63a07ba9ed2f4aa Mon Sep 17 00:00:00 2001
+From: Matt Johnson <johnso87@crhc.illinois.edu>
+Date: Wed, 27 Oct 2010 22:17:36 -0500
+Subject: [PATCH] Give BeagleBoard xM a consistent MAC address
+ Adapting the patch submitted by Mark Crichton to the Beagleboard Google Group
+ (see http://groups.google.com/group/beagleboard/browse_thread/thread/92d41bb344f8939b?fwc=1)
+ The Beagleboard xM includes an smsc95xx ethernet interface attached to the DM3730 via USB.
+ The Beagleboard lacks an EEPROM to store the MAC address, so the driver generates a random
+ MAC address on every boot.  This patch instead uses the OMAP's die ID as the MAC address
+ (modifying a couple bits to make it a valid MAC), so that the MAC is consistent across boots.
+ A consistent MAC is important if the Beagleboard is to be used on a network with MAC filtering
+ and/or static IP addresses.
+ Signed-off-by: Matt Johnson <johnso87@crhc.illinois.edu>
+
+---
+ drivers/net/usb/smsc95xx.c |   36 +++++++++++++++++++++++++++++++++++-
+ 1 files changed, 35 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
+index 12a3c88..1219bb6 100644
+--- a/drivers/net/usb/smsc95xx.c
++++ b/drivers/net/usb/smsc95xx.c
+@@ -29,6 +29,9 @@
+ #include <linux/crc32.h>
+ #include <linux/usb/usbnet.h>
+ #include <linux/slab.h>
++#if defined (CONFIG_MACH_OMAP_BEAGLE)
++#include <mach/id.h>
++#endif
+ #include "smsc95xx.h"
+ 
+ #define SMSC_CHIPNAME			"smsc95xx"
+@@ -639,6 +642,14 @@ static int smsc95xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
+ 
+ static void smsc95xx_init_mac_address(struct usbnet *dev)
+ {
++#if defined (CONFIG_MACH_OMAP3_BEAGLE)
++	u32 i;
++	struct omap_die_id odi;
++	union {
++		u32 idi[2];
++		u8 id[8];
++	} cpu;
++#endif
+ 	/* try reading mac address from EEPROM */
+ 	if (smsc95xx_read_eeprom(dev, EEPROM_MAC_OFFSET, ETH_ALEN,
+ 			dev->net->dev_addr) == 0) {
+@@ -648,7 +659,30 @@ static void smsc95xx_init_mac_address(struct usbnet *dev)
+ 			return;
+ 		}
+ 	}
+-
++#if defined (CONFIG_MACH_OMAP3_BEAGLE)
++	/* The BeagleBoard xM has a smsm95xx, but no EEPROM. */
++	/* Rather than just come up with a random MAC address, we'll */
++	/* Use a hash of our DM3730's die ID, so at least it's consistent */
++	/* between boots. */
++	
++	/* Look at section 1.5.2 of DM3730 documentation */
++	omap_get_die_id(&odi);
++	cpu.idi[0] = odi.id_0;
++	cpu.idi[1] = odi.id_1;
++	/* Now interpret the die id as a MAC address */
++	/* We need to clear the multicast bit */
++	cpu.id[0] &= 0xfe;
++	/* Set local assignment bit (IEEE802) */
++	cpu.id[1] |= 0x02;
++	
++	for(i = 0; i < ETH_ALEN; i++) {
++		dev->net->dev_addr[i] = cpu.id[i];
++	}
++	//TODO: Do error checking, etc. on die_id.
++	//TODO: Allow the user to set MAC after boot.
++	//TODO: Allow user to select whether they want this behavior or not */
++	return;
++#endif
+ 	/* no eeprom, or eeprom values are invalid. generate random MAC */
+ 	random_ether_addr(dev->net->dev_addr);
+ 	netif_dbg(dev, ifup, dev->net, "MAC address set to random_ether_addr\n");
+-- 
+1.6.3.3
+
diff --git a/recipes/linux/linux-omap_2.6.36rc.bb b/recipes/linux/linux-omap_2.6.36rc.bb
index 64200e1..c79ffa9 100644
--- a/recipes/linux/linux-omap_2.6.36rc.bb
+++ b/recipes/linux/linux-omap_2.6.36rc.bb
@@ -25,6 +25,7 @@ SRC_URI_append = " \
                   file://0005-mmc-don-t-display-single-block-read-console-messages.patch \
                   file://0006-MTD-silence-ecc-errors-on-mtdblock0.patch \
                   file://0007-OMAP-DSS2-OMAPFB-use-phys_to_virt-for-RAM-mappings.patch \
+		  file://0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch \
 "
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.6.3.3



