Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UNSqo-0003jP-6v for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 20:56:02 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UNSaa-0003s7-DC for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 20:39:16 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 20:39:16 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 20:39:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Apr 2013 20:38:44 +0200
Message-ID: <kjhsve$nqm$1@ger.gmane.org>
References: <515C5DE6.6040702@pseudoterminal.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <515C5DE6.6040702@pseudoterminal.org>
X-Enigmail-Version: 1.5
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 18:56:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-04-13 18:50, Carlos Rafael Giani schreef:
> Hello,
> 
> I have created a BSP layer for the SolidRun Cubox platform. Informations
> about this device can be found athttp://solid-run.com/cubox  . The layer
> itself is hosted athttps://github.com/dv1/meta-cubox  .

So how is this different from https://github.com/naguirre/meta-cubox ?

> 
> This layer introduces a new machine, new tunes for the CuBox' Marvell
> PJ4 processor, in addition to the platform specific recipes for hardware
> video acceleration and EGL,OpenGL ES,OpenVG support. Both hardfp and
> softfp are supported. The 3D accelerator and the hardware accelerated
> video engine (called vMeta) require some closed source components. The
> recipes pick the right ones depending on whether softpfp or hardfp is
> used.
> 
> It also copies the generated uImage into the rootfs (as expected by the 
> bootloader), and autogenerates a boot.scr out of an included boot script
> using uboot-mkimage. The resulting tarball is extracted on an SD card,
> and the device can be booted.
> 
> A new xorg driver and a customized xorg.conf are included.
> 
> I'm open to feedback, patches, suggestions.

Just like https://github.com/naguirre/meta-cubox you're mixing DISTRO policy
in the machine files by setting the tuning to hardfloat. Don't do that. If
you want hardfloat, set that in your distro config, not in your machine config.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRXHc0MkyGM64RGpERAmezAJwPD4r3W/6qY5wnDCY2xh6hQTGGDQCeK5sL
h33NDHBAlEs2TyV+B6ajj5I=
=F+fa
-----END PGP SIGNATURE-----



