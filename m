Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C22C3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 01:52:27 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.15481.1744336345111480615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 18:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a5HXayyB;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60297d7ab47so801020eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 18:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744336344; x=1744941144; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbtfcvddoIiEHYjbNkvQGphTSVlUhsTN3FpR3bteRc8=;
        b=a5HXayyBQB7PPRBczNqqpbwNoswNZjxaCIg0/sUvVZcN3yOKOSAD4QaU/rfQp2c5Ej
         R0uwqU2tgWN5XfP1Lh0VCtPyvTjGlv7oi67EGvgsCuliZ5z8Ya5FZMnLpxrMTuBfq76h
         TcPk8KAddzMHH/ikF31fiP83y59wI4gq5V5NVI8oRgqxCRtjoNoID43xlOKpRq+SXWUp
         Fld6772hbOdXOQO8Cs4nY/ydMTr/ocNid7UKHIzWabRAsczlJmFHoyo0Ksbqps/HF+b3
         2JNF6WrvnXVZTamNDixGshhdKR+zhQvfDig6Nzg0ALCLpiP9qIYJQX6t2+zlrlAvCV+z
         aa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744336344; x=1744941144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbtfcvddoIiEHYjbNkvQGphTSVlUhsTN3FpR3bteRc8=;
        b=CmXz6waxnzTCe9ODJjx/nshtkd1ZDYD+iEhKhlWvhb5oMfmp4NpWpyDzTBJdb2YUjk
         M6Rsi4lAuSf7ZuV4YLT5WbYZ1VkAEdaVF/K9ILMt+mkARiQpkfRZF5IHUXbd7xVTx3yx
         N4YCZc4hZiIiEo08rxfBSQp5cV/SJwSJKq7mjmfngoLQUCZ1BN5hlCCeaCPPADhbMyEc
         leI1G2O0qa9hKt8I8nTpQDYOvPZMYr5vbXzIbTH3D97GjKihJKjMrhmpGfoT2VcXaz+N
         1M4r1Z12h3tOZlqfHEvDJ8NTTu0JtXAEnCdMXLJ4fh+01eIcP+/SPifpzmvtL54dKc/L
         qp1Q==
X-Gm-Message-State: AOJu0YytVdQYV3lk9XdE18y0WVnuqJra7Bn04/jc3psEetyno0aiCtoX
	iJpfKTnMUg5tCoX9W+KY3RNiN/wc0Q7m9cYqv+B8AIB0Kav7u3TED4FWQlGICoTfOG83EKORw4b
	1KzZ3ydNQcrmYMhBT0JRob5a4yoo=
X-Gm-Gg: ASbGncujWV+tj95l59wViDQQW+jZIWqqt33FH8YKbkbkVZt9qz5Uj9xLxLxTh/HfYMs
	2IBwA/dPiEsVvzaLr5g2Q6N3MkBh80IWGg9NYhptHXiA6b2jXAi4kYN7gAZqbBWEzllpYNMO0ZH
	ugSHK/MSSP16TpZBnoPx8e
X-Google-Smtp-Source: AGHT+IHLrmb6Psw9qPSS/ZSunwQz0FISZwnFCWvyTtcGgoW2s5Qt7o+AGy8mztdqLDQRKwLjQ6/UEtPhpaN4j5icb/g=
X-Received: by 2002:a05:6820:2789:b0:603:f682:c4fd with SMTP id
 006d021491bc7-6046f4dceb4mr568680eaf.2.1744336344268; Thu, 10 Apr 2025
 18:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <1744189624-6858-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744189624-6858-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2025 18:51:57 -0700
X-Gm-Features: ATxdqUG8tge56fzZKQXtc0V20F6CzdKAR1hRZcDMvcSUdVi_QBmBmrbgGm5CfMo
Message-ID: <CAMKF1soQDwGmhh=uvuL1pCTm5aZZg4QYOTPx+VX1fAi9BvFcYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] libspdm: upgrade 3.6.0 -> 3.7.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 01:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116789

it still fails for me.


build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/git/os_stub/cryptlib_openss=
l/pem/pem.c
   In file included from
build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/git/os_stub/cryptlib_openss=
l/pem/pem.c:12:
  build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/recipe-sysroot/usr/includ=
e/openssl/pem.h:399:28:
error: unknown type name '
   =E2=86=AA OSSL_i2d_of_void_ctx'
     399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vctx=
,
         |                            ^
   1 error generated.
   [37/176] Building C object
os_stub/cryptlib_openssl/CMakeFiles/cryptlib_openssl.dir/pk/x509.c.o
   FAILED: os_stub/cryptlib_openssl/CMakeFiles/cryptlib_openssl.dir/pk/x509=
.c.o

On Wed, Apr 9, 2025 at 2:07=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libspdm/{libspdm_3.6.0.bb =3D> libspdm_3.7.0.bb}             | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libspdm/{libspdm_3.6.0.bb =3D> libspdm_3.=
7.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.7.0.bb
> similarity index 95%
> rename from meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> rename to meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> index 4c0483ebac..a3012e10bd 100644
> --- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81=
a88da8e812af43728b72dd7"
>  DEPENDS =3D "openssl"
>
>  SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3D=
https"
> -SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> +SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -23,6 +23,7 @@ LIBSPDM_CFLAGS =3D "\
>         -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
>         -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
>         -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> +        -DLIBSPDM_ENABLE_CAPABILITY_ENDPOINT_INFO_CAP=3D0 \
>         "
>
>  LIBSPDM_CFLAGS:append:toolchain-gcc =3D " -fPIE"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116728): https://lists.openembedded.org/g/openembedde=
d-devel/message/116728
> Mute This Topic: https://lists.openembedded.org/mt/112168951/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

