Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8067F525
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 01:47:04 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id r6so64358207qtt.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 18:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kbs4T4r08hoChPjMgUVomAq/YqQznIbLJU5XCZsS73Q=;
	b=UzDy2ZiJEKXkhIdy6x3T5KkhrF8P/0w6DKl8UbjBc4IFcmPdH8+PwUgMxAd0Grpsjl
	0A/zLansF+NwwhPJmi6bVuvW/atN34bR2GrezLgte8bQiW5u80212dwWMQQ8/ZrpZqxV
	0Ry1gOPELNR9ChqTbT83py5o8jEA7qGR7qqth4YT0JGf9mPrZ+YVClYeb9bbAQGxZ3Yd
	i9fw9xMgJu5/mH84x9LDhtrhi1+lMQL66gA6zRYeka5PKR6AX6ZoB+T3ETmBF3Ythzw1
	hjihpRO0sgZCI8/BI7vOkJETbnwOXeB5zK4sb4Jpk606uPrgFesmU7MalY4Bp+vG6cLV
	zLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kbs4T4r08hoChPjMgUVomAq/YqQznIbLJU5XCZsS73Q=;
	b=M3mqUoHeTIkDueo3JbQL6HUn0nfAiQZwdOermdGhlceNwpqusDxxy9Z30dvarAfdD/
	ooznG/JZvSJuzmLbbUdpdb8B9lJXRzQb4lKkt4j5rAz/lwZRxqJwmWBuFy0mMw23DGJx
	m9pY79Po1ZvxI8l2f8lloRNMASaaHpG80nDFp+73uG+bwXUTVZ8ggMAJe/PaU+RMoOgn
	i1BQn4zs9uefHxa9idjC2z9qJh9W9IYxWidcrqNNw3q7yaH7Wi3A311Y7bPNdEMB63Lo
	Dgn61y/+APczZubb8wEw/GAccrVnvUV0pSX1Tygd4J0UZ30FvxabDnE20T+QE4rSmJgw
	sCpA==
X-Gm-Message-State: APjAAAXLzfNfDZ9xlxAynNDlYQX6Xl5uiqpDyrtuquaqohSj61Ize2cj
	sxGp8O42DUe7AiNdrd/8yKZsVTZXI8XmNgQN+O/yeGwP
X-Google-Smtp-Source: APXvYqyhSq1U1dCx0cmda1h3Ul7AF6s8Y20GezWznHdG8mENiyuDkEW4TJjVH8eQ2j8VjLqDNgnSvWnH+h+nj1S0ZbQ=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr86053571qtr.194.1564624024760;
	Wed, 31 Jul 2019 18:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190801013541.4698-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190801013541.4698-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jul 2019 18:46:53 -0700
Message-ID: <CAMKF1soM1L0-CNHH3i+emfXawDm-BMcPT7jfM+9+28jHUQkQsw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] openldap: upgrade 2.4.47 -> 2.4.48
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
X-List-Received-Date: Thu, 01 Aug 2019 01:47:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 31, 2019 at 6:36 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../openldap/{openldap_2.4.47.bb => openldap_2.4.48.bb}             | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/openldap/{openldap_2.4.47.bb =>
> openldap_2.4.48.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.47.bb
> b/meta-oe/recipes-support/openldap/openldap_2.4.48.bb
> similarity index 97%
> rename from meta-oe/recipes-support/openldap/openldap_2.4.47.bb
> rename to meta-oe/recipes-support/openldap/openldap_2.4.48.bb
> index 4345d7d..ecc219d 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.47.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.48.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
>  # basically BSD.  opensource.org does not record this license
>  # at present (so it is apparently not OSI certified).
>  LICENSE = "OpenLDAP"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=25b4ead0e45182e7c2914e59ff57009f
> \
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ad914c35f97b468f421f8ac0f3d821f4
> \
>                      file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
>                      "


Can you mention why this change in  commit msg please

>
>  SECTION = "libs"
> @@ -26,8 +26,8 @@ SRC_URI = "
> http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>      file://remove-user-host-pwd-from-version.patch \
>  "
>
> -SRC_URI[md5sum] = "e508f97bfd778fec7799f286e5c07176"
> -SRC_URI[sha256sum] =
> "f54c5877865233d9ada77c60c0f69b3e0bfd8b1b55889504c650047cc305520b"
> +SRC_URI[md5sum] = "0729a0711fe096831dedc159e0bbe73f"
> +SRC_URI[sha256sum] =
> "d9523ffcab5cd14b709fcf3cb4d04e8bc76bb8970113255f372bc74954c6074d"
>
>  DEPENDS = "util-linux groff-native"
>
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
>

