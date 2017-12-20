Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C4C566011C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 06:47:29 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f140so7652399wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jsirHYZUG8jl8vLVoscIcsinEuQxxzj0YuFXHqc9zG8=;
	b=cQJ3R09/WKe3L3fAx4J1D6j6WD+c6Afsw9xTZnt2G8tCEmqD3AWzqw4wJCZWNdaSOa
	ttSIlj+Q4pg1PyuHLk6XaNvC18ndl++taWDTaf/ab1+Wfzx6A8ZhBZJJeEiKNXVBh8SL
	N7Ln7DdVMoGF8pvTMZwaxRX8dZQ/t95ZlHFWeFxdUYPIMck3iIdmUzXca0p9bvHsMeyN
	+9FaMPyEkKp3x6nIbXb2HyEeuhPWwWhrv83sKucV86ZFfLnPSq1U4ReXiOHBDW6lf0Wm
	Z7+a4/TumkBRqB/of+qnyvUCd+DeBAJKFckbnzVrlPEv5gCkwbryqyLiNVqbFnxsGq7b
	pQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jsirHYZUG8jl8vLVoscIcsinEuQxxzj0YuFXHqc9zG8=;
	b=RtQz8ClcGg2/7xQYWFyKov76U98tiW3hjLuDa7qamt1GdxKvnyMHSfw4TbkapQNf1i
	TDxUKBJ5L+OEUw0N6x7RxFJrS9TZDsuBXtfr31G19Ia92lbCxl1NWaDLihWBGZo6Gwuz
	D+NK8N+muc+6jKYSAyqEAzuITB9k5NxS1Iw755PLWNepFeerWqcThZJDS5MQwl3YmOTQ
	HpLETIsNuGdhvV/+vGTCaYwu9krd/mqanOCzETPwJBB3qMjq0DtIrI6QBy/UCPLdUabB
	Zhu5E3UdAqqX07PS0kYw9hu1Kv7jGHfZDgIdrQUFRP32vl2uC9swGi9HMfJIoposS4c4
	nwiQ==
X-Gm-Message-State: AKGB3mL4zpS2Ab8miToruk87xK81fAL9cCVcI0DBDSjUBxtIh9iSJqxq
	rhrBa6vn1olftY5JzzvzITYvLjnEHN2l/FyNcBE=
X-Google-Smtp-Source: ACJfBouEwrUnZBuaxxcPLRAi/9EXevmHPIidfeg0V8bBrvYoLQwL33Ytif+HjVAVrG+qu2e3i5h+TTZlPeMDvSZtbuc=
X-Received: by 10.28.65.65 with SMTP id o62mr6025204wma.112.1513752450489;
	Tue, 19 Dec 2017 22:47:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Tue, 19 Dec 2017 22:47:29 -0800 (PST)
In-Reply-To: <1513748750-15017-1-git-send-email-B40290@freescale.com>
References: <1513748750-15017-1-git-send-email-B40290@freescale.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Dec 2017 07:47:29 +0100
Message-ID: <CA+chaQco_7PigdHqWJHMtv0JCm2FBtzjAsCVCHnwj2QAjXSLZg@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Chunrong Guo <chunrong.guo@nxp.com>
Subject: Re: [meta-networking][PATCH] cyrus-sasl: depend on db
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
X-List-Received-Date: Wed, 20 Dec 2017 06:47:30 -0000
Content-Type: text/plain; charset="UTF-8"

There is fix for this already:
https://patchwork.openembedded.org/patch/145729/

On Wed, Dec 20, 2017 at 6:45 AM, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> *db don't provide virtual/db
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=
> fe10cad66932c23812f344c6551cdb4f9e0b867b
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_
> 2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_
> 2.1.26.bb
> index eaa453d..64d1a76 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Generic client/server library for SASL authentication"
>  SECTION = "libs"
>  HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
> -DEPENDS = "openssl virtual/db"
> +DEPENDS = "openssl db"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
>
> --
> 1.9.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

