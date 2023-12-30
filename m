Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB245C4706F
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 17:38:36 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.188785.1703957907529375318
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 09:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AsDCrFd3;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-595540eb7a6so126015eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 09:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703957907; x=1704562707; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vJAGdeVXfxyLgl4hxq1iS/CMYBVf5meMC9U1MpvNW1c=;
        b=AsDCrFd3c/i9wzUiWesZ0o5MMg77gwm0p4zXCgHx2RjT4qSUgwPjAUq/pIFGWe34j7
         iOyW4QndpvgWKwuZbL+StoS3BaiAF9WOZ1c97MoNAiIWwJ2kQpkDYRUy0XKnaMM3yb1P
         ISUzyrJzpvvDlOTGyavE98GXftMtJZhBYFSoK/Iac+QeOsEfHzErwUtAoE8+13AU8Rtx
         F87rIgtHRTd6w8JoQ+nIwxcGjCzBug3ofUX70/tAeNT3w936uIPfkFOfjKsI8j8Kb1RU
         vcMpm/Aw9rsueLKY83Q3mY/q9KR0OcVMq9521SNvUJwdMweCooNo8vb+aUOPFLSlh7+E
         xcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703957907; x=1704562707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJAGdeVXfxyLgl4hxq1iS/CMYBVf5meMC9U1MpvNW1c=;
        b=C8OsS8WR0w1dHRwbE8TFp7wAGNwGdMqnuDCS8ud84/WPzyUZPgGii5zSdirOo5y2LI
         PiyFh9mFROtc+88J/zy8m24N5pwUtJDmLijiBa5ae4WG7N/iEcbEj3XY+KplKd6MBtrg
         GvUwnA7BJaHcSmDe2tOgph3mk4smMuPgcqWig1PWARJtlm/2BPKFkwi98/zrOmkDAoFf
         tmhbkpg4EDaY+jNg2NRnuRL3yhKRPVcXDdWCC1RFN5VVXFcoKah+omoweQnf0ADMRM/u
         F0ufxs5c9cYO0uGwBvcjCQTpQYzLIUhd4O6VZseVvgLzIwRVeJhmaJf8EtxkUvAlFA9q
         b3xA==
X-Gm-Message-State: AOJu0Yxd1G/ROvUOkExZCovyGud0tBBO1n2Ah1yTv3EiauT6KZcQ+dy2
	TJ90dDUO6YlW8PmVJOdTdNoGKo69cJqJD5odazcP467F
X-Google-Smtp-Source: AGHT+IHZsGhf1t7CPKCcj2X8bf+hgbLmXa62V4MrwsTKEBDuQ62C/MJZ6wWEzP4GGmFrESOgrbRbdc1L+a1FiJQGH1o=
X-Received: by 2002:a05:6870:96a8:b0:204:1a34:9f12 with SMTP id
 o40-20020a05687096a800b002041a349f12mr12806263oaq.89.1703957906515; Sat, 30
 Dec 2023 09:38:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701991044.git.ticotimo@gmail.com> <ba32d6274e151103f67116c9a99c61435f47eb01.1701991044.git.ticotimo@gmail.com>
 <202312301110263c5e7006@mail.local>
In-Reply-To: <202312301110263c5e7006@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Dec 2023 09:38:15 -0800
Message-ID: <CAMKF1srJnQ3EXZaHm4_BWvvjw8qjfJ8XC-qWoUV4uAWEBxrONg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-pydantic-core: add v2.14.5
To: alexandre.belloni@bootlin.com
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000baeaa1060dbd9dea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 17:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107910

--000000000000baeaa1060dbd9dea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you are building master branch of meta-openembedded with nanbield of
poly then perhaps that combination should be marked invalid. We should also
bump the layer compat for master branch of meta-openembedded to move to
next release code name

On Sat, Dec 30, 2023 at 3:10=E2=80=AFAM Alexandre Belloni via lists.openemb=
edded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:

