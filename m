Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RFnAl-000706-NU for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 15:24:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RFn50-0006zU-Rd for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 15:18:10 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 15:18:10 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 15:18:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Oct 2011 15:17:49 +0200
Message-ID: <j7h9tt$ehl$1@dough.gmane.org>
References: <cover.1318856759.git.otavio@ossystems.com.br>
	<914e717b651c0891badce01c1a6c5591457a2c1b.1318856759.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <914e717b651c0891badce01c1a6c5591457a2c1b.1318856759.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 1/1] digitemp: add 3.6.0 version
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
X-List-Received-Date: Mon, 17 Oct 2011 13:24:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-10-11 15:06, Otavio Salvador schreef:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb |   16
> ++++++++++++++++ 1 files changed, 16 insertions(+), 0 deletions(-) create
> mode 100644 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
> 
> diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
> b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb new file mode
> 100644 index 0000000..7d89e9b --- /dev/null +++
> b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb @@ -0,0 +1,16 @@ 
> +DESCRIPTION = "read temperature sensors in a 1-Wire net" +SECTION =
> "util" +PRIORITY = "optional"

PRIORITY isn't used anymore

> +DEPENDS = "libusb"

libusb 0.x or libusb 1.x?

> +LICENSE = "GPL-2"

GPLv2?

> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0" +PR = "r0"

As stated before, PR is going away so I will not accept patches adding
default values when in some weeks from now we'll need to remove them all.

> + +SRC_URI =
> "http://www.digitemp.com/software/linux/digitemp-3.6.0.tar.gz"

use ${PV} in the uri?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOnCr9MkyGM64RGpERAnAyAKCmYywmNETYv/V630l2e7vD1jY5IgCbBIKR
gHwLixIRe8MFM40O+T5l3rs=
=Yc9q
-----END PGP SIGNATURE-----



