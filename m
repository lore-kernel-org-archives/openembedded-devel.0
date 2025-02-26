Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2074C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 16:28:42 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.10125.1740587316590741992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 08:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9TH32J/;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f41091f7c5so15305b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740587316; x=1741192116; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41UmSgUp+pu2ZU6O57wN1hdw6+CgLVBdZbnycRF0oms=;
        b=g9TH32J/OYWCWsC8LwZxgB5oA4GCdZPzYupUoaVRHm2VpAct9nw0bcrlGYtnd6p5Ug
         S0OfxRQbd3ZD2HDj0EN+++j2CfOplE65cbz1lYSsNlykazGfikzwlPtCbFKdO4QXoSJc
         lLV3fu0P+PiQ0OcKJA42d1K9U0N2ZsPgujk/6NDLLr61EzprVqAdYWuNMpTgu8wl60gf
         N0bquRf1Z8od6Wa5ElPE88/44g51AvOWNdqqG1dvqHPOTKxAohK5k443jUuzzMam1XXc
         gQqJksYZgipi+PEjL9DMEe3QyHprEnBzreS5gEqeQ66hvkgVKXH8CADbrBMj6eZ+obHQ
         m5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740587316; x=1741192116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41UmSgUp+pu2ZU6O57wN1hdw6+CgLVBdZbnycRF0oms=;
        b=DI5vcCxArmEPQUuXB4lvhKEjfQSIv4QaJb3dEnmjT+CYai7DXRJEfg7aOLOsbVPpYk
         RoVtHPpgtgOtXlbUMJwWgFPfF65NkgddqcsTNmJ8L+dqr9M20G1gvNAl98Dna8p1tn0P
         XFzriCcX5RrV4S+s2wswDUVnjeVDu4iLCo3gxjY/zaf8m/vO1wsEow7ouqZry9xJjSG6
         Z6DuPW5mhyeHhBYxGF+7zhF3aewCRVsk9SaHy3iWq5I6SfMmvhmxX8tVhtKmZ0wWTA8x
         EwoyiEy3/oY40ovVUaPOD2cBZaYQI+6aK/1xvIGwi55BFHpDrKGObPFJXqwOd2yK9tcr
         97KQ==
X-Gm-Message-State: AOJu0YzddKD6/sgJW0iMpMDOMEbOA6VP7WIHybRzqWoO2zs/V1OeBJc+
	mUmQ1zQ95gR79jokYCw23LYdWohu6sXRRI8PErBrIiT+za8L2VEnQYlTjcUGB2wIyod4L8ZZnHD
	o+xfsQvEghIKMSzMItr5jKn++Vvm/gqVY6mY=
X-Gm-Gg: ASbGncvSWle0QCDzIfeESP+4DBx7vEWsb92nw9mNGRGzDEjcWggtQndH54oSTcrhcOG
	a2gX6aLI/EafJmZ4CaGN8uMDsNwcGuxUlYSBhEK/n99Sn8RNqmTKdiYg9xtoXlYUy8/Fm64Opa/
	BGgLXC2A==
X-Google-Smtp-Source: AGHT+IE67+g1PbXcl/QQ1BbwXCWycrSfBi8NTZJO+wmi2cPxSfFhYo4Gqv47/beI5Q5eq+GCxLSVFGizVhNTuZeZelE=
X-Received: by 2002:a05:6808:14cb:b0:3f4:23ea:f9bb with SMTP id
 5614622812f47-3f425a8c7b1mr13040439b6e.18.1740587315409; Wed, 26 Feb 2025
 08:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20250225034557.2148517-1-liezhi.yang@windriver.com> <20250225034557.2148517-2-liezhi.yang@windriver.com>
In-Reply-To: <20250225034557.2148517-2-liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2025 08:28:09 -0800
X-Gm-Features: AQ5f1Jo-0xikx0KBnoEyduqqEWlZlY_sU03wV3t0RfjMyIw_DQJrEUYZVfcsrvw
Message-ID: <CAMKF1sos6xNc9oc3iOxZ8FcwR4SR9A983owdattT8dW4CCow4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] thin-provisioning-tools: 1.0.13 -> 1.0.14
To: liezhi.yang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 16:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115676

this seems to cause a build failure

https://errors.yoctoproject.org/Errors/Details/844980/

