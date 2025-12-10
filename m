Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0A8D3E76A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:00:14 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2317.1765389606129546306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NGB8ugcu;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78ab03c30ceso923277b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765389605; x=1765994405; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P2N112r2/rZevH7fwkJaXXTV3WTIIHLfARS4t8PZrRo=;
        b=NGB8ugcusEi8yXpejqNE69OfqgrcgcJHUe6UAxqKPUbQa0gR9rFLP45DnpBXhgl1WV
         cU16k3Fazh6JuCe2WfWgJcQzb49tkVdsu6EbSUfPtR2YWpAy90NsS3dLz8hz1jYTfyos
         pPgoUaPRqTdT78iyotSU7sYiXo7wzeo/QZXQPirEvvyCdOnKbYhhhMgl/kyu0ESP0HOI
         31D6fnJE8PWffeCOAW8Fnec5IIG0c1cn/6Q8C6Z3QYb+wHqsZDPwa0oZpJfsVX9KrPVY
         e38q7R7hD365ekvtuYdRbFX/DV/Koj/PRVC0070g0dJJ/fpVVoug34seFQx0Wl1aA8aB
         yyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389605; x=1765994405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2N112r2/rZevH7fwkJaXXTV3WTIIHLfARS4t8PZrRo=;
        b=VzpQTh0PCWIXBdDKi1/7+7O++dX4CWbUTSyBkyYmz/Wj316se6GxKKVDoL+26ZuD6C
         /c71oBAUFcL7NarXnHW75MtJPsGpUVo19E6foKfwN6v3++RB4oBlG0uE3ss1uW5iZjN2
         Uf8zVG9AL8JixFpyaIQ8oVw54Tgywuf4m4XtAQ2WAH6GB6PBizq/sIVs67DCN5+k+wZT
         8DxkKjlnSoyHIOdm1uolC+Bri4eEC9Ppgo8kNGNbC6U4UTPc8u/GU083Le3M4NhWSuJC
         m77pRhLSpYcordVQs63+f7yGFHIEEot0WyKy0DK49Hx4CqP0x5N8kw65nEsxscgV/7P2
         vHLA==
X-Gm-Message-State: AOJu0Yz7Upkx+K9Vmu79eQDMwhcNLo+fJn+P2hZA3reFudsUtVM1VyGu
	0vvGchULD7NFIhIOFZKbgxwMS9mV/NFdeFkDUCRhj3FDSC5IQjvbSnDGlRLYOT1obbX/PcaPR2H
	oplkt9yoiu/jY/CbNPNlMHvRP1mFeOStwu7RqCjA=
X-Gm-Gg: AY/fxX4M55sYNr91jVDpKnyxb1277hZORt8860MdTf5LeYMKJKuMZ0Q/OyXJ8DaKcKT
	6QqGe0GdvMmUV0S2E/8JiGZL3LV8JueMfsOSrWOUvTfg2SZQZH6DPyoTazmk6/ZJX+CQvzh4/A+
	9U/ONWYatSe6iVQADwbgTA5ECX5a9Gxba1xlpYkX0TXidJJeGjhVwEgMQCjuAeca14eyGm0HLrV
	B3nzfZ1Bp0TPxlrWmRO1qJZidCNpR6Gr2j+LMlJIMAh4hCotWDo2ZyzoDGwYHCloDtS2CH3dlq5
	rFfb1w//DpCMXlTXrOlqJLjzSIiTH/BWxi5LR5u8INrjP43rHcfIDHKaYYYbkbvJgI4+0PuqD8A
	PGFErD1oLh8+dhIlviKxi4VGclbkKfVcPckHdOX80lSy08g==
X-Google-Smtp-Source: AGHT+IEYSA99TQdDmYaJzSPCjGVFZYJJnYJveKVk4TnxzdiOiS48R81DxAPgr4SKunw8T5mRjQo0ggEkf1q0XAL7kcs=
X-Received: by 2002:a05:690c:6605:b0:78c:8cf2:e1a8 with SMTP id
 00721157ae682-78c9d8172cfmr23501687b3.41.1765389604129; Wed, 10 Dec 2025
 10:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Dec 2025 09:59:37 -0800
X-Gm-Features: AQt7F2pasncmnOn4PkJ4_yrT7aX8GA_mQcwr8J_qSE7SHvNmfyaVncyrglfMF4Y
Message-ID: <CAMKF1sqvsWOpAf1+f8c17ESVB-ee-y_Scip7+F-yJRYH92jrqQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] fd-find: Add fd-find recipe
To: deepesh.varatharajan@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="0000000000003e8e3906459ccce6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 18:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122577

--0000000000003e8e3906459ccce6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Deepesh

It fails to build on qemuriscv32,

  error[E0425]: cannot find value `ALIGNOF_MAX_ALIGN_T` in this scope
     -->
/usr/src/debug/fd-find/10.3.0/sources/cargo_home/bitbake/tikv-jemallocator-=
0.6.0/src/lib.rs:73
:17
      |
   73 |     if align <=3D ALIGNOF_MAX_ALIGN_T && align <=3D size {
      |                 ^^^^^^^^^^^^^^^^^^^ not found in this scope
      |
   note: found an item that was configured out
     -->
/usr/src/debug/fd-find/10.3.0/sources/cargo_home/bitbake/tikv-jemallocator-=
0.6.0/src/lib.rs:51
:7
      |
   45 |   #[cfg(any(
      |  __________-
   46 | |     target_arch =3D "arm",
   47 | |     target_arch =3D "mips",
   48 | |     target_arch =3D "mipsel",
   49 | |     target_arch =3D "powerpc"
   50 | | ))]
      | |_- the item is gated here
   51 |   const ALIGNOF_MAX_ALIGN_T: usize =3D 8;
      |         ^^^^^^^^^^^^^^^^^^^
   note: found an item that was configured out
     -->
/usr/src/debug/fd-find/10.3.0/sources/cargo_home/bitbake/tikv-jemallocator-=
0.6.0/src/lib.rs:64
:7
      |
   52 |   #[cfg(any(
      |  __________-
   53 | |     target_arch =3D "x86",
   54 | |     target_arch =3D "x86_64",
   55 | |     target_arch =3D "aarch64",
   ...  |
   62 | |     target_arch =3D "sparc64"
   63 | | ))]
      | |_- the item is gated here
   64 |   const ALIGNOF_MAX_ALIGN_T: usize =3D 16;
      |         ^^^^^^^^^^^^^^^^^^^

   For more information about this error, try `rustc --explain E0425`.
   error: could not compile `tikv-jemallocator` (lib) due to 1 previous
error

Ideally, it would be good to fix it and submit the patch upstream but since
rv32 is newish
It would be ok to have a patch to disable it for rv32

