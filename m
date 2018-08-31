Return-Path: <krzk@kernel.org>
X-Greylist: delayed 506 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Aug 2018 07:45:13 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id CF46971ADD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:45:13 +0000 (UTC)
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 033B52083A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1535701009;
	bh=5bepa4R64adqTQhXCZsVOseaEvAkUa7Zc6v06y5xnPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lDJZQB0XQ+kTSKY2vmpDW+G4ix4sOisj8MHpQCwsFFK9Ya3Mc2e9KPUjmDKznZ8+2
	mHKjLbDN7PK5BbrZyKWwPBofneaT0JxA94RFEYYvSDxZLhY2DOTrRMBomV2khBmb0s
	FsRX1ZzW8Io9ZzElZGcc8D3zcE/vohhkDfwhs0JI=
Received: by mail-wm0-f48.google.com with SMTP id y139-v6so4202760wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 00:36:48 -0700 (PDT)
X-Gm-Message-State: APzg51BAF9k7Mj+hXNQMQrt/Rmy5hcdk2LGKjRvHwEp5aJGY4KPvhst5
	2sSW5HbZ8Qgs96Rs0m1tB3s6CLVs5Fye5RsylZc=
X-Google-Smtp-Source: ANB0VdYgmKNTnEFq5zvhjYS1sex8BxK2da/je0tkvVY83OzsWF62e6YrjOYW0t+mvcn03jXAOLh5lMoKdrykENXUXjE=
X-Received: by 2002:a1c:3e8e:: with SMTP id
	l136-v6mr3916822wma.72.1535701007512; 
	Fri, 31 Aug 2018 00:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180831065552.19562-1-raj.khem@gmail.com>
In-Reply-To: <20180831065552.19562-1-raj.khem@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 31 Aug 2018 09:36:36 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeOumX10kdV3utNgXyFL8R-aNW_HqPedbUmN8mB=gi5tg@mail.gmail.com>
Message-ID: <CAJKOXPeOumX10kdV3utNgXyFL8R-aNW_HqPedbUmN8mB=gi5tg@mail.gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libkcapi: Upgrade to 1.1.3
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
X-List-Received-Date: Fri, 31 Aug 2018 07:45:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Aug 2018 at 08:56, Khem Raj <raj.khem@gmail.com> wrote:
>
> Drop upstream patches
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---

(...)

> diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> index e401b70a7d..addd169a8d 100644
> --- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> +++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> @@ -6,14 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d0421cf231423bda10cea691b613e866"
>  DEPENDS = "libtool"
>
>  S = "${WORKDIR}/git"
> -# Use v1.1.1 with changes on top for building in OE
> -SRCREV = "342b50fc9225a991c224126c13c188ad9f1ef9f9"
> -PV = "1.1.1+git${SRCPV}"
> +# Use v1.1.3 with changes on top for building in OE

This comment can be dropped. Previously the SRCREV pointed to commit
on top of v1.1.1, so not a v1.1.1 exactly. Now you have chosen exactly
v1.1.3.

Anyway looks good:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> +SRCREV = "1c736c43eb71fbb5640d00efaf34a1edf1972c49"
> +PV = "1.1.3+git${SRCPV}"
>  SRC_URI = " \
>      git://github.com/smuellerDD/libkcapi.git \
> -    file://0001-Fix-possible-buffer-overflow-with-strncpy-and-Wstrin.patch \
> -    file://0002-apps-Disable-Wstringop-truncation-warning-on-false-p.patch \
> -    file://0003-test-Be-sure-to-terminate-strncpy-copied-string-Wstr.patch \
>  "
>
>  inherit autotools
> --
> 2.18.0
>

