Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCzgN-0003yz-Rw
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 22:41:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2012 13:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="126246625"
Received: from unknown (HELO helios.localnet) ([10.252.123.243])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2012 13:32:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Date: Wed, 28 Mar 2012 21:32:21 +0100
Message-ID: <5366685.RG9uTzE68W@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F736B9F.9050304@dynamicdevices.co.uk>
References: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
	<2372633.2CZh3kKOpL@helios> <4F736B9F.9050304@dynamicdevices.co.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Modified fetch() checksums to be correct for libpng 1.4.28 released 15/3/12 (current) instead of previous 8/3/12 release
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
X-List-Received-Date: Wed, 28 Mar 2012 20:41:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 March 2012 20:50:55 Alex J Lennon wrote:
> Paul,
> 
> >FYI, I'm pretty sure that fetch2 from the version of bitbake we use with
> >OE-
> I thought it might. Does it still do that if the checksum fails though?

Yes, I believe (without having tested it recently) that a SRC_URI checksum 
failure is considered in the same way as if the download failed.

> >Of course that's assuming there is a mirror available.
> 
> I'm happy to host a 2nd copy and mod the .bb to add another source if
> that helps (the
> libpng repo seems to have a history of deleting versions from what I saw
> of the patch
> history so it might be a good idea?). Is that ok for everybody?

No harm in it, however I believe it may be better to get it on 
sources.openembedded.org - I think the usual procedure is to ping Tom King 
(ka6sox on IRC) and then send get the files to him so he can upload them there.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


