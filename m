Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUnUe-0005Bb-6o
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 22:42:08 +0100
Received: by pzk27 with SMTP id 27so1023237pzk.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 13:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6mg69UAAriuKBFXDO1cz0vVcbY/fJBCrptgUa1qqYbc=;
	b=cM+ZUkJK7nSL96jZUJtsqrAb9gHmFORmTYEJrffox+wroKQwNz6uhMvysox5IH6Sm8
	D1qPQ/q2clNJPQaljxVUX1hZiLi/ZhWelZe3SNBatN4ZDEU29w2z1laTJqOVOYkNdjdf
	FfEj7LTshLJxTss1jjEUB32+C18yd7UQFYjyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Nep/1GSQEo3cJu4zA4eki27LMYjdstmKd3AgtBgmoEDzVstHOtjmj8+mIn7QaemYRk
	hapsCXYvK6H9UAKf6lutSQv+ZteemZzMIT7otpnbOnLtf9/5XskDH1811DZ/7UYYv6si
	wj3xn+KnJ3pQ5/F42LXRqDPiaMLI/3HqKgZ9Q=
Received: by 10.142.217.18 with SMTP id p18mr3869878wfg.128.1292881321158;
	Mon, 20 Dec 2010 13:42:01 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y42sm6430590wfd.22.2010.12.20.13.41.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 13:42:00 -0800 (PST)
