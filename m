Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 03C94606E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 11:12:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 16 Feb 2015 03:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,587,1418112000"; d="scan'208";a="678590296"
Received: from mmettala-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.7.57])
	by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2015 03:12:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 16 Feb 2015 11:12:24 +0000
Message-ID: <2529087.slZT0YBCqg@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.5-101.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAP9ODKpqBjbbSam7+p0cvYKQUwyAsa9tK24DTo+-=uGofJs9cQ@mail.gmail.com>
References: <54DF0A5A.80700@pseudoterminal.org>
	<CAP9ODKpqBjbbSam7+p0cvYKQUwyAsa9tK24DTo+-=uGofJs9cQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Feb 2015 11:12:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 15 February 2015 19:34:28 Otavio Salvador wrote:
> On Sat, Feb 14, 2015 at 6:42 AM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
> ...
> > So, it would make sense to establish some sort of dependency. But how
> > 
> > exactly? I thought of something like this:
> >   RDEPENDS_gstreamer1.0-plugins-imx-imxaudio =
> > 
> > "gstreamer1.0-plugins-good-audioparsers"
> > 
> >   RDEPENDS_gstreamer1.0-plugins-imx-imxvpu =
> > 
> > "gstreamer1.0-plugins-bad-videoparsersbad"
> > 
> > but then I also need to add gstreamer1.0-plugins-good and
> > gstreamer1.0-plugins-bad to the DEPENDS list, otherwise I get a warning
> > 
> > like:
> >   QA Issue: gstreamer1.0-plugins-imx-imxaudio rdepends on
> > 
> > gstreamer1.0-plugins-good-audioparsers, but it isn't a build dependency?
> > [build-deps]
> > 
> > But if I add these recipes to the DEPENDS variable, then the RDEPENDS spec
> > is pointless, isn't it?
>...
>
> Just for completeness, the QA issue about missing build-dependency is
> something we should pay attention to but it may be a false positive as
> in your cause you don't depends on them for building, just runtime. So
> you can whitelist the warning to avoid the noise but adding the
> depends would be wrong.

The QA warning message could perhaps be worded more accurately - what it means 
is there in an implicit runtime dependency and there is no RDEPENDS (not 
DEPENDS) explicitly telling the system to ensure that that dependency is 
satisfied. Whitelisting is never the proper way to fix this warning - either add 
an explicit RDEPENDS, or use configuration to ensure that the implicit 
dependency isn't needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

