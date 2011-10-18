Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RG54o-0000If-2j for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 10:31:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RG4zC-00059L-DQ for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 10:25:22 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 10:25:22 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 10:25:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Oct 2011 10:25:08 +0200
Message-ID: <j7jd54$gnc$1@dough.gmane.org>
References: <4E9C975D.60709@telia.com> <4E9D3547.4050809@telia.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <4E9D3547.4050809@telia.com>
X-Enigmail-Version: 1.3.2
Subject: Re: Building multiple u-boot binaries in oe-core?
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
X-List-Received-Date: Tue, 18 Oct 2011 08:31:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-10-11 10:13, Ulf Samuelsson schreef:
> I added the functionality for building multiple u-boot binaries to 
> classic openembedded, but this has not been implemented in oe-core. I
> find that rather useful. Anyone disagreeing?
> 
> The core of this is:
> 
> do_compile () { if ! [ "x${UBOOT_MACHINES}" == "x" ] ; then for board in
> ${UBOOT_MACHINES} ; do if ! [ `grep ${board}_config Makefile | wc -c` ==
> 0 ] ; then mkdir -p binaries/${board} oe_runmake O=binaries/${board}
> distclean oe_runmake O=binaries/${board} ${board}_config oe_runmake
> O=binaries/${board} all fi done else oe_runmake ${UBOOT_MACHINE} 
> oe_runmake all fi }
> 
> Note that I removed the _config part from UBOOT_MACHINES.
> 
> At the moment, the binary after youv'e done "make beagleboard_config;
> make" will be called: u-boot-beagleboard_config-${PV}-${PR}.bin
> 
> I think "u-boot-beagleboard-${PV}-${PR}.bin" is nicer.
> 
> There aren't that many boards in oe-core at the moment.

4 qemu machine to be exact

> Isn't this a good time to get rid of UBOOT_MACHINE altogher and/or
> redefine it without the "_config"

Not sure, there are a *lot* of BSPs out there where _config is expected to
be there.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOnTfkMkyGM64RGpERAhgKAJ934JngAAMd33iLVGrYVKYKJ7Am8ACfaxKL
GdSJOI5qgK2eFk7OwHwD3eU=
=62Sb
-----END PGP SIGNATURE-----



