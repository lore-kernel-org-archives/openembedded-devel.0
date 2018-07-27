Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id D961378CB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 20:52:40 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id c126-v6so4158288qkd.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4b1/JWncf4BwOKlegFqrylt2dhivTOsDA4W1wGiGjgk=;
	b=O8B7WUbsq5h/rH0b3I0FT9rEuHaz3g0NP+upFfbgIEOrH6iMGmDLprzAgkW8oSn5Ve
	ZxHiQxJVMZfPibfJODjkc2KgbkXAoP3sEnghRzT8VUKgXCAsYyNj3qcOZ9iFJCso+BxS
	82wZPvi0zHAun0iR1eoGDxPFHyeesFnvUK03SBSU8+ujAe5FGt6H0HLQ4OT3iGc2JJVF
	kdxG/a+zRFwoXMzQ+RAMV3IBdIvns4P1nT7kooJTE816DntndL9mF2OUaC8ugB3ilqcA
	IEGJx/BqgWcq1CnWqtdgDmv/KGCHkBYPpz2QFiXO7xYMT/Uabmf+rIYCMIVScwBH1uIR
	lJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4b1/JWncf4BwOKlegFqrylt2dhivTOsDA4W1wGiGjgk=;
	b=MhiTucaYVGz+2oQUGzHQhtcD3GRimsZyNlZN3awSmGdNelJtbs1UMcnLXIK1e5wAzL
	zzLDz9CAabixoJ5iWK7ENe+2s1emL/kF5u+iZYICgDrdI7MgSXQOUE/NRRSh10H/wFqR
	QrRQWaUXM6cKPfi6Kan/nTuIgtkOTs7CN+xDnYCVA1szrLiXBmoxVd2My3XnzBh1qV9m
	BAk3ivbKpYMlB5k+txiFsaCi6YaLc7fRp4M/nf7KTHQX/0HAwcj4WOWRjNKydRDcNqsp
	/ZsxBr6M8L8+9npNnmTLRnv2QdjMrLrMtZfnac3UB/6mOu7Dxae3k6olIneMbL89fZnD
	1MGg==
X-Gm-Message-State: AOUpUlG6xxbY5MBYZDer+4uVDnugfHEJenqel2ceXew2sMgf8O6Z9Cl6
	yzRlWKhQwmz4/I4HU5PGkMqOy/RqFJoUxt9mskAJuA==
X-Google-Smtp-Source: AAOMgpc84TFjn841oRyELF6jsVWtIL+V7iALEaC0G5W7qkMMOeo88lRROgegLv/z9LAXBNyQmbMFjdURjpYuQJySdHw=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr7066824qke.12.1532724761585; 
	Fri, 27 Jul 2018 13:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <1532717148-965-1-git-send-email-derek@asterius.io>
In-Reply-To: <1532717148-965-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 13:52:15 -0700
Message-ID: <CAMKF1soo_ez-zBEuK1JFuN3SRyZfh3ZxyD8Sy0KV6GcHhBnRfw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-greenlet: update to version 0.4.14
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
X-List-Received-Date: Fri, 27 Jul 2018 20:52:41 -0000
Content-Type: text/plain; charset="UTF-8"

this is already submitted earlier, I had to fix the checksums but its in queue

On Fri, Jul 27, 2018 at 11:46 AM Derek Straka <derek@asterius.io> wrote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-greenlet.inc               | 4 ++--
>  .../python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb}   | 0
>  .../python/{python3-greenlet_0.4.13.bb => python3-greenlet_0.4.14.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-greenlet_0.4.13.bb => python-greenlet_0.4.14.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.13.bb => python3-greenlet_0.4.14.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
> index 7a42240..fcd81f6 100644
> --- a/meta-python/recipes-devtools/python/python-greenlet.inc
> +++ b/meta-python/recipes-devtools/python/python-greenlet.inc
> @@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                      file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
>
> -SRC_URI[md5sum] = "6e0b9dd5385f81d478451ec8ed1d62b3"
> -SRC_URI[sha256sum] = "0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"
> +SRC_URI[md5sum] = "a87b6028c3b742b210bf5973939db595"
> +SRC_URI[sha256sum] = "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb
> rename to meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.13.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.14.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.13.bb
> rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.14.bb
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

