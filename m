Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UYHTI-0006hx-1n
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 17:00:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2013 07:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,605,1363158000"; d="scan'208";a="236408260"
Received: from unknown (HELO helios.localnet) ([10.255.12.224])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2013 07:42:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 03 May 2013 15:42:30 +0100
Message-ID: <2863767.6XU4RXlosl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAP71WjwFFivLQ1NaMtudjCZyv1D_Xtodf5utigWPACAg=OA5dw@mail.gmail.com>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<576F47F5-73BA-4369-9A2E-666939097E0A@dominion.thruhere.net>
	<CAP71WjwFFivLQ1NaMtudjCZyv1D_Xtodf5utigWPACAg=OA5dw@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 May 2013 15:00:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 03 May 2013 16:30:17 Nicolas Dechesne wrote:
> On Fri, May 3, 2013 at 4:10 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:
> > > I agree we should try to keep only one version of each recipe in
> > > software
> > > layers, however I figure it makes it easier for people to carry their
> > > own
> > > versions of recipes in distro layers (particularly older, which may be
> > > required in certain circumstances) if we do keep inc files where they
> > > already exist.
>
> > Can people raise their hand if they want to have a different version of
> > smartmontools in their layer?
> 
> i think it would be nice to have a policy for that. i am going to send a
> couple of recipes for new components, and it would be good to know what's
> the agreed 'policy' for .inc file. 

We probably should have a stated policy, yes. AFAIK the current perhaps 
unstated policy is to keep the inc file if it existed in OE-Classic.

> in fact, it's not even clear to me why
> have .inc file is easier to carry different version in distro layers. well
> it's just a 'large' recipe to carry over..

If you carry over the whole recipe rather than "require recipes-
xyz/foo/foo.inc", then you won't get any improvements to the non-version-
specific parts of the recipe when the base layer updates in the future.

Alternatively if you "require recipes-xyz/foo/foo_6.5.bb" because there is no 
.inc, then your recipe will definitely break the next time the recipe in the 
base layer is upgraded, plus you may have to override more parts of the recipe 
that are specific to a different version than the one you are building.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


