Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBKSG-0000Z2-AQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 06:51:16 +0200
Received: by yxe42 with SMTP id 42so1001010yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 21:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mHpMvaz6Vlk+F9zGTLGjztWt4Wdg0hUFrOeUnNSbQ5s=;
	b=lmEVdMcpKgtc/9NXvGXl9OvPn8OQRUlScsNj811CX371zdpogQDLGLUKHVbOAfriSW
	uBZPDiTLlukxCrvPrSlwCC/wCdz3/bN7PlASrakNgLg4/bpCoA58DGrm4sWM3/GnkYBn
	YsO1DXYHHTKQADOGwJtUjuYwKIRawYZn9ZKJY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CjUxO1Uh01xMztFMG1I89p3PhcUxiR1b62zVTBZCh5QNdZjJddltFN9iNz/CGF0Ukp
	rUw7dfpry4mcUen8StVopoVTlvEtJN6iWbt+Uftsvb+qUUXtCofKlBxKvvANS9DhGuO5
	txzc/lUoQPJmt2fLP7eDrJW0NguwECwS+Q2oM=
Received: by 10.151.147.10 with SMTP id z10mr9145879ybn.270.1288241427238;
	Wed, 27 Oct 2010 21:50:27 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q36sm467967ybk.18.2010.10.27.21.50.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Oct 2010 21:50:26 -0700 (PDT)
Date: Wed, 27 Oct 2010 21:50:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101028045032.GA31542@gmail.com>
References: <1288237150-6284-1-git-send-email-johnso87@crhc.illinois.edu>
	<1288237150-6284-2-git-send-email-johnso87@crhc.illinois.edu>
