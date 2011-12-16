Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbVOh-0004Vq-9A for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:52:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbVHu-0000KD-Lo for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:45:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 11:45:14 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 11:45:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 11:41:36 +0100
Message-ID: <jcf790$99u$2@dough.gmane.org>
References: <1324028520-16474-1-git-send-email-b19537@freescale.com>
	<1324028520-16474-6-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324028520-16474-6-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe v2 6/8] strongswan: add
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
X-List-Received-Date: Fri, 16 Dec 2011 10:52:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 10:41, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> strongSwan is an OpenSource IPsec implementation for the Linux operating
> system.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> .../recipes-support/strongswan/strongswan_4.5.1.bb |   21
> ++++++++++++++++++++ 1 files changed, 21 insertions(+), 0 deletions(-) 
> create mode 100644
> meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
> 
> diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
> b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb new file mode
> 100644 index 0000000..9c5e736 --- /dev/null +++
> b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb @@ -0,0 +1,21
> @@ +DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for
> the \ +Linux operating system." +HOMEPAGE = "http://www.strongswan.org" 
> +SECTION = "console/network" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3" + +SRC_URI =
> "http://download.strongswan.org/strongswan-${PV}.tar.bz2" 
> +SRC_URI[md5sum] = "81a4a699c4a1a49b74061dfa47b5a033" +SRC_URI[sha256sum]
> = "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2b008bcec0d1e758a" + 
> +EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \ +
> --enable-gmp --disable-mysql --disable-sqlite \ +		--enable-openssl" + 
> +inherit autotools + +DEPENDS = "gmp openssl flex-native flex
> bison-native"

Normal DEPENDS go at the top :) Same for the rng-tools recipe. The general
idea is that 'recipe' variable go on top and other variables are ordered
next to the tasks they are used in, e.g. RDEPENDS are for do_packages, so
they go below do_install, DEPENDS are for the recipe, so they go on top.

> +RRECOMMENDS_${PN} = "kernel-module-ipsec" + +FILES_${PN}-dbg +=
> "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7rIGAACgkQMkyGM64RGpHudwCgu3FhI+64lWnp7q6gzK1itDW3
2TYAn0lXYwRxN5vKcrErNyF4jZO8adfy
=Zmzb
-----END PGP SIGNATURE-----



