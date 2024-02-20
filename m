Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C277DC5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:59:56 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.16801.1708444794688126744
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 07:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l52mLkSM;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6083dc087b3so21076627b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 07:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708444794; x=1709049594; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cC4LYPnUcmXkO9Jn/CC3CQcJCISdwut6fDt5QNwLn3Q=;
        b=l52mLkSMXiuT1AVlS65ykGDH6phBjq2V99ljKc1VFwYXtzjmJ4lg5FI/Co5R1DnKw2
         ntjORCYIn2bvClmNKxcOR1NALwI2bZXIHH3DL04hy/lj1qqtmXSCjJp9C9xAV2T6QbkP
         fM8iMK4H4zfw/M4u9L6iG9jtZUeyqFdvG/JtoHsPo5gBZuYy4G///i6dvJ+hQPZ4YeCj
         jUbHMy9HCqcEpoWRvRSI5LzeT1jbX2zFrwlQWt/benjFa1uFN7WByvazd1bc+/NPN/lz
         YTh+oVn0vyzsrz5KHhvy3V/SKKEFmKaDtFljLQBOGAXHD5mtb2+JAeulUW5XNsQ6mdI5
         7ahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708444794; x=1709049594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cC4LYPnUcmXkO9Jn/CC3CQcJCISdwut6fDt5QNwLn3Q=;
        b=H9/1WxW1V0t3YUJrqJm+LyPg2GDBkJrGBjSI9Nr6RhcPheoCP2+8lSX/whCB6pBxs9
         yFkT6zRwggL7TA6RkWIXLbeJMcsnT7Rvb1VXbq85pHTkL7P4Curgysd1nq0zcrf/hWb5
         6zfhd1KG0k4O1VFkZPPKd+3kdsgQul7IJ00CVnXSecX7Gfndh09uyJWyME3BeXR/GdIS
         SigDvFR6fjjq5mBenmWbHoQ/XOZbNOdbjJWfzT6dKjbI8zkC1mra7WyHczEmhkHF4dq1
         rV7/4w3yhekd3/K356kDN+Tj7LgKgnTbif5vZdyS/s3gPT1g9wlvXGX3JAwPI5Pf4xGI
         4nDQ==
X-Gm-Message-State: AOJu0YxDCyfzwJ0F1IGUJB2h32TBXPv4EuQlEPeqzoReSW1M6zbWsbmg
	kVXS1qmC1ToRqYUJ0KgXmVUpokby/aVaYJiReB7ZNtVjqNFD+/DQec9ZTK9Lazt7fcbmTtNFkid
	gJ2B2SBqiCJvGjj0E1YLWEvviTYo=
X-Google-Smtp-Source: AGHT+IEErRxxR8Au9HoAY189K8MP+yZ8mMVxEC3rhRS4npZQuahjEgg+oPzjwofkz5n6qh++RQRVJCV9Dn9Arowp3M0=
X-Received: by 2002:a81:ad09:0:b0:604:926c:5347 with SMTP id
 l9-20020a81ad09000000b00604926c5347mr13871778ywh.23.1708444792839; Tue, 20
 Feb 2024 07:59:52 -0800 (PST)
MIME-Version: 1.0
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com> <1708419281-26047-26-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1708419281-26047-26-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 20 Feb 2024 07:59:41 -0800
Message-ID: <CANx9H-B3WLiy3pHc73NsjbT-QPQb3kgnwhzCbE_=fOXnB0jW0w@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 26/26] python3-pydantic: upgrade 2.5.3
 -> 2.6.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fee6ac0611d24cd5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 15:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108948

--000000000000fee6ac0611d24cd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You don=E2=80=99t mention that this also upgrades python-pydantic-core and
refreshes the -crates.inc

See my recent upgrades for what would be more helpful in the commit log.

