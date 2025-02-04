Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688FAC02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 04:16:05 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.108314.1738642562830363847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 20:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8Q4ptW+;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5fa9778fa2cso2501654eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 20:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738642562; x=1739247362; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZRZLC6mukkXCbxV7wEPeTHx4yxsw7cXwqrUwViZmmk=;
        b=e8Q4ptW+l7Rx0PPY9dXuyWN/tmkeVR4dWVu6Ni98VH4XmEgox4XDQnLiiQkT8yuhLd
         f+tlgWaLjVnnYFVpXuTmrlaMlHg9IwLvFB6yRdcOyoXlt5ltcMbR+FJ5YsUfK5Wrd6LI
         /qhRJaDaz8hbOhLlSarkXnviKk2EtV1zL+yHaGG8Lid591xaTqusgBgtqE9x0DsnbNQM
         bKF0Ac5U5f4ozrzi1qEip/qj/HnN9zKR5h2RMUEjsAnPzqD02QJa5fg5pdAkO3af07QO
         nnizn4kbYqwqBMIFXgnL+utgJ0x2p5KYLaDHBR6My+/N/u8Wd04RtxqL+vMxKdDawiD/
         nUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738642562; x=1739247362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZRZLC6mukkXCbxV7wEPeTHx4yxsw7cXwqrUwViZmmk=;
        b=FOjfqTOPi85kREC28t9PAIYEOZP2oV0MU9N5sYHnGGRFO7RvDZPI8B2lFnz/Ytz8M2
         B3vSJh8HX8XdVDnesFkgpkTNt7u1gy5p3UZ+MHBNXirAZgyLCPmfhdzm7/DBk8+AC38X
         itXDauw4V6pSZ6rnPXcGAkQyUhYWiI+eQv7QaS+3+c79GXc2iCESYG48cFbrmnJFvPAm
         4DrkDBdlUUNEzYfEQOSZKvtRXZFhOoeALYQjJ7nknI1ZJhRbVtfGv0z53mz4cNNkjziI
         w8TAAUwefXUiJkwF5X9NpGKg9g2JQd9pdN4Glem66RJ+IVCHzGSslOu0/KQHb7n39ggb
         rwZw==
X-Gm-Message-State: AOJu0YxDaqk/pJnIfvFyhaHPvn0N32XYAZ7wxbQHX9Hg0sQOWGXxl8RM
	m2oA1GC7tpZTs4rSjZgAZmclPWj0BhkdnH6GKtcquLEJSiDLlyLJYF3QPLU50lnWf7JBZMneA7T
	qpOwa/5Sr7LT5/GoCyZskrE/g2ZMf2WKiQwo=
X-Gm-Gg: ASbGncu2Vw701lpFH2Q5EORZHWNj34bDMQhDD44SPA3ZHOhbzXaVJ8vfUGk5EAs84aX
	ThVVLfareCZ7M9xrUUE3MrVntwEehSYnJrVqx3S8RxBEH8bJHbnaGuINcgKkEh+tUGmzfFlM=
X-Google-Smtp-Source: AGHT+IGD0sw+Haf0OSrX8RdU8yj4e1jFc6W9kaeE4YVLZrBN0C1qr1XkM2rcpBQM16ZPQkCja7YO+ocO0xDce/5LiuE=
X-Received: by 2002:a05:6871:a516:b0:29e:460d:f74a with SMTP id
 586e51a60fabf-2b32f100b04mr14479583fac.3.1738642561459; Mon, 03 Feb 2025
 20:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20250203233718.258944-1-alistair.francis@wdc.com>
In-Reply-To: <20250203233718.258944-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2025 20:15:35 -0800
X-Gm-Features: AWEUYZlofv0fg53rxOnXydDXNOk_nbUka7IfaA3iTsEPgQ8vgk0QvfakVrV7hlg
Message-ID: <CAMKF1soP9eQC2zo+fzw-yPGa265dztdVRmzaX3BCfbe20Gs62A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] spdm-utils: Initial support for spdm-utils
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 04:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115263

