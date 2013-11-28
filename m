Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 029B26D88C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 10:59:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2013 02:59:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,790,1378882800"; d="scan'208";a="416447257"
Received: from unknown (HELO helios.localnet) ([10.252.122.17])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2013 02:58:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 28 Nov 2013 10:58:46 +0000
Message-ID: <1825979.KGUos5WM3r@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <l77732$ggi$1@ger.gmane.org>
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>
	<14902072.IG3b8o4YqW@helios> <l77732$ggi$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Thu, 28 Nov 2013 10:59:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 28 November 2013 11:49:18 Koen Kooi wrote:
> Paul Eggleton schreef op 28-11-13 11:32:
> > Hi Koen / Felipe,
> > 
> > On Thursday 28 November 2013 10:22:31 Koen Kooi wrote:
> >> Felipe F. Tonello schreef op 28-11-13 01:56:
> >>> From: "Felipe F. Tonello" <eu@felipetonello.com> This recipe supports
> >>> the backend for packagekit dynamically based on the IMAGE_PKGTYPE.
> >> 
> >> NAK! IMAGE_FEATURES should *never* change non-image recipe params.
> >> This breaks using feeds horribly.
> > 
> > IMAGE_PKGTYPE is influenced by PACKAGE_CLASSES; so this is not about
> > IMAGE_FEATURES, and correct me if I'm wrong but maintaining package feeds
> > 
> >  would generally preclude switching to an alternative package manager,
> > 
> > right?
> 
> No, it's perfectly possible to build both opkg and rpm, which is what I'm
> currently doing. When doing that the DISTRO.conf does need to make a
> decision on what to support for things like packagekit.
> 
> > Some options:
> > 
> > 1) Apply the patch as-is. Changing the order/value of PACKAGE_CLASSES
> > will mean this and anything that depends upon it will rebuild.
> > 
> > 2) Install the appropriate backend via some code in the image recipe.
> > Obviously this means you have to do this for every image recipe though.
> > 
> > 3) Use non-dynamic PACKAGECONFIG. Of course this means you'll have to
> > remember to change this manually if you change PACKAGE_CLASSES or it'll
> > just be broken at runtime.
> > 
> > Honestly, option 1 sounds like the best course to me here. This is rather
> > a special case compared to other recipes.
> 
> 1) will let you end up with packagekit_1.0.ipk that only supports RPM

Correct, it would. I agree that's not ideal. Neither is having it broken by 
default for some people though (unless you just set all backends to on by 
default, that is.)

> 2) Is what we would really want, but I don't think packagekit supports that
> :(

This patch looks like it is splitting out the backends into separate 
packages...
 
> So that leaves 3, which makes it a clear DISTRO decision, like it should be.

It's worth pointing out that the patch sets PACKAGECONFIG with ??= so it 
doesn't stop you from doing this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

