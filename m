Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9E4FD4F19
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 19:21:34 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3523.1773170489707342540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 12:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NmuGqT5G;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-467166cb638so827164b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773170489; cv=none;
        d=google.com; s=arc-20240605;
        b=fiBe9yVefYLXjdZndpnmVczHa4fvG1hwcYbsdCHBY/w9xmUrvGkaSoFl+lFGEPfB9N
         +4Eeof0MqgpTxg7LLFOAKhNqJ7x7GahxQchXtGxl+ElPdRf5O6rjQ4jY1P94E14wyzog
         n4Fk1xVBHhj81u1bh80t8s2THA0+Szr2HUoyiYy9CqaOrjcSWj/4WeEuNOowi8gylvyf
         MgqczxF/FNWBa/xSCgizOJrH2NNrjAruTCv6EldSA0CDaJu0t6ckH8sYX8Wd2jbvY9HZ
         k/P53auCG78GB/444XEU/zp82GLzuKD7nvK0K1uUxDGAFNjmKnoMk/Icrk5ETI+nLkmN
         Rx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIdd/jvHjJGAGJXLNRxkdgCHhSjMDyVNk5sPrrTV8Ys=;
        fh=C4ciNbBdVkQJDei1PMNeeNJKj9MzM5U4LKpTwY08/xc=;
        b=jkgtiIjs7UfPX9uZg1ntdrVcmMVMEimkiVtkfz8BnhOSUV81Rmxs938wQxa28v6yet
         4oxMoxiJMZxppHYrUNS2MtfKJPT0X6CZ2ITr5Qlw6SmKxjRKdtjwLD6gpycfjxS0ufjH
         n0+e/5LucbM82lrwsPjQ0cUd+eekRJHyHErba67RIZ4NxImCeSj6JKCn57x0KPVZTiXl
         qY17XCe7BQZDWMj2FhKeb//hR4+Jo57Cg6KWbqBxPHNm8U7AIHXPhVztTc664x0bpown
         ufaMfEhEjGJoj1cq93upDeeqI7ryk2U6Gzv+32QBBZ8aYqEOyn6vHA1vQJFEcPR8PYH1
         YKoQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170489; x=1773775289; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIdd/jvHjJGAGJXLNRxkdgCHhSjMDyVNk5sPrrTV8Ys=;
        b=NmuGqT5Go8BUM2wDc851maZ1YOaoeoXVvGmoz/Simy4jUxZkf6gcST8JuEd73iV+HD
         5Y5M/TBg9ukX2jjR541UyWs/UoUEzimzD+lyvNi/b2D1n6lZ/xhr4y47NBpR1KGwJhia
         4pYCvuYQr8uHTsaRWO3wsVYz7rKxRC1DnKtjfMpcySbp6oCtbIt4C8JJisfVRbPA2slm
         +TI3WEYpgExEEs5XuB17Ahs8a/hYYa3MIq6AuSzWIBI05jHuTMZQeeQId1Gy3H46jUW2
         yxHi5AsVeul1Iz1w5Zg2WWOhFI4UWZUGju1JoHUKlZcfuwwvU3NT8VKDX+DawjQ2UcdA
         kTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170489; x=1773775289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cIdd/jvHjJGAGJXLNRxkdgCHhSjMDyVNk5sPrrTV8Ys=;
        b=S6rJSNz1rZ8V/5rAh0xIPm+HCV/rg5rzsm3oTqBfhDpGp6/jxCVitV7EXq1HZxT7Gu
         F8kvEFDLdKwaaADlVkZlRdlgbmgGoZiZpto914My9it0TqhQ+8Md1vtZt2UlBR5ljtG6
         ASLKWmpeBZtCl2JRTaBaHT+r+b15a5S4ADrWjKbkLPzVlpmqjA+Hvs2+gr+D3PBWLQ5H
         s2uHzmjnCbxmoA/CUzD3zFtdH1kTdvh2/bQVg+kCD3ON2/kyASg61jgUj6Y7179hnzXP
         tbJZmrKXWY1eijXeES1z47NNMa66UpUZL5HdQfwua8ZJq7t9UDEvK2OacM8+QFTtAa2b
         BlBQ==
X-Gm-Message-State: AOJu0YzMAIgVtG3bJmX3pRtb9D46UHlGCh0Fv748HPSCwripjRtFE2Ho
	es/MxCf7j+R/MT5n4lKaXQnuh+BVDynRn4q8wX3MGCIWDU9DMGOQQAbcCmvxeuzPL+DjM1vTHTd
	FEkD4MTWco/ADH09YPUzdelOTuhlCD5E=
X-Gm-Gg: ATEYQzzS+mtQVp3T3ce/KtEh7VxTQ+AHZtibknjZsPWwJHIhZ/0I32oQGrvAtYM/F/J
	lSRevU2d76AJIC+boKi6GxDr9hBpySn54NZ49zFLzqWW7UTfxbTUTUdIVDnLLrIwBiQ6u6ewIxd
	+rqU+x1hhNlNHNa2II7pEYdZatzlDwn/QNzzkHl5xJjbcLP9uPZz0387vdFq4pk/DB2JF9GhjNN
	pH7cpTPPbZXCCg9cTbtcUtNIdAPUW1G2inETTgcOgqZdfCELbIP0xRn0eQDPwpqi90ybtwD9EBT
	2aeqBxj5
X-Received: by 2002:a05:6870:a78e:b0:409:5239:e20c with SMTP id
 586e51a60fabf-4177c9fb9bdmr28745fac.53.1773170488096; Tue, 10 Mar 2026
 12:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260310145836.2204066-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260310145836.2204066-1-Deepesh.Varatharajan@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 11 Mar 2026 08:21:16 +1300
X-Gm-Features: AaiRm51ae3fW4TuDLdsv-wiW1_WFP6NYrvc6Ma8AJxM1BLv83TOeGUyAMy2xOAs
Message-ID: <CADySD0FwsnUSL=nBqmAfU3TKhG+Hw9RJ3x5NyE-9XwF4w+YuzA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: upgrade 0.6.0 -> 0.7.0
To: deepesh.varatharajan@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 19:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125038

On Wed, Mar 11, 2026 at 3:59=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Release notes:
> https://github.com/uutils/coreutils/releases/tag/0.6.0

It should be https://github.com/uutils/coreutils/releases/tag/0.7.0

