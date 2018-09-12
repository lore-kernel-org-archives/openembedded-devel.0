Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id C2B3660110
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 04:57:55 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id m13-v6so642228qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 21:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WIaIleyHAbqTZS+DTMPusKllTAfnY9O+A46naND989k=;
	b=eTet0uCQdPtyv6E2UdDH3e4klve3w2LXBbeCPTR7TGRV0y7Q1t3qitDor4av0Kmvje
	2ubY8Ay1/W6Z2SRc1zf6PyfsWAOeYwLzM9Y0j0NY3teEFYPVRE1ks5xTHT57Cl+HEvO7
	xayLLfF6mJ+d7vRX2F2i38Yc5BbgS3MeekifcYMTSzwvVBFPJj3/lof+0p+s8zPxXWi+
	Er7DrNu16E+N48p98oc735ZLT5HwlwrtMJbo1xaJdAn6HmR2MhzcdPOYkTEjVkzbcCzu
	05rheH/xSWutVZbPfKiVn1K4peBdUm2As7f4/B6sfgHGbINeKQW0V1M52HtXk3iXn0Rp
	GK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WIaIleyHAbqTZS+DTMPusKllTAfnY9O+A46naND989k=;
	b=ZrY/neiv2RTTJPNDjXIlr8yskUI+H+7C/MdwzSSLOpViABR6DO7MOKvNZY39E62xqc
	ynIkguCNhoAMKP5HELlULgOZ5MUlPr/zFkZxgl69dSUZ2YA7xvp5pb43ex7rSOqdNN5L
	P30fGauRkgE44iZRJNC7SkXBVDqHCm4STzTV63y1O4r5SWFj8/FoVI1viNdWBRxJcgBC
	0egOYcnJlih/wSHqP3BU7ceGxYW+19vAIkMbcS3o6ZsF2HkpFGncarG7DRcgNdUUiTCH
	nW9tGNLcbDlOkH+36sdcskxZwThqVACmiRhcRRrWrup7zl4wy6stnGUVv6Wa7Aa8NCq9
	2dlQ==
X-Gm-Message-State: APzg51ByGzB9NYTbRjvDQ/0BXtP/fcEU1BlxGIAsAFn20wPhTFJWDR9Y
	gEGE+JggJh8dpxOv/HYvUUFCmqGji1Gg0sK9lwwInQ==
X-Google-Smtp-Source: ANB0VdZ0IPreyEW0spQz/kKKsAs2YrudXbaEMpQSp7AIPHkQPCdGjmYGyd1MJr/DFOmZsOZ1eyxI4pVcC/2aTFkky0A=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr71469qth.314.1536728276099; 
	Tue, 11 Sep 2018 21:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180911093050.25992-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180911093050.25992-1-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2018 21:57:30 -0700
Message-ID: <CAMKF1sqqsQyBavuDnjDrzgR_1JK55KQhS1TdLzUQf9A+ppdQXQ@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH] python-greenlet: 0.4.14->0.4.15
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
X-List-Received-Date: Wed, 12 Sep 2018 04:57:56 -0000
Content-Type: text/plain; charset="UTF-8"

Please update the python3 version of this package as well and send a v2
On Tue, Sep 11, 2018 at 2:31 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-greenlet from 0.4.14 to 0.4.15
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-greenlet.inc               | 4 ++--
>  .../python/{python-greenlet_0.4.14.bb => python-greenlet_0.4.15.bb}   | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-greenlet_0.4.14.bb => python-greenlet_0.4.15.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
> index fcd81f6..c7c656c 100644
> --- a/meta-python/recipes-devtools/python/python-greenlet.inc
> +++ b/meta-python/recipes-devtools/python/python-greenlet.inc
> @@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                      file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
>
> -SRC_URI[md5sum] = "a87b6028c3b742b210bf5973939db595"
> -SRC_URI[sha256sum] = "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
> +SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
> +SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
> rename to meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

