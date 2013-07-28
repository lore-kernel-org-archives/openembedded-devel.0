Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 700586065F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2013 16:46:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 28 Jul 2013 09:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,764,1367996400"; d="scan'208";a="372525620"
Received: from unknown (HELO helios.localnet) ([10.252.122.160])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2013 09:46:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 28 Jul 2013 17:46:54 +0100
Message-ID: <1989833.hj21tvi2MC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CANyK_8deKJoCUCEnQeqCyBJNy0eKkk2GmJcX6ZDG80A66u52ng@mail.gmail.com>
References: <51D42561.8060907@ts.fujitsu.com> <51D6BD77.4050008@ts.fujitsu.com>
	<CANyK_8deKJoCUCEnQeqCyBJNy0eKkk2GmJcX6ZDG80A66u52ng@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake dies with an python exception | AttributeError: 'NoneType' object has no attribute 'rfind'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Jul 2013 16:46:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul,

On Sunday 28 July 2013 15:09:46 Paul Barker wrote:
> I've just ran into this again building dylan with the latest version
> of bitbake as it doesn't appear that the dylan branch of
> openembedded-core sets FAKEROOTCMD in bitbake.conf. I've cherry-picked
> the commit below from master onto dylan and it looks like the build is
> now going ahead happily.
> 
> Bitbake has no dylan branch so I just assumed I was correct using
> master. Am I wrong here? 

Technically the matching bitbake branch for dylan is 1.18. I'm not sure if we 
spell this out anywhere, we probably should if not.

> If bitbake master is supposed to be able to build old branches of
> OpenEmbedded, perhaps this commit needs backporting to dylan/danny/etc? It
> looks like it shouldn't cause any harm if an older bitbake version is used
> as it simply adds values for FAKEROOTBASEENV and FAKEROOTCMD.

I haven't checked if it's a genuine problem, but I'd be concerned that any 
fixes that went into OE-Core for bitbake's worker refactoring are not in dylan 
and therefore you might get problems other than the one with FAKEROOTCMD.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

