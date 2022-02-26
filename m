Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E321C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 08:20:42 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.4257.1645863641512612334
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 00:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cn6hKQ/s;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id w7so8549751qvr.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 00:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=22wdIrDdNWRQl5LJk1jReckqEA3/rvAGH+C42c/iJpE=;
        b=cn6hKQ/sDa3ZSkoFmC1R06o+tVKJAZdo6zqr3OLnK9o5VJqg/1yXxpr2jcj1BiN71U
         CG9iKp3yCl5j+VA+c6LC8spvzKg0mjRXeanAyqNeKw1gP1Afg7BD+49g0XeCjqAyPylH
         UUVT5T+zHeJSnIx0bdZPCO3zddG1XHGdvb8QjYl2TiLTiFTQMOIKtm3F+yPB8wLecQp+
         y2a1KmbrSswV4JO04dRpYHDjQa845tgyVLyLfzPrUomKh4Ldzo6O5HkvqxCwvX6qunLK
         GikTYpqjZIjVBp7bDzWpmQ7dUFyaELi8AmbE5JQs8U8WOaWyX5Qi+1quGn/vr6ykMQrc
         w3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22wdIrDdNWRQl5LJk1jReckqEA3/rvAGH+C42c/iJpE=;
        b=zeyG2hLZz4S3jpA/MENFqorGaOoA69dwqEba30DVPIz54S1MePM6PZLfPN40AlEQ/n
         2EDdKVz8fNdudzzgNcePawXdGonLVutu8FFzm7oh4rGlDExezYOJCjh6BrMRwNxwJ37j
         CYGX9qXC72GFIO3cPbBeX7H8RhMG3aeNI+7hDBuG0/5imX5DxhdaBfM7hJTR3PbiBOlS
         6hSHQwMBrx8C227H5YHXLLYNeSdjxfcy5yCrrsMyASPKNVVf5SrkxYw2smaTx7NhSkjY
         1OXsSbyE1fhZnudE8FKONWPW2SnlKUZMI8XtqR0v6IUdZRKH4U8oo6279Cgi8oGCSerT
         S9fg==
X-Gm-Message-State: AOAM531B2yxF8BnnAoIYUissHtNrhOwYk5iRYy/XpunKQ/mwwkUDky/q
	9kIAR+kdAEcz/UPV7ScEt+mva5LnGoXYQUmP9X0=
X-Google-Smtp-Source: 
 ABdhPJwqPOe0pBsjfSJzvV+3CrvsmxwUdtIhBqlEO7Th1w+YpogOmfE2CmIGO9fvA4zOyNARrVmE7ZvVtxZo+pLfmdM=
X-Received: by 2002:a05:6214:1c0d:b0:432:6487:9c53 with SMTP id
 u13-20020a0562141c0d00b0043264879c53mr8479555qvc.36.1645863640407; Sat, 26
 Feb 2022 00:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20220226041103.1398748-1-tim.orling@konsulko.com>
In-Reply-To: <20220226041103.1398748-1-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Feb 2022 00:20:14 -0800
Message-ID: 
 <CAMKF1sqtNuo0O63HGrvx8duSFptS+kM=9gOuwuFhmnrj+=v3zw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-twofish: drop recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 08:20:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95541

it appears in dependencies of one another recipe in meta-python

ERROR: Nothing RPROVIDES 'python3-twofish' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
RDEPENDS on or otherwise requires it
)

On Fri, Feb 25, 2022 at 8:11 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> The code has not been touched since 2013 and does not build with
> bdist_wheel. If you depend upon this recipe, please work with upstream
> to update the package to PEP-517 packaging.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  ...ng-return-statements-in-module-stubs.patch | 38 -------------------
>  .../python/python3-twofish_0.3.0.bb           | 15 --------
>  2 files changed, 53 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
>  delete mode 100644 meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch b/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
> deleted file mode 100644
> index c25b2457e2..0000000000
> --- a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 5704610f4b3aed5210e9c5b7c05ff8b5b2364c9c Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Mon, 12 Aug 2019 08:18:21 +0000
> -Subject: [PATCH] Fix missing return statements in module stubs
> -
> -* fixes build with -Werror=return-type
> -  twofish.c: In function 'init_twofish':
> -  twofish.c:45:1: error: control reaches end of non-void function [-Werror=return-type]
> -     45 | PyMODINIT_FUNC init_twofish(void) { }
> -        | ^~~~~~~~~~~~~~
> -  twofish.c: In function 'PyInit__twofish':
> -  twofish.c:46:1: error: control reaches end of non-void function [-Werror=return-type]
> -     46 | PyMODINIT_FUNC PyInit__twofish(void) { }
> -        | ^~~~~~~~~~~~~~
> -  cc1: some warnings being treated as errors
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -Upstream-Status: Submitted [https://github.com/keybase/python-twofish/pull/6]
> ----
> - twofish.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/twofish.c b/twofish.c
> -index e324c34..d4487d8 100644
> ---- a/twofish.c
> -+++ b/twofish.c
> -@@ -42,5 +42,5 @@ DL_EXPORT(void) exp_Twofish_decrypt(Twofish_key * xkey, uint8_t c[16], uint8_t p
> - We need a stub init_twofish function so the module will link as a proper module.
> - Do not import _twofish from python; it will not work since _twofish is not a *real* module
> - */
> --PyMODINIT_FUNC init_twofish(void) { }
> --PyMODINIT_FUNC PyInit__twofish(void) { }
> -+PyMODINIT_FUNC init_twofish(void) { return NULL; }
> -+PyMODINIT_FUNC PyInit__twofish(void) { return NULL; }
> ---
> -2.17.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
> deleted file mode 100644
> index 94fb71090e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Bindings for the Twofish implementation by Niels Ferguson"
> -DESCRIPTION = "Bindings for the Twofish implementation by Niels Ferguson\
> - libtwofish-dev."
> -HOMEPAGE = "http://github.com/keybase/python-twofish"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
> -
> -SRC_URI += "file://0001-Fix-missing-return-statements-in-module-stubs.patch"
> -
> -SRC_URI[md5sum] = "d7d22f16dc4ffa0e3ae2200654033abe"
> -SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95537): https://lists.openembedded.org/g/openembedded-devel/message/95537
> Mute This Topic: https://lists.openembedded.org/mt/89404719/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

