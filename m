Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 11C027F32E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 18:14:57 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l9so96620311qtu.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2019 11:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Umdpp7vQF+Dd9n3RQkod2pySEnLAalFnv/5NGo6aCJo=;
	b=ts81XWHNZBYYDZDC5ESIchaF02Ew+nOoTruF4xbQV4PHG3xEPdMy7HyktmBt+K37cS
	f52a+0z98xI4BSHPcZcZHc2xBPvW+ZciFIh0mHj9wEx0OU8rAg/GscUAHz9IVfRzGa/s
	4YfM/URmswtRE/K2T5MJjD4KLMiR2Ntk/2SSZtv1cwjRkHYSC2LDIsx3TftmlgfrVdqG
	YFx7E85hZhmuBmQxXgyk5MtzLmYH44Ju0++TUSsK9C94sqtqB5y+nsO8/GBLbvMeX2yB
	6fayYygawdcoT1xzlmI9+AuoIH3q/joe4bmJMfokfbz0ipX41k6Q3EsszgASS6hxyhlv
	qsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Umdpp7vQF+Dd9n3RQkod2pySEnLAalFnv/5NGo6aCJo=;
	b=Nsji/xWaU4RUQt5G9KaMbLtx4t7xdSF+BxK0+Mh6L2EPhM09bNI1BBSzRVOd4n6neq
	AkWuTwjCeOtkY8UkXXW5CIDNz/uE+um1R+2cy6Xy6tpSE38MoD83N46UN9elqrkwVwpj
	ba80r1NDIjhFwlJ3S8zqWYLfgp9NdPrw6wuzMrwJpMei1Rv12uiL9KfcwuJSUaN0wkRR
	oB5YjjCkWKUlCYy9xB6Xdu+w1/Tn4U3z5JtVDN8TvUPR4GYRAmVdNrswHPUUutqQWrfS
	cCTQM6iPxors2XOjaWoeDfRtCuIQg7ragBOGlxCtJBv8mL0BAFToe61H87kLGTgLhiG7
	wYtA==
X-Gm-Message-State: APjAAAWUvwToiiqaUPQcVFILz+4e/CC0WmFc4BemuoZgpJ7rE2QFA3T4
	Smnv7Yj59uS0ApyA4NOZtmsk+sY+omqjal/vYvw=
X-Google-Smtp-Source: APXvYqxSNZrfEFAacHp0jGCMtW8wUOCRYg9ZKAF61zCZjp+VWnLElKu34PIEPX6bQ7SJkPURFIRnx14Ux8PJfEQMexY=
X-Received: by 2002:ac8:1183:: with SMTP id d3mr19186237qtj.53.1565374498648; 
	Fri, 09 Aug 2019 11:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <1565181007-2883-1-git-send-email-rbilovol@cisco.com>
In-Reply-To: <1565181007-2883-1-git-send-email-rbilovol@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2019 11:14:32 -0700
Message-ID: <CAMKF1sqn9JZr2w56t795a318sZUxeVt4obg8Q4sK4CZBdv2Y4Q@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] libnss-nisplus: Add recipe
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
X-List-Received-Date: Fri, 09 Aug 2019 18:14:58 -0000
Content-Type: text/plain; charset="UTF-8"

Ruslan

This has gone in but in parallel glibc 2.30 has gone in
as well in oe-core and now it fails see

https://errors.yoctoproject.org/Errors/Details/260172/

you might need something like

https://github.com/thkukuk/libnss_nis/commit/e9f0f4286d5a923eca1a9c84ff125268d144822e

can you check this

On Wed, Aug 7, 2019 at 5:30 AM Ruslan Bilovol via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
> Same as with libnss-nis - this will substitute
> the glibc nisplus module which has been removed
>
> SRCREV points to 1.3 release plus patch on top which
> allows to build with recent glibc versions
>
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>
> Resent to meta-oe as was discussed here:
> https://patchwork.openembedded.org/patch/159586/
>
>  .../libnss-nisplus/libnss-nisplus.bb               | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
>
> diff --git a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> new file mode 100644
> index 0000000..2dbeee7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
> @@ -0,0 +1,31 @@
> +# Copyright (C) 2019 Ruslan Bilovol <rbilovol@cisco.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "NSS module for glibc, to provide NIS+ support for glibc"
> +
> +DESCRIPTION = "This package contains the NSS NIS+ plugin for glibc.\
> +This code was formerly part of glibc, but is now standalone to\
> +be able to link against TI-RPC for IPv6 support."
> +
> +HOMEPAGE = "https://github.com/thkukuk/libnss_nisplus"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +SECTION = "libs"
> +DEPENDS += "libtirpc libnsl2"
> +
> +PV = "1.3+git${SRCPV}"
> +
> +SRCREV = "c6934373c7bac91499ff7bbe7d2439599325ca63"
> +
> +SRC_URI = "git://github.com/thkukuk/libnss_nisplus \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND += "native nativesdk"
> +#
> +# We will skip parsing this packagegeoup for non-glibc systems
> +#
> +COMPATIBLE_HOST_libc-musl = 'null'
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

