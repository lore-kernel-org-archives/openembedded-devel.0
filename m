Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A1C6460451
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 19:39:44 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t3so1752450pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=1aKvx7DFAp7B7BXyUGV7pe5mFobFK7DeQRj6WAZd6Gg=;
	b=P6XhX0yKpxhoru3gErozenDpc8qWVXUN2EnlOkW4ajbSZqjK8Bk4bY1G2IWOiqYtJH
	DNnhWarFbAkZbWZ17iKRH4iWPWTt8cfb5MrcgVWyQIUQ2Ja2Zvdzheq9c32weCC9LIfN
	K2k4JSYFi7QR2rFUQ6yUBl4k49Ut5RTy7VdhHOwQP4sqCs6JBW47A9sd1f4zcCmuAlHE
	/xwamaaIMJ0ljswka7r1jCsM5UOZxY3CyGYyb3254zNPJ70kASlThPaqVNTDqtxaA66Q
	hO/UkIQQ5Jpn2tyiPmJpf3uhJFXwnx7o7OXgjs7OAvOAXhXV9UEJzj2lGpT7x67tN7AW
	jM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1aKvx7DFAp7B7BXyUGV7pe5mFobFK7DeQRj6WAZd6Gg=;
	b=cDc3aNZNZH1NI6wJ4mBFdMa8lgiN6x1yO7tvFpQeUpYqnYnB5HiUjw/DhI6FEJl11R
	DfIwClcN2/irNE4x69wloi0dGPy3Zl/RIQeZnKiWXWv4Oy0fwPwAUwtaALr4ANSWGwCl
	lqVytQy9Iw7dD5o0xJzbiYVK9TgNs70mW9VjDlhyMzMRcBVBjCgOBJy/zTI9ZRPmsmF1
	NMehji14HPSZC+zyjq3bktJk+JhumSrm9slqzlhjSmzo8jn7ompMdzE7rOnxmnggZ32i
	ItPLGJQ69r7yOVNyec2Ze2xo7djJJ10pjlwWA0SO80b2MMHlAp/BASvd813V5vOzgqLc
	6oOA==
X-Gm-Message-State: ANhLgQ3i5MR4C6PB2xkF8BP6nxstTtZ8ry93iUpJvIPO/j+itN/ugW4b
	FjsqsSImfnbmUfmmCwqN2IeEPEmY
X-Google-Smtp-Source: ADFU+vun2WLfB7tFIk0lAOevgsYWnPiN4tQ9sFwm+mdzuujTnXNehA/fXCDul+gYSRPZxsDEvsdRrg==
X-Received: by 2002:a62:1513:: with SMTP id 19mr4336622pfv.85.1583955585439;
	Wed, 11 Mar 2020 12:39:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:60a5:8a88:a7f9:d809?
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	v133sm41329572pfc.68.2020.03.11.12.39.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 12:39:44 -0700 (PDT)
To: Sakib Sajal <sakib.sajal@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20200311191148.77027-1-sakib.sajal@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6edd37b1-c032-c6b3-fc8c-3d7b3e82a294@gmail.com>
Date: Wed, 11 Mar 2020 12:39:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311191148.77027-1-sakib.sajal@windriver.com>
Subject: Re: [meta-oe][PATCH v2] openjpeg: Fix CVE-2020-6851
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
X-List-Received-Date: Wed, 11 Mar 2020 19:39:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/11/20 12:11 PM, Sakib Sajal wrote:
> From: Yue Tao <Yue.Tao@windriver.com>
>
> Backport patch from upstream to fix heap-based buffer overflow
>
> Upstream-Status: Backport
> CVE: CVE-2020-6851

Applies to Zeus too.


>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Sakib Sajal <Sakib.Sajal@windriver.com>
> ---
>  .../openjpeg/openjpeg/CVE-2020-6851.patch     | 32 +++++++++++++++++++
>  .../openjpeg/openjpeg_2.3.1.bb                |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
>
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
> new file mode 100644
> index 000000000..9f2fc901f
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
> @@ -0,0 +1,32 @@
> +From 024b8407392cb0b82b04b58ed256094ed5799e04 Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Sat, 11 Jan 2020 01:51:19 +0100
> +Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
> + coordinates are beyond INT_MAX (fixes #1228)
> +
> +---
> + src/lib/openjp2/j2k.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/lib/openjp2/j2k.c b/src/lib/openjp2/j2k.c
> +index 14f6ff41..922550eb 100644
> +--- a/src/lib/openjp2/j2k.c
> ++++ b/src/lib/openjp2/j2k.c
> +@@ -9236,6 +9236,14 @@ static OPJ_BOOL opj_j2k_update_image_dim
> +     l_img_comp = p_image->comps;
> +     for (it_comp = 0; it_comp < p_image->numcomps; ++it_comp) {
> +         OPJ_INT32 l_h, l_w;
> ++        if (p_image->x0 > (OPJ_UINT32)INT_MAX ||
> ++                p_image->y0 > (OPJ_UINT32)INT_MAX ||
> ++                p_image->x1 > (OPJ_UINT32)INT_MAX ||
> ++                p_image->y1 > (OPJ_UINT32)INT_MAX) {
> ++            opj_event_msg(p_manager, EVT_ERROR,
> ++                          "Image coordinates above INT_MAX are not supported\n");
> ++            return OPJ_FALSE;
> ++        }
> + 
> +         l_img_comp->x0 = (OPJ_UINT32)opj_int_ceildiv((OPJ_INT32)p_image->x0,
> +                          (OPJ_INT32)l_img_comp->dx);
> +-- 
> +2.17.1
> +
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> index ffd4099b4..4045148dd 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
> @@ -8,6 +8,7 @@ DEPENDS = "libpng tiff lcms zlib"
>  SRC_URI = " \
>      git://github.com/uclouvain/openjpeg.git \
>      file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
> +    file://CVE-2020-6851.patch \
>  "
>  SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
>  S = "${WORKDIR}/git"


