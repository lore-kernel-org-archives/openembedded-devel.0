Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rq7s6-0005cM-AU
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 19:47:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2012 10:39:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100509572"
Received: from unknown (HELO helios.localnet) ([10.252.122.164])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2012 10:39:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 18:39:12 +0000
Message-ID: <1609637.uEWkOuPr02@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <CAMKF1spT9TgXmqQq-D+r1jnoXuv_+koPs_Rr=VhVzZkro5V1Bw@mail.gmail.com>
References: <1592899.mTy93uB97i@helios>
	<CAMKF1spT9TgXmqQq-D+r1jnoXuv_+koPs_Rr=VhVzZkro5V1Bw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 18:47:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 January 2012 09:49:14 Khem Raj wrote:
> meta-oe was started to fill in gaps that oe-core would have for
> existing oe users  since oe-core will not have all required functionality
> and so distros could migrate to using oe-core and not loose the bells and
> whistles they already have.

Sure, that's totally reasonable. I think we've built up some experience in the 
time we've had so far that we can apply in order to improve the structure a 
little though.

> Plus its an umbrella layer which has many layers underneath.

To save confusion, I speak only of the meta-oe layer within the meta-
openembedded repository. The meta-openembedded repository itself is not a 
layer of any kind, only the directories within it are. (I really wish we had 
chosen an entirely distinct name for the repository, but I guess that ship has 
sailed.)

> However the problems it sees right now are that there are pieces which
> could be considered distro specific and ones, the new untested recipes should
> not be an issue if they are pinned properly. 

So there ought not to be too much distro-specific in meta-oe; obviously there 
is some at the moment due to the small number of distros actively using it.

Unfortunately this pinning (I assume you mean PREFERRED_VERSION_) can only 
really occur within a distro that already includes meta-oe, and then you need 
to buy into the rest of the policy that that distro provides. If you are 
starting only from OE-Core or your distro does not typically include meta-oe, 
it will have no such pinning.

> recipes that move our of oe-core I agree should be hosted in
> a meta-deprecated or somesuch
>
> I am happy to move out toolchain bits as well into a separate layer
> under meta-openembedded umbrella
> that will clarify it a bit and should not be a big hassle.

Sounds great!

> I think real issue people suffer from is 2 and the duplicate recipes
> in meta-oe which has different configuration
> in oe-core.

I agree these do need to be well-justified, and should avoid being just 
manifestations of distro policy. These are gradually being ironed out where 
appropriate, we just need to continue with this process.

> So meta-oe meta-toolchain meta-deprecated could be created now we need
> to find maintainer for these layers.

It might be a bit presumptuous but I would nominate you for the toolchain 
layer ;) since you more or less maintain the recipes that would go in it 
already. (I guess meta-toolchain probably isn't the best name since that 
already means something in OE.)

As for the other layers I would be happy to assist Koen in maintaining them if 
he would like, but I think he's been doing a fine job with meta-oe already.

> All said if it was possible to handpick versions from layers and use
> bitbake -g output pn-depends.dot
> to generate some manifest so indicate which recipe is being picked
> from a set of recipes from different layers would be helpful.
> since there always will be some duplicate recipes no matter what.

The bitbake-layers tool is supposed to help at least with the reporting side 
of this, and it does report where bbappends exist and recipes have been 
overlayed. Right now however it does not report anything if a recipe is 
overlayed but the version number is different; I'm looking into fixing that at 
the moment. BTW I'd appreciate feedback on bitbake-layers as I've not had a 
lot since it was extended - feature requests welcome.

As an aside, we also still have to consider Richard's proposal for version-
independent bbappends (i.e. using % as a wildcard in the file name). I don't 
think anyone responded to that yet.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


