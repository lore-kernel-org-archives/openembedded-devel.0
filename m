Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9zbz-0008SU-1P
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 16:32:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2012 07:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,387,1344236400"; d="scan'208";a="219415757"
Received: from unknown (HELO helios.localnet) ([10.252.121.175])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2012 07:20:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sander van Grieken <sander@outrightsolutions.nl>
Date: Fri, 07 Sep 2012 15:20:18 +0100
Message-ID: <1561903.1HycqArB5v@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <504A00D7.3030305@outrightsolutions.nl>
References: <5049BEFD.9040003@outrightsolutions.nl>
	<20120907134455.GA21660@mi.fu-berlin.de>
	<504A00D7.3030305@outrightsolutions.nl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: linux-firmware
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
X-List-Received-Date: Fri, 07 Sep 2012 14:32:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 September 2012 16:12:39 Sander van Grieken wrote:
> On 09/07/2012 03:44 PM, Henning Heinold wrote:
> > On Fri, Sep 07, 2012 at 11:31:41AM +0200, Sander van Grieken wrote:
> >> Hi,
> >> 
> >> Currently, linux-firmware produces one big package with all binary
> >> firmware files installed. It would be benificial , especially for
> >> devices with a very small rootfs, to install only a subset of the entire
> >> collection. Some effort has been done to split off separate packages,
> >> but it's not clear what the preferred naming should be.
> >> 
> >> - Should it follow the kernel-module-* naming, e.g.
> >> kernel-module-ath9k-htc would need linux-firmware-ath9k-htc?
> >> - Or should it follow the firmware file naming, e.g.
> >> linux-firmware-htc-7010 - Or maybe have a bit larger packages and simply
> >> split by vendor, e.g. linux-firmware-atheros
> >> - How and if to package the license file
> >> 
> >> Thoughts?
> > 
> > Because we even split all kernel modules into seperate packages we should
> > do it for firmware files too. But that is a lot of monkey work, you need
> > to check for all firmware files and make the right packages.
> Yes, that's why I ask. It would be helpful if there's a comment in the
> bb explaining this is wanted, and how to name the package. Then devs
> working with certain hardware can define a specific package and test
> with their hardware locally. This way it can be incrementally done.
> 
> > The scheme of the package names seems fine to me.
> 
> What scheme?
> 
> rtl8192cu follows kernel module naming, firmware is rtl8192cufw, and
> includes license file
> rtl8192ce follows kernel module naming, doesn't include license file
> sd8686 follows firmware naming, includes license file
> wl12xx follows 'firmware' naming (actually is vendor scope), doesn't
> include license file

Ignore my other message - I was confused by some seemingly old code we have in 
kernel.bbclass, that is separate from the linux-firmware recipe.

We should always be including the license file if present I believe.

As for the package splitting I would advocate some kind of automated splitting 
using do_split_packages rather than manually packaging everything if we can 
avoid it. FYI I wrote something about the use of this here:

  https://wiki.yoctoproject.org/wiki/Handling_optional_module_packaging

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


