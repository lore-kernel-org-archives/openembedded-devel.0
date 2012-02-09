Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RvUiB-00045o-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 15:10:59 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2012 06:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105669556"
Received: from unknown (HELO helios.localnet) ([10.252.123.13])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2012 06:02:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Henning Heinold <heinold@inf.fu-berlin.de>
Date: Thu, 09 Feb 2012 14:02:51 +0000
Message-ID: <11868044.ITA0Lum9As@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <4F33BF11.4010009@opendreambox.org>
References: <4F2A97B7.2080709@opendreambox.org>
	<4F331951.2010701@opendreambox.org>
	<4F33BF11.4010009@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] giflib: don't link against libx11, don't depend on libsm
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
X-List-Received-Date: Thu, 09 Feb 2012 14:10:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 February 2012 13:41:53 Andreas Oberritter wrote:
> On 09.02.2012 01:54, Andreas Oberritter wrote:
> > On 08.02.2012 20:48, Otavio Salvador wrote:
> >> On Wed, Feb 8, 2012 at 17:35, Andreas Oberritter 
<obi@opendreambox.org>wrote:
> >>> I already explained in the commit message, why a PR bump is not needed.
> >>> Can you please explain which other possible failures you're expecting,
> >>> so I can learn why my reasoning may be wrong?
> >>> 
> >>> This patch only fixes an unavailable build dependency at bitbake level,
> >>> nothing more.
> >> 
> >> Can the user call:
> >> 
> >> bitbake libsm
> >> 
> >> and then build giflib? in case of positive, we need to enforce have or
> >> not
> >> it linked.
> > 
> > At the time I created the patch, the user couldn't run bitbake libsm
> > (for the same reason that it wouldn't be built automatically through
> > giflib's DEPENDS).
> > 
> > That said, I updated the repos after your mail and ran bitbake libsm in
> > order to get the error message again, but the error vanished.
> > Apparently, an indirect dependency on libx11 was dropped during the last
> > few weeks. I searched the logs, but didn't find the change. Strange.
> > Now, many x11 packages got built even though x11 still wasn't listed in
> > my DISTRO_FEATURES.
> > 
> > Anyway, please consider this patch obsolete. I'll probably resend an
> > updated version together with other patches to disable some more x11
> > libraries on demand.
> 
> I did some further research regarding giflib:
> 
> - giflib doesn't depend on libSM alone, but optionally depends on
> libX11. When linked against libX11, it also links agains libSM and
> libICE, under certain conditions. Since libSM does not depend on
> libX11, the current giflib build is non-deterministic.
> 
> - Debian's/Ubuntu's giflib gets configured with --disable-x11
> unconditionally.
> 
> So we have two options:
> 
> 1.) Pass --disable-x11 unconditionally like Debian/Ubuntu
> 2.) Add virtual/libx11 to DEPENDS, if x11 is defined in
> DISTRO_FEATURES, and add --enable/diable-x11 to EXTRA_OECONF
> 
> Because the current recipe didn't depend on libX11 and no one
> complained about it, I question the usefulness of linking giflib
> against x11. Therefore I vote for option 1 (see patch below).
> 
> What does giflib do if linked against libX11?
> - It builds a tool called gif2x11
> - DumpScreen2Gif() gains support for dumping X11 windows

I'd agree with disabling it as well. According to google it was Henning who 
added libsm as a dependency in OE-Classic. Henning, do you remember the reason 
for adding this, and is it still valid?

Cheers,
Paul

[resend due to incorrect email address]

-- 

Paul Eggleton
Intel Open Source Technology Centre


