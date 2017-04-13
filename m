Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD3E77D3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:46:43 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id h125so26896718lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=WrhBu5572j80Rux7O4Q/mLNt20AXIfZPV1sxugw0ILA=;
	b=NUyFEXnOAE50PxlUISnN0SpAcFJz3Fs1Gn1Kk2zBFgrhj7BZz4NC07PgEM91xUuEPn
	0VOhdSJllWz/oEbMe+2QxoLt/yS40nz/qIgiBn31qzW5CH1iTLl7WRJE2s4R3Vg07aMk
	Vuz/aK4fHX3rBlB833zhWPxLfQujG8DWc0dg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WrhBu5572j80Rux7O4Q/mLNt20AXIfZPV1sxugw0ILA=;
	b=Rlc1d9h9yAYxvcpjwJ7yyIWwqt7Oztz1Siqdlmn5fJjLGZLYZWClhxWRNdxc9SIudP
	DB5FT7z6XPFg+Rh6N1OydsfLXT0arvQycMoPgfwBbonovy1DtH3fMY/HcrYJmE0UrnHO
	KYTQSXHhgbT6Z6DKhlBJTuSK7iFZhqjbu37Z93SS03A9k5G/Rw2A+RZxbJx6ww9lbYVo
	F5rWKfKe1302SFDDeRmW7hh9mXuS+Pa7gRhKBWmYJPGwG5v5M6WpqumJyw66EqXrNgTP
	Q7NFyiUSLOQVAfSGpjB0WLSlKqh/vZgLpeOW/dT0V8xrcqskvKqUkJDDv5OAJeBpQDFc
	BeUA==
X-Gm-Message-State: AN3rC/4v7ecsg/UzcCSe8k8RItCLCwV9KmwVRbz6AnMj/xMKabeGZt3e
	9TQrTK+CMZmHtvmtD+DLdA==
X-Received: by 10.25.169.14 with SMTP id s14mr847724lfe.119.1492076804418;
	Thu, 13 Apr 2017 02:46:44 -0700 (PDT)
Received: from [192.168.11.27] (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	26sm4553972ljo.2.2017.04.13.02.46.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 02:46:43 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
	<20170412195638.3243-27-schnitzeltony@googlemail.com>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <58EF4902.2090906@linaro.org>
Date: Thu, 13 Apr 2017 12:46:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20170412195638.3243-27-schnitzeltony@googlemail.com>
Subject: Re: [PATCH 26/29] mpv: add PACKAGECONFIG for drm/gbm/vdpau/wayland
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
X-List-Received-Date: Thu, 13 Apr 2017 09:46:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/12/2017 10:56 PM, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> index 3f46dc1..60f653a 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some features wi
>   SECTION = "multimedia"
>   HOMEPAGE = "http://www.mpv.io/"
>   DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
> -           libxscrnsaver libv4l libxinerama libvdpau \
> +           libxscrnsaver libv4l libxinerama \
>   "
>
>   REQUIRED_DISTRO_FEATURES = "x11"
> @@ -24,14 +24,23 @@ SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f2
>   inherit waf pkgconfig pythonnative distro_features_check
>
>   # Note: both lua and libass are required to get on-screen-display (controls)
> -PACKAGECONFIG ??= "lua libass"
> +PACKAGECONFIG ??= " \
> +    lua \
> +    libass \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
> +"
> +PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
> +PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/mesa"
>   PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
>   PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
>   PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
>   PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
>   PACKAGECONFIG[vaapi] = "--enable-vaapi, --disable-vaapi,libva"
> +PACKAGECONFIG[vdpau] = "--enable-vdpau, --disable-vdpau,libvdpau"
> +PACKAGECONFIG[wayland] = "--enable-wayland, --enable-wayland,wayland"

Should it be:
PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland,wayland"
?

>
>   SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
> +
>   EXTRA_OECONF = " \
>       --prefix=${prefix} \
>       --target=${SIMPLE_TARGET_SYS} \
>


