Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FD5C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 09:07:45 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.4556.1677056863255230322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 01:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rm4r9SJD;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1724d65d002so2135160fac.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9XG0i9MUq7W4ljLhB3ScvSRFV6ES5L4i7bv71xCbKfo=;
        b=Rm4r9SJDRr+uVcWDjPLQinrDiWL0myb/zKGsGrsI/Zkxb3meAKO1v3qm6b8zfNhWqa
         3nCLjeozonw27lz30TbRIlD41bR13kSaRPKZ9yW4LBu9DrHBDUqMrGunXbxExqHPr2GN
         S6tgZuuIYBOHy/aGG1K+5ZtxPi8fw3g4lh0G2CvbN9x2kw+CKNeW+XkwXdLAlixFVPsg
         jmkSXC6nmGGpQAXAtKIhQDbRGl9usTGnVAUE1myZ9lVKbmBXbXyNFyUokUkrTPda1UPz
         1hF+sDw5J4Ko6X/CjyltHnDOnPvgohvzci1spakumA4p8YWj663Ij/j3/FxCpPZiKsE7
         p0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XG0i9MUq7W4ljLhB3ScvSRFV6ES5L4i7bv71xCbKfo=;
        b=6kUNKNNc5UMONUcq7AOIvWUzUH6QVmu7qL9O/uhKxMNUGKSW/Gv4lOAPyNcBDGjALG
         K1iVqQlOYS/lf5Q3lRYpueqWGhKPpD5MvQRZE7RrHnKL/7T/udWfk4sycZh3mRaYPZ9d
         n7UJbt0Qc6Y1Lp5oLe8S4Ay2rJthCBOjN+sgczL7ZmHAyfu5Yap3ARAwI+MY5I5ki91i
         Tuh2CUchiuAawdhapvTuwp9kgm/ajMDKCVEG1Gs79tjf3syye74c3aO/wKE4INJwcLWT
         NDKtVILiYGss/jbvXcV/S7QJqMD9babKvvKlNFMPh4BrCKvo+mP6AieonZc5QKb7OJb3
         rkPw==
X-Gm-Message-State: AO0yUKVfW2nzbVPro44ukJjWU5uZPwKBFL2suTmKJxyuRv6pzZ9IYe9Y
	+BQIfMHFmJwZFOtUpFpO2II1pQ3hUweUH/3WIZV0nvECsac=
X-Google-Smtp-Source: AK7set/q5ES9syo2HBcHX6EkX554cxuwtt2+Kv4wZKgBheWMbTR1HPWeY3xKoT8E+6r9Od9pVHXPSTgH8UniPX4daYE=
X-Received: by 2002:a05:6870:d188:b0:163:b85e:f1ca with SMTP id
 a8-20020a056870d18800b00163b85ef1camr1123241oac.262.1677056862408; Wed, 22
 Feb 2023 01:07:42 -0800 (PST)
MIME-Version: 1.0
References: <20230220154614.42832-1-ross.burton@arm.com>
In-Reply-To: <20230220154614.42832-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2023 01:07:16 -0800
Message-ID: <CAMKF1sroGifX-27hFEP156EwyuvH=viFZjgwL7REwLZMiOyr9Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/8] zchunk: upgrade to 1.2.3
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 09:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101203

fails to build on musl/aarch64 see
https://errors.yoctoproject.org/Errors/Details/695672/

On Mon, Feb 20, 2023 at 7:46 AM Ross Burton <ross.burton@arm.com> wrote:
>
> ---
>  .../{zchunk_1.2.0.bb => zchunk_1.2.3.bb}       | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-support/zchunk/{zchunk_1.2.0.bb => zchunk_1.2.3.bb} (52%)
>
> diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb
> similarity index 52%
> rename from meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> rename to meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb
> index 0baea5032a..760d650de6 100644
> --- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
> +++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb
> @@ -6,17 +6,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
>
>  SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
>
> -SRCREV = "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
> +SRCREV = "f16dbeb0831eb37a9397356570327abb97860875"
>  S = "${WORKDIR}/git"
>
> -DEPENDS = "\
> -    curl \
> -    zstd \
> -    "
> -
> +DEPENDS = "zstd"
>  DEPENDS:append:libc-musl = " argp-standalone"
> -LDFLAGS:append:libc-musl = " -largp"
>
> -inherit meson pkgconfig
> +inherit meson pkgconfig lib_package
> +
> +PACKAGECONFIG ??= "openssl zckdl"
> +
> +# zckdl gets packaged into zchunk-bin
> +PACKAGECONFIG[zckdl] = "-Dwith-curl=enabled,-Dwith-curl=disabled,curl"
> +# Use OpenSSL primitives for SHA
> +PACKAGECONFIG[openssl] = "-Dwith-openssl=enabled,-Dwith-openssl=disabled,openssl"
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101168): https://lists.openembedded.org/g/openembedded-devel/message/101168
> Mute This Topic: https://lists.openembedded.org/mt/97088330/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

