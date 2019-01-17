Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BB8A56C3E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 03:19:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e5so9801704qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 19:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hOPsoaDhLsd+XGnzeE49+174xTHkMSwTrL8cYnm1SUQ=;
	b=gJz7/bioyCD88x9BOkByfd6OqYPAmxZRwgl56eUUprQCm7Wp8vSvL5E8jBlM7dF8C0
	cKINKVSgxbPnpCWQM4UKSziAL7Z0tuQiaHiYdW8Hok0j4pCx8BKHWf4HkP70S6qceFLc
	EptrCvFgjyAEJyajByM+Li/4jYqCR8gpB79n9UgnmHYdCN1T3qYJi6xDqHdYbyk7su3X
	z8L9U88puhPbdaLfAAueQ7xV3zOQPTKFK9mJfU5Rkf0mf+dAnU36OwQFyUTwWYeb8RmF
	mDLu//a6bfUrpzvjg2i7tHZVtX9LdE91yJTcW9O120+czqwjmOAML2AnRANipQ0KnIQT
	Ci9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hOPsoaDhLsd+XGnzeE49+174xTHkMSwTrL8cYnm1SUQ=;
	b=hlCKm3KIE3W6SD+m2AKhZfbqe9qidrKoM6n+H4eHLgztafALZsWJVFIsC0K3lpxyKq
	d8Zg5P/lgY8Q1pdDBoIdQ5xGMLmPOewezOW2425BlnSn9zUnuzD3nE+eBxPICnrqejVL
	o/OvkbtKFffJnp2Y/psSbbwFN2mFDFKg/CdloLDahRVCdKEyN/J0tBKO3sF6y6oBrLrx
	Fy6p+kCP0i1jOSVS46wUwb9gS7YB4V+0xafuXpIWoi9JTy9MYiZfQakP1uzZkl23YEYN
	mdKxyVx4ELiZ0ChuKlSTqiTky5UYTwsTrL8XidoINVlKHFnH78wUXiGwTEVj/tbeKuXp
	UYnA==
X-Gm-Message-State: AJcUukeh2/yl5cTr78dkUgBMqZGZ86e8hRhQrLqxgcgkK0rkrYLfhBwG
	5jRfxfAxGupmKTnBnqs6ZwtCGmLpwRVZIGTDbBzHLYrU
X-Google-Smtp-Source: ALg8bN46ZJVonigCZCh8ZFDz3FYsym3uEiqegU/jBhrJ7OV0j7EmnKybAn0vHVSFKyOrd++EaJO22cwXS6Byf8SOs+Q=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr9815407qvj.228.1547695161284; 
	Wed, 16 Jan 2019 19:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20190117003705.21635-1-alistair.francis@wdc.com>
In-Reply-To: <20190117003705.21635-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jan 2019 19:18:55 -0800
Message-ID: <CAMKF1sr50E46tyvQ5ME_02dA_40A=6CHYOoE6jNUi2xoLYU8zA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xorg-driver: xf86-video-ati: Remove x86 COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 17 Jan 2019 03:19:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 16, 2019 at 4:46 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> The ATI drivers can work on non-x86 platforms such as RISC-V, remove the
> x86 specific COMPATIBLE_MACHINE requirement.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> index 969c1a0a6..b38fb6592 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> @@ -12,8 +12,6 @@ DEPENDS += "virtual/libx11 libxvmc drm \
>  inherit distro_features_check
>  REQUIRED_DISTRO_FEATURES += "opengl"
>
> -COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> -

Lets just relax it enough to include risc-v,

>  SRC_URI[md5sum] = "40e7c0a5a69aba3d84e0958f58705ea7"
>  SRC_URI[sha256sum] = "72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b6c1886b81714a0"
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

