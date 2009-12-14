Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NKD5o-0005nh-6C
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 16:44:15 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NKD47-0006Vs-EY for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 10:42:27 -0500
Date: Mon, 14 Dec 2009 10:42:07 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091214102214.GM3601@jama>
Message-ID: <alpine.LFD.2.00.0912141041310.29685@localhost>
References: <alpine.LFD.2.00.0912140512120.21693@localhost>
	<20091214102214.GM3601@jama>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: test build just finished, three failed package builds
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
X-List-Received-Date: Mon, 14 Dec 2009 15:44:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Dec 2009, Martin Jansa wrote:

> On Mon, Dec 14, 2009 at 05:13:32AM -0500, Robert P. J. Day wrote:
> >
> >   just this minute, my latest build attempt for beagle demo image off
> > of dev branch produced:
> >
> > ERROR: '/home/rpjday/oe/openembedded/recipes/mesa/mesa-dri_7.0.3.bb' failed
> We probably need those patches from DJWillis
> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=e6f17d1cc03bdd90c575b7e2bd482932e53ba9c0
> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=60b64bead81643e5c97c29abc4574c66398b3ebb
> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=f8b4d26e7cfe06bfc8474df50035b886045a0324
> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=de272c2db0e37b72bfa55268a2e383c906ee0680
> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=commit;h=63144b3bb0e035d3f8109fb907bb018694f2a9f0
>
> Or I can set PREFERRED_PROVIDER_virtual/libgl to "mesa" instead of
> "mesa-dri" in compatibility_providers.conf or maybe it should be set on
> distro/machine level.

  if someone pushes some patches for the current build fails on
fedora, mention that here and i'll be happy to pull and retest the dev
branch.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


