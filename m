Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6718479DC5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 03:39:06 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l9-v6so19666008qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 20:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AQSXoh5HlkDyVBxwuFfnt8z5BJzmOYwA4rhlbn3Z6BU=;
	b=U6HirK7PT3ZOiJxQtooAvvRa9lOJNLQFabyKalLWTDqeKNUmtr6MfdDv/0S0uIkXFW
	DS857a6/d8exhteDL3zpF0yKRL0veKJ1AMhoD409SZ18GM1p53oobnB49QMmXgmwio02
	gPoNXX7wVA86QLMdPvEmCB7DZ4wsfnt+/9NRmPAAiRbPlQe2acHoV2fvpLJc2PJjO3k8
	cvGX/PRnvv81CTjtuOpcR/GFOJWTFRB0fvvBEK7cd18hk9XxIEhWyPio2TjTM++Q4lkk
	D/ZB7n2NWAVyuCegp49cTGClSRdWpyCvltJ4VitTnsfVjurK2YZxW5DDpaOgWeavPZh2
	9JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AQSXoh5HlkDyVBxwuFfnt8z5BJzmOYwA4rhlbn3Z6BU=;
	b=UuNQFqU+/QdMO3bh0dxwuYYCPPE3/sQ2gQJkI6eD9lKXTWuelwf3wpfTzIhLmGUSlp
	OW+1FEDubdzdbwmmFIFhhDibSL/JBTpaazSi3qYOgk+uWMKo8c1nTiY3/ls+aUdur2MB
	rddByXTyH4FbVCG2ZvNhI10MgI3lf3Vhaz79OOz1WqzkEORzHFV+h4kVoq1kI1rH29xA
	4l1DqXxsxFyaAQUeqEBkTvBKmXPnvMVMikW3STXhwrUib9DrCdjzk5+aWvZOhqeePGlQ
	DC1H80yEZQVd7T4AfQQgt6iaF7nDqjgV0APXpgB4fpUdeoGsFrn8exL2PwwIm3FQaltZ
	DT8A==
X-Gm-Message-State: AGRZ1gLcXTboK9SkL4fhR3jdkXfIJsGI5NrcrzGv8Cu94mhxqOS9VbOa
	uRW9n+ou6Z5HbPqfIWtZaov35eITPdQ+6p0MUn8=
X-Google-Smtp-Source: AJdET5ddZAxqWXFy8gd9KF8ouES4O7WKqqOEtZLiiJGWPyk2eMvN7hk/D3pTVpGO267TwxSFWqQXTEhYH+4Ix/7aVGg=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr5083444qtc.236.1541043547001; 
	Wed, 31 Oct 2018 20:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Oct 2018 20:38:40 -0700
Message-ID: <CAMKF1soAH7v7WxRqn=Rao0HAJGpe=PzRdXo7uMjzSXkXMFWc7A@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: update md5sum and sha256sum
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
X-List-Received-Date: Thu, 01 Nov 2018 03:39:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 31, 2018 at 8:13 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Geolite database update periodically, md5sum and sha256sum
> have changed, update them
>

whats the change ?
its worrysome if it changes underneath without bumping version

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> index 4e717e4..e851c44 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> @@ -17,17 +17,17 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
>  "
>  SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>
> -SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
> -SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
> +SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
> +SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>
> -SRC_URI[GeoIPv6-dat.md5sum] = "e75b84a4044e81d6d4484e33816bc762"
> -SRC_URI[GeoIPv6-dat.sha256sum] = "a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e"
> +SRC_URI[GeoIPv6-dat.md5sum] = "84c5f225f371463d790270ea83a25765"
> +SRC_URI[GeoIPv6-dat.sha256sum] = "5767eebd655f0c06ac8066d0d4611b399ab623af42d71bac7f9478b193e77809"
>
> -SRC_URI[GeoLiteCity-dat.md5sum] = "4b6588d0bfe1af22e267ac90aa97f769"
> -SRC_URI[GeoLiteCity-dat.sha256sum] = "8a6467033a528f68b1a97de24d9d0ce86c8e8e83683820e16e433ddbd3f712f7"
> +SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
> +SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>
> -SRC_URI[GeoLiteCityv6-dat.md5sum] = "ad0cb42518af7f752499425dca0952bb"
> -SRC_URI[GeoLiteCityv6-dat.sha256sum] = "eda67f4204ba9fa5204a53cdb629167cca9394c712f5378bc723a8c29c0b440f"
> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "c195d5295f0e2f0391f1155ff31b6d09"
> +SRC_URI[GeoLiteCityv6-dat.sha256sum] = "b221bb34179dfd104fb5f0340c00a2b5ff751cc294640767170aa7b71215ae18"
>
>  LICENSE = "LGPL-2.1"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

