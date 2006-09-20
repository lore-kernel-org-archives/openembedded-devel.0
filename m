Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GQ234-0005yn-6X
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Sep 2006 15:23:34 +0200
Received: by py-out-1112.google.com with SMTP id i75so300215pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2006 06:19:20 -0700 (PDT)
Received: by 10.35.72.6 with SMTP id z6mr28497642pyk;
	Wed, 20 Sep 2006 06:19:20 -0700 (PDT)
Received: by 10.35.96.4 with HTTP; Wed, 20 Sep 2006 06:19:20 -0700 (PDT)
Message-ID: <74d0deb30609200619qa5e4972oa6642a4a4d73ea07@mail.gmail.com>
Date: Wed, 20 Sep 2006 15:19:20 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1GPih1-0005v2-VO@linuxtogo.org>
MIME-Version: 1.0
References: <E1GPih1-0005v2-VO@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev xserver-kdrive git supply EXTRA_OECONF_x86 since w100 xserver doesn't build for x86
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2006 13:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/19/06, mickeyl commit <openembedded-commits@lists.openembedded.org> wrote:
> xserver-kdrive git supply EXTRA_OECONF_x86 since w100 xserver doesn't build for x86
>
> Author: mickeyl@openembedded.org
> Branch: org.openembedded.dev
> Revision: f0737756bbfbfe54e5b782f6775b364ed83b8412
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=f0737756bbfbfe54e5b782f6775b364ed83b8412
> Files:
> 1
> packages/xorg-xserver/xserver-kdrive_git.bb
> Diffs:
>
> #
> # mt diff -ra682c5391a248c9727d17094fe5a8ea2e9236051 -rf0737756bbfbfe54e5b782f6775b364ed83b8412
> #
> #
> #
> # patch "packages/xorg-xserver/xserver-kdrive_git.bb"
> #  from [0086c9b6ad103fdd1c2291786635535bcd106081]
> #    to [4b79c674eaa33054940dce02a7d3bbd9f8e6bf22]
> #
> ============================================================
> --- packages/xorg-xserver/xserver-kdrive_git.bb 0086c9b6ad103fdd1c2291786635535bcd106081
> +++ packages/xorg-xserver/xserver-kdrive_git.bb 4b79c674eaa33054940dce02a7d3bbd9f8e6bf22
> @@ -1,7 +1,7 @@ DEFAULT_PREFERENCE = "-2"
>  PV = "1.1.0+git${SRCDATE}"
>  DEFAULT_PREFERENCE = "-2"
>
> -PR = "r5"
> +PR = "r6"
>
>  LICENSE = "MIT"
>  DEPENDS = "tslib virtual/libsdl libxkbfile xproto libxdmcp xextproto xtrans libxau virtual/libx11 libxext libxrandr fixesproto damageproto libxfont resourceproto compositeproto libxcalibrate recordproto videoproto scrnsaverproto"
> @@ -56,7 +56,7 @@ inherit autotools pkgconfig
>
>  inherit autotools pkgconfig
>
> -EXTRA_OECONF = "--enable-composite --enable-kdrive \
> +EXTRA_OECONF = "--enable-composite --enable-sdl --enable-kdrive \
>                 --disable-dga --disable-dri --disable-xinerama \
>                 --disable-xf86misc --disable-xf86vidmode \
>                 --disable-xorg --disable-xorgcfg \
> @@ -67,3 +67,14 @@ EXTRA_OECONF = "--enable-composite --ena
>                 --enable-tslib --enable-xcalibrate \
>                 ac_cv_file__usr_share_X11_sgml_defs_ent=no"
>
> +# w100 doesn't build for x86
> +EXTRA_OECONF_x86 = "--enable-composite --enable-sdl --enable-kdrive \
> +                --disable-dga --disable-dri --disable-xinerama \
> +                --disable-xf86misc --disable-xf86vidmode \
> +                --disable-xorg --disable-xorgcfg \
> +                --disable-xkb --disable-xnest --disable-xvfb \
> +                --disable-xevie --disable-xprint --disable-xtrap \
> +                --disable-dmx --disable-w100 \
> +                --with-default-font-path=built-ins \
> +                --enable-tslib --enable-xcalibrate \
> +                ac_cv_file__usr_share_X11_sgml_defs_ent=no"

Hmm, couldn't this be done with _append?

EXTRA_OECONF = "--enable-composite --enable-sdl --enable-kdrive \
                --disable-dga --disable-dri --disable-xinerama \
                --disable-xf86misc --disable-xf86vidmode \
                --disable-xorg --disable-xorgcfg \
                --disable-xkb --disable-xnest --disable-xvfb \
                --disable-xevie --disable-xprint --disable-xtrap \
                --disable-dmx \
                --with-default-font-path=built-ins \
                --enable-tslib --enable-xcalibrate \
                ac_cv_file__usr_share_X11_sgml_defs_ent=no"

# EXTRA_OECONF_append_x86 = " --disable-w100" (isn't w100 disabled by default?)
EXTRA_OECONF_append_arm = " --enable-w100"

Or even apply the w100.patch only on arm?

cheers
Philipp


