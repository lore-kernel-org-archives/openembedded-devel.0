Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9C84960746
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:24:14 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id l94so20394593ual.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=z/UjdKL8czDvxq5liJnoejxJj1+0a1gxLtS/J5hwgO0=;
	b=PYYL+vIOj93LFG829+zf4TDsLLIfj9p1fFBSzq5t+PHPt5/e/F7PphI0KErkhMbj+q
	88fnmYuhnxlFvJMixjnL6KPtt0pVMgfiXWUbeQSiU0Ul0xoPkLMyRSPcX0xSml0qe1gq
	1jug74HJ2roSvl6nHuLtfMpEaPxAd4C7Rqv9DQ0LSF+eZG3V6lnA2iTDeOULomARmN7q
	odxoo83tJuBCLzEWfKwoDtF9aDPls73ZPCysQev58nrRJXcNgGMM5qc921L8KFkhUdHG
	fSe+T15fcCw2q54wpv45yAmNCOtGrT3YFsj2xQkl8HZvl40pdC24QvdgWdzXMMz2+q5O
	vfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=z/UjdKL8czDvxq5liJnoejxJj1+0a1gxLtS/J5hwgO0=;
	b=MmxYPSrTtKYl5d0W1wSpMDGIQHNqNlfxbHMNG37Ov2p4RypYO4eAhLO5qsCNlhy8VO
	GMBJoOh+eUUoc2hlphnqC+v+wnWy6kw6sbKsgiEKDFfVY4bEOOkPCk7f9t3D3hYSyLOr
	w09RXVL1D16Xru09gz8dffA0K8vW65fpQhXeB2xLUgjf1rcdbXnQ0Z2RTmRncURr2y9o
	vWkhObItuvCJqMrARVx4eQA+LZ3wY93YTewudOo5Jz5aGaJ2WkG4IUXiCvme9gHXaxiE
	UEw/s8lBQJv8nxSQ3qjF4F5pBARhYskOnO0vliNmYFHMOYd+OHHd0oC0ecDzTl/hb8ax
	yviQ==
X-Gm-Message-State: AE9vXwNEC/LM3eykOdLGUf2CbeSshNQAvBJJN6KUJ6K4puUMYmWwYluQ3VS2NKh2uQ6K96o2EKR4Pkz4MrOsTw==
X-Received: by 10.31.21.79 with SMTP id 76mr1326217vkv.135.1472545454588; Tue,
	30 Aug 2016 01:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 30 Aug 2016 01:24:14 -0700 (PDT)
In-Reply-To: <20160829205253.17988-1-Martin.Jansa@gmail.com>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 30 Aug 2016 10:24:14 +0200
Message-ID: <CALbNGRQ=PeJhSCj7uGd2Lgkx6MPZ8numfrLezWxH12x_1fSkOQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
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
X-List-Received-Date: Tue, 30 Aug 2016 08:24:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 10:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * since last changes in oe-core LICENSE variable needs to list all licenses used
>   by individual packages otherwise bitbake warning like this is shown:
>   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses (GPLv3) that are not listed in LICENSE
>   as possible improvement you can set LICENSE to GPLv2 to all plugins
>   which are GPLv2-only, because now they will "inherit" both GPLv2 &
>   GPLv3 which sucks as described here:
>   https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg81645.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> index 9a39150..5e1e721 100644
> --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "A fast and lightweight IDE"
>  HOMEPAGE = "http://plugins.geany.org/"
>  # majority's default
> -LICENSE = "GPLv2"
> +LICENSE = "GPLv2 & GPLv3"
>
>  DEPENDS = "geany lua libxml2 libsoup-2.4 vte enchant intltool-native libassuan gpgme"
>
> --
> 2.9.2
>
NAK: The warning is wrong see recipe below contains

LICENSE_${PN}-commander = "GPLv3"

Andreas

