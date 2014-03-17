Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0056A6EE3B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:59:33 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WPTOO-00005l-LR for openembedded-devel@lists.openembedded.org;
	Mon, 17 Mar 2014 09:59:32 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:59:32 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:59:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Mar 2014 10:01:26 +0100
Message-ID: <lg6dgr$5h8$1@ger.gmane.org>
References: <1395014647-18396-1-git-send-email-stephen.arnold42@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <1395014647-18396-1-git-send-email-stephen.arnold42@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH v2 1/1] recipes-graphics/lxdm: add missing automake file, update build config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2014 08:59:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stephen Arnold schreef op 17-03-14 01:04:
> From: "Stephen Arnold" <stephen.arnold42@gmail.com>
> 
> PATCH recipes-graphics/lxdm:
> 
> - add missing depends and inherit pkgconfig for autogen/configure -
> silence confgure warnings and update configure options - provide missing
> input file for automake
> 
> Built and tested on master branches using meta-raspberrypi and
> meta-alt-destop-extras.
> 
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> 
> --- meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 13 +++++++++++-- 1 file
> changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb index c12eddf..6ef014f
> 100644 --- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb +++
> b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb @@ -16,18 +16,27 @@ SRCREV =
> "07fb151a99ef99318b71f3de0afbba977b1e6267" PV = "0.5.0+git${SRCPV}" PE =
> "1"
> 
> -DEPENDS = "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb
> pango" +DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf
> glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes" DEPENDS +=
> "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
> 
> # combine oe-core way with angstrom DISTRO_TYPE DISTRO_TYPE ?=
> "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
> 
> -inherit autotools gettext systemd +inherit autotools pkgconfig gettext
> systemd
> 
> S = "${WORKDIR}/git"
> 
> +CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset
> -fno-builtin-strstr "

Why is this needed?

> + +EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x
> -with-xconn=xcb" EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES',
> 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/
> --disable-consolekit', '--without-systemdsystemunitdir', d)}"

Please merge those 2 into a single EXTRA_OECONF

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTJrnmMkyGM64RGpERAjj6AKCjLjwuMeDHNZEY22fPsNKnf9ZijQCgl0Gj
RVZBFHTR0QsI2gXGzLy8+lg=
=rUX5
-----END PGP SIGNATURE-----


