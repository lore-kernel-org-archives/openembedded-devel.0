Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKPT1-0006K2-Gw
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 09:38:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Apr 2012 00:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143065524"
Received: from unknown (HELO helios.localnet) ([10.252.120.88])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2012 00:28:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ulf@emagii.com
Date: Wed, 18 Apr 2012 08:28:48 +0100
Message-ID: <7419249.iRUESFeaJl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4F8E1A23.4030606@emagii.com>
References: <4F8DF031.60109@emagii.com> <2900608.HO3vnnHahd@helios>
	<4F8E1A23.4030606@emagii.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Support for R/W git in bitbake
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
X-List-Received-Date: Wed, 18 Apr 2012 07:38:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 18 April 2012 03:34:27 Ulf Samuelsson wrote:
> 1. If I am busy working on an application, then it simplifies the
> development process.
>      I can modify the code in the tree and push.
>      This is mainly for kernel development.
> 
> 2. If I work on a prerelease of some S/W drivers/Applications under NDA,
>      then I cannot make that code publicly available
>      but I still want to put  that on my Internet accessible git server.
>      Typicailly this is before the release of a new chip and info about
> the chip should not be
>      made public before the chip is released.
> 
> 3.  I want to be able to ship something similar to the Angstrom setup
> scripts
>       to someone else, and have them build an image, but it should not
> be available
>       to anyone not accepted (without public key at the git server).
> 
> There are other uses for such a functionality, but those are my
> immediate needs.
> 
> As you see, this is mostly for development.
> Once the code is released, then the recipe would be changed to the
> normal git access.
> 
> Didn't know anything about the externalsrc bbclass, but after checking,
> I would say no.
> It won't do the two things above. I do see the use of it though.

externalsrc should handle everything except automatically fetching the source; 
for that you need to have your own local git clone (which of course can be 
r/w). I guess it depends on whether you expect to be sending such recipes to 
non-developers; for developers it ought not to be too much of a hassle to have 
their own local git clone.

The only problem with having an r/w checkout you are doing development in 
under WORKDIR is that if you bitbake -c clean the recipe you will lose 
whatever you are working on - externalsrc avoids this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


