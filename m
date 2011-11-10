Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RObRC-0007q5-Hi for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 21:41:30 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RObL4-0002OB-NU for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 21:35:10 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 21:35:10 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 21:35:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Nov 2011 21:27:01 +0100
Message-ID: <j9hc2l$b8u$3@dough.gmane.org>
References: <4EBC2FEF.5020405@kernelconcepts.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <4EBC2FEF.5020405@kernelconcepts.de>
X-Enigmail-Version: 1.3.2
Subject: Re: RFC: Clean up omap3.inc
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
X-List-Received-Date: Thu, 10 Nov 2011 20:41:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-11-11 21:11, Florian Boor schreef:
> Hi all,
> 
> omap3.inc currently contains this line:
> 
> EXTRA_IMAGEDEPENDS += "u-boot x-load"
> 
> This makes it hard to build for an OMAP3 based machine without providing
> a x-load configuration for it.

Wrong. You can do the following in your machine.conf:

require omap3.inc

EXTRA_IMAGEDEPENDS = "whatever"

to reset it.

> Actually I do not think hardcoding a particular bootloader for a class of
> SoC is a good idea at all. The selection whether a bootloader needs to be
> build and which one to select should be a matter of the machine
> configuration.
> 
> Could we please get rid of this and fix the board descriptions?

In OE classic, no. In meta-ti the cleanup is already underway.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOvDOVMkyGM64RGpERAunKAKC7udUOfCyn4wLKlPYg5/kMJPSNEgCgqgp9
lFTgVwMfsUQuNuC6mI8VZrg=
=ndzI
-----END PGP SIGNATURE-----



