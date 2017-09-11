Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id AE67578330
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 16:52:07 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id c27so11989097uah.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Uu+n1JvRErsX/fZlAIKcDb1C+McotBvIYBDgavRC22Q=;
	b=QveMiRmA3IOsL+HusQ+peMyPR/FiOwGPaorW4trfWc2mUK9OCxU1/F3UKASQTP7aM3
	prhWABKMtfEBkJnjwaCho6oYvL1oBIzd0Qh3iXhwhOw2ug235tsW3tjzG+qMybXx9tRZ
	SmEmLIgaHV4vwSL0Ofbzj6B2p0hiwd8paMu3tCZtU/WNo/LoClhr14Z4Ql3S6Pc+j4nO
	8DHmMUz36OqoH9mVq1xjIl3IjozL8l104A2fJRABjNDSh6qBswjtoeqS1j7rqh9JI1P5
	r09NINv/oLCp4p8yURUMlNklv+1Vc2aXe6vDoA/OTjbunoP3E3+peCmus5FFgP8zU5dD
	gPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Uu+n1JvRErsX/fZlAIKcDb1C+McotBvIYBDgavRC22Q=;
	b=J4UgQhCmgi01/6odQUv5UnEdALH6pVudr04OkZvnPgGY9h8kpomcgkBlfjTNfwP1q0
	1fBXTU6fKET0sm4Pj8lmXKy33ZZ582F+c6FjY1xeKlvoE7SbtVI2jzjUig+UBOiyTZf3
	LvVOJFfX983inZJApHpVQIHVo+ctO047c+j7w+161QC5Cc3JXg/izlwGhadmltTRSmBI
	XwwvTzNH2f2D/5nyVnD2QUEZ5Xl1Z0i85muhaAA5qnwL9fVZu/jZV1WgXbhhH6wfXCxq
	x5oLG2WJxWiXgMT/8QDIiadIRlF9kNLM04neJ5iOMRbgM3SgiFwoGigHV/1MCMUP9OuW
	vyWQ==
X-Gm-Message-State: AHPjjUjpRnEPE/lLOOV5NIin4XwG+YL73Q1h8/FY8/KpEt39zGJ/IxFh
	7y2MBakcYQSA2xgEjUqbPLxHrfssmg==
X-Google-Smtp-Source: AOwi7QAS9XdboyvBfwuVMmIhzDR9jTQKx6g6MXP7be9DkqxIHS423hOSpJJgZZ5EVis8iDTruhwQKEZE//zIaBvn0rM=
X-Received: by 10.176.77.76 with SMTP id k12mr9824219uag.141.1505148728646;
	Mon, 11 Sep 2017 09:52:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Mon, 11 Sep 2017 09:52:08 -0700 (PDT)
In-Reply-To: <1504795356-19820-1-git-send-email-pascal.bach@siemens.com>
References: <1504795356-19820-1-git-send-email-pascal.bach@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Sep 2017 18:52:08 +0200
Message-ID: <CA+chaQdgk7FGQ3VoBFCvK7siVUf_dRPdyCmht1copoe1YGcoTA@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: update to 3.4.0
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
X-List-Received-Date: Mon, 11 Sep 2017 16:52:07 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build here:
http://errors.yoctoproject.org/Errors/Details/155533/

On Thu, Sep 7, 2017 at 4:42 PM, Pascal Bach <pascal.bach@siemens.com> wrote:

> Also put protbuf-lite into it's own package
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../protobuf/{protobuf_3.3.0.bb => protobuf_3.4.0.bb}            | 9
> +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.3.0.bb =>
> protobuf_3.4.0.bb} (75%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
> similarity index 75%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
> index ce64a88..39108dd 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.3.0.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.0.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/protobuf"
>  SECTION = "console/tools"
>  LICENSE = "BSD-3-Clause"
>
> -PACKAGE_BEFORE_PN = "${PN}-compiler"
> +PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
>
>  DEPENDS = "zlib"
>  RDEPENDS_${PN}-compiler = "${PN}"
> @@ -14,11 +14,11 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
>
> -SRCREV = "a6189acd18b00611c1dc7042299ad75486f08a1a"
> +SRCREV = "80a37e0782d2d702d52234b62dd4b9ec74fd2c95"
>
> -PV = "3.3.0+git${SRCPV}"
> +PV = "3.4.0+git${SRCPV}"
>
> -SRC_URI = "git://github.com/google/protobuf.git"
> +SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
>
>  EXTRA_OECONF += " --with-protoc=echo"
>
> @@ -27,6 +27,7 @@ inherit autotools-brokensep
>  S = "${WORKDIR}/git"
>
>  FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
> +FILES_${PN}-lite = "${bindir} ${libdir}/libprotobuf-lite${SOLIBS}"
>
>  MIPS_INSTRUCTION_SET = "mips"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

