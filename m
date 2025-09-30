Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08A0CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 20:34:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.203.1759264474337998051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 13:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AJ1GqibI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso330560a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759264473; x=1759869273; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bidewaRowMWZ3pdOqXd3jvX4gxp10ayAKiPOtWv5tss=;
        b=AJ1GqibIMdsXtRD73xgIBrFkUe56qwPEVyNQ964ft7dI02NwVhcX9QEi6BpHQKPdnx
         pTY/1TGsIt+/bKawdBjL57wctg835dpka6kkBjEzFgBDH3LqvtW3YuzLDQuncGyEYPrJ
         Fi25MBur46x79mEiLVQA+hGHCkq/efAnICy7RrK+A1ATDf1j0VCNEfyh2qPd/kTjPy9D
         jq0aBKunf+FinEXWvNTmPGHoTy8NLuUA+OYdgh3e0NB/xn+Ex+nTl7203GOx3+lEfxMg
         85+NXbnxqjREOZDTlzxBnOaI7BMolB3sJd4Q5GCuyYhDDfzQmmBxYqzbSFeRLNKZqUsx
         5kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264473; x=1759869273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bidewaRowMWZ3pdOqXd3jvX4gxp10ayAKiPOtWv5tss=;
        b=HunqWXkK7RKx2bk6favOnnaSZb/+ai4OwPvmMH6UmamJSkKEkGsVMz8CqxFs9CmTLj
         kw6ZYeYJWt3nxe895SJPv0q+cMjq/xg+s/vKxNk1Xb4WbEyqIfFPf8ljozJ+21bethLK
         1lQF6WMvCnw6cCPwf3xPIkOUuQ8fWwxQGjc1TMOaUVc1WAgK7yPT2h+mIlmi3qSknIBE
         hszwF3c34/6cw08lZ/sVM902u8Le+5cz4tKlhikq3P//QKhQzW85/Japraq6dX5wu+U/
         JzA2W6Hp+Ge7UdsO+sW4tdH5omnql33WygdJb8C8rWV9aytaMRaVRP24rfyNq8nQ5Gsi
         KbMw==
X-Forwarded-Encrypted: i=1; AJvYcCWsbRo1vCtwpztj694+HOfm41eaFOAeX9E2bvm9Jt/OkZCXjP6/33/8X4i3VgcgqxUIf8wv6u2L85RA+SNPqzoznFs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlrBCwn5MEQXbfBHxhpLPHhOkNycLXwOr02TrIHEyfO4O+UKco
	X7ZdKSL8aOkwnBDY7AC2zFZ8q33jn2Ciib4pu90/7z0lrfTfOJkXM7RXGtDfhg==
X-Gm-Gg: ASbGncsZ5s5bGZCRt4JNpFx+SaLWl+u6+vDi1n9j28dsEvM4/RqrHAZKMfmpotlgReT
	UdIuUSd8lONBgSwxOn95ALlttSePVahva35hjXcWX2T6CrcXdigoity4JrlaTSr9WUkEoc1cVe4
	rCpUMcfuzjAnt7bhc+gd8GEhN+IkI5EorO5RzUrTWmnXhVAQRyxCbx5F3Tw3l8KpaqrVOKZjF4M
	JKEqb7Gj0wYPIPTjXeG36jLJ2wW+ppw21Uxp0VTPopRCIZuN/8nzfjz04qZZQf8T6aSzkVU6nmi
	hYJzfb9JDNpCQ/PKvFkB9HwpR/vVKU0f3WHNFhvdPUpmE848Jyq9s0Iy/PHBC/ac6gKpQlLX2Dy
	ChJc0ew4ZHFMCErJMVu1MEqzbks/r6b4dKoMde2TARLvaO+F++NB/XPHgs05xP3VU6w==
X-Google-Smtp-Source: AGHT+IGxToUEYoV1rTEtj1vVz1e7hKwvnEoDylib3qcE8qXdLeY+Osy2Cmc4kiJ2/Jodn5fYzJP+kA==
X-Received: by 2002:a17:907:948f:b0:b30:2f6b:448f with SMTP id a640c23a62f3a-b46e6816e14mr110410766b.25.1759264472578;
        Tue, 30 Sep 2025 13:34:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa494esm1212645266b.25.2025.09.30.13.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 13:34:32 -0700 (PDT)
Message-ID: <88b381ac-b03a-4cab-be24-56bf4ad190a9@gmail.com>
Date: Tue, 30 Sep 2025 22:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 10/22] freeglut: changed SRC_URI
 to github + added UPSTREAM_CHECK
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
 <20250930091841.1693131-11-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250930091841.1693131-11-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 20:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120085

If the SRC_URI is not dead, I would just leave this as it is in Walnascar.

On 9/30/25 11:18, Ankur Tyagi via lists.openembedded.org wrote:
> From: Jan Vermaete <jan.vermaete@gmail.com>
>
> - added HOMEPAGE
> - downloads are now from github
>   "Stable releases are available on our releases page on github, where you can find more information about each release. All releases are also mirrored on the old downloads page on sourceforge."
>   @see: https://freeglut.sourceforge.net/
> - fixed 'devtool check-upgrade-status'
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 6afcc7939e74023b06fc8655f4120647e4907f8c)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> index 2cd00b0349..b3a103054f 100644
> --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> @@ -1,9 +1,10 @@
>  DESCRIPTION = "FreeGLUT is a free-software/open-source alternative to the OpenGL \
>                 Utility Toolkit (GLUT) library"
> +HOMEPAGE = "https://freeglut.sourceforge.net"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
>  
> -SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
>  SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
>  
>  inherit cmake features_check pkgconfig
> @@ -24,6 +25,9 @@ PROVIDES += "mesa-glut"
>  
>  DEPENDS = "virtual/libgl libxi"
>  
> +UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
> +
>  do_install:append() {
>      # Remove buildpaths
>      sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeGLUTTargets.cmake
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120062): https://lists.openembedded.org/g/openembedded-devel/message/120062
> Mute This Topic: https://lists.openembedded.org/mt/115510966/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


