Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id B62927F353
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 08:42:07 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id e8so8696916qtp.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 01:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T4RsnOBY1E/CCdI7JTPI4p5ogQOuyxYEgSmygP3lVGc=;
	b=ZIQfrT/0zaIrrRMcssW3KbDbqZYYeZxIctnF0a19nQkV5s6LTuFxD2GDwOjG6/3Spi
	hj5hL19bB+XORAQyF2dXrEcdowkFWipecc9MQyB0jY1W0cM7w0iSiXB1VcWS/yYrG7xd
	xtA7LpjeIzeXvj32Az8kchanlCQfponfo+xOTkdS9KuGV3Z1axofEJFt7cQubQ628IBW
	SU4CXPC9TFIfDsN+ufG2xaG+CaRffuobedrGNkAPwoiW5T5Yl1qD7o9d6qme9Ey10Taz
	LwCSR6LMA4jhRQKWNa/QinJD6/VQwE2O1bUHODnlfNyDyy6NybrXwEWlLLtAwl7AoItk
	Npww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T4RsnOBY1E/CCdI7JTPI4p5ogQOuyxYEgSmygP3lVGc=;
	b=RxZ7HNMfvnDy1gH9IEUrQfyYWfZzjPfyGuvi5Oa3uRj/piSglKbgZuTxZjQX5UaCqX
	L17Inp2yoBkuEGMGkFEWz0Dnek06BpbKrWRse9bhoHENl5Ub8xbrnk0Bf8YjaklnLd5c
	0Q7y4o1Nmk0hTW5sHs5DtHkqX+a5V/PJCRuhujab8MPEnF186t6mNdinTT3oIhCmASQs
	NsRrqomKE4wTSSB7eX1g1hpX4ng/l9QplpRksWbOkHoD+jebwy5klKPYbucQ4oinObyo
	3Nuh4p430SWKCDnFRCdKWx0RmUmhtMju7qiHn12ltTuzOOgaqlcW0adfcVb74Xp7oxqx
	gTfA==
X-Gm-Message-State: APjAAAWmD+yc9IXvTMwRjSJPyjxXWHJyt5qR6olhr/tTZsomOUGpgklt
	BRBnKZVfRJouNzMk20/pvfnMIEmUi5pSJKlBBFfSGJ7F84A=
X-Google-Smtp-Source: APXvYqwzMF3BMY6PE4D8e3WX6tQOyZCf8KmKC4EzY8cUpAZ8qv7FuMvHsVn81W+Ht6q+W8kNhKf6qYiu5JiqITlYEQI=
X-Received: by 2002:ac8:6997:: with SMTP id o23mr12287137qtq.53.1566031328237; 
	Sat, 17 Aug 2019 01:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190816075631.5171-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190816075631.5171-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Aug 2019 01:41:51 -0700
Message-ID: <CAMKF1sqOL9oG_UzEAdbLD3vb+Griy1EfYVV-=e+hFusQtG4G8A@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-flask-pymongo: upgrade 0.5.1 -> 2.3.0
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
X-List-Received-Date: Sat, 17 Aug 2019 08:42:07 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build see https://errors.yoctoproject.org/Errors/Details/263389/

On Fri, Aug 16, 2019 at 12:57 AM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Add depends of python-vcversioner.
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-flask-pymongo.inc        | 6 ++++--
>  ...{python-flask-pymongo_0.5.1.bb => python-flask-pymongo_2.3.0.bb} | 0
>  ...ython3-flask-pymongo_0.5.1.bb => python3-flask-pymongo_2.3.0.bb} | 0
>  3 files changed, 4 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-flask-pymongo_0.5.1.bb => python-flask-pymongo_2.3.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-flask-pymongo_0.5.1.bb => python3-flask-pymongo_2.3.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> index fb2d6ed..21b6ca8 100644
> --- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> +++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> @@ -5,9 +5,11 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
>
> -SRC_URI[md5sum] = "d7a1b717f27154e1f3a355f8ec2467d6"
> -SRC_URI[sha256sum] = "2baaa2ba5107d72b3a8bd4b5c0c8881316e35340ad1ae979cc13f1f3c8843b3d"
> +SRC_URI[md5sum] = "94df71e6800b1d7915cc91a74b70f959"
> +SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
>
>  PYPI_PACKAGE = "Flask-PyMongo"
>
> +DEPENDS = "python-vcversioner python-vcversioner-native"
> +
>  RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
> diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo_0.5.1.bb b/meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-flask-pymongo_0.5.1.bb
> rename to meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
> diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_0.5.1.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-flask-pymongo_0.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
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

