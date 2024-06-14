Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E9DC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 16:13:00 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.15782.1718381572089712800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 09:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cl6itt0V;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25496642859so1161799fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718381571; x=1718986371; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4AgZtuSMQHgjaD/ETrVdOUqKAzSLLDFxjH0JBftr9I=;
        b=cl6itt0VSPpDz4BbBBpjLZAkP3X9uSBWs44JBExLzNlNdWut0IUr4iO74b+ubUUFF2
         IqrvMVU5tdRIpTholroNaRspPP2nEBo0k8Np7iiaV0mDt9ecgfEZ8wb8P5gl/5xkLfoy
         xaex0/1X4ggPtzb0ZERrxSUKeUA8963G5ULIxv6qGXQBFsLWd7txYe126eJ1O5GeRAP4
         cuP/YBaR9iLVpnVIPXeNl4sCeHQUh0GHyPeKVNsucNP7AkBiF3ki1Z62Qlg2rgFEtwfi
         29UourNSLwleyUHim1l9ZoE0oh1j4+wMtNRCitDIMnQPOE/6IPBqtfBF+eccB77PEl3j
         M0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718381571; x=1718986371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4AgZtuSMQHgjaD/ETrVdOUqKAzSLLDFxjH0JBftr9I=;
        b=sUroDDk4l98GChIyCErfVSbZtY/SDvJ6rDTgz8zhHGjFMRUYEXBCGPG9ILB6QfhV3A
         5m2q+UK44HkurGUIhZFPnTYTROVeLlLZdPzGLNFyAqoq7a00gBj9itXNuKeTltTEs1ub
         S18jPRg9IGYXpwoVckiWI0zS3SRWmeeq5zgbUPvJScDMMz+QR5bwFw3rCnre9j+llmMc
         rNaV25gZBkdytxLMDlka0cFvYPryUwKGzaFpTn6+b4mS1PrfSIxUXO2d1LSc4EKKqg61
         N/dtJ9Y5xe/DBa8P+YjyhYuomqH20knpF6wE2wzTIRE/ipvBtWYJoPmtAjgfi81XOebN
         Dc6A==
X-Gm-Message-State: AOJu0YwopgnBvHq04lZbQlPmcWChlV90WAW991ARakgnoN5yQEAdVfra
	eAoz6JWPqrAsZ3/S0yFchZipGvCcJkEddG17ylFZwfftb1oXlctLgHt1oObRMWcWfvKB1IUCaUR
	ifCM8WGexCsjokD85IkKFdOLoTzI=
X-Google-Smtp-Source: AGHT+IGF3JLjFiPfTKquzD3pr+awTyMuNWovQgcrVsfOo3LprvAva8hoLJhli0oXhYuWNkr9yDjHqf/o7PwGi9YgfE8=
X-Received: by 2002:a05:6871:54e:b0:254:df39:1a09 with SMTP id
 586e51a60fabf-25842b7ac6emr3300989fac.49.1718381570926; Fri, 14 Jun 2024
 09:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240614015550.2632671-2-tim.orling@konsulko.com>
In-Reply-To: <20240614015550.2632671-2-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jun 2024 09:12:16 -0700
Message-ID: <CAMKF1sobQiUDRTD2xmZ4SKswHn+NR18oYFmCOo9h1Ao4mFwaZA@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] python3-pydantic-core: upgrade 2.16.3 -> 2.19.0
To: tim.orling@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 16:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110912

Hi Tim

Thanks for working on these upgrades. Would you mind rebasing on
latest master and resending them

