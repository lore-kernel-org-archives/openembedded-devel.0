Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDi3T-0001iE-6h for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 21:31:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDhxy-0005FO-AV for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 21:26:18 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 21:26:18 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 21:26:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 11 Oct 2011 21:26:02 +0200
Message-ID: <j7258a$tts$1@dough.gmane.org>
References: <201110110048.58769.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <201110110048.58769.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe] bitbake udev fails at parse ( util-linux-blkid missing )
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
X-List-Received-Date: Tue, 11 Oct 2011 19:31:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-10-11 00:48, Andreas Müller schreef:
> Hi
> 
> with latest pulls I get after pseudo pre run:
> 
> OE Build Configuration: BB_VERSION        = "1.13.3" TARGET_ARCH       =
> "arm" TARGET_OS         = "linux-gnueabi" MACHINE           = "overo" 
> DISTRO            = "angstrom" DISTRO_VERSION    = "v2011.10-core" 
> TUNE_FEATURES     = "armv7a vfp neon cortexa8" TARGET_FPU        =
> "vfp-neon" meta-angstrom     =
> "master:4f06c3f0376e0704210a2e61005748f168369d07" meta-oe meta-efl
>  meta-gpe meta-gnome meta-xfce         =
> "master:9278fe715d5eebd16af1a2d20a92255744913dbb" meta-texasinstruments =
> "master:7a45605f91536519a53e6f18dedee5f1f62d88e0" meta-efikamx      =
> "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0" meta-nslu2        =
> "master:9080394ae0a040dd7b05ac49f9480e4d71631b55" meta-htc meta-nokia
>  meta-openmoko meta-palm         =
> "master:7d12d5c09a5303952c2ffa22aa2f0274025f9fc2" meta-sugarbay 
> meta-crownbay meta-emenlow meta-fishriver meta-jasperforest meta-n450
> = "master:e0e52850cf5f84fb4ee1bfa15571aaf61e068450" meta              =
> "master:4732222c46652951e66aae377631f4a361179d8f" meta-freescale    =
> "master:8716233e1c13e8c49096c4606f836275ee22009a" meta-gumstix      =
> "master:d721d7815c7f4706401f4cef9c1f0a535e056d08"
> 
> NOTE: Resolving any missing task queue dependencies ERROR: Nothing
> RPROVIDES 'util-linux-blkid' (but
> /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-core/udev/udev_173.bb
> RDEPENDS on or otherwise requires it) NOTE: Runtime target
> 'util-linux-blkid' is unbuildable, removing... Missing or unbuildable
> dependency chain was: ['util-linux-blkid'] ERROR: Required build target
> 'udev' has no buildable providers. Missing or unbuildable dependency
> chain was: ['udev', 'util-linux-blkid']
> 
> Could somebody take care please?

RP expedited the oe-core patch after I explained how I screwed up by pushing
the dependant patch to meta-oe first.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlJhKMkyGM64RGpERAkugAJ4iBJdGwysd5ifU0KBkfmAkqgn4mACglKkH
hEwk9hwHHB+7xQY5KQssee8=
=3CRP
-----END PGP SIGNATURE-----



