Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 69F357D91B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 17:57:40 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id c1so4034492qkk.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eOqhxJYpnYjd+rLaNkpJdl2apavKwiuJekzyLU+bhx4=;
	b=QLeJpY7lZTQdD3nobIVgztov04qlWZjzsuS32BWGe4IvFZM/eIXI4gYk5fsh0ur8qX
	tHlMmi589fQ117PopD6lhaLZtotZFFZWCwudKIewe7Y48Pn9MWWaqhMXXaM7JHGfOJ5S
	Yn72vz+hJ02w9u3P/pyN0HrlEF9Qpk5I6gpLHJI5WDHwGRnhGXAcULR8V+y5H3/wWtoM
	ZU3BbP/1FP0ipCTY5S+Kl20UfnJlOnLzmmvAXT+YGI83UlNld+EyXIkY0KQaNt32wOaD
	4IVqABiDQMLv4g/gDUD4/6gOgfoFk6ErgYWDRmUm8G7+JAD9aEOhBFMHrMfTWfBO3wfv
	aC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eOqhxJYpnYjd+rLaNkpJdl2apavKwiuJekzyLU+bhx4=;
	b=iuJjp3xibYZO4FMb3zsHaAa2xXFhbhb8RuLQGJ1/dljkVeBDGyOQCQtBQdArihbWRt
	iIsMJwTQpQaBh80DKHJ+D5cWtZerB6g2S1txbMVVf1C8RAJSBUq3T/F8rw5cEip0EJFO
	IpvdPz5/xQR6Sl9N/Ps4j+y6R8OIkQoQWtySopXLmdRGBSMy3paS/fR16uKm6AaiQO/1
	n3UaNPUWpI6P1TpSxYljvHPvhee6aetb0kHhGySVBPxcDDtf+zPLUcL6Ib708oA9GDaT
	LuxZVdzbZMPNvZYzSMt0rool6yGRDDV22pbU3eGiLeqaMsSlYznYDSMvAx+20Uk6Y0sn
	udKg==
X-Gm-Message-State: APjAAAUZyk4lkSieNQAGUvQ4Bn5JZ7KF8DfcLTKPX+wQNGyOxXREUb+d
	7jm1FXoq7nl6o2fM7pigzakxZ3ejGjUXrisAE8Uqel6B0pw=
X-Google-Smtp-Source: APXvYqxmqTrImtIgakLujY3aksPnAHP2ZB8hEDa2KjuTpqkNjLARLuhpv2GMOurrfZSKxbW5Fjo88zX1tRYS4XbrN4Y=
X-Received: by 2002:a37:a208:: with SMTP id l8mr40864492qke.210.1555005461059; 
	Thu, 11 Apr 2019 10:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190410084221.8868-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190410084221.8868-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2019 10:57:15 -0700
Message-ID: <CAMKF1so9Z2kf=pmqDQfd2UCmdux-zdaC1uFjw_UmUx30TkHnAQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-certifi: upgrade 2018.8.13 -> 2019.3.9
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
X-List-Received-Date: Thu, 11 Apr 2019 17:57:40 -0000
Content-Type: text/plain; charset="UTF-8"

Upgrade p3 version python3-certifi as well

On Wed, Apr 10, 2019 at 1:41 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-certifi_2018.8.13.bb to python-certifi_2019.3.9.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-certifi.inc        | 4 ++--
>  ...python-certifi_2018.8.13.bb => python-certifi_2019.3.9.bb} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-certifi_2018.8.13.bb => python-certifi_2019.3.9.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
> index c7955c57d..9d99b3475 100644
> --- a/meta-python/recipes-devtools/python/python-certifi.inc
> +++ b/meta-python/recipes-devtools/python/python-certifi.inc
> @@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
>  LICENSE = "ISC"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
>
> -SRC_URI[md5sum] = "a84571995a209dcd00a1702a74302b88"
> -SRC_URI[sha256sum] = "4c1d68a1408dd090d2f3a869aa94c3947cc1d967821d1ed303208c9f41f0f2f4"
> +SRC_URI[md5sum] = "76381d19d0a1171fecb2d1002b81424e"
> +SRC_URI[sha256sum] = "b26104d6835d1f5e49452a26eb2ff87fe7090b89dfcaee5ea2212697e1e1d7ae"
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python-certifi_2018.8.13.bb b/meta-python/recipes-devtools/python/python-certifi_2019.3.9.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-certifi_2018.8.13.bb
> rename to meta-python/recipes-devtools/python/python-certifi_2019.3.9.bb
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

