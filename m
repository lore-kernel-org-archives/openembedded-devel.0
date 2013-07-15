Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B1B5261663
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 15:37:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2013 08:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="370556503"
Received: from unknown (HELO helios.localnet) ([10.252.122.64])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2013 08:36:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 15 Jul 2013 16:36:36 +0100
Message-ID: <5498122.1xgS5ZiCM9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAP9ODKp3=Lf7C710t8AeC+o9jA46oQFEokUiHuSW+L4W-uJFJA@mail.gmail.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
	<20130715123759.GB3842@windriver.com>
	<CAP9ODKp3=Lf7C710t8AeC+o9jA46oQFEokUiHuSW+L4W-uJFJA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] Add mosh and dependencies
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
X-List-Received-Date: Mon, 15 Jul 2013 15:37:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 July 2013 12:02:59 Otavio Salvador wrote:
> On Mon, Jul 15, 2013 at 9:37 AM, Joe MacDonald
> 
> <Joe.MacDonald@windriver.com> wrote:
> > [[oe] [meta-oe][PATCH 0/3] Add mosh and dependencies] On 13.07.13 (Sat 
15:47) Paul Eggleton wrote:
> >> Add a recipe for mosh, and for dependencies migrate libio-pty-perl from
> >> OE-Classic and bring in protobuf from meta-virtualization.
> >> 
> >> I considered putting this in meta-networking, however meta-virtualization
> >> will still need protobuf and it already depends on meta-oe, and
> >> officially meta-networking does not depend on meta-oe so splitting these
> >> would not really work with the current layer dependencies.
> > 
> > That's not strictly true anymore, actually.  It was my intent and I
> > think there's value in it, but CRDA (already in meta-networking) depends
> > on python-m2crypto (in meta-oe).  I discovered it in my world build a
> > few weeks ago and hadn't yet managed to get round to seeing if there was
> > a clean way to separate the two.
> > 
> > I absolutely don't want the stated intent that meta-networking be
> > standalone be a barrier to adding packages to it that clearly belong to
> > it.
> > 
> > That's my way of saying I've no objection right now to including this in
> > meta-net.
> 
> I agree; maybe we could add those inside meta-oe subdir? so people can
> opt in enable them or not.

Sorry Otavio, what are you suggesting exactly?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

