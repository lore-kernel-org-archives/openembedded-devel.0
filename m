Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S9cFf-000288-EI for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 14:03:55 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S9c77-0004l9-EK for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 13:55:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 13:55:05 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 13:55:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Mar 2012 13:54:21 +0100
Message-ID: <jk7aa6$bjh$1@dough.gmane.org>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe 1/6] mpd: initial add 0.16.7
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
X-List-Received-Date: Mon, 19 Mar 2012 13:03:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-03-12 21:40, Andreas Müller schreef:
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
> meta-oe/recipes-multimedia/musicpd/mpd/mpd       |   43 +++ 
> meta-oe/recipes-multimedia/musicpd/mpd/mpd.conf  |  420
> ++++++++++++++++++++++ meta-oe/recipes-multimedia/musicpd/mpd_0.16.7.bb |
> 42 +++ 3 files changed, 505 insertions(+), 0 deletions(-) create mode
> 100644 meta-oe/recipes-multimedia/musicpd/mpd/mpd create mode 100644
> meta-oe/recipes-multimedia/musicpd/mpd/mpd.conf create mode 100644
> meta-oe/recipes-multimedia/musicpd/mpd_0.16.7.bb
> 
> diff --git a/meta-oe/recipes-multimedia/musicpd/mpd/mpd
> b/meta-oe/recipes-multimedia/musicpd/mpd/mpd new file mode 100644 index
> 0000000..f71142a --- /dev/null +++
> b/meta-oe/recipes-multimedia/musicpd/mpd/mpd @@ -0,0 +1,43 @@ +#!/bin/sh 
> +DESC="The Music Player Daemon" +DAEMON=/usr/bin/mpd 
> +MPDCONF=/etc/mpd.conf

The above hardcodes $bindir and $sysconfdir, which it shouldn't do.
Furthermore I'd like to stop maintaining our own initsystem in meta-oe and
switch to upstream initscripts as much as possible and include systemd units
by default as well.
The above script is missing LSB headers as well.

> diff --git a/meta-oe/recipes-multimedia/musicpd/mpd_0.16.7.bb
> b/meta-oe/recipes-multimedia/musicpd/mpd_0.16.7.bb new file mode 100644 
> index 0000000..bc07415 --- /dev/null +++
> b/meta-oe/recipes-multimedia/musicpd/mpd_0.16.7.bb @@ -0,0 +1,42 @@ 
> +DESCRIPTION = "Music Player Daemon" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM
> = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" +HOMEPAGE
> ="http://sourceforge.net/projects/musicpd" + +DEPENDS = "alsa-lib
> libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite
> bzip2 \ +           ${@base_conditional('ENTERPRISE_DISTRO', '1', '',
> 'libmad lame libid3tag', d)}" + +SRC_URI = " \ +
> ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \ +
> file://mpd \ +    file://mpd.conf \ +" + +SRC_URI[md5sum] =
> "3d0e7c36646e80386b32966bd4268e8d" +SRC_URI[sha256sum] =
> "47c10553389752c7fa072cf87c2bd30c552de75819fcf8286f3e7cc14ff0e32e" + 
> +inherit autotools update-rc.d useradd + +USERADD_PACKAGES = "${PN}" 
> +USERADD_PARAM_${PN} = " \ +    --system --no-create-home \ +    --home
> ${localstatedir}/lib/mpd \ +    --groups audio \ +    --user-group mpd" 
> + +INITSCRIPT_NAME = "mpd" +INITSCRIPT_PARAMS = "defaults 95" + 
> +do_install_append() { +    install -d ${D}/${sysconfdir}/init.d +
> install -m 755 ${WORKDIR}/mpd ${D}/${sysconfdir}/init.d +    install -m
> 644 ${WORKDIR}/mpd.conf ${D}/${sysconfdir}/mpd.conf + +    install -d
> ${D}/${localstatedir}/lib/mpd/music +    chown -R mpd
> ${D}/${localstatedir}/lib/mpd +    chmod 775
> ${D}/${localstatedir}/lib/mpd/music + +    install -d
> ${D}/${localstatedir}/lib/mpd/playlists +} + +EXTRA_OECONF =
> "enable_bzip2=yes"

Move EXTRA_OECONF above do_install

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9nLH0ACgkQMkyGM64RGpGpXgCfYjVyTXG604Idt2RF2RhqwN/a
5oYAoKvt1joz6oRquBIauc4zeLpbNCFn
=9Ewh
-----END PGP SIGNATURE-----