On Mon, Feb 24, 2025 at 7:46=E2=80=AFPM Robert Yang via lists.openembedded.=
org
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> * License-Update: Update links in GPLv3 (http -> https)
>
> * It need depend on pkg-config, udev and clang-native to build
>
> * Move it to dynamic-layers since now it depends on meta-clang.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../thin-provisioning-tools-crates.inc        | 124 +++++++++++++-----
>  .../thin-provisioning-tools-git-crates.inc    |   0
>  .../thin-provisioning-tools_1.0.14.bb}        |  10 +-
>  3 files changed, 102 insertions(+), 32 deletions(-)
>  rename meta-oe/{ =3D> dynamic-layers/clang-layer}/recipes-support/thin-p=
rovisioning-tools/thin-provisioning-tools-crates.inc (66%)
>  rename meta-oe/{ =3D> dynamic-layers/clang-layer}/recipes-support/thin-p=
rovisioning-tools/thin-provisioning-tools-git-crates.inc (100%)
>  rename meta-oe/{recipes-support/thin-provisioning-tools/thin-provisionin=
g-tools_1.0.13.bb =3D> dynamic-layers/clang-layer/recipes-support/thin-prov=
isioning-tools/thin-provisioning-tools_1.0.14.bb} (82%)
>
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisi=
oning-tools-crates.inc b/meta-oe/dynamic-layers/clang-layer/recipes-support=
/thin-provisioning-tools/thin-provisioning-tools-crates.inc
> similarity index 66%
> rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisio=
ning-tools-crates.inc
> rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisi=
oning-tools/thin-provisioning-tools-crates.inc
> index c5c059dd1a..a49704fe21 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-t=
ools-crates.inc
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools-crates.inc
> @@ -4,28 +4,42 @@
>  SRC_URI +=3D " \
>      crate://crates.io/adler/1.0.2 \
>      crate://crates.io/aho-corasick/1.1.3 \
> -    crate://crates.io/anstyle/1.0.7 \
> +    crate://crates.io/anstream/0.6.15 \
> +    crate://crates.io/anstyle/1.0.8 \
> +    crate://crates.io/anstyle-parse/0.2.5 \
> +    crate://crates.io/anstyle-query/1.1.1 \
> +    crate://crates.io/anstyle-wincon/3.0.4 \
>      crate://crates.io/anyhow/1.0.86 \
>      crate://crates.io/atty/0.2.14 \
>      crate://crates.io/autocfg/1.3.0 \
>      crate://crates.io/base64/0.22.1 \
> +    crate://crates.io/bindgen/0.69.4 \
>      crate://crates.io/bitflags/1.3.2 \
>      crate://crates.io/bitflags/2.6.0 \
>      crate://crates.io/bytemuck/1.16.1 \
>      crate://crates.io/byteorder/1.5.0 \
>      crate://crates.io/cassowary/0.3.0 \
> +    crate://crates.io/cexpr/0.6.0 \
>      crate://crates.io/cfg-if/1.0.0 \
> -    crate://crates.io/clap/4.5.9 \
> -    crate://crates.io/clap_builder/4.5.9 \
> -    crate://crates.io/clap_lex/0.7.1 \
> +    crate://crates.io/cfg_aliases/0.2.1 \
> +    crate://crates.io/clang-sys/1.8.1 \
> +    crate://crates.io/clap/4.5.11 \
> +    crate://crates.io/clap_builder/4.5.11 \
> +    crate://crates.io/clap_lex/0.7.2 \
> +    crate://crates.io/colorchoice/1.0.2 \
>      crate://crates.io/console/0.15.8 \
>      crate://crates.io/crc32c/0.6.8 \
>      crate://crates.io/crc32fast/1.4.2 \
>      crate://crates.io/data-encoding/2.6.0 \
> +    crate://crates.io/devicemapper/0.34.3 \
> +    crate://crates.io/devicemapper-sys/0.3.0 \
>      crate://crates.io/downcast/0.11.0 \
>      crate://crates.io/duct/0.13.7 \
> +    crate://crates.io/either/1.13.0 \
>      crate://crates.io/encode_unicode/0.3.6 \
> +    crate://crates.io/env_filter/0.1.2 \
>      crate://crates.io/env_logger/0.8.4 \
> +    crate://crates.io/env_logger/0.11.5 \
>      crate://crates.io/errno/0.3.9 \
>      crate://crates.io/exitcode/1.1.2 \
>      crate://crates.io/fastrand/2.1.0 \
> @@ -33,20 +47,28 @@ SRC_URI +=3D " \
>      crate://crates.io/flate2/1.0.30 \
>      crate://crates.io/fragile/2.0.0 \
>      crate://crates.io/getrandom/0.2.15 \
> +    crate://crates.io/glob/0.3.1 \
>      crate://crates.io/hermit-abi/0.1.19 \
>      crate://crates.io/hermit-abi/0.3.9 \
> +    crate://crates.io/humantime/2.1.0 \
>      crate://crates.io/indicatif/0.17.8 \
>      crate://crates.io/instant/0.1.13 \
>      crate://crates.io/iovec/0.1.4 \
> +    crate://crates.io/is_terminal_polyfill/1.70.1 \
> +    crate://crates.io/itertools/0.12.1 \
>      crate://crates.io/lazy_static/1.5.0 \
> +    crate://crates.io/lazycell/1.3.0 \
>      crate://crates.io/libc/0.2.155 \
> +    crate://crates.io/libloading/0.8.5 \
> +    crate://crates.io/libudev-sys/0.1.4 \
>      crate://crates.io/linux-raw-sys/0.4.14 \
>      crate://crates.io/log/0.4.22 \
>      crate://crates.io/memchr/2.7.4 \
>      crate://crates.io/minimal-lexical/0.2.1 \
>      crate://crates.io/miniz_oxide/0.7.4 \
> -    crate://crates.io/mockall/0.12.1 \
> -    crate://crates.io/mockall_derive/0.12.1 \
> +    crate://crates.io/mockall/0.13.0 \
> +    crate://crates.io/mockall_derive/0.13.0 \
> +    crate://crates.io/nix/0.29.0 \
>      crate://crates.io/nom/7.1.3 \
>      crate://crates.io/num-derive/0.4.2 \
>      crate://crates.io/num-traits/0.2.19 \
> @@ -55,13 +77,14 @@ SRC_URI +=3D " \
>      crate://crates.io/numtoa/0.1.0 \
>      crate://crates.io/once_cell/1.19.0 \
>      crate://crates.io/os_pipe/1.2.0 \
> -    crate://crates.io/portable-atomic/1.6.0 \
> -    crate://crates.io/ppv-lite86/0.2.17 \
> -    crate://crates.io/predicates/3.1.0 \
> -    crate://crates.io/predicates-core/1.0.6 \
> -    crate://crates.io/predicates-tree/1.0.9 \
> +    crate://crates.io/pkg-config/0.3.30 \
> +    crate://crates.io/portable-atomic/1.7.0 \
> +    crate://crates.io/ppv-lite86/0.2.19 \
> +    crate://crates.io/predicates/3.1.2 \
> +    crate://crates.io/predicates-core/1.0.8 \
> +    crate://crates.io/predicates-tree/1.0.11 \
>      crate://crates.io/proc-macro2/1.0.86 \
> -    crate://crates.io/quick-xml/0.36.0 \
> +    crate://crates.io/quick-xml/0.36.1 \
>      crate://crates.io/quickcheck/1.0.3 \
>      crate://crates.io/quickcheck_macros/1.0.0 \
>      crate://crates.io/quote/1.0.36 \
> @@ -74,25 +97,32 @@ SRC_URI +=3D " \
>      crate://crates.io/regex/1.10.5 \
>      crate://crates.io/regex-automata/0.4.7 \
>      crate://crates.io/regex-syntax/0.8.4 \
> +    crate://crates.io/retry/2.0.0 \
>      crate://crates.io/roaring/0.10.6 \
> +    crate://crates.io/rustc-hash/1.1.0 \
>      crate://crates.io/rustc_version/0.4.0 \
>      crate://crates.io/rustix/0.38.34 \
>      crate://crates.io/safemem/0.3.3 \
>      crate://crates.io/semver/1.0.23 \
> +    crate://crates.io/serde/1.0.204 \
> +    crate://crates.io/serde_derive/1.0.204 \
>      crate://crates.io/shared_child/1.0.0 \
> +    crate://crates.io/shlex/1.3.0 \
>      crate://crates.io/strsim/0.11.1 \
>      crate://crates.io/syn/1.0.109 \
> -    crate://crates.io/syn/2.0.70 \
> +    crate://crates.io/syn/2.0.72 \
>      crate://crates.io/tempfile/3.10.1 \
>      crate://crates.io/termion/1.5.6 \
>      crate://crates.io/termtree/0.4.1 \
> -    crate://crates.io/thiserror/1.0.61 \
> -    crate://crates.io/thiserror-impl/1.0.61 \
> +    crate://crates.io/thiserror/1.0.63 \
> +    crate://crates.io/thiserror-impl/1.0.63 \
>      crate://crates.io/threadpool/1.8.1 \
>      crate://crates.io/tui/0.19.0 \
> +    crate://crates.io/udev/0.7.0 \
>      crate://crates.io/unicode-ident/1.0.12 \
>      crate://crates.io/unicode-segmentation/1.11.0 \
>      crate://crates.io/unicode-width/0.1.13 \
> +    crate://crates.io/utf8parse/0.2.2 \
>      crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
>      crate://crates.io/winapi/0.3.9 \
>      crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> @@ -107,32 +137,48 @@ SRC_URI +=3D " \
>      crate://crates.io/windows_x86_64_gnu/0.52.6 \
>      crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
>      crate://crates.io/windows_x86_64_msvc/0.52.6 \
> +    crate://crates.io/zerocopy/0.7.35 \
> +    crate://crates.io/zerocopy-derive/0.7.35 \
>  "
>
>  SRC_URI[adler-1.0.2.sha256sum] =3D "f26201604c87b1e01bd3d98f8d5d9a8fcbb8=
15e8cedb41ffccbeb4bf593a35fe"
>  SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
> -SRC_URI[anstyle-1.0.7.sha256sum] =3D "038dfcf04a5feb68e9c60b21c9625a54c2=
c0616e79b72b0fd87075a056ae1d1b"
> +SRC_URI[anstream-0.6.15.sha256sum] =3D "64e15c1ab1f89faffbf04a634d5e1962=
e9074f2741eef6d97f3c4e322426d526"
> +SRC_URI[anstyle-1.0.8.sha256sum] =3D "1bec1de6f59aedf83baf9ff929c98f2ad6=
54b97c9510f4e70cf6f661d49fd5b1"
> +SRC_URI[anstyle-parse-0.2.5.sha256sum] =3D "eb47de1e80c2b463c735db5b217a=
0ddc39d612e7ac9e2e96a5aed1f57616c1cb"
> +SRC_URI[anstyle-query-1.1.1.sha256sum] =3D "6d36fc52c7f6c869915e99412912=
f22093507da8d9e942ceaf66fe4b7c14422a"
> +SRC_URI[anstyle-wincon-3.0.4.sha256sum] =3D "5bf74e1b6e971609db8ca7a9ce7=
9fd5768ab6ae46441c572e46cf596f59e57f8"
>  SRC_URI[anyhow-1.0.86.sha256sum] =3D "b3d1d046238990b9cf5bcde22a3fb3584e=
e5cf65fb2765f454ed428c7a0063da"
>  SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f37=
e93092cbf377614828a319d5fee8"
>  SRC_URI[autocfg-1.3.0.sha256sum] =3D "0c4b4d0bd25bd0b74681c0ad21497610ce=
1b7c91b1022cd21c80c6fbdd9476b0"
>  SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f01=
99f8c6508fbecb9d91f575e0fbb8c6"
> +SRC_URI[bindgen-0.69.4.sha256sum] =3D "a00dc851838a2120612785d195287475a=
3ac45514741da670b735818822129a0"
>  SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
>  SRC_URI[bitflags-2.6.0.sha256sum] =3D "b048fb63fd8b5923fc5aa7b340d8e156a=
ec7ec02f0c78fa8a6ddc2613f6f71de"
>  SRC_URI[bytemuck-1.16.1.sha256sum] =3D "b236fc92302c97ed75b38da1f4917b5c=
dda4984745740f153a5d3059e48d725e"
>  SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf=
353beff7305ebd1ae69500e27c67f64b"
>  SRC_URI[cassowary-0.3.0.sha256sum] =3D "df8670b8c7b9dae1793364eafadf7239=
c40d669904660c5960d74cfd80b46a53"
> +SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb62=
9900026402633ae9160df93a8766"
>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
> -SRC_URI[clap-4.5.9.sha256sum] =3D "64acc1846d54c1fe936a78dc189c34e28d3f5=
afc348403f28ecf53660b9b8462"
> -SRC_URI[clap_builder-4.5.9.sha256sum] =3D "6fb8393d67ba2e7bfaf28a23458e4=
e2b543cc73a99595511eb207fdb8aede942"
> -SRC_URI[clap_lex-0.7.1.sha256sum] =3D "4b82cf0babdbd58558212896d1a427230=
3a57bdb245c2bf1147185fb45640e70"
> +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb0=
82c5994d996f20b8b159f2ad1658eb5724"
> +SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd6=
19ad4718dcaa767947df1cadb14f39f4"
> +SRC_URI[clap-4.5.11.sha256sum] =3D "35723e6a11662c2afb578bcf0b88bf6ea8e2=
1282a953428f240574fcc3a2b5b3"
> +SRC_URI[clap_builder-4.5.11.sha256sum] =3D "49eb96cbfa7cfa35017b7cd548c7=
5b14c3118c98b423041d70562665e07fb0fa"
> +SRC_URI[clap_lex-0.7.2.sha256sum] =3D "1462739cb27611015575c0c11df5df760=
1141071f07518d56fcc1be504cbec97"
> +SRC_URI[colorchoice-1.0.2.sha256sum] =3D "d3fd119d74b830634cea2a0f58bbd0=
d54540518a14397557951e79340abc28c0"
>  SRC_URI[console-0.15.8.sha256sum] =3D "0e1f83fc076bd6dd27517eacdf25fef6c=
4dfe5f1d7448bafaaf3a26f13b5e4eb"
>  SRC_URI[crc32c-0.6.8.sha256sum] =3D "3a47af21622d091a8f0fb295b88bc886ac7=
4efcc613efc19f5d0b21de5c89e47"
>  SRC_URI[crc32fast-1.4.2.sha256sum] =3D "a97769d94ddab943e4510d138150169a=
2758b5ef3eb191a9ee688de3e23ef7b3"
>  SRC_URI[data-encoding-2.6.0.sha256sum] =3D "e8566979429cf69b49a5c740c607=
91108e86440e8be149bbea4fe54d2c32d6e2"
> +SRC_URI[devicemapper-0.34.3.sha256sum] =3D "59209790c5d189070a5293758195=
0947207e740fadc87f68af14f34d0eb333df"
> +SRC_URI[devicemapper-sys-0.3.0.sha256sum] =3D "3d6681f5413e2094480381a97=
b8299f548c0579f07095ee20fe58e0a28cb34b5"
>  SRC_URI[downcast-0.11.0.sha256sum] =3D "1435fa1053d8b2fbbe9be7e97eca7f33=
d37b28409959813daefc1446a14247f1"
>  SRC_URI[duct-0.13.7.sha256sum] =3D "e4ab5718d1224b63252cd0c6f74f6480f9ff=
eb117438a2e0f5cf6d9a4798929c"
> +SRC_URI[either-1.13.0.sha256sum] =3D "60b1af1c220855b6ceac025d3f6ecdd2b7=
c4894bfe9cd9bda4fbb4bc7c0d4cf0"
>  SRC_URI[encode_unicode-0.3.6.sha256sum] =3D "a357d28ed41a50f9c765dbfe56c=
bc04a64e53e5fc58ba79fbc34c10ef3df831f"
> +SRC_URI[env_filter-0.1.2.sha256sum] =3D "4f2c92ceda6ceec50f43169f9ee8424=
fe2db276791afde7b2cd8bc084cb376ab"
>  SRC_URI[env_logger-0.8.4.sha256sum] =3D "a19187fea3ac7e84da7dacf48de0c45=
d63c6a76f9490dae389aead16c243fce3"
> +SRC_URI[env_logger-0.11.5.sha256sum] =3D "e13fa619b91fb2381732789fc5de83=
b45675e882f66623b7d8cb4f643017018d"
>  SRC_URI[errno-0.3.9.sha256sum] =3D "534c5cf6194dfab3db3242765c03bbe257cf=
92f22b38f6bc0c58d59108a820ba"
>  SRC_URI[exitcode-1.1.2.sha256sum] =3D "de853764b47027c2e862a995c34978ffa=
63c1501f2e15f987ba11bd4f9bba193"
>  SRC_URI[fastrand-2.1.0.sha256sum] =3D "9fc0510504f03c51ada170672ac806f1f=
105a88aa97a5281117e1ddc3368e51a"
> @@ -140,20 +186,28 @@ SRC_URI[fixedbitset-0.4.2.sha256sum] =3D "0ce7134b9=
999ecaf8bcd65542e436736ef32ddca
>  SRC_URI[flate2-1.0.30.sha256sum] =3D "5f54427cfd1c7829e2a139fcefea601bf0=
88ebca651d2bf53ebc600eac295dae"
>  SRC_URI[fragile-2.0.0.sha256sum] =3D "6c2141d6d6c8512188a7891b4b01590a45=
f6dac67afb4f255c4124dbb86d4eaa"
>  SRC_URI[getrandom-0.2.15.sha256sum] =3D "c4567c8db10ae91089c99af84c68c38=
da3ec2f087c3f82960bcdbf3656b6f4d7"
> +SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b6=
5693ce38287d856d1674551ec9b"
>  SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242da=
dbb39557df889310ac77c5d99100aaac33"
>  SRC_URI[hermit-abi-0.3.9.sha256sum] =3D "d231dfb89cfffdbc30e7fc41579ed60=
66ad03abda9e567ccafae602b97ec5024"
> +SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761da=
ec841b97f947d34394601737a7bba5e4"
>  SRC_URI[indicatif-0.17.8.sha256sum] =3D "763a5a8f45087d6bcea4222e7b72c29=
1a054edf80e4ef6efd2a4979878c7bea3"
>  SRC_URI[instant-0.1.13.sha256sum] =3D "e0242819d153cba4b4b05a5a8f2a7e9bb=
f97b6055b2a002b395c96b5ff3c0222"
>  SRC_URI[iovec-0.1.4.sha256sum] =3D "b2b3ea6ff95e175473f8ffe6a7eb7c00d054=
240321b84c57051175fe3c1e075e"
> +SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc25=
b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
> +SRC_URI[itertools-0.12.1.sha256sum] =3D "ba291022dbbd398a455acf126c1e341=
954079855bc60dfdda641363bd6922569"
>  SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f3=
591312473c50c6685e1f298068316e66fe"
> +SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb5643=
013d835ce3779a5fc208261dbe10f55"
>  SRC_URI[libc-0.2.155.sha256sum] =3D "97b3888a4aecf77e811145cadf6eef5901f=
4782c53886191b2f693f24761847c"
> +SRC_URI[libloading-0.8.5.sha256sum] =3D "4979f22fdb869068da03c9f7528f829=
7c6fd2606bc3a4affe42e6a823fdb8da4"
> +SRC_URI[libudev-sys-0.1.4.sha256sum] =3D "3c8469b4a23b962c1396b9b451dda5=
0ef5b283e8dd309d69033475fa9b334324"
>  SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D "78b3ae25bc7c8c38cec158d1f27=
57ee79e9b3740fbc7ccf0e59e4b08d793fa89"
>  SRC_URI[log-0.4.22.sha256sum] =3D "a7a70ba024b9dc04c27ea2f0c0548feb474ec=
5c54bba33a7f72f873a39d07b24"
>  SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289c1=
8cf2f87ec19a575a0abdce112e3a3"
>  SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
>  SRC_URI[miniz_oxide-0.7.4.sha256sum] =3D "b8a240ddb74feaf34a79a7add65a74=
1f3167852fba007066dcac1ca548d89c08"
> -SRC_URI[mockall-0.12.1.sha256sum] =3D "43766c2b5203b10de348ffe19f7e54564=
b64f3d6018ff7648d1e2d6d3a0f0a48"
> -SRC_URI[mockall_derive-0.12.1.sha256sum] =3D "af7cbce79ec385a1d4f54baa90=
a76401eb15d9cab93685f62e7e9f942aa00ae2"
> +SRC_URI[mockall-0.13.0.sha256sum] =3D "d4c28b3fb6d753d28c20e826cd46ee611=
fda1cf3cde03a443a974043247c065a"
> +SRC_URI[mockall_derive-0.13.0.sha256sum] =3D "341014e7f530314e9a1fdbc740=
0b244efea7122662c96bfa248c31da5bfb2020"
> +SRC_URI[nix-0.29.0.sha256sum] =3D "71e2746dc3a24dd78b3cfcb7be93368c6de99=
63d30f43a6a73998a9cf4b17b46"
>  SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c81=
72b73826411a55751e404a0a4a"
>  SRC_URI[num-derive-0.4.2.sha256sum] =3D "ed3955f1a9c7c0c15e092f9c887db08=
b1fc683305fdf6eb6684f22555355e202"
>  SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72=
ad0ffa95f0c74596bc250dcfd960262841"
> @@ -162,13 +216,14 @@ SRC_URI[number_prefix-0.4.0.sha256sum] =3D "830b246=
a0e5f20af87141b25c173cd1b609bd7
>  SRC_URI[numtoa-0.1.0.sha256sum] =3D "b8f8bdf33df195859076e54ab11ee78a1b2=
08382d3a26ec40d142ffc1ecc49ef"
>  SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa467c=
2438859caa136dec86c26fdd2efe17b92"
>  SRC_URI[os_pipe-1.2.0.sha256sum] =3D "29d73ba8daf8fac13b0501d1abeddcfe21=
ba7401ada61a819144b6c2a4f32209"
> -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D "7170ef9988bc169ba16dd36a7f=
a041e5c4cbeb6a35b76d4c03daded371eae7c0"
> -SRC_URI[ppv-lite86-0.2.17.sha256sum] =3D "5b40af805b3121feab8a3c29f04d8a=
d262fa8e0561883e7653e024ae4479e6de"
> -SRC_URI[predicates-3.1.0.sha256sum] =3D "68b87bfd4605926cdfefc1c3b5f8fe5=
60e3feca9d5552cf68c466d3d8236c7e8"
> -SRC_URI[predicates-core-1.0.6.sha256sum] =3D "b794032607612e7abeb4db69ad=
b4e33590fa6cf1149e95fd7cb00e634b92f174"
> -SRC_URI[predicates-tree-1.0.9.sha256sum] =3D "368ba315fb8c5052ab692e68a0=
eefec6ec57b23a36959c14496f0b0df2c0cecf"
> +SRC_URI[pkg-config-0.3.30.sha256sum] =3D "d231b230927b5e4ad203db57bbcbee=
2802f6bce620b1e4a9024a07d94e2907ec"
> +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D "da544ee218f0d287a911e9c99a=
39a8c9bc8fcad3cb8db5959940044ecfc67265"
> +SRC_URI[ppv-lite86-0.2.19.sha256sum] =3D "2288c0e17cc8d342c712bb43a257a8=
0ebffce59cdb33d5000d8348f3ec02528b"
> +SRC_URI[predicates-3.1.2.sha256sum] =3D "7e9086cc7640c29a356d1a29fd13438=
0bee9d8f79a17410aa76e7ad295f42c97"
> +SRC_URI[predicates-core-1.0.8.sha256sum] =3D "ae8177bee8e75d6846599c6b9f=
f679ed51e882816914eec639944d7c9aa11931"
> +SRC_URI[predicates-tree-1.0.11.sha256sum] =3D "41b740d195ed3166cd147c804=
7ec98db0e22ec019eb8eeb76d343b795304fb13"
>  SRC_URI[proc-macro2-1.0.86.sha256sum] =3D "5e719e8df665df0d1c8fbfd238015=
744736151d4445ec0836b8e628aae103b77"
> -SRC_URI[quick-xml-0.36.0.sha256sum] =3D "4091e032efecb09d7b1f711f487b85a=
b925632a842627e3200fb088382cde32c"
> +SRC_URI[quick-xml-0.36.1.sha256sum] =3D "96a05e2e8efddfa51a84ca47cec303f=
ac86c8541b686d37cac5efc0e094417bc"
>  SRC_URI[quickcheck-1.0.3.sha256sum] =3D "588f6378e4dd99458b60ec275b4477a=
dd41ce4fa9f64dcba6f15adccb19b50d6"
>  SRC_URI[quickcheck_macros-1.0.0.sha256sum] =3D "b22a693222d716a9587786f3=
7ac3f6b4faedb5b80c23914e7303ff5a1d8016e9"
>  SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbdc3=
ab723cdda1c6bd4e6ad4208acaca7"
> @@ -181,25 +236,32 @@ SRC_URI[redox_termios-0.1.3.sha256sum] =3D "2014567=
0ba436b55d91fc92d25e71160fbfbdd
>  SRC_URI[regex-1.10.5.sha256sum] =3D "b91213439dad192326a0d7c6ee395591042=
5f441d7038e0d6933b0aec5c4517f"
>  SRC_URI[regex-automata-0.4.7.sha256sum] =3D "38caf58cc5ef2fed281f89292ef=
23f6365465ed9a41b7a7754eb4e26496c92df"
>  SRC_URI[regex-syntax-0.8.4.sha256sum] =3D "7a66a03ae7c801facd77a29370b4f=
aec201768915ac14a721ba36f20bc9c209b"
> +SRC_URI[retry-2.0.0.sha256sum] =3D "9166d72162de3575f950507683fac47e30f6=
f2c3836b71b7fbc61aa517c9c5f4"
>  SRC_URI[roaring-0.10.6.sha256sum] =3D "8f4b84ba6e838ceb47b41de5194a60244=
fac43d9fe03b71dbe8c5a201081d6d1"
> +SRC_URI[rustc-hash-1.1.0.sha256sum] =3D "08d43f7aa6b08d49f382cde6a798204=
7c3426db949b1424bc4b7ec9ae12c6ce2"
>  SRC_URI[rustc_version-0.4.0.sha256sum] =3D "bfa0f585226d2e68097d4f95d113=
b15b83a82e819ab25717ec0590d9584ef366"
>  SRC_URI[rustix-0.38.34.sha256sum] =3D "70dc5ec042f7a43c4a73241207cecc987=
3a06d45debb38b329f8541d85c2730f"
>  SRC_URI[safemem-0.3.3.sha256sum] =3D "ef703b7cb59335eae2eb93ceb664c0eb7e=
a6bf567079d843e09420219668e072"
>  SRC_URI[semver-1.0.23.sha256sum] =3D "61697e0a1c7e512e84a621326239844a24=
d8207b4669b41bc18b32ea5cbf988b"
> +SRC_URI[serde-1.0.204.sha256sum] =3D "bc76f558e0cbb2a839d37354c575f1dc3f=
dc6546b5be373ba43d95f231bf7c12"
> +SRC_URI[serde_derive-1.0.204.sha256sum] =3D "e0cd7e117be63d3c36787767539=
29474f3b04a43a080c744d6b0ae2a8c28e222"
>  SRC_URI[shared_child-1.0.0.sha256sum] =3D "b0d94659ad3c2137fef23ae75b03d=
5241d633f8acded53d672decfa0e6e0caef"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
>  SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e262856=
4b3b043a70948a3f0b778838c5fb4f"
>  SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
> -SRC_URI[syn-2.0.70.sha256sum] =3D "2f0209b68b3613b093e0ec905354eccaedcfe=
83b8cb37cbdeae64026c3064c16"
> +SRC_URI[syn-2.0.72.sha256sum] =3D "dc4b9b9bf2add8093d3f2c0204471e951b228=
5580335de42f9d2534f3ae7a8af"
>  SRC_URI[tempfile-3.10.1.sha256sum] =3D "85b77fafb263dd9d05cbeac119526425=
676db3784113aa9295c88498cbf8bff1"
>  SRC_URI[termion-1.5.6.sha256sum] =3D "077185e2eac69c3f8379a4298e1e07cd36=
beb962290d4a51199acf0fdc10607e"
>  SRC_URI[termtree-0.4.1.sha256sum] =3D "3369f5ac52d5eb6ab48c6b4ffdc8efbca=
d6b89c765749064ba298f2c68a16a76"
> -SRC_URI[thiserror-1.0.61.sha256sum] =3D "c546c80d6be4bc6a00c0f01730c08df=
82eaa7a7a61f11d656526506112cc1709"
> -SRC_URI[thiserror-impl-1.0.61.sha256sum] =3D "46c3384250002a6d5af4d114f2=
845d37b57521033f30d5c3f46c4d70e1197533"
> +SRC_URI[thiserror-1.0.63.sha256sum] =3D "c0342370b38b6a11b6cc11d6a805569=
958d54cfa061a29969c3b5ce2ea405724"
> +SRC_URI[thiserror-impl-1.0.63.sha256sum] =3D "a4558b58466b9ad7ca0f102865=
eccc95938dca1a74a856f2b57b6629050da261"
>  SRC_URI[threadpool-1.8.1.sha256sum] =3D "d050e60b33d41c19108b32cea321640=
33a9013fe3b46cbd4457559bfbf77afaa"
>  SRC_URI[tui-0.19.0.sha256sum] =3D "ccdd26cbd674007e649a272da4475fb666d3a=
a0ad0531da7136db6fab0e5bad1"
> +SRC_URI[udev-0.7.0.sha256sum] =3D "4ebdbbd670373442a12fe9ef7aeb53aec4147=
a5a27a00bbc3ab639f08f48191a"
>  SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db536=
83adb661634f67557942dea4facebec0fee4b"
>  SRC_URI[unicode-segmentation-1.11.0.sha256sum] =3D "d4c87d22b6e3f4a18d4d=
40ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
>  SRC_URI[unicode-width-0.1.13.sha256sum] =3D "0336d538f7abc86d282a4189614=
dfaa90810dfc2c6f6427eaf88e16311dd225d"
> +SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7f=
aecc7fa57071cce2578660c9f1010821"
>  SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
>  SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
>  SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> @@ -214,3 +276,5 @@ SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "2409=
48bc05c5e7c6dabba28bf89d89ffc
>  SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901c=
b5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
>  SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc417412679=
681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
>  SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +SRC_URI[zerocopy-0.7.35.sha256sum] =3D "1b9b4fd18abc82b8136838da5d50bae7=
bdea537c574d8dc1a34ed098d6c166f0"
> +SRC_URI[zerocopy-derive-0.7.35.sha256sum] =3D "fa4f8080344d4671fb4e831a1=
3ad1e68092748387dfc4f55e356242fae12ce3e"
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisi=
oning-tools-git-crates.inc b/meta-oe/dynamic-layers/clang-layer/recipes-sup=
port/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
> similarity index 100%
> rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisio=
ning-tools-git-crates.inc
> rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisi=
oning-tools/thin-provisioning-tools-git-crates.inc
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisi=
oning-tools_1.0.13.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/=
thin-provisioning-tools/thin-provisioning-tools_1.0.14.bb
> similarity index 82%
> rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisio=
ning-tools_1.0.13.bb
> rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisi=
oning-tools/thin-provisioning-tools_1.0.14.bb
> index 1d3c797244..e5a683aa0f 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-t=
ools_1.0.13.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.0.14.bb
> @@ -4,17 +4,23 @@ HOMEPAGE =3D "https://github.com/jthornber/thin-provisi=
oning-tools"
>  LICENSE =3D "GPL-3.0-only"
>  SECTION =3D "devel"
>
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
>  S =3D "${WORKDIR}/git"
>
>  SRC_URI =3D " \
>      git://github.com/jthornber/thin-provisioning-tools;branch=3Dmain;pro=
tocol=3Dhttps \
>      "
>
> -SRCREV =3D "116c05345bed5fe727992c3458311606d5443ff6"
> +# v1.0.14
> +SRCREV =3D "6be3e0937800cb947f1be7c0150825f155cfca14"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
>  inherit cargo cargo-update-recipe-crates
> +inherit pkgconfig
> +
> +DEPENDS +=3D "udev clang-native"
> +
> +export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
>
>  require ${BPN}-crates.inc
>  require ${BPN}-git-crates.inc
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115557): https://lists.openembedded.org/g/openembedde=
d-devel/message/115557
> Mute This Topic: https://lists.openembedded.org/mt/111371873/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

