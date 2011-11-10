Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROQ4z-0000hz-3J for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 09:33:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROPyw-0003X2-8E for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 09:27:34 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 09:27:34 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 09:27:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Nov 2011 09:27:20 +0100
Message-ID: <j9g1t8$4f8$1@dough.gmane.org>
References: <cover.1320860740.git.Martin.Jansa@gmail.com>
	<31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe 1/4] mplayer-common: import from OE-classic
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
X-List-Received-Date: Thu, 10 Nov 2011 08:33:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-11-11 18:47, Martin Jansa schreef:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> * commit b28081b6039db85f18bf9e722fece59bff6e7b0f
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> .../recipes-multimedia/mplayer/mplayer-common.bb   |   22
> ++++++++++++++++++++ .../mplayer/mplayer-common/mplayer.conf            |
> 15 +++++++++++++ 2 files changed, 37 insertions(+), 0 deletions(-) create
> mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb create
> mode 100644
> meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
> b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb new file mode
> 100644 index 0000000..889bb95 --- /dev/null +++
> b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb @@ -0,0 +1,22 @@ 
> +# Copyright Matthias Hentges <devel@hentges.net> (c) 2006 +# License:
> MIT (see COPYING.MIT) + +DESCRIPTION = "Preconfigured mplayer
> preferences" + +LICENSE = "MIT" +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> 
+
> +PV = "0.0.1" + +SRC_URI = "file://mplayer.conf" + +# Yes, really
> /usr/etc!!! +do_install() { +	install -d "${D}/usr${sysconfdir}/mplayer" 
> + +	install -m 0644 ${WORKDIR}/mplayer.conf
> "${D}/usr${sysconfdir}/mplayer" +} + +FILES_${PN} =
> "/usr${sysconfdir}/mplayer" + +inherit allarch diff --git
> a/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
> b/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf new file
> mode 100644 index 0000000..92aeb15 --- /dev/null +++
> b/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf @@ -0,0
> +1,15 @@ + +# You probably shouldn't touch these +ac=mad, +ao=oss,

Are those still needed? On armv6 and up the builtin ffmpeg decoder is faster
than mad and who is using non-alsa emulated oss nowadays?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOu4roMkyGM64RGpERApONAJ0cAehUkELZSbomF2h1y92Pv40P0wCgpWd1
1nkJwVaKO6lYpmSRFXOiOzU=
=72y+
-----END PGP SIGNATURE-----



