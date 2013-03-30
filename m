Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ULwo5-0003vR-2L
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 15:30:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Mar 2013 07:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,378,1363158000"; d="scan'208";a="286629413"
Received: from unknown (HELO helios.localnet) ([10.255.13.86])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2013 07:13:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Samuelsson <openembedded@emagii.com>
Date: Sat, 30 Mar 2013 14:13:48 +0000
Message-ID: <7185981.fYmuEdii30@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <5156DB73.4040507@emagii.com>
References: <5156DB73.4040507@emagii.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Finding out the IMAGE_BASENAME of the image beeing built
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
X-List-Received-Date: Sat, 30 Mar 2013 14:30:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 30 March 2013 13:32:51 Ulf Samuelsson wrote:
> Trying create a programming script recipe and need to find out the
> IMAGE_BASENAME of the bitbake target
> so I can get the filename of the image
> 
> ${MACHINE}-${IMAGE_BASENAME}.ubi
> 
> I.E: if I do
> 
> $ MACHINE=beagleboard  bitbake some-image
> 
> and "some-image_1.0.bb" contains
> 
> IMAGE_BASENAME = "renamed-image"
> 
> Then the resulting image will be
> 
>      "beagleboard-renamed-image.ubi"
> 
> How get this info from another recipe?

You can't. The way to handle this is as part of do_rootfs itself (e.g. from a 
script called from ROOTFS_POSTPROCESS_COMMAND or IMAGE_POSTPROCESS_COMMAND).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


