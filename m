Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtEnN-00013G-Sj for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 10:14:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtEir-0007aT-Bj for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 10:10:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 10:10:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 10:10:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Aug 2011 10:07:17 +0200
Message-ID: <j2d8fl$5qf$3@dough.gmane.org>
References: <1313436905.4058.47.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1313436905.4058.47.camel@mattotaupa>
X-Enigmail-Version: 1.2
Subject: Re: Coordination for updating the XBMC recipe
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
X-List-Received-Date: Tue, 16 Aug 2011 08:14:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-08-11 21:35, Paul Menzel schreef:
> Dear OE folks and especially Koen,
> 
> 
> Scott Davilla from the XBMC project asked me for build instructions for XBMC for the PandaBoard.
> 
> Currently the XBMC recipe does not build for the PandaBoard
> 
> COMPATIBLE_MACHINE = "omap3|ti816x"
> 
> and 'virtual/egl' is not available for `MACHINE = "omap4430-panda"` in oe.dev. Additionally the recipe is quite outdated.
> 
> This is a good occasion to update and clean up the current XBMC recipes.
> 
> I have some patches locally and I build test the latest commits for `MACHINE = "beagleboard"` unfortunately still for oe.dev. On LinuxTag you told me that you also had some patches but they conflicted with my pushed commits.
> 
> So what is the best way to go forward? Did you already do some work on this so that no wheel is reinvented? Please publish your patches somewhere. That would be awesome.
> 
> Without knowing your answer I propose the following.
> 
> 1. I try to clean up my patches and push them right to oe.dev? (I could also publish a tree on Gitorious where I am already registered.)

OE .dev is a dead end, no use working there

> Unfortunately I am only able to build test XBMC as I do not have a setup BeagleBoard or PandaBoard currently and no time to set them up.
> 
> 2. Not having used meta-oe/oe-core it would be great if you could port those to meta-oe.

Importing the current recipe into meta-oe and working on it there would be a better idea.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOSiU1MkyGM64RGpERAtQBAJ48KoKoh7nft3HvUoSs8V7XIQA3zQCfWwPR
GMDIt8xZIIeH1HSDnxeY8Rs=
=UlFH
-----END PGP SIGNATURE-----