Date: Mon, 20 Dec 2010 13:42:11 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220214211.GA17971@gmail.com>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Mon, 20 Dec 2010 21:42:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/10 14:48), Martin Jansa wrote:
> * X11R7.6-RC1 was already released
>   http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
>   so it's IMHO time to start migration there
> * preferred-xorg-versions-live.inc was tracking latest stable released
>   tarballs, but only reason I was maintaining it was to overwrite older
>   preferred-xorg-versions-X11R7.5.inc if your distribution included ie
>   X11R7.5.inc and you wanted live.inc from local.conf
> * default recipe versions without any preferred-xorg-versions include
>   are now the same as live.inc
> * we will get better test coverage if we use same versions
> * if someone really needs older release then pinning only core stuff
>   like xserver/libx11 will be probably better, than pinning every xorg
>   app/proto/font etc.
> * I can slow down adding newest xorg stuff or ie keep it everytime for
>   at least a week on ML for another review and test on more targets
>   (I'm testing it only on om-gta02/spitz/nokia900)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I have build x11-image successfully for arm/uclibc. Booting is stuck due to
other reasons.

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
>  .../include/angstrom-2010-preferred-versions.inc   |    1 -
>  .../preferred-xorg-versions-X11R7.5-latest.inc     |  126 ------
>  .../include/preferred-xorg-versions-X11R7.5.inc    |  286 -------------
>  .../include/preferred-xorg-versions-live.inc       |  450 --------------------
>  conf/distro/jlime-2010.1.conf                      |    1 -
>  conf/distro/metano.conf                            |    1 -
>  conf/distro/micro.conf                             |    5 -
>  conf/distro/minimal.conf                           |    1 -
>  .../bump.preferred-xorg-versions-7.5.sh            |    7 -
>  .../bump.preferred-xorg-versions-live.sh           |   25 --
>  10 files changed, 0 insertions(+), 903 deletions(-)
>  delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
>  delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>  delete mode 100644 conf/distro/include/preferred-xorg-versions-live.inc
> 
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index ba57ece..2fda88c 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -7,7 +7,6 @@ LIBTOOL_HAS_SYSROOT = "yes"
>  CE_VERSION ?= "latest"
>  
>  require conf/distro/include/angstrom-codec-engine-${CE_VERSION}-preferred-versions.inc
> -require conf/distro/include/preferred-xorg-versions-live.inc
>  
>  PREFERRED_VERSION_autoconf = "2.65"
>  PREFERRED_VERSION_autoconf-native = "2.65"
> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> deleted file mode 100644
> index 39cd4e6..0000000
> --- a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> +++ /dev/null
> @@ -1,126 +0,0 @@
> -#Fri Oct 30 10:44:28 CET 2009
> -#app
> -PREFERRED_VERSION_appres ?= "1.0.2"
> -PREFERRED_VERSION_beforelight ?= "1.0.3"
> -PREFERRED_VERSION_bitmap ?= "1.0.4"
> -PREFERRED_VERSION_constype ?= "1.0.2"
> -PREFERRED_VERSION_editres ?= "1.0.4"
> -PREFERRED_VERSION_fonttosfnt ?= "1.0.4"
> -PREFERRED_VERSION_fslsfonts ?= "1.0.2"
> -PREFERRED_VERSION_fstobdf ?= "1.0.3"
> -PREFERRED_VERSION_ico ?= "1.0.2"
> -PREFERRED_VERSION_lbxproxy ?= "1.0.2"
> -PREFERRED_VERSION_listres ?= "1.0.1"
> -PREFERRED_VERSION_mkcfm ?= "1.0.1"
> -PREFERRED_VERSION_mkcomposecache ?= "1.2.1"
> -PREFERRED_VERSION_oclock ?= "1.0.1"
> -PREFERRED_VERSION_proxymngr ?= "1.0.1"
> -PREFERRED_VERSION_rendercheck ?= "1.3"
> -PREFERRED_VERSION_rgb ?= "1.0.3"
> -PREFERRED_VERSION_rstart ?= "1.0.3"
> -PREFERRED_VERSION_scripts ?= "1.0.1"
> -PREFERRED_VERSION_showfont ?= "1.0.2"
> -PREFERRED_VERSION_twm ?= "1.0.4"
> -PREFERRED_VERSION_viewres ?= "1.0.1"
> -PREFERRED_VERSION_xbiff ?= "1.0.1"
> -PREFERRED_VERSION_xcalc ?= "1.0.2"
> -PREFERRED_VERSION_xclipboard ?= "1.1.0"
> -PREFERRED_VERSION_xclock ?= "1.0.4"
> -PREFERRED_VERSION_xcompmgr ?= "1.1.4"
> -PREFERRED_VERSION_xconsole ?= "1.0.3"
> -PREFERRED_VERSION_xdbedizzy ?= "1.0.2"
> -PREFERRED_VERSION_xditview ?= "1.0.1"
> -PREFERRED_VERSION_xdm ?= "1.1.9"
> -PREFERRED_VERSION_xedit ?= "1.1.2"
> -PREFERRED_VERSION_xeyes ?= "1.1.0"
> -PREFERRED_VERSION_xf86dga ?= "1.0.2"
> -PREFERRED_VERSION_xfd ?= "1.0.1"
> -PREFERRED_VERSION_xfindproxy ?= "1.0.1"
> -PREFERRED_VERSION_xfontsel ?= "1.0.2"
> -PREFERRED_VERSION_xfs ?= "1.1.0"
> -PREFERRED_VERSION_xfsinfo ?= "1.0.2"
> -PREFERRED_VERSION_xfwp ?= "1.0.1"
> -PREFERRED_VERSION_xgc ?= "1.0.1"
> -PREFERRED_VERSION_xinit ?= "1.1.1"
> -PREFERRED_VERSION_xkbprint ?= "1.0.1"
> -PREFERRED_VERSION_xload ?= "1.0.2"
> -PREFERRED_VERSION_xlogo ?= "1.0.1"
> -PREFERRED_VERSION_xlsfonts ?= "1.0.2"
> -PREFERRED_VERSION_xmag ?= "1.0.3"
> -PREFERRED_VERSION_xman ?= "1.1.0"
> -PREFERRED_VERSION_xmessage ?= "1.0.2"
> -PREFERRED_VERSION_xmh ?= "1.0.1"
> -PREFERRED_VERSION_xmore ?= "1.0.1"
> -PREFERRED_VERSION_xphelloworld ?= "1.0.1"
> -PREFERRED_VERSION_xplsprinters ?= "1.0.1"
> -PREFERRED_VERSION_xprehashprinterlist ?= "1.0.1"
> -PREFERRED_VERSION_xrx ?= "1.0.3"
> -PREFERRED_VERSION_xsetmode ?= "1.0.0"
> -PREFERRED_VERSION_xsetpointer ?= "1.0.1"
> -PREFERRED_VERSION_xsm ?= "1.0.1"
> -PREFERRED_VERSION_xstdcmap ?= "1.0.1"
> -PREFERRED_VERSION_xtrap ?= "1.0.2"
> -PREFERRED_VERSION_xvidtune ?= "1.0.1"
> -#data
> -PREFERRED_VERSION_xkbdata ?= "1.0.1"
> -#doc
> -#driver
> -PREFERRED_VERSION_xf86-input-calcomp ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-citron ?= "2.2.2"
> -PREFERRED_VERSION_xf86-input-digitaledge ?= "1.1.1"
> -PREFERRED_VERSION_xf86-input-dmc ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-dynapro ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-elo2300 ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-elographics ?= "1.2.3"
> -PREFERRED_VERSION_xf86-input-fpit ?= "1.3.0"
> -PREFERRED_VERSION_xf86-input-hyperpen ?= "1.3.0"
> -PREFERRED_VERSION_xf86-input-jamstudio ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-magellan ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-magictouch ?= "1.0.0.5"
> -PREFERRED_VERSION_xf86-input-microtouch ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-mutouch ?= "1.2.1+gitr%"
> -PREFERRED_VERSION_xf86-input-palmax ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-penmount ?= "1.4.0"
> -PREFERRED_VERSION_xf86-input-spaceorb ?= "1.1.1"
> -PREFERRED_VERSION_xf86-input-summa ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-tek4957 ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-ur98 ?= "1.1.0"
> -PREFERRED_VERSION_xf86-video-cyrix ?= "1.1.0"
> -PREFERRED_VERSION_xf86-video-i810 ?= "1.7.4"
> -PREFERRED_VERSION_xf86-video-impact ?= "0.2.0"
> -PREFERRED_VERSION_xf86-video-imstt ?= "1.1.0"
> -PREFERRED_VERSION_xf86-video-nsc ?= "2.8.3"
> -PREFERRED_VERSION_xf86-video-radeonhd ?= "1.3.0"
> -PREFERRED_VERSION_xf86-video-sunbw2 ?= "1.1.0"
> -PREFERRED_VERSION_xf86-video-vermilion ?= "1.0.1"
> -PREFERRED_VERSION_xf86-video-vga ?= "4.1.0"
> -PREFERRED_VERSION_xf86-video-via ?= "0.2.2"
> -#font
> -PREFERRED_VERSION_font-bitstream-speedo ?= "1.0.1"
> -#lib
> -PREFERRED_VERSION_libxtrap ?= "1.0.0"
> -PREFERRED_VERSION_libxevie ?= "1.0.2"
> -PREFERRED_VERSION_libxfontcache ?= "1.0.5"
> -PREFERRED_VERSION_libxp ?= "1.0.0"
> -PREFERRED_VERSION_libxprintapputil ?= "1.0.1"
> -PREFERRED_VERSION_libxprintutil ?= "1.0.1"
> -PREFERRED_VERSION_libxxf86misc ?= "1.0.2"
> -PREFERRED_VERSION_liblbxutil ?= "1.1.0"
> -PREFERRED_VERSION_liboldx ?= "1.0.1"
> -PREFERRED_VERSION_libxkbui ?= "1.0.2"
> -PREFERRED_VERSION_pixman ?= "0.18.4"
> -#proto
> -PREFERRED_VERSION_evieext ?= "1.1.0"
> -PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
> -PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
> -PREFERRED_VERSION_printproto ?= "1.0.4"
> -PREFERRED_VERSION_trapproto ?= "3.4.3"
> -PREFERRED_VERSION_xf86miscproto ?= "0.9.3"
> -PREFERRED_VERSION_xf86rushproto ?= "1.1.2"
> -PREFERRED_VERSION_xproxymanagementprotocol ?= "1.0.3"
> -#util
> -PREFERRED_VERSION_gccmakedep ?= "1.0.2"
> -PREFERRED_VERSION_imake ?= "1.0.2"
> -PREFERRED_VERSION_lndir ?= "1.0.2"
> -PREFERRED_VERSION_xorg-cf-files ?= "1.0.3"
> -#xserver
> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5.inc b/conf/distro/include/preferred-xorg-versions-X11R7.5.inc
> deleted file mode 100644
> index 997db27..0000000
> --- a/conf/distro/include/preferred-xorg-versions-X11R7.5.inc
> +++ /dev/null
> @@ -1,286 +0,0 @@
> -# see http://www.x.org/wiki/Releases/7.5
> -# 7.5 was released on 2009-10-26
> -
> -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> -
> -PREFERRED_PROVIDER_libxext ?= "libxext"
> -PREFERRED_PROVIDER_xext ?= "libxext"
> -PREFERRED_PROVIDER_libxi ?= "libxi"
> -PREFERRED_PROVIDER_libxft ?= "libxft"
> -PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
> -PREFERRED_PROVIDER_virtual/libx11-native ?= "libx11-native"
> -PREFERRED_PROVIDER_libxpm ?= "libxpm"
> -PREFERRED_PROVIDER_xpm ?= "libxpm"
> -PREFERRED_PROVIDER_libxt ?= "libxt"
> -PREFERRED_PROVIDER_libxaw ?= "libxaw"
> -PREFERRED_PROVIDER_libice ?= "libice"
> -PREFERRED_PROVIDER_libxrender ?= "libxrender"
> -PREFERRED_PROVIDER_libxcursor ?= "libxcursor"
> -PREFERRED_PROVIDER_xextensions ?= "xextensions"
> -PREFERRED_PROVIDER_xproto ?= "xproto"
> -PREFERRED_PROVIDER_x11 ?= "libx11"
> -PREFERRED_PROVIDER_libxv ?= "libxv"
> -PREFERRED_PROVIDER_xft ?= "libxft"
> -PREFERRED_PROVIDER_libxrandr ?= "libxrandr"
> -PREFERRED_PROVIDER_libxdamage ?= "libxdamage"
> -PREFERRED_PROVIDER_libxcomposite ?= "libxcomposite"
> -PREFERRED_PROVIDER_libxfixes ?= "libxfixes"
> -PREFERRED_PROVIDER_libxinerama ?= "libxinerama"
> -PREFERRED_PROVIDER_libxxf86vm ?= "libxxf86vm"
> -PREFERRED_PROVIDER_libxmu ?= "libxmu"
> -PREFERRED_PROVIDER_libsm ?= "libsm"
> -PREFERRED_PROVIDER_xrandr ?= "xrandr"
> -PREFERRED_PROVIDER_xserver ?= "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/xorg ?= "xserver-xorg"
> -
> -PREFERRED_VERSION_task-xorg ?= "X11R7.5"
> -
> -# app
> -PREFERRED_VERSION_bdftopcf ?= "1.0.2"
> -PREFERRED_VERSION_bdftopcf-native ?= "1.0.2"
> -PREFERRED_VERSION_iceauth ?= "1.0.3"
> -PREFERRED_VERSION_luit ?= "1.0.4"
> -PREFERRED_VERSION_mkfontdir ?= "1.0.5"
> -PREFERRED_VERSION_mkfontdir-native ?= "1.0.5"
> -PREFERRED_VERSION_mkfontscale ?= "1.0.7"
> -PREFERRED_VERSION_mkfontscale-native ?= "1.0.7"
> -PREFERRED_VERSION_sessreg ?= "1.0.5"
> -PREFERRED_VERSION_setxkbmap ?= "1.1.0"
> -PREFERRED_VERSION_smproxy ?= "1.0.3"
> -PREFERRED_VERSION_x11perf ?= "1.5.1"
> -PREFERRED_VERSION_xauth ?= "1.0.4"
> -PREFERRED_VERSION_xbacklight ?= "1.1.1"
> -PREFERRED_VERSION_xcmsdb ?= "1.0.2"
> -PREFERRED_VERSION_xcursorgen ?= "1.0.3"
> -PREFERRED_VERSION_xcursorgen-native ?= "1.0.3"
> -PREFERRED_VERSION_xdpyinfo ?= "1.1.0"
> -PREFERRED_VERSION_xdriinfo ?= "1.0.3"
> -PREFERRED_VERSION_xev ?= "1.0.4"
> -PREFERRED_VERSION_xgamma ?= "1.0.3"
> -PREFERRED_VERSION_xhost ?= "1.0.3"
> -PREFERRED_VERSION_xinput ?= "1.5.0"
> -PREFERRED_VERSION_xkbcomp ?= "1.1.1"
> -PREFERRED_VERSION_xkbcomp-native ?= "1.1.1"
> -PREFERRED_VERSION_xkbevd ?= "1.1.0"
> -PREFERRED_VERSION_xkbutils ?= "1.0.2"
> -PREFERRED_VERSION_xkill ?= "1.0.2"
> -PREFERRED_VERSION_xlsatoms ?= "1.0.2"
> -PREFERRED_VERSION_xlsclients ?= "1.0.2"
> -PREFERRED_VERSION_xmodmap ?= "1.0.4"
> -PREFERRED_VERSION_xpr ?= "1.0.3"
> -PREFERRED_VERSION_xprop ?= "1.1.0"
> -PREFERRED_VERSION_xrandr ?= "1.3.2"
> -PREFERRED_VERSION_xrdb ?= "1.0.6"
> -PREFERRED_VERSION_xrefresh ?= "1.0.3"
> -PREFERRED_VERSION_xset ?= "1.1.0"
> -PREFERRED_VERSION_xsetroot ?= "1.0.3"
> -PREFERRED_VERSION_xvinfo ?= "1.1.0"
> -PREFERRED_VERSION_xwd ?= "1.0.3"
> -PREFERRED_VERSION_xwininfo ?= "1.0.5"
> -PREFERRED_VERSION_xwud ?= "1.0.2"
> -
> -# data
> -PREFERRED_VERSION_xbitmaps ?= "1.1.0"
> -PREFERRED_VERSION_xcursor-themes ?= "1.0.2"
> -
> -# doc
> -PREFERRED_VERSION_xorg-docs ?= "1.5"
> -PREFERRED_VERSION_xorg-sgml-doctools ?= "1.3"
> -
> -# driver
> -PREFERRED_VERSION_xf86-input-acecad ?= "1.4.0"
> -PREFERRED_VERSION_xf86-input-aiptek ?= "1.3.0"
> -PREFERRED_VERSION_xf86-input-evdev ?= "2.3.0"
> -PREFERRED_VERSION_xf86-input-joystick ?= "1.5.0"
> -PREFERRED_VERSION_xf86-input-keyboard ?= "1.4.0"
> -PREFERRED_VERSION_xf86-input-mouse ?= "1.5.0"
> -PREFERRED_VERSION_xf86-input-synaptics ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-vmmouse ?= "12.6.5"
> -PREFERRED_VERSION_xf86-input-void ?= "1.3.0"
> -PREFERRED_VERSION_xf86-video-apm ?= "1.2.2"
> -PREFERRED_VERSION_xf86-video-ark ?= "0.7.2"
> -PREFERRED_VERSION_xf86-video-ast ?= "0.89.9"
> -PREFERRED_VERSION_xf86-video-ati ?= "6.12.4"
> -PREFERRED_VERSION_xf86-video-chips ?= "1.2.2"
> -PREFERRED_VERSION_xf86-video-cirrus ?= "1.3.2"
> -PREFERRED_VERSION_xf86-video-dummy ?= "0.3.2"
> -PREFERRED_VERSION_xf86-video-fbdev ?= "0.4.1"
> -PREFERRED_VERSION_xf86-video-geode ?= "2.11.6"
> -PREFERRED_VERSION_xf86-video-glint ?= "1.2.4"
> -PREFERRED_VERSION_xf86-video-i128 ?= "1.3.3"
> -PREFERRED_VERSION_xf86-video-i740 ?= "1.3.2"
> -PREFERRED_VERSION_xf86-video-intel ?= "2.9.1"
> -PREFERRED_VERSION_xf86-video-mach64 ?= "6.8.2"
> -PREFERRED_VERSION_xf86-video-mga ?= "1.4.11"
> -PREFERRED_VERSION_xf86-video-neomagic ?= "1.2.4"
> -PREFERRED_VERSION_xf86-video-newport ?= "0.2.3"
> -PREFERRED_VERSION_xf86-video-nv ?= "2.1.15"
> -PREFERRED_VERSION_xf86-video-openchrome ?= "0.2.904"
> -PREFERRED_VERSION_xf86-video-r128 ?= "6.8.1"
> -PREFERRED_VERSION_xf86-video-rendition ?= "4.2.3"
> -PREFERRED_VERSION_xf86-video-s3 ?= "0.6.3"
> -PREFERRED_VERSION_xf86-video-s3virge ?= "1.10.4"
> -PREFERRED_VERSION_xf86-video-savage ?= "2.3.1"
> -PREFERRED_VERSION_xf86-video-siliconmotion ?= "1.7.3"
> -PREFERRED_VERSION_xf86-video-sis ?= "0.10.2"
> -PREFERRED_VERSION_xf86-video-sisusb ?= "0.9.3"
> -PREFERRED_VERSION_xf86-video-suncg14 ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-suncg3 ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-suncg6 ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-sunffb ?= "1.2.1"
> -PREFERRED_VERSION_xf86-video-sunleo ?= "1.2.0"
> -PREFERRED_VERSION_xf86-video-suntcx ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-tdfx ?= "1.4.3"
> -PREFERRED_VERSION_xf86-video-tga ?= "1.2.1"
> -PREFERRED_VERSION_xf86-video-trident ?= "1.3.3"
> -PREFERRED_VERSION_xf86-video-tseng ?= "1.2.3"
> -PREFERRED_VERSION_xf86-video-v4l ?= "0.2.0"
> -PREFERRED_VERSION_xf86-video-vesa ?= "2.2.1"
> -PREFERRED_VERSION_xf86-video-vmware ?= "10.16.8"
> -PREFERRED_VERSION_xf86-video-voodoo ?= "1.2.3"
> -PREFERRED_VERSION_xf86-video-wsfb ?= "0.3.0"
> -PREFERRED_VERSION_xf86-video-xgi ?= "1.5.1"
> -PREFERRED_VERSION_xf86-video-xgixp ?= "1.7.99.4"
> -
> -# font
> -PREFERRED_VERSION_encodings ?= "1.0.3"
> -PREFERRED_VERSION_font-adobe-100dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-adobe-75dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-adobe-utopia-100dpi ?= "1.0.2"
> -PREFERRED_VERSION_font-adobe-utopia-75dpi ?= "1.0.2"
> -PREFERRED_VERSION_font-adobe-utopia-type1 ?= "1.0.2"
> -PREFERRED_VERSION_font-alias ?= "1.0.2"
> -PREFERRED_VERSION_font-arabic-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-bh-100dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-bh-75dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-bh-ttf ?= "1.0.1"
> -PREFERRED_VERSION_font-bh-type1 ?= "1.0.1"
> -PREFERRED_VERSION_font-bitstream-100dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-bitstream-75dpi ?= "1.0.1"
> -PREFERRED_VERSION_font-bitstream-type1 ?= "1.0.1"
> -PREFERRED_VERSION_font-cronyx-cyrillic ?= "1.0.1"
> -PREFERRED_VERSION_font-cursor-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-daewoo-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-dec-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-ibm-type1 ?= "1.0.1"
> -PREFERRED_VERSION_font-isas-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-jis-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-micro-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-misc-cyrillic ?= "1.0.1"
> -PREFERRED_VERSION_font-misc-ethiopic ?= "1.0.1"
> -PREFERRED_VERSION_font-misc-meltho ?= "1.0.1"
> -PREFERRED_VERSION_font-misc-misc ?= "1.1.0"
> -PREFERRED_VERSION_font-mutt-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-schumacher-misc ?= "1.1.0"
> -PREFERRED_VERSION_font-screen-cyrillic ?= "1.0.2"
> -PREFERRED_VERSION_font-sony-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-sun-misc ?= "1.0.1"
> -PREFERRED_VERSION_font-util ?= "1.1.1"
> -PREFERRED_VERSION_font-util-native ?= "1.1.1"
> -PREFERRED_VERSION_font-winitzki-cyrillic ?= "1.0.1"
> -PREFERRED_VERSION_font-xfree86-type1 ?= "1.0.2"
> -
> -# lib
> -PREFERRED_VERSION_libapplewm ?= "1.4.0"
> -PREFERRED_VERSION_libfs ?= "1.0.2"
> -PREFERRED_VERSION_libice ?= "1.0.6"
> -PREFERRED_VERSION_libice-native ?= "1.0.6"
> -PREFERRED_VERSION_libsm ?= "1.1.1"
> -PREFERRED_VERSION_libsm-native ?= "1.1.1"
> -PREFERRED_VERSION_libwindowswm ?= "1.0.1"
> -PREFERRED_VERSION_libx11 ?= "1.3.2"
> -PREFERRED_VERSION_libx11-native ?= "1.3.2"
> -PREFERRED_VERSION_libxscrnsaver ?= "1.2.0"
> -PREFERRED_VERSION_libxau ?= "1.0.5"
> -PREFERRED_VERSION_libxau-native ?= "1.0.5"
> -PREFERRED_VERSION_libxaw ?= "1.0.7"
> -PREFERRED_VERSION_libxcomposite ?= "0.4.1"
> -PREFERRED_VERSION_libxcursor ?= "1.1.10"
> -PREFERRED_VERSION_libxcursor-native ?= "1.1.10"
> -PREFERRED_VERSION_libxdamage ?= "1.1.2"
> -PREFERRED_VERSION_libxdmcp ?= "1.0.3"
> -PREFERRED_VERSION_libxdmcp-native ?= "1.0.3"
> -PREFERRED_VERSION_libxext ?= "1.1.1"
> -PREFERRED_VERSION_libxext-native ?= "1.1.1"
> -PREFERRED_VERSION_libxfixes ?= "4.0.4"
> -PREFERRED_VERSION_libxfixes-native ?= "4.0.4"
> -PREFERRED_VERSION_libxfont ?= "1.4.1"
> -PREFERRED_VERSION_libxfont-native ?= "1.4.1"
> -PREFERRED_VERSION_libxft ?= "2.1.14"
> -PREFERRED_VERSION_libxi ?= "1.3"
> -PREFERRED_VERSION_libxinerama ?= "1.1"
> -PREFERRED_VERSION_libxmu ?= "1.0.5"
> -PREFERRED_VERSION_libxpm ?= "3.5.8"
> -PREFERRED_VERSION_libxrandr ?= "1.3.0"
> -PREFERRED_VERSION_libxrender ?= "0.9.5"
> -PREFERRED_VERSION_libxrender-native ?= "0.9.5"
> -PREFERRED_VERSION_libxres ?= "1.0.4"
> -PREFERRED_VERSION_libxt ?= "1.0.7"
> -PREFERRED_VERSION_libxt-native ?= "1.0.7"
> -PREFERRED_VERSION_libxtst ?= "1.1.0"
> -PREFERRED_VERSION_libxv ?= "1.0.5"
> -PREFERRED_VERSION_libxvmc ?= "1.0.6"
> -PREFERRED_VERSION_libxxf86dga ?= "1.1.1"
> -PREFERRED_VERSION_libxxf86vm ?= "1.1.0"
> -PREFERRED_VERSION_libdmx ?= "1.1.0"
> -PREFERRED_VERSION_libfontenc ?= "1.0.5"
> -PREFERRED_VERSION_libfontenc-native ?= "1.0.5"
> -PREFERRED_VERSION_libpciaccess ?= "0.10.9"
> -PREFERRED_VERSION_libxkbfile ?= "1.0.6"
> -PREFERRED_VERSION_libxkbfile-native ?= "1.0.6"
> -PREFERRED_VERSION_mesa ?= "7.2"
> -PREFERRED_VERSION_mesa-dri ?= "7.2"
> -PREFERRED_VERSION_mesa-xlib ?= "7.2"
> -PREFERRED_VERSION_xtrans ?= "1.2.5"
> -PREFERRED_VERSION_xtrans-native ?= "1.2.5"
> -
> -# proto
> -PREFERRED_VERSION_applewmproto ?= "1.4.1"
> -PREFERRED_VERSION_bigreqsproto ?= "1.1.0"
> -PREFERRED_VERSION_bigreqsproto-native ?= "1.1.0"
> -PREFERRED_VERSION_compositeproto ?= "0.4.1"
> -PREFERRED_VERSION_damageproto ?= "1.2.0"
> -PREFERRED_VERSION_dmxproto ?= "2.3"
> -PREFERRED_VERSION_dri2proto ?= "2.1"
> -PREFERRED_VERSION_fixesproto ?= "4.1.1"
> -PREFERRED_VERSION_fixesproto-native ?= "4.1.1"
> -PREFERRED_VERSION_fontsproto ?= "2.1.0"
> -PREFERRED_VERSION_fontsproto-native ?= "2.1.0"
> -PREFERRED_VERSION_glproto ?= "1.4.10"
> -PREFERRED_VERSION_inputproto ?= "2.0"
> -PREFERRED_VERSION_inputproto-native ?= "2.0"
> -PREFERRED_VERSION_kbproto ?= "1.0.4"
> -PREFERRED_VERSION_kbproto-native ?= "1.0.4"
> -PREFERRED_VERSION_randrproto ?= "1.3.1"
> -PREFERRED_VERSION_recordproto ?= "1.14"
> -PREFERRED_VERSION_renderproto ?= "0.11"
> -PREFERRED_VERSION_renderproto-native ?= "0.11"
> -PREFERRED_VERSION_resourceproto ?= "1.1.0"
> -PREFERRED_VERSION_scrnsaverproto ?= "1.2.0"
> -PREFERRED_VERSION_videoproto ?= "2.3.0"
> -PREFERRED_VERSION_windowswmproto ?= "1.0.4"
> -PREFERRED_VERSION_xcmiscproto ?= "1.2.0"
> -PREFERRED_VERSION_xcmiscproto-native ?= "1.2.0"
> -PREFERRED_VERSION_xextproto ?= "7.1.1"
> -PREFERRED_VERSION_xextproto-native ?= "7.1.1"
> -PREFERRED_VERSION_xf86bigfontproto ?= "1.2.0"
> -PREFERRED_VERSION_xf86bigfontproto-native ?= "1.2.0"
> -PREFERRED_VERSION_xf86dgaproto ?= "2.1"
> -PREFERRED_VERSION_xf86driproto ?= "2.1.0"
> -PREFERRED_VERSION_xf86vidmodeproto ?= "2.3"
> -PREFERRED_VERSION_xineramaproto ?= "1.2"
> -PREFERRED_VERSION_xproto ?= "7.0.16"
> -PREFERRED_VERSION_xproto-native ?= "7.0.16"
> -
> -# util
> -PREFERRED_VERSION_makedepend ?= "1.0.2"
> -PREFERRED_VERSION_makedepend-native ?= "1.0.2"
> -PREFERRED_VERSION_util-macros ?= "1.3.0"
> -PREFERRED_VERSION_util-macros-native ?= "1.3.0"
> -
> -# xserver
> -PREFERRED_VERSION_xserver-xorg ?= "1.7.1"
> -
> -require conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
> diff --git a/conf/distro/include/preferred-xorg-versions-live.inc b/conf/distro/include/preferred-xorg-versions-live.inc
> deleted file mode 100644
> index a6ae6cf..0000000
> --- a/conf/distro/include/preferred-xorg-versions-live.inc
> +++ /dev/null
> @@ -1,450 +0,0 @@
> -#Tue Dec 14 12:57:45 CET 2010
> -#app
> -PREFERRED_VERSION_appres ?= "1.0.3"
> -PREFERRED_VERSION_bdftopcf ?= "1.0.3"
> -PREFERRED_VERSION_bdftopcf-native ?= "1.0.3"
> -PREFERRED_VERSION_beforelight ?= "1.0.4"
> -PREFERRED_VERSION_bitmap ?= "1.0.5"
> -PREFERRED_VERSION_constype ?= "1.0.3"
> -PREFERRED_VERSION_editres ?= "1.0.5"
> -PREFERRED_VERSION_fonttosfnt ?= "1.0.4"
> -PREFERRED_VERSION_fslsfonts ?= "1.0.3"
> -PREFERRED_VERSION_fstobdf ?= "1.0.4"
> -PREFERRED_VERSION_iceauth ?= "1.0.4"
> -PREFERRED_VERSION_ico ?= "1.0.3"
> -PREFERRED_VERSION_lbxproxy ?= "1.0.2"
> -PREFERRED_VERSION_listres ?= "1.0.2"
> -PREFERRED_VERSION_luit ?= "1.1.0"
> -PREFERRED_VERSION_mkcfm ?= "1.0.1"
> -PREFERRED_VERSION_mkcomposecache ?= "1.2.1"
> -PREFERRED_VERSION_mkfontdir ?= "1.0.6"
> -PREFERRED_VERSION_mkfontdir-native ?= "1.0.6"
> -PREFERRED_VERSION_mkfontscale ?= "1.0.8"
> -PREFERRED_VERSION_mkfontscale-native ?= "1.0.8"
> -PREFERRED_VERSION_oclock ?= "1.0.2"
> -PREFERRED_VERSION_proxymngr ?= "1.0.2"
> -PREFERRED_VERSION_rendercheck ?= "1.4"
> -PREFERRED_VERSION_rgb ?= "1.0.4"
> -PREFERRED_VERSION_rstart ?= "1.0.4"
> -PREFERRED_VERSION_scripts ?= "1.0.1"
> -PREFERRED_VERSION_sessreg ?= "1.0.6"
> -PREFERRED_VERSION_setxkbmap ?= "1.2.0"
> -PREFERRED_VERSION_showfont ?= "1.0.3"
> -PREFERRED_VERSION_smproxy ?= "1.0.4"
> -PREFERRED_VERSION_twm ?= "1.0.5"
> -PREFERRED_VERSION_viewres ?= "1.0.3"
> -PREFERRED_VERSION_x11perf ?= "1.5.2"
> -PREFERRED_VERSION_xauth ?= "1.0.5"
> -PREFERRED_VERSION_xbacklight ?= "1.1.2"
> -PREFERRED_VERSION_xbiff ?= "1.0.2"
> -PREFERRED_VERSION_xcalc ?= "1.0.4.1"
> -PREFERRED_VERSION_xclipboard ?= "1.1.1"
> -PREFERRED_VERSION_xclock ?= "1.0.5"
> -PREFERRED_VERSION_xcmsdb ?= "1.0.3"
> -PREFERRED_VERSION_xcompmgr ?= "1.1.5"
> -PREFERRED_VERSION_xconsole ?= "1.0.4"
> -PREFERRED_VERSION_xcursorgen ?= "1.0.4"
> -PREFERRED_VERSION_xcursorgen-native ?= "1.0.4"
> -PREFERRED_VERSION_xdbedizzy ?= "1.1.0"
> -PREFERRED_VERSION_xditview ?= "1.0.2"
> -PREFERRED_VERSION_xdm ?= "1.1.10"
> -PREFERRED_VERSION_xdpyinfo ?= "1.2.0"
> -PREFERRED_VERSION_xdriinfo ?= "1.0.4"
> -PREFERRED_VERSION_xedit ?= "1.2.0"
> -PREFERRED_VERSION_xev ?= "1.1.0"
> -PREFERRED_VERSION_xeyes ?= "1.1.1"
> -PREFERRED_VERSION_xf86dga ?= "1.0.3"
> -PREFERRED_VERSION_xfd ?= "1.1.0"
> -PREFERRED_VERSION_xfindproxy ?= "1.0.1"
> -PREFERRED_VERSION_xfontsel ?= "1.0.3"
> -PREFERRED_VERSION_xfs ?= "1.1.1"
> -PREFERRED_VERSION_xfsinfo ?= "1.0.3"
> -PREFERRED_VERSION_xfwp ?= "1.0.1"
> -PREFERRED_VERSION_xgamma ?= "1.0.4"
> -PREFERRED_VERSION_xgc ?= "1.0.3"
> -PREFERRED_VERSION_xhost ?= "1.0.4"
> -PREFERRED_VERSION_xinit ?= "1.3.0"
> -PREFERRED_VERSION_xinput ?= "1.5.3"
> -PREFERRED_VERSION_xkbcomp ?= "1.2.0"
> -PREFERRED_VERSION_xkbcomp-native ?= "1.2.0"
> -PREFERRED_VERSION_xkbevd ?= "1.1.2"
> -PREFERRED_VERSION_xkbprint ?= "1.0.2"
> -PREFERRED_VERSION_xkbutils ?= "1.0.3"
> -PREFERRED_VERSION_xkill ?= "1.0.3"
> -PREFERRED_VERSION_xload ?= "1.1.0"
> -PREFERRED_VERSION_xlogo ?= "1.0.3"
> -PREFERRED_VERSION_xlsatoms ?= "1.1.0"
> -PREFERRED_VERSION_xlsclients ?= "1.1.1"
> -PREFERRED_VERSION_xlsfonts ?= "1.0.3"
> -PREFERRED_VERSION_xmag ?= "1.0.4"
> -PREFERRED_VERSION_xman ?= "1.1.1"
> -PREFERRED_VERSION_xmessage ?= "1.0.3"
> -PREFERRED_VERSION_xmh ?= "1.0.2"
> -PREFERRED_VERSION_xmodmap ?= "1.0.5"
> -PREFERRED_VERSION_xmore ?= "1.0.2"
> -PREFERRED_VERSION_xphelloworld ?= "1.0.1"
> -PREFERRED_VERSION_xplsprinters ?= "1.0.1"
> -PREFERRED_VERSION_xpr ?= "1.0.3"
> -PREFERRED_VERSION_xprehashprinterlist ?= "1.0.1"
> -PREFERRED_VERSION_xprop ?= "1.2.0"
> -PREFERRED_VERSION_xrandr ?= "1.3.4"
> -PREFERRED_VERSION_xrdb ?= "1.0.7"
> -PREFERRED_VERSION_xrefresh ?= "1.0.4"
> -PREFERRED_VERSION_xrx ?= "1.0.4"
> -PREFERRED_VERSION_xset ?= "1.2.1"
> -PREFERRED_VERSION_xsetmode ?= "1.0.0"
> -PREFERRED_VERSION_xsetpointer ?= "1.0.1"
> -PREFERRED_VERSION_xsetroot ?= "1.1.0"
> -PREFERRED_VERSION_xsm ?= "1.0.2"
> -PREFERRED_VERSION_xstdcmap ?= "1.0.2"
> -PREFERRED_VERSION_xtrap ?= "1.0.2"
> -PREFERRED_VERSION_xvidtune ?= "1.0.2"
> -PREFERRED_VERSION_xvinfo ?= "1.1.1"
> -PREFERRED_VERSION_xwd ?= "1.0.4"
> -PREFERRED_VERSION_xwininfo ?= "1.1.1"
> -PREFERRED_VERSION_xwud ?= "1.0.3"
> -#data
> -PREFERRED_VERSION_xbitmaps ?= "1.1.1"
> -PREFERRED_VERSION_xcursor-themes ?= "1.0.3"
> -PREFERRED_VERSION_xkbdata ?= "1.0.1"
> -#doc
> -PREFERRED_VERSION_xorg-docs ?= "1.5.99.901"
> -PREFERRED_VERSION_xorg-sgml-doctools ?= "1.5.99.901"
> -#driver
> -PREFERRED_VERSION_xf86-input-acecad ?= "1.4.0"
> -PREFERRED_VERSION_xf86-input-aiptek ?= "1.3.1"
> -PREFERRED_VERSION_xf86-input-calcomp ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-citron ?= "2.2.2"
> -PREFERRED_VERSION_xf86-input-digitaledge ?= "1.1.1"
> -PREFERRED_VERSION_xf86-input-dmc ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-dynapro ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-elo2300 ?= "1.1.2"
> -PREFERRED_VERSION_xf86-input-elographics ?= "1.2.4"
> -PREFERRED_VERSION_xf86-input-evdev ?= "2.5.0"
> -PREFERRED_VERSION_xf86-input-fpit ?= "1.3.0"
> -PREFERRED_VERSION_xf86-input-hyperpen ?= "1.3.0"
> -PREFERRED_VERSION_xf86-input-jamstudio ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-joystick ?= "1.5.0"
> -PREFERRED_VERSION_xf86-input-keyboard ?= "1.5.0"
> -PREFERRED_VERSION_xf86-input-magellan ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-magictouch ?= "1.0.0.5"
> -PREFERRED_VERSION_xf86-input-microtouch ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-mouse ?= "1.6.0"
> -PREFERRED_VERSION_xf86-input-mutouch ?= "1.2.1+gitr%"
> -PREFERRED_VERSION_xf86-input-palmax ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-penmount ?= "1.4.1"
> -PREFERRED_VERSION_xf86-input-spaceorb ?= "1.1.1"
> -PREFERRED_VERSION_xf86-input-summa ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-synaptics ?= "1.3.0"
> -PREFERRED_VERSION_xf86-input-tek4957 ?= "1.2.0"
> -PREFERRED_VERSION_xf86-input-ur98 ?= "1.1.0"
> -PREFERRED_VERSION_xf86-input-vmmouse ?= "12.6.10"
> -PREFERRED_VERSION_xf86-input-void ?= "1.3.1"
> -PREFERRED_VERSION_xf86-video-apm ?= "1.2.3"
> -PREFERRED_VERSION_xf86-video-ark ?= "0.7.3"
> -PREFERRED_VERSION_xf86-video-ast ?= "0.91.10"
> -PREFERRED_VERSION_xf86-video-ati ?= "6.13.2"
> -PREFERRED_VERSION_xf86-video-chips ?= "1.2.3"
> -PREFERRED_VERSION_xf86-video-cirrus ?= "1.3.2"
> -PREFERRED_VERSION_xf86-video-cyrix ?= "1.1.0"
> -PREFERRED_VERSION_xf86-video-dummy ?= "0.3.4"
> -PREFERRED_VERSION_xf86-video-fbdev ?= "0.4.2"
> -PREFERRED_VERSION_xf86-video-geode ?= "2.11.10"
> -PREFERRED_VERSION_xf86-video-glint ?= "1.2.5"
> -PREFERRED_VERSION_xf86-video-i128 ?= "1.3.4"
> -PREFERRED_VERSION_xf86-video-i740 ?= "1.3.2"
> -PREFERRED_VERSION_xf86-video-i810 ?= "1.7.4"
> -PREFERRED_VERSION_xf86-video-impact ?= "0.2.0"
> -PREFERRED_VERSION_xf86-video-imstt ?= "1.1.0"
> -PREFERRED_VERSION_xf86-video-intel ?= "2.13.0"
> -PREFERRED_VERSION_xf86-video-mach64 ?= "6.8.2"
> -PREFERRED_VERSION_xf86-video-mga ?= "1.9.100"
> -PREFERRED_VERSION_xf86-video-neomagic ?= "1.2.5"
> -PREFERRED_VERSION_xf86-video-newport ?= "0.2.3"
> -PREFERRED_VERSION_xf86-video-nsc ?= "2.8.3"
> -PREFERRED_VERSION_xf86-video-nv ?= "2.1.18"
> -PREFERRED_VERSION_xf86-video-openchrome ?= "0.2.904"
> -PREFERRED_VERSION_xf86-video-r128 ?= "6.8.1"
> -PREFERRED_VERSION_xf86-video-radeonhd ?= "1.3.0"
> -PREFERRED_VERSION_xf86-video-rendition ?= "4.2.4"
> -PREFERRED_VERSION_xf86-video-s3 ?= "0.6.3"
> -PREFERRED_VERSION_xf86-video-s3virge ?= "1.10.4"
> -PREFERRED_VERSION_xf86-video-savage ?= "2.3.2"
> -PREFERRED_VERSION_xf86-video-siliconmotion ?= "1.7.4"
> -PREFERRED_VERSION_xf86-video-sis ?= "0.10.3"
> -PREFERRED_VERSION_xf86-video-sisusb ?= "0.9.4"
> -PREFERRED_VERSION_xf86-video-sunbw2 ?= "1.1.0"
> -PREFERRED_VERSION_xf86-video-suncg14 ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-suncg3 ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-suncg6 ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-sunffb ?= "1.2.1"
> -PREFERRED_VERSION_xf86-video-sunleo ?= "1.2.0"
> -PREFERRED_VERSION_xf86-video-suntcx ?= "1.1.1"
> -PREFERRED_VERSION_xf86-video-tdfx ?= "1.4.3"
> -PREFERRED_VERSION_xf86-video-tga ?= "1.2.1"
> -PREFERRED_VERSION_xf86-video-trident ?= "1.3.4"
> -PREFERRED_VERSION_xf86-video-tseng ?= "1.2.4"
> -PREFERRED_VERSION_xf86-video-v4l ?= "0.2.0"
> -PREFERRED_VERSION_xf86-video-vermilion ?= "1.0.1"
> -PREFERRED_VERSION_xf86-video-vesa ?= "2.3.0"
> -PREFERRED_VERSION_xf86-video-vga ?= "4.1.0"
> -PREFERRED_VERSION_xf86-video-via ?= "0.2.2"
> -PREFERRED_VERSION_xf86-video-vmware ?= "11.0.3"
> -PREFERRED_VERSION_xf86-video-voodoo ?= "1.2.4"
> -PREFERRED_VERSION_xf86-video-wsfb ?= "0.3.0"
> -PREFERRED_VERSION_xf86-video-xgi ?= "1.6.0"
> -PREFERRED_VERSION_xf86-video-xgixp ?= "1.8.0"
> -#font
> -PREFERRED_VERSION_encodings ?= "1.0.4"
> -PREFERRED_VERSION_font-adobe-100dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-adobe-75dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-adobe-utopia-100dpi ?= "1.0.4"
> -PREFERRED_VERSION_font-adobe-utopia-75dpi ?= "1.0.4"
> -PREFERRED_VERSION_font-adobe-utopia-type1 ?= "1.0.4"
> -PREFERRED_VERSION_font-alias ?= "1.0.3"
> -PREFERRED_VERSION_font-arabic-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-bh-100dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-bh-75dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-bh-ttf ?= "1.0.3"
> -PREFERRED_VERSION_font-bh-type1 ?= "1.0.3"
> -PREFERRED_VERSION_font-bitstream-100dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-bitstream-75dpi ?= "1.0.3"
> -PREFERRED_VERSION_font-bitstream-speedo ?= "1.0.2"
> -PREFERRED_VERSION_font-bitstream-type1 ?= "1.0.3"
> -PREFERRED_VERSION_font-cronyx-cyrillic ?= "1.0.3"
> -PREFERRED_VERSION_font-cursor-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-daewoo-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-dec-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-ibm-type1 ?= "1.0.3"
> -PREFERRED_VERSION_font-isas-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-jis-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-micro-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-misc-cyrillic ?= "1.0.3"
> -PREFERRED_VERSION_font-misc-ethiopic ?= "1.0.3"
> -PREFERRED_VERSION_font-misc-meltho ?= "1.0.3"
> -PREFERRED_VERSION_font-misc-misc ?= "1.1.2"
> -PREFERRED_VERSION_font-mutt-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-schumacher-misc ?= "1.1.2"
> -PREFERRED_VERSION_font-screen-cyrillic ?= "1.0.4"
> -PREFERRED_VERSION_font-sony-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-sun-misc ?= "1.0.3"
> -PREFERRED_VERSION_font-util ?= "1.2.0"
> -PREFERRED_VERSION_font-util-native ?= "1.2.0"
> -PREFERRED_VERSION_font-winitzki-cyrillic ?= "1.0.3"
> -PREFERRED_VERSION_font-xfree86-type1 ?= "1.0.4"
> -#lib
> -PREFERRED_VERSION_libapplewm ?= "1.4.0"
> -PREFERRED_VERSION_libfs ?= "1.0.3"
> -PREFERRED_VERSION_libice ?= "1.0.7"
> -PREFERRED_VERSION_libice-native ?= "1.0.7"
> -PREFERRED_VERSION_libsm ?= "1.2.0"
> -PREFERRED_VERSION_libsm-native ?= "1.2.0"
> -PREFERRED_VERSION_libwindowswm ?= "1.0.1"
> -PREFERRED_VERSION_libx11 ?= "1.4.0"
> -PREFERRED_VERSION_libx11-native ?= "1.4.0"
> -PREFERRED_VERSION_libx11-nativesdk ?= "1.4.0"
> -PREFERRED_VERSION_libxscrnsaver ?= "1.2.1"
> -PREFERRED_VERSION_libxtrap ?= "1.0.0"
> -PREFERRED_VERSION_libxau ?= "1.0.6"
> -PREFERRED_VERSION_libxau-native ?= "1.0.6"
> -PREFERRED_VERSION_libxau-nativesdk ?= "1.0.6"
> -PREFERRED_VERSION_libxaw ?= "1.0.8"
> -PREFERRED_VERSION_libxcomposite ?= "0.4.3"
> -PREFERRED_VERSION_libxcursor ?= "1.1.11"
> -PREFERRED_VERSION_libxcursor-native ?= "1.1.11"
> -PREFERRED_VERSION_libxdamage ?= "1.1.3"
> -PREFERRED_VERSION_libxdmcp ?= "1.1.0"
> -PREFERRED_VERSION_libxdmcp-native ?= "1.1.0"
> -PREFERRED_VERSION_libxdmcp-nativesdk ?= "1.1.0"
> -PREFERRED_VERSION_libxevie ?= "1.0.3"
> -PREFERRED_VERSION_libxext ?= "1.2.0"
> -PREFERRED_VERSION_libxext-native ?= "1.2.0"
> -PREFERRED_VERSION_libxext-nativesdk ?= "1.2.0"
> -PREFERRED_VERSION_libxfixes ?= "4.0.5"
> -PREFERRED_VERSION_libxfixes-native ?= "4.0.5"
> -PREFERRED_VERSION_libxfont ?= "1.4.3"
> -PREFERRED_VERSION_libxfont-native ?= "1.4.3"
> -PREFERRED_VERSION_libxfontcache ?= "1.0.5"
> -PREFERRED_VERSION_libxft ?= "2.2.0"
> -PREFERRED_VERSION_libxi ?= "1.4.0"
> -PREFERRED_VERSION_libxinerama ?= "1.1.1"
> -PREFERRED_VERSION_libxmu ?= "1.1.0"
> -PREFERRED_VERSION_libxp ?= "1.0.0"
> -PREFERRED_VERSION_libxpm ?= "3.5.9"
> -PREFERRED_VERSION_libxprintapputil ?= "1.0.1"
> -PREFERRED_VERSION_libxprintutil ?= "1.0.1"
> -PREFERRED_VERSION_libxrandr ?= "1.3.1"
> -PREFERRED_VERSION_libxrandr-nativesdk ?= "1.3.1"
> -PREFERRED_VERSION_libxrender ?= "0.9.6"
> -PREFERRED_VERSION_libxrender-native ?= "0.9.6"
> -PREFERRED_VERSION_libxrender-nativesdk ?= "0.9.6"
> -PREFERRED_VERSION_libxres ?= "1.0.5"
> -PREFERRED_VERSION_libxt ?= "1.0.9"
> -PREFERRED_VERSION_libxt-native ?= "1.0.9"
> -PREFERRED_VERSION_libxtst ?= "1.2.0"
> -PREFERRED_VERSION_libxv ?= "1.0.6"
> -PREFERRED_VERSION_libxvmc ?= "1.0.6"
> -PREFERRED_VERSION_libxxf86dga ?= "1.1.2"
> -PREFERRED_VERSION_libxxf86misc ?= "1.0.3"
> -PREFERRED_VERSION_libxxf86vm ?= "1.1.1"
> -PREFERRED_VERSION_libdmx ?= "1.1.1"
> -PREFERRED_VERSION_libfontenc ?= "1.1.0"
> -PREFERRED_VERSION_libfontenc-native ?= "1.1.0"
> -PREFERRED_VERSION_liblbxutil ?= "1.1.0"
> -PREFERRED_VERSION_liboldx ?= "1.0.1"
> -PREFERRED_VERSION_libpciaccess ?= "0.12.0"
> -PREFERRED_VERSION_libxkbfile ?= "1.0.7"
> -PREFERRED_VERSION_libxkbfile-native ?= "1.0.7"
> -PREFERRED_VERSION_libxkbui ?= "1.0.2"
> -PREFERRED_VERSION_pixman ?= "0.21.2"
> -PREFERRED_VERSION_pixman-native ?= "0.21.2"
> -PREFERRED_VERSION_xtrans ?= "1.2.6"
> -PREFERRED_VERSION_xtrans-native ?= "1.2.6"
> -PREFERRED_VERSION_xtrans-nativesdk ?= "1.2.6"
> -#proto
> -PREFERRED_VERSION_applewmproto ?= "1.4.1"
> -PREFERRED_VERSION_applewmproto-native ?= "1.4.1"
> -PREFERRED_VERSION_applewmproto-nativesdk ?= "1.4.1"
> -PREFERRED_VERSION_applewmproto-sdk ?= "1.4.1"
> -PREFERRED_VERSION_bigreqsproto ?= "1.1.1"
> -PREFERRED_VERSION_bigreqsproto-native ?= "1.1.1"
> -PREFERRED_VERSION_bigreqsproto-nativesdk ?= "1.1.1"
> -PREFERRED_VERSION_bigreqsproto-sdk ?= "1.1.1"
> -PREFERRED_VERSION_compositeproto ?= "0.4.2"
> -PREFERRED_VERSION_compositeproto-native ?= "0.4.2"
> -PREFERRED_VERSION_compositeproto-nativesdk ?= "0.4.2"
> -PREFERRED_VERSION_compositeproto-sdk ?= "0.4.2"
> -PREFERRED_VERSION_damageproto ?= "1.2.1"
> -PREFERRED_VERSION_damageproto-native ?= "1.2.1"
> -PREFERRED_VERSION_damageproto-nativesdk ?= "1.2.1"
> -PREFERRED_VERSION_damageproto-sdk ?= "1.2.1"
> -PREFERRED_VERSION_dmxproto ?= "2.3"
> -PREFERRED_VERSION_dmxproto-native ?= "2.3"
> -PREFERRED_VERSION_dmxproto-nativesdk ?= "2.3"
> -PREFERRED_VERSION_dmxproto-sdk ?= "2.3"
> -PREFERRED_VERSION_dri2proto ?= "2.3"
> -PREFERRED_VERSION_dri2proto-native ?= "2.3"
> -PREFERRED_VERSION_dri2proto-nativesdk ?= "2.3"
> -PREFERRED_VERSION_dri2proto-sdk ?= "2.3"
> -PREFERRED_VERSION_evieext ?= "1.1.0"
> -PREFERRED_VERSION_evieext-native ?= "1.1.0"
> -PREFERRED_VERSION_evieext-nativesdk ?= "1.1.0"
> -PREFERRED_VERSION_evieext-sdk ?= "1.1.0"
> -PREFERRED_VERSION_fixesproto ?= "4.1.2"
> -PREFERRED_VERSION_fixesproto-native ?= "4.1.2"
> -PREFERRED_VERSION_fixesproto-nativesdk ?= "4.1.2"
> -PREFERRED_VERSION_fixesproto-sdk ?= "4.1.2"
> -PREFERRED_VERSION_fontcacheproto ?= "0.1.3"
> -PREFERRED_VERSION_fontcacheproto-native ?= "0.1.3"
> -PREFERRED_VERSION_fontcacheproto-nativesdk ?= "0.1.3"
> -PREFERRED_VERSION_fontcacheproto-sdk ?= "0.1.3"
> -PREFERRED_VERSION_fontsproto ?= "2.1.1"
> -PREFERRED_VERSION_fontsproto-native ?= "2.1.1"
> -PREFERRED_VERSION_fontsproto-nativesdk ?= "2.1.1"
> -PREFERRED_VERSION_fontsproto-sdk ?= "2.1.1"
> -PREFERRED_VERSION_glproto ?= "1.4.12"
> -PREFERRED_VERSION_glproto-native ?= "1.4.12"
> -PREFERRED_VERSION_glproto-nativesdk ?= "1.4.12"
> -PREFERRED_VERSION_glproto-sdk ?= "1.4.12"
> -PREFERRED_VERSION_inputproto ?= "2.0.1"
> -PREFERRED_VERSION_inputproto-native ?= "2.0.1"
> -PREFERRED_VERSION_inputproto-nativesdk ?= "2.0.1"
> -PREFERRED_VERSION_inputproto-sdk ?= "2.0.1"
> -PREFERRED_VERSION_kbproto ?= "1.0.5"
> -PREFERRED_VERSION_kbproto-native ?= "1.0.5"
> -PREFERRED_VERSION_kbproto-nativesdk ?= "1.0.5"
> -PREFERRED_VERSION_kbproto-sdk ?= "1.0.5"
> -PREFERRED_VERSION_printproto ?= "1.0.4"
> -PREFERRED_VERSION_printproto-native ?= "1.0.4"
> -PREFERRED_VERSION_printproto-nativesdk ?= "1.0.4"
> -PREFERRED_VERSION_printproto-sdk ?= "1.0.4"
> -PREFERRED_VERSION_randrproto ?= "1.3.2"
> -PREFERRED_VERSION_randrproto-native ?= "1.3.2"
> -PREFERRED_VERSION_randrproto-nativesdk ?= "1.3.2"
> -PREFERRED_VERSION_randrproto-sdk ?= "1.3.2"
> -PREFERRED_VERSION_recordproto ?= "1.14.1"
> -PREFERRED_VERSION_recordproto-native ?= "1.14.1"
> -PREFERRED_VERSION_recordproto-nativesdk ?= "1.14.1"
> -PREFERRED_VERSION_recordproto-sdk ?= "1.14.1"
> -PREFERRED_VERSION_renderproto ?= "0.11.1"
> -PREFERRED_VERSION_renderproto-native ?= "0.11.1"
> -PREFERRED_VERSION_renderproto-nativesdk ?= "0.11.1"
> -PREFERRED_VERSION_renderproto-sdk ?= "0.11.1"
> -PREFERRED_VERSION_resourceproto ?= "1.1.1"
> -PREFERRED_VERSION_resourceproto-native ?= "1.1.1"
> -PREFERRED_VERSION_resourceproto-nativesdk ?= "1.1.1"
> -PREFERRED_VERSION_resourceproto-sdk ?= "1.1.1"
> -PREFERRED_VERSION_scrnsaverproto ?= "1.2.1"
> -PREFERRED_VERSION_scrnsaverproto-native ?= "1.2.1"
> -PREFERRED_VERSION_scrnsaverproto-nativesdk ?= "1.2.1"
> -PREFERRED_VERSION_scrnsaverproto-sdk ?= "1.2.1"
> -PREFERRED_VERSION_trapproto ?= "3.4.3"
> -PREFERRED_VERSION_trapproto-native ?= "3.4.3"
> -PREFERRED_VERSION_trapproto-nativesdk ?= "3.4.3"
> -PREFERRED_VERSION_trapproto-sdk ?= "3.4.3"
> -PREFERRED_VERSION_videoproto ?= "2.3.1"
> -PREFERRED_VERSION_videoproto-native ?= "2.3.1"
> -PREFERRED_VERSION_videoproto-nativesdk ?= "2.3.1"
> -PREFERRED_VERSION_videoproto-sdk ?= "2.3.1"
> -PREFERRED_VERSION_windowswmproto ?= "1.0.4"
> -PREFERRED_VERSION_windowswmproto-native ?= "1.0.4"
> -PREFERRED_VERSION_windowswmproto-nativesdk ?= "1.0.4"
> -PREFERRED_VERSION_windowswmproto-sdk ?= "1.0.4"
> -PREFERRED_VERSION_xcmiscproto ?= "1.2.1"
> -PREFERRED_VERSION_xcmiscproto-native ?= "1.2.1"
> -PREFERRED_VERSION_xcmiscproto-nativesdk ?= "1.2.1"
> -PREFERRED_VERSION_xcmiscproto-sdk ?= "1.2.1"
> -PREFERRED_VERSION_xextproto ?= "7.1.2"
> -PREFERRED_VERSION_xextproto-native ?= "7.1.2"
> -PREFERRED_VERSION_xextproto-nativesdk ?= "7.1.2"
> -PREFERRED_VERSION_xextproto-sdk ?= "7.1.2"
> -PREFERRED_VERSION_xf86bigfontproto ?= "1.2.0"
> -PREFERRED_VERSION_xf86bigfontproto-native ?= "1.2.0"
> -PREFERRED_VERSION_xf86bigfontproto-nativesdk ?= "1.2.0"
> -PREFERRED_VERSION_xf86bigfontproto-sdk ?= "1.2.0"
> -PREFERRED_VERSION_xf86dgaproto ?= "2.1"
> -PREFERRED_VERSION_xf86dgaproto-native ?= "2.1"
> -PREFERRED_VERSION_xf86dgaproto-nativesdk ?= "2.1"
> -PREFERRED_VERSION_xf86dgaproto-sdk ?= "2.1"
> -PREFERRED_VERSION_xf86driproto ?= "2.1.0"
> -PREFERRED_VERSION_xf86driproto-native ?= "2.1.0"
> -PREFERRED_VERSION_xf86driproto-nativesdk ?= "2.1.0"
> -PREFERRED_VERSION_xf86driproto-sdk ?= "2.1.0"
> -PREFERRED_VERSION_xf86miscproto ?= "0.9.3"
> -PREFERRED_VERSION_xf86miscproto-native ?= "0.9.3"
> -PREFERRED_VERSION_xf86miscproto-nativesdk ?= "0.9.3"
> -PREFERRED_VERSION_xf86miscproto-sdk ?= "0.9.3"
> -PREFERRED_VERSION_xf86rushproto ?= "1.1.2"
> -PREFERRED_VERSION_xf86rushproto-native ?= "1.1.2"
> -PREFERRED_VERSION_xf86rushproto-nativesdk ?= "1.1.2"
> -PREFERRED_VERSION_xf86rushproto-sdk ?= "1.1.2"
> -PREFERRED_VERSION_xf86vidmodeproto ?= "2.3"
> -PREFERRED_VERSION_xf86vidmodeproto-native ?= "2.3"
> -PREFERRED_VERSION_xf86vidmodeproto-nativesdk ?= "2.3"
> -PREFERRED_VERSION_xf86vidmodeproto-sdk ?= "2.3"
> -PREFERRED_VERSION_xineramaproto ?= "1.2"
> -PREFERRED_VERSION_xineramaproto-native ?= "1.2"
> -PREFERRED_VERSION_xineramaproto-nativesdk ?= "1.2"
> -PREFERRED_VERSION_xineramaproto-sdk ?= "1.2"
> -PREFERRED_VERSION_xproto ?= "7.0.20"
> -PREFERRED_VERSION_xproto-native ?= "7.0.20"
> -PREFERRED_VERSION_xproto-nativesdk ?= "7.0.20"
> -PREFERRED_VERSION_xproto-sdk ?= "7.0.20"
> -PREFERRED_VERSION_xproxymanagementprotocol ?= "1.0.3"
> -PREFERRED_VERSION_xproxymanagementprotocol-native ?= "1.0.3"
> -PREFERRED_VERSION_xproxymanagementprotocol-nativesdk ?= "1.0.3"
> -PREFERRED_VERSION_xproxymanagementprotocol-sdk ?= "1.0.3"
> -#util
> -PREFERRED_VERSION_gccmakedep ?= "1.0.2"
> -PREFERRED_VERSION_imake ?= "1.0.4"
> -PREFERRED_VERSION_lndir ?= "1.0.2"
> -PREFERRED_VERSION_makedepend ?= "1.0.3"
> -PREFERRED_VERSION_makedepend-native ?= "1.0.3"
> -PREFERRED_VERSION_util-macros ?= "1.11.0"
> -PREFERRED_VERSION_util-macros-native ?= "1.11.0"
> -PREFERRED_VERSION_util-macros-nativesdk ?= "1.11.0"
> -PREFERRED_VERSION_xorg-cf-files ?= "1.0.3"
> -#xserver
> -PREFERRED_VERSION_xserver-xorg ?= "1.9.3"
> diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
> index 28c1dda..0070d84 100644
> --- a/conf/distro/jlime-2010.1.conf
> +++ b/conf/distro/jlime-2010.1.conf
> @@ -92,7 +92,6 @@ PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
>  #
>  # Framebuffer & X
>  #
> -require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>  PREFERRED_PROVIDER_virtual/libx11 = "libx11"
>  PREFERRED_PROVIDER_virtual/libx11-native = "libx11-native"
>  PREFERRED_PROVIDER_virtual/libsdl = "libsdl-x11"
> diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
> index 7f82791..3f4daac 100644
> --- a/conf/distro/metano.conf
> +++ b/conf/distro/metano.conf
> @@ -90,7 +90,6 @@ require conf/distro/include/arm-thumb.inc
>  #############################################################################
>  require conf/distro/include/preferred-e-versions.inc
>  require conf/distro/include/preferred-opie-versions-1.2.4.inc
> -require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>  
>  PREFERRED_PROVIDER_opkg ?= "opkg"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 102afa1..5902105 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -75,11 +75,6 @@ MACHINE_CLASS ?= ""
>  MACHINE_OVERRIDES += "${MACHINE_CLASS}"
>  
>  #############################################################################
> -# PREFERRED VERSIONS
> -#############################################################################
> -require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
> -
> -#############################################################################
>  # NLS
>  #############################################################################
>  USE_NLS = "no"
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 5b92a36..175d2fd 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -98,7 +98,6 @@ require conf/distro/include/arm-thumb.inc
>  #############################################################################
>  require conf/distro/include/preferred-e-versions.inc
>  require conf/distro/include/preferred-opie-versions-1.2.4.inc
> -require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>  
>  PREFERRED_PROVIDER_opkg ?= "opkg"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
> diff --git a/contrib/source-checker/bump.preferred-xorg-versions-7.5.sh b/contrib/source-checker/bump.preferred-xorg-versions-7.5.sh
> index 07fa914..a7be100 100755
> --- a/contrib/source-checker/bump.preferred-xorg-versions-7.5.sh
> +++ b/contrib/source-checker/bump.preferred-xorg-versions-7.5.sh
> @@ -5,7 +5,6 @@ DIR=${SCRDIR}/${DATE}
>  PREFIX=http://www.x.org/releases/X11R7.5/src/
>  GRPS="app data doc driver font lib proto util xserver"
>  OETREE=${SCRDIR}/../..
> -PREFS_LIVE=${OETREE}/conf/distro/include/preferred-xorg-versions-X11R7.5-live.inc
>  BBS=${OETREE}/recipes/xorg-
>  OUT_LOG=${DIR}.log
>  OUT_CMD=${DIR}.cmd
> @@ -30,9 +29,6 @@ function updateVersions {
>    VER=$3
>    BB_VER=`ls -1 ${BBS}${GRP}/${PKG}_*.bb 2>/dev/null | sed "s%${BBS}${GRP}/${PKG}_%%g; s%.bb$%%g" | grep -v X11R7.0 | grep -v cvs | grep -v git | grep -v svn | sort -V | tail -n 1`
>    #echo ${GRP}/${PKG}/${VER} ${PREF_VER} ${BB_VER}
> -  if ls -1 ${BBS}${GRP}/${PKG}_*.bb >/dev/null 2>/dev/null ; then
> -    echo "PREFERRED_VERSION_${PKG} ?= \"${VER}\"" >> ${PREFS_LIVE}
> -  fi
>    if [[ -n ${BB_VER} && ${BB_VER} != ${VER} ]] ; then
>      echo "bump: $GRP ${PKG} ${BB_VER} -> ${VER}" | tee -a ${OUT_LOG}
>      echo "cp ${BBS}${GRP}/${PKG}_${BB_VER}.bb ${BBS}${GRP}/${PKG}_${VER}.bb" >> ${OUT_CMD}
> @@ -53,14 +49,11 @@ done
>  
>  sort -u ${DIR}/latest.txt > ${DIR}/latest.sort.txt
>   
> -echo "#`date`" > ${PREFS_LIVE}
> -
>  echo "#`date`" > ${OUT_LOG}
>  echo "#`date`" > ${OUT_CMD}
>  
>  cat ${DIR}/latest.txt | while read LINE; do
>    if [[ ${LINE} =~ \#.* ]]; then
> -    echo ${LINE} >> ${PREFS_LIVE}
>      continue
>    fi
>    #echo ${LINE};
> diff --git a/contrib/source-checker/bump.preferred-xorg-versions-live.sh b/contrib/source-checker/bump.preferred-xorg-versions-live.sh
> index 49bce21..eb1afbf 100755
> --- a/contrib/source-checker/bump.preferred-xorg-versions-live.sh
> +++ b/contrib/source-checker/bump.preferred-xorg-versions-live.sh
> @@ -5,7 +5,6 @@ DIR=${SCRDIR}/${DATE}
>  PREFIX=http://xorg.freedesktop.org/releases/individual/
>  GRPS="app data doc driver font lib proto util xserver"
>  OETREE=${SCRDIR}/../..
> -PREFS_LIVE=${OETREE}/conf/distro/include/preferred-xorg-versions-live.inc
>  BBS=${OETREE}/recipes/xorg-
>  OUT_LOG=${DIR}.log
>  OUT_CMD=${DIR}.cmd
> @@ -30,27 +29,6 @@ function updateVersions {
>    VER=$3
>    BB_VER=`ls -1 ${BBS}${GRP}/${PKG}_*.bb 2>/dev/null | sed "s%${BBS}${GRP}/${PKG}_%%g; s%.bb$%%g" | grep -v X11R7.0 | grep -v cvs | grep -v git | grep -v svn | sort -V | tail -n 1`
>    #echo ${GRP}/${PKG}/${VER} ${PREF_VER} ${BB_VER}
> -  if ls -1 ${BBS}${GRP}/${PKG}_*.bb >/dev/null 2>/dev/null ; then
> -    echo "PREFERRED_VERSION_${PKG} ?= \"${VER}\"" >> ${PREFS_LIVE}
> -  fi
> -  if [[ ${GRP} == "proto" ]] ||
> -       ls -1 ${BBS}${GRP}/${PKG}-native_*.bb >/dev/null 2>/dev/null || 
> -       grep "BBCLASSEXTEND.*native[ \"]" ${BBS}${GRP}/${PKG}_*.bb >/dev/null 2>/dev/null ||
> -       grep "BBCLASSEXTEND.*native[ \"]" ${BBS}${GRP}/${PKG}.inc >/dev/null 2>/dev/null ; then
> -    echo "PREFERRED_VERSION_${PKG}-native ?= \"${VER}\"" >> ${PREFS_LIVE}
> -  fi
> -  if [[ ${GRP} == "proto" ]] ||
> -       ls -1 ${BBS}${GRP}/${PKG}-nativesdk_*.bb >/dev/null 2>/dev/null || 
> -       grep "BBCLASSEXTEND.*nativesdk" ${BBS}${GRP}/${PKG}_*.bb >/dev/null 2>/dev/null ||
> -       grep "BBCLASSEXTEND.*nativesdk" ${BBS}${GRP}/${PKG}.inc >/dev/null 2>/dev/null ; then
> -    echo "PREFERRED_VERSION_${PKG}-nativesdk ?= \"${VER}\"" >> ${PREFS_LIVE}
> -  fi
> -  if [[ ${GRP} == "proto" ]] ||
> -       ls -1 ${BBS}${GRP}/${PKG}-sdk_*.bb >/dev/null 2>/dev/null || 
> -       grep "BBCLASSEXTEND.*[ \"]sdk" ${BBS}${GRP}/${PKG}_*.bb >/dev/null 2>/dev/null ||
> -       grep "BBCLASSEXTEND.*[ \"]sdk" ${BBS}${GRP}/${PKG}.inc >/dev/null 2>/dev/null ; then
> -    echo "PREFERRED_VERSION_${PKG}-sdk ?= \"${VER}\"" >> ${PREFS_LIVE}
> -  fi
>    if [[ -n ${BB_VER} && ${BB_VER} != ${VER} ]] ; then
>      echo "bump: $GRP ${PKG} ${BB_VER} -> ${VER}" | tee -a ${OUT_LOG}
>      echo "cp ${BBS}${GRP}/${PKG}_${BB_VER}.bb ${BBS}${GRP}/${PKG}_${VER}.bb" >> ${OUT_CMD}
> @@ -71,14 +49,11 @@ done
>  
>  sort -u ${DIR}/latest.txt > ${DIR}/latest.sort.txt
>   
> -echo "#`date`" > ${PREFS_LIVE}
> -
>  echo "#`date`" > ${OUT_LOG}
>  echo "#`date`" > ${OUT_CMD}
>  
>  cat ${DIR}/latest.txt | while read LINE; do
>    if [[ ${LINE} =~ \#.* ]]; then
> -    echo ${LINE} >> ${PREFS_LIVE}
>      continue
>    fi
>    #echo ${LINE};
> -- 
> 1.7.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


