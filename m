Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C185F60107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:39:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q128so2105019wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mTaVeXBZyOp/pWnkRbi4YLek1p+BWs3mYyhjUNDQPxI=;
	b=CrplDVkaA+tdlEAqtFXLB5oBmF+djFBvqVqX6X2/loKBwXOEz/Bh3/JVnfgrpdvPc3
	qSF86zsqOz5C+qqza/PAqJMlSk5hk5sgfLFkkGorxbHuuOJLSrkjem6EAm2quO/PFdxO
	EtkB/3U3FCpsHqnmoBmheGGOkI7ZEGo36wUxPHdeNnwerxTaG8m3ZGWdP4YwWFyIYoKc
	zOjrat+kWTKGh5sldlKL0dgUB2QO/K1PQ2ortRzqBB8RGGA3L4miWSy62cixzd8Xl0y3
	gXqQMo8pkkWI94jnfF9E8xnV1+63PrikEAiwB8emO5uT+yZFv76pi8S2+s/r+6ad5ke1
	bC/Q==
X-Gm-Message-State: AE9vXwP+5cYj96fp0oLyvAoGeUeWWvB4UfUdIGOxwLLF1VHjmG+P3S4Cj509dvs+8fx/TQ==
X-Received: by 10.194.175.170 with SMTP id cb10mr2309982wjc.17.1472546369464; 
	Tue, 30 Aug 2016 01:39:29 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	us9sm38310586wjb.43.2016.08.30.01.39.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Aug 2016 01:39:28 -0700 (PDT)
Message-ID: <1472546366.8449.19.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2016 09:39:26 +0100
In-Reply-To: <20160829205253.17988-1-Martin.Jansa@gmail.com>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 30 Aug 2016 08:39:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mo, 2016-08-29 at 22:52 +0200, Martin Jansa wrote:
> * since last changes in oe-core LICENSE variable needs to list all
> licenses used
>   by individual packages otherwise bitbake warning like this is shown:
>   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
> plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses (GPLv3)
> that are not listed in LICENSE
>   as possible improvement you can set LICENSE to GPLv2 to all plugins
>   which are GPLv2-only, because now they will "inherit" both GPLv2 &
>   GPLv3 which sucks as described here:
>   https://www.mail-archive.com/openembedded-core@lists.openembedded.org/ms
> g81645.html
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-
> oe/recipes-devtools/geany/geany-plugins_1.27.bb
> index 9a39150..5e1e721 100644
> --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "A fast and lightweight IDE"
>  HOMEPAGE = "http://plugins.geany.org/"
>  # majority's default

     ^^^^^^^^^^
To avoid confusion, it'd be good to remove this comment as well as it's not
only the majority of licenses anymore

Cheers,
Andre'


> -LICENSE = "GPLv2"
> +LICENSE = "GPLv2 & GPLv3"
>  
>  DEPENDS = "geany lua libxml2 libsoup-2.4 vte enchant intltool-native
> libassuan gpgme"
>  
> -- 
> 2.9.2
> 

