Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RciAe-0003eK-JT for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 19:42:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rci3r-0006K0-KY for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 19:35:43 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 19:35:43 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 19:35:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Dec 2011 19:35:27 +0100
Message-ID: <jco05e$tt9$1@dough.gmane.org>
References: <1324312094-24426-1-git-send-email-sylvain.pare@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324312094-24426-1-git-send-email-sylvain.pare@gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [[meta-oe]] vlc: re-add dropped depends as they are available now and add libxpm as dependency as current vlc's config depends on it.
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
X-List-Received-Date: Mon, 19 Dec 2011 18:42:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-12-11 17:28, Sylvain 'GarthPS' Paré schreef:
> Signed-off-by: Sylvain 'GarthPS' Paré <sylvain.pare@gmail.com> --- 
> meta-oe/recipes-multimedia/vlc/vlc.inc |    5 ++--- 1 files changed, 2
> insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc
> b/meta-oe/recipes-multimedia/vlc/vlc.inc index aecfb3a..375e42e 100644 
> --- a/meta-oe/recipes-multimedia/vlc/vlc.inc +++
> b/meta-oe/recipes-multimedia/vlc/vlc.inc @@ -4,8 +4,7 @@ LICENSE =
> "GPLv2" SECTION = "multimedia"
> 
> DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl
> qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \ -" -#
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
> liba52 mpeg2dec', d)}" +
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
> liba52 mpeg2dec', d)}"
> 
> SRC_URI =
> "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
> 
> @@ -13,7 +12,7 @@ inherit autotools gettext
> 
> ARM_INSTRUCTION_SET = "arm"
> 
> -DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1" +DEPENDS +=
> "libdvdcss libdvdread lua5.1-native lua5.1 libxpm"
> 
> LEAD_SONAME = "libvlc.so.5"
> 

Missing PR bump
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7vg+8ACgkQMkyGM64RGpFwmACgsufoFQDWp5Z6G+WUzWBeY8Yo
Z9EAn0JPLjlqRnmiFcH/mGy40iU+JyjR
=I5gy
-----END PGP SIGNATURE-----