On Mon, Feb 3, 2025 at 3:37=E2=80=AFPM Alistair Francis via
lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../spdm-utils/spdm-utils-crates.inc          | 558 ++++++++++++++++++
>  .../spdm-utils/spdm-utils_0.7.2.bb            |  28 +
>  2 files changed, 586 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates=
.inc
>  create mode 100644 meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.=
bb
>
> diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc b/=
meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc
> new file mode 100644
> index 0000000000..7a2aae9be7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc
> @@ -0,0 +1,558 @@
> +# Autogenerated with 'bitbake -c update_crates spdm-utils'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/aho-corasick/1.1.3 \
> +    crate://crates.io/anstream/0.6.18 \
> +    crate://crates.io/anstyle/1.0.10 \
> +    crate://crates.io/anstyle-parse/0.2.6 \
> +    crate://crates.io/anstyle-query/1.1.2 \
> +    crate://crates.io/anstyle-wincon/3.0.7 \
> +    crate://crates.io/asn1-rs/0.5.2 \
> +    crate://crates.io/asn1-rs/0.6.2 \
> +    crate://crates.io/asn1-rs-derive/0.4.0 \
> +    crate://crates.io/asn1-rs-derive/0.5.1 \
> +    crate://crates.io/asn1-rs-impl/0.1.0 \
> +    crate://crates.io/asn1-rs-impl/0.2.0 \
> +    crate://crates.io/async-attributes/1.1.2 \
> +    crate://crates.io/async-channel/1.9.0 \
> +    crate://crates.io/async-channel/2.3.1 \
> +    crate://crates.io/async-executor/1.13.1 \
> +    crate://crates.io/async-global-executor/2.4.1 \
> +    crate://crates.io/async-io/2.4.0 \
> +    crate://crates.io/async-lock/3.4.0 \
> +    crate://crates.io/async-std/1.13.0 \
> +    crate://crates.io/async-task/4.7.1 \
> +    crate://crates.io/atomic-waker/1.1.2 \
> +    crate://crates.io/autocfg/1.4.0 \
> +    crate://crates.io/bindgen/0.71.1 \
> +    crate://crates.io/bitfield/0.14.0 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/bitflags/2.8.0 \
> +    crate://crates.io/block-buffer/0.10.4 \
> +    crate://crates.io/blocking/1.6.1 \
> +    crate://crates.io/bumpalo/3.16.0 \
> +    crate://crates.io/cexpr/0.6.0 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/cfg_aliases/0.2.1 \
> +    crate://crates.io/clang-sys/1.8.1 \
> +    crate://crates.io/clap/4.5.27 \
> +    crate://crates.io/clap_builder/4.5.27 \
> +    crate://crates.io/clap_derive/4.5.24 \
> +    crate://crates.io/clap_lex/0.7.4 \
> +    crate://crates.io/colorchoice/1.0.3 \
> +    crate://crates.io/colored/2.2.0 \
> +    crate://crates.io/concurrent-queue/2.5.0 \
> +    crate://crates.io/core-foundation/0.10.0 \
> +    crate://crates.io/core-foundation-sys/0.8.7 \
> +    crate://crates.io/cpufeatures/0.2.17 \
> +    crate://crates.io/crossbeam-utils/0.8.21 \
> +    crate://crates.io/crunchy/0.2.3 \
> +    crate://crates.io/crypto-common/0.1.6 \
> +    crate://crates.io/data-encoding/2.7.0 \
> +    crate://crates.io/der-parser/8.2.0 \
> +    crate://crates.io/deranged/0.3.11 \
> +    crate://crates.io/digest/0.10.7 \
> +    crate://crates.io/displaydoc/0.2.5 \
> +    crate://crates.io/either/1.13.0 \
> +    crate://crates.io/embedded-crc-macros/1.0.0 \
> +    crate://crates.io/env_logger/0.10.2 \
> +    crate://crates.io/errno/0.3.10 \
> +    crate://crates.io/event-listener/2.5.3 \
> +    crate://crates.io/event-listener/5.4.0 \
> +    crate://crates.io/event-listener-strategy/0.5.3 \
> +    crate://crates.io/fastrand/2.3.0 \
> +    crate://crates.io/futures/0.3.31 \
> +    crate://crates.io/futures-channel/0.3.31 \
> +    crate://crates.io/futures-core/0.3.31 \
> +    crate://crates.io/futures-executor/0.3.31 \
> +    crate://crates.io/futures-io/0.3.31 \
> +    crate://crates.io/futures-lite/2.6.0 \
> +    crate://crates.io/futures-macro/0.3.31 \
> +    crate://crates.io/futures-sink/0.3.31 \
> +    crate://crates.io/futures-task/0.3.31 \
> +    crate://crates.io/futures-util/0.3.31 \
> +    crate://crates.io/generic-array/0.14.7 \
> +    crate://crates.io/glob/0.3.2 \
> +    crate://crates.io/gloo-timers/0.3.0 \
> +    crate://crates.io/half/2.4.1 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/hermit-abi/0.4.0 \
> +    crate://crates.io/home/0.5.11 \
> +    crate://crates.io/humantime/2.1.0 \
> +    crate://crates.io/io-kit-sys/0.4.1 \
> +    crate://crates.io/is-terminal/0.4.15 \
> +    crate://crates.io/is_terminal_polyfill/1.70.1 \
> +    crate://crates.io/itertools/0.13.0 \
> +    crate://crates.io/itoa/1.0.14 \
> +    crate://crates.io/js-sys/0.3.77 \
> +    crate://crates.io/kv-log-macro/1.0.7 \
> +    crate://crates.io/lazy_static/1.5.0 \
> +    crate://crates.io/libc/0.2.169 \
> +    crate://crates.io/libloading/0.8.6 \
> +    crate://crates.io/libmctp/0.2.0 \
> +    crate://crates.io/libudev/0.3.0 \
> +    crate://crates.io/libudev-sys/0.1.4 \
> +    crate://crates.io/linux-raw-sys/0.4.15 \
> +    crate://crates.io/log/0.4.25 \
> +    crate://crates.io/mach2/0.4.2 \
> +    crate://crates.io/memchr/2.7.4 \
> +    crate://crates.io/memmap2/0.5.10 \
> +    crate://crates.io/minicbor/0.25.1 \
> +    crate://crates.io/minicbor-derive/0.15.3 \
> +    crate://crates.io/minimal-lexical/0.2.1 \
> +    crate://crates.io/nix/0.26.4 \
> +    crate://crates.io/nix/0.29.0 \
> +    crate://crates.io/nom/7.1.3 \
> +    crate://crates.io/num-bigint/0.4.6 \
> +    crate://crates.io/num-conv/0.1.0 \
> +    crate://crates.io/num-integer/0.1.46 \
> +    crate://crates.io/num-traits/0.2.19 \
> +    crate://crates.io/oid-registry/0.6.1 \
> +    crate://crates.io/once_cell/1.20.2 \
> +    crate://crates.io/parking/2.2.1 \
> +    crate://crates.io/pin-project-lite/0.2.16 \
> +    crate://crates.io/pin-utils/0.1.0 \
> +    crate://crates.io/piper/0.2.4 \
> +    crate://crates.io/pkg-config/0.3.31 \
> +    crate://crates.io/polling/3.7.4 \
> +    crate://crates.io/powerfmt/0.2.0 \
> +    crate://crates.io/prettyplease/0.2.29 \
> +    crate://crates.io/proc-macro2/1.0.93 \
> +    crate://crates.io/quote/1.0.38 \
> +    crate://crates.io/regex/1.11.1 \
> +    crate://crates.io/regex-automata/0.4.9 \
> +    crate://crates.io/regex-syntax/0.8.5 \
> +    crate://crates.io/rustc-hash/2.1.0 \
> +    crate://crates.io/rusticata-macros/4.1.0 \
> +    crate://crates.io/rustix/0.38.44 \
> +    crate://crates.io/rustversion/1.0.19 \
> +    crate://crates.io/scopeguard/1.2.0 \
> +    crate://crates.io/serde/1.0.217 \
> +    crate://crates.io/serde_derive/1.0.217 \
> +    crate://crates.io/serialport/4.7.0 \
> +    crate://crates.io/sha2/0.10.8 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/slab/0.4.9 \
> +    crate://crates.io/smbus-pec/1.0.1 \
> +    crate://crates.io/strsim/0.11.1 \
> +    crate://crates.io/syn/1.0.109 \
> +    crate://crates.io/syn/2.0.96 \
> +    crate://crates.io/synstructure/0.12.6 \
> +    crate://crates.io/synstructure/0.13.1 \
> +    crate://crates.io/termcolor/1.4.1 \
> +    crate://crates.io/thiserror/1.0.69 \
> +    crate://crates.io/thiserror-impl/1.0.69 \
> +    crate://crates.io/time/0.3.37 \
> +    crate://crates.io/time-core/0.1.2 \
> +    crate://crates.io/time-macros/0.2.19 \
> +    crate://crates.io/tracing/0.1.41 \
> +    crate://crates.io/tracing-core/0.1.33 \
> +    crate://crates.io/typenum/1.17.0 \
> +    crate://crates.io/unescaper/0.1.5 \
> +    crate://crates.io/unicode-ident/1.0.15 \
> +    crate://crates.io/unicode-xid/0.2.6 \
> +    crate://crates.io/utf8parse/0.2.2 \
> +    crate://crates.io/value-bag/1.10.0 \
> +    crate://crates.io/version_check/0.9.5 \
> +    crate://crates.io/wasm-bindgen/0.2.100 \
> +    crate://crates.io/wasm-bindgen-backend/0.2.100 \
> +    crate://crates.io/wasm-bindgen-futures/0.4.50 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.100 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.100 \
> +    crate://crates.io/web-sys/0.3.77 \
> +    crate://crates.io/which/6.0.3 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.9 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows-sys/0.59.0 \
> +    crate://crates.io/windows-targets/0.52.6 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_aarch64_msvc/0.52.6 \
> +    crate://crates.io/windows_i686_gnu/0.52.6 \
> +    crate://crates.io/windows_i686_gnullvm/0.52.6 \
> +    crate://crates.io/windows_i686_msvc/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnu/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_x86_64_msvc/0.52.6 \
> +    crate://crates.io/winsafe/0.0.19 \
> +    crate://crates.io/x509-parser/0.15.1 \
> +"
> +
> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
> +SRC_URI[anstream-0.6.18.sha256sum] =3D "8acc5369981196006228e28809f76187=
5c0327210a891e941f4c683b3a99529b"
> +SRC_URI[anstyle-1.0.10.sha256sum] =3D "55cc3b69f167a1ef2e161439aa98aed94=
e6028e5f9a59be9a6ffb47aef1651f9"
> +SRC_URI[anstyle-parse-0.2.6.sha256sum] =3D "3b2d16507662817a6a20a9ea92df=
6652ee4f94f914589377d69f3b21bc5798a9"
> +SRC_URI[anstyle-query-1.1.2.sha256sum] =3D "79947af37f4177cfead1110013d6=
78905c37501914fba0efea834c3fe9a8d60c"
> +SRC_URI[anstyle-wincon-3.0.7.sha256sum] =3D "ca3534e77181a9cc07539ad51f2=
141fe32f6c3ffd4df76db8ad92346b003ae4e"
> +SRC_URI[asn1-rs-0.5.2.sha256sum] =3D "7f6fd5ddaf0351dff5b8da21b2fb4ff8e0=
8ddd02857f0bf69c47639106c0fff0"
> +SRC_URI[asn1-rs-0.6.2.sha256sum] =3D "5493c3bedbacf7fd7382c6346bbd66687d=
12bbaad3a89a2d2c303ee6cf20b048"
> +SRC_URI[asn1-rs-derive-0.4.0.sha256sum] =3D "726535892e8eae7e70657b4c8ea=
93d26b8553afb1ce617caee529ef96d7dee6c"
> +SRC_URI[asn1-rs-derive-0.5.1.sha256sum] =3D "965c2d33e53cb6b267e148a4cb0=
760bc01f4904c1cd4bb4002a085bb016d1490"
> +SRC_URI[asn1-rs-impl-0.1.0.sha256sum] =3D "2777730b2039ac0f95f093556e61b=
6d26cebed5393ca6f152717777cec3a42ed"
> +SRC_URI[asn1-rs-impl-0.2.0.sha256sum] =3D "7b18050c2cd6fe86c3a76584ef5e0=
baf286d038cda203eb6223df2cc413565f7"
> +SRC_URI[async-attributes-1.1.2.sha256sum] =3D "a3203e79f4dd9bdda415ed03c=
f14dae5a2bf775c683a00f94e9cd1faf0f596e5"
> +SRC_URI[async-channel-1.9.0.sha256sum] =3D "81953c529336010edd6d8e358f88=
6d9581267795c61b19475b71314bffa46d35"
> +SRC_URI[async-channel-2.3.1.sha256sum] =3D "89b47800b0be77592da0afd425cc=
03468052844aff33b84e33cc696f64e77b6a"
> +SRC_URI[async-executor-1.13.1.sha256sum] =3D "30ca9a001c1e8ba5149f91a743=
62376cc6bc5b919d92d988668657bd570bdcec"
> +SRC_URI[async-global-executor-2.4.1.sha256sum] =3D "05b1b633a2115cd122d7=
3b955eadd9916c18c8f510ec9cd1686404c60ad1c29c"
> +SRC_URI[async-io-2.4.0.sha256sum] =3D "43a2b323ccce0a1d90b449fd71f2a06ca=
7faa7c54c2751f06c9bd851fc061059"
> +SRC_URI[async-lock-3.4.0.sha256sum] =3D "ff6e472cdea888a4bd64f342f09b3f5=
0e1886d32afe8df3d663c01140b811b18"
> +SRC_URI[async-std-1.13.0.sha256sum] =3D "c634475f29802fde2b8f0b505b1bd00=
dfe4df7d4a000f0b36f7671197d5c3615"
> +SRC_URI[async-task-4.7.1.sha256sum] =3D "8b75356056920673b02621b35afd0f7=
dda9306d03c79a30f5c56c44cf256e3de"
> +SRC_URI[atomic-waker-1.1.2.sha256sum] =3D "1505bd5d3d116872e7271a6d4e16d=
81d0c8570876c8de68093a09ac269d8aac0"
> +SRC_URI[autocfg-1.4.0.sha256sum] =3D "ace50bade8e6234aa140d9a2f552bbee1d=
b4d353f69b8217bc503490fc1a9f26"
> +SRC_URI[bindgen-0.71.1.sha256sum] =3D "5f58bf3d7db68cfbac37cfc485a8d711e=
87e064c3d0fe0435b92f7a407f9d6b3"
> +SRC_URI[bitfield-0.14.0.sha256sum] =3D "2d7e60934ceec538daadb9d8432424ed=
043a904d8e0243f3c6446bce549a46ac"
> +SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[bitflags-2.8.0.sha256sum] =3D "8f68f53c83ab957f72c32642f3868eec0=
3eb974d1fb82e453128456482613d36"
> +SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa3949=
96acacc5cbc91c5a20d8c658e77abd503a71"
> +SRC_URI[blocking-1.6.1.sha256sum] =3D "703f41c54fc768e63e091340b424302bb=
1c29ef4aa0c7f10fe849dfb114d29ea"
> +SRC_URI[bumpalo-3.16.0.sha256sum] =3D "79296716171880943b8470b5f8d03aa55=
eb2e645a4874bdbb28adb49162e012c"
> +SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb62=
9900026402633ae9160df93a8766"
> +SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb0=
82c5994d996f20b8b159f2ad1658eb5724"
> +SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd6=
19ad4718dcaa767947df1cadb14f39f4"
> +SRC_URI[clap-4.5.27.sha256sum] =3D "769b0145982b4b48713e01ec42d61614425f=
27b7058bda7180a3a41f30104796"
> +SRC_URI[clap_builder-4.5.27.sha256sum] =3D "1b26884eb4b57140e4d2d93652ab=
fa49498b938b3c9179f9fc487b0acc3edad7"
> +SRC_URI[clap_derive-4.5.24.sha256sum] =3D "54b755194d6389280185988721fff=
ba69495eed5ee9feeee9a599b53db80318c"
> +SRC_URI[clap_lex-0.7.4.sha256sum] =3D "f46ad14479a25103f283c0f10005961cf=
086d8dc42205bb44c46ac563475dca6"
> +SRC_URI[colorchoice-1.0.3.sha256sum] =3D "5b63caa9aa9397e2d9480a9b136738=
56c78d8ac123288526c37d7839f2a86990"
> +SRC_URI[colored-2.2.0.sha256sum] =3D "117725a109d387c937a1533ce01b450cbd=
e6b88abceea8473c4d7a85853cda3c"
> +SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D "4ca0197aee26d1ae37445ee53=
2fefce43251d24cc7c166799f4d46817f1d3973"
> +SRC_URI[core-foundation-0.10.0.sha256sum] =3D "b55271e5c8c478ad3f38ad24e=
f34923091e0548492a266d19b3c0b4d82574c63"
> +SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "773648b94d0e5d620f64f2=
80777445740e61fe701025087ec8b57f45c791888b"
> +SRC_URI[cpufeatures-0.2.17.sha256sum] =3D "59ed5838eebb26a2bb2e58f6d5b53=
16989ae9d08bab10e0e6d103e656d1b0280"
> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
> +SRC_URI[crunchy-0.2.3.sha256sum] =3D "43da5946c66ffcc7745f48db692ffbb10a=
83bfe0afd96235c5c2a4fb23994929"
> +SRC_URI[crypto-common-0.1.6.sha256sum] =3D "1bfb12502f3fc46cca1bb51ac28d=
f9d618d813cdc3d2f25b9fe775a34af26bb3"
> +SRC_URI[data-encoding-2.7.0.sha256sum] =3D "0e60eed09d8c01d3cee5b7d30acb=
059b76614c918fa0f992e0dd6eeb10daad6f"
> +SRC_URI[der-parser-8.2.0.sha256sum] =3D "dbd676fbbab537128ef0278adb5576c=
f363cff6aa22a7b24effe97347cfab61e"
> +SRC_URI[deranged-0.3.11.sha256sum] =3D "b42b6fa04a440b495c8b04d0e71b707c=
585f83cb9cb28cf8cd0d976c315e31b4"
> +SRC_URI[digest-0.10.7.sha256sum] =3D "9ed9a281f7bc9b7576e61468ba615a66a5=
c8cfdff42420a70aa82701a3b1e292"
> +SRC_URI[displaydoc-0.2.5.sha256sum] =3D "97369cbbc041bc366949bc74d34658d=
6cda5621039731c6310521892a3a20ae0"
> +SRC_URI[either-1.13.0.sha256sum] =3D "60b1af1c220855b6ceac025d3f6ecdd2b7=
c4894bfe9cd9bda4fbb4bc7c0d4cf0"
> +SRC_URI[embedded-crc-macros-1.0.0.sha256sum] =3D "4f1c75747a43b086df1a87=
fb2a889590bc0725e0abf54bba6d0c4bf7bd9e762c"
> +SRC_URI[env_logger-0.10.2.sha256sum] =3D "4cd405aab171cb85d6735e5c8d9db0=
38c17d3ca007a4d2c25f337935c3d90580"
> +SRC_URI[errno-0.3.10.sha256sum] =3D "33d852cb9b869c2a9b3df2f71a3074817f0=
1e1844f839a144f5fcef059a4eb5d"
> +SRC_URI[event-listener-2.5.3.sha256sum] =3D "0206175f82b8d6bf6652ff7d71a=
1e27fd2e4efde587fd368662814d6ec1d9ce0"
> +SRC_URI[event-listener-5.4.0.sha256sum] =3D "3492acde4c3fc54c845eaab3eed=
8bd00c7a7d881f78bfc801e43a93dec1331ae"
> +SRC_URI[event-listener-strategy-0.5.3.sha256sum] =3D "3c3e4e0dd3673c1139=
bf041f3008816d9cf2946bbfac2945c09e523b8d7b05b2"
> +SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f=
2ff062c9e95845c43a6c9c0355411be"
> +SRC_URI[futures-0.3.31.sha256sum] =3D "65bc07b1a8bc7c85c5f2e110c476c7389=
b4554ba72af57d8445ea63a576b0876"
> +SRC_URI[futures-channel-0.3.31.sha256sum] =3D "2dff15bf788c671c1934e366d=
07e30c1814a8ef514e1af724a602e8a2fbe1b10"
> +SRC_URI[futures-core-0.3.31.sha256sum] =3D "05f29059c0c2090612e8d742178b=
0580d2dc940c837851ad723096f87af6663e"
> +SRC_URI[futures-executor-0.3.31.sha256sum] =3D "1e28d1d997f585e54aebc3f9=
7d39e72338912123a67330d723fdbb564d646c9f"
> +SRC_URI[futures-io-0.3.31.sha256sum] =3D "9e5c1b78ca4aae1ac06c48a526a655=
760685149f0d465d21f37abfe57ce075c6"
> +SRC_URI[futures-lite-2.6.0.sha256sum] =3D "f5edaec856126859abb19ed65f39e=
90fea3a9574b9707f13539acf4abf7eb532"
> +SRC_URI[futures-macro-0.3.31.sha256sum] =3D "162ee34ebcb7c64a8abebc059ce=
0fee27c2262618d7b60ed8faf72fef13c3650"
> +SRC_URI[futures-sink-0.3.31.sha256sum] =3D "e575fab7d1e0dcb8d0c7bcf9a63e=
e213816ab51902e6d244a95819acacf1d4f7"
> +SRC_URI[futures-task-0.3.31.sha256sum] =3D "f90f7dce0722e95104fcb0955859=
10c0977252f286e354b5e3bd38902cd99988"
> +SRC_URI[futures-util-0.3.31.sha256sum] =3D "9fa08315bb612088cc391249efdc=
3bc77536f16c91f6cf495e6fbe85b20a4a81"
> +SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf27=
4ad91c288277713d9c18820d8499a7ff69e9a"
> +SRC_URI[glob-0.3.2.sha256sum] =3D "a8d1add55171497b4705a648c6b583acafb01=
d58050a51727785f0b2c8e0a2b2"
> +SRC_URI[gloo-timers-0.3.0.sha256sum] =3D "bbb143cf96099802033e0d4f4963b1=
9fd2e0b728bcf076cd9cf7f6634f092994"
> +SRC_URI[half-2.4.1.sha256sum] =3D "6dd08c532ae367adf81c312a4580bc67f1d0f=
e8bc9c460520283f4c0ff277888"
> +SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b=
5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[hermit-abi-0.4.0.sha256sum] =3D "fbf6a919d6cf397374f7dfeeea91d97=
4c7c0a7221d0d0f4f20d859d329e53fcc"
> +SRC_URI[home-0.5.11.sha256sum] =3D "589533453244b0995c858700322199b2becb=
13b627df2851f64a2775d024abcf"
> +SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761da=
ec841b97f947d34394601737a7bba5e4"
> +SRC_URI[io-kit-sys-0.4.1.sha256sum] =3D "617ee6cf8e3f66f3b4ea67a40585646=
28cde41901316e19f559e14c7c72c5e7b"
> +SRC_URI[is-terminal-0.4.15.sha256sum] =3D "e19b23d53f35ce9f56aebc7d1bb4e=
6ac1e9c0db7ac85c8d1760c04379edced37"
> +SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc25=
b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
> +SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33=
f2d6c088194d9f922fb8318faf1f01186"
> +SRC_URI[itoa-1.0.14.sha256sum] =3D "d75a2a4b1b190afb6f5425f10f6a8f959d2e=
a0b9c2b1d79553551850539e4674"
> +SRC_URI[js-sys-0.3.77.sha256sum] =3D "1cfaf33c695fc6e08064efbc1f72ec9374=
29614f25eef83af942d0e227c3a28f"
> +SRC_URI[kv-log-macro-1.0.7.sha256sum] =3D "0de8b303297635ad57c9f5059fd9c=
ee7a47f8e8daa09df0fcd07dd39fb22977f"
> +SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f3=
591312473c50c6685e1f298068316e66fe"
> +SRC_URI[libc-0.2.169.sha256sum] =3D "b5aba8db14291edd000dfcc4d620c7ebfb1=
22c613afb886ca8803fa4e128a20a"
> +SRC_URI[libloading-0.8.6.sha256sum] =3D "fc2f4eb4bc735547cfed7c0a4922cbd=
04a4655978c09b54f1f7b228750664c34"
> +SRC_URI[libmctp-0.2.0.sha256sum] =3D "0d077261b65cfe16a3d490243354fbaec3=
f22e5bcad546d21394105ab836d1d0"
> +SRC_URI[libudev-0.3.0.sha256sum] =3D "78b324152da65df7bb95acfcaab55e3097=
ceaab02fb19b228a9eb74d55f135e0"
> +SRC_URI[libudev-sys-0.1.4.sha256sum] =3D "3c8469b4a23b962c1396b9b451dda5=
0ef5b283e8dd309d69033475fa9b334324"
> +SRC_URI[linux-raw-sys-0.4.15.sha256sum] =3D "d26c52dbd32dccf2d10cac7725f=
8eae5296885fb5703b261f7d0a0739ec807ab"
> +SRC_URI[log-0.4.25.sha256sum] =3D "04cbf5b083de1c7e0222a7a51dbfdba1cbe1c=
6ab0b15e29fff3f6c077fd9cd9f"
> +SRC_URI[mach2-0.4.2.sha256sum] =3D "19b955cdeb2a02b9117f121ce63aa52d08ad=
e45de53e48fe6a38b39c10f6f709"
> +SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289c1=
8cf2f87ec19a575a0abdce112e3a3"
> +SRC_URI[memmap2-0.5.10.sha256sum] =3D "83faa42c0a078c393f6b29d5db232d8be=
22776a891f8f56e5284faee4a20b327"
> +SRC_URI[minicbor-0.25.1.sha256sum] =3D "c0452a60c1863c1f50b5f77cd295e8d2=
786849f35883f0b9e18e7e6e1b5691b0"
> +SRC_URI[minicbor-derive-0.15.3.sha256sum] =3D "bd2209fff77f705b00c737016=
a48e73733d7fbccb8b007194db148f03561fb70"
> +SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
> +SRC_URI[nix-0.26.4.sha256sum] =3D "598beaf3cc6fdd9a5dfb1630c2800c7acd31d=
f7aaf0f565796fba2b53ca1af1b"
> +SRC_URI[nix-0.29.0.sha256sum] =3D "71e2746dc3a24dd78b3cfcb7be93368c6de99=
63d30f43a6a73998a9cf4b17b46"
> +SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c81=
72b73826411a55751e404a0a4a"
> +SRC_URI[num-bigint-0.4.6.sha256sum] =3D "a5e44f723f1133c9deac646763579fd=
b3ac745e418f2a7af9cd0c431da1f20b9"
> +SRC_URI[num-conv-0.1.0.sha256sum] =3D "51d515d32fb182ee37cda2ccdcb92950d=
6a3c2893aa280e540671c2cd0f3b1d9"
> +SRC_URI[num-integer-0.1.46.sha256sum] =3D "7969661fd2958a5cb096e56c8e1ad=
0444ac2bbcd0061bd28660485a44879858f"
> +SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72=
ad0ffa95f0c74596bc250dcfd960262841"
> +SRC_URI[oid-registry-0.6.1.sha256sum] =3D "9bedf36ffb6ba96c2eb7144ef6270=
557b52e54b20c0a8e1eb2ff99a6c6959bff"
> +SRC_URI[once_cell-1.20.2.sha256sum] =3D "1261fe7e33c73b354eab43b1273a57c=
8f967d0391e80353e51f764ac02cf6775"
> +SRC_URI[parking-2.2.1.sha256sum] =3D "f38d5652c16fde515bb1ecef450ab0f6a2=
19d619a7274976324d5e377f7dceba"
> +SRC_URI[pin-project-lite-0.2.16.sha256sum] =3D "3b3cff922bd51709b605d9ea=
d9aa71031d81447142d828eb4a6eba76fe619f9b"
> +SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
> +SRC_URI[piper-0.2.4.sha256sum] =3D "96c8c490f422ef9a4efd2cb5b42b76c8613d=
7e7dfc1caf667b8a3350a5acc066"
> +SRC_URI[pkg-config-0.3.31.sha256sum] =3D "953ec861398dccce10c670dfeaf3ec=
4911ca479e9c02154b3a215178c5f566f2"
> +SRC_URI[polling-3.7.4.sha256sum] =3D "a604568c3202727d1507653cb121dbd627=
a58684eb09a820fd746bee38b4442f"
> +SRC_URI[powerfmt-0.2.0.sha256sum] =3D "439ee305def115ba05938db6eb1644ff9=
4165c5ab5e9420d1c1bcedbba909391"
> +SRC_URI[prettyplease-0.2.29.sha256sum] =3D "6924ced06e1f7dfe3fa48d57b9f7=
4f55d8915f5036121bef647ef4b204895fac"
> +SRC_URI[proc-macro2-1.0.93.sha256sum] =3D "60946a68e5f9d28b0dc1c21bb8a97=
ee7d018a8b322fa57838ba31cc878e22d99"
> +SRC_URI[quote-1.0.38.sha256sum] =3D "0e4dccaaaf89514f546c693ddc140f729f9=
58c247918a13380cccc6078391acc"
> +SRC_URI[regex-1.11.1.sha256sum] =3D "b544ef1b4eac5dc2db33ea63606ae9ffcfa=
c26c1416a2806ae0bf5f56b201191"
> +SRC_URI[regex-automata-0.4.9.sha256sum] =3D "809e8dc61f6de73b46c85f4c964=
86310fe304c434cfa43669d7b40f711150908"
> +SRC_URI[regex-syntax-0.8.5.sha256sum] =3D "2b15c43186be67a4fd63bee50d030=
3afffcef381492ebe2c5d87f324e1b8815c"
> +SRC_URI[rustc-hash-2.1.0.sha256sum] =3D "c7fb8039b3032c191086b10f11f319a=
6e99e1e82889c5cc6046f515c9db1d497"
> +SRC_URI[rusticata-macros-4.1.0.sha256sum] =3D "faf0c4a6ece9950b9abdb62b1=
cfcf2a68b3b67a10ba445b3bb85be2a293d0632"
> +SRC_URI[rustix-0.38.44.sha256sum] =3D "fdb5bc1ae2baa591800df16c9ca78619b=
f65c0488b41b96ccec5d11220d8c154"
> +SRC_URI[rustversion-1.0.19.sha256sum] =3D "f7c45b9784283f1b2e7fb61b42047=
c2fd678ef0960d4f6f1eba131594cc369d4"
> +SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59b=
ce7498c01bcc1502d7b9afe439a4e9f49"
> +SRC_URI[serde-1.0.217.sha256sum] =3D "02fc4265df13d6fa1d00ecff087228cc0a=
2b5f3c0e87e258d8b94a156e984c70"
> +SRC_URI[serde_derive-1.0.217.sha256sum] =3D "5a9bf7cf98d04a2b28aead066b7=
496853d4779c9cc183c440dbac457641e19a0"
> +SRC_URI[serialport-4.7.0.sha256sum] =3D "5ecfc4858c2266c7695d8b8460bbd61=
2fa81bd2e250f5f0dd16195e4b4f8b3d8"
> +SRC_URI[sha2-0.10.8.sha256sum] =3D "793db75ad2bcafc3ffa7c68b215fee268f53=
7982cd901d132f89c6343f3a3dc8"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
> +SRC_URI[slab-0.4.9.sha256sum] =3D "8f92a496fb766b417c996b9c5e57daf2f7ad3=
b0bebe1ccfca4856390e3d3bb67"
> +SRC_URI[smbus-pec-1.0.1.sha256sum] =3D "ca0763a680cd5d72b28f7bfc8a054c11=
7d8841380a6ad4f72f05bd2a34217d3e"
> +SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e262856=
4b3b043a70948a3f0b778838c5fb4f"
> +SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
> +SRC_URI[syn-2.0.96.sha256sum] =3D "d5d0adab1ae378d7f53bdebc67a39f1f15140=
7ef230f0ce2883572f5d8985c80"
> +SRC_URI[synstructure-0.12.6.sha256sum] =3D "f36bdaa60a83aca3921b5259d540=
0cbf5e90fc51931376a9bd4a0eb79aa7210f"
> +SRC_URI[synstructure-0.13.1.sha256sum] =3D "c8af7666ab7b6390ab78131fb5b0=
fce11d6b7a6951602017c35fa82800708971"
> +SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1c=
b24cd2c6c79397ab15774837a0bc5755"
> +SRC_URI[thiserror-1.0.69.sha256sum] =3D "b6aaf5339b578ea85b50e080feb250a=
3e8ae8cfcdff9a461c9ec2904bc923f52"
> +SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D "4fee6c4efc90059e10f81e6d42=
c60a18f76588c3d74cb83a0b242a2b6c7504c1"
> +SRC_URI[time-0.3.37.sha256sum] =3D "35e7868883861bd0e56d9ac6efcaaca0d6d5=
d82a2a7ec8209ff492c07cf37b21"
> +SRC_URI[time-core-0.1.2.sha256sum] =3D "ef927ca75afb808a4d64dd374f00a2ad=
f8d0fcff8e7b184af886c3c87ec4a3f3"
> +SRC_URI[time-macros-0.2.19.sha256sum] =3D "2834e6017e3e5e4b9834939793b28=
2bc03b37a3336245fa820e35e233e2a85de"
> +SRC_URI[tracing-0.1.41.sha256sum] =3D "784e0ac535deb450455cbfa28a6f0df14=
5ea1bb7ae51b821cf5e7927fdcfbdd0"
> +SRC_URI[tracing-core-0.1.33.sha256sum] =3D "e672c95779cf947c5311f83787af=
4fa8fffd12fb27e4993211a84bdfd9610f9c"
> +SRC_URI[typenum-1.17.0.sha256sum] =3D "42ff0bf0c66b8238c6f3b578df37d0b78=
48e55df8577b3f74f92a69acceeb825"
> +SRC_URI[unescaper-0.1.5.sha256sum] =3D "c878a167baa8afd137494101a688ef8c=
67125089ff2249284bd2b5f9bfedb815"
> +SRC_URI[unicode-ident-1.0.15.sha256sum] =3D "11cd88e12b17c6494200a9c1b68=
3a04fcac9573ed74cd1b62aeb2727c5592243"
> +SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c35073=
4c9ff1295c464a03335b00bb84fc54f853"
> +SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7f=
aecc7fa57071cce2578660c9f1010821"
> +SRC_URI[value-bag-1.10.0.sha256sum] =3D "3ef4c4aa54d5d05a279399bfa921ec3=
87b7aba77caf7a682ae8d86785b8fdad2"
> +SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f2838=
53ad26bdd5b10b7f1542aa2fa15e2289105a"
> +SRC_URI[wasm-bindgen-0.2.100.sha256sum] =3D "1edc8929d7499fc4e8f0be2262a=
241556cfc54a0bea223790e71446f2aab1ef5"
> +SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] =3D "2f0a0651a5c2bc21487=
bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
> +SRC_URI[wasm-bindgen-futures-0.4.50.sha256sum] =3D "555d470ec0bc3bb57890=
405e5d4322cc9ea83cebb085523ced7be4144dac1e61"
> +SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] =3D "7fe63fc6d09ed3792bd08=
97b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
> +SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] =3D "8ae87ea40c9f6=
89fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
> +SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] =3D "1a05d73b933a847d6ccc=
dda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
> +SRC_URI[web-sys-0.3.77.sha256sum] =3D "33b6dd2ef9186f1f2072e409e99cd22a9=
75331a6b3591b12c764e0e55c60d5d2"
> +SRC_URI[which-6.0.3.sha256sum] =3D "b4ee928febd44d98f2f459a4a79bd4d92859=
1333a494a10a868418ac1b39cf1f"
> +SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.9.sha256sum] =3D "cf221c93e13a30d793f7645a0e7762=
c55d169dbb0a49671918a2319d289b10bb"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c3=
9b32a1776bbe92e5bef1f0bf1f8c531853b"
> +SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d=
4780d4d3d648aca59e491e6b98e725b84e99973"
> +SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec0=
44bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> +SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53=
fa7803150007879548bc709c039df7627cabbd05d469"
> +SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295a=
c6720e509ee4c243f69d781394014ebfe8bbfa0b"
> +SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76=
c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> +SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28=
bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> +SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901c=
b5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> +SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc417412679=
681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> +SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +SRC_URI[winsafe-0.0.19.sha256sum] =3D "d135d17ab770252ad95e9a872d365cf30=
90e3be864a34ab46f48555993efc904"
> +SRC_URI[x509-parser-0.15.1.sha256sum] =3D "7069fba5b66b9193bd2c5d3d4ff12=
b839118f6bcbef5328efafafb5395cf63da"
> +# from tock-responder/Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/aho-corasick/1.1.3 \
> +    crate://crates.io/atty/0.2.14 \
> +    crate://crates.io/autocfg/1.4.0 \
> +    crate://crates.io/bindgen/0.71.1 \
> +    crate://crates.io/bitfield/0.14.0 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/bitflags/2.8.0 \
> +    crate://crates.io/byteorder/0.5.3 \
> +    crate://crates.io/cexpr/0.6.0 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/clang-sys/1.8.1 \
> +    crate://crates.io/clap/3.2.25 \
> +    crate://crates.io/clap_derive/3.2.25 \
> +    crate://crates.io/clap_lex/0.2.4 \
> +    crate://crates.io/critical-section/1.2.0 \
> +    crate://crates.io/either/1.13.0 \
> +    crate://crates.io/elf/0.0.10 \
> +    crate://crates.io/embedded-alloc/0.5.1 \
> +    crate://crates.io/embedded-crc-macros/1.0.0 \
> +    crate://crates.io/errno/0.3.10 \
> +    crate://crates.io/glob/0.3.2 \
> +    crate://crates.io/hashbrown/0.12.3 \
> +    crate://crates.io/heck/0.4.1 \
> +    crate://crates.io/hermit-abi/0.1.19 \
> +    crate://crates.io/home/0.5.11 \
> +    crate://crates.io/indexmap/1.9.3 \
> +    crate://crates.io/itertools/0.13.0 \
> +    crate://crates.io/libc/0.2.169 \
> +    crate://crates.io/libloading/0.8.6 \
> +    crate://crates.io/libm/0.2.11 \
> +    crate://crates.io/libmctp/0.2.0 \
> +    crate://crates.io/linked_list_allocator/0.10.5 \
> +    crate://crates.io/linux-raw-sys/0.4.15 \
> +    crate://crates.io/log/0.4.25 \
> +    crate://crates.io/memchr/2.7.4 \
> +    crate://crates.io/minimal-lexical/0.2.1 \
> +    crate://crates.io/nom/7.1.3 \
> +    crate://crates.io/numtoa/0.1.0 \
> +    crate://crates.io/once_cell/1.20.2 \
> +    crate://crates.io/os_str_bytes/6.6.1 \
> +    crate://crates.io/portable-atomic/1.10.0 \
> +    crate://crates.io/prettyplease/0.2.29 \
> +    crate://crates.io/proc-macro-error/1.0.4 \
> +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> +    crate://crates.io/proc-macro2/1.0.93 \
> +    crate://crates.io/quote/1.0.38 \
> +    crate://crates.io/redox_syscall/0.2.16 \
> +    crate://crates.io/redox_termios/0.1.3 \
> +    crate://crates.io/regex/1.11.1 \
> +    crate://crates.io/regex-automata/0.4.9 \
> +    crate://crates.io/regex-syntax/0.8.5 \
> +    crate://crates.io/rustc-hash/2.1.0 \
> +    crate://crates.io/rustix/0.38.44 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/smbus-pec/1.0.1 \
> +    crate://crates.io/strsim/0.10.0 \
> +    crate://crates.io/syn/1.0.109 \
> +    crate://crates.io/syn/2.0.96 \
> +    crate://crates.io/termcolor/1.4.1 \
> +    crate://crates.io/termion/1.5.6 \
> +    crate://crates.io/textwrap/0.16.1 \
> +    crate://crates.io/unicode-ident/1.0.15 \
> +    crate://crates.io/version_check/0.9.5 \
> +    crate://crates.io/which/6.0.3 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.9 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows-sys/0.59.0 \
> +    crate://crates.io/windows-targets/0.52.6 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_aarch64_msvc/0.52.6 \
> +    crate://crates.io/windows_i686_gnu/0.52.6 \
> +    crate://crates.io/windows_i686_gnullvm/0.52.6 \
> +    crate://crates.io/windows_i686_msvc/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnu/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_x86_64_msvc/0.52.6 \
> +    crate://crates.io/winsafe/0.0.19 \
> +"
> +
> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
> +SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f37=
e93092cbf377614828a319d5fee8"
> +SRC_URI[autocfg-1.4.0.sha256sum] =3D "ace50bade8e6234aa140d9a2f552bbee1d=
b4d353f69b8217bc503490fc1a9f26"
> +SRC_URI[bindgen-0.71.1.sha256sum] =3D "5f58bf3d7db68cfbac37cfc485a8d711e=
87e064c3d0fe0435b92f7a407f9d6b3"
> +SRC_URI[bitfield-0.14.0.sha256sum] =3D "2d7e60934ceec538daadb9d8432424ed=
043a904d8e0243f3c6446bce549a46ac"
> +SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[bitflags-2.8.0.sha256sum] =3D "8f68f53c83ab957f72c32642f3868eec0=
3eb974d1fb82e453128456482613d36"
> +SRC_URI[byteorder-0.5.3.sha256sum] =3D "0fc10e8cc6b2580fda3f36eb6dc53166=
57f812a3df879a44a66fc9f0fdbc4855"
> +SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb62=
9900026402633ae9160df93a8766"
> +SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd6=
19ad4718dcaa767947df1cadb14f39f4"
> +SRC_URI[clap-3.2.25.sha256sum] =3D "4ea181bf566f71cb9a5d17a59e1871af6381=
80a18fb0035c92ae62b705207123"
> +SRC_URI[clap_derive-3.2.25.sha256sum] =3D "ae6371b8bdc8b7d3959e9cf7b22d4=
435ef3e79e138688421ec654acf8c81b008"
> +SRC_URI[clap_lex-0.2.4.sha256sum] =3D "2850f2f5a82cbf437dd5af4d49848fbdf=
c27c157c3d010345776f952765261c5"
> +SRC_URI[critical-section-1.2.0.sha256sum] =3D "790eea4361631c5e7d22598ec=
d5723ff611904e3344ce8720784c93e3d83d40b"
> +SRC_URI[either-1.13.0.sha256sum] =3D "60b1af1c220855b6ceac025d3f6ecdd2b7=
c4894bfe9cd9bda4fbb4bc7c0d4cf0"
> +SRC_URI[elf-0.0.10.sha256sum] =3D "4841de15dbe0e49b9b62a417589299e3be0d5=
57e0900d36acb87e6dae47197f5"
> +SRC_URI[embedded-alloc-0.5.1.sha256sum] =3D "ddae17915accbac2cfbc64ea0ae=
6e3b330e6ea124ba108dada63646fd3c6f815"
> +SRC_URI[embedded-crc-macros-1.0.0.sha256sum] =3D "4f1c75747a43b086df1a87=
fb2a889590bc0725e0abf54bba6d0c4bf7bd9e762c"
> +SRC_URI[errno-0.3.10.sha256sum] =3D "33d852cb9b869c2a9b3df2f71a3074817f0=
1e1844f839a144f5fcef059a4eb5d"
> +SRC_URI[glob-0.3.2.sha256sum] =3D "a8d1add55171497b4705a648c6b583acafb01=
d58050a51727785f0b2c8e0a2b2"
> +SRC_URI[hashbrown-0.12.3.sha256sum] =3D "8a9ee70c43aaf417c914396645a0fa8=
52624801b24ebb7ae78fe8272889ac888"
> +SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
> +SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242da=
dbb39557df889310ac77c5d99100aaac33"
> +SRC_URI[home-0.5.11.sha256sum] =3D "589533453244b0995c858700322199b2becb=
13b627df2851f64a2775d024abcf"
> +SRC_URI[indexmap-1.9.3.sha256sum] =3D "bd070e393353796e801d209ad339e8959=
6eb4c8d430d18ede6a1cced8fafbd99"
> +SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33=
f2d6c088194d9f922fb8318faf1f01186"
> +SRC_URI[libc-0.2.169.sha256sum] =3D "b5aba8db14291edd000dfcc4d620c7ebfb1=
22c613afb886ca8803fa4e128a20a"
> +SRC_URI[libloading-0.8.6.sha256sum] =3D "fc2f4eb4bc735547cfed7c0a4922cbd=
04a4655978c09b54f1f7b228750664c34"
> +SRC_URI[libm-0.2.11.sha256sum] =3D "8355be11b20d696c8f18f6cc018c4e372165=
b1fa8126cef092399c9951984ffa"
> +SRC_URI[libmctp-0.2.0.sha256sum] =3D "0d077261b65cfe16a3d490243354fbaec3=
f22e5bcad546d21394105ab836d1d0"
> +SRC_URI[linked_list_allocator-0.10.5.sha256sum] =3D "9afa463f5405ee81cdb=
9cc2baf37e08ec7e4c8209442b5d72c04cfb2cd6e6286"
> +SRC_URI[linux-raw-sys-0.4.15.sha256sum] =3D "d26c52dbd32dccf2d10cac7725f=
8eae5296885fb5703b261f7d0a0739ec807ab"
> +SRC_URI[log-0.4.25.sha256sum] =3D "04cbf5b083de1c7e0222a7a51dbfdba1cbe1c=
6ab0b15e29fff3f6c077fd9cd9f"
> +SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289c1=
8cf2f87ec19a575a0abdce112e3a3"
> +SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
> +SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c81=
72b73826411a55751e404a0a4a"
> +SRC_URI[numtoa-0.1.0.sha256sum] =3D "b8f8bdf33df195859076e54ab11ee78a1b2=
08382d3a26ec40d142ffc1ecc49ef"
> +SRC_URI[once_cell-1.20.2.sha256sum] =3D "1261fe7e33c73b354eab43b1273a57c=
8f967d0391e80353e51f764ac02cf6775"
> +SRC_URI[os_str_bytes-6.6.1.sha256sum] =3D "e2355d85b9a3786f481747ced0e0f=
f2ba35213a1f9bd406ed906554d7af805a1"
> +SRC_URI[portable-atomic-1.10.0.sha256sum] =3D "280dc24453071f1b639541719=
85a0b0d30058d287960968b9b2aca264c8d4ee6"
> +SRC_URI[prettyplease-0.2.29.sha256sum] =3D "6924ced06e1f7dfe3fa48d57b9f7=
4f55d8915f5036121bef647ef4b204895fac"
> +SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f=
08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> +SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D "a1be40180e52ecc98ad8=
0b184934baf3d0d29f979574e439af5a55274b35f869"
> +SRC_URI[proc-macro2-1.0.93.sha256sum] =3D "60946a68e5f9d28b0dc1c21bb8a97=
ee7d018a8b322fa57838ba31cc878e22d99"
> +SRC_URI[quote-1.0.38.sha256sum] =3D "0e4dccaaaf89514f546c693ddc140f729f9=
58c247918a13380cccc6078391acc"
> +SRC_URI[redox_syscall-0.2.16.sha256sum] =3D "fb5a58c1855b4b6819d59012155=
603f0b22ad30cad752600aadfcb695265519a"
> +SRC_URI[redox_termios-0.1.3.sha256sum] =3D "20145670ba436b55d91fc92d25e7=
1160fbfbdd57831631c8d7d36377a476f1cb"
> +SRC_URI[regex-1.11.1.sha256sum] =3D "b544ef1b4eac5dc2db33ea63606ae9ffcfa=
c26c1416a2806ae0bf5f56b201191"
> +SRC_URI[regex-automata-0.4.9.sha256sum] =3D "809e8dc61f6de73b46c85f4c964=
86310fe304c434cfa43669d7b40f711150908"
> +SRC_URI[regex-syntax-0.8.5.sha256sum] =3D "2b15c43186be67a4fd63bee50d030=
3afffcef381492ebe2c5d87f324e1b8815c"
> +SRC_URI[rustc-hash-2.1.0.sha256sum] =3D "c7fb8039b3032c191086b10f11f319a=
6e99e1e82889c5cc6046f515c9db1d497"
> +SRC_URI[rustix-0.38.44.sha256sum] =3D "fdb5bc1ae2baa591800df16c9ca78619b=
f65c0488b41b96ccec5d11220d8c154"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
> +SRC_URI[smbus-pec-1.0.1.sha256sum] =3D "ca0763a680cd5d72b28f7bfc8a054c11=
7d8841380a6ad4f72f05bd2a34217d3e"
> +SRC_URI[strsim-0.10.0.sha256sum] =3D "73473c0e59e6d5812c5dfe2a064a644494=
9f089e20eec9a2e5506596494e4623"
> +SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
> +SRC_URI[syn-2.0.96.sha256sum] =3D "d5d0adab1ae378d7f53bdebc67a39f1f15140=
7ef230f0ce2883572f5d8985c80"
> +SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1c=
b24cd2c6c79397ab15774837a0bc5755"
> +SRC_URI[termion-1.5.6.sha256sum] =3D "077185e2eac69c3f8379a4298e1e07cd36=
beb962290d4a51199acf0fdc10607e"
> +SRC_URI[textwrap-0.16.1.sha256sum] =3D "23d434d3f8967a09480fb04132ebe0a3=
e088c173e6d0ee7897abbdf4eab0f8b9"
> +SRC_URI[unicode-ident-1.0.15.sha256sum] =3D "11cd88e12b17c6494200a9c1b68=
3a04fcac9573ed74cd1b62aeb2727c5592243"
> +SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f2838=
53ad26bdd5b10b7f1542aa2fa15e2289105a"
> +SRC_URI[which-6.0.3.sha256sum] =3D "b4ee928febd44d98f2f459a4a79bd4d92859=
1333a494a10a868418ac1b39cf1f"
> +SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.9.sha256sum] =3D "cf221c93e13a30d793f7645a0e7762=
c55d169dbb0a49671918a2319d289b10bb"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c3=
9b32a1776bbe92e5bef1f0bf1f8c531853b"
> +SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d=
4780d4d3d648aca59e491e6b98e725b84e99973"
> +SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec0=
44bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> +SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53=
fa7803150007879548bc709c039df7627cabbd05d469"
> +SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295a=
c6720e509ee4c243f69d781394014ebfe8bbfa0b"
> +SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76=
c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> +SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28=
bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> +SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901c=
b5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> +SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc417412679=
681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> +SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +SRC_URI[winsafe-0.0.19.sha256sum] =3D "d135d17ab770252ad95e9a872d365cf30=
90e3be864a34ab46f48555993efc904"
> +SRC_URI[clap-4.5.26.sha256sum] =3D "a8eb5e908ef3a6efbe1ed62520fb72879598=
88c88485abe072543190ecc66783"
> +SRC_URI[clap_builder-4.5.26.sha256sum] =3D "96b01801b5fc6a0a232407abc821=
660c9c6d25a1cafc0d4f85f29fb8d9afc121"
> +SRC_URI[cpufeatures-0.2.16.sha256sum] =3D "16b80225097f2e5ae4e7179dd2266=
824648f3e2f49d9134d584b76389d31c4c3"
> +SRC_URI[crunchy-0.2.2.sha256sum] =3D "7a81dae078cea95a014a339291cec439d2=
f232ebe854a9d672b796c6afafa9b7"
> +SRC_URI[is-terminal-0.4.13.sha256sum] =3D "261f68e344040fbd0edea105bef17=
c66edf46f984ddb1115b775ce31be948f4b"
> +SRC_URI[rustix-0.38.43.sha256sum] =3D "a78891ee6bf2340288408954ac787aa06=
3d8e8817e9f53abb37c695c6d834ef6"
> +SRC_URI[unicode-ident-1.0.14.sha256sum] =3D "adb9e6ca4f869e1180728b7950e=
35922a7fc6397f7b641499e8f3ef06e50dc83"
> +SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3=
f9beff57ec1b52cb3de0789201425d9a33d"
> +SRC_URI[autocfg-1.3.0.sha256sum] =3D "0c4b4d0bd25bd0b74681c0ad21497610ce=
1b7c91b1022cd21c80c6fbdd9476b0"
> +SRC_URI[bindgen-0.63.0.sha256sum] =3D "36d860121800b2a9a94f9b5604b332d5c=
ffb234ce17609ea479d723dbc9d3885"
> +SRC_URI[bitflags-2.6.0.sha256sum] =3D "b048fb63fd8b5923fc5aa7b340d8e156a=
ec7ec02f0c78fa8a6ddc2613f6f71de"
> +SRC_URI[critical-section-1.1.2.sha256sum] =3D "7059fff8937831a9ae6f0fe4d=
658ffabf58f2ca96aa9dec1c889f936f705f216"
> +SRC_URI[errno-0.3.9.sha256sum] =3D "534c5cf6194dfab3db3242765c03bbe257cf=
92f22b38f6bc0c58d59108a820ba"
> +SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b6=
5693ce38287d856d1674551ec9b"
> +SRC_URI[home-0.5.9.sha256sum] =3D "e3d1354bf6b7235cb4a0576c2619fd4ed1818=
3f689b12b006a0ee7329eeff9a5"
> +SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb5643=
013d835ce3779a5fc208261dbe10f55"
> +SRC_URI[libc-0.2.155.sha256sum] =3D "97b3888a4aecf77e811145cadf6eef5901f=
4782c53886191b2f693f24761847c"
> +SRC_URI[libloading-0.8.5.sha256sum] =3D "4979f22fdb869068da03c9f7528f829=
7c6fd2606bc3a4affe42e6a823fdb8da4"
> +SRC_URI[libm-0.2.8.sha256sum] =3D "4ec2a862134d2a7d32d7983ddcdd1c4923530=
833c9f2ea1a44fc5fa473989058"
> +SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D "78b3ae25bc7c8c38cec158d1f27=
57ee79e9b3740fbc7ccf0e59e4b08d793fa89"
> +SRC_URI[log-0.4.22.sha256sum] =3D "a7a70ba024b9dc04c27ea2f0c0548feb474ec=
5c54bba33a7f72f873a39d07b24"
> +SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa467c=
2438859caa136dec86c26fdd2efe17b92"
> +SRC_URI[peeking_take_while-0.1.2.sha256sum] =3D "19b17cddbe7ec3f8bc80088=
7bab5e717348c95ea2ca0b1bf0837fb964dc67099"
> +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D "da544ee218f0d287a911e9c99a=
39a8c9bc8fcad3cb8db5959940044ecfc67265"
> +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D "5e719e8df665df0d1c8fbfd238015=
744736151d4445ec0836b8e628aae103b77"
> +SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbdc3=
ab723cdda1c6bd4e6ad4208acaca7"
> +SRC_URI[regex-1.10.5.sha256sum] =3D "b91213439dad192326a0d7c6ee395591042=
5f441d7038e0d6933b0aec5c4517f"
> +SRC_URI[regex-automata-0.4.7.sha256sum] =3D "38caf58cc5ef2fed281f89292ef=
23f6365465ed9a41b7a7754eb4e26496c92df"
> +SRC_URI[regex-syntax-0.8.4.sha256sum] =3D "7a66a03ae7c801facd77a29370b4f=
aec201768915ac14a721ba36f20bc9c209b"
> +SRC_URI[rustc-hash-1.1.0.sha256sum] =3D "08d43f7aa6b08d49f382cde6a798204=
7c3426db949b1424bc4b7ec9ae12c6ce2"
> +SRC_URI[rustix-0.38.34.sha256sum] =3D "70dc5ec042f7a43c4a73241207cecc987=
3a06d45debb38b329f8541d85c2730f"
> +SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db536=
83adb661634f67557942dea4facebec0fee4b"
> +SRC_URI[which-4.4.2.sha256sum] =3D "87ba24419a2078cd2b0f2ede2691b6c66d8e=
47836da3b6db8265ebad47afbfc7"
> +SRC_URI[which-6.0.2.sha256sum] =3D "3d9c5ed668ee1f17edb3b627225343d21000=
6a90bb1e3745ce1f30b1fb115075"
> +SRC_URI[winapi-util-0.1.8.sha256sum] =3D "4d4cc384e1e73b93bafa6fb4f1df8c=
41695c8a91cf9c4c64358067d15a7b6c6b"
> +SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3=
f9beff57ec1b52cb3de0789201425d9a33d"
> diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/me=
ta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
> new file mode 100644
> index 0000000000..107134d59b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Linux applications to manage, test and develop devices supp=
orting DMTF Security Protocol and Data Model (SPDM) "
> +HOMEPAGE =3D "https://github.com/westerndigitalcorporation/spdm-utils"
> +LICENSE =3D "Apache-2.0 & MIT"
> +LIC_FILES_CHKSUM =3D "\
> +    file://LICENSE-MIT;md5=3Db377b220f43d747efdec40d69fcaa69d \
> +    file://LICENSE-APACHE;md5=3D22a53954e4e0ec258dfce4391e905dac \
> +    "
> +
> +inherit cargo cargo-update-recipe-crates pkgconfig
> +
> +export BINDGEN_EXTRA_CLANG_ARGS
> +BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${WORKDIR}/recipe-sysroot -I${=
WORKDIR}/recipe-sysroot/usr/include"
> +
> +SRC_URI +=3D "git://github.com/westerndigitalcorporation/spdm-utils.git;=
protocol=3Dhttps;branch=3Dmaster"
> +
> +include spdm-utils-crates.inc
> +
> +SRCREV =3D "f67ac9e00b79f603ecbbd29928a4ecc3dec5abd5"
> +S =3D "${WORKDIR}/git"
> +
> +# bindgen-cli comes from meta-clang and depends on libclang
> +DEPENDS +=3D "libspdm udev bindgen-cli-native pciutils"
> +
> +COMPATIBLE_HOST:riscv32 =3D "null"
> +
> +# This has native clang/llvm dependency, poky distro is reluctant to inc=
lude them as deps
> +# this helps with world builds on AB
> +EXCLUDE_FROM_WORLD =3D "1"

I think we can use dynamic-layer concept to house this inside meta-oe
move it to meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/
folder

and add appropriate entry in BBFILES_DYNAMIC under meta-oe/conf/layer.conf

We are trying to move clang to core, if we succeed, then bindgen-cli
recipe can move
to meta-oe and we can move this recipe out of dynamic layers.

> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115262): https://lists.openembedded.org/g/openembedde=
d-devel/message/115262
> Mute This Topic: https://lists.openembedded.org/mt/110983058/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

