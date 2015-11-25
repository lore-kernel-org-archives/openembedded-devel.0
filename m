Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 849CF6011F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:04:01 +0000 (UTC)
Received: by wmec201 with SMTP id c201so243659599wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8QOAFcdwD2G2azxig+hj25Bh98VU26reuAVcIX9xh/s=;
	b=hKyMRp8xUJzlYw5AROng/f+o2ycIULcBiIzgq+3JFoPX2cz4wzEyMEGwjiqnktoUJf
	H5+JpxsI7/3W9Xj8UqZuipJV1qA0vbU9SD4GcRF80bS6Ex1wNyzt8ykau7VlH5c/avOz
	/B4Vd+sK3R8E4c26ak6vKnK5Adr5U5veY+s8/21CUjooYF0yNn6adpVhOauE+tYw+jNS
	R449aEdK4JgHflE57PhjAlPGlIs/B5ge2gCfSaGPPyMvwRyjNz4jfUm2HskkI8YhQlPQ
	0OV/5y17rbb9v7jeTEWFCBzTWQnodcfYRyBx9+mBwCH82iPCa0R9yEr6dEaLjTMM62aJ
	Lgqg==
MIME-Version: 1.0
X-Received: by 10.194.184.104 with SMTP id et8mr37874072wjc.87.1448438641483; 
	Wed, 25 Nov 2015 00:04:01 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Wed, 25 Nov 2015 00:04:01 -0800 (PST)
In-Reply-To: <1448401846-28979-1-git-send-email-jslater@windriver.com>
References: <1448401846-28979-1-git-send-email-jslater@windriver.com>
Date: Wed, 25 Nov 2015 09:04:01 +0100
Message-ID: <CA+chaQc9TvK1brL-y0sFNzaPUh3X_p99P6mS4yDsT+55CL-nhQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-perl][PATCH 1/1] recipes-perl: inherit allarch
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
X-List-Received-Date: Wed, 25 Nov 2015 08:04:01 -0000
Content-Type: text/plain; charset=UTF-8

NAK
http://patchwork.openembedded.org/patch/107453/

On Tue, Nov 24, 2015 at 10:50 PM, Joe Slater <jslater@windriver.com> wrote:

> allarch packages should inherit the class, not
> set PACKAGE_ARCH to "all".
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../libauthen/libauthen-sasl-perl_2.16.bb          |    3 +--
>  .../libdigest/libdigest-hmac-perl_1.03.bb          |    3 +--
>  .../libio/libio-socket-ssl-perl_1.997.bb           |    4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> index 361bdf1..637320d 100644
> --- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> +++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> @@ -19,12 +19,11 @@ SRC_URI[sha256sum] =
> "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32
>
>  S = "${WORKDIR}/Authen-SASL-${PV}"
>
> -inherit cpan ptest
> +inherit cpan ptest allarch
>
>  do_install_ptest () {
>      cp -r ${B}/t ${D}${PTEST_PATH}
>  }
>
> -PACKAGE_ARCH = "all"
>  BBCLASSEXTEND = "native"
>
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> index affc9f6..7859c8c 100644
> --- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> @@ -16,11 +16,10 @@ SRC_URI[sha256sum] =
> "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96
>
>  S = "${WORKDIR}/Digest-HMAC-${PV}"
>
> -inherit cpan ptest
> +inherit cpan ptest allarch
>
>  do_install_ptest () {
>      cp -r ${B}/t ${D}${PTEST_PATH}
>  }
>
> -PACKAGE_ARCH = "all"
>  BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
> b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
> index 19dec83..3c49bb6 100644
> --- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
> +++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
> @@ -22,9 +22,7 @@ SRC_URI[sha256sum] =
> "acdb67b5b63aea5b7e70c3e4c70a16128810329592b63753a38c794aff
>
>  S = "${WORKDIR}/IO-Socket-SSL-${PV}"
>
> -inherit cpan ptest
> -
> -PACKAGE_ARCH = "all"
> +inherit cpan ptest allarch
>
>  do_install_append () {
>      mkdir -p ${D}${docdir}/${PN}/
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

