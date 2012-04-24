Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SMgm1-0006XU-Ps
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 16:31:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2012 07:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="134663625"
Received: from unknown (HELO helios.localnet) ([10.252.120.52])
	by azsmga001.ch.intel.com with ESMTP; 24 Apr 2012 07:21:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2012 15:21:44 +0100
Message-ID: <11414981.06zDBIpEfK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAGiJk9d5oeXCULH2c4xh47yLpa6TRB6upVYzz233+z+6fdrNog@mail.gmail.com>
References: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
	<2075617.XNr0ya9tIT@helios>
	<CAGiJk9d5oeXCULH2c4xh47yLpa6TRB6upVYzz233+z+6fdrNog@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-kde][PATCH] qt4-x11-free 4.8.0 bbappend: fix GLES configure switch and turn it on for AM335x SoCs as well
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
X-List-Received-Date: Tue, 24 Apr 2012 14:31:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 April 2012 15:54:17 Samuel Stirtzel wrote:
> For this .bbappend it is no problem, over time the machine specific
> stuff will disappear (it is only there for testing).
> 
> But I see a problem with kde-workspace [1].
> If it should build kwin_gles then it depends on libgles, but not every
> machine has libgles.
> It would be no problem if virtual/libgl is used but that don't work
> for machines that use virtual/egl.
> 
> Or is there a way to build time recommend something instead of depending on
> it?

You can add an RRECOMMENDS, however if the library is already dynamically 
linked to some other library then there will be a hard dependency on that 
library which via the shlibdeps code in package.bbclass will become an 
RDEPENDS; nothing in our system can really work around that if it's integrated 
into a single binary (or indivisible group of binaries).

It seems to me that either the functionality needs to be split out into its 
own separate package which can be pulled in optionally (if possible), or more 
likely in this case the recipe needs to become machine-specific and be 
dependent on some item in MACHINE_FEATURES.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


