Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJPR9-0001qN-6o
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 15:56:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2012 06:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="229442231"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2012 06:43:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 14:43:22 +0100
Message-ID: <5056040.jAUIlqh764@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <74B58CA1-2332-42D6-9652-4226D9484259@dominion.thruhere.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<1396458.ob1fernpZs@helios>
	<74B58CA1-2332-42D6-9652-4226D9484259@dominion.thruhere.net>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 13:56:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 15:12:55 Koen Kooi wrote:
> Op 3 okt. 2012, om 14:23 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> > On Wednesday 03 October 2012 13:43:30 Koen Kooi wrote:
> >> Op 3 okt. 2012, om 13:29 heeft Paul Eggleton
> >> <paul.eggleton@linux.intel.com>> 
> > het volgende geschreven:
> >>> On Wednesday 03 October 2012 13:27:41 Koen Kooi wrote:
> >>>> Op 3 okt. 2012 om 12:43 heeft Paul Eggleton
> >>>> <paul.eggleton@linux.intel.com>
> >>> 
> >>> het volgende geschreven:
> >>>>> On Wednesday 03 October 2012 12:24:19 Koen Kooi wrote:
> >>>>>> Squash those "import" with the "fix" commits, no sense in having a
> >>>>>> broken
> >>>>>> recipe in there.
> >>>>> 
> >>>>> I'd rather not - there is sense in being clear about the changes,
> >>>>> because
> >>>>> there are a large number of them in this case.
> >>>> 
> >>>> The broken recipes are still available in OE classic if people want to
> >>>> compare them. I still don't get why you want to have broken recipes in
> >>>> the
> >>>> tree at multiple points in your series.
> >>> 
> >>> Because I want to easily see in "git blame" where particular lines came
> >>> from - did I add them, or have they been around for ages?
> >> 
> >> Does oe-core have the same flow for new recipes?
> > 
> > You already know the answer to this.
> 
> No I don't, actually.

The answer is no, it doesn't.

I guess on reflection we probably ought to be consistent here though - for 
better or worse, this is not what has been done when pulling in recipes from 
OE-Classic for the rest of meta-openembedded. The commit message does already 
list the changes from the original, and I'll concede that having just one 
revision doesn't give a huge amount in the way of insight on previous origin; 
ultimately as you say, OE-Classic is still there as a reference for that.

OK, I've squashed those commits out on the branch. Would it be worth me 
posting a v2 after all these changes?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


