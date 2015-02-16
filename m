Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 11E1665C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 14:49:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 16 Feb 2015 06:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,588,1418112000"; d="scan'208";a="667064696"
Received: from mmettala-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.7.57])
	by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2015 06:49:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 16 Feb 2015 14:49:52 +0000
Message-ID: <2038539.DSZyTHnFY3@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.5-101.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAP9ODKpWO7wbutYpZBwRh-TPoNhGjCPnun_gJ4SnQaDAPjwCAQ@mail.gmail.com>
References: <54DF0A5A.80700@pseudoterminal.org>
	<2529087.slZT0YBCqg@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKpWO7wbutYpZBwRh-TPoNhGjCPnun_gJ4SnQaDAPjwCAQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Question about RDEPENDS and RRECOMMENDS
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
X-List-Received-Date: Mon, 16 Feb 2015 14:49:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 16 February 2015 10:42:56 Otavio Salvador wrote:
> On Mon, Feb 16, 2015 at 9:12 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Sunday 15 February 2015 19:34:28 Otavio Salvador wrote:
> >> On Sat, Feb 14, 2015 at 6:42 AM, Carlos Rafael Giani
> >> <dv@pseudoterminal.org> wrote:
> >> ...
> >> 
> >> > So, it would make sense to establish some sort of dependency. But how
> >> > 
> >> > exactly? I thought of something like this:
> >> >   RDEPENDS_gstreamer1.0-plugins-imx-imxaudio =
> >> > 
> >> > "gstreamer1.0-plugins-good-audioparsers"
> >> > 
> >> >   RDEPENDS_gstreamer1.0-plugins-imx-imxvpu =
> >> > 
> >> > "gstreamer1.0-plugins-bad-videoparsersbad"
> >> > 
> >> > but then I also need to add gstreamer1.0-plugins-good and
> >> > gstreamer1.0-plugins-bad to the DEPENDS list, otherwise I get a warning
> >> > 
> >> > like:
> >> >   QA Issue: gstreamer1.0-plugins-imx-imxaudio rdepends on
> >> > 
> >> > gstreamer1.0-plugins-good-audioparsers, but it isn't a build
> >> > dependency?
> >> > [build-deps]
> >> > 
> >> > But if I add these recipes to the DEPENDS variable, then the RDEPENDS
> >> > spec
> >> > is pointless, isn't it?
> >>
> >>...
> >>
> >> Just for completeness, the QA issue about missing build-dependency is
> >> something we should pay attention to but it may be a false positive as
> >> in your cause you don't depends on them for building, just runtime. So
> >> you can whitelist the warning to avoid the noise but adding the
> >> depends would be wrong.
> > 
> > The QA warning message could perhaps be worded more accurately - what it
> > means is there in an implicit runtime dependency and there is no RDEPENDS
> > (not DEPENDS) explicitly telling the system to ensure that that
> > dependency is satisfied. Whitelisting is never the proper way to fix this
> > warning - either add an explicit RDEPENDS, or use configuration to ensure
> > that the implicit dependency isn't needed.
> 
> From my understand, which Carlos can confirm, what he did was adding
> the package on the rdepends. Once this was done the QA warnings shows
> up which is wrong.
> 
> This can be seen at 'sed' recipe:
> 
> ---
> SUMMARY = "Stream EDitor (text filtering utility)"
> ...
> RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
> ---
> 
> In my system, with ptest enabled, I see:
> 
> WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
> isn't a build dependency? [build-deps]
> 
> and this is clearly a false positive as this uses this locale at
> runtime for a test. Not necessarily it needs to have a DEPENDS on it
> which would imply it would need to be available in sysroot before sed
> configure could start.
> 
> What I think is missing is that the 'build-deps' check would need to
> whitelist the dependencies which come from a /explict/ package added
> in a RDEPENDS. What do you think?

If you look at the code in insane.bbclass, what it actually does is compare 
the task dependencies to what is in RDEPENDS; in theory what is not reflected 
in the task dependencies should only be those dependencies that were added 
dynamically at packaging time. You would have to investigate why an explicit 
RDEPENDS on locale-base-ru-ru doesn't get translated to a task dependency (or 
more likely, why this code thinks that it isn't). That is where any fix for 
this issue needs to be done.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