On Tue, Feb 20, 2024 at 12:55=E2=80=AFAM wangmy via lists.openembedded.org =
<wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Drop Python3.7 support
> -Drop Python 3.7, and PyPy 3.7 and 3.8
> -Use positional-only self in BaseModel constructor, so no field name can
> ever
>  conflict with it
> -Make @validate_call return a function instead of a custom descriptor -
> fixes
>  binding issue with inheritance and adds self/cls argument to validation
> errors
> -Exclude BaseModel docstring from JSON schema description
> -Introducing classproperty decorator for model_computed_fields
> -Explicitly raise an error if field names clashes with types
> -Use stricter serializer for unions of simple types
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/python3-pydantic-core-crates.inc   | 94 ++++++++++---------
>  ...4.6.bb =3D> python3-pydantic-core_2.16.2.bb} |  2 +-
>  ...tic_2.5.3.bb =3D> python3-pydantic_2.6.0.bb} |  2 +-
>  3 files changed, 50 insertions(+), 48 deletions(-)
>  rename meta-python/recipes-devtools/python/{
> python3-pydantic-core_2.14.6.bb =3D> python3-pydantic-core_2.16.2.bb} (94=
%)
>  rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.3.bb =
=3D>
> python3-pydantic_2.6.0.bb} (94%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> index 932cfc852..5518ff6ec 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.in=
c
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.in=
c
> @@ -2,24 +2,25 @@
>
>  # from Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/ahash/0.8.6 \
> +    crate://crates.io/ahash/0.8.7 \
>      crate://crates.io/aho-corasick/1.0.2 \
> +    crate://crates.io/allocator-api2/0.2.16 \
>      crate://crates.io/autocfg/1.1.0 \
> -    crate://crates.io/base64/0.21.5 \
> +    crate://crates.io/base64/0.21.7 \
>      crate://crates.io/bitflags/1.3.2 \
>      crate://crates.io/cc/1.0.79 \
>      crate://crates.io/cfg-if/1.0.0 \
>      crate://crates.io/enum_dispatch/0.3.12 \
>      crate://crates.io/equivalent/1.0.1 \
> -    crate://crates.io/form_urlencoded/1.2.0 \
> +    crate://crates.io/form_urlencoded/1.2.1 \
>      crate://crates.io/getrandom/0.2.10 \
> -    crate://crates.io/hashbrown/0.14.0 \
> +    crate://crates.io/hashbrown/0.14.3 \
>      crate://crates.io/heck/0.4.1 \
> -    crate://crates.io/idna/0.4.0 \
> +    crate://crates.io/idna/0.5.0 \
>      crate://crates.io/indexmap/2.0.0 \
>      crate://crates.io/indoc/2.0.4 \
>      crate://crates.io/itoa/1.0.8 \
> -    crate://crates.io/jiter/0.0.4 \
> +    crate://crates.io/jiter/0.0.6 \
>      crate://crates.io/lexical-core/0.8.5 \
>      crate://crates.io/lexical-parse-float/0.8.5 \
>      crate://crates.io/lexical-parse-integer/0.8.6 \
> @@ -36,15 +37,15 @@ SRC_URI +=3D " \
>      crate://crates.io/once_cell/1.18.0 \
>      crate://crates.io/parking_lot/0.12.1 \
>      crate://crates.io/parking_lot_core/0.9.8 \
> -    crate://crates.io/percent-encoding/2.3.0 \
> -    crate://crates.io/proc-macro2/1.0.69 \
> -    crate://crates.io/pyo3/0.20.0 \
> -    crate://crates.io/pyo3-build-config/0.20.0 \
> -    crate://crates.io/pyo3-ffi/0.20.0 \
> -    crate://crates.io/pyo3-macros/0.20.0 \
> -    crate://crates.io/pyo3-macros-backend/0.20.0 \
> +    crate://crates.io/percent-encoding/2.3.1 \
> +    crate://crates.io/proc-macro2/1.0.76 \
> +    crate://crates.io/pyo3/0.20.2 \
> +    crate://crates.io/pyo3-build-config/0.20.2 \
> +    crate://crates.io/pyo3-ffi/0.20.2 \
> +    crate://crates.io/pyo3-macros/0.20.2 \
> +    crate://crates.io/pyo3-macros-backend/0.20.2 \
>      crate://crates.io/python3-dll-a/0.2.9 \
> -    crate://crates.io/quote/1.0.29 \
> +    crate://crates.io/quote/1.0.35 \
>      crate://crates.io/redox_syscall/0.3.5 \
>      crate://crates.io/regex/1.10.2 \
>      crate://crates.io/regex-automata/0.4.3 \
> @@ -52,15 +53,15 @@ SRC_URI +=3D " \
>      crate://crates.io/rustversion/1.0.13 \
>      crate://crates.io/ryu/1.0.14 \
>      crate://crates.io/scopeguard/1.1.0 \
> -    crate://crates.io/serde/1.0.190 \
> -    crate://crates.io/serde_derive/1.0.190 \
> -    crate://crates.io/serde_json/1.0.108 \
> -    crate://crates.io/smallvec/1.11.1 \
> +    crate://crates.io/serde/1.0.195 \
> +    crate://crates.io/serde_derive/1.0.195 \
> +    crate://crates.io/serde_json/1.0.109 \
> +    crate://crates.io/smallvec/1.11.2 \
>      crate://crates.io/speedate/0.13.0 \
>      crate://crates.io/static_assertions/1.1.0 \
>      crate://crates.io/strum/0.25.0 \
>      crate://crates.io/strum_macros/0.25.3 \
> -    crate://crates.io/syn/2.0.38 \
> +    crate://crates.io/syn/2.0.48 \
>      crate://crates.io/target-lexicon/0.12.9 \
>      crate://crates.io/tinyvec/1.6.0 \
>      crate://crates.io/tinyvec_macros/0.1.1 \
> @@ -68,8 +69,8 @@ SRC_URI +=3D " \
>      crate://crates.io/unicode-ident/1.0.10 \
>      crate://crates.io/unicode-normalization/0.1.22 \
>      crate://crates.io/unindent/0.2.3 \
> -    crate://crates.io/url/2.4.1 \
> -    crate://crates.io/uuid/1.5.0 \
> +    crate://crates.io/url/2.5.0 \
> +    crate://crates.io/uuid/1.6.1 \
>      crate://crates.io/version_check/0.9.4 \
>      crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
>      crate://crates.io/windows-targets/0.48.1 \
> @@ -80,28 +81,29 @@ SRC_URI +=3D " \
>      crate://crates.io/windows_x86_64_gnu/0.48.0 \
>      crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
>      crate://crates.io/windows_x86_64_msvc/0.48.0 \
> -    crate://crates.io/zerocopy/0.7.20 \
> -    crate://crates.io/zerocopy-derive/0.7.20 \
> +    crate://crates.io/zerocopy/0.7.32 \
> +    crate://crates.io/zerocopy-derive/0.7.32 \
>  "
>
> -SRC_URI[ahash-0.8.6.sha256sum] =3D
> "91429305e9f0a25f6205c5b8e0d2db09e0708a7a6df0f42212bb56c32c8ac97a"
> +SRC_URI[ahash-0.8.7.sha256sum] =3D
> "77c3a9648d43b9cd48db467b3f87fdd6e146bcc88ab0180006cef2179fe11d01"
>  SRC_URI[aho-corasick-1.0.2.sha256sum] =3D
> "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
> +SRC_URI[allocator-api2-0.2.16.sha256sum] =3D
> "0942ffc6dcaadf03badf6e6a2d0228460359d5e34b57ccdc720b7382dfbd5ec5"
>  SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> -SRC_URI[base64-0.21.5.sha256sum] =3D
> "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
> +SRC_URI[base64-0.21.7.sha256sum] =3D
> "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
>  SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
>  SRC_URI[cc-1.0.79.sha256sum] =3D
> "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
>  SRC_URI[enum_dispatch-0.3.12.sha256sum] =3D
> "8f33313078bb8d4d05a2733a94ac4c2d8a0df9a2b84424ebf4f33bfc224a890e"
>  SRC_URI[equivalent-1.0.1.sha256sum] =3D
> "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
> -SRC_URI[form_urlencoded-1.2.0.sha256sum] =3D
> "a62bc1cf6f830c2ec14a513a9fb124d0a213a629668a4186f329db21fe045652"
> +SRC_URI[form_urlencoded-1.2.1.sha256sum] =3D
> "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
>  SRC_URI[getrandom-0.2.10.sha256sum] =3D
> "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
> -SRC_URI[hashbrown-0.14.0.sha256sum] =3D
> "2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a"
> +SRC_URI[hashbrown-0.14.3.sha256sum] =3D
> "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
>  SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> -SRC_URI[idna-0.4.0.sha256sum] =3D
> "7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c"
> +SRC_URI[idna-0.5.0.sha256sum] =3D
> "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
>  SRC_URI[indexmap-2.0.0.sha256sum] =3D
> "d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d"
>  SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
>  SRC_URI[itoa-1.0.8.sha256sum] =3D
> "62b02a5381cc465bd3041d84623d0fa3b66738b52b8e2fc3bab8ad63ab032f4a"
> -SRC_URI[jiter-0.0.4.sha256sum] =3D
> "b27d419c535bf7b50ad355278b1159cbf0cc8d507ea003d625b17bf0375720b8"
> +SRC_URI[jiter-0.0.6.sha256sum] =3D
> "87db066a99f69382be06d02313f8ce989996b53a04a8a70cfd1a6483a56227f7"
>  SRC_URI[lexical-core-0.8.5.sha256sum] =3D
> "2cde5de06e8d4c2faabc400238f9ae1c74d5412d03a7bd067645ccbc47070e46"
>  SRC_URI[lexical-parse-float-0.8.5.sha256sum] =3D
> "683b3a5ebd0130b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
>  SRC_URI[lexical-parse-integer-0.8.6.sha256sum] =3D
> "6d0994485ed0c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
> @@ -118,15 +120,15 @@ SRC_URI[num-traits-0.2.16.sha256sum] =3D
> "f30b0abd723be7e2ffca1272140fac1a2f084c77
>  SRC_URI[once_cell-1.18.0.sha256sum] =3D
> "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
>  SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
>  SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D
> "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
> -SRC_URI[percent-encoding-2.3.0.sha256sum] =3D
> "9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94"
> -SRC_URI[proc-macro2-1.0.69.sha256sum] =3D
> "134c189feb4956b20f6f547d2cf727d4c0fe06722b20a0eec87ed445a97f92da"
> -SRC_URI[pyo3-0.20.0.sha256sum] =3D
> "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
> -SRC_URI[pyo3-build-config-0.20.0.sha256sum] =3D
> "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
> -SRC_URI[pyo3-ffi-0.20.0.sha256sum] =3D
> "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
> -SRC_URI[pyo3-macros-0.20.0.sha256sum] =3D
> "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
> -SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] =3D
> "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
> +SRC_URI[percent-encoding-2.3.1.sha256sum] =3D
> "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
> +SRC_URI[proc-macro2-1.0.76.sha256sum] =3D
> "95fc56cda0b5c3325f5fbbd7ff9fda9e02bb00bb3dac51252d2f1bfa1cb8cc8c"
> +SRC_URI[pyo3-0.20.2.sha256sum] =3D
> "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
> +SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D
> "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
> +SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D
> "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
> +SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D
> "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
> +SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D
> "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
>  SRC_URI[python3-dll-a-0.2.9.sha256sum] =3D
> "d5f07cd4412be8fa09a721d40007c483981bbe072cd6a21f2e83e04ec8f8343f"
> -SRC_URI[quote-1.0.29.sha256sum] =3D
> "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
> +SRC_URI[quote-1.0.35.sha256sum] =3D
> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
>  SRC_URI[redox_syscall-0.3.5.sha256sum] =3D
> "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
>  SRC_URI[regex-1.10.2.sha256sum] =3D
> "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
>  SRC_URI[regex-automata-0.4.3.sha256sum] =3D
> "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
> @@ -134,15 +136,15 @@ SRC_URI[regex-syntax-0.8.2.sha256sum] =3D
> "c08c74e62047bb2de4ff487b251e4a92e24f487
>  SRC_URI[rustversion-1.0.13.sha256sum] =3D
> "dc31bd9b61a32c31f9650d18add92aa83a49ba979c143eefd27fe7177b05bd5f"
>  SRC_URI[ryu-1.0.14.sha256sum] =3D
> "fe232bdf6be8c8de797b22184ee71118d63780ea42ac85b61d1baa6d3b782ae9"
>  SRC_URI[scopeguard-1.1.0.sha256sum] =3D
> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> -SRC_URI[serde-1.0.190.sha256sum] =3D
> "91d3c334ca1ee894a2c6f6ad698fe8c435b76d504b13d436f0685d648d6d96f7"
> -SRC_URI[serde_derive-1.0.190.sha256sum] =3D
> "67c5609f394e5c2bd7fc51efda478004ea80ef42fee983d5c67a65e34f32c0e3"
> -SRC_URI[serde_json-1.0.108.sha256sum] =3D
> "3d1c7e3eac408d115102c4c24ad393e0821bb3a5df4d506a80f85f7a742a526b"
> -SRC_URI[smallvec-1.11.1.sha256sum] =3D
> "942b4a808e05215192e39f4ab80813e599068285906cc91aa64f923db842bd5a"
> +SRC_URI[serde-1.0.195.sha256sum] =3D
> "63261df402c67811e9ac6def069e4786148c4563f4b50fd4bf30aa370d626b02"
> +SRC_URI[serde_derive-1.0.195.sha256sum] =3D
> "46fe8f8603d81ba86327b23a2e9cdf49e1255fb94a4c5f297f6ee0547178ea2c"
> +SRC_URI[serde_json-1.0.109.sha256sum] =3D
> "cb0652c533506ad7a2e353cce269330d6afd8bdfb6d75e0ace5b35aacbd7b9e9"
> +SRC_URI[smallvec-1.11.2.sha256sum] =3D
> "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
>  SRC_URI[speedate-0.13.0.sha256sum] =3D
> "242f76c50fd18cbf098607090ade73a08d39cfd84ea835f3796a2c855223b19b"
>  SRC_URI[static_assertions-1.1.0.sha256sum] =3D
> "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
>  SRC_URI[strum-0.25.0.sha256sum] =3D
> "290d54ea6f91c969195bdbcd7442c8c2a2ba87da8bf60a7ee86a235d4bc1e125"
>  SRC_URI[strum_macros-0.25.3.sha256sum] =3D
> "23dc1fa9ac9c169a78ba62f0b841814b7abae11bdd047b9c58f893439e309ea0"
> -SRC_URI[syn-2.0.38.sha256sum] =3D
> "e96b79aaa137db8f61e26363a0c9b47d8b4ec75da28b7d1d614c2303e232408b"
> +SRC_URI[syn-2.0.48.sha256sum] =3D
> "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
>  SRC_URI[target-lexicon-0.12.9.sha256sum] =3D
> "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
>  SRC_URI[tinyvec-1.6.0.sha256sum] =3D
> "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
>  SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D
> "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> @@ -150,8 +152,8 @@ SRC_URI[unicode-bidi-0.3.13.sha256sum] =3D
> "92888ba5573ff080736b3648696b70cafad7d2
>  SRC_URI[unicode-ident-1.0.10.sha256sum] =3D
> "22049a19f4a68748a168c0fc439f9516686aa045927ff767eca0a85101fb6e73"
>  SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D
> "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
>  SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
> -SRC_URI[url-2.4.1.sha256sum] =3D
> "143b538f18257fac9cad154828a57c6bf5157e1aa604d4816b5995bf6de87ae5"
> -SRC_URI[uuid-1.5.0.sha256sum] =3D
> "88ad59a7560b41a70d191093a945f0b87bc1deeda46fb237479708a1d6b6cdfc"
> +SRC_URI[url-2.5.0.sha256sum] =3D
> "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
> +SRC_URI[uuid-1.6.1.sha256sum] =3D
> "5e395fcf16a7a3d8127ec99782007af141946b4795001f876d54fb0d55978560"
>  SRC_URI[version_check-0.9.4.sha256sum] =3D
> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
>  SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D
> "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
>  SRC_URI[windows-targets-0.48.1.sha256sum] =3D
> "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
> @@ -162,5 +164,5 @@ SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D
> "4542c6e364ce21bf45d69fdd2a8e455fa
>  SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D
> "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
>  SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D
> "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
>  SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D
> "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
> -SRC_URI[zerocopy-0.7.20.sha256sum] =3D
> "dd66a62464e3ffd4e37bd09950c2b9dd6c4f8767380fabba0d523f9a775bc85a"
> -SRC_URI[zerocopy-derive-0.7.20.sha256sum] =3D
> "255c4596d41e6916ced49cfafea18727b24d67878fa180ddfd69b9df34fd1726"
> +SRC_URI[zerocopy-0.7.32.sha256sum] =3D
> "74d4d3961e53fa4c9a25a8637fc2bfaf2595b3d3ae34875568a5cf64787716be"
> +SRC_URI[zerocopy-derive-0.7.32.sha256sum] =3D
> "9ce1b18ccd8e73a9321186f97e46f9f04b778851177567b1975109d26a08d2a6"
> diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.14.6.bb b/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.16.2.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/
> python3-pydantic-core_2.14.6.bb
> rename to meta-python/recipes-devtools/python/
> python3-pydantic-core_2.16.2.bb
> index e58ee7fd6..7ac2b076c 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.2.bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "https://github.com/pydantic/pydantic-core"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a314d2856b3a55030c=
75c"
>
> -SRC_URI[sha256sum] =3D
> "1fd0c1d395372843fba13a51c28e3bb9d59bd7aebfeb17358ffaaa1e4dbbe948"
> +SRC_URI[sha256sum] =3D
> "0ba503850d8b8dcc18391f10de896ae51d37fe5fe43dbfb6a35c5c5cad271a06"
>
>  DEPENDS =3D "python3-maturin-native python3-typing-extensions"
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.b=
b
> b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> index 21341d26c..af465f423 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D09280955509d1c4ca14bae02f21d49a6"
>
>  inherit pypi python_hatchling
>
> -SRC_URI[sha256sum] =3D
> "b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a"
> +SRC_URI[sha256sum] =3D
> "ae887bd94eb404b09d86e4d12f93893bdca79d766e738528c6fa1c849f3c6bcf"
>
>  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108946):
> https://lists.openembedded.org/g/openembedded-devel/message/108946
> Mute This Topic: https://lists.openembedded.org/mt/104464238/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fee6ac0611d24cd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You don=E2=80=99t mention that this also upgrades python-=
pydantic-core and refreshes the -crates.inc</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">See my recent upgrades for what would be more helpful i=
n the commit log.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Feb 20, 2024 at 12:55=E2=80=AFAM wangmy via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wan=
gmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Wang Min=
gyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fuji=
tsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-Drop Python3.7 support<br>
-Drop Python 3.7, and PyPy 3.7 and 3.8<br>
-Use positional-only self in BaseModel constructor, so no field name can ev=
er<br>
=C2=A0conflict with it<br>
-Make @validate_call return a function instead of a custom descriptor - fix=
es<br>
=C2=A0binding issue with inheritance and adds self/cls argument to validati=
on errors<br>
-Exclude BaseModel docstring from JSON schema description<br>
-Introducing classproperty decorator for model_computed_fields<br>
-Explicitly raise an error if field names clashes with types<br>
-Use stricter serializer for unions of simple types<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/python3-pydantic-core-crates.inc=C2=A0 =C2=A0| 94 ++++++++=
++---------<br>
=C2=A0...<a href=3D"http://4.6.bb" rel=3D"noreferrer" target=3D"_blank">4.6=
.bb</a> =3D&gt; <a href=3D"http://python3-pydantic-core_2.16.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-pydantic-core_2.16.2.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A0...<a href=3D"http://tic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blan=
k">tic_2.5.3.bb</a> =3D&gt; <a href=3D"http://python3-pydantic_2.6.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-pydantic_2.6.0.bb</a>} |=C2=A0 2=
 +-<br>