On Tue, Dec 9, 2025 at 12:57=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> fd is a simple, fast and user-friendly alternative to 'find' written in
> rust.
> Add recipe for the latest release (10.3.0)
>
> - Ignores hidden and .gitignore files by default
> - Supports regular expressions and highlights matches
> - Faster and easier to use than traditional 'find'
>
> More information: https://crates.io/crates/fd-find
>
> Upstream Benchmarks:
> Tool & Command                 Time (mean =C2=B1 =CF=83)          Range (=
min =E2=80=A6 max)
>     Speedup vs find
> fd -u '[0-9]\.jpg$' ~        854.8 ms =C2=B1  10.0 ms       839.2 ms =E2=
=80=A6 868.9
> ms        ~13x faster
> find ~ -iname '*[0-9].jpg'   11.226 s =C2=B1  0.104 s       11.119 s =E2=
=80=A6 11.466
> s            =E2=80=94
>
> Bechmarks inside qemu (fd built from this recipe):
> Tool & Command                    Real Time      User Time       Sys Time
>       Speedup vs find
> fd (fd /path/to/search)             2.115 s       2.660 s         5.083 s
>         =E2=89=882.1=C3=97 faster
> find (find /path/to/search)         4.401 s       1.607 s         2.788 s
>              =E2=80=94
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../fd-find/fd-find-crates.inc                | 218 ++++++++++++++++++
>  .../fd-find/fd-find_10.3.0.bb                 |  28 +++
>  2 files changed, 246 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/fd-find/fd-find-crates.inc
>  create mode 100644 meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
>
> diff --git a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
> b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
> new file mode 100644
> index 0000000000..ae70f2182f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
> @@ -0,0 +1,218 @@
> +# Autogenerated with 'bitbake -c update_crates fd-find'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/aho-corasick/1.1.3 \
> +    crate://crates.io/anstream/0.6.19 \
> +    crate://crates.io/anstyle/1.0.11 \
> +    crate://crates.io/anstyle-parse/0.2.7 \
> +    crate://crates.io/anstyle-query/1.1.3 \
> +    crate://crates.io/anstyle-wincon/3.0.9 \
> +    crate://crates.io/anyhow/1.0.98 \
> +    crate://crates.io/argmax/0.4.0 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/bitflags/2.9.1 \
> +    crate://crates.io/bstr/1.12.0 \
> +    crate://crates.io/cc/1.2.29 \
> +    crate://crates.io/cfg-if/1.0.1 \
> +    crate://crates.io/cfg_aliases/0.2.1 \
> +    crate://crates.io/clap/4.5.42 \
> +    crate://crates.io/clap_builder/4.5.42 \
> +    crate://crates.io/clap_complete/4.5.55 \
> +    crate://crates.io/clap_derive/4.5.41 \
> +    crate://crates.io/clap_lex/0.7.5 \
> +    crate://crates.io/colorchoice/1.0.4 \
> +    crate://crates.io/crossbeam-channel/0.5.15 \
> +    crate://crates.io/crossbeam-deque/0.8.6 \
> +    crate://crates.io/crossbeam-epoch/0.9.18 \
> +    crate://crates.io/crossbeam-utils/0.8.21 \
> +    crate://crates.io/ctrlc/3.4.7 \
> +    crate://crates.io/diff/0.1.13 \
> +    crate://crates.io/errno/0.3.13 \
> +    crate://crates.io/etcetera/0.10.0 \
> +    crate://crates.io/faccess/0.2.4 \
> +    crate://crates.io/fastrand/2.3.0 \
> +    crate://crates.io/filetime/0.2.25 \
> +    crate://crates.io/getrandom/0.3.3 \
> +    crate://crates.io/globset/0.4.16 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/home/0.5.9 \
> +    crate://crates.io/ignore/0.4.23 \
> +    crate://crates.io/is_terminal_polyfill/1.70.1 \
> +    crate://crates.io/jiff/0.2.15 \
> +    crate://crates.io/jiff-static/0.2.15 \
> +    crate://crates.io/jiff-tzdb/0.1.4 \
> +    crate://crates.io/jiff-tzdb-platform/0.1.3 \
> +    crate://crates.io/libc/0.2.174 \
> +    crate://crates.io/libredox/0.1.4 \
> +    crate://crates.io/linux-raw-sys/0.9.4 \
> +    crate://crates.io/log/0.4.27 \
> +    crate://crates.io/lscolors/0.20.0 \
> +    crate://crates.io/memchr/2.7.5 \
> +    crate://crates.io/nix/0.30.1 \
> +    crate://crates.io/normpath/1.3.0 \
> +    crate://crates.io/nu-ansi-term/0.50.1 \
> +    crate://crates.io/once_cell/1.21.3 \
> +    crate://crates.io/once_cell_polyfill/1.70.1 \
> +    crate://crates.io/portable-atomic/1.11.1 \
> +    crate://crates.io/portable-atomic-util/0.2.4 \
> +    crate://crates.io/proc-macro2/1.0.95 \
> +    crate://crates.io/quote/1.0.40 \
> +    crate://crates.io/r-efi/5.3.0 \
> +    crate://crates.io/redox_syscall/0.5.13 \
> +    crate://crates.io/regex/1.11.1 \
> +    crate://crates.io/regex-automata/0.4.9 \
> +    crate://crates.io/regex-syntax/0.8.5 \
> +    crate://crates.io/rustix/1.0.7 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/serde/1.0.219 \
> +    crate://crates.io/serde_derive/1.0.219 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/strsim/0.11.1 \
> +    crate://crates.io/syn/2.0.104 \
> +    crate://crates.io/tempfile/3.20.0 \
> +    crate://crates.io/terminal_size/0.4.2 \
> +    crate://crates.io/test-case/3.3.1 \
> +    crate://crates.io/test-case-core/3.3.1 \
> +    crate://crates.io/test-case-macros/3.3.1 \
> +    crate://
> crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e0=
2839f328f7
> \
> +    crate://crates.io/tikv-jemallocator/0.6.0 \
> +    crate://crates.io/unicode-ident/1.0.18 \
> +    crate://crates.io/utf8parse/0.2.2 \
> +    crate://crates.io/version_check/0.9.5 \
> +    crate://crates.io/walkdir/2.5.0 \
> +    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.9 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows-sys/0.52.0 \
> +    crate://crates.io/windows-sys/0.59.0 \
> +    crate://crates.io/windows-sys/0.60.2 \
> +    crate://crates.io/windows-targets/0.52.6 \
> +    crate://crates.io/windows-targets/0.53.2 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
> +    crate://crates.io/windows_aarch64_msvc/0.52.6 \
> +    crate://crates.io/windows_aarch64_msvc/0.53.0 \
> +    crate://crates.io/windows_i686_gnu/0.52.6 \
> +    crate://crates.io/windows_i686_gnu/0.53.0 \
> +    crate://crates.io/windows_i686_gnullvm/0.52.6 \
> +    crate://crates.io/windows_i686_gnullvm/0.53.0 \
> +    crate://crates.io/windows_i686_msvc/0.52.6 \
> +    crate://crates.io/windows_i686_msvc/0.53.0 \
> +    crate://crates.io/windows_x86_64_gnu/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnu/0.53.0 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
> +    crate://crates.io/windows_x86_64_msvc/0.52.6 \
> +    crate://crates.io/windows_x86_64_msvc/0.53.0 \
> +    crate://crates.io/wit-bindgen-rt/0.39.0 \
> +"
> +
> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D
> "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
> +SRC_URI[anstream-0.6.19.sha256sum] =3D
> "301af1932e46185686725e0fad2f8f2aa7da69dd70bf6ecc44d6b703844a3933"
> +SRC_URI[anstyle-1.0.11.sha256sum] =3D
> "862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd"
> +SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D
> "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
> +SRC_URI[anstyle-query-1.1.3.sha256sum] =3D
> "6c8bdeb6047d8983be085bab0ba1472e6dc604e7041dbf6fcd5e71523014fae9"
> +SRC_URI[anstyle-wincon-3.0.9.sha256sum] =3D
> "403f75924867bb1033c59fbf0797484329750cfbe3c4325cd33127941fabc882"
> +SRC_URI[anyhow-1.0.98.sha256sum] =3D
> "e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487"
> +SRC_URI[argmax-0.4.0.sha256sum] =3D
> "0144c58b55af0133ec3963ce5e4d07aad866e3bbcfdcddbf4590dbd7ad6ff557"
> +SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[bitflags-2.9.1.sha256sum] =3D
> "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
> +SRC_URI[bstr-1.12.0.sha256sum] =3D
> "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
> +SRC_URI[cc-1.2.29.sha256sum] =3D
> "5c1599538de2394445747c8cf7935946e3cc27e9625f889d979bfb2aaf569362"
> +SRC_URI[cfg-if-1.0.1.sha256sum] =3D
> "9555578bc9e57714c812a1f84e4fc5b4d21fcb063490c624de019f7464c91268"
> +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D
> "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> +SRC_URI[clap-4.5.42.sha256sum] =3D
> "ed87a9d530bb41a67537289bafcac159cb3ee28460e0a4571123d2a778a6a882"
> +SRC_URI[clap_builder-4.5.42.sha256sum] =3D
> "64f4f3f3c77c94aff3c7e9aac9a2ca1974a5adf392a8bb751e827d6d127ab966"
> +SRC_URI[clap_complete-4.5.55.sha256sum] =3D
> "a5abde44486daf70c5be8b8f8f1b66c49f86236edf6fa2abadb4d961c4c6229a"
> +SRC_URI[clap_derive-4.5.41.sha256sum] =3D
> "ef4f52386a59ca4c860f7393bcf8abd8dfd91ecccc0f774635ff68e92eeef491"
> +SRC_URI[clap_lex-0.7.5.sha256sum] =3D
> "b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675"
> +SRC_URI[colorchoice-1.0.4.sha256sum] =3D
> "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
> +SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D
> "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
> +SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D
> "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
> +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D
> "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D
> "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
> +SRC_URI[ctrlc-3.4.7.sha256sum] =3D
> "46f93780a459b7d656ef7f071fe699c4d3d2cb201c4b24d085b6ddc505276e73"
> +SRC_URI[diff-0.1.13.sha256sum] =3D
> "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
> +SRC_URI[errno-0.3.13.sha256sum] =3D
> "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
> +SRC_URI[etcetera-0.10.0.sha256sum] =3D
> "26c7b13d0780cb82722fd59f6f57f925e143427e4a75313a6c77243bf5326ae6"
> +SRC_URI[faccess-0.2.4.sha256sum] =3D
> "59ae66425802d6a903e268ae1a08b8c38ba143520f227a205edf4e9c7e3e26d5"
> +SRC_URI[fastrand-2.3.0.sha256sum] =3D
> "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
> +SRC_URI[filetime-0.2.25.sha256sum] =3D
> "35c0522e981e68cbfa8c3f978441a5f34b30b96e146b33cd3359176b50fe8586"
> +SRC_URI[getrandom-0.3.3.sha256sum] =3D
> "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
> +SRC_URI[globset-0.4.16.sha256sum] =3D
> "54a1028dfc5f5df5da8a56a73e6c153c9a9708ec57232470703592a3f18e49f5"
> +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[home-0.5.9.sha256sum] =3D
> "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
> +SRC_URI[ignore-0.4.23.sha256sum] =3D
> "6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b"
> +SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D
> "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
> +SRC_URI[jiff-0.2.15.sha256sum] =3D
> "be1f93b8b1eb69c77f24bbb0afdf66f54b632ee39af40ca21c4365a1d7347e49"
> +SRC_URI[jiff-static-0.2.15.sha256sum] =3D
> "03343451ff899767262ec32146f6d559dd759fdadf42ff0e227c7c48f72594b4"
> +SRC_URI[jiff-tzdb-0.1.4.sha256sum] =3D
> "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
> +SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D
> "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
> +SRC_URI[libc-0.2.174.sha256sum] =3D
> "1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"
> +SRC_URI[libredox-0.1.4.sha256sum] =3D
> "1580801010e535496706ba011c15f8532df6b42297d2e471fec38ceadd8c0638"
> +SRC_URI[linux-raw-sys-0.9.4.sha256sum] =3D
> "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
> +SRC_URI[log-0.4.27.sha256sum] =3D
> "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
> +SRC_URI[lscolors-0.20.0.sha256sum] =3D
> "61183da5de8ba09a58e330d55e5ea796539d8443bd00fdeb863eac39724aa4ab"
> +SRC_URI[memchr-2.7.5.sha256sum] =3D
> "32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0"
> +SRC_URI[nix-0.30.1.sha256sum] =3D
> "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
> +SRC_URI[normpath-1.3.0.sha256sum] =3D
> "c8911957c4b1549ac0dc74e30db9c8b0e66ddcd6d7acc33098f4c63a64a6d7ed"
> +SRC_URI[nu-ansi-term-0.50.1.sha256sum] =3D
> "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
> +SRC_URI[once_cell-1.21.3.sha256sum] =3D
> "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
> +SRC_URI[once_cell_polyfill-1.70.1.sha256sum] =3D
> "a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad"
> +SRC_URI[portable-atomic-1.11.1.sha256sum] =3D
> "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
> +SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D
> "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
> +SRC_URI[proc-macro2-1.0.95.sha256sum] =3D
> "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
> +SRC_URI[quote-1.0.40.sha256sum] =3D
> "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
> +SRC_URI[r-efi-5.3.0.sha256sum] =3D
> "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
> +SRC_URI[redox_syscall-0.5.13.sha256sum] =3D
> "0d04b7d0ee6b4a0207a0a7adb104d23ecb0b47d6beae7152d0fa34b692b29fd6"
> +SRC_URI[regex-1.11.1.sha256sum] =3D
> "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
> +SRC_URI[regex-automata-0.4.9.sha256sum] =3D
> "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
> +SRC_URI[regex-syntax-0.8.5.sha256sum] =3D
> "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
> +SRC_URI[rustix-1.0.7.sha256sum] =3D
> "c71e83d6afe7ff64890ec6b71d6a69bb8a610ab78ce364b3352876bb4c801266"
> +SRC_URI[same-file-1.0.6.sha256sum] =3D
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> +SRC_URI[serde-1.0.219.sha256sum] =3D
> "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
> +SRC_URI[serde_derive-1.0.219.sha256sum] =3D
> "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[strsim-0.11.1.sha256sum] =3D
> "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
> +SRC_URI[syn-2.0.104.sha256sum] =3D
> "17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40"
> +SRC_URI[tempfile-3.20.0.sha256sum] =3D
> "e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1"
> +SRC_URI[terminal_size-0.4.2.sha256sum] =3D
> "45c6481c4829e4cc63825e62c49186a34538b7b2750b73b266581ffb612fb5ed"
> +SRC_URI[test-case-3.3.1.sha256sum] =3D
> "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
> +SRC_URI[test-case-core-3.3.1.sha256sum] =3D
> "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
> +SRC_URI[test-case-macros-3.3.1.sha256sum] =3D
> "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
> +SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02=
839f328f7.sha256sum]
> =3D "cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48ad05037a677e52e4e2d"
> +SRC_URI[tikv-jemallocator-0.6.0.sha256sum] =3D
> "4cec5ff18518d81584f477e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865"
> +SRC_URI[unicode-ident-1.0.18.sha256sum] =3D
> "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
> +SRC_URI[utf8parse-0.2.2.sha256sum] =3D
> "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
> +SRC_URI[version_check-0.9.5.sha256sum] =3D
> "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
> +SRC_URI[walkdir-2.5.0.sha256sum] =3D
> "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
> +SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] =3D
> "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
> +SRC_URI[winapi-0.3.9.sha256sum] =3D
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.9.sha256sum] =3D
> "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[windows-sys-0.52.0.sha256sum] =3D
> "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
> +SRC_URI[windows-sys-0.59.0.sha256sum] =3D
> "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
> +SRC_URI[windows-sys-0.60.2.sha256sum] =3D
> "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
> +SRC_URI[windows-targets-0.52.6.sha256sum] =3D
> "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
> +SRC_URI[windows-targets-0.53.2.sha256sum] =3D
> "c66f69fcc9ce11da9966ddb31a40968cad001c5bedeb5c2b82ede4253ab48aef"
> +SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D
> "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> +SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] =3D
> "86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
> +SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D
> "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
> +SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] =3D
> "c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c"
> +SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D
> "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
> +SRC_URI[windows_i686_gnu-0.53.0.sha256sum] =3D
> "c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
> +SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D
> "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> +SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] =3D
> "9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
> +SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D
> "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> +SRC_URI[windows_i686_msvc-0.53.0.sha256sum] =3D
> "581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
> +SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D
> "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> +SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] =3D
> "2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
> +SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D
> "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> +SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] =3D
> "0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57"
> +SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D
> "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] =3D
> "271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486"
> +SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] =3D
> "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
> diff --git a/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
> b/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
> new file mode 100644
> index 0000000000..3df88c88b0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "fd is a simple, fast and user-friendly alternative to find.=
"
> +HOMEPAGE =3D "https://crates.io/crates/fd-find"
> +DESCRIPTION =3D "fd is a program to find entries in your filesystem. It =
\
> +               is a simple, fast and user-friendly alternative to find. =
\
> +               While it does not aim to support all of find's powerful \
> +               functionality, it provides sensible (opinionated) default=
s
> \
> +               for a majority of use cases."
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE-MIT;md5=3D96713c739748a44f86272791c89ce344 \
> +"
> +
> +SRC_URI =3D "crate://crates.io/fd-find/${PV};name=3Dfd-find
> <http://crates.io/fd-find/$%7BPV%7D;name=3Dfd-find>"
> +SRC_URI[fd-find.sha256sum] =3D
> "2fbf004b5bbdefab92e76237e2022c77842cdef5d3213fe09fd804e0474785db"
> +S =3D "${CARGO_VENDORING_DIRECTORY}/fd-find-${PV}"
> +
> +inherit cargo cargo-update-recipe-crates
> +
> +#Upstream fd-find sets strip =3D true in [profile.release], which causes
> Cargo
> +#to strip the binary during compilation. This interferes with Yocto=E2=
=80=99s
> normal
> +#do_package stripping process.By adding the following flag, we ensure
> that
> +#stripping is handled by Yocto as usual:
> +CARGO_BUILD_FLAGS +=3D " --config profile.release.strip=3Dfalse"
> +
> +require ${BPN}-crates.inc
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122402):
> https://lists.openembedded.org/g/openembedded-devel/message/122402
> Mute This Topic: https://lists.openembedded.org/mt/116691252/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003e8e3906459ccce6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Deepesh<div><br></div><div>It fails to build on qemuris=
cv32,=C2=A0</div><div><br></div><div>=C2=A0 error[E0425]: cannot find value=
 `ALIGNOF_MAX_ALIGN_T` in this scope<br>=C2=A0 =C2=A0 =C2=A0--&gt; /usr/src=
