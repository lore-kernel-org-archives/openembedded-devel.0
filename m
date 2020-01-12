Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 65A4E7F513
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2020 16:20:53 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n15so6984945qtp.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2020 08:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Svq8SZzXy3LYTit2T25/TJRcuuvuvfuRdJiwqvJueRM=;
	b=pR6CfDl/lqKz1DWOfyDBkoSvDo1LCrTNUkbAeNGtWl2TjbkkK2RUTJ4iON//173w0O
	l1Cy2EtTlM0+9LfUWKXubaiKhjboMrB+b9t5kIt62mB4WBvLjXQj3GzqUOFaSzYsUpmA
	dkVgipkGRJ/mW+ytYhPL04ydT0TDFC7k1tmOR3t5POWTLxpivl5QfDQx6ygadp+IvZdq
	OvStMq2TZje9Eyc/qPgQGlphY+a9T5LmTT56Gimr6EQzHDNwt2po9omzfb82EQWuypmZ
	herIKbg59Y9PNYRQqvTSH+nKTFbou2oIXwRladZOuYbp5IiRBwxyMDYXc6ZCHjzUCucV
	OUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Svq8SZzXy3LYTit2T25/TJRcuuvuvfuRdJiwqvJueRM=;
	b=Lx5TGpvEPlsJOrj2Yi1pfJ3REBLWxTSXtrbWCumLD1i1OO/GuSldAH5y5+dRVey3C2
	cR8+HIIz7mbldThyh+1QtDoFEkAzD1CTXDmmqmBHNLdpE2LqAJqI2DPOGEflBpqkTmul
	BR82aUiSmkhW3egcOLB3SDrMolAqlQaAAwvAaAlyjSfnZjrgOFcev0JLtDToRH3sIjF7
	e0sRB6uvzMv5sijsqb8YaS8skR8ReCpBIt2nW7y5UEBa4MB1IOMilaqN5cq3i4TJUilf
	p8VsbLddfPco8xgmokXTd93pKsGt27uJRG6KfEacrUPkZ3mvEPntK3KZRUML4CrHN6aL
	lllQ==
X-Gm-Message-State: APjAAAU3+vMFbODayifgs9Xaog3RfK+TGhbYnwUIPyRV+Xihfdu7/L/5
	1kBBP+y610PJNNwAzACJHkoU8Fn6/LAZL3UUAoA=
X-Google-Smtp-Source: APXvYqxrsiLG1ogh5pumewD6wKB3QDhRf15+vVF3L3CxhifI1Qf8RU6m6V/eBX89pm3LHdcz10XNSFpti2I7gKMppEg=
X-Received: by 2002:ac8:145:: with SMTP id f5mr10754377qtg.194.1578846053921; 
	Sun, 12 Jan 2020 08:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20200111124404.3001-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200111124404.3001-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Jan 2020 08:20:27 -0800
Message-ID: <CAMKF1srmyvV-YKkddwO7i=H27VhJDLo+oJwvxMVepaHE4nUrUA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] proj: upgrade to 6.2.0
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
X-List-Received-Date: Sun, 12 Jan 2020 16:20:53 -0000
Content-Type: text/plain; charset="UTF-8"

Martin

This seems to break libspatialite

https://errors.yoctoproject.org/Errors/Details/306125/

On Sat, Jan 11, 2020 at 4:44 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../proj/{proj_4.9.3.bb => proj_6.2.0.bb}                 | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-navigation/proj/{proj_4.9.3.bb => proj_6.2.0.bb} (54%)
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb b/meta-oe/recipes-navigation/proj/proj_6.2.0.bb
> similarity index 54%
> rename from meta-oe/recipes-navigation/proj/proj_4.9.3.bb
> rename to meta-oe/recipes-navigation/proj/proj_6.2.0.bb
> index f45f8948d5..fa269d01b3 100644
> --- a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_6.2.0.bb
> @@ -5,9 +5,11 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
>
> -SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
> -SRC_URI[md5sum] = "d598336ca834742735137c5674b214a1"
> -SRC_URI[sha256sum] = "6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7"
> +SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
> +SRC_URI[md5sum] = "5cde556545828beaffbe50b1bb038480"
> +SRC_URI[sha256sum] = "b300c0f872f632ad7f8eb60725edbf14f0f8f52db740a3ab23e7b94f1cd22a50"
> +
> +DEPENDS = "sqlite3 sqlite3-native"
>
>  inherit autotools pkgconfig lib_package
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

