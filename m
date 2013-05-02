Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXqvZ-0006gS-91
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 12:39:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 May 2013 03:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,595,1363158000"; d="scan'208";a="327608947"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 02 May 2013 03:21:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 May 2013 11:21:57 +0100
Message-ID: <1515263.cqA6k5LnsF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130401153135.GJ10672@windriver.com>
References: <1364484753-22122-1-git-send-email-koen@dominion.thruhere.net>
	<20130328215943.GA6608@novatech.datenfreihafen.org>
	<20130401153135.GJ10672@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <Joe.MacDonald@windriver.com>
Subject: Re: [meta-networking][PATCH] 6lowpan-tools: add git version
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
X-List-Received-Date: Thu, 02 May 2013 10:39:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 April 2013 11:31:35 Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] 6lowpan-tools: add git version] On 
13.03.28 (Thu 21:59) Stefan Schmidt wrote:
> > On Thu, 2013-03-28 at 16:32, Koen Kooi wrote:
> > > The 0.3 release was 6 months ago and git HEAD contains fixes to make it
> > > work with contiki, so build from git instead of backporting all the
> > > patches.> 
> > Sounds like a good idea. And not only because one of the patches is
> > from me ;)
> > 
> > > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > > ---
> > > 
> > >  .../recipes-support/6lowpan/6lowpan-tools_git.bb     | 20
> > >  ++++++++++++++++++++ 1 file changed, 20 insertions(+)
> > >  create mode 100644
> > >  meta-networking/recipes-support/6lowpan/6lowpan-tools_git.bb> 
> > Any special reason why this is named 6lowpan here?
> > 
> > 6lowpan normally refers to IPv6 over LoWPAN while the lowpan-tools
> > do not configure anything regarding IPv6 but the plain LoWPAN which is
> > the protocol layer below. I would suggest renaming it to lowpan-tools.
> 
> I've not used these myself.  Based on what I saw on the project web
> page, 6lowpan seems like a pretty good name:
> 
>    The goal of this project is to create an implementation of 802.15.4
>    and several protocols which run on top of it (primarily 6LoWPAN) for
>    Linux.
> 
> But a quick look around in my apt-cache turns up lowpan-tools.  Seems
> like that's what it's also named in Fedora land, so I'm thinking that's
> probably the right call here, too.

lowpan-tools was the name we had in OE-Classic as well.

Koen, would you mind renaming this and sending a v2? Could you also use SRCPV 
in PV and add SUMMARY and HOMEPAGE at the same time?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