/debug/fd-find/10.3.0/sources/cargo_home/bitbake/tikv-jemallocator-0.6.0/sr=
c/lib.rs:73:17<br>=C2=A0 =C2=A0 =C2=A0 |<br>=C2=A0 =C2=A073 | =C2=A0 =C2=A0=
 if align &lt;=3D ALIGNOF_MAX_ALIGN_T &amp;&amp; align &lt;=3D size {<br>=
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^^^^^^^^^^^^^^^^^^^ not found in this scope<br>=C2=A0 =C2=A0 =C2=A0 |<b=
r>=C2=A0 =C2=A0note: found an item that was configured out<br>=C2=A0 =C2=A0=
 =C2=A0--&gt; /usr/src/debug/fd-find/10.3.0/sources/cargo_home/bitbake/tikv=
-jemallocator-0.6.0/src/lib.rs:51:7<br>=C2=A0 =C2=A0 =C2=A0 |<br>=C2=A0 =C2=
=A045 | =C2=A0 #[cfg(any(<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0__________-<br>=
=C2=A0 =C2=A046 | | =C2=A0 =C2=A0 target_arch =3D &quot;arm&quot;,<br>=C2=
=A0 =C2=A047 | | =C2=A0 =C2=A0 target_arch =3D &quot;mips&quot;,<br>=C2=A0 =
=C2=A048 | | =C2=A0 =C2=A0 target_arch =3D &quot;mipsel&quot;,<br>=C2=A0 =
=C2=A049 | | =C2=A0 =C2=A0 target_arch =3D &quot;powerpc&quot;<br>=C2=A0 =
=C2=A050 | | ))]<br>=C2=A0 =C2=A0 =C2=A0 | |_- the item is gated here<br>=
=C2=A0 =C2=A051 | =C2=A0 const ALIGNOF_MAX_ALIGN_T: usize =3D 8;<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^<br>=C2=A0 =
=C2=A0note: found an item that was configured out<br>=C2=A0 =C2=A0 =C2=A0--=
&gt; /usr/src/debug/fd-find/10.3.0/sources/cargo_home/bitbake/tikv-jemalloc=
ator-0.6.0/src/lib.rs:64:7<br>=C2=A0 =C2=A0 =C2=A0 |<br>=C2=A0 =C2=A052 | =
=C2=A0 #[cfg(any(<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0__________-<br>=C2=A0 =C2=
=A053 | | =C2=A0 =C2=A0 target_arch =3D &quot;x86&quot;,<br>=C2=A0 =C2=A054=
 | | =C2=A0 =C2=A0 target_arch =3D &quot;x86_64&quot;,<br>=C2=A0 =C2=A055 |=
 | =C2=A0 =C2=A0 target_arch =3D &quot;aarch64&quot;,<br>=C2=A0 =C2=A0... =