=C2=A03 files changed, 50 insertions(+), 48 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pydantic-core_2.14.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyda=
ntic-core_2.14.6.bb</a> =3D&gt; <a href=3D"http://python3-pydantic-core_2.1=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-core_2.16.2.b=
b</a>} (94%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pydantic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2=
.5.3.bb</a> =3D&gt; <a href=3D"http://python3-pydantic_2.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-pydantic_2.6.0.bb</a>} (94%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crat=
es.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.i=
nc<br>
index 932cfc852..5518ff6ec 100644<br>
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc<=
br>
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc<=
br>
@@ -2,24 +2,25 @@<br>
<br>
=C2=A0# from Cargo.lock<br>
=C2=A0SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ahash/0.8.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ahash/0.8.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ahash/0.8.7" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ahash/0.8.7</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/aho-corasick/1.0.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/1.0.2</a> \<br=
>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/allocator-api2/0.2.16" r=
el=3D"noreferrer" target=3D"_blank">crates.io/allocator-api2/0.2.16</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.21.5" rel=3D"no=
referrer" target=3D"_blank">crates.io/base64/0.21.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.21.7" rel=3D"no=
referrer" target=3D"_blank">crates.io/base64/0.21.7</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cc/1.0.79" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cc/1.0.79</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/enum_dispatch/0.3.1=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/enum_dispatch/0.3.12</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/equivalent/1.0.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/equivalent/1.0.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/form_urlencoded/1.2.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/form_urlencoded/1.2.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/form_urlencoded/1.2.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/form_urlencoded/1.2.1</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/getrandom/0.2.10" r=
el=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.10</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.14.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hashbrown/0.14.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.14.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hashbrown/0.14.3</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/heck/0.4.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/heck/0.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna/0.4.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/idna/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna/0.5.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/idna/0.5.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/indexmap/2.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/indexmap/2.0.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/indoc/2.0.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/indoc/2.0.4</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/itoa/1.0.8" rel=3D"=
noreferrer" target=3D"_blank">crates.io/itoa/1.0.8</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiter/0.0.4" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/jiter/0.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiter/0.0.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/jiter/0.0.6</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/lexical-core/0.8.5"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-core/0.8.5</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/lexical-parse-float=
/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-parse-float/=
0.8.5</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/lexical-parse-integ=
er/0.8.6" rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-parse-inte=
ger/0.8.6</a> \<br>
@@ -36,15 +37,15 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/once_cell/1.18.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.18.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot/0.12.1"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.1</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot_core/0.=
9.8" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.8<=
/a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/percent-encoding/2.3.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/percent-encoding/2.3.0</a> \=
<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.69" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.69</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.20.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.20.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.20.0</=
a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.20=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.20=
.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/percent-encoding/2.3.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/percent-encoding/2.3.1</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.76" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.76</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.20.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.20.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.20.2</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.20=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.20=
.2</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/python3-dll-a/0.2.9=
" rel=3D"noreferrer" target=3D"_blank">crates.io/python3-dll-a/0.2.9</a> \<=
br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.29" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.29</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.35" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.35</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/redox_syscall/0.3.5=
" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.3.5</a> \<=
br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex/1.10.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/regex/1.10.2</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex-automata/0.4.=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-automata/0.4.3</a> =
\<br>
@@ -52,15 +53,15 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rustversion/1.0.13"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/rustversion/1.0.13</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ryu/1.0.14" rel=3D"=
noreferrer" target=3D"_blank">crates.io/ryu/1.0.14</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/scopeguard/1.1.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.190" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.190</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.190" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.190</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.108" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.108</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.11.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/smallvec/1.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.195" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.195</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.195" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.195</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.109" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.109</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.11.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/smallvec/1.11.2</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/speedate/0.13.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/speedate/0.13.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/static_assertions/1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/static_assertions/1.1.=
0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/strum/0.25.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/strum/0.25.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/strum_macros/0.25.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/strum_macros/0.25.3</a> \<=
br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.38" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/2.0.38</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.48" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/2.0.48</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.9" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.9</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tinyvec/1.6.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tinyvec/1.6.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tinyvec_macros/0.1.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/tinyvec_macros/0.1.1</a> =
\<br>
@@ -68,8 +69,8 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unicode-ident/1.0.1=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.10</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unicode-normalizati=
on/0.1.22" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-normaliza=
tion/0.1.22</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unindent/0.2.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.2.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/url/2.4.1" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/url/2.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/1.5.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/uuid/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/url/2.5.0" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/url/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/1.6.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/uuid/1.6.1</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/version_check/0.9.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<=
br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/wasi/0.11.0+wasi-sn=
apshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.11.0=
+wasi-snapshot-preview1</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows-targets/0.4=
8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.48.1<=
/a> \<br>
@@ -80,28 +81,29 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0=
.48.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_g=
nullvm/0.48.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc=
/0.48.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy/0.7.20" rel=3D"=
noreferrer" target=3D"_blank">crates.io/zerocopy/0.7.20</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy-derive/0.7.20" =
rel=3D"noreferrer" target=3D"_blank">crates.io/zerocopy-derive/0.7.20</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy/0.7.32" rel=3D"=
noreferrer" target=3D"_blank">crates.io/zerocopy/0.7.32</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy-derive/0.7.32" =
rel=3D"noreferrer" target=3D"_blank">crates.io/zerocopy-derive/0.7.32</a> \=
<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[ahash-0.8.6.sha256sum] =3D &quot;91429305e9f0a25f6205c5b8e0d2db09e=
0708a7a6df0f42212bb56c32c8ac97a&quot;<br>
+SRC_URI[ahash-0.8.7.sha256sum] =3D &quot;77c3a9648d43b9cd48db467b3f87fdd6e=
146bcc88ab0180006cef2179fe11d01&quot;<br>
=C2=A0SRC_URI[aho-corasick-1.0.2.sha256sum] =3D &quot;43f6cb1bf222025340178=
f382c426f13757b2960e89779dfcb319c32542a5a41&quot;<br>
+SRC_URI[allocator-api2-0.2.16.sha256sum] =3D &quot;0942ffc6dcaadf03badf6e6=
a2d0228460359d5e34b57ccdc720b7382dfbd5ec5&quot;<br>
=C2=A0SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575e9b05=
3f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
-SRC_URI[base64-0.21.5.sha256sum] =3D &quot;35636a1494ede3b646cc98f74f8e62c=
773a38a659ebc777a2cf26b9b74171df9&quot;<br>
+SRC_URI[base64-0.21.7.sha256sum] =3D &quot;9d297deb1925b89f2ccc13d7635fa07=
14f12c87adce1c75356b39ca9b7178567&quot;<br>
=C2=A0SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7df=
d33ccf595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
=C2=A0SRC_URI[cc-1.0.79.sha256sum] =3D &quot;50d30906286121d95be3d479533b45=
8f87493b30a4b5f79a607db8f5d11aa91f&quot;<br>
=C2=A0SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619e3cbc=
0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
=C2=A0SRC_URI[enum_dispatch-0.3.12.sha256sum] =3D &quot;8f33313078bb8d4d05a=
2733a94ac4c2d8a0df9a2b84424ebf4f33bfc224a890e&quot;<br>
=C2=A0SRC_URI[equivalent-1.0.1.sha256sum] =3D &quot;5443807d6dff69373d433ab=
9ef5378ad8df50ca6298caf15de6e52e24aaf54d5&quot;<br>
-SRC_URI[form_urlencoded-1.2.0.sha256sum] =3D &quot;a62bc1cf6f830c2ec14a513=
a9fb124d0a213a629668a4186f329db21fe045652&quot;<br>
+SRC_URI[form_urlencoded-1.2.1.sha256sum] =3D &quot;e13624c2627564efccf4934=
284bdd98cbaa14e79b0b5a141218e507b3a823456&quot;<br>
=C2=A0SRC_URI[getrandom-0.2.10.sha256sum] =3D &quot;be4136b2a15dd319360be1c=
07d9933517ccf0be8f16bf62a3bee4f0d618df427&quot;<br>
-SRC_URI[hashbrown-0.14.0.sha256sum] =3D &quot;2c6201b9ff9fd90a5a3bac2e56a8=
30d0caa509576f0e503818ee82c181b3437a&quot;<br>
+SRC_URI[hashbrown-0.14.3.sha256sum] =3D &quot;290f1a1d9242c78d09ce40a5e87e=
7554ee637af1351968159f4952f028f75604&quot;<br>
=C2=A0SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910cecb028156=
0f54b440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
-SRC_URI[idna-0.4.0.sha256sum] =3D &quot;7d20d6b07bfbc108882d88ed8e37d39636=
dcc260e15e30c45e6ba089610b917c&quot;<br>
+SRC_URI[idna-0.5.0.sha256sum] =3D &quot;634d9b1461af396cad843f47fdba5597a4=
f9e6ddd4bfb6ff5d85028c25cb12f6&quot;<br>
=C2=A0SRC_URI[indexmap-2.0.0.sha256sum] =3D &quot;d5477fe2230a79769d8dc68e0=
eabf5437907c0457a5614a9e8dddb67f65eb65d&quot;<br>
=C2=A0SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513daff4240b4=
797e342f988cecda4fb6c939150f96315fd8&quot;<br>
=C2=A0SRC_URI[itoa-1.0.8.sha256sum] =3D &quot;62b02a5381cc465bd3041d84623d0=
fa3b66738b52b8e2fc3bab8ad63ab032f4a&quot;<br>
-SRC_URI[jiter-0.0.4.sha256sum] =3D &quot;b27d419c535bf7b50ad355278b1159cbf=
0cc8d507ea003d625b17bf0375720b8&quot;<br>
+SRC_URI[jiter-0.0.6.sha256sum] =3D &quot;87db066a99f69382be06d02313f8ce989=
996b53a04a8a70cfd1a6483a56227f7&quot;<br>
=C2=A0SRC_URI[lexical-core-0.8.5.sha256sum] =3D &quot;2cde5de06e8d4c2faabc4=
00238f9ae1c74d5412d03a7bd067645ccbc47070e46&quot;<br>
=C2=A0SRC_URI[lexical-parse-float-0.8.5.sha256sum] =3D &quot;683b3a5ebd0130=
b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f&quot;<br>
=C2=A0SRC_URI[lexical-parse-integer-0.8.6.sha256sum] =3D &quot;6d0994485ed0=
c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9&quot;<br>
@@ -118,15 +120,15 @@ SRC_URI[num-traits-0.2.16.sha256sum] =3D &quot;f30b0a=
bd723be7e2ffca1272140fac1a2f084c77<br>
=C2=A0SRC_URI[once_cell-1.18.0.sha256sum] =3D &quot;dd8b5dd2ae5ed71462c5402=
58bedcb51965123ad7e7ccf4b9a8cafaa4a63576d&quot;<br>
=C2=A0SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9f06bc9fff=
0a37ff4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
=C2=A0SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D &quot;93f00c865fe7cabf6=
50081affecd3871070f26767e7b2070a3ffae14c654b447&quot;<br>
-SRC_URI[percent-encoding-2.3.0.sha256sum] =3D &quot;9b2a4787296e9989611394=
c33f193f676704af1686e70b8f8033ab5ba9a35a94&quot;<br>
-SRC_URI[proc-macro2-1.0.69.sha256sum] =3D &quot;134c189feb4956b20f6f547d2c=
f727d4c0fe06722b20a0eec87ed445a97f92da&quot;<br>
-SRC_URI[pyo3-0.20.0.sha256sum] =3D &quot;04e8453b658fe480c3e70c8ed4e3d3ec3=
3eb74988bd186561b0cc66b85c3bc4b&quot;<br>
-SRC_URI[pyo3-build-config-0.20.0.sha256sum] =3D &quot;a96fe70b176a89cff78f=
2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5&quot;<br>
-SRC_URI[pyo3-ffi-0.20.0.sha256sum] =3D &quot;214929900fd25e6604661ed9cf349=
727c8920d47deff196c4e28165a6ef2a96b&quot;<br>
-SRC_URI[pyo3-macros-0.20.0.sha256sum] =3D &quot;dac53072f717aa1bfa4db832b3=
9de8c875b7c7af4f4a6fe93cdbf9264cf8383b&quot;<br>
-SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] =3D &quot;7774b5a8282bd4f25f=
803b1f0d945120be959a36c72e08e7cd031c792fdfd424&quot;<br>
+SRC_URI[percent-encoding-2.3.1.sha256sum] =3D &quot;e3148f5046208a5d56bcfc=
03053e3ca6334e51da8dfb19b6cdc8b306fae3283e&quot;<br>
+SRC_URI[proc-macro2-1.0.76.sha256sum] =3D &quot;95fc56cda0b5c3325f5fbbd7ff=
9fda9e02bb00bb3dac51252d2f1bfa1cb8cc8c&quot;<br>
+SRC_URI[pyo3-0.20.2.sha256sum] =3D &quot;9a89dc7a5850d0e983be1ec2a463a171d=
20990487c3cfcd68b5363f1ee3d6fe0&quot;<br>
+SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D &quot;07426f0d8fe5a601f262=
93f300afd1a7b1ed5e78b2a705870c5f30893c5163be&quot;<br>
+SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D &quot;dbb7dec17e17766b46bca4f1a4215=
a85006b4c2ecde122076c562dd058da6cf1&quot;<br>
+SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D &quot;05f738b4e40d50b5711957f142=
878cfa0f28e054aa0ebdfc3fd137a843f74ed3&quot;<br>
+SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D &quot;0fc910d4851847827d=
af9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f&quot;<br>
=C2=A0SRC_URI[python3-dll-a-0.2.9.sha256sum] =3D &quot;d5f07cd4412be8fa09a7=
21d40007c483981bbe072cd6a21f2e83e04ec8f8343f&quot;<br>
-SRC_URI[quote-1.0.29.sha256sum] =3D &quot;573015e8ab27661678357f27dc264607=
38fd2b6c86e46f386fde94cb5d913105&quot;<br>
+SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf503a6466c5d525=
1535d108ee747472c3977cc5acc868ef&quot;<br>
=C2=A0SRC_URI[redox_syscall-0.3.5.sha256sum] =3D &quot;567664f262709473930a=
4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29&quot;<br>
=C2=A0SRC_URI[regex-1.10.2.sha256sum] =3D &quot;380b951a9c5e80ddfd6136919ee=
f32310721aa4aacd4889a8d39124b026ab343&quot;<br>
=C2=A0SRC_URI[regex-automata-0.4.3.sha256sum] =3D &quot;5f804c7828047e88b2d=
32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f&quot;<br>
@@ -134,15 +136,15 @@ SRC_URI[regex-syntax-0.8.2.sha256sum] =3D &quot;c08c7=
4e62047bb2de4ff487b251e4a92e24f487<br>
=C2=A0SRC_URI[rustversion-1.0.13.sha256sum] =3D &quot;dc31bd9b61a32c31f9650=
d18add92aa83a49ba979c143eefd27fe7177b05bd5f&quot;<br>
=C2=A0SRC_URI[ryu-1.0.14.sha256sum] =3D &quot;fe232bdf6be8c8de797b22184ee71=
118d63780ea42ac85b61d1baa6d3b782ae9&quot;<br>
=C2=A0SRC_URI[scopeguard-1.1.0.sha256sum] =3D &quot;d29ab0c6d3fc0ee92fe66e2=
d99f700eab17a8d57d1c1d3b748380fb20baa78cd&quot;<br>
-SRC_URI[serde-1.0.190.sha256sum] =3D &quot;91d3c334ca1ee894a2c6f6ad698fe8c=
435b76d504b13d436f0685d648d6d96f7&quot;<br>
-SRC_URI[serde_derive-1.0.190.sha256sum] =3D &quot;67c5609f394e5c2bd7fc51ef=
da478004ea80ef42fee983d5c67a65e34f32c0e3&quot;<br>
-SRC_URI[serde_json-1.0.108.sha256sum] =3D &quot;3d1c7e3eac408d115102c4c24a=
d393e0821bb3a5df4d506a80f85f7a742a526b&quot;<br>
-SRC_URI[smallvec-1.11.1.sha256sum] =3D &quot;942b4a808e05215192e39f4ab8081=
3e599068285906cc91aa64f923db842bd5a&quot;<br>
+SRC_URI[serde-1.0.195.sha256sum] =3D &quot;63261df402c67811e9ac6def069e478=
6148c4563f4b50fd4bf30aa370d626b02&quot;<br>
+SRC_URI[serde_derive-1.0.195.sha256sum] =3D &quot;46fe8f8603d81ba86327b23a=
2e9cdf49e1255fb94a4c5f297f6ee0547178ea2c&quot;<br>
+SRC_URI[serde_json-1.0.109.sha256sum] =3D &quot;cb0652c533506ad7a2e353cce2=
69330d6afd8bdfb6d75e0ace5b35aacbd7b9e9&quot;<br>
+SRC_URI[smallvec-1.11.2.sha256sum] =3D &quot;4dccd0940a2dcdf68d092b8cbab7d=
c0ad8fa938bf95787e1b916b0e3d0e8e970&quot;<br>
=C2=A0SRC_URI[speedate-0.13.0.sha256sum] =3D &quot;242f76c50fd18cbf09860709=
0ade73a08d39cfd84ea835f3796a2c855223b19b&quot;<br>
=C2=A0SRC_URI[static_assertions-1.1.0.sha256sum] =3D &quot;a2eb9349b6444b32=
6872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f&quot;<br>
=C2=A0SRC_URI[strum-0.25.0.sha256sum] =3D &quot;290d54ea6f91c969195bdbcd744=
2c8c2a2ba87da8bf60a7ee86a235d4bc1e125&quot;<br>
=C2=A0SRC_URI[strum_macros-0.25.3.sha256sum] =3D &quot;23dc1fa9ac9c169a78ba=
62f0b841814b7abae11bdd047b9c58f893439e309ea0&quot;<br>
-SRC_URI[syn-2.0.38.sha256sum] =3D &quot;e96b79aaa137db8f61e26363a0c9b47d8b=
4ec75da28b7d1d614c2303e232408b&quot;<br>
+SRC_URI[syn-2.0.48.sha256sum] =3D &quot;0f3531638e407dfc0814761abb7c00a5b5=
4992b849452a0646b7f65c9f770f3f&quot;<br>
=C2=A0SRC_URI[target-lexicon-0.12.9.sha256sum] =3D &quot;df8e77cb757a61f51b=
947ec4a7e3646efd825b73561db1c232a8ccb639e611a0&quot;<br>
=C2=A0SRC_URI[tinyvec-1.6.0.sha256sum] =3D &quot;87cc5ceb3875bb20c2890005a4=
e226a4651264a5c75edb2421b52861a0a0cb50&quot;<br>
=C2=A0SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D &quot;1f3ccbac311fea05f86=
f61904b462b55fb3df8837a366dfc601a0161d0532f20&quot;<br>
@@ -150,8 +152,8 @@ SRC_URI[unicode-bidi-0.3.13.sha256sum] =3D &quot;92888b=
a5573ff080736b3648696b70cafad7d2<br>
=C2=A0SRC_URI[unicode-ident-1.0.10.sha256sum] =3D &quot;22049a19f4a68748a16=
8c0fc439f9516686aa045927ff767eca0a85101fb6e73&quot;<br>
=C2=A0SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D &quot;5c5713f0fc4=
b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921&quot;<br>
=C2=A0SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e1754487cb58364ee=
906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
-SRC_URI[url-2.4.1.sha256sum] =3D &quot;143b538f18257fac9cad154828a57c6bf51=
57e1aa604d4816b5995bf6de87ae5&quot;<br>
-SRC_URI[uuid-1.5.0.sha256sum] =3D &quot;88ad59a7560b41a70d191093a945f0b87b=
c1deeda46fb237479708a1d6b6cdfc&quot;<br>
+SRC_URI[url-2.5.0.sha256sum] =3D &quot;31e6302e3bb753d46e83516cae55ae196fc=
0c309407cf11ab35cc51a4c2a4633&quot;<br>
+SRC_URI[uuid-1.6.1.sha256sum] =3D &quot;5e395fcf16a7a3d8127ec99782007af141=
946b4795001f876d54fb0d55978560&quot;<br>
=C2=A0SRC_URI[version_check-0.9.4.sha256sum] =3D &quot;49874b5167b65d7193b8=
aba1567f5c7d93d001cafc34600cee003eda787e483f&quot;<br>
=C2=A0SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D &quot;9c8d8=
7e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423&quot;<br>
=C2=A0SRC_URI[windows-targets-0.48.1.sha256sum] =3D &quot;05d4b17490f70499f=
20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f&quot;<br>
@@ -162,5 +164,5 @@ SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D &quot;4=
542c6e364ce21bf45d69fdd2a8e455fa<br>
=C2=A0SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D &quot;ca2b8a661f7628=
cbd23440e50b05d705db3686f894fc9580820623656af974b1&quot;<br>
=C2=A0SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D &quot;7896dbc1f4=
1e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953&quot;<br>
=C2=A0SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D &quot;1a515f5799fe4=
961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a&quot;<br>
-SRC_URI[zerocopy-0.7.20.sha256sum] =3D &quot;dd66a62464e3ffd4e37bd09950c2b=
9dd6c4f8767380fabba0d523f9a775bc85a&quot;<br>
-SRC_URI[zerocopy-derive-0.7.20.sha256sum] =3D &quot;255c4596d41e6916ced49c=
fafea18727b24d67878fa180ddfd69b9df34fd1726&quot;<br>
+SRC_URI[zerocopy-0.7.32.sha256sum] =3D &quot;74d4d3961e53fa4c9a25a8637fc2b=
faf2595b3d3ae34875568a5cf64787716be&quot;<br>
+SRC_URI[zerocopy-derive-0.7.32.sha256sum] =3D &quot;9ce1b18ccd8e73a9321186=
f97e46f9f04b778851177567b1975109d26a08d2a6&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic-core_2.14.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydan=
tic-core_2.14.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydantic-core_2.16.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pydantic-core_2.16.2.bb</a><br>
similarity index 94%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ydantic-core_2.14.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydant=
ic-core_2.14.6.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pyd=
antic-core_2.16.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic=
-core_2.16.2.bb</a><br>
index e58ee7fd6..7ac2b076c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.14.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.14.6.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.16.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.16.2.bb</a><br>
@@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/pydantic/p=
ydantic-core" rel=3D"noreferrer" target=3D"_blank">https://github.com/pydan=
tic/pydantic-core</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dab599c188b4a314d2856b=
3a55030c75c&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;1fd0c1d395372843fba13a51c28e3bb9d59bd7aebfeb1=
7358ffaaa1e4dbbe948&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0ba503850d8b8dcc18391f10de896ae51d37fe5fe43db=
fb6a35c5c5cad271a06&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;python3-maturin-native python3-typing-extensions&qu=
ot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.=
5.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.=
6.0.bb</a><br>
similarity index 94%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ydantic_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.5=
.3.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pyd=
antic_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.6.0=
.bb</a><br>
index 21341d26c..af465f423 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c_2.5.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.5.3.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.6.0.bb<=
/a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D092809555=
09d1c4ca14bae02f21d49a6&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b3ef57c62535b0941697cce638c08900d87fcb67e29cf=
a99e8a68f747f393f7a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ae887bd94eb404b09d86e4d12f93893bdca79d766e738=
528c6fa1c849f3c6bcf&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-hatch-fancy-pypi-readme-native&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108946): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108946" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108946</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104464238/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104464238/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fee6ac0611d24cd5--

