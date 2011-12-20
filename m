Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rczdl-0002Rj-Cn for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 14:21:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RczWw-0001Gg-Q5 for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 14:14:54 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 14:14:54 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 14:14:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 Dec 2011 14:14:46 +0100
Message-ID: <jcq1o2$phe$1@dough.gmane.org>
References: <1324378880-6009-1-git-send-email-sylvain.pare@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324378880-6009-1-git-send-email-sylvain.pare@gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH v3][meta-oe] vlc: rework dependencies
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
X-List-Received-Date: Tue, 20 Dec 2011 13:21:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-12-11 12:01, Sylvain 'GarthPS' Paré schreef:
> * re-adds dropped depends as they are available now * adds libxpm as
> dependency as current vlc's config depends on it. * bumps PR * NOTE about
> ENTERPRISE_DISTRO : is that supposed to be still used or should this be
> replaced by something which respects COMMERCIAL_LICENSE setting ?

ENTERPRISE_DISTRO tries to guard against these things:

1) patent problems (e.g. GPLv3 patent clause)
2) 'security' (e.g. GPLv3 Tivo clause)
3) royalties for codecs (e.g. MPEG-LA)

Sometimes you get big parts of 3 included in the silicon price,so I'm not
sure how usefull it is to put only MPEG-LA things in ENTERPRISE_DISTRO,
maybe we need a different variable for that.

regards,

Koen

> 
> Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com> --- 
> meta-oe/recipes-multimedia/vlc/vlc.inc       |    5 ++--- 
> meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb |    2 ++ 2 files changed, 4
> insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc
> b/meta-oe/recipes-multimedia/vlc/vlc.inc index aecfb3a..7353f90 100644 
> --- a/meta-oe/recipes-multimedia/vlc/vlc.inc +++
> b/meta-oe/recipes-multimedia/vlc/vlc.inc @@ -3,9 +3,8 @@ HOMEPAGE =
> "http://www.videolan.org" LICENSE = "GPLv2" SECTION = "multimedia"
> 
> -DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl
> qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \ -" -#
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
> liba52 mpeg2dec', d)}" +DEPENDS = "libfribidi libtool libgcrypt
> gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor
> faad2 ffmpeg flac libxpm \ +
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
> liba52 mpeg2dec', d)}"
> 
> SRC_URI =
> "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
> 
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
> b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb index fb69e05..9f53159
> 100644 --- a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb +++
> b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb @@ -5,6 +5,8 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
> 
> require vlc.inc
> 
> +PR = "r1" + # work around build failure EXTRA_OECONF += "
> --enable-libxml2=no"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7wikIACgkQMkyGM64RGpGs2wCgjvwnSaMyqYyPvVfX729PhKFl
EQUAoI1GgigRW8YbPItLcG0irfcQLGpU
=eiUh
-----END PGP SIGNATURE-----



