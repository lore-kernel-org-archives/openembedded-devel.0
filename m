Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 12F8177AA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 21:52:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 24 Apr 2017 14:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,246,1488873600"; d="scan'208";a="1123041949"
Received: from kwchow-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.137.138])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2017 14:52:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 25 Apr 2017 09:52:41 +1200
Message-ID: <3626986.nl6OIIeHPX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAHUNapRLYpv4xS=tzsJrL4r5GCMWzKr3NVDwmwgffec8XDyXZQ@mail.gmail.com>
References: <CAHUNapRLYpv4xS=tzsJrL4r5GCMWzKr3NVDwmwgffec8XDyXZQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: more info in layerindex Was: Full Python3 Installation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Apr 2017 21:52:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 25 April 2017 4:12:25 AM NZST Trevor Woerner wrote:
> On Wed, Apr 12, 2017 at 2:53 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > Regarding the layer index, we don't actually index packages or anything on
> > the runtime side, since you would have to actually run a build to get
> > full information there, and it can easily change depending on
> > configuration. It's possible we may add that in future but we'd have to
> > ensure everyone understood those limitations that mean that the
> > information might not directly match what they see when they do a build
> > locally.
> 
> As for knowing what files will go where I can see that you could only
> really know that once a recipe is built (since the FILES_..._${PN}
> allows wildcards). But as for the list of packages created by a
> recipe, isn't that deterministic from looking at the (full) recipe
> information (including inherits etc)?

For some recipes, yes, but there are a few types of exceptions:

1) Empty packages - we don't know for sure if a package will be empty, if it 
is then the package won't be produced

2) Module/plugin packages such as for the kernel - these are dynamic based on 
configuration and not easy to introspect

3) Packages added / removed due to PACKAGECONFIG / DISTRO_FEATURES / 
architecture etc. Also hard to introspect.

> Also, would having the layerindex list PACKAGECONFIG options per
> recipe be possible?

I think we could do that yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

