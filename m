Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8815A77C17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 04:51:04 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k6so7237214wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 21:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XH5JgnvPu2MiR2Vpfe0pNCVqqNZdefHk1IN5vmdskhs=;
	b=eCx2zRE0CevpJ5TKvtcigB6FHRZ2uU8t8Iu5RWdXhP8RLCe+s0NnE53B7wweDRBiOe
	n8ti4CAPRWDm5F/6LyVWjcpJB2l+nOfjq9y0HVIMmO7I602TQwkH/RHUD40YAPGupsTZ
	nUC6c5hQuD2+bjNDjQeT/rHEVCoP83mhXqkOIMMACO4erqd003NRr6g7Hbq6JforEh/P
	27rzWnKNz1anE6lK8xu6dL0Z/tNcO8LBdeAU+zdjB2IhBhuiOIOWY12qoq7FQEKLvJRh
	caxS7ToUSpQOzpTQA8kHJnRXEq7f4NRBU5FKq4LVFDOzmGp1SO03obNM8kbFS8ULTSp+
	iRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XH5JgnvPu2MiR2Vpfe0pNCVqqNZdefHk1IN5vmdskhs=;
	b=CjpgRYiSECmBVYzq6uUw4iOH6ddtC3C3Xn+cAINoGr2RXxB9s48onlfQ6A3AyDXXAi
	nvW8kRmaWuRh6iJHqqgoD9z9SkJRJijZuk2ssuGYeFWufTrv/9W6cXutg7hq/be63XPB
	e1zf05kxgN0fWYDcBMtir8dfsE6YjuLKLdT/6AsUcp7Kdz0B8HQXGtFxDbQinVAPCQ/7
	zwnuJy2BESNKDh/zVucCKpp2wKoyfUU4tbykmj/HLAAo4ob+UAy6bmzlTYFGSCyATHbS
	Gq8VtwBNW2xrY+aEuZ9+bp/7D49KAQxyeJanizbXTwlIgVC9KVMY21kbEK+8sTAX+DSB
	Qqsw==
X-Gm-Message-State: AFeK/H0fQjhqAzm/RRyzwysNSTmxpyb7S3Z03sly0l0WaYtqPZedBLmAQVFDVP6ZRLWAjDrSMiuz0jH/4XlCMQ==
X-Received: by 10.28.199.132 with SMTP id x126mr1304141wmf.37.1490849466143;
	Wed, 29 Mar 2017 21:51:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 29 Mar 2017 21:50:35 -0700 (PDT)
In-Reply-To: <20170329091643.32180-3-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
	<20170329091643.32180-3-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2017 21:50:35 -0700
Message-ID: <CAMKF1sqWGKMXfndgNr3O-zWwBGrzPY5ZNoihPwTnCty-=mSiKg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 3/9] libqb: use github.com instead of retired fedorahosted.org
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
X-List-Received-Date: Thu, 30 Mar 2017 04:51:06 -0000
Content-Type: text/plain; charset=UTF-8

I have another patch which upgrades it to 1.0.1

https://github.com/kraj/meta-openembedded/commit/9778fde842b81991293a3a032d23d41da661210e

I am going to send another request soon which will have this patch
also fixes build with musl and clang.

On Wed, Mar 29, 2017 at 2:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-extended/libqb/libqb_0.17.2.bb | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> index 40d06f379..2d3278ce8 100644
> --- a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> +++ b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> @@ -3,20 +3,19 @@ DESCRIPTION = "libqb is a library with the primary purpose of providing high per
>  It provides high performance logging, tracing, ipc, and poll."
>
>  HOMEPAGE = "https://github.com/clusterlabs/libqb/wiki"
> -
>  SECTION = "libs"
>
> -inherit autotools pkgconfig
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
>
> -SRC_URI = "https://fedorahosted.org/releases/q/u/quarterback/${BP}.tar.xz \
> -          "
> +inherit autotools pkgconfig
>
> -SRC_URI[md5sum] = "de1e5d38fa449b4d127940c10d117260"
> -SRC_URI[sha256sum] = "9a419c649ed51f275dc780da8a15babb8a5d33633567bd9e0cb6193b6e21f4fe"
> +PV = "0.17.2+git${SRCPV}"
>
> -LICENSE = "LGPL-2.1"
> +SRCREV = "bd2c587f6ccacd8a5644b275d99324d200c2b378"
> +SRC_URI = "git://github.com/ClusterLabs/${BPN}.git"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
> +S = "${WORKDIR}/git"
>
>  do_configure_prepend() {
>      ( cd ${S}
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

