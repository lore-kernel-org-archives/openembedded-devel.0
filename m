Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE9B07F96F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 21:19:55 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e14so5411518qto.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3l/RX11wOixfqfC0rJhPmUw7X6mGYNTDz6rvXT+yP20=;
	b=b7XDN8rFWPwicNcxqR1e3NvhogpJYvEu3EiUoQDqB07hIJMfOS4cfkW1PQLDlYzhsk
	5UGjZXbjKh08iX+O+qX1SS1Glo7mQ60zt9Fx/p5wPxhtYKFXhULoy6KDc5cINPTaOlrE
	eIaDN0kL9aSRBdXcb8s9ONJBOOGB53K7AP16zuaXHNd7R0q94zrDQ49B/0X0Rbwjzkwz
	dUX3OmVLJtJrUuAWiVk9z72b0R1cgc/NIn8lvXOzrzfwnQbkRLhhxHT/Bk2ZgltjL9/c
	/L467KIIlvYoTyvoMqzHDJqgsoeNnXGGSW9EDVoCLRLqVNVbhKQdKl58PFIR0PgWo9hP
	9YkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3l/RX11wOixfqfC0rJhPmUw7X6mGYNTDz6rvXT+yP20=;
	b=qMH6BNd63wFuVCfathAHGuvuD3uetcJEhyfv69JIfmwkQWdgUdRvFOE0bz5qemRc1W
	eYCVWOucocRNxsIUuoWwI2VuSYzzPkLLdAs1haK+NzO51DRiyCjbUjfucIGcUHkzPtem
	1d4MUMmdrTlxCFcZSYcNSweJE1O+v+O+tH+AgIymu0WPKjKnXMLIRbfWdH5JUdUtt/ku
	AiGa15SUxTBEzQqYOT9sPMZf2utFHhEakHfBzw63xb2XTy4FomHu6rnKAGMVqecklKXC
	pTr9K1K0rDkN+lS6g3Ocnc8a6YgIoKmucJznsZfufM5RlwzBaTTcQfoPuW4gUd02VTI5
	cOCA==
X-Gm-Message-State: APjAAAW1Fz3o//2oTTdhXECIKrXi5uQdrbgSOvRfXwMewFxPV14eevtm
	IvXcsdvNEH5KQPyQjKaLkvyWf9Tv/qeiYQGoIL4=
X-Google-Smtp-Source: APXvYqwDFT7XGG69aEu9fSv9OiwwZi9rL9/V5JNEoGbD7rM3i6WeVzuhBZUghxxXtMoAD1xFHB7hfoN7ksc0A3HAkKY=
X-Received: by 2002:aed:2724:: with SMTP id n33mr2261080qtd.194.1572470396400; 
	Wed, 30 Oct 2019 14:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <1572422730-16094-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1572422730-16094-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2019 22:19:29 +0100
Message-ID: <CAMKF1spBXxQX9=qOhuC-zCXvx5sdehTVE7fF+whjA59unBGEjA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [zeus][PATCH] packagegroup-meta-multimedia: Remove libsquish from rdeps
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
X-List-Received-Date: Wed, 30 Oct 2019 21:19:56 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Armin, this patch is already in zeus

On Wed, Oct 30, 2019 at 9:05 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> libsquish builds a static library alone which is primarily used during
> build only. There is no runtime component to it.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> index 365618d..cef45f9 100644
> --- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> @@ -27,7 +27,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
>      fluidsynth cdparanoia vorbis-tools tremor caps libao libavc1394 \
>      opusfile gerbera libdvdcss webrtc-audio-processing \
>      rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
> -    ncmpc libmpd libsquish dcadec libiec61883 \
> +    ncmpc libmpd dcadec libiec61883 \
>      ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna gst-fluendo-mpegdemux vlc", "", d)} \
>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265 gst-openmax", "", d)} \
> --
> 2.7.4
>

