Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 57D4F6F823
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:14:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 13 Mar 2014 04:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="491176425"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.214])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2014 04:14:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Mar 2014 11:14:36 +0000
Message-ID: <4829465.mJ9OgDPCCk@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <F1A43237-A560-4EC6-A29B-699952F92F6B@dominion.thruhere.net>
References: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
	<23248607.unOJTkLeyP@peggleto-mobl5.ger.corp.intel.com>
	<F1A43237-A560-4EC6-A29B-699952F92F6B@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Correct versioning of unversioned source in git
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
X-List-Received-Date: Thu, 13 Mar 2014 11:14:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 13 March 2014 12:09:21 Koen Kooi wrote:
> Op 13 mrt. 2014, om 11:45 heeft Paul Eggleton 
<paul.eggleton@linux.intel.com> het volgende geschreven:
> > On Thursday 13 March 2014 10:59:38 Koen Kooi wrote:
> >> Tomas Novotny schreef op 13-03-14 10:08:
> >>> there is a recipe sunxi-board-fex in meta-sunxi layer. That recipe
> >>> fetches sources from unversioned git which contains definitions of some
> >>> boards (in fact it is something like a store). I'm not sure with correct
> >>> versioning in OE. Is that: PV = "1.0+git${SRCPV}" SRCREV =
> >>> "<some_gitrev_I_want>" correct? Will be change of SRCREV (only) catched
> >>> by build system (I'm curious how OE handles age of the rev in git)? Or
> >>> do
> >>> I need to raise PV to 1.1 and so on with every change to SRCREV?
> >> 
> >> The answer changes if you have more than one buildhost. If you have only
> >> one buildhost and don't care about other people rebuilding the exact
> >> same versions, 1.0+git${SRCPV} will work.
> >> 
> >> If you have more than one buildhost and/or care about other people
> >> rebuilding the exact same, you'll need to increase PR (or PV) everytime
> >> SRCREV changes. That will still cause some discrepancies if someone
> >> rebuilds after >1 SRCREV change, but upgrade paths should work when
> >> increasing PV (not with PR!).
> > 
> > Why not with PR?
> 
> because SRCPV in in PV, not PR

Right, but if you're using the PR server, that also stores the incrementing 
number at the start of SRCPV; PR may also increment when SRCREV changes as 
well (not sure on the latter). The PR server ought to be used if you care 
about this sort of thing.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