On Thu, Jun 13, 2024 at 6:56=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> From: Tim Orling <tim.orling@konsulko.com>
>
> * Refresh -crates.inc
> * Drop backported patch; merged upstream
> * Add python3-zoneinfo to RDEPENDS for ptest
>
> Full commit log:
> https://github.com/pydantic/pydantic-core/compare/v2.16.3...v2.19.0
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Tested with meta-python-image-ptest-python3-pydantic-core on qemux86-64
>
>  .../python/python3-pydantic-core-crates.inc   |  92 +++++++------
>  ...-github.com-pyo3-pyo3-from-0.20.2-to.patch | 126 ------------------
>  ...6.3.bb =3D> python3-pydantic-core_2.19.0.bb} |   4 +-
>  3 files changed, 50 insertions(+), 172 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-=
core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
>  rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.3=
.bb =3D> python3-pydantic-core_2.19.0.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-cr=
ates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates=
.inc
> index dd2027948..f37077245 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.in=
c
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.in=
c
> @@ -2,32 +2,30 @@
>
>  # from Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/ahash/0.8.7 \
> +    crate://crates.io/ahash/0.8.10 \
>      crate://crates.io/aho-corasick/1.0.2 \
> -    crate://crates.io/allocator-api2/0.2.16 \
>      crate://crates.io/autocfg/1.1.0 \
>      crate://crates.io/base64/0.21.7 \
>      crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/bitvec/1.0.1 \
>      crate://crates.io/cc/1.0.79 \
>      crate://crates.io/cfg-if/1.0.0 \
> -    crate://crates.io/enum_dispatch/0.3.12 \
> +    crate://crates.io/enum_dispatch/0.3.13 \
>      crate://crates.io/equivalent/1.0.1 \
>      crate://crates.io/form_urlencoded/1.2.1 \
> +    crate://crates.io/funty/2.0.0 \
>      crate://crates.io/getrandom/0.2.10 \
>      crate://crates.io/hashbrown/0.14.3 \
>      crate://crates.io/heck/0.4.1 \
>      crate://crates.io/idna/0.5.0 \
> -    crate://crates.io/indexmap/2.0.0 \
> +    crate://crates.io/indexmap/2.2.2 \
>      crate://crates.io/indoc/2.0.4 \
>      crate://crates.io/itoa/1.0.8 \
> -    crate://crates.io/jiter/0.0.6 \
> -    crate://crates.io/lexical-core/0.8.5 \
> +    crate://crates.io/jiter/0.4.1 \
>      crate://crates.io/lexical-parse-float/0.8.5 \
>      crate://crates.io/lexical-parse-integer/0.8.6 \
>      crate://crates.io/lexical-util/0.8.5 \
> -    crate://crates.io/lexical-write-float/0.8.5 \
> -    crate://crates.io/lexical-write-integer/0.8.5 \
> -    crate://crates.io/libc/0.2.147 \
> +    crate://crates.io/libc/0.2.155 \
>      crate://crates.io/lock_api/0.4.10 \
>      crate://crates.io/memchr/2.6.3 \
>      crate://crates.io/memoffset/0.9.0 \
> @@ -40,29 +38,32 @@ SRC_URI +=3D " \
>      crate://crates.io/percent-encoding/2.3.1 \
>      crate://crates.io/portable-atomic/1.6.0 \
>      crate://crates.io/proc-macro2/1.0.76 \
> -    crate://crates.io/pyo3/0.20.3 \
> -    crate://crates.io/pyo3-build-config/0.20.3 \
> -    crate://crates.io/pyo3-ffi/0.20.3 \
> -    crate://crates.io/pyo3-macros/0.20.3 \
> -    crate://crates.io/pyo3-macros-backend/0.20.3 \
> +    crate://crates.io/pyo3/0.21.2 \
> +    crate://crates.io/pyo3-build-config/0.21.2 \
> +    crate://crates.io/pyo3-ffi/0.21.2 \
> +    crate://crates.io/pyo3-macros/0.21.2 \
> +    crate://crates.io/pyo3-macros-backend/0.21.2 \
>      crate://crates.io/python3-dll-a/0.2.9 \
>      crate://crates.io/quote/1.0.35 \
> +    crate://crates.io/radium/0.7.0 \
>      crate://crates.io/redox_syscall/0.3.5 \
> -    crate://crates.io/regex/1.10.2 \
> -    crate://crates.io/regex-automata/0.4.3 \
> +    crate://crates.io/regex/1.10.4 \
> +    crate://crates.io/regex-automata/0.4.5 \
>      crate://crates.io/regex-syntax/0.8.2 \
>      crate://crates.io/rustversion/1.0.13 \
>      crate://crates.io/ryu/1.0.14 \
>      crate://crates.io/scopeguard/1.1.0 \
> -    crate://crates.io/serde/1.0.195 \
> -    crate://crates.io/serde_derive/1.0.195 \
> -    crate://crates.io/serde_json/1.0.109 \
> -    crate://crates.io/smallvec/1.11.2 \
> -    crate://crates.io/speedate/0.13.0 \
> +    crate://crates.io/serde/1.0.203 \
> +    crate://crates.io/serde_derive/1.0.203 \
> +    crate://crates.io/serde_json/1.0.116 \
> +    crate://crates.io/smallvec/1.13.2 \
> +    crate://crates.io/speedate/0.14.0 \
>      crate://crates.io/static_assertions/1.1.0 \
>      crate://crates.io/strum/0.25.0 \
>      crate://crates.io/strum_macros/0.25.3 \
> +    crate://crates.io/strum_macros/0.26.1 \
>      crate://crates.io/syn/2.0.48 \
> +    crate://crates.io/tap/1.0.1 \
>      crate://crates.io/target-lexicon/0.12.9 \
>      crate://crates.io/tinyvec/1.6.0 \
>      crate://crates.io/tinyvec_macros/0.1.1 \
> @@ -71,7 +72,7 @@ SRC_URI +=3D " \
>      crate://crates.io/unicode-normalization/0.1.22 \
>      crate://crates.io/unindent/0.2.3 \
>      crate://crates.io/url/2.5.0 \
> -    crate://crates.io/uuid/1.6.1 \
> +    crate://crates.io/uuid/1.8.0 \
>      crate://crates.io/version_check/0.9.4 \
>      crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
>      crate://crates.io/windows-targets/0.48.1 \
> @@ -82,36 +83,35 @@ SRC_URI +=3D " \
>      crate://crates.io/windows_x86_64_gnu/0.48.0 \
>      crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
>      crate://crates.io/windows_x86_64_msvc/0.48.0 \
> +    crate://crates.io/wyz/0.5.1 \
>      crate://crates.io/zerocopy/0.7.32 \
>      crate://crates.io/zerocopy-derive/0.7.32 \
>  "
>
> -SRC_URI[ahash-0.8.7.sha256sum] =3D "77c3a9648d43b9cd48db467b3f87fdd6e146=
bcc88ab0180006cef2179fe11d01"
> +SRC_URI[ahash-0.8.10.sha256sum] =3D "8b79b82693f705137f8fb9b37871d99e4f9=
a7df12b917eed79c3d3954830a60b"
>  SRC_URI[aho-corasick-1.0.2.sha256sum] =3D "43f6cb1bf222025340178f382c426=
f13757b2960e89779dfcb319c32542a5a41"
> -SRC_URI[allocator-api2-0.2.16.sha256sum] =3D "0942ffc6dcaadf03badf6e6a2d=
0228460359d5e34b57ccdc720b7382dfbd5ec5"
>  SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
>  SRC_URI[base64-0.21.7.sha256sum] =3D "9d297deb1925b89f2ccc13d7635fa0714f=
12c87adce1c75356b39ca9b7178567"
>  SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[bitvec-1.0.1.sha256sum] =3D "1bc2832c24239b0141d5674bb9174f9d68a=
8b5b3f2753311927c172ca46f7e9c"
>  SRC_URI[cc-1.0.79.sha256sum] =3D "50d30906286121d95be3d479533b458f87493b=
30a4b5f79a607db8f5d11aa91f"
>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
> -SRC_URI[enum_dispatch-0.3.12.sha256sum] =3D "8f33313078bb8d4d05a2733a94a=
c4c2d8a0df9a2b84424ebf4f33bfc224a890e"
> +SRC_URI[enum_dispatch-0.3.13.sha256sum] =3D "aa18ce2bc66555b3218614519ac=
839ddb759a7d6720732f979ef8d13be147ecd"
>  SRC_URI[equivalent-1.0.1.sha256sum] =3D "5443807d6dff69373d433ab9ef5378a=
d8df50ca6298caf15de6e52e24aaf54d5"
>  SRC_URI[form_urlencoded-1.2.1.sha256sum] =3D "e13624c2627564efccf4934284=
bdd98cbaa14e79b0b5a141218e507b3a823456"
> +SRC_URI[funty-2.0.0.sha256sum] =3D "e6d5a32815ae3f33302d95fdcb2ce17862f8=
c65363dcfd29360480ba1001fc9c"
>  SRC_URI[getrandom-0.2.10.sha256sum] =3D "be4136b2a15dd319360be1c07d99335=
17ccf0be8f16bf62a3bee4f0d618df427"
>  SRC_URI[hashbrown-0.14.3.sha256sum] =3D "290f1a1d9242c78d09ce40a5e87e755=
4ee637af1351968159f4952f028f75604"
>  SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
>  SRC_URI[idna-0.5.0.sha256sum] =3D "634d9b1461af396cad843f47fdba5597a4f9e=
6ddd4bfb6ff5d85028c25cb12f6"
> -SRC_URI[indexmap-2.0.0.sha256sum] =3D "d5477fe2230a79769d8dc68e0eabf5437=
907c0457a5614a9e8dddb67f65eb65d"
> +SRC_URI[indexmap-2.2.2.sha256sum] =3D "824b2ae422412366ba479e8111fd301f7=
b5faece8149317bb81925979a53f520"
>  SRC_URI[indoc-2.0.4.sha256sum] =3D "1e186cfbae8084e513daff4240b4797e342f=
988cecda4fb6c939150f96315fd8"
>  SRC_URI[itoa-1.0.8.sha256sum] =3D "62b02a5381cc465bd3041d84623d0fa3b6673=
8b52b8e2fc3bab8ad63ab032f4a"
> -SRC_URI[jiter-0.0.6.sha256sum] =3D "87db066a99f69382be06d02313f8ce989996=
b53a04a8a70cfd1a6483a56227f7"
> -SRC_URI[lexical-core-0.8.5.sha256sum] =3D "2cde5de06e8d4c2faabc400238f9a=
e1c74d5412d03a7bd067645ccbc47070e46"
> +SRC_URI[jiter-0.4.1.sha256sum] =3D "abbbbe1bad457e3cd5503af716aedc735e84=
9505a0d2172c55a753ae1b127458"
>  SRC_URI[lexical-parse-float-0.8.5.sha256sum] =3D "683b3a5ebd0130b8fb52ba=
0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
>  SRC_URI[lexical-parse-integer-0.8.6.sha256sum] =3D "6d0994485ed0c312f6d9=
65766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
>  SRC_URI[lexical-util-0.8.5.sha256sum] =3D "5255b9ff16ff898710eb9eb63cb39=
248ea8a5bb036bea8085b1a767ff6c4e3fc"
> -SRC_URI[lexical-write-float-0.8.5.sha256sum] =3D "accabaa1c4581f05a3923d=
1b4cfd124c329352288b7b9da09e766b0668116862"
> -SRC_URI[lexical-write-integer-0.8.5.sha256sum] =3D "e1b6f3d1f4422866b681=
92d62f77bc5c700bee84f3069f2469d7bc8c77852446"
> -SRC_URI[libc-0.2.147.sha256sum] =3D "b4668fb0ea861c1df094127ac5f1da3409a=
82116a4ba74fca2e58ef927159bb3"
> +SRC_URI[libc-0.2.155.sha256sum] =3D "97b3888a4aecf77e811145cadf6eef5901f=
4782c53886191b2f693f24761847c"
>  SRC_URI[lock_api-0.4.10.sha256sum] =3D "c1cc9717a20b1bb222f333e6a92fd32f=
7d8a18ddc5a3191a11af45dcbf4dcd16"
>  SRC_URI[memchr-2.6.3.sha256sum] =3D "8f232d6ef707e1956a43342693d2a31e729=
89554d58299d7a88738cc95b0d35c"
>  SRC_URI[memoffset-0.9.0.sha256sum] =3D "5a634b1c61a95585bd15607c6ab0c4e5=
b226e695ff2800ba0cdccddf208c406c"
> @@ -124,29 +124,32 @@ SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D "93f0=
0c865fe7cabf650081affecd3871070
>  SRC_URI[percent-encoding-2.3.1.sha256sum] =3D "e3148f5046208a5d56bcfc030=
53e3ca6334e51da8dfb19b6cdc8b306fae3283e"
>  SRC_URI[portable-atomic-1.6.0.sha256sum] =3D "7170ef9988bc169ba16dd36a7f=
a041e5c4cbeb6a35b76d4c03daded371eae7c0"
>  SRC_URI[proc-macro2-1.0.76.sha256sum] =3D "95fc56cda0b5c3325f5fbbd7ff9fd=
a9e02bb00bb3dac51252d2f1bfa1cb8cc8c"
> -SRC_URI[pyo3-0.20.3.sha256sum] =3D "53bdbb96d49157e65d45cc287af5f32ffadd=
5f4761438b527b055fb0d4bb8233"
> -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D "deaa5745de3f5231ce10517=
a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D "62b42531d03e08d4ef1f6e85a2ed422e=
b678b8cd62b762e53891c05faf0d4afa"
> -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D "7305c720fa01b8055ec95e484a6ec=
a7a83c841267f0dd5280f0c8b8551d2c158"
> -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D "7c7e9b68bb9c3149c5b0c=
ade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> +SRC_URI[pyo3-0.21.2.sha256sum] =3D "a5e00b96a521718e08e03b1a622f01c8a8de=
b50719335de3f60b3b3950f069d8"
> +SRC_URI[pyo3-build-config-0.21.2.sha256sum] =3D "7883df5835fafdad87c0d88=
8b266c8ec0f4c9ca48a5bed6bbb592e8dedee1b50"
> +SRC_URI[pyo3-ffi-0.21.2.sha256sum] =3D "01be5843dc60b916ab4dad1dca6d20b9=
b4e6ddc8e15f50c47fe6d85f1fb97403"
> +SRC_URI[pyo3-macros-0.21.2.sha256sum] =3D "77b34069fc0682e11b31dbd10321c=
bf94808394c56fd996796ce45217dfac53c"
> +SRC_URI[pyo3-macros-backend-0.21.2.sha256sum] =3D "08260721f32db5e1a5bea=
e69a55553f56b99bd0e1c3e6e0a5e8851a9d0f5a85c"
>  SRC_URI[python3-dll-a-0.2.9.sha256sum] =3D "d5f07cd4412be8fa09a721d40007=
c483981bbe072cd6a21f2e83e04ec8f8343f"
>  SRC_URI[quote-1.0.35.sha256sum] =3D "291ec9ab5efd934aaf503a6466c5d525153=
5d108ee747472c3977cc5acc868ef"
> +SRC_URI[radium-0.7.0.sha256sum] =3D "dc33ff2d4973d518d823d61aa239014831e=
521c75da58e3df4840d3f47749d09"
>  SRC_URI[redox_syscall-0.3.5.sha256sum] =3D "567664f262709473930a4bf9e51b=
f2ebf3348f2e748ccc50dea20646858f8f29"
> -SRC_URI[regex-1.10.2.sha256sum] =3D "380b951a9c5e80ddfd6136919eef3231072=
1aa4aacd4889a8d39124b026ab343"
> -SRC_URI[regex-automata-0.4.3.sha256sum] =3D "5f804c7828047e88b2d32e2d7fe=
5a105da8ee3264f01902f796c8e067dc2483f"
> +SRC_URI[regex-1.10.4.sha256sum] =3D "c117dbdfde9c8308975b6a18d71f3f385c8=
9461f7b3fb054288ecf2a2058ba4c"
> +SRC_URI[regex-automata-0.4.5.sha256sum] =3D "5bb987efffd3c6d0d8f5f89510b=
b458559eab11e4f869acb20bf845e016259cd"
>  SRC_URI[regex-syntax-0.8.2.sha256sum] =3D "c08c74e62047bb2de4ff487b251e4=
a92e24f48745648451635cec7d591162d9f"
>  SRC_URI[rustversion-1.0.13.sha256sum] =3D "dc31bd9b61a32c31f9650d18add92=
aa83a49ba979c143eefd27fe7177b05bd5f"
>  SRC_URI[ryu-1.0.14.sha256sum] =3D "fe232bdf6be8c8de797b22184ee71118d6378=
0ea42ac85b61d1baa6d3b782ae9"
>  SRC_URI[scopeguard-1.1.0.sha256sum] =3D "d29ab0c6d3fc0ee92fe66e2d99f700e=
ab17a8d57d1c1d3b748380fb20baa78cd"
> -SRC_URI[serde-1.0.195.sha256sum] =3D "63261df402c67811e9ac6def069e478614=
8c4563f4b50fd4bf30aa370d626b02"
> -SRC_URI[serde_derive-1.0.195.sha256sum] =3D "46fe8f8603d81ba86327b23a2e9=
cdf49e1255fb94a4c5f297f6ee0547178ea2c"
> -SRC_URI[serde_json-1.0.109.sha256sum] =3D "cb0652c533506ad7a2e353cce2693=
30d6afd8bdfb6d75e0ace5b35aacbd7b9e9"
> -SRC_URI[smallvec-1.11.2.sha256sum] =3D "4dccd0940a2dcdf68d092b8cbab7dc0a=
d8fa938bf95787e1b916b0e3d0e8e970"
> -SRC_URI[speedate-0.13.0.sha256sum] =3D "242f76c50fd18cbf098607090ade73a0=
8d39cfd84ea835f3796a2c855223b19b"
> +SRC_URI[serde-1.0.203.sha256sum] =3D "7253ab4de971e72fb7be983802300c30b5=
a7f0c2e56fab8abfc6a214307c0094"
> +SRC_URI[serde_derive-1.0.203.sha256sum] =3D "500cbc0ebeb6f46627f50f3f581=
1ccf6bf00643be300b4c3eabc0ef55dc5b5ba"
> +SRC_URI[serde_json-1.0.116.sha256sum] =3D "3e17db7126d17feb94eb3fad46bf1=
a96b034e8aacbc2e775fe81505f8b0b2813"
> +SRC_URI[smallvec-1.13.2.sha256sum] =3D "3c5e1a9a646d36c3599cd173a41282da=
f47c44583ad367b8e6837255952e5c67"
> +SRC_URI[speedate-0.14.0.sha256sum] =3D "c323c4e6fece5a5a1a2a7f726d243144=
cce9fbcfe3ce4d9f3c6ede726a2bc780"
>  SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
>  SRC_URI[strum-0.25.0.sha256sum] =3D "290d54ea6f91c969195bdbcd7442c8c2a2b=
a87da8bf60a7ee86a235d4bc1e125"
>  SRC_URI[strum_macros-0.25.3.sha256sum] =3D "23dc1fa9ac9c169a78ba62f0b841=
814b7abae11bdd047b9c58f893439e309ea0"
> +SRC_URI[strum_macros-0.26.1.sha256sum] =3D "7a3417fc93d76740d974a01654a0=
9777cb500428cc874ca9f45edfe0c4d4cd18"
>  SRC_URI[syn-2.0.48.sha256sum] =3D "0f3531638e407dfc0814761abb7c00a5b5499=
2b849452a0646b7f65c9f770f3f"
> +SRC_URI[tap-1.0.1.sha256sum] =3D "55937e1799185b12863d447f42597ed69d9928=
686b8d88a1df17376a097d8369"
>  SRC_URI[target-lexicon-0.12.9.sha256sum] =3D "df8e77cb757a61f51b947ec4a7=
e3646efd825b73561db1c232a8ccb639e611a0"
>  SRC_URI[tinyvec-1.6.0.sha256sum] =3D "87cc5ceb3875bb20c2890005a4e226a465=
1264a5c75edb2421b52861a0a0cb50"
>  SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac311fea05f86f61904b4=
62b55fb3df8837a366dfc601a0161d0532f20"
> @@ -155,7 +158,7 @@ SRC_URI[unicode-ident-1.0.10.sha256sum] =3D "22049a19=
f4a68748a168c0fc439f9516686aa
>  SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D "5c5713f0fc4b5db668a=
2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
>  SRC_URI[unindent-0.2.3.sha256sum] =3D "c7de7d73e1754487cb58364ee906a4999=
37a0dfabd86bcb980fa99ec8c8fa2ce"
>  SRC_URI[url-2.5.0.sha256sum] =3D "31e6302e3bb753d46e83516cae55ae196fc0c3=
09407cf11ab35cc51a4c2a4633"
> -SRC_URI[uuid-1.6.1.sha256sum] =3D "5e395fcf16a7a3d8127ec99782007af141946=
b4795001f876d54fb0d55978560"
> +SRC_URI[uuid-1.8.0.sha256sum] =3D "a183cf7feeba97b4dd1c0d46788634f6221d8=
7fa961b305bed08c851829efcc0"
>  SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f=
5c7d93d001cafc34600cee003eda787e483f"
>  SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
>  SRC_URI[windows-targets-0.48.1.sha256sum] =3D "05d4b17490f70499f20b9e791=
dcf6a299785ce8af4d709018206dc5b4953e95f"
> @@ -166,5 +169,6 @@ SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D "4542=
c6e364ce21bf45d69fdd2a8e455fa
>  SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D "ca2b8a661f7628cbd23440=
e50b05d705db3686f894fc9580820623656af974b1"
>  SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D "7896dbc1f41e08872e=
9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
>  SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D "1a515f5799fe4961cb532=
f983ce2b23082366b898e52ffbce459c86f67c8378a"
> +SRC_URI[wyz-0.5.1.sha256sum] =3D "05f360fc0b24296329c78fda852a1e9ae82de9=
cf7b27dae4b7f62f118f77b9ed"
>  SRC_URI[zerocopy-0.7.32.sha256sum] =3D "74d4d3961e53fa4c9a25a8637fc2bfaf=
2595b3d3ae34875568a5cf64787716be"
>  SRC_URI[zerocopy-derive-0.7.32.sha256sum] =3D "9ce1b18ccd8e73a9321186f97=
e46f9f04b778851177567b1975109d26a08d2a6"
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/00=
01-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch b/meta-python=
/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github=
.com-pyo3-pyo3-from-0.20.2-to.patch
> deleted file mode 100644
> index 32777e1d0..000000000
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bump=
s-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
> +++ /dev/null
> @@ -1,126 +0,0 @@
> -From a5690f973384bf8cbf4deb3b83d822b7aaefbdd8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 27 Feb 2024 11:00:46 -0800
> -Subject: [PATCH] Bumps [pyo3](https://github.com/pyo3/pyo3) from 0.20.2 =
to
> - 0.20.3.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Cargo.lock | 26 +++++++++++++++++---------
> - Cargo.toml |  2 +-
> - 2 files changed, 18 insertions(+), 10 deletions(-)
> -
> ---- a/Cargo.lock
> -+++ b/Cargo.lock
> -@@ -322,6 +322,12 @@ source =3D "registry+https://github.com/ru
> - checksum =3D "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306f=
ae3283e"
> -
> - [[package]]
> -+name =3D "portable-atomic"
> -+version =3D "1.6.0"
> -+source =3D "registry+https://github.com/rust-lang/crates.io-index"
> -+checksum =3D "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded37=
1eae7c0"
> -+
> -+[[package]]
> - name =3D "proc-macro2"
> - version =3D "1.0.76"
> - source =3D "registry+https://github.com/rust-lang/crates.io-index"
> -@@ -357,9 +363,9 @@ dependencies =3D [
> -
> - [[package]]
> - name =3D "pyo3"
> --version =3D "0.20.2"
> -+version =3D "0.20.3"
> - source =3D "registry+https://github.com/rust-lang/crates.io-index"
> --checksum =3D "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1e=
e3d6fe0"
> -+checksum =3D "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d=
4bb8233"
> - dependencies =3D [
> -  "cfg-if",
> -  "indoc",
> -@@ -367,6 +373,7 @@ dependencies =3D [
> -  "memoffset",
> -  "num-bigint",
> -  "parking_lot",
> -+ "portable-atomic",
> -  "pyo3-build-config",
> -  "pyo3-ffi",
> -  "pyo3-macros",
> -@@ -375,9 +382,9 @@ dependencies =3D [
> -
> - [[package]]
> - name =3D "pyo3-build-config"
> --version =3D "0.20.2"
> -+version =3D "0.20.3"
> - source =3D "registry+https://github.com/rust-lang/crates.io-index"
> --checksum =3D "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893=
c5163be"
> -+checksum =3D "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b58422920858=
31d48d7"
> - dependencies =3D [
> -  "once_cell",
> -  "python3-dll-a",
> -@@ -386,9 +393,9 @@ dependencies =3D [
> -
> - [[package]]
> - name =3D "pyo3-ffi"
> --version =3D "0.20.2"
> -+version =3D "0.20.3"
> - source =3D "registry+https://github.com/rust-lang/crates.io-index"
> --checksum =3D "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd05=
8da6cf1"
> -+checksum =3D "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05fa=
f0d4afa"
> - dependencies =3D [
> -  "libc",
> -  "pyo3-build-config",
> -@@ -396,9 +403,9 @@ dependencies =3D [
> -
> - [[package]]
> - name =3D "pyo3-macros"
> --version =3D "0.20.2"
> -+version =3D "0.20.3"
> - source =3D "registry+https://github.com/rust-lang/crates.io-index"
> --checksum =3D "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a84=
3f74ed3"
> -+checksum =3D "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b855=
1d2c158"
> - dependencies =3D [
> -  "proc-macro2",
> -  "pyo3-macros-backend",
> -@@ -408,12 +415,13 @@ dependencies =3D [
> -
> - [[package]]
> - name =3D "pyo3-macros-backend"
> --version =3D "0.20.2"
> -+version =3D "0.20.3"
> - source =3D "registry+https://github.com/rust-lang/crates.io-index"
> --checksum =3D "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da7=
9e8881f"
> -+checksum =3D "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f=
1f96185"
> - dependencies =3D [
> -  "heck",
> -  "proc-macro2",
> -+ "pyo3-build-config",
> -  "quote",
> -  "syn",
> - ]
> ---- a/Cargo.toml
> -+++ b/Cargo.toml
> -@@ -26,7 +26,7 @@ include =3D [
> - ]
> -
> - [dependencies]
> --pyo3 =3D { version =3D "0.20.2", features =3D ["generate-import-lib", "=
num-bigint"] }
> -+pyo3 =3D { version =3D "0.20.3", features =3D ["generate-import-lib", "=
num-bigint"] }
> - regex =3D "1.10.2"
> - strum =3D { version =3D "0.25.0", features =3D ["derive"] }
> - strum_macros =3D "0.25.3"
> -@@ -70,12 +70,12 @@ debug =3D true
> - strip =3D false
> -
> - [dev-dependencies]
> --pyo3 =3D { version =3D "0.20.2", features =3D ["auto-initialize"] }
> -+pyo3 =3D { version =3D "0.20.3", features =3D ["auto-initialize"] }
> -
> - [build-dependencies]
> - version_check =3D "0.9.4"
> - # used where logic has to be version/distribution specific, e.g. pypy
> --pyo3-build-config =3D { version =3D "0.20.2" }
> -+pyo3-build-config =3D { version =3D "0.20.3" }
> -
> - [lints.clippy]
> - dbg_macro =3D "warn"
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.=
16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.19.0.=
bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.1=
6.3.bb
> rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.19.=
0.bb
> index f51064522..6b8fed92a 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.19.0.bb
> @@ -8,8 +8,7 @@ HOMEPAGE =3D "https://github.com/pydantic/pydantic-core"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a314d2856b3a55030c=
75c"
>
> -SRC_URI +=3D "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.2=
0.2-to.patch"
> -SRC_URI[sha256sum] =3D "1cac689f80a3abab2d3c0048b29eea5751114054f032a941=
a32de4c852c59cad"
> +SRC_URI[sha256sum] =3D "9ad77f1aecedef233390eff7fd643fe652e5ac92b7933294=
24c2a1d2e28c08d1"
>
>  DEPENDS =3D "python3-maturin-native python3-typing-extensions"
>
> @@ -33,6 +32,7 @@ RDEPENDS:${PN}-ptest +=3D "\
>      python3-pytest-timeout \
>      python3-pytest-benchmark \
>      python3-unittest-automake-output \
> +    python3-zoneinfo \
>  "
>
>  do_install_ptest() {
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110899): https://lists.openembedded.org/g/openembedde=
d-devel/message/110899
> Mute This Topic: https://lists.openembedded.org/mt/106663831/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

