Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QllEC-0001mF-G1
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 19:15:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2011 10:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,269,1309762800"; d="scan'208";a="32200695"
Received: from unknown (HELO helios.localnet) ([10.255.17.235])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2011 10:11:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Jul 2011 18:11:16 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
	<1310919171.4288.19.camel@mattotaupa>
In-Reply-To: <1310919171.4288.19.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201107261811.16319.paul.eggleton@linux.intel.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: Populating meta-oe with new patches on oe.dev
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
X-List-Received-Date: Tue, 26 Jul 2011 17:15:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Sunday 17 July 2011 17:12:51 Paul Menzel wrote:
> unfortunately as someone not having followed the creation of oe-core and
> meta-oe, I fill somewhat lost. Is there a comprehensive document
> somewhere as Russell also asked for?

I've just written one here:

 http://www.openembedded.org/index.php/OpenEmbedded-Core

May not be complete but I think it covers most things.
 
> 1. Compared to former oe.dev activity looking at meta-oe there are only
> a handful of people doing contributions and a lot of recipes are
> missing. I have the feeling that a lot of developers where left out in
> the process of creating the new infrastructure and I do not know if they
> just develop their private branches based on oe.dev or if they use
> meta-oe and I have not noticed this.

So, the meta-oe repository consists of meta-oe layer plus a few other more 
clearly defined layers (meta-gnome, meta-efl etc.) The meta-oe layer exists to 
provide a place for recipes that don't necessarily belong in OE-core but are 
required by multiple other metadata layers, so we avoid duplication. I would 
hope that many recipes that are around well-defined themes would be in their 
own layers rather than the meta-oe layer itself (e.g. all EFL recipes go in 
meta-efl). There's definitely work to be done in bringing over recipes to the 
new ecosystem, sure, but that will come in time. Are there specific pieces you 
are missing?

You're right in that there aren't many people contributing to meta-oe (and the 
other layers within the meta-oe repository) at the moment; I think that's 
because most existing developers have been content to stay using OE-dev or 
their own private branches thereof as they have done for a long time. Perhaps 
we could have done a better job of promoting OE-core within the wider OE 
community, but that's probably because we all had our heads down trying to get 
things into shape :) I think we're now reaching the point where people should 
be able to make the switch to OE-core and not hit too many issues, other than 
the lack of some recipes (and the latter is not too difficult to remedy).

> 2. Looking at the weekly changelogs sent to the lists I see a lot of
> duplicated commits in each layer. Why is that needed? Is not that a
> design problem of the layers?

If you mean the duplication between bitbake & oe-core and "meta-yocto" (which 
really isn't just the meta-yocto layer, it's the whole of Poky), that's the 
result of the tool Cliff uses to do the reports which doesn't have a way to 
restrict itself to a subdirectory of a repository. I hope that's something 
Cliff can address at some point in the future.

> 3. I find the `recipe-*section*/` directories difficult to handle to
> finding a recipe. Before I would use `recipe/` and then tab completion
> and now I have to search for it. Are others uncomfortable with this?

I'm used to it now but it did feel a bit strange to begin with. I think 
Richard's idea was to avoid too many levels of directories; he can perhaps 
comment further.
 
> 4. What images are available in/for oe-core/meta-openembedded? I liked
> for example `minimal{,-uclibc}`? `find . -name minimal*` in `oe-core` or
> `meta-oe` did not give any result. Not to mention the images for
> BeagleBoard or `micro-image` for the recently sent patches for payload
> creation for coreboot

OE-core provides a number of images, but the main ones are core-image-minimal 
and core-image-sato. Other layers add their own images as appropriate, e.g. 
meta-angstrom provides systemd-gnome-image.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