> Hello,
>
> This causes the following failure:
> ERROR: ParseError at
> /home/pokybuild/yocto-worker/metrics/build/meta-openembedded/meta-python/=
recipes-devtools/python/
> python3-pydantic-core_2.14.5.bb:17: Could not inherit file
> classes/python_maturin.bbclass
> ERROR: Parsing halted due to errors, see error messages above
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/947/st=
eps/20/logs/stdio
>
> The reason is that this is built with the nanbield branch of poky which
> doesn't have maturin.
>
> On 07/12/2023 15:23:51-0800, Tim Orling wrote:
> > Runtime dependency for current python3-pydantic
> >
> > This package provides the core functionality for pydantic validation an=
d
> serialization.
> >
> > Pydantic-core is currently around 17x faster than pydantic V1. See
> tests/benchmarks/ for details.
> > https://github.com/pydantic/pydantic-core/tree/v2.14.5/tests/benchmarks
> >
> > Signed-off-by: Tim Orling <ticotimo@gmail.com>
> > ---
> >  .../python/python3-pydantic-core-crates.inc   | 166 ++++++++++++++++++
> >  .../python/python3-pydantic-core_2.14.5.bb    |  25 +++
> >  2 files changed, 191 insertions(+)
> >  create mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-pydantic-core_2.14.5.bb
> >
> > diff --git
> a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> > new file mode 100644
> > index 000000000..932cfc852
> > --- /dev/null
> > +++
> b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> > @@ -0,0 +1,166 @@
> > +# Autogenerated with 'bitbake -c update_crates python3-pydantic-core'
> > +
> > +# from Cargo.lock
> > +SRC_URI +=3D " \
> > +    crate://crates.io/ahash/0.8.6 \
> > +    crate://crates.io/aho-corasick/1.0.2 \
> > +    crate://crates.io/autocfg/1.1.0 \
> > +    crate://crates.io/base64/0.21.5 \
> > +    crate://crates.io/bitflags/1.3.2 \
> > +    crate://crates.io/cc/1.0.79 \
> > +    crate://crates.io/cfg-if/1.0.0 \
> > +    crate://crates.io/enum_dispatch/0.3.12 \
> > +    crate://crates.io/equivalent/1.0.1 \
> > +    crate://crates.io/form_urlencoded/1.2.0 \
> > +    crate://crates.io/getrandom/0.2.10 \
> > +    crate://crates.io/hashbrown/0.14.0 \
> > +    crate://crates.io/heck/0.4.1 \
> > +    crate://crates.io/idna/0.4.0 \
> > +    crate://crates.io/indexmap/2.0.0 \
> > +    crate://crates.io/indoc/2.0.4 \
> > +    crate://crates.io/itoa/1.0.8 \
> > +    crate://crates.io/jiter/0.0.4 \
> > +    crate://crates.io/lexical-core/0.8.5 \
> > +    crate://crates.io/lexical-parse-float/0.8.5 \
> > +    crate://crates.io/lexical-parse-integer/0.8.6 \
> > +    crate://crates.io/lexical-util/0.8.5 \
> > +    crate://crates.io/lexical-write-float/0.8.5 \
> > +    crate://crates.io/lexical-write-integer/0.8.5 \
> > +    crate://crates.io/libc/0.2.147 \
> > +    crate://crates.io/lock_api/0.4.10 \
> > +    crate://crates.io/memchr/2.6.3 \
> > +    crate://crates.io/memoffset/0.9.0 \
> > +    crate://crates.io/num-bigint/0.4.4 \
> > +    crate://crates.io/num-integer/0.1.45 \
> > +    crate://crates.io/num-traits/0.2.16 \
> > +    crate://crates.io/once_cell/1.18.0 \
> > +    crate://crates.io/parking_lot/0.12.1 \
> > +    crate://crates.io/parking_lot_core/0.9.8 \
> > +    crate://crates.io/percent-encoding/2.3.0 \
> > +    crate://crates.io/proc-macro2/1.0.69 \
> > +    crate://crates.io/pyo3/0.20.0 \
> > +    crate://crates.io/pyo3-build-config/0.20.0 \
> > +    crate://crates.io/pyo3-ffi/0.20.0 \
> > +    crate://crates.io/pyo3-macros/0.20.0 \
> > +    crate://crates.io/pyo3-macros-backend/0.20.0 \
> > +    crate://crates.io/python3-dll-a/0.2.9 \
> > +    crate://crates.io/quote/1.0.29 \
> > +    crate://crates.io/redox_syscall/0.3.5 \
> > +    crate://crates.io/regex/1.10.2 \
> > +    crate://crates.io/regex-automata/0.4.3 \
> > +    crate://crates.io/regex-syntax/0.8.2 \
> > +    crate://crates.io/rustversion/1.0.13 \
> > +    crate://crates.io/ryu/1.0.14 \
> > +    crate://crates.io/scopeguard/1.1.0 \
> > +    crate://crates.io/serde/1.0.190 \
> > +    crate://crates.io/serde_derive/1.0.190 \
> > +    crate://crates.io/serde_json/1.0.108 \
> > +    crate://crates.io/smallvec/1.11.1 \
> > +    crate://crates.io/speedate/0.13.0 \
> > +    crate://crates.io/static_assertions/1.1.0 \
> > +    crate://crates.io/strum/0.25.0 \
> > +    crate://crates.io/strum_macros/0.25.3 \
> > +    crate://crates.io/syn/2.0.38 \
> > +    crate://crates.io/target-lexicon/0.12.9 \
> > +    crate://crates.io/tinyvec/1.6.0 \
> > +    crate://crates.io/tinyvec_macros/0.1.1 \
> > +    crate://crates.io/unicode-bidi/0.3.13 \
> > +    crate://crates.io/unicode-ident/1.0.10 \
> > +    crate://crates.io/unicode-normalization/0.1.22 \
> > +    crate://crates.io/unindent/0.2.3 \
> > +    crate://crates.io/url/2.4.1 \
> > +    crate://crates.io/uuid/1.5.0 \
> > +    crate://crates.io/version_check/0.9.4 \
> > +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> > +    crate://crates.io/windows-targets/0.48.1 \
> > +    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
> > +    crate://crates.io/windows_aarch64_msvc/0.48.0 \
> > +    crate://crates.io/windows_i686_gnu/0.48.0 \
> > +    crate://crates.io/windows_i686_msvc/0.48.0 \
> > +    crate://crates.io/windows_x86_64_gnu/0.48.0 \
> > +    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
> > +    crate://crates.io/windows_x86_64_msvc/0.48.0 \
> > +    crate://crates.io/zerocopy/0.7.20 \
> > +    crate://crates.io/zerocopy-derive/0.7.20 \
> > +"
> > +
> > +SRC_URI[ahash-0.8.6.sha256sum] =3D
> "91429305e9f0a25f6205c5b8e0d2db09e0708a7a6df0f42212bb56c32c8ac97a"
> > +SRC_URI[aho-corasick-1.0.2.sha256sum] =3D
> "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
> > +SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > +SRC_URI[base64-0.21.5.sha256sum] =3D
> "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
> > +SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > +SRC_URI[cc-1.0.79.sha256sum] =3D
> "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
> > +SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > +SRC_URI[enum_dispatch-0.3.12.sha256sum] =3D
> "8f33313078bb8d4d05a2733a94ac4c2d8a0df9a2b84424ebf4f33bfc224a890e"
> > +SRC_URI[equivalent-1.0.1.sha256sum] =3D
> "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
> > +SRC_URI[form_urlencoded-1.2.0.sha256sum] =3D
> "a62bc1cf6f830c2ec14a513a9fb124d0a213a629668a4186f329db21fe045652"
> > +SRC_URI[getrandom-0.2.10.sha256sum] =3D
> "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
> > +SRC_URI[hashbrown-0.14.0.sha256sum] =3D
> "2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a"
> > +SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> > +SRC_URI[idna-0.4.0.sha256sum] =3D
> "7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c"
> > +SRC_URI[indexmap-2.0.0.sha256sum] =3D
> "d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d"
> > +SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
> > +SRC_URI[itoa-1.0.8.sha256sum] =3D
> "62b02a5381cc465bd3041d84623d0fa3b66738b52b8e2fc3bab8ad63ab032f4a"
> > +SRC_URI[jiter-0.0.4.sha256sum] =3D
> "b27d419c535bf7b50ad355278b1159cbf0cc8d507ea003d625b17bf0375720b8"
> > +SRC_URI[lexical-core-0.8.5.sha256sum] =3D
> "2cde5de06e8d4c2faabc400238f9ae1c74d5412d03a7bd067645ccbc47070e46"
> > +SRC_URI[lexical-parse-float-0.8.5.sha256sum] =3D
> "683b3a5ebd0130b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
> > +SRC_URI[lexical-parse-integer-0.8.6.sha256sum] =3D
> "6d0994485ed0c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
> > +SRC_URI[lexical-util-0.8.5.sha256sum] =3D
> "5255b9ff16ff898710eb9eb63cb39248ea8a5bb036bea8085b1a767ff6c4e3fc"
> > +SRC_URI[lexical-write-float-0.8.5.sha256sum] =3D
> "accabaa1c4581f05a3923d1b4cfd124c329352288b7b9da09e766b0668116862"
> > +SRC_URI[lexical-write-integer-0.8.5.sha256sum] =3D
> "e1b6f3d1f4422866b68192d62f77bc5c700bee84f3069f2469d7bc8c77852446"
> > +SRC_URI[libc-0.2.147.sha256sum] =3D
> "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
> > +SRC_URI[lock_api-0.4.10.sha256sum] =3D
> "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
> > +SRC_URI[memchr-2.6.3.sha256sum] =3D
> "8f232d6ef707e1956a43342693d2a31e72989554d58299d7a88738cc95b0d35c"
> > +SRC_URI[memoffset-0.9.0.sha256sum] =3D
> "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
> > +SRC_URI[num-bigint-0.4.4.sha256sum] =3D
> "608e7659b5c3d7cba262d894801b9ec9d00de989e8a82bd4bef91d08da45cdc0"
> > +SRC_URI[num-integer-0.1.45.sha256sum] =3D
> "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
> > +SRC_URI[num-traits-0.2.16.sha256sum] =3D
> "f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee9e6c2"
> > +SRC_URI[once_cell-1.18.0.sha256sum] =3D
> "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
> > +SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
> > +SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D
> "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
> > +SRC_URI[percent-encoding-2.3.0.sha256sum] =3D
> "9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94"
> > +SRC_URI[proc-macro2-1.0.69.sha256sum] =3D
> "134c189feb4956b20f6f547d2cf727d4c0fe06722b20a0eec87ed445a97f92da"
> > +SRC_URI[pyo3-0.20.0.sha256sum] =3D
> "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
> > +SRC_URI[pyo3-build-config-0.20.0.sha256sum] =3D
> "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
> > +SRC_URI[pyo3-ffi-0.20.0.sha256sum] =3D
> "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
> > +SRC_URI[pyo3-macros-0.20.0.sha256sum] =3D
> "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
> > +SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] =3D
> "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
> > +SRC_URI[python3-dll-a-0.2.9.sha256sum] =3D
> "d5f07cd4412be8fa09a721d40007c483981bbe072cd6a21f2e83e04ec8f8343f"
> > +SRC_URI[quote-1.0.29.sha256sum] =3D
> "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
> > +SRC_URI[redox_syscall-0.3.5.sha256sum] =3D
> "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
> > +SRC_URI[regex-1.10.2.sha256sum] =3D
> "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
> > +SRC_URI[regex-automata-0.4.3.sha256sum] =3D
> "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
> > +SRC_URI[regex-syntax-0.8.2.sha256sum] =3D
> "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
> > +SRC_URI[rustversion-1.0.13.sha256sum] =3D
> "dc31bd9b61a32c31f9650d18add92aa83a49ba979c143eefd27fe7177b05bd5f"
> > +SRC_URI[ryu-1.0.14.sha256sum] =3D
> "fe232bdf6be8c8de797b22184ee71118d63780ea42ac85b61d1baa6d3b782ae9"
> > +SRC_URI[scopeguard-1.1.0.sha256sum] =3D
> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> > +SRC_URI[serde-1.0.190.sha256sum] =3D
> "91d3c334ca1ee894a2c6f6ad698fe8c435b76d504b13d436f0685d648d6d96f7"
> > +SRC_URI[serde_derive-1.0.190.sha256sum] =3D
> "67c5609f394e5c2bd7fc51efda478004ea80ef42fee983d5c67a65e34f32c0e3"
> > +SRC_URI[serde_json-1.0.108.sha256sum] =3D
> "3d1c7e3eac408d115102c4c24ad393e0821bb3a5df4d506a80f85f7a742a526b"
> > +SRC_URI[smallvec-1.11.1.sha256sum] =3D
> "942b4a808e05215192e39f4ab80813e599068285906cc91aa64f923db842bd5a"
> > +SRC_URI[speedate-0.13.0.sha256sum] =3D
> "242f76c50fd18cbf098607090ade73a08d39cfd84ea835f3796a2c855223b19b"
> > +SRC_URI[static_assertions-1.1.0.sha256sum] =3D
> "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> > +SRC_URI[strum-0.25.0.sha256sum] =3D
> "290d54ea6f91c969195bdbcd7442c8c2a2ba87da8bf60a7ee86a235d4bc1e125"
> > +SRC_URI[strum_macros-0.25.3.sha256sum] =3D
> "23dc1fa9ac9c169a78ba62f0b841814b7abae11bdd047b9c58f893439e309ea0"
> > +SRC_URI[syn-2.0.38.sha256sum] =3D
> "e96b79aaa137db8f61e26363a0c9b47d8b4ec75da28b7d1d614c2303e232408b"
> > +SRC_URI[target-lexicon-0.12.9.sha256sum] =3D
> "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
> > +SRC_URI[tinyvec-1.6.0.sha256sum] =3D
> "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
> > +SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D
> "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> > +SRC_URI[unicode-bidi-0.3.13.sha256sum] =3D
> "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
> > +SRC_URI[unicode-ident-1.0.10.sha256sum] =3D
> "22049a19f4a68748a168c0fc439f9516686aa045927ff767eca0a85101fb6e73"
> > +SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D
> "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
> > +SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
> > +SRC_URI[url-2.4.1.sha256sum] =3D
> "143b538f18257fac9cad154828a57c6bf5157e1aa604d4816b5995bf6de87ae5"
> > +SRC_URI[uuid-1.5.0.sha256sum] =3D
> "88ad59a7560b41a70d191093a945f0b87bc1deeda46fb237479708a1d6b6cdfc"
> > +SRC_URI[version_check-0.9.4.sha256sum] =3D
> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> > +SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D
> "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> > +SRC_URI[windows-targets-0.48.1.sha256sum] =3D
> "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
> > +SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D
> "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
> > +SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D
> "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
> > +SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D
> "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
> > +SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D
> "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
> > +SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D
> "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
> > +SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D
> "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
> > +SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D
> "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
> > +SRC_URI[zerocopy-0.7.20.sha256sum] =3D
> "dd66a62464e3ffd4e37bd09950c2b9dd6c4f8767380fabba0d523f9a775bc85a"
> > +SRC_URI[zerocopy-derive-0.7.20.sha256sum] =3D
> "255c4596d41e6916ced49cfafea18727b24d67878fa180ddfd69b9df34fd1726"
> > diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.14.5.bb b/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.14.5.bb
> > new file mode 100644
> > index 000000000..8221de80b
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.14.5.bb
> > @@ -0,0 +1,25 @@
> > +SUMMARY =3D "Provides the core functionality for pydantic validation a=
nd
> serialization."
> > +DESCRIPTION =3D "This package provides the core functionality for \
> > +pydantic validation and serialization.\
> > +\
> > +Pydantic-core is currently around 17x faster than pydantic V1."
> > +HOMEPAGE =3D "https://github.com/pydantic/pydantic-core"
> > +
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a314d2856b3a5503=
0c75c"
> > +
> > +SRC_URI[sha256sum] =3D
> "6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71"
> > +
> > +DEPENDS =3D "python3-maturin-native python3-typing-extensions"
> > +
> > +require ${BPN}-crates.inc
> > +
> > +inherit pypi cargo-update-recipe-crates python_maturin
> > +
> > +S =3D "${WORKDIR}/pydantic_core-${PV}"
> > +
> > +PYPI_ARCHIVE_NAME =3D "pydantic_core-${PV}.${PYPI_PACKAGE_EXT}"
> > +
> > +RDEPENDS:${PN} +=3D "python3-typing-extensions"
> > +
> > +INSANE_SKIP:${PN} =3D "already-stripped"
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107907):
> https://lists.openembedded.org/g/openembedded-devel/message/107907
> Mute This Topic: https://lists.openembedded.org/mt/103045274/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000baeaa1060dbd9dea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If you are building master branch of meta-openembedded wi=
th nanbield of poly then perhaps that combination should be marked invalid.=
 We should also bump the layer compat for master branch of meta-openembedde=
