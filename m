Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1URjVC-0003ih-GN
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 15:31:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2013 06:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,476,1363158000"; d="scan'208";a="319287224"
Received: from unknown (HELO helios.localnet) ([10.255.13.245])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2013 06:13:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Mon, 15 Apr 2013 14:13:51 +0100
Message-ID: <85380742.XfAzseB4Gc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130415124259.GI3914@windriver.com>
References: <20130413134648.GE2477@jama> <kkelis$rj6$1@ger.gmane.org>
	<20130415124259.GI3914@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] recipes: Unify indentation
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
X-List-Received-Date: Mon, 15 Apr 2013 13:31:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 April 2013 08:42:59 Joe MacDonald wrote:
> [Re: [oe] [meta-oe][PATCH] recipes: Unify indentation] On 13.04.14 (Sun 
18:30) Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Op 14-04-13 00:12, Martin Jansa schreef:
> > > * This change is only aesthetic (unlike indentation in Python tasks). *
> > > Some recipes were using tabs. * Some were using 8 spaces. * Some were
> > > using mix or different number of spaces. * Make them consistently use 4
> > > spaces everywhere. * Yocto styleguide advises to use tabs (but the only
> > > reason to keep tabs is the need to update a lot of recipes). Lately this
> > > advice was also merged into the styleguide on the OE wiki. * Using 4
> > > spaces in both types of tasks is better because it's less error prone
> > > when someone is not sure if e.g. do_generate_toolchain_file() is Python
> > > or shell task and also allows to highlight every tab used in .bb, .inc,
> > > .bbappend, .bbclass as potentially bad (shouldn't be used for indenting
> > > of multiline variable assignments and cannot be used for Python tasks).
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > 
> > I still hate spaces for shell methods, but I support the reasons behind
> > it, so:
> > 
> > Acked-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> I completely agree.  The only spot where I see this as being not optimal
> is something like this (hunk simplified for clarity):
> 
>  PACKAGES += "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
> -            ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
> -             ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
> +    ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
> +    ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
> 
> The former state wasn't great, but in general if I'm doing this type of
> thing, I'll tend to align them thus:
> 
> PACKAGES += "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
>              ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
>              ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
> 
> Probably leaving such things as they are in the tree is more trouble
> than it's worth, but we could, I'd like to avoid restyling after a line
> continuation.  I won't object to the proposal as it stands, though,
> since on the whole it looks to be doing much more good than harm.

It has always been considered best practice to indent multi-line variables in 
the latter way with spaces only - however this is separate from the 
indentation being used within scripts.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


