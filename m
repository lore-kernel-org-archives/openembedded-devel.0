Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UYHHR-0004mB-CX
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 16:48:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 May 2013 07:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,604,1363158000"; d="scan'208";a="236404633"
Received: from unknown (HELO helios.localnet) ([10.255.12.224])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2013 07:30:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 03 May 2013 15:30:13 +0100
Message-ID: <2308920.kogFCty2Gp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<1756231.MGNYtfpC2x@helios>
	<576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 03 May 2013 14:48:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 03 May 2013 16:10:40 Koen Kooi wrote:
> Op 27 apr. 2013, om 13:13 heeft Paul Eggleton 
<paul.eggleton@linux.intel.com> het volgende geschreven:
> > On Saturday 27 April 2013 06:34:46 Philip Balister wrote:
> >> On 04/27/2013 04:24 AM, Paul Eggleton wrote:
> >>> On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
> >>>> And do you really need a .inc?
> >>> 
> >>> Are we removing inc files if they were present in OE Classic? First I've
> >>> heard if we are...
> >> 
> >> If we are trying to reduce the number of versions of recipes we carry,
> >> dropping .inc files would seem to be a good idea. I don't have strong
> >> feelings, but it seems like something we should consider.
> > 
> > I agree we should try to keep only one version of each recipe in software
> > layers, however I figure it makes it easier for people to carry their own
> > versions of recipes in distro layers (particularly older, which may be
> > required in certain circumstances) if we do keep inc files where they
> > already exist.
> 
> Can people raise their hand if they want to have a different version of
> smartmontools in their layer?

Even assuming everyone who could possibly want this is reading this thread, 
which is unlikely, in the absence of time machines you won't hear from anyone 
who doesn't need it now but does in the future. 

As a general rule, people do often want to build versions of recipes from SCM 
repositories and having an inc file makes that a bit easier. If we already have 
the inc file split I can't see a compelling reason to drop it.

I would also point out that we were asked to preserve these in the original 
move to OE-Core and as far as I am aware we have done so.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