>
> Changes are here:
> https://github.com/uutils/coreutils/compare/0.6.0...0.7.0
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../uutils-coreutils-crates.inc               | 330 +++++++++---------
>  ...ils_0.6.0.bb =3D> uutils-coreutils_0.7.0.bb} |   2 +-
>  2 files changed, 161 insertions(+), 171 deletions(-)
>  rename meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.6.0.bb =
=3D> uutils-coreutils_0.7.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crate=
s.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
> index 465f2262b6..0e842a9c91 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
> @@ -12,7 +12,7 @@ SRC_URI +=3D " \
>      crate://crates.io/anstyle-parse/0.2.7 \
>      crate://crates.io/anstyle-query/1.1.5 \
>      crate://crates.io/anstyle-wincon/3.0.11 \
> -    crate://crates.io/anyhow/1.0.100 \
> +    crate://crates.io/anyhow/1.0.101 \
>      crate://crates.io/approx/0.5.1 \
>      crate://crates.io/arrayref/0.3.9 \
>      crate://crates.io/arrayvec/0.7.6 \
> @@ -33,16 +33,16 @@ SRC_URI +=3D " \
>      crate://crates.io/bytecount/0.6.9 \
>      crate://crates.io/byteorder/1.5.0 \
>      crate://crates.io/calendrical_calculations/0.2.3 \
> -    crate://crates.io/cc/1.2.52 \
> +    crate://crates.io/cc/1.2.55 \
>      crate://crates.io/cexpr/0.6.0 \
>      crate://crates.io/cfg-if/1.0.4 \
>      crate://crates.io/cfg_aliases/0.2.1 \
>      crate://crates.io/chrono/0.4.43 \
>      crate://crates.io/clang-sys/1.8.1 \
> -    crate://crates.io/clap/4.5.56 \
> -    crate://crates.io/clap_builder/4.5.56 \
> -    crate://crates.io/clap_complete/4.5.65 \
> -    crate://crates.io/clap_lex/0.7.7 \
> +    crate://crates.io/clap/4.5.60 \
> +    crate://crates.io/clap_builder/4.5.60 \
> +    crate://crates.io/clap_complete/4.5.66 \
> +    crate://crates.io/clap_lex/1.0.0 \
>      crate://crates.io/clap_mangen/0.2.31 \
>      crate://crates.io/codspeed/4.3.0 \
>      crate://crates.io/codspeed-divan-compat/4.3.0 \
> @@ -73,9 +73,6 @@ SRC_URI +=3D " \
>      crate://crates.io/ctor/0.6.3 \
>      crate://crates.io/ctor-proc-macro/0.0.7 \
>      crate://crates.io/ctrlc/3.5.1 \
> -    crate://crates.io/darling/0.21.3 \
> -    crate://crates.io/darling_core/0.21.3 \
> -    crate://crates.io/darling_macro/0.21.3 \
>      crate://crates.io/data-encoding/2.10.0 \
>      crate://crates.io/data-encoding-macro/0.1.19 \
>      crate://crates.io/data-encoding-macro-internal/0.1.17 \
> @@ -100,24 +97,24 @@ SRC_URI +=3D " \
>      crate://crates.io/file_diff/1.0.0 \
>      crate://crates.io/filedescriptor/0.8.3 \
>      crate://crates.io/filetime/0.2.27 \
> -    crate://crates.io/find-msvc-tools/0.1.7 \
> +    crate://crates.io/find-msvc-tools/0.1.9 \
>      crate://crates.io/fixed_decimal/0.7.1 \
> -    crate://crates.io/flate2/1.1.8 \
> +    crate://crates.io/flate2/1.1.9 \
>      crate://crates.io/fluent/0.17.0 \
>      crate://crates.io/fluent-bundle/0.16.0 \
>      crate://crates.io/fluent-langneg/0.13.1 \
>      crate://crates.io/fluent-syntax/0.12.0 \
> -    crate://crates.io/fnv/1.0.7 \
>      crate://crates.io/foldhash/0.1.5 \
> +    crate://crates.io/foldhash/0.2.0 \
>      crate://crates.io/fs_extra/1.3.0 \
>      crate://crates.io/fsevent-sys/4.1.0 \
>      crate://crates.io/fts-sys/0.2.17 \
>      crate://crates.io/funty/2.0.0 \
> -    crate://crates.io/futures-core/0.3.31 \
> -    crate://crates.io/futures-macro/0.3.31 \
> -    crate://crates.io/futures-task/0.3.31 \
> +    crate://crates.io/futures-core/0.3.32 \
> +    crate://crates.io/futures-macro/0.3.32 \
> +    crate://crates.io/futures-task/0.3.32 \
>      crate://crates.io/futures-timer/3.0.3 \
> -    crate://crates.io/futures-util/0.3.31 \
> +    crate://crates.io/futures-util/0.3.32 \
>      crate://crates.io/gcd/2.3.0 \
>      crate://crates.io/generic-array/0.14.7 \
>      crate://crates.io/getrandom/0.2.17 \
> @@ -130,7 +127,7 @@ SRC_URI +=3D " \
>      crate://crates.io/hex/0.4.3 \
>      crate://crates.io/hex-literal/1.1.0 \
>      crate://crates.io/hostname/0.4.2 \
> -    crate://crates.io/iana-time-zone/0.1.64 \
> +    crate://crates.io/iana-time-zone/0.1.65 \
>      crate://crates.io/iana-time-zone-haiku/0.1.2 \
>      crate://crates.io/icu_calendar/2.1.1 \
>      crate://crates.io/icu_calendar_data/2.1.1 \
> @@ -154,9 +151,8 @@ SRC_URI +=3D " \
>      crate://crates.io/icu_provider/2.1.1 \
>      crate://crates.io/icu_time/2.1.1 \
>      crate://crates.io/icu_time_data/2.1.1 \
> -    crate://crates.io/ident_case/1.0.1 \
>      crate://crates.io/indexmap/2.13.0 \
> -    crate://crates.io/indicatif/0.18.3 \
> +    crate://crates.io/indicatif/0.18.4 \
>      crate://crates.io/inotify/0.11.0 \
>      crate://crates.io/inotify-sys/0.1.5 \
>      crate://crates.io/intl-memoizer/0.5.3 \
> @@ -166,30 +162,30 @@ SRC_URI +=3D " \
>      crate://crates.io/itertools/0.14.0 \
>      crate://crates.io/itoa/1.0.17 \
>      crate://crates.io/ixdtf/0.6.4 \
> -    crate://crates.io/jiff/0.2.18 \
> +    crate://crates.io/jiff/0.2.23 \
>      crate://crates.io/jiff-icu/0.2.2 \
> -    crate://crates.io/jiff-static/0.2.18 \
> +    crate://crates.io/jiff-static/0.2.23 \
>      crate://crates.io/jiff-tzdb/0.1.5 \
>      crate://crates.io/jiff-tzdb-platform/0.1.3 \
>      crate://crates.io/js-sys/0.3.85 \
> -    crate://crates.io/keccak/0.1.5 \
> +    crate://crates.io/keccak/0.1.6 \
>      crate://crates.io/kqueue/1.1.1 \
>      crate://crates.io/kqueue-sys/1.0.4 \
>      crate://crates.io/lazy_static/1.5.0 \
> -    crate://crates.io/libc/0.2.180 \
> +    crate://crates.io/libc/0.2.182 \
>      crate://crates.io/libloading/0.8.9 \
> -    crate://crates.io/libm/0.2.15 \
> +    crate://crates.io/libm/0.2.16 \
>      crate://crates.io/libredox/0.1.12 \
> -    crate://crates.io/linux-raw-sys/0.11.0 \
> +    crate://crates.io/linux-raw-sys/0.12.1 \
>      crate://crates.io/litemap/0.8.1 \
>      crate://crates.io/litrs/1.0.0 \
>      crate://crates.io/lock_api/0.4.14 \
>      crate://crates.io/log/0.4.29 \
> -    crate://crates.io/lru/0.12.5 \
> +    crate://crates.io/lru/0.16.3 \
>      crate://crates.io/lscolors/0.21.0 \
>      crate://crates.io/md-5/0.10.6 \
> -    crate://crates.io/memchr/2.7.6 \
> -    crate://crates.io/memmap2/0.9.9 \
> +    crate://crates.io/memchr/2.8.0 \
> +    crate://crates.io/memmap2/0.9.10 \
>      crate://crates.io/memoffset/0.9.1 \
>      crate://crates.io/minimal-lexical/0.2.1 \
>      crate://crates.io/miniz_oxide/0.8.9 \
> @@ -198,13 +194,13 @@ SRC_URI +=3D " \
>      crate://crates.io/nom/7.1.3 \
>      crate://crates.io/nom/8.0.0 \
>      crate://crates.io/notify/8.2.0 \
> -    crate://crates.io/notify-types/2.0.0 \
> +    crate://crates.io/notify-types/2.1.0 \
>      crate://crates.io/nu-ansi-term/0.50.3 \
>      crate://crates.io/num-bigint/0.4.6 \
> -    crate://crates.io/num-conv/0.1.0 \
> +    crate://crates.io/num-conv/0.2.0 \
>      crate://crates.io/num-integer/0.1.46 \
> -    crate://crates.io/num-modular/0.5.1 \
> -    crate://crates.io/num-prime/0.4.4 \
> +    crate://crates.io/num-modular/0.6.1 \
> +    crate://crates.io/num-prime/0.5.0 \
>      crate://crates.io/num-traits/0.2.19 \
>      crate://crates.io/num_threads/0.1.7 \
>      crate://crates.io/objc2/0.6.3 \
> @@ -218,17 +214,16 @@ SRC_URI +=3D " \
>      crate://crates.io/outref/0.5.2 \
>      crate://crates.io/parking_lot/0.12.5 \
>      crate://crates.io/parking_lot_core/0.9.12 \
> -    crate://crates.io/parse_datetime/0.13.3 \
> +    crate://crates.io/parse_datetime/0.14.0 \
>      crate://crates.io/phf/0.13.1 \
>      crate://crates.io/phf_codegen/0.13.1 \
>      crate://crates.io/phf_generator/0.13.1 \
>      crate://crates.io/phf_shared/0.13.1 \
>      crate://crates.io/pin-project-lite/0.2.16 \
> -    crate://crates.io/pin-utils/0.1.0 \
>      crate://crates.io/pkg-config/0.3.32 \
>      crate://crates.io/platform-info/2.0.5 \
> -    crate://crates.io/portable-atomic/1.13.0 \
> -    crate://crates.io/portable-atomic-util/0.2.4 \
> +    crate://crates.io/portable-atomic/1.13.1 \
> +    crate://crates.io/portable-atomic-util/0.2.5 \
>      crate://crates.io/potential_utf/0.1.4 \
>      crate://crates.io/powerfmt/0.2.0 \
>      crate://crates.io/ppv-lite86/0.2.21 \
> @@ -238,7 +233,7 @@ SRC_URI +=3D " \
>      crate://crates.io/proc-macro2/1.0.106 \
>      crate://crates.io/procfs/0.18.0 \
>      crate://crates.io/procfs-core/0.18.0 \
> -    crate://crates.io/quote/1.0.44 \
> +    crate://crates.io/quote/1.0.45 \
>      crate://crates.io/r-efi/5.3.0 \
>      crate://crates.io/radium/0.7.0 \
>      crate://crates.io/rand/0.8.5 \
> @@ -251,10 +246,10 @@ SRC_URI +=3D " \
>      crate://crates.io/rayon-core/1.13.0 \
>      crate://crates.io/redox_syscall/0.5.18 \
>      crate://crates.io/redox_syscall/0.7.0 \
> -    crate://crates.io/regex/1.12.2 \
> -    crate://crates.io/regex-automata/0.4.13 \
> -    crate://crates.io/regex-lite/0.1.8 \
> -    crate://crates.io/regex-syntax/0.8.8 \
> +    crate://crates.io/regex/1.12.3 \
> +    crate://crates.io/regex-automata/0.4.14 \
> +    crate://crates.io/regex-lite/0.1.9 \
> +    crate://crates.io/regex-syntax/0.8.9 \
>      crate://crates.io/relative-path/1.9.3 \
>      crate://crates.io/rlimit/0.11.0 \
>      crate://crates.io/roff/0.2.2 \
> @@ -263,12 +258,12 @@ SRC_URI +=3D " \
>      crate://crates.io/rust-ini/0.21.3 \
>      crate://crates.io/rustc-hash/2.1.1 \
>      crate://crates.io/rustc_version/0.4.1 \
> -    crate://crates.io/rustix/1.1.3 \
> +    crate://crates.io/rustix/1.1.4 \
>      crate://crates.io/rustversion/1.0.22 \
>      crate://crates.io/same-file/1.0.6 \
>      crate://crates.io/scopeguard/1.2.0 \
>      crate://crates.io/self_cell/1.2.2 \
> -    crate://crates.io/selinux/0.5.2 \
> +    crate://crates.io/selinux/0.6.0 \
>      crate://crates.io/selinux-sys/0.6.15 \
>      crate://crates.io/semver/1.0.27 \
>      crate://crates.io/serde/1.0.228 \
> @@ -280,16 +275,15 @@ SRC_URI +=3D " \
>      crate://crates.io/sha3/0.10.8 \
>      crate://crates.io/shlex/1.3.0 \
>      crate://crates.io/signal-hook/0.3.18 \
> -    crate://crates.io/signal-hook/0.4.3 \
>      crate://crates.io/signal-hook-mio/0.2.5 \
>      crate://crates.io/signal-hook-registry/1.4.8 \
>      crate://crates.io/simd-adler32/0.3.8 \
> -    crate://crates.io/siphasher/1.0.1 \
> -    crate://crates.io/slab/0.4.11 \
> +    crate://crates.io/siphasher/1.0.2 \
> +    crate://crates.io/slab/0.4.12 \
>      crate://crates.io/sm3/0.4.2 \
>      crate://crates.io/smallvec/1.15.1 \
>      crate://crates.io/smawk/0.3.2 \
> -    crate://crates.io/socket2/0.6.1 \
> +    crate://crates.io/socket2/0.6.2 \
>      crate://crates.io/spin/0.10.0 \
>      crate://crates.io/stable_deref_trait/1.2.1 \
>      crate://crates.io/statrs/0.18.0 \
> @@ -298,23 +292,23 @@ SRC_URI +=3D " \
>      crate://crates.io/syn/2.0.114 \
>      crate://crates.io/synstructure/0.13.2 \
>      crate://crates.io/tap/1.0.1 \
> -    crate://crates.io/tempfile/3.24.0 \
> +    crate://crates.io/tempfile/3.26.0 \
>      crate://crates.io/terminal_size/0.4.3 \
>      crate://crates.io/textwrap/0.16.2 \
>      crate://crates.io/thiserror/1.0.69 \
>      crate://crates.io/thiserror/2.0.18 \
>      crate://crates.io/thiserror-impl/1.0.69 \
>      crate://crates.io/thiserror-impl/2.0.18 \
> -    crate://crates.io/time/0.3.45 \
> -    crate://crates.io/time-core/0.1.7 \
> -    crate://crates.io/time-macros/0.2.25 \
> +    crate://crates.io/time/0.3.47 \
> +    crate://crates.io/time-core/0.1.8 \
> +    crate://crates.io/time-macros/0.2.27 \
>      crate://crates.io/tiny-keccak/2.0.2 \
>      crate://crates.io/tinystr/0.8.2 \
>      crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
>      crate://crates.io/toml_edit/0.23.10+spec-1.0.0 \
>      crate://crates.io/toml_parser/1.0.6+spec-1.1.0 \
>      crate://crates.io/type-map/0.5.1 \
> -    crate://crates.io/typed-path/0.12.0 \
> +    crate://crates.io/typed-path/0.12.2 \
>      crate://crates.io/typenum/1.19.0 \
>      crate://crates.io/unic-langid/0.9.6 \
>      crate://crates.io/unic-langid-impl/0.9.6 \
> @@ -329,13 +323,13 @@ SRC_URI +=3D " \
>      crate://crates.io/utf8parse/0.2.2 \
>      crate://crates.io/utmp-classic/0.1.6 \
>      crate://crates.io/utmp-classic-raw/0.1.3 \
> -    crate://crates.io/uuid/1.19.0 \
> +    crate://crates.io/uuid/1.20.0 \
>      crate://crates.io/uutils_term_grid/0.7.0 \
>      crate://crates.io/version_check/0.9.5 \
>      crate://crates.io/vsimd/0.8.0 \
>      crate://crates.io/walkdir/2.5.0 \
>      crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
> -    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
> +    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
>      crate://crates.io/wasm-bindgen/0.2.108 \
>      crate://crates.io/wasm-bindgen-macro/0.2.108 \
>      crate://crates.io/wasm-bindgen-macro-support/0.2.108 \
> @@ -346,8 +340,6 @@ SRC_URI +=3D " \
>      crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
>      crate://crates.io/winapi-util/0.1.11 \
>      crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> -    crate://crates.io/wincode/0.2.5 \
> -    crate://crates.io/wincode-derive/0.2.3 \
>      crate://crates.io/windows-core/0.62.2 \
>      crate://crates.io/windows-implement/0.60.2 \
>      crate://crates.io/windows-interface/0.59.3 \
> @@ -376,7 +368,7 @@ SRC_URI +=3D " \
>      crate://crates.io/windows_x86_64_msvc/0.52.6 \
>      crate://crates.io/windows_x86_64_msvc/0.53.1 \
>      crate://crates.io/winnow/0.7.14 \
> -    crate://crates.io/wit-bindgen/0.46.0 \
> +    crate://crates.io/wit-bindgen/0.51.0 \
>      crate://crates.io/write16/1.0.0 \
>      crate://crates.io/writeable/0.6.2 \
>      crate://crates.io/wyz/0.5.1 \
> @@ -384,19 +376,19 @@ SRC_URI +=3D " \
>      crate://crates.io/yansi/1.0.1 \
>      crate://crates.io/yoke/0.8.1 \
>      crate://crates.io/yoke-derive/0.8.1 \
> -    crate://crates.io/z85/3.0.6 \
> +    crate://crates.io/z85/3.0.7 \
>      crate://crates.io/zerocopy/0.7.35 \
> -    crate://crates.io/zerocopy/0.8.33 \
> +    crate://crates.io/zerocopy/0.8.39 \
>      crate://crates.io/zerocopy-derive/0.7.35 \
> -    crate://crates.io/zerocopy-derive/0.8.33 \
> +    crate://crates.io/zerocopy-derive/0.8.39 \
>      crate://crates.io/zerofrom/0.1.6 \
>      crate://crates.io/zerofrom-derive/0.1.6 \
>      crate://crates.io/zerotrie/0.2.3 \
>      crate://crates.io/zerovec/0.11.5 \
>      crate://crates.io/zerovec-derive/0.11.2 \
> -    crate://crates.io/zip/7.2.0 \
> -    crate://crates.io/zlib-rs/0.5.5 \
> -    crate://crates.io/zmij/1.0.14 \
> +    crate://crates.io/zip/8.2.0 \
> +    crate://crates.io/zlib-rs/0.6.0 \
> +    crate://crates.io/zmij/1.0.19 \
>      crate://crates.io/zopfli/0.8.3 \
>  "
>
> @@ -410,7 +402,7 @@ SRC_URI[anstyle-1.0.13.sha256sum] =3D "5192cca8006f1f=
d4f7237516f40fa183bb07f8fbdfe
>  SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D "4e7644824f0aa2c7b9384579234e=
f10eb7efb6a0deb83f9630a49594dd9c15c2"
>  SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc64099a=
bca73db4166ad86ea0b4341abe65af83dadc"
>  SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb8=
898808a366d8f9f58ce16d1f538353ad55747d"
> -SRC_URI[anyhow-1.0.100.sha256sum] =3D "a23eb6b1614318a8071c9b2521f36b424=
b2c83db5eb3a0fead4a6c0809af6e61"
> +SRC_URI[anyhow-1.0.101.sha256sum] =3D "5f0e0fee31ef5ed1ba1316088939cea39=
9010ed7731dba877ed44aeb407a75ea"
>  SRC_URI[approx-0.5.1.sha256sum] =3D "cab112f0a86d568ea0e627cc1d6be74a1e9=
cd55214684db5561995f6dad897c6"
>  SRC_URI[arrayref-0.3.9.sha256sum] =3D "76a2e8124351fda1ef8aaaa3bbd7ebbcb=
486bbcd4225aca0aa0d84bb2db8fecb"
>  SRC_URI[arrayvec-0.7.6.sha256sum] =3D "7c02d123df017efcdfbd739ef81735b36=
c5ba83ec3c59c80a9d7ecc718f92e50"
> @@ -431,16 +423,16 @@ SRC_URI[bumpalo-3.19.1.sha256sum] =3D "5dd9dc738b7a=
8311c7ade152424974d8115f2cdad61
>  SRC_URI[bytecount-0.6.9.sha256sum] =3D "175812e0be2bccb6abe50bb8d5661261=
98344f707e304f45c648fd8f2cc0365e"
>  SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf=
353beff7305ebd1ae69500e27c67f64b"
>  SRC_URI[calendrical_calculations-0.2.3.sha256sum] =3D "3a0b39595c6ee54a8=
d0900204ba4c401d0ab4eb45adaf07178e8d017541529e7"
> -SRC_URI[cc-1.2.52.sha256sum] =3D "cd4932aefd12402b36c60956a4fe0035421f54=
4799057659ff86f923657aada3"
> +SRC_URI[cc-1.2.55.sha256sum] =3D "47b26a0954ae34af09b50f0de26458fa95369a=
0d478d8236d3f93082b219bd29"
>  SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb62=
9900026402633ae9160df93a8766"
>  SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef35111825=
727b38d33286ef986142615121801"
>  SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb0=
82c5994d996f20b8b159f2ad1658eb5724"
>  SRC_URI[chrono-0.4.43.sha256sum] =3D "fac4744fb15ae8337dc853fee7fb3f4e48=
c0fbaa23d0afe49c447b4fab126118"
>  SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd6=
19ad4718dcaa767947df1cadb14f39f4"
> -SRC_URI[clap-4.5.56.sha256sum] =3D "a75ca66430e33a14957acc24c5077b503e7d=
374151b2b4b3a10c83b4ceb4be0e"
> -SRC_URI[clap_builder-4.5.56.sha256sum] =3D "793207c7fa6300a0608d1080b858=
e5fdbe713cdc1c8db9fb17777d8a13e63df0"
> -SRC_URI[clap_complete-4.5.65.sha256sum] =3D "430b4dc2b5e3861848de79627b2=
bedc9f3342c7da5173a14eaa5d0f8dc18ae5d"
> -SRC_URI[clap_lex-0.7.7.sha256sum] =3D "c3e64b0cc0439b12df2fa678eae89a1c5=
6a529fd067a9115f7827f1fffd22b32"
> +SRC_URI[clap-4.5.60.sha256sum] =3D "2797f34da339ce31042b27d23607e0517861=
32987f595b02ba4f6a6dffb7030a"
> +SRC_URI[clap_builder-4.5.60.sha256sum] =3D "24a241312cea5059b13574bb9b38=
61cabf758b879c15190b37b6d6fd63ab6876"
> +SRC_URI[clap_complete-4.5.66.sha256sum] =3D "c757a3b7e39161a4e56f9365141=
ada2a6c915a8622c408ab6bb4b5d047371031"
> +SRC_URI[clap_lex-1.0.0.sha256sum] =3D "3a822ea5bc7590f9d40f1ba12c0dc3c27=
60f3482c6984db1573ad11031420831"
>  SRC_URI[clap_mangen-0.2.31.sha256sum] =3D "439ea63a92086df93893164221ad4=
f24142086d535b3a0957b9b9bea2dc86301"
>  SRC_URI[codspeed-4.3.0.sha256sum] =3D "38c2eb3388ebe26b5a0ab6bf4969d9c48=
40143d7f6df07caa3cc851b0606cef6"
>  SRC_URI[codspeed-divan-compat-4.3.0.sha256sum] =3D "b2de65b7489a59709724=
d489070c6d05b7744039e4bf751d0a2006b90bb5593d"
> @@ -471,9 +463,6 @@ SRC_URI[crypto-common-0.1.7.sha256sum] =3D "78c829205=
5d1c1df0cce5d180393dc8cce0abe
>  SRC_URI[ctor-0.6.3.sha256sum] =3D "424e0138278faeb2b401f174ad17e715c8295=
12d74f3d1e81eb43365c2e0590e"
>  SRC_URI[ctor-proc-macro-0.0.7.sha256sum] =3D "52560adf09603e58c9a7ee1fe1=
dcb95a16927b17c127f0ac02d6e768a0e25bc1"
>  SRC_URI[ctrlc-3.5.1.sha256sum] =3D "73736a89c4aff73035ba2ed2e565061954da=
00d4970fc9ac25dcc85a2a20d790"
> -SRC_URI[darling-0.21.3.sha256sum] =3D "9cdf337090841a411e2a7f3deb9187445=
851f91b309c0c0a29e05f74a00a48c0"
> -SRC_URI[darling_core-0.21.3.sha256sum] =3D "1247195ecd7e3c85f83c8d2a366e=
4210d588e802133e1e355180a9870b517ea4"
> -SRC_URI[darling_macro-0.21.3.sha256sum] =3D "d38308df82d1080de0afee5d069=
fa14b0326a88c14f15c5ccda35b4a6c414c81"
>  SRC_URI[data-encoding-2.10.0.sha256sum] =3D "d7a1e2f27636f116493b8b860f5=
546edb47c8d8f8ea73e1d2a20be88e28d1fea"
>  SRC_URI[data-encoding-macro-0.1.19.sha256sum] =3D "8142a83c17aa9461d637e=
649271eae18bf2edd00e91f2e105df36c3c16355bdb"
>  SRC_URI[data-encoding-macro-internal-0.1.17.sha256sum] =3D "7ab67060fc6b=
8ef687992d439ca0fa36e7ed17e9a0b16b25b601e8757df720de"
> @@ -498,24 +487,24 @@ SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50=
d72f9059c3b6d82c0463f2ff062c9e9
>  SRC_URI[file_diff-1.0.0.sha256sum] =3D "31a7a908b8f32538a2143e59a6e4e250=
8988832d5d4d6f7c156b3cbc762643a5"
>  SRC_URI[filedescriptor-0.8.3.sha256sum] =3D "e40758ed24c9b2eeb76c35fb0ae=
bc66c626084edd827e07e1552279814c6682d"
>  SRC_URI[filetime-0.2.27.sha256sum] =3D "f98844151eee8917efc50bd9e8318cb9=
63ae8b297431495d3f758616ea5c57db"
> -SRC_URI[find-msvc-tools-0.1.7.sha256sum] =3D "f449e6c6c08c865631d4890cfa=
cf252b3d396c9bcc83adb6623cdb02a8336c41"
> +SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D "5baebc0774151f905a1a2cc419=
89300b1e6fbb29aff0ceffa1064fdd3088d582"
>  SRC_URI[fixed_decimal-0.7.1.sha256sum] =3D "35eabf480f94d69182677e37571d=
3be065822acfafd12f2f085db44fbbcc8e57"
> -SRC_URI[flate2-1.1.8.sha256sum] =3D "b375d6465b98090a5f25b1c7703f3859783=
755aa9a80433b36e0379a3ec2f369"
> +SRC_URI[flate2-1.1.9.sha256sum] =3D "843fba2746e448b37e26a819579957415c8=
cef339bf08564fe8b7ddbd959573c"
>  SRC_URI[fluent-0.17.0.sha256sum] =3D "8137a6d5a2c50d6b0ebfcb9aaa91a28154=
e0a70605f112d30cb0cd4a78670477"
>  SRC_URI[fluent-bundle-0.16.0.sha256sum] =3D "01203cb8918f5711e73891b3478=
16d932046f95f54207710bda99beaeb423bf4"
>  SRC_URI[fluent-langneg-0.13.1.sha256sum] =3D "7eebbe59450baee8282d71676f=
3bfed5689aeab00b27545e83e5f14b1195e8b0"
>  SRC_URI[fluent-syntax-0.12.0.sha256sum] =3D "54f0d287c53ffd184d04d8677f5=
90f4ac5379785529e5e08b1c8083acdd5c198"
> -SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2=
da24a9afd88aca000531ab82c1"
>  SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca40=
b39fe946cbe4c263c7209467bc83af2"
> +SRC_URI[foldhash-0.2.0.sha256sum] =3D "77ce24cb58228fbb8aa041425bb105085=
0ac19177686ea6e0f41a70416f56fdb"
>  SRC_URI[fs_extra-1.3.0.sha256sum] =3D "42703706b716c37f96a77aea830392ad2=
31f44c9e9a67872fa5548707e11b11c"
>  SRC_URI[fsevent-sys-4.1.0.sha256sum] =3D "76ee7a02da4d231650c7cea31349b8=
89be2f45ddb3ef3032d2ec8185f6313fd2"
>  SRC_URI[fts-sys-0.2.17.sha256sum] =3D "9c03259139c9b098dd92241b046fedfee=
bcd6b000d491c821b24ced28558a9c2"
>  SRC_URI[funty-2.0.0.sha256sum] =3D "e6d5a32815ae3f33302d95fdcb2ce17862f8=
c65363dcfd29360480ba1001fc9c"
> -SRC_URI[futures-core-0.3.31.sha256sum] =3D "05f29059c0c2090612e8d742178b=
0580d2dc940c837851ad723096f87af6663e"
> -SRC_URI[futures-macro-0.3.31.sha256sum] =3D "162ee34ebcb7c64a8abebc059ce=
0fee27c2262618d7b60ed8faf72fef13c3650"
> -SRC_URI[futures-task-0.3.31.sha256sum] =3D "f90f7dce0722e95104fcb0955859=
10c0977252f286e354b5e3bd38902cd99988"
> +SRC_URI[futures-core-0.3.32.sha256sum] =3D "7e3450815272ef58cec6d564423f=
6e755e25379b217b0bc688e295ba24df6b1d"
> +SRC_URI[futures-macro-0.3.32.sha256sum] =3D "e835b70203e41293343137df5c0=
664546da5745f82ec9b84d40be8336958447b"
> +SRC_URI[futures-task-0.3.32.sha256sum] =3D "037711b3d59c33004d3856fbdc83=
b99d4ff37a24768fa1be9ce3538a1cde4393"
>  SRC_URI[futures-timer-3.0.3.sha256sum] =3D "f288b0a4f20f9a56b5d1da57e222=
7c661b7b16168e2f72365f57b63326e29b24"
> -SRC_URI[futures-util-0.3.31.sha256sum] =3D "9fa08315bb612088cc391249efdc=
3bc77536f16c91f6cf495e6fbe85b20a4a81"
> +SRC_URI[futures-util-0.3.32.sha256sum] =3D "389ca41296e6190b48053de0321d=
02a77f32f8a5d2461dd38762c0593805c6d6"
>  SRC_URI[gcd-2.3.0.sha256sum] =3D "1d758ba1b47b00caf47f24925c0074ecb20d6d=
fcffe7f6d53395c0465674841a"
>  SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf27=
4ad91c288277713d9c18820d8499a7ff69e9a"
>  SRC_URI[getrandom-0.2.17.sha256sum] =3D "ff2abc00be7fca6ebc474524697ae27=
6ad847ad0a6b3faa4bcb027e9a4614ad0"
> @@ -528,7 +517,7 @@ SRC_URI[hashbrown-0.16.1.sha256sum] =3D "841d1cc9bed7=
f9236f321df977030373f4a4163ae
>  SRC_URI[hex-0.4.3.sha256sum] =3D "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e=
486a595ed5fd8f86ba55232a70"
>  SRC_URI[hex-literal-1.1.0.sha256sum] =3D "e712f64ec3850b98572bffac52e2c6=
f282b29fe6c5fa6d42334b30be438d95c1"
>  SRC_URI[hostname-0.4.2.sha256sum] =3D "617aaa3557aef3810a6369d0a99fac8a0=
80891b68bd9f9812a1eeda0c0730cbd"
> -SRC_URI[iana-time-zone-0.1.64.sha256sum] =3D "33e57f83510bb73707521ebaff=
a789ec8caf86f9657cad665b092b581d40e9fb"
> +SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9=
ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
>  SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590=
ba56d5d2d085f558508192593743f16b2306495269f"
>  SRC_URI[icu_calendar-2.1.1.sha256sum] =3D "d6f0e52e009b6b16ba9c069357879=
6f2dd4aaa59a7f8f920423706714a89ac4e"
>  SRC_URI[icu_calendar_data-2.1.1.sha256sum] =3D "527f04223b17edfe0bd43baf=
14a0cb1b017830db65f3950dc00224860a9a446d"
> @@ -552,9 +541,8 @@ SRC_URI[icu_properties_data-2.1.2.sha256sum] =3D "616=
c294cf8d725c6afcd8f55abc17c56
>  SRC_URI[icu_provider-2.1.1.sha256sum] =3D "85962cf0ce02e1e0a629cc34e7ca3=
e373ce20dda4c4d7294bbd0bf1fdb59e614"
>  SRC_URI[icu_time-2.1.1.sha256sum] =3D "8242b00da3b3b6678f731437a11c8833a=
43c821ae081eca60ba1b7579d45b6d8"
>  SRC_URI[icu_time_data-2.1.1.sha256sum] =3D "3e10b0e5e87a2c84bd5fa4077057=
32052edebe69291d347d0c3033785470edbf"
> -SRC_URI[ident_case-1.0.1.sha256sum] =3D "b9e0384b61958566e926dc50660321d=
12159025e767c18e043daf26b70104c39"
>  SRC_URI[indexmap-2.13.0.sha256sum] =3D "7714e70437a7dc3ac8eb7e6f8df75fd8=
eb422675fc7678aff7364301092b1017"
> -SRC_URI[indicatif-0.18.3.sha256sum] =3D "9375e112e4b463ec1b1c6c011953545=
c65a30164fbab5b581df32b3abf0dcb88"
> +SRC_URI[indicatif-0.18.4.sha256sum] =3D "25470f23803092da7d239834776d653=
104d551bc4d7eacaf31e6837854b8e9eb"
>  SRC_URI[inotify-0.11.0.sha256sum] =3D "f37dccff2791ab604f9babef0ba14fbe0=
be30bd368dc541e2b08d07c8aa908f3"
>  SRC_URI[inotify-sys-0.1.5.sha256sum] =3D "e05c02b5e89bff3b946cedeca278ab=
c628fe811e604f027c45a8aa3cf793d0eb"
>  SRC_URI[intl-memoizer-0.5.3.sha256sum] =3D "310da2e345f5eb861e7a07ee1822=
62e94975051db9e4223e909ba90f392f163f"
> @@ -564,30 +552,30 @@ SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc5=
2ee1a4949ceeb7dbc8a33f2d6c08819
>  SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488=
aabdbf3d2da73885b31bd0abd03351285"
>  SRC_URI[itoa-1.0.17.sha256sum] =3D "92ecc6618181def0457392ccd0ee51198e06=
5e016d1d527a7ac1b6dc7c1f09d2"
>  SRC_URI[ixdtf-0.6.4.sha256sum] =3D "84de9d95a6d2547d9b77ee3f25fa0ee32e3c=
3a6484d47a55adebc0439c077992"
> -SRC_URI[jiff-0.2.18.sha256sum] =3D "e67e8da4c49d6d9909fe03361f9b620f5889=
8859f5c7aded68351e85e71ecf50"
> +SRC_URI[jiff-0.2.23.sha256sum] =3D "1a3546dc96b6d42c5f24902af9e2538e82e3=
9ad350b0c766eb3fbf2d8f3d8359"
>  SRC_URI[jiff-icu-0.2.2.sha256sum] =3D "0e67c2beaae8b10a82d849b9aabb698a4=
3a682f32b17bcdc035d5ecadb44d646"
> -SRC_URI[jiff-static-0.2.18.sha256sum] =3D "e0c84ee7f197eca9a86c6fd6cb771=
e55eb991632f15f2bc3ca6ec838929e6e78"
> +SRC_URI[jiff-static-0.2.23.sha256sum] =3D "2a8c8b344124222efd714b73bb41f=
8b5120b27a7cc1c75593a6ff768d9d05aa4"
>  SRC_URI[jiff-tzdb-0.1.5.sha256sum] =3D "68971ebff725b9e2ca27a601c5eb38a4=
c5d64422c4cbab0c535f248087eda5c2"
>  SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D "875a5a69ac2bab1a891711c=
f5eccbec1ce0341ea805560dcd90b7a2e925132e8"
>  SRC_URI[js-sys-0.3.85.sha256sum] =3D "8c942ebf8e95485ca0d52d97da7c5a2c38=
7d0e7f0ba4c35e93bfcaee045955b3"
> -SRC_URI[keccak-0.1.5.sha256sum] =3D "ecc2af9a1119c51f12a14607e783cb977bd=
e58bc069ff0c3da1095e635d70654"
> +SRC_URI[keccak-0.1.6.sha256sum] =3D "cb26cec98cce3a3d96cbb7bced3c4b16e3d=
13f27ec56dbd62cbc8f39cfb9d653"
>  SRC_URI[kqueue-1.1.1.sha256sum] =3D "eac30106d7dce88daf4a3fcb4879ea93947=
6d5074a9b7ddd0fb97fa4bed5596a"
>  SRC_URI[kqueue-sys-1.0.4.sha256sum] =3D "ed9625ffda8729b85e45cf04090035a=
c368927b8cebc34898e7c120f52e4838b"
>  SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f3=
591312473c50c6685e1f298068316e66fe"
> -SRC_URI[libc-0.2.180.sha256sum] =3D "bcc35a38544a891a5f7c865aca548a982cc=
b3b8650a5b06d0fd33a10283c56fc"
> +SRC_URI[libc-0.2.182.sha256sum] =3D "6800badb6cb2082ffd7b6a67e6125bb39f1=
8782f793520caee8cb8846be06112"
>  SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa79=
a6ef5bb2fc834d6e9058e89c825efdc55"
> -SRC_URI[libm-0.2.15.sha256sum] =3D "f9fbbcab51052fe104eb5e5d351cf728d30a=
5be1fe14d9be8a3b097481fb97de"
> +SRC_URI[libm-0.2.16.sha256sum] =3D "b6d2cec3eae94f9f509c767b45932f1ada83=
50c4bdb85af2fcab4a3c14807981"
>  SRC_URI[libredox-0.1.12.sha256sum] =3D "3d0b95e02c851351f877147b7deea7b1=
afb1df71b63aa5f8270716e0c5720616"
> -SRC_URI[linux-raw-sys-0.11.0.sha256sum] =3D "df1d3c3b53da64cf5760482273a=
98e575c651a67eec7f77df96b5b642de8f039"
> +SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b2=
51670a91556f4144941d37452769c25d58a53"
>  SRC_URI[litemap-0.8.1.sha256sum] =3D "6373607a59f0be73a39b6fe456b8192fcc=
3585f602af20751600e974dd455e77"
>  SRC_URI[litrs-1.0.0.sha256sum] =3D "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0=
b9db1621bafc7ed66e35ff9fe092"
>  SRC_URI[lock_api-0.4.14.sha256sum] =3D "224399e74b87b5f3557511d98dff8b14=
089b3dadafcab6bb93eab67d3aace965"
>  SRC_URI[log-0.4.29.sha256sum] =3D "5e5032e24019045c762d3c0f28f5b6b8bbf38=
563a65908389bf7978758920897"
> -SRC_URI[lru-0.12.5.sha256sum] =3D "234cf4f4a04dc1f57e24b96cc0cd600cf2af4=
60d4161ac5ecdd0af8e1f3b2a38"
> +SRC_URI[lru-0.16.3.sha256sum] =3D "a1dc47f592c06f33f8e3aea9591776ec7c9f9=
e4124778ff8a3c3b87159f7e593"
>  SRC_URI[lscolors-0.21.0.sha256sum] =3D "d60e266dfb1426eb2d24792602e04113=
1fdc0236bb7007abc0e589acafd60929"
>  SRC_URI[md-5-0.10.6.sha256sum] =3D "d89e7ee0cfbedfc4da3340218492196241d8=
9eefb6dab27de5df917a6d2e78cf"
> -SRC_URI[memchr-2.7.6.sha256sum] =3D "f52b00d39961fc5b2736ea853c9cc86238e=
165017a493d1d5c8eac6bdc4cc273"
> -SRC_URI[memmap2-0.9.9.sha256sum] =3D "744133e4a0e0a658e1374cf3bf8e415c40=
52a15a111acd372764c55b4177d490"
> +SRC_URI[memchr-2.8.0.sha256sum] =3D "f8ca58f447f06ed17d5fc4043ce1b10dd20=
5e060fb3ce5b979b8ed8e59ff3f79"
> +SRC_URI[memmap2-0.9.10.sha256sum] =3D "714098028fe011992e1c3962653c96b2d=
578c4b4bce9036e15ff220319b1e0e3"
>  SRC_URI[memoffset-0.9.1.sha256sum] =3D "488016bfae457b036d996092f6cb4486=
77611ce4449e970ceaf42695203f218a"
>  SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
>  SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D "1fa76a2c86f704bdb222d66965fb3d=
63269ce38518b83cb0575fca855ebb6316"
> @@ -596,13 +584,13 @@ SRC_URI[nix-0.30.1.sha256sum] =3D "74523f3a35e05aba=
87a1d978330aef40f67b0304ac79c1c
>  SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c81=
72b73826411a55751e404a0a4a"
>  SRC_URI[nom-8.0.0.sha256sum] =3D "df9761775871bdef83bee530e60050f7e54b11=
05350d6884eb0fb4f46c2f9405"
>  SRC_URI[notify-8.2.0.sha256sum] =3D "4d3d07927151ff8575b7087f245456e549f=
ea62edf0ec4e565a5ee50c8402bc3"
> -SRC_URI[notify-types-2.0.0.sha256sum] =3D "5e0826a989adedc2a244799e823ae=
ce04662b66609d96af8dff7ac6df9a8925d"
> +SRC_URI[notify-types-2.1.0.sha256sum] =3D "42b8cfee0e339a0337359f3c88165=
702ac6e600dc01c0cc9579a92d62b08477a"
>  SRC_URI[nu-ansi-term-0.50.3.sha256sum] =3D "7957b9740744892f114936ab4a57=
b3f487491bbeafaf8083688b16841a4240e5"
>  SRC_URI[num-bigint-0.4.6.sha256sum] =3D "a5e44f723f1133c9deac646763579fd=
b3ac745e418f2a7af9cd0c431da1f20b9"
> -SRC_URI[num-conv-0.1.0.sha256sum] =3D "51d515d32fb182ee37cda2ccdcb92950d=
6a3c2893aa280e540671c2cd0f3b1d9"
> +SRC_URI[num-conv-0.2.0.sha256sum] =3D "cf97ec579c3c42f953ef76dbf8d55ac91=
fb219dde70e49aa4a6b7d74e9919050"
>  SRC_URI[num-integer-0.1.46.sha256sum] =3D "7969661fd2958a5cb096e56c8e1ad=
0444ac2bbcd0061bd28660485a44879858f"
> -SRC_URI[num-modular-0.5.1.sha256sum] =3D "64a5fe11d4135c3bcdf3a95b18b194=
afa9608a5f6ff034f5d857bc9a27fb0119"
> -SRC_URI[num-prime-0.4.4.sha256sum] =3D "e238432a7881ec7164503ccc516c014b=
f009be7984cde1ba56837862543bdec3"
> +SRC_URI[num-modular-0.6.1.sha256sum] =3D "17bb261bf36fa7d83f4c294f834e91=
256769097b3cb505d44831e0a179ac647f"
> +SRC_URI[num-prime-0.5.0.sha256sum] =3D "b285c575532a33ef6fdd3a57640d0b1c=
70e6ca48644d6df7bbd4b7a0cfbbb12d"
>  SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72=
ad0ffa95f0c74596bc250dcfd960262841"
>  SRC_URI[num_threads-0.1.7.sha256sum] =3D "5c7398b9c8b70908f6371f47ed3673=
7907c87c52af34c268fed0bf0ceb92ead9"
>  SRC_URI[objc2-0.6.3.sha256sum] =3D "b7c2599ce0ec54857b29ce62166b0ed9b4f6=
f1a70ccc9a71165b6154caca8c05"
> @@ -616,17 +604,16 @@ SRC_URI[os_display-0.1.4.sha256sum] =3D "ad5fd71b79=
026fb918650dde6d125000a233764f1
>  SRC_URI[outref-0.5.2.sha256sum] =3D "1a80800c0488c3a21695ea981a54918fbb3=
7abf04f4d0720c453632255e2ff0e"
>  SRC_URI[parking_lot-0.12.5.sha256sum] =3D "93857453250e3077bd71ff98b6a65=
ea6621a19bb0f559a85248955ac12c45a1a"
>  SRC_URI[parking_lot_core-0.9.12.sha256sum] =3D "2621685985a2ebf1c516881c=
026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
> -SRC_URI[parse_datetime-0.13.3.sha256sum] =3D "acea383beda9652270f3c9678d=
83aa58cbfc16880343cae0c0c8c7d6c0974132"
> +SRC_URI[parse_datetime-0.14.0.sha256sum] =3D "413775a7eac2261d2211a79d10=
ef275e5b6f7b527eec42ad09adce2ffa92b6e5"
>  SRC_URI[phf-0.13.1.sha256sum] =3D "c1562dc717473dbaa4c1f85a36410e03c047b=
2e7df7f45ee938fbef64ae7fadf"
>  SRC_URI[phf_codegen-0.13.1.sha256sum] =3D "49aa7f9d80421bca176ca8dbfebe6=
68cc7a2684708594ec9f3c0db0805d5d6e1"
>  SRC_URI[phf_generator-0.13.1.sha256sum] =3D "135ace3a761e564ec88c03a7731=
7a7c6b80bb7f7135ef2544dbe054243b89737"
>  SRC_URI[phf_shared-0.13.1.sha256sum] =3D "e57fef6bc5981e38c2ce2d63bfa546=
861309f875b8a75f092d1d54ae2d64f266"
>  SRC_URI[pin-project-lite-0.2.16.sha256sum] =3D "3b3cff922bd51709b605d9ea=
d9aa71031d81447142d828eb4a6eba76fe619f9b"
> -SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
>  SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c70=
4c14cd949e5e9a1ec5929a24fded1b904c"
>  SRC_URI[platform-info-2.0.5.sha256sum] =3D "7539aeb3fdd8cb4f6a331307cf71=
a1039cee75e94e8a71725b9484f4a0d9451a"
> -SRC_URI[portable-atomic-1.13.0.sha256sum] =3D "f89776e4d69bb58bc6993e99f=
fa1d11f228b839984854c7daeb5d37f87cbe950"
> -SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D "d8a2f0d8d040d7848a709=
caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
> +SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20=
cbe2f7accd12527ce60845ff44c153bb2a21b49"
> +SRC_URI[portable-atomic-util-0.2.5.sha256sum] =3D "7a9db96d7fa8782dd8c15=
ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
>  SRC_URI[potential_utf-0.1.4.sha256sum] =3D "b73949432f5e2a09657003c25bca=
5e19a0e9c84f8058ca374f49e0ebe605af77"
>  SRC_URI[powerfmt-0.2.0.sha256sum] =3D "439ee305def115ba05938db6eb1644ff9=
4165c5ab5e9420d1c1bcedbba909391"
>  SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc=
30deadb458a9b590d720cde2f2b1e97da9"
> @@ -636,7 +623,7 @@ SRC_URI[proc-macro-crate-3.4.0.sha256sum] =3D "219cb1=
9e96be00ab2e37d6e299658a0cfa8
>  SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b3261=
7f68fcb9fa3bb7640c23e9c748e53fb30934"
>  SRC_URI[procfs-0.18.0.sha256sum] =3D "25485360a54d6861439d60facef26de713=
b1e126bf015ec8f98239467a2b82f7"
>  SRC_URI[procfs-core-0.18.0.sha256sum] =3D "e6401bf7b6af22f78b563665d15a2=
2e9aef27775b79b149a66ca022468a4e405"
> -SRC_URI[quote-1.0.44.sha256sum] =3D "21b2ebcf727b7760c461f091f9f0f539b77=
b8e87f2fd88131e7f1b433b3cece4"
> +SRC_URI[quote-1.0.45.sha256sum] =3D "41f2619966050689382d2b44f664f4bc593=
e129785a36d6ee376ddf37259b924"
>  SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f=
6657d83847bdffdbd7f346754b0f"
>  SRC_URI[radium-0.7.0.sha256sum] =3D "dc33ff2d4973d518d823d61aa239014831e=
521c75da58e3df4840d3f47749d09"
>  SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f=
0a8b57c39049bef581b46327404"
> @@ -649,10 +636,10 @@ SRC_URI[rayon-1.11.0.sha256sum] =3D "368f01d005bf8f=
d9b1206fb6fa653e6c4a81ceb146640
>  SRC_URI[rayon-core-1.13.0.sha256sum] =3D "22e18b0f0062d30d4230b2e85ff77f=
dfe4326feb054b9783a3460d8435c8ab91"
>  SRC_URI[redox_syscall-0.5.18.sha256sum] =3D "ed2bf2547551a7053d6fdfafda3=
f938979645c44812fbfcda098faae3f1a362d"
>  SRC_URI[redox_syscall-0.7.0.sha256sum] =3D "49f3fe0889e69e2ae9e41f4d6c4c=
0181701d00e4697b356fb1f74173a5e0ee27"
> -SRC_URI[regex-1.12.2.sha256sum] =3D "843bc0191f75f3e22651ae5f1e72939ab2f=
72a4bc30fa80a066bd66edefc24d4"
> -SRC_URI[regex-automata-0.4.13.sha256sum] =3D "5276caf25ac86c8d810222b3db=
b938e512c55c6831a10f3e6ed1c93b84041f1c"
> -SRC_URI[regex-lite-0.1.8.sha256sum] =3D "8d942b98df5e658f56f20d592c7f868=
833fe38115e65c33003d8cd224b0155da"
> -SRC_URI[regex-syntax-0.8.8.sha256sum] =3D "7a2d987857b319362043e95f5353c=
0535c1f58eec5336fdfcf626430af7def58"
> +SRC_URI[regex-1.12.3.sha256sum] =3D "e10754a14b9137dd7b1e3e5b0493cc9171f=
dd105e0ab477f51b72e7f3ac0e276"
> +SRC_URI[regex-automata-0.4.14.sha256sum] =3D "6e1dd4122fc1595e8162618945=
476892eefca7b88c52820e74af6262213cae8f"
> +SRC_URI[regex-lite-0.1.9.sha256sum] =3D "cab834c73d247e67f4fae452806d17d=
3c7501756d98c8808d7c9c7aa7d18f973"
> +SRC_URI[regex-syntax-0.8.9.sha256sum] =3D "a96887878f22d7bad8a3b6dc5b744=
0e0ada9a245242924394987b21cf2210a4c"
>  SRC_URI[relative-path-1.9.3.sha256sum] =3D "ba39f3699c378cd8970968dcbff9=
c43159ea4cfbd88d43c00b22f2ef10a435d2"
>  SRC_URI[rlimit-0.11.0.sha256sum] =3D "f35ee2729c56bb610f6dba436bf78135f7=
28b7373bdffae2ec815b2d3eb98cc3"
>  SRC_URI[roff-0.2.2.sha256sum] =3D "88f8660c1ff60292143c98d08fc6e2f654d72=
2db50410e3f3797d40baaf9d8f3"
> @@ -661,12 +648,12 @@ SRC_URI[rstest_macros-0.26.1.sha256sum] =3D "9c8453=
11f0ff7951c5506121a9ad75aec44d0
>  SRC_URI[rust-ini-0.21.3.sha256sum] =3D "796e8d2b6696392a43bea58116b667fb=
4c29727dc5abd27d6acf338bb4f688c7"
>  SRC_URI[rustc-hash-2.1.1.sha256sum] =3D "357703d41365b4b27c590e3ed91eabb=
1b663f07c4c084095e60cbed4362dff0d"
>  SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d=
063319ebb6594faafcf1c225ea92ab6e9b92"
> -SRC_URI[rustix-1.1.3.sha256sum] =3D "146c9e247ccc180c1f61615433868c99f3d=
e3ae256a30a43b49f67c2d9171f34"
> +SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca=
828bd32cb7e408f0062e9930ba190"
>  SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a=
029961a8215f9619753635a9c0d2538d46d"
>  SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
>  SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59b=
ce7498c01bcc1502d7b9afe439a4e9f49"
>  SRC_URI[self_cell-1.2.2.sha256sum] =3D "b12e76d157a900eb52e81bc6e9f30693=
44290341720e9178cde2407113ac8d89"
> -SRC_URI[selinux-0.5.2.sha256sum] =3D "2ef2ca58174235414aee5465f5d8ef9f58=
33023b31484eb52ca505f306f4573c"
> +SRC_URI[selinux-0.6.0.sha256sum] =3D "7f4d7a0c34b924081f7fbdcb93121399f0=
d4182c0ec4bf9c01bfe4e7e21fcf16"
>  SRC_URI[selinux-sys-0.6.15.sha256sum] =3D "debaba5832b4831ffe0ba9118b526=
c752c960f41c46c4ef197d9a15f5179d6fd"
>  SRC_URI[semver-1.0.27.sha256sum] =3D "d767eb0aabc880b29956c35734170f26ed=
551a859dbd361d140cdbeca61ab1e2"
>  SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a91436=
180c5bb472411e48b5ec2e2124ae9e"
> @@ -678,16 +665,15 @@ SRC_URI[sha2-0.10.9.sha256sum] =3D "a7507d819769d01=
a365ab707794a4084392c824f54a7a6
>  SRC_URI[sha3-0.10.8.sha256sum] =3D "75872d278a8f37ef87fa0ddbda7802605cb1=
8344497949862c0d4dcb291eba60"
>  SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
>  SRC_URI[signal-hook-0.3.18.sha256sum] =3D "d881a16cf4426aa584979d30bd82c=
b33429027e42122b169753d6ef1085ed6e2"
> -SRC_URI[signal-hook-0.4.3.sha256sum] =3D "3b57709da74f9ff9f4a27dce9526ee=
c25ca8407c45a7887243b031a58935fb8e"
>  SRC_URI[signal-hook-mio-0.2.5.sha256sum] =3D "b75a19a7a740b25bc7944bdee6=
172368f988763b744e3d4dfe753f6b4ece40cc"
>  SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D "c4db69cba1110affc0e9f=
7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
>  SRC_URI[simd-adler32-0.3.8.sha256sum] =3D "e320a6c5ad31d271ad523dcf3ad13=
e2767ad8b1cb8f047f75a8aeaf8da139da2"
> -SRC_URI[siphasher-1.0.1.sha256sum] =3D "56199f7ddabf13fe5074ce809e7d3f42=
b42ae711800501b5b16ea82ad029c39d"
> -SRC_URI[slab-0.4.11.sha256sum] =3D "7a2ae44ef20feb57a68b23d846850f861394=
c2e02dc425a50098ae8c90267589"
> +SRC_URI[siphasher-1.0.2.sha256sum] =3D "b2aa850e253778c88a04c3d7323b043a=
eda9d3e30d5971937c1855769763678e"
> +SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc=
586479ce501c1d6d7da3cd8c9cf5"
>  SRC_URI[sm3-0.4.2.sha256sum] =3D "ebb9a3b702d0a7e33bc4d85a14456633d2b165=
c2ad839c5fd9a8417c1ab15860"
>  SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45=
c69e92af734b7aaddc05fb777b6fbd03"
>  SRC_URI[smawk-0.3.2.sha256sum] =3D "b7c388c1b5e93756d0c740965c41e8822f86=
6621d41acbdf6336a6a168f8840c"
> -SRC_URI[socket2-0.6.1.sha256sum] =3D "17129e116933cf371d018bb80ae557e889=
637989d8638274fb25622827b03881"
> +SRC_URI[socket2-0.6.2.sha256sum] =3D "86f4aa3ad99f2088c990dfa82d367e19cb=
29268ed67c574d10d0a4bfe71f07e0"
>  SRC_URI[spin-0.10.0.sha256sum] =3D "d5fe4ccb98d9c292d56fec89a5e07da7fc4c=
f0dc11e156b41793132775d3e591"
>  SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2be8dc25455e1f91df71=
bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
>  SRC_URI[statrs-0.18.0.sha256sum] =3D "2a3fe7c28c6512e766b0874335db33c94a=
d7b8f9054228ae1c2abd47ce7d335e"
> @@ -696,23 +682,23 @@ SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d=
9f2fcb837ea5d9e2628564b3b043a70
>  SRC_URI[syn-2.0.114.sha256sum] =3D "d4d107df263a3013ef9b1879b0df87d706ff=
80f65a86ea879bd9c31f9b307c2a"
>  SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7=
ae5ea60a4b5549c8a5914361c99147a709d2"
>  SRC_URI[tap-1.0.1.sha256sum] =3D "55937e1799185b12863d447f42597ed69d9928=
686b8d88a1df17376a097d8369"
> -SRC_URI[tempfile-3.24.0.sha256sum] =3D "655da9c7eb6305c55742045d5a8d2037=
996d61d8de95806335c7c86ce0f82e9c"
> +SRC_URI[tempfile-3.26.0.sha256sum] =3D "82a72c767771b47409d2345987fda862=
8641887d5466101319899796367354a0"
>  SRC_URI[terminal_size-0.4.3.sha256sum] =3D "60b8cb979cb11c32ce1603f8137b=
22262a9d131aaa5c37b5678025f22b8becd0"
>  SRC_URI[textwrap-0.16.2.sha256sum] =3D "c13547615a44dc9c452a8a534638acdf=
07120d4b6847c8178705da06306a3057"
>  SRC_URI[thiserror-1.0.69.sha256sum] =3D "b6aaf5339b578ea85b50e080feb250a=
3e8ae8cfcdff9a461c9ec2904bc923f52"
>  SRC_URI[thiserror-2.0.18.sha256sum] =3D "4288b5bcbc7920c07a1149a35cf9590=
a2aa808e0bc1eafaade0b80947865fbc4"
>  SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D "4fee6c4efc90059e10f81e6d42=
c60a18f76588c3d74cb83a0b242a2b6c7504c1"
>  SRC_URI[thiserror-impl-2.0.18.sha256sum] =3D "ebc4ee7f67670e9b64d05fa425=
3e753e016c6c95ff35b89b7941d6b856dec1d5"
> -SRC_URI[time-0.3.45.sha256sum] =3D "f9e442fc33d7fdb45aa9bfeb312c095964ab=
df596f7567261062b2a7107aaabd"
> -SRC_URI[time-core-0.1.7.sha256sum] =3D "8b36ee98fd31ec7426d599183e8fe269=
32a8dc1fb76ddb6214d05493377d34ca"
> -SRC_URI[time-macros-0.2.25.sha256sum] =3D "71e552d1249bf61ac2a52db88179f=
d0673def1e1ad8243a00d9ec9ed71fee3dd"
> +SRC_URI[time-0.3.47.sha256sum] =3D "743bd48c283afc0388f9b8827b976905fb21=
7ad9e647fae3a379a9283c4def2c"
> +SRC_URI[time-core-0.1.8.sha256sum] =3D "7694e1cfe791f8d31026952abf09c69c=
a6f6fa4e1a1229e18988f06a04a12dca"
> +SRC_URI[time-macros-0.2.27.sha256sum] =3D "2e70e4c5a0e0a8a4823ad65dfe1a6=
930e4f4d756dcd9dd7939022b5e8c501215"
>  SRC_URI[tiny-keccak-2.0.2.sha256sum] =3D "2c9d3793400a45f954c52e73d06831=
6d76b6f4e36977e3fcebb13a2721e80237"
>  SRC_URI[tinystr-0.8.2.sha256sum] =3D "42d3e9c45c09de15d06dd8acf5f4e0e399=
e85927b7f00711024eb7ae10fa4869"
>  SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D "92e1cfed4a3038bc5=
a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
>  SRC_URI[toml_edit-0.23.10+spec-1.0.0.sha256sum] =3D "84c8b9f757e028cee9f=
a244aea147aab2a9ec09d5325a9b01e0a49730c2b5269"
>  SRC_URI[toml_parser-1.0.6+spec-1.1.0.sha256sum] =3D "a3198b4b0a8e11f09dd=
03e133c0280504d0801269e9afa46362ffde1cbeebf44"
>  SRC_URI[type-map-0.5.1.sha256sum] =3D "cb30dbbd9036155e74adad6812e9898d0=
3ec374946234fbcebd5dfc7b9187b90"
> -SRC_URI[typed-path-0.12.0.sha256sum] =3D "7922f2cdc51280d47b491af9eafc41=
eb0cdab85eabcb390c854412fcbf26dbe8"
> +SRC_URI[typed-path-0.12.2.sha256sum] =3D "3015e6ce46d5ad8751e4a772543a30=
c7511468070e98e64e20165f8f81155b64"
>  SRC_URI[typenum-1.19.0.sha256sum] =3D "562d481066bde0658276a35467c4af00b=
dc6ee726305698a55b86e61d7ad82bb"
>  SRC_URI[unic-langid-0.9.6.sha256sum] =3D "a28ba52c9b05311f4f6e62d5d9d46f=
094bd6e84cb8df7b3ef952748d752a7d05"
>  SRC_URI[unic-langid-impl-0.9.6.sha256sum] =3D "dce1bf08044d4b7a94028c937=
86f8566047edc11110595914de93362559bc658"
> @@ -727,13 +713,13 @@ SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7=
ffbb22c2dee59cafe6084a59b5ffc27
>  SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7f=
aecc7fa57071cce2578660c9f1010821"
>  SRC_URI[utmp-classic-0.1.6.sha256sum] =3D "e24c654e19afaa6b8f3877ece5d3b=
ed849c2719c56f6752b18ca7da4fcc6e85a"
>  SRC_URI[utmp-classic-raw-0.1.3.sha256sum] =3D "22c226537a3d6e01c440c1926=
ca0256dbee2d19b2229ede6fc4863a6493dd831"
> -SRC_URI[uuid-1.19.0.sha256sum] =3D "e2e054861b4bd027cd373e18e8d8d8e65480=
85000e41290d95ce0c373a654b4a"
> +SRC_URI[uuid-1.20.0.sha256sum] =3D "ee48d38b119b0cd71fe4141b30f5ba9c7c5d=
9f4e7a3a8b4a674e4b6ef789976f"
>  SRC_URI[uutils_term_grid-0.7.0.sha256sum] =3D "fcba141ce511bad08e80b43f0=
2976571072e1ff4286f7d628943efbd277c6361"
>  SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f2838=
53ad26bdd5b10b7f1542aa2fa15e2289105a"
>  SRC_URI[vsimd-0.8.0.sha256sum] =3D "5c3082ca00d5a5ef149bb8b555a72ae84c9c=
59f7250f013ac822ac2e49b19c64"
>  SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
>  SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847=
eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> -SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D "0562428422c63773dad2c345=
a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
> +SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] =3D "9517f9239f02c069db75e65f=
174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
>  SRC_URI[wasm-bindgen-0.2.108.sha256sum] =3D "64024a30ec1e37399cf85a7ffef=
ebdb72205ca1c972291c51512360d90bd8566"
>  SRC_URI[wasm-bindgen-macro-0.2.108.sha256sum] =3D "008b239d9c740232e71bd=
39e8ef6429d27097518b6b30bdf9086833bd5b6d608"
>  SRC_URI[wasm-bindgen-macro-support-0.2.108.sha256sum] =3D "5256bae2d58f5=
4820e6490f9839c49780dff84c65aeab9e772f15d5f0e913a55"
> @@ -744,8 +730,6 @@ SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98=
952e593242ea400abe93992746761
>  SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
>  SRC_URI[winapi-util-0.1.11.sha256sum] =3D "c2a7b1c03c876122aa43f3020e6c3=
c3ee5c05081c9a00739faf7503aeba10d22"
>  SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> -SRC_URI[wincode-0.2.5.sha256sum] =3D "d5cec722a3274e47d1524cbe2cea762f2c=
19d615bd9d73ada21db9066349d57e"
> -SRC_URI[wincode-derive-0.2.3.sha256sum] =3D "8961eb04054a1b2e026b5628e24=
da7e001350249a787e1a85aa961f33dc5f286"
>  SRC_URI[windows-core-0.62.2.sha256sum] =3D "b8e83a14d34d0623b51dce958119=
9302a221863196a1dde71a7663a4c2be9deb"
>  SRC_URI[windows-implement-0.60.2.sha256sum] =3D "053e2e040ab57b9dc951b72=
c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
>  SRC_URI[windows-interface-0.59.3.sha256sum] =3D "3f316c4a2570ba26bbec722=
032c4099d8c8bc095efccdc15688708623367e358"
> @@ -774,7 +758,7 @@ SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] =3D =
"0ffa179e2d07eee8ad8f57493436
>  SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
>  SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] =3D "d6bbff5f0aada427a1e5a=
6da5f1f98158182f26556f345ac9e04d36d0ebed650"
>  SRC_URI[winnow-0.7.14.sha256sum] =3D "5a5364e9d77fcdeeaa6062ced926ee3381=
faa2ee02d3eb83a5c27a8825540829"
> -SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D "f17a85883d4e6d00e8a97c586de76=
4dabcc06133f7f1d55dce5cdc070ad7fe59"
> +SRC_URI[wit-bindgen-0.51.0.sha256sum] =3D "d7249219f66ced02969388cf2bb04=
4a09756a083d0fab1e566056b04d9fbcaa5"
>  SRC_URI[write16-1.0.0.sha256sum] =3D "d1890f4022759daae28ed4fe62859b1236=
caebfc61ede2f63ed4e695f3f6d936"
>  SRC_URI[writeable-0.6.2.sha256sum] =3D "9edde0db4769d2dc68579893f2306b26=
c6ecfbe0ef499b013d731b7b9247e0b9"
>  SRC_URI[wyz-0.5.1.sha256sum] =3D "05f360fc0b24296329c78fda852a1e9ae82de9=
cf7b27dae4b7f62f118f77b9ed"
> @@ -782,23 +766,24 @@ SRC_URI[xattr-1.6.1.sha256sum] =3D "32e45ad4206f6d2=
479085147f02bc2ef834ac85886624a
>  SRC_URI[yansi-1.0.1.sha256sum] =3D "cfe53a6657fd280eaa890a3bc59152892ffa=
3e30101319d168b781ed6529b049"
>  SRC_URI[yoke-0.8.1.sha256sum] =3D "72d6e5c6afb84d73944e5cedb052c4680d565=
7337201555f9f2a16b7406d4954"
>  SRC_URI[yoke-derive-0.8.1.sha256sum] =3D "b659052874eb698efe5b9e8cf38220=
4678a0086ebf46982b79d6ca3182927e5d"
> -SRC_URI[z85-3.0.6.sha256sum] =3D "9b3a41ce106832b4da1c065baa4c31cf640cf9=
65fa1483816402b7f6b96f0a64"
> +SRC_URI[z85-3.0.7.sha256sum] =3D "c6e61e59a957b7ccee15d2049f86e8bfd6f669=
68fcd88f018950662d9b86e675"
>  SRC_URI[zerocopy-0.7.35.sha256sum] =3D "1b9b4fd18abc82b8136838da5d50bae7=
bdea537c574d8dc1a34ed098d6c166f0"
> -SRC_URI[zerocopy-0.8.33.sha256sum] =3D "668f5168d10b9ee831de31933dc111a4=
59c97ec93225beb307aed970d1372dfd"
> +SRC_URI[zerocopy-0.8.39.sha256sum] =3D "db6d35d663eadb6c932438e763b262fe=
1a70987f9ae936e60158176d710cae4a"
>  SRC_URI[zerocopy-derive-0.7.35.sha256sum] =3D "fa4f8080344d4671fb4e831a1=
3ad1e68092748387dfc4f55e356242fae12ce3e"
> -SRC_URI[zerocopy-derive-0.8.33.sha256sum] =3D "2c7962b26b0a8685668b671ee=
4b54d007a67d4eaf05fda79ac0ecf41e32270f1"
> +SRC_URI[zerocopy-derive-0.8.39.sha256sum] =3D "4122cd3169e94605190e77839=
c9a40d40ed048d305bfdc146e7df40ab0f3e517"
>  SRC_URI[zerofrom-0.1.6.sha256sum] =3D "50cc42e0333e05660c3587f3bf9d04786=
88e15d870fab3346451ce7f8c9fbea5"
>  SRC_URI[zerofrom-derive-0.1.6.sha256sum] =3D "d71e5d6e06ab090c67b5e44993=
ec16b72dcbaabc526db883a360057678b48502"
>  SRC_URI[zerotrie-0.2.3.sha256sum] =3D "2a59c17a5562d507e4b54960e8569ebee=
33bee890c70aa3fe7b97e85a9fd7851"
>  SRC_URI[zerovec-0.11.5.sha256sum] =3D "6c28719294829477f525be0186d13efa9=
a3c602f7ec202ca9e353d310fb9a002"
>  SRC_URI[zerovec-derive-0.11.2.sha256sum] =3D "eadce39539ca5cb39855901026=
71f2567e659fca9666581ad3411d59207951f3"
> -SRC_URI[zip-7.2.0.sha256sum] =3D "c42e33efc22a0650c311c2ef19115ce232583a=
bbe80850bc8b66509ebef02de0"
> -SRC_URI[zlib-rs-0.5.5.sha256sum] =3D "40990edd51aae2c2b6907af74ffb635029=
d5788228222c4bb811e9351c0caad3"
> -SRC_URI[zmij-1.0.14.sha256sum] =3D "bd8f3f50b848df28f887acb68e41201b5aea=
6bc8a8dacc00fb40635ff9a72fea"
> +SRC_URI[zip-8.2.0.sha256sum] =3D "b680f2a0cd479b4cff6e1233c483fdead41810=
6eae419dc60200ae9850f6d004"
> +SRC_URI[zlib-rs-0.6.0.sha256sum] =3D "a7948af682ccbc3342b6e9420e8c51c1fe=
5d7bf7756002b4a3c6cabfe96a7e3c"
> +SRC_URI[zmij-1.0.19.sha256sum] =3D "3ff05f8caa9038894637571ae6b9e29466c1=
f4f829d26c9b28f869a29cbe3445"
>  SRC_URI[zopfli-0.8.3.sha256sum] =3D "f05cd8797d63865425ff89b5c4a48804f35=
ba0ce8d125800027ad6017d2b5249"
>  # from fuzz/Cargo.lock
>  SRC_URI +=3D " \
>      crate://crates.io/adler2/2.0.1 \
> +    crate://crates.io/aho-corasick/1.1.4 \
>      crate://crates.io/android_system_properties/0.1.5 \
>      crate://crates.io/anstream/0.6.21 \
>      crate://crates.io/anstyle/1.0.13 \
> @@ -821,12 +806,12 @@ SRC_URI +=3D " \
>      crate://crates.io/bumpalo/3.19.1 \
>      crate://crates.io/bytecount/0.6.9 \
>      crate://crates.io/calendrical_calculations/0.2.3 \
> -    crate://crates.io/cc/1.2.54 \
> +    crate://crates.io/cc/1.2.55 \
>      crate://crates.io/cfg-if/1.0.4 \
>      crate://crates.io/cfg_aliases/0.2.1 \
>      crate://crates.io/chrono/0.4.43 \
> -    crate://crates.io/clap/4.5.54 \
> -    crate://crates.io/clap_builder/4.5.54 \
> +    crate://crates.io/clap/4.5.57 \
> +    crate://crates.io/clap_builder/4.5.57 \
>      crate://crates.io/clap_lex/0.7.7 \
>      crate://crates.io/colorchoice/1.0.4 \
>      crate://crates.io/compare/0.1.0 \
> @@ -857,21 +842,21 @@ SRC_URI +=3D " \
>      crate://crates.io/encode_unicode/1.0.0 \
>      crate://crates.io/errno/0.3.14 \
>      crate://crates.io/fastrand/2.3.0 \
> -    crate://crates.io/find-msvc-tools/0.1.8 \
> +    crate://crates.io/find-msvc-tools/0.1.9 \
>      crate://crates.io/fixed_decimal/0.7.1 \
> -    crate://crates.io/flate2/1.1.8 \
> +    crate://crates.io/flate2/1.1.9 \
>      crate://crates.io/fluent/0.17.0 \
>      crate://crates.io/fluent-bundle/0.16.0 \
>      crate://crates.io/fluent-langneg/0.13.1 \
>      crate://crates.io/fluent-syntax/0.12.0 \
> -    crate://crates.io/fnv/1.0.7 \
> +    crate://crates.io/foldhash/0.2.0 \
>      crate://crates.io/generic-array/0.14.7 \
>      crate://crates.io/getrandom/0.2.17 \
>      crate://crates.io/getrandom/0.3.4 \
>      crate://crates.io/glob/0.3.3 \
>      crate://crates.io/hashbrown/0.14.5 \
>      crate://crates.io/hex/0.4.3 \
> -    crate://crates.io/iana-time-zone/0.1.64 \
> +    crate://crates.io/iana-time-zone/0.1.65 \
>      crate://crates.io/iana-time-zone-haiku/0.1.2 \
>      crate://crates.io/icu_calendar/2.1.1 \
>      crate://crates.io/icu_calendar_data/2.1.1 \
> @@ -900,22 +885,22 @@ SRC_URI +=3D " \
>      crate://crates.io/is_terminal_polyfill/1.70.2 \
>      crate://crates.io/itertools/0.14.0 \
>      crate://crates.io/ixdtf/0.6.4 \
> -    crate://crates.io/jiff/0.2.18 \
> +    crate://crates.io/jiff/0.2.19 \
>      crate://crates.io/jiff-icu/0.2.2 \
> -    crate://crates.io/jiff-static/0.2.18 \
> +    crate://crates.io/jiff-static/0.2.19 \
>      crate://crates.io/jiff-tzdb/0.1.5 \
>      crate://crates.io/jiff-tzdb-platform/0.1.3 \
>      crate://crates.io/jobserver/0.1.34 \
>      crate://crates.io/js-sys/0.3.85 \
> -    crate://crates.io/keccak/0.1.5 \
> -    crate://crates.io/libc/0.2.180 \
> -    crate://crates.io/libfuzzer-sys/0.4.10 \
> +    crate://crates.io/keccak/0.1.6 \
> +    crate://crates.io/libc/0.2.182 \
> +    crate://crates.io/libfuzzer-sys/0.4.12 \
>      crate://crates.io/libm/0.2.16 \
> -    crate://crates.io/linux-raw-sys/0.11.0 \
> +    crate://crates.io/linux-raw-sys/0.12.1 \
>      crate://crates.io/litemap/0.8.1 \
>      crate://crates.io/log/0.4.29 \
>      crate://crates.io/md-5/0.10.6 \
> -    crate://crates.io/memchr/2.7.6 \
> +    crate://crates.io/memchr/2.8.0 \
>      crate://crates.io/miniz_oxide/0.8.9 \
>      crate://crates.io/nix/0.30.1 \
>      crate://crates.io/nom/8.0.0 \
> @@ -931,10 +916,10 @@ SRC_URI +=3D " \
>      crate://crates.io/ordered-multimap/0.7.3 \
>      crate://crates.io/os_display/0.1.4 \
>      crate://crates.io/outref/0.5.2 \
> -    crate://crates.io/parse_datetime/0.13.3 \
> +    crate://crates.io/parse_datetime/0.14.0 \
>      crate://crates.io/pkg-config/0.3.32 \
> -    crate://crates.io/portable-atomic/1.13.0 \
> -    crate://crates.io/portable-atomic-util/0.2.4 \
> +    crate://crates.io/portable-atomic/1.13.1 \
> +    crate://crates.io/portable-atomic-util/0.2.5 \
>      crate://crates.io/potential_utf/0.1.4 \
>      crate://crates.io/ppv-lite86/0.2.21 \
>      crate://crates.io/proc-macro2/1.0.106 \
> @@ -947,10 +932,12 @@ SRC_URI +=3D " \
>      crate://crates.io/rand_core/0.9.5 \
>      crate://crates.io/rayon/1.11.0 \
>      crate://crates.io/rayon-core/1.13.0 \
> -    crate://crates.io/regex-automata/0.4.13 \
> +    crate://crates.io/regex/1.12.3 \
> +    crate://crates.io/regex-automata/0.4.14 \
> +    crate://crates.io/regex-syntax/0.8.9 \
>      crate://crates.io/rust-ini/0.21.3 \
>      crate://crates.io/rustc-hash/2.1.1 \
> -    crate://crates.io/rustix/1.1.3 \
> +    crate://crates.io/rustix/1.1.4 \
>      crate://crates.io/rustversion/1.0.22 \
>      crate://crates.io/self_cell/1.2.2 \
>      crate://crates.io/serde/1.0.228 \
> @@ -969,7 +956,7 @@ SRC_URI +=3D " \
>      crate://crates.io/strsim/0.11.1 \
>      crate://crates.io/syn/2.0.114 \
>      crate://crates.io/synstructure/0.13.2 \
> -    crate://crates.io/tempfile/3.24.0 \
> +    crate://crates.io/tempfile/3.26.0 \
>      crate://crates.io/terminal_size/0.4.3 \
>      crate://crates.io/thiserror/2.0.18 \
>      crate://crates.io/thiserror-impl/2.0.18 \
> @@ -1019,8 +1006,8 @@ SRC_URI +=3D " \
>      crate://crates.io/yoke/0.8.1 \
>      crate://crates.io/yoke-derive/0.8.1 \
>      crate://crates.io/z85/3.0.6 \
> -    crate://crates.io/zerocopy/0.8.34 \
> -    crate://crates.io/zerocopy-derive/0.8.34 \
> +    crate://crates.io/zerocopy/0.8.39 \
> +    crate://crates.io/zerocopy-derive/0.8.39 \
>      crate://crates.io/zerofrom/0.1.6 \
>      crate://crates.io/zerofrom-derive/0.1.6 \
>      crate://crates.io/zerotrie/0.2.3 \
> @@ -1029,6 +1016,7 @@ SRC_URI +=3D " \
>  "
>
>  SRC_URI[adler2-2.0.1.sha256sum] =3D "320119579fcad9c21884f5c4861d16174d0=
e06250625266f50fe6898340abefa"
> +SRC_URI[aho-corasick-1.1.4.sha256sum] =3D "ddd31a130427c27518df266943a53=
08ed92d4b226cc639f5a8f1002816174301"
>  SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043=
ac279b19830f2efc897156490d7fd6ea916720117ee66311"
>  SRC_URI[anstream-0.6.21.sha256sum] =3D "43d5b281e737544384e969a5ccad3f1c=
dd24b48086a0fc1b2a5262a26b8f4f4a"
>  SRC_URI[anstyle-1.0.13.sha256sum] =3D "5192cca8006f1fd4f7237516f40fa183b=
b07f8fbdfedaa0036de5ea9b0b45e78"
> @@ -1051,12 +1039,12 @@ SRC_URI[bstr-1.12.1.sha256sum] =3D "63044e1ae8e69=
f3b5a92c736ca6269b8d12fa7efe39bf3
>  SRC_URI[bumpalo-3.19.1.sha256sum] =3D "5dd9dc738b7a8311c7ade152424974d81=
15f2cdad61e8dab8dac9f2362298510"
>  SRC_URI[bytecount-0.6.9.sha256sum] =3D "175812e0be2bccb6abe50bb8d5661261=
98344f707e304f45c648fd8f2cc0365e"
>  SRC_URI[calendrical_calculations-0.2.3.sha256sum] =3D "3a0b39595c6ee54a8=
d0900204ba4c401d0ab4eb45adaf07178e8d017541529e7"
> -SRC_URI[cc-1.2.54.sha256sum] =3D "6354c81bbfd62d9cfa9cb3c773c2b7b2a3a482=
d569de977fd0e961f6e7c00583"
> +SRC_URI[cc-1.2.55.sha256sum] =3D "47b26a0954ae34af09b50f0de26458fa95369a=
0d478d8236d3f93082b219bd29"
>  SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef35111825=
727b38d33286ef986142615121801"
>  SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb0=
82c5994d996f20b8b159f2ad1658eb5724"
>  SRC_URI[chrono-0.4.43.sha256sum] =3D "fac4744fb15ae8337dc853fee7fb3f4e48=
c0fbaa23d0afe49c447b4fab126118"
> -SRC_URI[clap-4.5.54.sha256sum] =3D "c6e6ff9dcd79cff5cd969a17a545d79e84ab=
086e444102a591e288a8aa3ce394"
> -SRC_URI[clap_builder-4.5.54.sha256sum] =3D "fa42cf4d2b7a41bc8f663a7cab40=
31ebafa1bf3875705bfaf8466dc60ab52c00"
> +SRC_URI[clap-4.5.57.sha256sum] =3D "6899ea499e3fb9305a65d5ebf6e3d2248c5f=
ab291f300ad0a704fbe142eae31a"
> +SRC_URI[clap_builder-4.5.57.sha256sum] =3D "7b12c8b680195a62a8364d16b844=
7b01b6c2c8f9aaf68bee653be34d4245e238"
>  SRC_URI[clap_lex-0.7.7.sha256sum] =3D "c3e64b0cc0439b12df2fa678eae89a1c5=
6a529fd067a9115f7827f1fffd22b32"
>  SRC_URI[colorchoice-1.0.4.sha256sum] =3D "b05b61dc5112cbb17e4b6cd61790d9=
845d13888356391624cbe7e41efeac1e75"
>  SRC_URI[compare-0.1.0.sha256sum] =3D "120133d4db2ec47efe2e26502ee9847476=
30c67f51974fca0b6c1340cf2368d3"
> @@ -1087,21 +1075,21 @@ SRC_URI[either-1.15.0.sha256sum] =3D "48c757948c5=
ede0e46177b7add2e67155f70e33c07fe
>  SRC_URI[encode_unicode-1.0.0.sha256sum] =3D "34aa73646ffb006b8f5147f3dc1=
82bd4bcb190227ce861fc4a4844bf8e3cb2c0"
>  SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735=
b51691dbda63cf6f96d042b63efeb"
>  SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f=
2ff062c9e95845c43a6c9c0355411be"
> -SRC_URI[find-msvc-tools-0.1.8.sha256sum] =3D "8591b0bcc8a98a64310a2fae1b=
b3e9b8564dd10e381e6e28010fde8e8e8568db"
> +SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D "5baebc0774151f905a1a2cc419=
89300b1e6fbb29aff0ceffa1064fdd3088d582"
>  SRC_URI[fixed_decimal-0.7.1.sha256sum] =3D "35eabf480f94d69182677e37571d=
3be065822acfafd12f2f085db44fbbcc8e57"
> -SRC_URI[flate2-1.1.8.sha256sum] =3D "b375d6465b98090a5f25b1c7703f3859783=
755aa9a80433b36e0379a3ec2f369"
> +SRC_URI[flate2-1.1.9.sha256sum] =3D "843fba2746e448b37e26a819579957415c8=
cef339bf08564fe8b7ddbd959573c"
>  SRC_URI[fluent-0.17.0.sha256sum] =3D "8137a6d5a2c50d6b0ebfcb9aaa91a28154=
e0a70605f112d30cb0cd4a78670477"
>  SRC_URI[fluent-bundle-0.16.0.sha256sum] =3D "01203cb8918f5711e73891b3478=
16d932046f95f54207710bda99beaeb423bf4"
>  SRC_URI[fluent-langneg-0.13.1.sha256sum] =3D "7eebbe59450baee8282d71676f=
3bfed5689aeab00b27545e83e5f14b1195e8b0"
>  SRC_URI[fluent-syntax-0.12.0.sha256sum] =3D "54f0d287c53ffd184d04d8677f5=
90f4ac5379785529e5e08b1c8083acdd5c198"
> -SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2=
da24a9afd88aca000531ab82c1"
> +SRC_URI[foldhash-0.2.0.sha256sum] =3D "77ce24cb58228fbb8aa041425bb105085=
0ac19177686ea6e0f41a70416f56fdb"
>  SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf27=
4ad91c288277713d9c18820d8499a7ff69e9a"
>  SRC_URI[getrandom-0.2.17.sha256sum] =3D "ff2abc00be7fca6ebc474524697ae27=
6ad847ad0a6b3faa4bcb027e9a4614ad0"
>  SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ece=
c138e4d395b459e5ca34f9cce2dd77fd"
>  SRC_URI[glob-0.3.3.sha256sum] =3D "0cc23270f6e1808e30a928bdc84dea0b9b413=
6a8bc82338574f23baf47bbd280"
>  SRC_URI[hashbrown-0.14.5.sha256sum] =3D "e5274423e17b7c9fc20b6e7e208532f=
9b19825d82dfd615708b70edd83df41f1"
>  SRC_URI[hex-0.4.3.sha256sum] =3D "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e=
486a595ed5fd8f86ba55232a70"
> -SRC_URI[iana-time-zone-0.1.64.sha256sum] =3D "33e57f83510bb73707521ebaff=
a789ec8caf86f9657cad665b092b581d40e9fb"
> +SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9=
ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
>  SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590=
ba56d5d2d085f558508192593743f16b2306495269f"
>  SRC_URI[icu_calendar-2.1.1.sha256sum] =3D "d6f0e52e009b6b16ba9c069357879=
6f2dd4aaa59a7f8f920423706714a89ac4e"
>  SRC_URI[icu_calendar_data-2.1.1.sha256sum] =3D "527f04223b17edfe0bd43baf=
14a0cb1b017830db65f3950dc00224860a9a446d"
> @@ -1130,22 +1118,22 @@ SRC_URI[intl_pluralrules-7.0.2.sha256sum] =3D "07=
8ea7b7c29a2b4df841a7f6ac8775ff607
>  SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd4=
60005623e142ef0181e3d0219cb493e02f7d08a35695"
>  SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488=
aabdbf3d2da73885b31bd0abd03351285"
>  SRC_URI[ixdtf-0.6.4.sha256sum] =3D "84de9d95a6d2547d9b77ee3f25fa0ee32e3c=
3a6484d47a55adebc0439c077992"
> -SRC_URI[jiff-0.2.18.sha256sum] =3D "e67e8da4c49d6d9909fe03361f9b620f5889=
8859f5c7aded68351e85e71ecf50"
> +SRC_URI[jiff-0.2.19.sha256sum] =3D "d89a5b5e10d5a9ad6e5d1f4bd58225f655d6=
fe9767575a5e8ac5a6fe64e04495"
>  SRC_URI[jiff-icu-0.2.2.sha256sum] =3D "0e67c2beaae8b10a82d849b9aabb698a4=
3a682f32b17bcdc035d5ecadb44d646"
> -SRC_URI[jiff-static-0.2.18.sha256sum] =3D "e0c84ee7f197eca9a86c6fd6cb771=
e55eb991632f15f2bc3ca6ec838929e6e78"
> +SRC_URI[jiff-static-0.2.19.sha256sum] =3D "ff7a39c8862fc1369215ccf0a8f12=
dd4598c7f6484704359f0351bd617034dbf"
>  SRC_URI[jiff-tzdb-0.1.5.sha256sum] =3D "68971ebff725b9e2ca27a601c5eb38a4=
c5d64422c4cbab0c535f248087eda5c2"
>  SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D "875a5a69ac2bab1a891711c=
f5eccbec1ce0341ea805560dcd90b7a2e925132e8"
>  SRC_URI[jobserver-0.1.34.sha256sum] =3D "9afb3de4395d6b3e67a780b6de64b51=
c978ecf11cb9a462c66be7d4ca9039d33"
>  SRC_URI[js-sys-0.3.85.sha256sum] =3D "8c942ebf8e95485ca0d52d97da7c5a2c38=
7d0e7f0ba4c35e93bfcaee045955b3"
> -SRC_URI[keccak-0.1.5.sha256sum] =3D "ecc2af9a1119c51f12a14607e783cb977bd=
e58bc069ff0c3da1095e635d70654"
> -SRC_URI[libc-0.2.180.sha256sum] =3D "bcc35a38544a891a5f7c865aca548a982cc=
b3b8650a5b06d0fd33a10283c56fc"
> -SRC_URI[libfuzzer-sys-0.4.10.sha256sum] =3D "5037190e1f70cbeef565bd26759=
9242926f724d3b8a9f510fd7e0b540cfa4404"
> +SRC_URI[keccak-0.1.6.sha256sum] =3D "cb26cec98cce3a3d96cbb7bced3c4b16e3d=
13f27ec56dbd62cbc8f39cfb9d653"
> +SRC_URI[libc-0.2.182.sha256sum] =3D "6800badb6cb2082ffd7b6a67e6125bb39f1=
8782f793520caee8cb8846be06112"
> +SRC_URI[libfuzzer-sys-0.4.12.sha256sum] =3D "f12a681b7dd8ce12bff52488013=
ba614b869148d54dd79836ab85aafdd53f08d"
>  SRC_URI[libm-0.2.16.sha256sum] =3D "b6d2cec3eae94f9f509c767b45932f1ada83=
50c4bdb85af2fcab4a3c14807981"
> -SRC_URI[linux-raw-sys-0.11.0.sha256sum] =3D "df1d3c3b53da64cf5760482273a=
98e575c651a67eec7f77df96b5b642de8f039"
> +SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b2=
51670a91556f4144941d37452769c25d58a53"
>  SRC_URI[litemap-0.8.1.sha256sum] =3D "6373607a59f0be73a39b6fe456b8192fcc=
3585f602af20751600e974dd455e77"
>  SRC_URI[log-0.4.29.sha256sum] =3D "5e5032e24019045c762d3c0f28f5b6b8bbf38=
563a65908389bf7978758920897"
>  SRC_URI[md-5-0.10.6.sha256sum] =3D "d89e7ee0cfbedfc4da3340218492196241d8=
9eefb6dab27de5df917a6d2e78cf"
> -SRC_URI[memchr-2.7.6.sha256sum] =3D "f52b00d39961fc5b2736ea853c9cc86238e=
165017a493d1d5c8eac6bdc4cc273"
> +SRC_URI[memchr-2.8.0.sha256sum] =3D "f8ca58f447f06ed17d5fc4043ce1b10dd20=
5e060fb3ce5b979b8ed8e59ff3f79"
>  SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D "1fa76a2c86f704bdb222d66965fb3d=
63269ce38518b83cb0575fca855ebb6316"
>  SRC_URI[nix-0.30.1.sha256sum] =3D "74523f3a35e05aba87a1d978330aef40f67b0=
304ac79c1c00b294c9830543db6"
>  SRC_URI[nom-8.0.0.sha256sum] =3D "df9761775871bdef83bee530e60050f7e54b11=
05350d6884eb0fb4f46c2f9405"
> @@ -1161,10 +1149,10 @@ SRC_URI[onig_sys-69.9.1.sha256sum] =3D "c7f86c6ee=
f3d6df15f23bcfb6af487cbd2fed4e558
>  SRC_URI[ordered-multimap-0.7.3.sha256sum] =3D "49203cdcae0030493bad186b2=
8da2fa25645fa276a51b6fec8010d281e02ef79"
>  SRC_URI[os_display-0.1.4.sha256sum] =3D "ad5fd71b79026fb918650dde6d12500=
0a233764f1c2f1659a1c71118e33ea08f"
>  SRC_URI[outref-0.5.2.sha256sum] =3D "1a80800c0488c3a21695ea981a54918fbb3=
7abf04f4d0720c453632255e2ff0e"
> -SRC_URI[parse_datetime-0.13.3.sha256sum] =3D "acea383beda9652270f3c9678d=
83aa58cbfc16880343cae0c0c8c7d6c0974132"
> +SRC_URI[parse_datetime-0.14.0.sha256sum] =3D "413775a7eac2261d2211a79d10=
ef275e5b6f7b527eec42ad09adce2ffa92b6e5"
>  SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c70=
4c14cd949e5e9a1ec5929a24fded1b904c"
> -SRC_URI[portable-atomic-1.13.0.sha256sum] =3D "f89776e4d69bb58bc6993e99f=
fa1d11f228b839984854c7daeb5d37f87cbe950"
> -SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D "d8a2f0d8d040d7848a709=
caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
> +SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20=
cbe2f7accd12527ce60845ff44c153bb2a21b49"
> +SRC_URI[portable-atomic-util-0.2.5.sha256sum] =3D "7a9db96d7fa8782dd8c15=
ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
>  SRC_URI[potential_utf-0.1.4.sha256sum] =3D "b73949432f5e2a09657003c25bca=
5e19a0e9c84f8058ca374f49e0ebe605af77"
>  SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc=
30deadb458a9b590d720cde2f2b1e97da9"
>  SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b3261=
7f68fcb9fa3bb7640c23e9c748e53fb30934"
> @@ -1177,10 +1165,12 @@ SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5=
f1df60f26e1ffddd6c66e8aa15de382ae
>  SRC_URI[rand_core-0.9.5.sha256sum] =3D "76afc826de14238e6e8c374ddcc1fa19=
e374fd8dd986b0d2af0d02377261d83c"
>  SRC_URI[rayon-1.11.0.sha256sum] =3D "368f01d005bf8fd9b1206fb6fa653e6c4a8=
1ceb1466406b81792d87c5677a58f"
>  SRC_URI[rayon-core-1.13.0.sha256sum] =3D "22e18b0f0062d30d4230b2e85ff77f=
dfe4326feb054b9783a3460d8435c8ab91"
> -SRC_URI[regex-automata-0.4.13.sha256sum] =3D "5276caf25ac86c8d810222b3db=
b938e512c55c6831a10f3e6ed1c93b84041f1c"
> +SRC_URI[regex-1.12.3.sha256sum] =3D "e10754a14b9137dd7b1e3e5b0493cc9171f=
dd105e0ab477f51b72e7f3ac0e276"
> +SRC_URI[regex-automata-0.4.14.sha256sum] =3D "6e1dd4122fc1595e8162618945=
476892eefca7b88c52820e74af6262213cae8f"
> +SRC_URI[regex-syntax-0.8.9.sha256sum] =3D "a96887878f22d7bad8a3b6dc5b744=
0e0ada9a245242924394987b21cf2210a4c"
>  SRC_URI[rust-ini-0.21.3.sha256sum] =3D "796e8d2b6696392a43bea58116b667fb=
4c29727dc5abd27d6acf338bb4f688c7"
>  SRC_URI[rustc-hash-2.1.1.sha256sum] =3D "357703d41365b4b27c590e3ed91eabb=
1b663f07c4c084095e60cbed4362dff0d"
> -SRC_URI[rustix-1.1.3.sha256sum] =3D "146c9e247ccc180c1f61615433868c99f3d=
e3ae256a30a43b49f67c2d9171f34"
> +SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca=
828bd32cb7e408f0062e9930ba190"
>  SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a=
029961a8215f9619753635a9c0d2538d46d"
>  SRC_URI[self_cell-1.2.2.sha256sum] =3D "b12e76d157a900eb52e81bc6e9f30693=
44290341720e9178cde2407113ac8d89"
>  SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a91436=
180c5bb472411e48b5ec2e2124ae9e"
> @@ -1199,7 +1189,7 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6c=
e2be8dc25455e1f91df71bfa12ad37d
>  SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e262856=
4b3b043a70948a3f0b778838c5fb4f"
>  SRC_URI[syn-2.0.114.sha256sum] =3D "d4d107df263a3013ef9b1879b0df87d706ff=
80f65a86ea879bd9c31f9b307c2a"
>  SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7=
ae5ea60a4b5549c8a5914361c99147a709d2"
> -SRC_URI[tempfile-3.24.0.sha256sum] =3D "655da9c7eb6305c55742045d5a8d2037=
996d61d8de95806335c7c86ce0f82e9c"
> +SRC_URI[tempfile-3.26.0.sha256sum] =3D "82a72c767771b47409d2345987fda862=
8641887d5466101319899796367354a0"
>  SRC_URI[terminal_size-0.4.3.sha256sum] =3D "60b8cb979cb11c32ce1603f8137b=
22262a9d131aaa5c37b5678025f22b8becd0"
>  SRC_URI[thiserror-2.0.18.sha256sum] =3D "4288b5bcbc7920c07a1149a35cf9590=
a2aa808e0bc1eafaade0b80947865fbc4"
>  SRC_URI[thiserror-impl-2.0.18.sha256sum] =3D "ebc4ee7f67670e9b64d05fa425=
3e753e016c6c95ff35b89b7941d6b856dec1d5"
> @@ -1249,8 +1239,8 @@ SRC_URI[writeable-0.6.2.sha256sum] =3D "9edde0db476=
9d2dc68579893f2306b26c6ecfbe0ef
>  SRC_URI[yoke-0.8.1.sha256sum] =3D "72d6e5c6afb84d73944e5cedb052c4680d565=
7337201555f9f2a16b7406d4954"
>  SRC_URI[yoke-derive-0.8.1.sha256sum] =3D "b659052874eb698efe5b9e8cf38220=
4678a0086ebf46982b79d6ca3182927e5d"
>  SRC_URI[z85-3.0.6.sha256sum] =3D "9b3a41ce106832b4da1c065baa4c31cf640cf9=
65fa1483816402b7f6b96f0a64"
> -SRC_URI[zerocopy-0.8.34.sha256sum] =3D "71ddd76bcebeed25db614f82bf31a9f4=
222d3fbba300e6fb6c00afa26cbd4d9d"
> -SRC_URI[zerocopy-derive-0.8.34.sha256sum] =3D "d8187381b52e32220d50b2552=
76aa16a084ec0a9017a0ca2152a1f55c539758d"
> +SRC_URI[zerocopy-0.8.39.sha256sum] =3D "db6d35d663eadb6c932438e763b262fe=
1a70987f9ae936e60158176d710cae4a"
> +SRC_URI[zerocopy-derive-0.8.39.sha256sum] =3D "4122cd3169e94605190e77839=
c9a40d40ed048d305bfdc146e7df40ab0f3e517"
>  SRC_URI[zerofrom-0.1.6.sha256sum] =3D "50cc42e0333e05660c3587f3bf9d04786=
88e15d870fab3346451ce7f8c9fbea5"
>  SRC_URI[zerofrom-derive-0.1.6.sha256sum] =3D "d71e5d6e06ab090c67b5e44993=
ec16b72dcbaabc526db883a360057678b48502"
>  SRC_URI[zerotrie-0.2.3.sha256sum] =3D "2a59c17a5562d507e4b54960e8569ebee=
33bee890c70aa3fe7b97e85a9fd7851"
> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.6.0=
.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.7.0.bb
> similarity index 98%
> rename from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.6.0.=
bb
> rename to meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.7.0.bb
> index 2d0963c4b5..5103d86e92 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.6.0.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.7.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D " \
>      git://github.com/uutils/coreutils.git;protocol=3Dhttps;branch=3Dmain=
;tag=3D${PV} \
>  "
>
> -SRCREV =3D "2319a99057d11b0c9744c885df84806eea019166"
> +SRCREV =3D "995c9e04a6cc34a3a95b23a26fa59ae87e7744bd"
>
>  require ${BPN}-crates.inc
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125032): https://lists.openembedded.org/g/openembedde=
d-devel/message/125032
> Mute This Topic: https://lists.openembedded.org/mt/118242328/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

