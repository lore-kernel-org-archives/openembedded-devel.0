Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9072D6041E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:48:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2013 03:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="326732210"
Received: from unknown (HELO helios.localnet) ([10.252.121.242])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2013 03:48:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 04 Jul 2013 11:48:04 +0100
Message-ID: <1721069.SICaQ1bLDa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CANyK_8eOaDbVANrOUuRAzhguRSBjv_puQdjjL+NbfVvv79pU7Q@mail.gmail.com>
References: <51D42561.8060907@ts.fujitsu.com> <49035936.yua4bikce8@helios>
	<CANyK_8eOaDbVANrOUuRAzhguRSBjv_puQdjjL+NbfVvv79pU7Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Jul 2013 10:48:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 July 2013 10:53:15 Paul Barker wrote:
> On 4 July 2013 10:17, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > On Thursday 04 July 2013 10:18:32 Cestonaro Thilo wrote:
> >> hey,
> >> 
> >> found it. The Var "FAKEROOTCMD" wasn't set so bitbake died as executing
> >> "None" doesn't work.
> >> 
> >> Added
> >> FAKEROOTCMD="fakeroot"
> >> to my local.conf and it worked.
> >> 
> >> But anyway, shouldn't this be the default?!
> > 
> > FAKEROOTCMD is set in meta/conf/bitbake.conf, so this is indeed
> > unexpected.
> > BTW, "fakeroot" is not correct - it needs to point to pseudo (and that is
> > the default if you have a look at meta/conf/bitbake.conf).
> 
> I stumbled onto this sort of error when I cloned poky at master but
> copied my bblayers.conf from a previous build and didn't update the
> paths to point to the correct places for the layers. So I was running
> latest bitbake with latest poky 'scripts' directory on the path,
> against an old version of the 'dylan' branch of poky.
> 
> What versions of openembedded/poky/bitbake are you using? If they're
> fetched from git I'd recommend updating everything and trying again.
> It could just be a mismatch between the bitbake version and the
> metadata versions.

If this issue is reproducible I'd really appreciate some help in doing so; we 
shouldn't be showing tracebacks if we can show a meaningful error.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

