Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id BA7577D91B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 18:00:22 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id w20so4019982qka.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 11:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=37JaGvR+F5Pd+1IWeqgSLDc5mH/toWyayGJI6AVGJng=;
	b=opuUrDdxYWuc3XXktAOn604A/cP7/FEDKo/oFbO5hKSuycd3ju9BJ+q7Y4fY9WBuL4
	7abJZn3BZ61zHeLcUJ3+CEW85n3zCWMKjOp8meYWNQ1MLtU3mAhfL1jkpfVTsIeDj7MX
	8PQ2j5Mf5shU1heiFqhCoZ1ieAaHM0if6VhOc093imBmxotk17jzqSzV+rkbNj8WPRjM
	GZBwGlQ0Sg5KhQsLC5b+0zWQgLmOp14TitW6P/dLYGRoMSvafmni1X81XpJjMfNs3q8x
	hiQHLa1iuQLjhiOozTdhGz1KUUW10nMf1bclAFOuCtroDTJfW4ar0j0mgWsRBloGKJvG
	bDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=37JaGvR+F5Pd+1IWeqgSLDc5mH/toWyayGJI6AVGJng=;
	b=B/i535USa86MUZalZ8aZGd+ZDLGhvElUesKTqHK7p8y2pZ7iQ4c6x8000suH4NNA5b
	58uWahSBSYEnbzZJoqFBovzgmYL7ebQd1IyDfk9Hn3F8Gd2B4+dhWHNkkjGE6eLScEdd
	5aR3dRyrvnkKXCeIbE4s8K2HpJ7dO1C3samwNbEMhzhK8iULuTgUyqXPUXNm5YEwxmV3
	eIJ7wBvYTVB5b1OTetSp96r3btElWYN3YX26oDKwjzxjBGxJo94rqxASR2w6OhmxXdoH
	UKbxKJ8Att4lNaZbctTGQTPugNMcgEe9hJNSXTRit8+lMUCjtQhvhyRNuTgx2h5PFHoN
	dHwA==
X-Gm-Message-State: APjAAAU2nincKDoWhgxRLF2dp0wYlopR5ozpft7C231FegevhU6Z0RzW
	xUfvrGAac6G1HyC4emgi1mGsceyIr5l94UtqPGHqe108
X-Google-Smtp-Source: APXvYqxOJOrR1dSAwGu2lrb/gLq9JrnDJPY+XnzFmdfUt5Iiiz+ZhjJ7quL1LcJkYNjAxuLJW6LpqvSdNYY5EFIeEB8=
X-Received: by 2002:a37:7b02:: with SMTP id w2mr38962558qkc.225.1555005623516; 
	Thu, 11 Apr 2019 11:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190411033014.7091-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190411033014.7091-1-zangrc.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2019 10:59:57 -0700
Message-ID: <CAMKF1soDLYzZv-quVXUNyN4heQ1OfOKpKQxJYF5YQ4EHeh1ByA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-dateutil: upgrade 2.7.3 -> 2.8.0
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
X-List-Received-Date: Thu, 11 Apr 2019 18:00:23 -0000
Content-Type: text/plain; charset="UTF-8"

upgrade p3 version as well.

On Wed, Apr 10, 2019 at 8:29 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-dateutil_2.7.3.bb to python-dateutil_2.8.0.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-dateutil.inc       | 4 ++--
>  .../{python-dateutil_2.7.3.bb => python-dateutil_2.8.0.bb}    | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-dateutil_2.7.3.bb => python-dateutil_2.8.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
> index 9c5a89dd3..e230f15dd 100644
> --- a/meta-python/recipes-devtools/python/python-dateutil.inc
> +++ b/meta-python/recipes-devtools/python/python-dateutil.inc
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
>  LICENSE = "BSD-3-Clause & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
>
> -SRC_URI[md5sum] = "175b7c1a3cc0cb01151eced07c61c0b8"
> -SRC_URI[sha256sum] = "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
> +SRC_URI[md5sum] = "354db28843d949f1bc3e49e8458e22df"
> +SRC_URI[sha256sum] = "c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e"
>
>  PYPI_PACKAGE = "python-dateutil"
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.7.3.bb b/meta-python/recipes-devtools/python/python-dateutil_2.8.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-dateutil_2.7.3.bb
> rename to meta-python/recipes-devtools/python/python-dateutil_2.8.0.bb
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

