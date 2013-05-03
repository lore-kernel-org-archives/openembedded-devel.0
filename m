Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UYHM7-0005aD-2f
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 16:53:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2013 07:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,605,1363158000"; d="scan'208";a="331007338"
Received: from unknown (HELO helios.localnet) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2013 07:35:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 03 May 2013 15:35:04 +0100
Message-ID: <12323341.7tMrSLVFbj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAP71WjxM+5h436zjUYUAAvO3awMOiyqS1Wo62ibTGQZEmPRiEQ@mail.gmail.com>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP71Wjw0rs0-WA=c4a92zsXCkrea8P7+CsbBdCU7HDd20MWCsQ@mail.gmail.com>
	<CAP71WjxM+5h436zjUYUAAvO3awMOiyqS1Wo62ibTGQZEmPRiEQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Fri, 03 May 2013 14:53:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 03 May 2013 16:00:13 Nicolas Dechesne wrote:
> On Mon, Apr 29, 2013 at 8:40 AM, Nicolas Dechesne
> 
> <nicolas.dechesne@linaro.org> wrote:
> > On Sat, Apr 27, 2013 at 1:13 PM, Paul Eggleton
> > 
> > <paul.eggleton@linux.intel.com> wrote:
> >>> > On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
> >>> >> And do you really need a .inc?
> >>> > 
> >>> > Are we removing inc files if they were present in OE Classic? First
> >>> > I've
> >>> > heard if we are...
> >>> 
> >>> If we are trying to reduce the number of versions of recipes we carry,
> >>> dropping .inc files would seem to be a good idea. I don't have strong
> >>> feelings, but it seems like something we should consider.
> >> 
> >> I agree we should try to keep only one version of each recipe in software
> >> layers, however I figure it makes it easier for people to carry their own
> >> versions of recipes in distro layers (particularly older, which may be
> >> required in certain circumstances) if we do keep inc files where they
> >> already exist.
> > 
> > I put the .inc in this patch, indeed because it was there in OE
> > Classic. I can update the patch if there is a consensus to remove the
> > .inc.
> > 
> > also for the INC_PR, I added it, because I thought it makes sense for
> > .bb with .inc to have that. again, i can update the patch if you
> > recommend doing this way.
> 
> hi, can you please let me know what I should do here? i can update the
> patch if needed, but not sure there is a clear consensus on what to
> do!

IMO, let's keep the separate inc file, but drop PR and INC_PR.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


