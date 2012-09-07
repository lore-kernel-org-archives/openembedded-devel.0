Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9z9r-0007xZ-O8
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 16:03:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Sep 2012 06:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,385,1344236400"; d="scan'208";a="198930464"
Received: from unknown (HELO helios.localnet) ([10.252.121.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Sep 2012 06:51:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sander van Grieken <sander@outrightsolutions.nl>
Date: Fri, 07 Sep 2012 14:51:15 +0100
Message-ID: <4376304.LnqHmfQDzp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <5049BEFD.9040003@outrightsolutions.nl>
References: <5049BEFD.9040003@outrightsolutions.nl>
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
X-List-Received-Date: Fri, 07 Sep 2012 14:03:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 September 2012 11:31:41 Sander van Grieken wrote:
> Currently, linux-firmware produces one big package with all binary
> firmware files installed. It would be benificial , especially for
> devices with a very small rootfs, to install only a subset of the entire
> collection. Some effort has been done to split off separate packages,
> but it's not clear what the preferred naming should be.
> 
> - Should it follow the kernel-module-* naming, e.g.
> kernel-module-ath9k-htc would need linux-firmware-ath9k-htc?
> - Or should it follow the firmware file naming, e.g. linux-firmware-htc-7010
> - Or maybe have a bit larger packages and simply split by vendor, e.g.
> linux-firmware-atheros
> - How and if to package the license file

It looks like in OE-Core we have some code to do firmware splitting in 
kernel.bbclass - Sander, is it OE-Core you are using or OE-Classic?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


