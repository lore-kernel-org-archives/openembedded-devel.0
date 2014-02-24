Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93FEC6E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:43:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 09:39:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="461326749"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2014 09:43:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2014 17:43:33 +0000
Message-ID: <2343897.GsqDN18PkL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <12554563.r7d5IAgdqr@leo>
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
	<33174762.dysyrZqJd4@peggleto-mobl5.ger.corp.intel.com>
	<12554563.r7d5IAgdqr@leo>
MIME-Version: 1.0
Cc: Tobias Blom <tobias@blom.org>, openembedded-devel@lists.openembedded.org
Subject: Re: python-netifaces in oe?
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
X-List-Received-Date: Mon, 24 Feb 2014 17:43:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 24 February 2014 09:41:45 Khem Raj wrote:
> On Monday, February 24, 2014 12:19:07 PM Paul Eggleton wrote:
> > On Sunday 23 February 2014 22:26:34 Khem Raj wrote:
> > > On Feb 23, 2014, at 10:23 PM, Lukas Bulwahn
> > > <lukas.bulwahn@oss.bmw-carit.de>> > 
> > > wrote:
> > > > We provide a recipe for python-netifaces in the meta-ros layer as
> > > > well. In
> > > > fact, a quick search on the OpenEmbedded Layer Index [1] reveals that
> > > > meta-ros and meta-openstack both provide a recipe for
> > > > python-netifaces.
> > > > With your use case and recipe, we would have now three recipes. So, I
> > > > suggest to unify all three recipes and come up with the best
> > > > (complete)
> > > > recipe from these three versions and add them to the meta-oe layer. We
> > > > then can remove the duplicate recipes in the application layers.
> > > 
> > > If these layers have dependency on meta-oe then please add the recipe
> > > there
> > > and remove from other places.
> > 
> > There has been some discussion about creating a meta-python layer (within
> > the meta-openembedded repository) for these kinds of recipes. I think the
> > time has come to actually do that, before we add any further python
> > recipes to the general meta-oe layer. Could someone send a patch to
> > create meta-python?
>
> meta-python is good. I always worry about layer being maintained, in fact I
> have some python 3 extra recipes that I wanted to contribute which dont
> belong to core.

Agreed, continued maintenance is important. I would be happy to be co-
maintainer of this if someone else will help me out...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