d to move to next release code name=C2=A0</div><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 30, 2023 at 3:10=
=E2=80=AFAM Alexandre Belloni via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;alexandre.belloni=3D<a href=3D"mailto:bootl=
in.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
This causes the following failure:<br>
ERROR: ParseError at /home/pokybuild/yocto-worker/metrics/build/meta-openem=
bedded/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydant=
ic-core_2.14.5.bb:17" rel=3D"noreferrer" target=3D"_blank">python3-pydantic=
-core_2.14.5.bb:17</a>: Could not inherit file classes/python_maturin.bbcla=
ss<br>
ERROR: Parsing halted due to errors, see error messages above<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/138/buil=
ds/947/steps/20/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/138/builds/947/steps/20/logs/=
stdio</a><br>
<br>
The reason is that this is built with the nanbield branch of poky which<br>
doesn&#39;t have maturin.<br>
<br>
On 07/12/2023 15:23:51-0800, Tim Orling wrote:<br>
&gt; Runtime dependency for current python3-pydantic<br>
&gt; <br>
&gt; This package provides the core functionality for pydantic validation a=
nd serialization.<br>
&gt; <br>
&gt; Pydantic-core is currently around 17x faster than pydantic V1. See tes=
ts/benchmarks/ for details.<br>
&gt; <a href=3D"https://github.com/pydantic/pydantic-core/tree/v2.14.5/test=
s/benchmarks" rel=3D"noreferrer" target=3D"_blank">https://github.com/pydan=
tic/pydantic-core/tree/v2.14.5/tests/benchmarks</a><br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3-pydantic-core-crates.inc=C2=A0 =C2=A0| 166 ++=
++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pydantic-core_2.14.5.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-pydantic-core_2.14.5.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 25 +++<br>
&gt;=C2=A0 2 files changed, 191 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/python3-p=
ydantic-core-crates.inc<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pydantic-core_2.14.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pydantic-core_2.14.5.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core=
-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-cra=
tes.inc<br>
&gt; new file mode 100644<br>
&gt; index 000000000..932cfc852<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates=
.inc<br>
&gt; @@ -0,0 +1,166 @@<br>
&gt; +# Autogenerated with &#39;bitbake -c update_crates python3-pydantic-c=
ore&#39;<br>
&gt; +<br>
&gt; +# from Cargo.lock<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ahash/0.8.6" rel=3D=
"noreferrer" target=3D"_blank">crates.io/ahash/0.8.6</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/1.0.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/1.0.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.21.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/base64/0.21.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.79" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cc/1.0.79</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enum_dispatch/0.3.1=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/enum_dispatch/0.3.12</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/equivalent/1.0.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/equivalent/1.0.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/form_urlencoded/1.2=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/form_urlencoded/1.2.0</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.10" r=
el=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.10</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.14.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/hashbrown/0.14.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.4.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/heck/0.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna/0.4.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/idna/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/2.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/indexmap/2.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/indoc/2.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.8" rel=3D"=
noreferrer" target=3D"_blank">crates.io/itoa/1.0.8</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiter/0.0.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/jiter/0.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lexical-core/0.8.5"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-core/0.8.5</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lexical-parse-float=
/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-parse-float/=
0.8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lexical-parse-integ=
er/0.8.6" rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-parse-inte=
ger/0.8.6</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lexical-util/0.8.5"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-util/0.8.5</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lexical-write-float=
/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-write-float/=
0.8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lexical-write-integ=
er/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/lexical-write-inte=
ger/0.8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.147" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.147</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.10" re=
l=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.4.10</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.6.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/memchr/2.6.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-bigint/0.4.4" r=
el=3D"noreferrer" target=3D"_blank">crates.io/num-bigint/0.4.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.45"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.45</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.16" =
rel=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.16</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.18.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.18.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.12.1"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.1</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.=
9.8" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.8<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/percent-encoding/2.=
3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/percent-encoding/2.3.0<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.69"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.69</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/pyo3/0.20.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.20.0" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.2=
0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.0</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.20.0" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend=
/0.20.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/python3-dll-a/0.2.9=
" rel=3D"noreferrer" target=3D"_blank">crates.io/python3-dll-a/0.2.9</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.29" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.29</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.3.5=
" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.3.5</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.10.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/regex/1.10.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-automata/0.4.=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-automata/0.4.3</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.8.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.8.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustversion/1.0.13"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/rustversion/1.0.13</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.14" rel=3D"=
noreferrer" target=3D"_blank">crates.io/ryu/1.0.14</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.190" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde/1.0.190</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.19=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.190</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.108"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.108</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.11.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/smallvec/1.11.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/speedate/0.13.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/speedate/0.13.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/static_assertions/1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/static_assertions/1.1.=
0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strum/0.25.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/strum/0.25.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strum_macros/0.25.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/strum_macros/0.25.3</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.38" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/2.0.38</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.9" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.9</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinyvec/1.6.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tinyvec/1.6.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinyvec_macros/0.1.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/tinyvec_macros/0.1.1</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-bidi/0.3.13=
" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-bidi/0.3.13</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.1=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.10</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-normalizati=
on/0.1.22" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-normaliza=
tion/0.1.22</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unindent/0.2.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.2.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/url/2.4.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/url/2.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/1.5.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/uuid/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.11.0+wasi-sn=
apshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.11.0=
+wasi-snapshot-preview1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.4=
8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.48.1<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnu=
llvm/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64=
_gnullvm/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msv=
c/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_ms=
vc/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.=
48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.48.=
0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0=
.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.4=
8.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0=
.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_g=
nullvm/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc=
/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy/0.7.20" re=
l=3D"noreferrer" target=3D"_blank">crates.io/zerocopy/0.7.20</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy-derive/0.7=
.20" rel=3D"noreferrer" target=3D"_blank">crates.io/zerocopy-derive/0.7.20<=
/a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRC_URI[ahash-0.8.6.sha256sum] =3D &quot;91429305e9f0a25f6205c5b8e0d2=
db09e0708a7a6df0f42212bb56c32c8ac97a&quot;<br>
&gt; +SRC_URI[aho-corasick-1.0.2.sha256sum] =3D &quot;43f6cb1bf222025340178=
f382c426f13757b2960e89779dfcb319c32542a5a41&quot;<br>
&gt; +SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575e9b05=
3f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
&gt; +SRC_URI[base64-0.21.5.sha256sum] =3D &quot;35636a1494ede3b646cc98f74f=
8e62c773a38a659ebc777a2cf26b9b74171df9&quot;<br>
&gt; +SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7df=
d33ccf595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
&gt; +SRC_URI[cc-1.0.79.sha256sum] =3D &quot;50d30906286121d95be3d479533b45=
8f87493b30a4b5f79a607db8f5d11aa91f&quot;<br>
&gt; +SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619e3cbc=
0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
&gt; +SRC_URI[enum_dispatch-0.3.12.sha256sum] =3D &quot;8f33313078bb8d4d05a=
2733a94ac4c2d8a0df9a2b84424ebf4f33bfc224a890e&quot;<br>
&gt; +SRC_URI[equivalent-1.0.1.sha256sum] =3D &quot;5443807d6dff69373d433ab=
9ef5378ad8df50ca6298caf15de6e52e24aaf54d5&quot;<br>
&gt; +SRC_URI[form_urlencoded-1.2.0.sha256sum] =3D &quot;a62bc1cf6f830c2ec1=
4a513a9fb124d0a213a629668a4186f329db21fe045652&quot;<br>
&gt; +SRC_URI[getrandom-0.2.10.sha256sum] =3D &quot;be4136b2a15dd319360be1c=
07d9933517ccf0be8f16bf62a3bee4f0d618df427&quot;<br>
&gt; +SRC_URI[hashbrown-0.14.0.sha256sum] =3D &quot;2c6201b9ff9fd90a5a3bac2=
e56a830d0caa509576f0e503818ee82c181b3437a&quot;<br>
&gt; +SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910cecb028156=
0f54b440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
&gt; +SRC_URI[idna-0.4.0.sha256sum] =3D &quot;7d20d6b07bfbc108882d88ed8e37d=
39636dcc260e15e30c45e6ba089610b917c&quot;<br>
&gt; +SRC_URI[indexmap-2.0.0.sha256sum] =3D &quot;d5477fe2230a79769d8dc68e0=
eabf5437907c0457a5614a9e8dddb67f65eb65d&quot;<br>
&gt; +SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513daff4240b4=
797e342f988cecda4fb6c939150f96315fd8&quot;<br>
&gt; +SRC_URI[itoa-1.0.8.sha256sum] =3D &quot;62b02a5381cc465bd3041d84623d0=
fa3b66738b52b8e2fc3bab8ad63ab032f4a&quot;<br>
&gt; +SRC_URI[jiter-0.0.4.sha256sum] =3D &quot;b27d419c535bf7b50ad355278b11=
59cbf0cc8d507ea003d625b17bf0375720b8&quot;<br>
&gt; +SRC_URI[lexical-core-0.8.5.sha256sum] =3D &quot;2cde5de06e8d4c2faabc4=
00238f9ae1c74d5412d03a7bd067645ccbc47070e46&quot;<br>
&gt; +SRC_URI[lexical-parse-float-0.8.5.sha256sum] =3D &quot;683b3a5ebd0130=
b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f&quot;<br>
&gt; +SRC_URI[lexical-parse-integer-0.8.6.sha256sum] =3D &quot;6d0994485ed0=
c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9&quot;<br>
&gt; +SRC_URI[lexical-util-0.8.5.sha256sum] =3D &quot;5255b9ff16ff898710eb9=
eb63cb39248ea8a5bb036bea8085b1a767ff6c4e3fc&quot;<br>
&gt; +SRC_URI[lexical-write-float-0.8.5.sha256sum] =3D &quot;accabaa1c4581f=
05a3923d1b4cfd124c329352288b7b9da09e766b0668116862&quot;<br>
&gt; +SRC_URI[lexical-write-integer-0.8.5.sha256sum] =3D &quot;e1b6f3d1f442=
2866b68192d62f77bc5c700bee84f3069f2469d7bc8c77852446&quot;<br>
&gt; +SRC_URI[libc-0.2.147.sha256sum] =3D &quot;b4668fb0ea861c1df094127ac5f=
1da3409a82116a4ba74fca2e58ef927159bb3&quot;<br>
&gt; +SRC_URI[lock_api-0.4.10.sha256sum] =3D &quot;c1cc9717a20b1bb222f333e6=
a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16&quot;<br>
&gt; +SRC_URI[memchr-2.6.3.sha256sum] =3D &quot;8f232d6ef707e1956a43342693d=
2a31e72989554d58299d7a88738cc95b0d35c&quot;<br>
&gt; +SRC_URI[memoffset-0.9.0.sha256sum] =3D &quot;5a634b1c61a95585bd15607c=
6ab0c4e5b226e695ff2800ba0cdccddf208c406c&quot;<br>
&gt; +SRC_URI[num-bigint-0.4.4.sha256sum] =3D &quot;608e7659b5c3d7cba262d89=
4801b9ec9d00de989e8a82bd4bef91d08da45cdc0&quot;<br>
&gt; +SRC_URI[num-integer-0.1.45.sha256sum] =3D &quot;225d3389fb3509a24c93f=
5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9&quot;<br>
&gt; +SRC_URI[num-traits-0.2.16.sha256sum] =3D &quot;f30b0abd723be7e2ffca12=
72140fac1a2f084c77ec3e123c192b66af1ee9e6c2&quot;<br>
&gt; +SRC_URI[once_cell-1.18.0.sha256sum] =3D &quot;dd8b5dd2ae5ed71462c5402=
58bedcb51965123ad7e7ccf4b9a8cafaa4a63576d&quot;<br>
&gt; +SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9f06bc9fff=
0a37ff4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
&gt; +SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D &quot;93f00c865fe7cabf6=
50081affecd3871070f26767e7b2070a3ffae14c654b447&quot;<br>
&gt; +SRC_URI[percent-encoding-2.3.0.sha256sum] =3D &quot;9b2a4787296e99896=
11394c33f193f676704af1686e70b8f8033ab5ba9a35a94&quot;<br>
&gt; +SRC_URI[proc-macro2-1.0.69.sha256sum] =3D &quot;134c189feb4956b20f6f5=
47d2cf727d4c0fe06722b20a0eec87ed445a97f92da&quot;<br>
&gt; +SRC_URI[pyo3-0.20.0.sha256sum] =3D &quot;04e8453b658fe480c3e70c8ed4e3=
d3ec33eb74988bd186561b0cc66b85c3bc4b&quot;<br>
&gt; +SRC_URI[pyo3-build-config-0.20.0.sha256sum] =3D &quot;a96fe70b176a89c=
ff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5&quot;<br>
&gt; +SRC_URI[pyo3-ffi-0.20.0.sha256sum] =3D &quot;214929900fd25e6604661ed9=
cf349727c8920d47deff196c4e28165a6ef2a96b&quot;<br>
&gt; +SRC_URI[pyo3-macros-0.20.0.sha256sum] =3D &quot;dac53072f717aa1bfa4db=
832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b&quot;<br>
&gt; +SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] =3D &quot;7774b5a8282bd=
4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424&quot;<br>
&gt; +SRC_URI[python3-dll-a-0.2.9.sha256sum] =3D &quot;d5f07cd4412be8fa09a7=
21d40007c483981bbe072cd6a21f2e83e04ec8f8343f&quot;<br>
&gt; +SRC_URI[quote-1.0.29.sha256sum] =3D &quot;573015e8ab27661678357f27dc2=
6460738fd2b6c86e46f386fde94cb5d913105&quot;<br>
&gt; +SRC_URI[redox_syscall-0.3.5.sha256sum] =3D &quot;567664f262709473930a=
4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29&quot;<br>
&gt; +SRC_URI[regex-1.10.2.sha256sum] =3D &quot;380b951a9c5e80ddfd6136919ee=
f32310721aa4aacd4889a8d39124b026ab343&quot;<br>
&gt; +SRC_URI[regex-automata-0.4.3.sha256sum] =3D &quot;5f804c7828047e88b2d=
32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f&quot;<br>
&gt; +SRC_URI[regex-syntax-0.8.2.sha256sum] =3D &quot;c08c74e62047bb2de4ff4=
87b251e4a92e24f48745648451635cec7d591162d9f&quot;<br>
&gt; +SRC_URI[rustversion-1.0.13.sha256sum] =3D &quot;dc31bd9b61a32c31f9650=
d18add92aa83a49ba979c143eefd27fe7177b05bd5f&quot;<br>
&gt; +SRC_URI[ryu-1.0.14.sha256sum] =3D &quot;fe232bdf6be8c8de797b22184ee71=
118d63780ea42ac85b61d1baa6d3b782ae9&quot;<br>
&gt; +SRC_URI[scopeguard-1.1.0.sha256sum] =3D &quot;d29ab0c6d3fc0ee92fe66e2=
d99f700eab17a8d57d1c1d3b748380fb20baa78cd&quot;<br>
&gt; +SRC_URI[serde-1.0.190.sha256sum] =3D &quot;91d3c334ca1ee894a2c6f6ad69=
8fe8c435b76d504b13d436f0685d648d6d96f7&quot;<br>
&gt; +SRC_URI[serde_derive-1.0.190.sha256sum] =3D &quot;67c5609f394e5c2bd7f=
c51efda478004ea80ef42fee983d5c67a65e34f32c0e3&quot;<br>
&gt; +SRC_URI[serde_json-1.0.108.sha256sum] =3D &quot;3d1c7e3eac408d115102c=
4c24ad393e0821bb3a5df4d506a80f85f7a742a526b&quot;<br>
&gt; +SRC_URI[smallvec-1.11.1.sha256sum] =3D &quot;942b4a808e05215192e39f4a=
b80813e599068285906cc91aa64f923db842bd5a&quot;<br>
&gt; +SRC_URI[speedate-0.13.0.sha256sum] =3D &quot;242f76c50fd18cbf09860709=
0ade73a08d39cfd84ea835f3796a2c855223b19b&quot;<br>
&gt; +SRC_URI[static_assertions-1.1.0.sha256sum] =3D &quot;a2eb9349b6444b32=
6872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f&quot;<br>
&gt; +SRC_URI[strum-0.25.0.sha256sum] =3D &quot;290d54ea6f91c969195bdbcd744=
2c8c2a2ba87da8bf60a7ee86a235d4bc1e125&quot;<br>
&gt; +SRC_URI[strum_macros-0.25.3.sha256sum] =3D &quot;23dc1fa9ac9c169a78ba=
62f0b841814b7abae11bdd047b9c58f893439e309ea0&quot;<br>
&gt; +SRC_URI[syn-2.0.38.sha256sum] =3D &quot;e96b79aaa137db8f61e26363a0c9b=
47d8b4ec75da28b7d1d614c2303e232408b&quot;<br>
&gt; +SRC_URI[target-lexicon-0.12.9.sha256sum] =3D &quot;df8e77cb757a61f51b=
947ec4a7e3646efd825b73561db1c232a8ccb639e611a0&quot;<br>
&gt; +SRC_URI[tinyvec-1.6.0.sha256sum] =3D &quot;87cc5ceb3875bb20c2890005a4=
e226a4651264a5c75edb2421b52861a0a0cb50&quot;<br>
&gt; +SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D &quot;1f3ccbac311fea05f86=
f61904b462b55fb3df8837a366dfc601a0161d0532f20&quot;<br>
&gt; +SRC_URI[unicode-bidi-0.3.13.sha256sum] =3D &quot;92888ba5573ff080736b=
3648696b70cafad7d250551175acbaa4e0385b3e1460&quot;<br>
&gt; +SRC_URI[unicode-ident-1.0.10.sha256sum] =3D &quot;22049a19f4a68748a16=
8c0fc439f9516686aa045927ff767eca0a85101fb6e73&quot;<br>
&gt; +SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D &quot;5c5713f0fc4=
b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921&quot;<br>
&gt; +SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e1754487cb58364ee=
906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
&gt; +SRC_URI[url-2.4.1.sha256sum] =3D &quot;143b538f18257fac9cad154828a57c=
6bf5157e1aa604d4816b5995bf6de87ae5&quot;<br>
&gt; +SRC_URI[uuid-1.5.0.sha256sum] =3D &quot;88ad59a7560b41a70d191093a945f=
0b87bc1deeda46fb237479708a1d6b6cdfc&quot;<br>
&gt; +SRC_URI[version_check-0.9.4.sha256sum] =3D &quot;49874b5167b65d7193b8=
aba1567f5c7d93d001cafc34600cee003eda787e483f&quot;<br>
&gt; +SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D &quot;9c8d8=
7e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423&quot;<br>
&gt; +SRC_URI[windows-targets-0.48.1.sha256sum] =3D &quot;05d4b17490f70499f=
20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f&quot;<br>
&gt; +SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D &quot;91ae572e1=
b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc&quot;<br>
&gt; +SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D &quot;b2ef27e0d7bd=
fcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3&quot;<br>
&gt; +SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D &quot;622a1962a7db830d=
6fd0a69683c80a18fda201879f0f447f065a3b7467daa241&quot;<br>
&gt; +SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D &quot;4542c6e364ce21b=
f45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00&quot;<br>
&gt; +SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D &quot;ca2b8a661f7628=
cbd23440e50b05d705db3686f894fc9580820623656af974b1&quot;<br>
&gt; +SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D &quot;7896dbc1f4=
1e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953&quot;<br>
&gt; +SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D &quot;1a515f5799fe4=
961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a&quot;<br>
&gt; +SRC_URI[zerocopy-0.7.20.sha256sum] =3D &quot;dd66a62464e3ffd4e37bd099=
50c2b9dd6c4f8767380fabba0d523f9a775bc85a&quot;<br>
&gt; +SRC_URI[zerocopy-derive-0.7.20.sha256sum] =3D &quot;255c4596d41e6916c=
ed49cfafea18727b24d67878fa180ddfd69b9df34fd1726&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pydantic-core_2.14.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pydantic-core_2.14.5.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-pydantic-core_2.14.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pydantic-core_2.14.5.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..8221de80b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
dantic-core_2.14.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydanti=
c-core_2.14.5.bb</a><br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +SUMMARY =3D &quot;Provides the core functionality for pydantic valida=
tion and serialization.&quot;<br>
&gt; +DESCRIPTION =3D &quot;This package provides the core functionality fo=
r \<br>
&gt; +pydantic validation and serialization.\<br>
&gt; +\<br>
&gt; +Pydantic-core is currently around 17x faster than pydantic V1.&quot;<=
br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pydantic/pydantic-co=
re" rel=3D"noreferrer" target=3D"_blank">https://github.com/pydantic/pydant=
ic-core</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dab599c188b4a314d2856b=
3a55030c75c&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;6d30226dfc816dd0fdf120cae611dd2215117e4f=
9b124af8c60ab9093b6e8e71&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;python3-maturin-native python3-typing-extensions&qu=
ot;<br>
&gt; +<br>
&gt; +require ${BPN}-crates.inc<br>
&gt; +<br>
&gt; +inherit pypi cargo-update-recipe-crates python_maturin<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/pydantic_core-${PV}&quot;<br>
&gt; +<br>
&gt; +PYPI_ARCHIVE_NAME =3D &quot;pydantic_core-${PV}.${PYPI_PACKAGE_EXT}&q=
uot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;python3-typing-extensions&quot;<br>
&gt; +<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;already-stripped&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107907): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107907" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107907</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103045274/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103045274/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000baeaa1060dbd9dea--

