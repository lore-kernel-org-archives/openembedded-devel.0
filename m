Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id B8BD37ED41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 04:16:14 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l21so2699926pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 21:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=erb84bFktFLDpxZCgcSqV1uSvFOVpdnkU8Lwqv6cdc8=;
	b=gONeNv/SnnxIzuKXC635GNuLO+PfrBPJkrLcKa75Y6WpD2uW2Fb3G08SpBtNcw+zRP
	D0UIaBc9IzAUNbH2g5LJ/8YiSCySorrZ4jVd9lqFGZheq485nmm70HQJBQRKOQx/m4VD
	2iCU3iaXkfM2TrVltoATYb64r7+WiVZ0biIDaqxaS10mInymdv+EEQKiIm1cQPcj0fS/
	/ixRPRpZjbijC6pGBOQ+wzW8py9uXk6ScvWp3V3ixkqbg5mGeNCvTUIBZbF8Vv5VEHA2
	OotLHlB3d1lDXxepG0rmHtSM0wdOIlUfeGiRfSgrMl4BQQW3tWHCTh2KrNCCeK94OJxX
	GEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=erb84bFktFLDpxZCgcSqV1uSvFOVpdnkU8Lwqv6cdc8=;
	b=sfKm2RT93q4Nx27h2E81WdKH8D0B2ezThP1AAE0BFGh0xkVYArfGRiqCekFCJOMnu8
	EoEA83p/FH0AQyFR1ySgzuMQ0XUEGohy2/CNjFop+/GPghuEBjCDBBgVzDEAZobmc1l2
	od1MPIyOhRrO/9jqjHs6s1SZOAL0gwBXM+yYXNVyBtH8OpQaOedB8xu/J+EwKvFF4nzw
	t1tYVkv56M8lF7vSluFHTSk0PWPZWbfliEhas/v1k3vxQ9b8/M01Gn/WOZvFzrn0B/s/
	OGGhyzdYt/llrQPpQ4De3L0ySz0LsO1krniH1ABPNPLdigIwnSbhlgVKInYL96vYHHkN
	xh1A==
X-Gm-Message-State: APjAAAXdR7m2qGcJpIkg2KruIxb6pI4p4QqkSBBQL1GEqB2DD2yPmRLN
	9W/dgs/EX/FbSWRayUR95F8=
X-Google-Smtp-Source: APXvYqwKTCgL2wlgJjHjJgH45kz6M/VpeF9/K9mp5xcTWPu2DlrsG1owfANqmAw8d4L5yFRtK2fXaQ==
X-Received: by 2002:aa7:9799:: with SMTP id o25mr39381463pfp.74.1566447375825; 
	Wed, 21 Aug 2019 21:16:15 -0700 (PDT)
Received: from [172.20.6.109] ([12.235.222.84])
	by smtp.gmail.com with ESMTPSA id
	u7sm21114054pgr.94.2019.08.21.21.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Aug 2019 21:16:15 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817081339.22253-2-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0935fc2d-42bf-2b2a-ff09-973a291343b9@gmail.com>
Date: Wed, 21 Aug 2019 21:16:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817081339.22253-2-schnitzeltony@gmail.com>
Cc: bunk@stusta.de
Subject: Re: [warrior][PATCH 1/4] vlc: rework qt PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 04:16:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/17/19 1:13 AM, Andreas Müller wrote:
I found this buried at the bottom of my inbox so apologies for
responding so late.
> * qt4 support is gone -> move to qt5
By support gone do mean, not supported by Poky or do you mean QT removed
the sources?

- armin
> * while at it remove noop libtool copy
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-multimedia/vlc/vlc.inc            | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> index 19ac8206c..9bbc6685d 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -36,12 +36,17 @@ EXTRA_OECONF = "\
>      --enable-realrtsp \
>      --disable-libtar \
>      --enable-avcodec \
> -    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
> -    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
> -    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
> +    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/moc \
> +    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/rcc \
> +    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/uic \
>  "
>  
> -PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG ?= " \
> +    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +"
> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
>  
>  PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
> @@ -54,7 +59,7 @@ PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
>  PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
>  PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
>  PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
> -PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
> +PACKAGECONFIG[qt5] = "--enable-qt,--disable-qt, qtbase-native qtx11extras qtsvg"
>  PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
>  PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
>  PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
> @@ -76,12 +81,13 @@ PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util
>  PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
>  PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
>  
> -do_configure_prepend() {
> -    cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> -}
> -
>  do_configure_append() {
>      sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
> +
> +    # moc needs support: precreate build paths
> +    for qtpath in adapters components/epg components/playlist components/sout dialogs managers styles util/buttons; do
> +        mkdir -p "${B}/modules/gui/qt/$qtpath"
> +    done
>  }
>  
>  # This recipe packages vlc as a library as well, so qt4 dependencies