=C2=A0|<br>=C2=A0 =C2=A062 | | =C2=A0 =C2=A0 target_arch =3D &quot;sparc64&=
quot;<br>=C2=A0 =C2=A063 | | ))]<br>=C2=A0 =C2=A0 =C2=A0 | |_- the item is =
gated here<br>=C2=A0 =C2=A064 | =C2=A0 const ALIGNOF_MAX_ALIGN_T: usize =3D=
 16;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^=
^^^<br><br>=C2=A0 =C2=A0For more information about this error, try `rustc -=
-explain E0425`.<br>=C2=A0 =C2=A0error: could not compile `tikv-jemallocato=
r` (lib) due to 1 previous error<br></div><div><br></div><div>Ideally, it w=
ould be good to fix it and submit the patch upstream but since rv32 is newi=
sh=C2=A0</div><div>It would be ok to have a patch to disable it for rv32=C2=
=A0</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Dec 9, 2025 at 12:57=E2=80=AFAM Vara=
tharajan, Deepesh via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;deepesh.varatharajan=3D<a href=3D"mailto:windriver.com@=
lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Deepesh V=
aratharajan &lt;<a href=3D"mailto:Deepesh.Varatharajan@windriver.com" targe=
t=3D"_blank">Deepesh.Varatharajan@windriver.com</a>&gt;<br>
<br>
fd is a simple, fast and user-friendly alternative to &#39;find&#39; writte=
n in rust.<br>
Add recipe for the latest release (10.3.0)<br>
<br>
- Ignores hidden and .gitignore files by default<br>
- Supports regular expressions and highlights matches<br>
- Faster and easier to use than traditional &#39;find&#39;<br>
<br>
More information: <a href=3D"https://crates.io/crates/fd-find" rel=3D"noref=
errer" target=3D"_blank">https://crates.io/crates/fd-find</a><br>
<br>
Upstream Benchmarks:<br>
Tool &amp; Command=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Time (mean =C2=B1 =CF=83)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Range (mi=
n =E2=80=A6 max)=C2=A0 =C2=A0 =C2=A0 Speedup vs find<br>
fd -u &#39;[0-9]\.jpg$&#39; ~=C2=A0 =C2=A0 =C2=A0 =C2=A0 854.8 ms =C2=B1=C2=
=A0 10.0 ms=C2=A0 =C2=A0 =C2=A0 =C2=A0839.2 ms =E2=80=A6 868.9 ms=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~13x faster<br>
find ~ -iname &#39;*[0-9].jpg&#39;=C2=A0 =C2=A011.226 s =C2=B1=C2=A0 0.104 =
s=C2=A0 =C2=A0 =C2=A0 =C2=A011.119 s =E2=80=A6 11.466 s=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =E2=80=94<br>
<br>
Bechmarks inside qemu (fd built from this recipe):<br>
Tool &amp; Command=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Real Time=C2=A0 =C2=A0 =C2=A0 User Time=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Sys Time=C2=A0 =C2=A0 =C2=A0 =C2=A0 Speedup vs find<br>
fd (fd /path/to/search)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.11=
5 s=C2=A0 =C2=A0 =C2=A0 =C2=A02.660 s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05.08=
3 s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=89=882.1=C3=97 faster<br>
find (find /path/to/search)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.401 s=C2=A0 =
=C2=A0 =C2=A0 =C2=A01.607 s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.788 s=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=80=94<br>
<br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0.../fd-find/fd-find-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 218 ++++++++++++++++++<br>
=C2=A0.../fd-find/<a href=3D"http://fd-find_10.3.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">fd-find_10.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 +++<br>
=C2=A02 files changed, 246 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/fd-find/fd-find-crates.in=
c<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/fd-find/<a href=3D"http:/=
/fd-find_10.3.0.bb" rel=3D"noreferrer" target=3D"_blank">fd-find_10.3.0.bb<=
/a><br>
<br>
diff --git a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc b/meta-oe/=
recipes-extended/fd-find/fd-find-crates.inc<br>
new file mode 100644<br>
index 0000000000..ae70f2182f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc<br>
@@ -0,0 +1,218 @@<br>
+# Autogenerated with &#39;bitbake -c update_crates fd-find&#39;<br>
+<br>
+# from Cargo.lock<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/1.1.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/1.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstream/0.6.19" rel=3D"=
noreferrer" target=3D"_blank">crates.io/anstream/0.6.19</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle/1.0.11" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/anstyle/1.0.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle-parse/0.2.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/anstyle-parse/0.2.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle-query/1.1.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/anstyle-query/1.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle-wincon/3.0.9" re=
l=3D"noreferrer" target=3D"_blank">crates.io/anstyle-wincon/3.0.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anyhow/1.0.98" rel=3D"no=
referrer" target=3D"_blank">crates.io/anyhow/1.0.98</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/argmax/0.4.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/argmax/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.9.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/2.9.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bstr/1.12.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/bstr/1.12.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.2.29" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.2.29</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg_aliases/0.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg_aliases/0.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap/4.5.42" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/clap/4.5.42</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_builder/4.5.42" rel=
=3D"noreferrer" target=3D"_blank">crates.io/clap_builder/4.5.42</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_complete/4.5.55" re=
l=3D"noreferrer" target=3D"_blank">crates.io/clap_complete/4.5.55</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_derive/4.5.41" rel=
=3D"noreferrer" target=3D"_blank">crates.io/clap_derive/4.5.41</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_lex/0.7.5" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/clap_lex/0.7.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/colorchoice/1.0.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/colorchoice/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0.5.15=
" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-channel/0.5.15</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque/0.8.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8.6</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch/0.9.18" =
rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.9.18</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.8.21" =
rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.8.21</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ctrlc/3.4.7" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ctrlc/3.4.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/diff/0.1.13" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/diff/0.1.13</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno/0.3.13" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/errno/0.3.13</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/etcetera/0.10.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/etcetera/0.10.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/faccess/0.2.4" rel=3D"no=
referrer" target=3D"_blank">crates.io/faccess/0.2.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fastrand/2.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/fastrand/2.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/filetime/0.2.25" rel=3D"=
noreferrer" target=3D"_blank">crates.io/filetime/0.2.25</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.3.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/getrandom/0.3.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/globset/0.4.16" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/globset/0.4.16</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/home/0.5.9" rel=3D"noref=
errer" target=3D"_blank">crates.io/home/0.5.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ignore/0.4.23" rel=3D"no=
referrer" target=3D"_blank">crates.io/ignore/0.4.23</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/is_terminal_polyfill/1.7=
0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/is_terminal_polyfill/1.=
70.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff/0.2.15" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/jiff/0.2.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff-static/0.2.15" rel=
=3D"noreferrer" target=3D"_blank">crates.io/jiff-static/0.2.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff-tzdb/0.1.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/jiff-tzdb/0.1.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff-tzdb-platform/0.1.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/jiff-tzdb-platform/0.1.3</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.174" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.174</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libredox/0.1.4" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/libredox/0.1.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/linux-raw-sys/0.9.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/linux-raw-sys/0.9.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.27" rel=3D"noref=
errer" target=3D"_blank">crates.io/log/0.4.27</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lscolors/0.20.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/lscolors/0.20.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.7.5" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/memchr/2.7.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nix/0.30.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/nix/0.30.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/normpath/1.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/normpath/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nu-ansi-term/0.50.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/nu-ansi-term/0.50.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.21.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.21.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell_polyfill/1.70.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell_polyfill/1.70.1=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.11.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.11.1</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic-util/0.2=
.4" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic-util/0.2=
.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.95" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.95</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.40" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.40</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r-efi/5.3.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/r-efi/5.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.5.13" re=
l=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.5.13</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.11.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/regex/1.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-automata/0.4.9" re=
l=3D"noreferrer" target=3D"_blank">crates.io/regex-automata/0.4.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.8.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.8.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustix/1.0.7" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/rustix/1.0.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/1.0.6" rel=3D"=
noreferrer" target=3D"_blank">crates.io/same-file/1.0.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.219" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.219</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.219" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.219</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/shlex/1.3.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strsim/0.11.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/strsim/0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.104" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/syn/2.0.104</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tempfile/3.20.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/tempfile/3.20.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/terminal_size/0.4.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/terminal_size/0.4.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/test-case/3.3.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/test-case/3.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/test-case-core/3.3.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/test-case-core/3.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/test-case-macros/3.3.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/test-case-macros/3.3.1</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tikv-jemalloc-sys/0.6.0+=
5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7" rel=3D"noreferrer" targe=
t=3D"_blank">crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba984=
7cc330696e02839f328f7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tikv-jemallocator/0.6.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/tikv-jemallocator/0.6.0</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.18" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.18</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/utf8parse/0.2.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/utf8parse/0.2.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.5.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/walkdir/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.14.2+wasi-0.2.4" =
rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.14.2+wasi-0.2.4</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-windows-g=
nu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-pc-win=
dows-gnu/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-windows=
-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_64-pc=
-windows-gnu/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.52.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.52.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.59.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.59.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.60.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.60.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.52.6" =
rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.52.6</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.53.2" =
rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.53.2</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnullvm/=
0.52.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_gnul=
lvm/0.52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnullvm/=
0.53.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_gnul=
lvm/0.53.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msvc/0.5=
2.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_msvc/0.=
52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msvc/0.5=
3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_msvc/0.=
53.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.52.6"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.52.6</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.53.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.53.0</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnullvm/0.5=
2.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnullvm/0.=
52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnullvm/0.5=
3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnullvm/0.=
53.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0.52.6=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.52.6</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0.53.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.53.0</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/0.52.=
6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0.52.6=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/0.53.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0.53.0=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnullvm/0=
.52.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnullv=
m/0.52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnullvm/0=
.53.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnullv=
m/0.53.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc/0.52=
.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc/0.52=
.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc/0.53=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc/0.53=
.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-bindgen-rt/0.39.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/wit-bindgen-rt/0.39.0</a> \<b=
r>
+&quot;<br>
+<br>
+SRC_URI[aho-corasick-1.1.3.sha256sum] =3D &quot;8e60d3430d3a69478ad0993f19=
238d2df97c507009a52b3c10addcd7f6bcb916&quot;<br>
+SRC_URI[anstream-0.6.19.sha256sum] =3D &quot;301af1932e46185686725e0fad2f8=
f2aa7da69dd70bf6ecc44d6b703844a3933&quot;<br>
+SRC_URI[anstyle-1.0.11.sha256sum] =3D &quot;862ed96ca487e809f1c8e5a8447f6e=
e2cf102f846893800b20cebdf541fc6bbd&quot;<br>
+SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D &quot;4e7644824f0aa2c7b93845792=
34ef10eb7efb6a0deb83f9630a49594dd9c15c2&quot;<br>
+SRC_URI[anstyle-query-1.1.3.sha256sum] =3D &quot;6c8bdeb6047d8983be085bab0=
ba1472e6dc604e7041dbf6fcd5e71523014fae9&quot;<br>
+SRC_URI[anstyle-wincon-3.0.9.sha256sum] =3D &quot;403f75924867bb1033c59fbf=
0797484329750cfbe3c4325cd33127941fabc882&quot;<br>
+SRC_URI[anyhow-1.0.98.sha256sum] =3D &quot;e16d2d3311acee920a9eb8d33b8cbc1=
787ce4a264e85f964c2404b969bdcd487&quot;<br>
+SRC_URI[argmax-0.4.0.sha256sum] =3D &quot;0144c58b55af0133ec3963ce5e4d07aa=
d866e3bbcfdcddbf4590dbd7ad6ff557&quot;<br>
+SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7dfd33cc=
f595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
+SRC_URI[bitflags-2.9.1.sha256sum] =3D &quot;1b8e56985ec62d17e9c1001dc89c88=
ecd7dc08e47eba5ec7c29c7b5eeecde967&quot;<br>
+SRC_URI[bstr-1.12.0.sha256sum] =3D &quot;234113d19d0d7d613b40e86fb654acf95=
8910802bcceab913a4f9e7cda03b1a4&quot;<br>
+SRC_URI[cc-1.2.29.sha256sum] =3D &quot;5c1599538de2394445747c8cf7935946e3c=
c27e9625f889d979bfb2aaf569362&quot;<br>
+SRC_URI[cfg-if-1.0.1.sha256sum] =3D &quot;9555578bc9e57714c812a1f84e4fc5b4=
d21fcb063490c624de019f7464c91268&quot;<br>
+SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D &quot;613afe47fcd5fac7ccf1db93bab=
cb082c5994d996f20b8b159f2ad1658eb5724&quot;<br>
+SRC_URI[clap-4.5.42.sha256sum] =3D &quot;ed87a9d530bb41a67537289bafcac159c=
b3ee28460e0a4571123d2a778a6a882&quot;<br>
+SRC_URI[clap_builder-4.5.42.sha256sum] =3D &quot;64f4f3f3c77c94aff3c7e9aac=
9a2ca1974a5adf392a8bb751e827d6d127ab966&quot;<br>
+SRC_URI[clap_complete-4.5.55.sha256sum] =3D &quot;a5abde44486daf70c5be8b8f=
8f1b66c49f86236edf6fa2abadb4d961c4c6229a&quot;<br>
+SRC_URI[clap_derive-4.5.41.sha256sum] =3D &quot;ef4f52386a59ca4c860f7393bc=
f8abd8dfd91ecccc0f774635ff68e92eeef491&quot;<br>
+SRC_URI[clap_lex-0.7.5.sha256sum] =3D &quot;b94f61472cee1439c0b966b47e3aca=
9ae07e45d070759512cd390ea2bebc6675&quot;<br>
+SRC_URI[colorchoice-1.0.4.sha256sum] =3D &quot;b05b61dc5112cbb17e4b6cd6179=
0d9845d13888356391624cbe7e41efeac1e75&quot;<br>
+SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D &quot;82b8f8f868b36967f960=
6790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2&quot;<br>
+SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D &quot;9dd111b7b7f7d55b72c0a6a=
e361660ee5853c9af73f70c3c2ef6858b950e2e51&quot;<br>
+SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D &quot;5b82ac4a3c2ca9c3460964=
f020e1402edd5753411d7737aa39c3714ad1b5420e&quot;<br>
+SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D &quot;d0a5c400df2834b80a4c33=
27b3aad3a4c4cd4de0629063962b03235697506a28&quot;<br>
+SRC_URI[ctrlc-3.4.7.sha256sum] =3D &quot;46f93780a459b7d656ef7f071fe699c4d=
3d2cb201c4b24d085b6ddc505276e73&quot;<br>
+SRC_URI[diff-0.1.13.sha256sum] =3D &quot;56254986775e3233ffa9c4d7d3faaf6d3=
6a2c09d30b20687e9f88bc8bafc16c8&quot;<br>
+SRC_URI[errno-0.3.13.sha256sum] =3D &quot;778e2ac28f6c47af28e4907f13ffd1e1=
ddbd400980a9abd7c8df189bf578a5ad&quot;<br>
+SRC_URI[etcetera-0.10.0.sha256sum] =3D &quot;26c7b13d0780cb82722fd59f6f57f=
925e143427e4a75313a6c77243bf5326ae6&quot;<br>
+SRC_URI[faccess-0.2.4.sha256sum] =3D &quot;59ae66425802d6a903e268ae1a08b8c=
38ba143520f227a205edf4e9c7e3e26d5&quot;<br>
+SRC_URI[fastrand-2.3.0.sha256sum] =3D &quot;37909eebbb50d72f9059c3b6d82c04=
63f2ff062c9e95845c43a6c9c0355411be&quot;<br>
+SRC_URI[filetime-0.2.25.sha256sum] =3D &quot;35c0522e981e68cbfa8c3f978441a=
5f34b30b96e146b33cd3359176b50fe8586&quot;<br>
+SRC_URI[getrandom-0.3.3.sha256sum] =3D &quot;26145e563e54f2cadc477553f1ec5=
ee650b00862f0a58bcd12cbdc5f0ea2d2f4&quot;<br>
+SRC_URI[globset-0.4.16.sha256sum] =3D &quot;54a1028dfc5f5df5da8a56a73e6c15=
3c9a9708ec57232470703592a3f18e49f5&quot;<br>
+SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3b60a8=
84b5d30c0fca7d82fe33449bbe55ea&quot;<br>
+SRC_URI[home-0.5.9.sha256sum] =3D &quot;e3d1354bf6b7235cb4a0576c2619fd4ed1=
8183f689b12b006a0ee7329eeff9a5&quot;<br>
+SRC_URI[ignore-0.4.23.sha256sum] =3D &quot;6d89fd380afde86567dfba715db0656=
73989d6253f42b88179abd3eae47bda4b&quot;<br>
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D &quot;7943c866cc5cd64cb=
c25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf&quot;<br>
+SRC_URI[jiff-0.2.15.sha256sum] =3D &quot;be1f93b8b1eb69c77f24bbb0afdf66f54=
b632ee39af40ca21c4365a1d7347e49&quot;<br>
+SRC_URI[jiff-static-0.2.15.sha256sum] =3D &quot;03343451ff899767262ec32146=
f6d559dd759fdadf42ff0e227c7c48f72594b4&quot;<br>
+SRC_URI[jiff-tzdb-0.1.4.sha256sum] =3D &quot;c1283705eb0a21404d2bfd6eef2a7=
593d240bc42a0bdb39db0ad6fa2ec026524&quot;<br>
+SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D &quot;875a5a69ac2bab1a8917=
11cf5eccbec1ce0341ea805560dcd90b7a2e925132e8&quot;<br>
+SRC_URI[libc-0.2.174.sha256sum] =3D &quot;1171693293099992e19cddea4e8b8499=
64e9846f4acee11b3948bcc337be8776&quot;<br>
+SRC_URI[libredox-0.1.4.sha256sum] =3D &quot;1580801010e535496706ba011c15f8=
532df6b42297d2e471fec38ceadd8c0638&quot;<br>
+SRC_URI[linux-raw-sys-0.9.4.sha256sum] =3D &quot;cd945864f07fe9f5371a27ad7=
b52a172b4b499999f1d97574c9fa68373937e12&quot;<br>
+SRC_URI[log-0.4.27.sha256sum] =3D &quot;13dc2df351e3202783a1fe0d44375f7295=
ffb4049267b0f3018346dc122a1d94&quot;<br>
+SRC_URI[lscolors-0.20.0.sha256sum] =3D &quot;61183da5de8ba09a58e330d55e5ea=
796539d8443bd00fdeb863eac39724aa4ab&quot;<br>
+SRC_URI[memchr-2.7.5.sha256sum] =3D &quot;32a282da65faaf38286cf3be983213fc=
f1d2e2a58700e808f83f4ea9a4804bc0&quot;<br>
+SRC_URI[nix-0.30.1.sha256sum] =3D &quot;74523f3a35e05aba87a1d978330aef40f6=
7b0304ac79c1c00b294c9830543db6&quot;<br>
+SRC_URI[normpath-1.3.0.sha256sum] =3D &quot;c8911957c4b1549ac0dc74e30db9c8=
b0e66ddcd6d7acc33098f4c63a64a6d7ed&quot;<br>
+SRC_URI[nu-ansi-term-0.50.1.sha256sum] =3D &quot;d4a28e057d01f97e61255210f=
cff094d74ed0466038633e95017f5beb68e4399&quot;<br>
+SRC_URI[once_cell-1.21.3.sha256sum] =3D &quot;42f5e15c9953c5e4ccceeb2e7382=
a716482c34515315f7b03532b8b4e8393d2d&quot;<br>
+SRC_URI[once_cell_polyfill-1.70.1.sha256sum] =3D &quot;a4895175b425cb1f877=
21b59f0f286c2092bd4af812243672510e1ac53e2e0ad&quot;<br>
+SRC_URI[portable-atomic-1.11.1.sha256sum] =3D &quot;f84267b20a16ea918e43c6=
a88433c2d54fa145c92a811b5b047ccbe153674483&quot;<br>
+SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D &quot;d8a2f0d8d040d7848a=
709caf78912debcc3f33ee4b3cac47d73d1e1069e83507&quot;<br>
+SRC_URI[proc-macro2-1.0.95.sha256sum] =3D &quot;02b3e5e68a3a1a02aad3ec490a=
98007cbc13c37cbe84a3cd7b8e406d76e7f778&quot;<br>
+SRC_URI[quote-1.0.40.sha256sum] =3D &quot;1885c039570dc00dcb4ff087a89e185f=
d56bae234ddc7f056a945bf36467248d&quot;<br>
+SRC_URI[r-efi-5.3.0.sha256sum] =3D &quot;69cdb34c158ceb288df11e18b4bd39de9=
94f6657d83847bdffdbd7f346754b0f&quot;<br>
+SRC_URI[redox_syscall-0.5.13.sha256sum] =3D &quot;0d04b7d0ee6b4a0207a0a7ad=
b104d23ecb0b47d6beae7152d0fa34b692b29fd6&quot;<br>
+SRC_URI[regex-1.11.1.sha256sum] =3D &quot;b544ef1b4eac5dc2db33ea63606ae9ff=
cfac26c1416a2806ae0bf5f56b201191&quot;<br>
+SRC_URI[regex-automata-0.4.9.sha256sum] =3D &quot;809e8dc61f6de73b46c85f4c=
96486310fe304c434cfa43669d7b40f711150908&quot;<br>
+SRC_URI[regex-syntax-0.8.5.sha256sum] =3D &quot;2b15c43186be67a4fd63bee50d=
0303afffcef381492ebe2c5d87f324e1b8815c&quot;<br>
+SRC_URI[rustix-1.0.7.sha256sum] =3D &quot;c71e83d6afe7ff64890ec6b71d6a69bb=
8a610ab78ce364b3352876bb4c801266&quot;<br>
+SRC_URI[same-file-1.0.6.sha256sum] =3D &quot;93fc1dc3aaa9bfed95e02e6eadabb=
4baf7e3078b0bd1b4d7b6b0b68378900502&quot;<br>
+SRC_URI[serde-1.0.219.sha256sum] =3D &quot;5f0e2c6ed6606019b4e29e69dbaba95=
b11854410e5347d525002456dbbb786b6&quot;<br>
+SRC_URI[serde_derive-1.0.219.sha256sum] =3D &quot;5b0276cf7f2c73365f7157c8=
123c21cd9a50fbbd844757af28ca1f5925fc2a00&quot;<br>
+SRC_URI[shlex-1.3.0.sha256sum] =3D &quot;0fda2ff0d084019ba4d7c6f371c95d8fd=
75ce3524c3cb8fb653a3023f6323e64&quot;<br>
+SRC_URI[strsim-0.11.1.sha256sum] =3D &quot;7da8b5736845d9f2fcb837ea5d9e262=
8564b3b043a70948a3f0b778838c5fb4f&quot;<br>
+SRC_URI[syn-2.0.104.sha256sum] =3D &quot;17b6f705963418cdb9927482fa304bc56=
2ece2fdd4f616084c50b7023b435a40&quot;<br>
+SRC_URI[tempfile-3.20.0.sha256sum] =3D &quot;e8a64e3985349f2441a1a9ef0b853=
f869006c3855f2cda6862a94d26ebb9d6a1&quot;<br>
+SRC_URI[terminal_size-0.4.2.sha256sum] =3D &quot;45c6481c4829e4cc63825e62c=
49186a34538b7b2750b73b266581ffb612fb5ed&quot;<br>
+SRC_URI[test-case-3.3.1.sha256sum] =3D &quot;eb2550dd13afcd286853192af8601=
920d959b14c401fcece38071d53bf0768a8&quot;<br>
+SRC_URI[test-case-core-3.3.1.sha256sum] =3D &quot;adcb7fd841cd518e279be3d5=
a3eb0636409487998a4aff22f3de87b81e88384f&quot;<br>
+SRC_URI[test-case-macros-3.3.1.sha256sum] =3D &quot;5c89e72a01ed4c579669ad=
d59014b9a524d609c0c88c6a585ce37485879f6ffb&quot;<br>
+SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e0283=
9f328f7.sha256sum] =3D &quot;cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48a=
d05037a677e52e4e2d&quot;<br>
+SRC_URI[tikv-jemallocator-0.6.0.sha256sum] =3D &quot;4cec5ff18518d81584f47=
7e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865&quot;<br>
+SRC_URI[unicode-ident-1.0.18.sha256sum] =3D &quot;5a5f39404a5da50712a4c1ee=
cf25e90dd62b613502b7e925fd4e4d19b5c96512&quot;<br>
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D &quot;06abde3611657adf66d383f00b093=
d7faecc7fa57071cce2578660c9f1010821&quot;<br>
+SRC_URI[version_check-0.9.5.sha256sum] =3D &quot;0b928f33d975fc6ad9f86c8f2=
83853ad26bdd5b10b7f1542aa2fa15e2289105a&quot;<br>
+SRC_URI[walkdir-2.5.0.sha256sum] =3D &quot;29790946404f91d9c5d06f9874efdde=
a1dc06c5efe94541a7d6863108e3a5e4b&quot;<br>
+SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] =3D &quot;9683f9a5a998d873c0d21f=
cbe3c083009670149a8fab228644b8bd36b2c48cb3&quot;<br>
+SRC_URI[winapi-0.3.9.sha256sum] =3D &quot;5c839a674fcd7a98952e593242ea400a=
be93992746761e38641405d28b00f419&quot;<br>
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;ac3b87c63620=
426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6&quot;<br>
+SRC_URI[winapi-util-0.1.9.sha256sum] =3D &quot;cf221c93e13a30d793f7645a0e7=
762c55d169dbb0a49671918a2319d289b10bb&quot;<br>
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;712e227841=
d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f&quot;<br>
+SRC_URI[windows-sys-0.52.0.sha256sum] =3D &quot;282be5f36a8ce781fad8c8ae18=
fa3f9beff57ec1b52cb3de0789201425d9a33d&quot;<br>
+SRC_URI[windows-sys-0.59.0.sha256sum] =3D &quot;1e38bc4d79ed67fd075bcc251a=
1c39b32a1776bbe92e5bef1f0bf1f8c531853b&quot;<br>
+SRC_URI[windows-sys-0.60.2.sha256sum] =3D &quot;f2f500e4d28234f72040990ec9=
d39e3a6b950f9f22d3dba18416c35882612bcb&quot;<br>
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D &quot;9b724f72796e036ab90c10=
21d4780d4d3d648aca59e491e6b98e725b84e99973&quot;<br>
+SRC_URI[windows-targets-0.53.2.sha256sum] =3D &quot;c66f69fcc9ce11da9966dd=
b31a40968cad001c5bedeb5c2b82ede4253ab48aef&quot;<br>
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D &quot;32a4622180e7a0=
ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3&quot;<br>
+SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] =3D &quot;86b8d5f90ddd19=
cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764&quot;<br>
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D &quot;09ec2a7bb152e2252=
b53fa7803150007879548bc709c039df7627cabbd05d469&quot;<br>
+SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] =3D &quot;c7651a1f62a11b8cb=
d5e0d42526e55f2c99886c77e007179efff86c2b137e66c&quot;<br>
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D &quot;8e9b5ad5ab802e97eb8e2=
95ac6720e509ee4c243f69d781394014ebfe8bbfa0b&quot;<br>
+SRC_URI[windows_i686_gnu-0.53.0.sha256sum] =3D &quot;c1dc67659d35f387f5f6c=
479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3&quot;<br>
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D &quot;0eee52d38c090b3ca=
a76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66&quot;<br>
+SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] =3D &quot;9ce6ccbdedbf6d635=
4471319e781c0dfef054c81fbc7cf83f338a4296c0cae11&quot;<br>
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D &quot;240948bc05c5e7c6dabb=
a28bf89d89ffce3e303022809e73deaefe4f6ec56c66&quot;<br>
+SRC_URI[windows_i686_msvc-0.53.0.sha256sum] =3D &quot;581fee95406bb13382d2=
f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d&quot;<br>
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D &quot;147a5c80aabfbf0c7d9=
01cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78&quot;<br>
+SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] =3D &quot;2e55b5ac9ea33f2fc17=
16d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba&quot;<br>
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D &quot;24d5b23dc417412=
679681396f2b49f3de8c1473deb516bd34410872eff51ed0d&quot;<br>
+SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] =3D &quot;0a6e035dd059926=
7ce1ee132e51c27dd29437f63325753051e71dd9e42406c57&quot;<br>
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D &quot;589f6da84c64620474=
7d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec&quot;<br>
+SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] =3D &quot;271414315aff873873=
82ec3d271b52d7ae78726f5d44ac98b4f4030c91880486&quot;<br>
+SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] =3D &quot;6f42320e61fe2cfd34354ec=
b597f86f413484a798ba44a8ca1165c58d42da6c1&quot;<br>
diff --git a/meta-oe/recipes-extended/fd-find/<a href=3D"http://fd-find_10.=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">fd-find_10.3.0.bb</a> b/meta-o=
e/recipes-extended/fd-find/<a href=3D"http://fd-find_10.3.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">fd-find_10.3.0.bb</a><br>
new file mode 100644<br>
index 0000000000..3df88c88b0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/fd-find/<a href=3D"http://fd-find_10.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">fd-find_10.3.0.bb</a><br>
@@ -0,0 +1,28 @@<br>
+SUMMARY =3D &quot;fd is a simple, fast and user-friendly alternative to fi=
nd.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://crates.io/crates/fd-find" rel=3D"nor=
eferrer" target=3D"_blank">https://crates.io/crates/fd-find</a>&quot;<br>
+DESCRIPTION =3D &quot;fd is a program to find entries in your filesystem. =
It \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is a simple, fast a=
nd user-friendly alternative to find. \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0While it does not a=
im to support all of find&#39;s powerful \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0functionality, it p=
rovides sensible (opinionated) defaults \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for a majority of u=
se cases.&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot; \<br>
+=C2=A0 =C2=A0 file://LICENSE-MIT;md5=3D96713c739748a44f86272791c89ce344 \<=
br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;crate://<a href=3D"http://crates.io/fd-find/$%7BPV%7D;na=
me=3Dfd-find" rel=3D"noreferrer" target=3D"_blank">crates.io/fd-find/${PV};=
name=3Dfd-find</a>&quot;<br>
+SRC_URI[fd-find.sha256sum] =3D &quot;2fbf004b5bbdefab92e76237e2022c77842cd=
ef5d3213fe09fd804e0474785db&quot;<br>
+S =3D &quot;${CARGO_VENDORING_DIRECTORY}/fd-find-${PV}&quot;<br>
+<br>
+inherit cargo cargo-update-recipe-crates<br>
+<br>
+#Upstream fd-find sets strip =3D true in [profile.release], which causes C=
argo <br>
+#to strip the binary during compilation. This interferes with Yocto=E2=80=
=99s normal <br>
+#do_package stripping process.By adding the following flag, we ensure that=
 <br>
+#stripping is handled by Yocto as usual:<br>
+CARGO_BUILD_FLAGS +=3D &quot; --config profile.release.strip=3Dfalse&quot;=
<br>
+<br>
+require ${BPN}-crates.inc<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122402): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122402" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122402</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116691252/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116691252/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003e8e3906459ccce6--

