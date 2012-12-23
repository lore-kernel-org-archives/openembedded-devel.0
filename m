Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tmrtw-00022k-TX
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 21:12:03 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2012 11:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,343,1355126400"; d="scan'208";a="269157978"
Received: from unknown (HELO helios.localnet) ([10.252.123.19])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2012 11:57:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 23 Dec 2012 19:57:06 +0000
Message-ID: <3012778.0fGtJNS4Ad@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <20121220140211.GO14543@jama.palm1.palmone.com>
References: <20121220133018.GJ14543@jama.palm1.palmone.com>
	<20121220133307.GK14543@jama.palm1.palmone.com>
	<20121220140211.GO14543@jama.palm1.palmone.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver] patches on patchwork
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
X-List-Received-Date: Sun, 23 Dec 2012 20:12:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 20 December 2012 15:02:11 Martin Jansa wrote:
> On Thu, Dec 20, 2012 at 02:33:07PM +0100, Martin Jansa wrote:
> > Hi, can you check and update patche in meta-webserver bundle?
> > http://patches.openembedded.org/bundle/jama/meta-webserver/?archive=both

I didn't comment at the time but I don't particularly like this patch - I 
didn't see this error and if it is present, I don't think this is the right 
way to fix it - it should be fixed in the makefile surely...

> I've forgot to mention there is also one in meta-opie and one in
> meta-handheld
>
> http://patches.openembedded.org/bundle/jama/meta-handheld/?archive=both

This has already been applied, I have marked it as such.

> http://patches.openembedded.org/bundle/jama/meta-opie/?archive=both

Half of this has been superseded (the addition of MACHINE_EXTRA_RRECOMMENDS - 
now we just add packagegroup-base) and for ensuring that the kernel image is 
within the rootfs, the machine config should be adding kernel-image to 
MACHINE_ESSENTIAL_EXTRA_RDEPENDS. I discussed this with Denis at the time, so 
I've marked it as rejected.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