MIME-Version: 1.0
In-Reply-To: <1288237150-6284-2-git-send-email-johnso87@crhc.illinois.edu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-omap-2.6.36rc -- Consistent MAC address for BeagleBoard xM
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
X-List-Received-Date: Thu, 28 Oct 2010 04:51:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/10/10 22:39), Matt Johnson wrote:
>  Adding a patch to linux-omap-2.6.36rc for beagleboard.  Patch is adapted
>  from one submitted by Mark Crichton to the Beagleboard Google Group
>  (see http://groups.google.com/group/beagleboard/browse_thread/thread/92d41bb344f8939b?fwc=1).
>  BeagleBoard xM now uses the OMAP's die ID as a MAC instead of generating a random one
>  (since it doesn't have an EEPROM to store it), so you have a consistent MAC across boots.
> 
>  Signed-off-by: Matt Johnson <johnso87@crhc.illinois.edu>

Thank you for your contribution. Your patch looks good however you need to
bump the PR for the recipe. Please resend the patch with PR update included

Thanks

-Khem
> 
> ---
>  ...e-beagleboard-xm-a-consistent-MAC-address.patch |   82 ++++++++++++++++++++
>  recipes/linux/linux-omap_2.6.36rc.bb               |    1 +
>  2 files changed, 83 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch
> 
> diff --git a/recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch b/recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch
> new file mode 100644
> index 0000000..0526e0d
> --- /dev/null
> +++ b/recipes/linux/linux-omap-2.6.36rc/0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch
> @@ -0,0 +1,82 @@
> +From 60ec781c775e8413ef8ca521b63a07ba9ed2f4aa Mon Sep 17 00:00:00 2001
> +From: Matt Johnson <johnso87@crhc.illinois.edu>
> +Date: Wed, 27 Oct 2010 22:17:36 -0500
> +Subject: [PATCH] Give BeagleBoard xM a consistent MAC address
> +
> + Adapting the patch submitted by Mark Crichton to the Beagleboard Google Group
> + (see http://groups.google.com/group/beagleboard/browse_thread/thread/92d41bb344f8939b?fwc=1)
> + The Beagleboard xM includes an smsc95xx ethernet interface attached to the DM3730 via USB.
> + The Beagleboard lacks an EEPROM to store the MAC address, so the driver generates a random
> + MAC address on every boot.  This patch instead uses the OMAP's die ID as the MAC address
> + (modifying a couple bits to make it a valid MAC), so that the MAC is consistent across boots.
> + A consistent MAC is important if the Beagleboard is to be used on a network with MAC filtering
> + and/or static IP addresses.
> +
> + Signed-off-by: Matt Johnson <johnso87@crhc.illinois.edu>
> +
> +---
> + drivers/net/usb/smsc95xx.c |   36 +++++++++++++++++++++++++++++++++++-
> + 1 files changed, 35 insertions(+), 1 deletions(-)
> +
> +diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
> +index 12a3c88..1219bb6 100644
> +--- a/drivers/net/usb/smsc95xx.c
> ++++ b/drivers/net/usb/smsc95xx.c
> +@@ -29,6 +29,9 @@
> + #include <linux/crc32.h>
> + #include <linux/usb/usbnet.h>
> + #include <linux/slab.h>
> ++#if defined (CONFIG_MACH_OMAP_BEAGLE)
> ++#include <mach/id.h>
> ++#endif
> + #include "smsc95xx.h"
> + 
> + #define SMSC_CHIPNAME			"smsc95xx"
> +@@ -639,6 +642,14 @@ static int smsc95xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
> + 
> + static void smsc95xx_init_mac_address(struct usbnet *dev)
> + {
> ++#if defined (CONFIG_MACH_OMAP3_BEAGLE)
> ++	u32 i;
> ++	struct omap_die_id odi;
> ++	union {
> ++		u32 idi[2];
> ++		u8 id[8];
> ++	} cpu;
> ++#endif
> + 	/* try reading mac address from EEPROM */
> + 	if (smsc95xx_read_eeprom(dev, EEPROM_MAC_OFFSET, ETH_ALEN,
> + 			dev->net->dev_addr) == 0) {
> +@@ -648,7 +659,30 @@ static void smsc95xx_init_mac_address(struct usbnet *dev)
> + 			return;
> + 		}
> + 	}
> +-
> ++#if defined (CONFIG_MACH_OMAP3_BEAGLE)
> ++	/* The BeagleBoard xM has a smsm95xx, but no EEPROM. */
> ++	/* Rather than just come up with a random MAC address, we'll */
> ++	/* Use a hash of our DM3730's die ID, so at least it's consistent */
> ++	/* between boots. */
> ++	
> ++	/* Look at section 1.5.2 of DM3730 documentation */
> ++	omap_get_die_id(&odi);
> ++	cpu.idi[0] = odi.id_0;
> ++	cpu.idi[1] = odi.id_1;
> ++	/* Now interpret the die id as a MAC address */
> ++	/* We need to clear the multicast bit */
> ++	cpu.id[0] &= 0xfe;
> ++	/* Set local assignment bit (IEEE802) */
> ++	cpu.id[1] |= 0x02;
> ++	
> ++	for(i = 0; i < ETH_ALEN; i++) {
> ++		dev->net->dev_addr[i] = cpu.id[i];
> ++	}
> ++	//TODO: Do error checking, etc. on die_id.
> ++	//TODO: Allow the user to set MAC after boot.
> ++	//TODO: Allow user to select whether they want this behavior or not */
> ++	return;
> ++#endif
> + 	/* no eeprom, or eeprom values are invalid. generate random MAC */
> + 	random_ether_addr(dev->net->dev_addr);
> + 	netif_dbg(dev, ifup, dev->net, "MAC address set to random_ether_addr\n");
> +-- 
> +1.6.3.3
> +
> diff --git a/recipes/linux/linux-omap_2.6.36rc.bb b/recipes/linux/linux-omap_2.6.36rc.bb
> index 64200e1..c79ffa9 100644
> --- a/recipes/linux/linux-omap_2.6.36rc.bb
> +++ b/recipes/linux/linux-omap_2.6.36rc.bb
> @@ -25,6 +25,7 @@ SRC_URI_append = " \
>                    file://0005-mmc-don-t-display-single-block-read-console-messages.patch \
>                    file://0006-MTD-silence-ecc-errors-on-mtdblock0.patch \
>                    file://0007-OMAP-DSS2-OMAPFB-use-phys_to_virt-for-RAM-mappings.patch \
> +		  file://0008-give-the-beagleboard-xm-a-consistent-MAC-address.patch \
>  "
>  
>  SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


