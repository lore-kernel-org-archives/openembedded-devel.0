Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC32CFB43C
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 03:39:10 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.45340.1728272340065231057
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 20:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mvNV1rRf;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so4284010e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 20:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728272338; x=1728877138; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=587KrV8hbpazt/GJcdIuV2Jlvw4r0OE2OwPI+fSTyFc=;
        b=mvNV1rRfl/lML+Ffizoi/9pyXAIK4sBUr3pMYCSLjRK07HQiGfpwtG4UC53A7t2U1c
         bnLgX1EFw3CFs47L3oF5OC5Nv3xxx4felK2mrPtVQufSJy/j32oFaCyfxEvwo6jJHRwH
         RopUra93QxlwB9cTo5Wjo051jzeLklLnXDPbTKHHEhAfVGF2MtfcobF8+u9xiTE0Hx9E
         lyMQZdwqOiK3onYF2zFJWvB/6KKr44dXXXJAvKK/6ocHfPVaOadV1kDC6gIS9JKRtQi3
         VdqeRhGJ7Z87or4MZ81YL2Dg16KH5h1OXEo1q3h5TRQ8f9xyMNvoMyHuT8ONFOMyuZ6M
         IoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728272338; x=1728877138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=587KrV8hbpazt/GJcdIuV2Jlvw4r0OE2OwPI+fSTyFc=;
        b=LTQTORt424vC6NvHDA7lTVBe2XoFyHtOLoJ4b7dGQvw9a8Gt/DhJZNoU6bpoDHKg1o
         Nw0XarBx8uoHG4PZMKMV8FKB4BOqjNQgTKi/7HGjXUM9yj3aXjzL35wPKbVJaUhxVJdT
         hgqAzrjIdlIn4tta5QVNjiSvE7QUAkbHfVaqCzrMzBFd229bxcZ8A/oZVF7pFWk4ceeL
         9O7ZopXlRRAuFcD1PW5alb12JOI9Sqcx7ueSz26XAyrtISNQetm2hYDFjpXr61fOz718
         EOb5AMKKeIlPly3HAGf9L86zsrbLgWBu3A7Fg8Cx4TrqB7bOKoy0z4lNiZUqiMQRqobN
         wXqA==
X-Gm-Message-State: AOJu0YxS9gECKkv5R6+M/Pn8FTyDkPBmiD4E9dwEEAJT7ply7JL/bQPu
	vg21frD7DzjnlIW24nJxdJ1V/AlowcwWuCePaxl00BJbeEVon2+rYH5Xt5hW/qEos7w80ayZnF8
	DxQYwai+2jjQyOdptwAslkTi9zq8=
X-Google-Smtp-Source: AGHT+IFOMoAC1/qB0b0MBzEQxTGrb7GXJFHEnojBu+OIvKCWa1EgMNa6PEElxdL6xX54A4+fj1vK0pAUeQ5lsc6FmSY=
X-Received: by 2002:a05:6512:1245:b0:52c:e3bd:c708 with SMTP id
 2adb3069b0e04-539ab84a3cdmr4819891e87.10.1728272337124; Sun, 06 Oct 2024
 20:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <NerH.1728244868207142777.kUNX@lists.openembedded.org>
In-Reply-To: <NerH.1728244868207142777.kUNX@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 6 Oct 2024 20:38:42 -0700
Message-ID: <CANx9H-CcbOtuSTpWjpjYyUf1eLgia=-fU52DVVkkJG2gVRqRwA@mail.gmail.com>
Subject: Re: [oe] [master][meta-python] Need some help with non crates.io
 vendored crates.
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bac6350623dac296"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 03:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112691

--000000000000bac6350623dac296
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 1:01=E2=80=AFPM Tom Geelen via lists.openembedded.or=
g
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> Hi all,
>
> I could use some support. Currently I am trying to insert support for a
> new Python package manager which is now a requirement for a Python packag=
e
> I'm trying to maintain (link: UV <https://pypi.org/project/uv/>). A Rust
> based package manager.
>
> My problem is when I am creating the recipe not all crates are on
> crates.io. Several are only on github. Now is it possible to have both
> the normal crates.io as well as another provider side by side?
> I have tried checking the Yocto manual and found the class cargo
> <https://docs.yoctoproject.org/ref-manual/classes.html#cargo> which
> references an example which does not exist anymore: zvariant_3.12.0.bb
> <https://git.openembedded.org/openembedded-core/tree/meta-selftest/recipe=
s-extended/zvariant/zvariant_3.12.0.bb>
> .
>
>
you can see what the zvariant recipe was:
https://git.openembedded.org/openembedded-core/commit/meta-selftest/recipes=
-extended?id=3D8a286e686e5764f4def0644586dd19e2197ef6c2

I am trying to patch the necessary information together but I am falling
> short as I cannot seem to get it to work. I will never configure the
> sources correctly.
>
> My recipe so far:
>
> diff --git a/meta-python/recipes-devtools/python/python3-uv-crates.inc
> b/meta-python/recipes-devtools/python/python3-uv-crates.inc
> new file mode 100644
> index 000000000..e2dde977e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uv-crates.inc
> @@ -0,0 +1,1038 @@
> +# Autogenerated with 'bitbake -c update_crates python3-uv'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/addr2line/0.24.1 \
> +    crate://crates.io/adler/1.0.2 \
> +    crate://crates.io/adler2/2.0.0 \
> +    crate://crates.io/aho-corasick/1.1.3 \
> +    crate://crates.io/anes/0.1.6 \
> +    crate://crates.io/anstream/0.6.15 \
> +    crate://crates.io/anstyle/1.0.8 \
> +    crate://crates.io/anstyle-parse/0.2.5 \
> +    crate://crates.io/anstyle-query/1.1.1 \
> +    crate://crates.io/anstyle-wincon/3.0.4 \
> +    crate://crates.io/anyhow/1.0.89 \
> +    crate://crates.io/arrayref/0.3.9 \
> +    crate://crates.io/arrayvec/0.7.6 \
> +    crate://crates.io/assert-json-diff/2.0.2 \
> +    crate://crates.io/assert_cmd/2.0.16 \
> +    crate://crates.io/assert_fs/1.1.2 \
> +    crate://crates.io/async-channel/2.3.1 \
> +    crate://crates.io/async-compression/0.4.12 \
> +    crate://crates.io/async-trait/0.1.83 \
> +    crate://crates.io/async_http_range_reader/0.8.0 \
> +    crate://crates.io/atomic-waker/1.1.2 \
> +    crate://crates.io/autocfg/1.3.0 \
> +    crate://crates.io/axoasset/1.0.0 \
> +    crate://crates.io/axoprocess/0.2.0 \
> +    crate://crates.io/axotag/0.2.0 \
> +    crate://crates.io/axoupdater/0.7.2 \
> +    crate://crates.io/backoff/0.4.0 \
> +    crate://crates.io/backtrace/0.3.74 \
> +    crate://crates.io/base64/0.21.7 \
> +    crate://crates.io/base64/0.22.1 \
> +    crate://crates.io/bisection/0.1.0 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/bitflags/2.6.0 \
> +    crate://crates.io/block-buffer/0.10.4 \
> +    crate://crates.io/boxcar/0.2.5 \
> +    crate://crates.io/bstr/1.10.0 \
> +    crate://crates.io/bumpalo/3.16.0 \
> +    crate://crates.io/bytecheck/0.8.0 \
> +    crate://crates.io/bytecheck_derive/0.8.0 \
> +    crate://crates.io/bytemuck/1.18.0 \
> +    crate://crates.io/byteorder/1.5.0 \
> +    crate://crates.io/byteorder-lite/0.1.0 \
> +    crate://crates.io/bytes/1.7.1 \
> +    crate://crates.io/bzip2/0.4.4 \
> +    crate://crates.io/bzip2-sys/0.1.11+1.0.8 \
> +    crate://crates.io/cachedir/0.3.1 \
> +    crate://crates.io/camino/1.1.9 \
> +    crate://crates.io/cargo-util/0.2.14 \
> +    crate://crates.io/cast/0.3.0 \
> +    crate://crates.io/cc/1.1.19 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/cfg_aliases/0.2.1 \
> +    crate://crates.io/charset/0.1.5 \
> +    crate://crates.io/ciborium/0.2.2 \
> +    crate://crates.io/ciborium-io/0.2.2 \
> +    crate://crates.io/ciborium-ll/0.2.2 \
> +    crate://crates.io/clap/4.5.18 \
> +    crate://crates.io/clap_builder/4.5.18 \
> +    crate://crates.io/clap_complete/4.5.26 \
> +    crate://crates.io/clap_complete_command/0.6.1 \
> +    crate://crates.io/clap_complete_nushell/4.5.3 \
> +    crate://crates.io/clap_derive/4.5.18 \
> +    crate://crates.io/clap_lex/0.7.2 \
> +    crate://crates.io/cmake/0.1.51 \
> +    crate://crates.io/codspeed/2.7.2 \
> +    crate://crates.io/codspeed-criterion-compat/2.7.2 \
> +    crate://crates.io/color_quant/1.1.0 \
> +    crate://crates.io/colorchoice/1.0.2 \
> +    crate://crates.io/colored/2.1.0 \
> +    crate://crates.io/concurrent-queue/2.5.0 \
> +    crate://crates.io/configparser/3.1.0 \
> +    crate://crates.io/console/0.15.8 \
> +    crate://crates.io/core-foundation/0.9.4 \
> +    crate://crates.io/core-foundation-sys/0.8.7 \
> +    crate://crates.io/cpufeatures/0.2.14 \
> +    crate://crates.io/crc32fast/1.4.2 \
> +    crate://crates.io/criterion/0.5.1 \
> +    crate://crates.io/criterion-plot/0.5.0 \
> +    crate://crates.io/crossbeam-deque/0.8.5 \
> +    crate://crates.io/crossbeam-epoch/0.9.18 \
> +    crate://crates.io/crossbeam-utils/0.8.20 \
> +    crate://crates.io/crunchy/0.2.2 \
> +    crate://crates.io/crypto-common/0.1.6 \
> +    crate://crates.io/csv/1.3.0 \
> +    crate://crates.io/csv-core/0.1.11 \
> +    crate://crates.io/ctrlc/3.4.5 \
> +    crate://crates.io/dashmap/6.1.0 \
> +    crate://crates.io/data-encoding/2.6.0 \
> +    crate://crates.io/data-url/0.2.0 \
> +    crate://crates.io/deadpool/0.10.0 \
> +    crate://crates.io/deadpool-runtime/0.1.4 \
> +    crate://crates.io/diff/0.1.13 \
> +    crate://crates.io/difflib/0.4.0 \
> +    crate://crates.io/digest/0.10.7 \
> +    crate://crates.io/directories/5.0.1 \
> +    crate://crates.io/dirs-sys/0.4.1 \
> +    crate://crates.io/doc-comment/0.3.3 \
> +    crate://crates.io/dunce/1.0.5 \
> +    crate://crates.io/dyn-clone/1.0.17 \
> +    crate://crates.io/either/1.13.0 \
> +    crate://crates.io/encode_unicode/0.3.6 \
> +    crate://crates.io/encoding_rs/0.8.34 \
> +    crate://crates.io/encoding_rs_io/0.1.7 \
> +    crate://crates.io/equivalent/1.0.1 \
> +    crate://crates.io/erased-serde/0.4.5 \
> +    crate://crates.io/errno/0.3.9 \
> +    crate://crates.io/etcetera/0.8.0 \
> +    crate://crates.io/event-listener/5.3.1 \
> +    crate://crates.io/event-listener-strategy/0.5.2 \
> +    crate://crates.io/fastrand/2.1.1 \
> +    crate://crates.io/fdeflate/0.3.4 \
> +    crate://crates.io/filetime/0.2.25 \
> +    crate://crates.io/fixedbitset/0.4.2 \
> +    crate://crates.io/flate2/1.0.34 \
> +    crate://crates.io/float-cmp/0.9.0 \
> +    crate://crates.io/fnv/1.0.7 \
> +    crate://crates.io/fontconfig-parser/0.5.7 \
> +    crate://crates.io/fontdb/0.12.0 \
> +    crate://crates.io/form_urlencoded/1.2.1 \
> +    crate://crates.io/fs-err/2.11.0 \
> +    crate://crates.io/fs2/0.4.3 \
> +    crate://crates.io/futures/0.3.30 \
> +    crate://crates.io/futures-channel/0.3.30 \
> +    crate://crates.io/futures-core/0.3.30 \
> +    crate://crates.io/futures-executor/0.3.30 \
> +    crate://crates.io/futures-io/0.3.30 \
> +    crate://crates.io/futures-lite/2.3.0 \
> +    crate://crates.io/futures-macro/0.3.30 \
> +    crate://crates.io/futures-sink/0.3.30 \
> +    crate://crates.io/futures-task/0.3.30 \
> +    crate://crates.io/futures-util/0.3.30 \
> +    crate://crates.io/generic-array/0.14.7 \
> +    crate://crates.io/getrandom/0.2.15 \
> +    crate://crates.io/gif/0.12.0 \
> +    crate://crates.io/gimli/0.31.0 \
> +    crate://crates.io/glob/0.3.1 \
> +    crate://crates.io/globset/0.4.15 \
> +    crate://crates.io/globwalk/0.9.1 \
> +    crate://crates.io/goblin/0.8.2 \
> +    crate://crates.io/h2/0.4.6 \
> +    crate://crates.io/half/2.4.1 \
> +    crate://crates.io/hashbrown/0.14.5 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/hermit-abi/0.3.9 \
> +    crate://crates.io/hermit-abi/0.4.0 \
> +    crate://crates.io/hex/0.4.3 \
> +    crate://crates.io/home/0.5.9 \
> +    crate://crates.io/homedir/0.3.3 \
> +    crate://crates.io/html-escape/0.2.13 \
> +    crate://crates.io/http/1.1.0 \
> +    crate://crates.io/http-body/1.0.1 \
> +    crate://crates.io/http-body-util/0.1.2 \
> +    crate://crates.io/http-content-range/0.1.2 \
> +    crate://crates.io/httparse/1.9.4 \
> +    crate://crates.io/httpdate/1.0.3 \
> +    crate://crates.io/hyper/1.4.1 \
> +    crate://crates.io/hyper-rustls/0.27.3 \
> +    crate://crates.io/hyper-util/0.1.9 \
> +    crate://crates.io/idna/0.5.0 \
> +    crate://crates.io/ignore/0.4.23 \
> +    crate://crates.io/image/0.25.2 \
> +    crate://crates.io/imagesize/0.11.0 \
> +    crate://crates.io/indexmap/2.5.0 \
> +    crate://crates.io/indicatif/0.17.8 \
> +    crate://crates.io/indoc/2.0.5 \
> +    crate://crates.io/insta/1.40.0 \
> +    crate://crates.io/instant/0.1.13 \
> +    crate://crates.io/ipnet/2.10.0 \
> +    crate://crates.io/is-terminal/0.4.13 \
> +    crate://crates.io/is_ci/1.2.0 \
> +    crate://crates.io/is_terminal_polyfill/1.70.1 \
> +    crate://crates.io/itertools/0.10.5 \
> +    crate://crates.io/itertools/0.12.1 \
> +    crate://crates.io/itertools/0.13.0 \
> +    crate://crates.io/itoa/1.0.11 \
> +    crate://crates.io/jiff/0.1.13 \
> +    crate://crates.io/jiff-tzdb/0.1.1 \
> +    crate://crates.io/jiff-tzdb-platform/0.1.1 \
> +    crate://crates.io/jobserver/0.1.32 \
> +    crate://crates.io/jpeg-decoder/0.3.1 \
> +    crate://crates.io/js-sys/0.3.70 \
> +    crate://crates.io/junction/1.2.0 \
> +    crate://crates.io/krata-tokio-tar/0.4.2 \
> +    crate://crates.io/kurbo/0.8.3 \
> +    crate://crates.io/kurbo/0.9.5 \
> +    crate://crates.io/lazy_static/1.5.0 \
> +    crate://crates.io/libc/0.2.158 \
> +    crate://crates.io/libmimalloc-sys/0.1.39 \
> +    crate://crates.io/libredox/0.1.3 \
> +    crate://crates.io/libz-ng-sys/1.1.16 \
> +    crate://crates.io/linked-hash-map/0.5.6 \
> +    crate://crates.io/linux-raw-sys/0.4.14 \
> +    crate://crates.io/lock_api/0.4.12 \
> +    crate://crates.io/log/0.4.22 \
> +    crate://crates.io/lzma-sys/0.1.20 \
> +    crate://crates.io/mailparse/0.15.0 \
> +    crate://crates.io/markdown/0.3.0 \
> +    crate://crates.io/matchers/0.1.0 \
> +    crate://crates.io/md-5/0.10.6 \
> +    crate://crates.io/memchr/2.7.4 \
> +    crate://crates.io/memmap2/0.5.10 \
> +    crate://crates.io/memmap2/0.9.5 \
> +    crate://crates.io/memoffset/0.7.1 \
> +    crate://crates.io/miette/7.2.0 \
> +    crate://crates.io/miette-derive/7.2.0 \
> +    crate://crates.io/mimalloc/0.1.43 \
> +    crate://crates.io/mime/0.3.17 \
> +    crate://crates.io/mime_guess/2.0.5 \
> +    crate://crates.io/miniz_oxide/0.7.4 \
> +    crate://crates.io/miniz_oxide/0.8.0 \
> +    crate://crates.io/mio/1.0.2 \
> +    crate://crates.io/miow/0.6.0 \
> +    crate://crates.io/munge/0.4.1 \
> +    crate://crates.io/munge_macro/0.4.1 \
> +    crate://crates.io/nanoid/0.4.0 \
> +    crate://crates.io/nix/0.26.4 \
> +    crate://crates.io/nix/0.29.0 \
> +    crate://crates.io/normalize-line-endings/0.3.0 \
> +    crate://crates.io/nu-ansi-term/0.46.0 \
> +    crate://crates.io/nu-ansi-term/0.50.1 \
> +    crate://crates.io/num-traits/0.2.19 \
> +    crate://crates.io/num_cpus/1.16.0 \
> +    crate://crates.io/number_prefix/0.4.0 \
> +    crate://crates.io/object/0.36.4 \
> +    crate://crates.io/once_cell/1.20.0 \
> +    crate://crates.io/oorandom/11.1.4 \
> +    crate://crates.io/openssl-probe/0.1.5 \
> +    crate://crates.io/option-ext/0.2.0 \
> +    crate://crates.io/overload/0.1.1 \
> +    crate://crates.io/owo-colors/4.1.0 \
> +    crate://crates.io/parking/2.2.1 \
> +    crate://crates.io/parking_lot/0.11.2 \
> +    crate://crates.io/parking_lot/0.12.3 \
> +    crate://crates.io/parking_lot_core/0.8.6 \
> +    crate://crates.io/parking_lot_core/0.9.10 \
> +    crate://crates.io/paste/1.0.15 \
> +    crate://crates.io/path-slash/0.2.1 \
> +    crate://crates.io/pathdiff/0.2.1 \
> +    crate://crates.io/percent-encoding/2.3.1 \
> +    crate://crates.io/pest/2.7.12 \
> +    crate://crates.io/pest_derive/2.7.12 \
> +    crate://crates.io/pest_generator/2.7.12 \
> +    crate://crates.io/pest_meta/2.7.12 \
> +    crate://crates.io/petgraph/0.6.5 \
> +    crate://crates.io/pico-args/0.5.0 \
> +    crate://crates.io/pin-project/1.1.5 \
> +    crate://crates.io/pin-project-internal/1.1.5 \
> +    crate://crates.io/pin-project-lite/0.2.14 \
> +    crate://crates.io/pin-utils/0.1.0 \
> +    crate://crates.io/pipeline/0.5.0 \
> +    crate://crates.io/pkg-config/0.3.30 \
> +    crate://crates.io/plain/0.2.3 \
> +    crate://crates.io/platform-info/2.0.4 \
> +    crate://crates.io/png/0.17.13 \
> +    crate://crates.io/poloto/19.1.2 \
> +    crate://crates.io/portable-atomic/1.7.0 \
> +    crate://crates.io/ppv-lite86/0.2.20 \
> +    crate://crates.io/predicates/3.1.2 \
> +    crate://crates.io/predicates-core/1.0.8 \
> +    crate://crates.io/predicates-tree/1.0.11 \
> +    crate://crates.io/pretty_assertions/1.4.1 \
> +    crate://crates.io/priority-queue/2.1.0 \
> +    crate://crates.io/proc-macro2/1.0.86 \
> +    crate://crates.io/ptr_meta/0.3.0 \
> +    crate://crates.io/ptr_meta_derive/0.3.0 \
> +    crate://crates.io/quinn/0.11.5 \
> +    crate://crates.io/quinn-proto/0.11.8 \
> +    crate://crates.io/quinn-udp/0.5.5 \
> +    crate://crates.io/quote/1.0.37 \
> +    crate://crates.io/quoted_printable/0.5.1 \
> +    crate://crates.io/rancor/0.1.0 \
> +    crate://crates.io/rand/0.8.5 \
> +    crate://crates.io/rand_chacha/0.3.1 \
> +    crate://crates.io/rand_core/0.6.4 \
> +    crate://crates.io/rayon/1.10.0 \
> +    crate://crates.io/rayon-core/1.12.1 \
> +    crate://crates.io/rctree/0.5.0 \
> +    crate://crates.io/redox_syscall/0.2.16 \
> +    crate://crates.io/redox_syscall/0.3.5 \
> +    crate://crates.io/redox_syscall/0.5.4 \
> +    crate://crates.io/redox_users/0.4.6 \
> +    crate://crates.io/reflink-copy/0.1.19 \
> +    crate://crates.io/regex/1.11.0 \
> +    crate://crates.io/regex-automata/0.1.10 \
> +    crate://crates.io/regex-automata/0.4.8 \
> +    crate://crates.io/regex-syntax/0.6.29 \
> +    crate://crates.io/regex-syntax/0.8.5 \
> +    crate://crates.io/rend/0.5.1 \
> +    crate://crates.io/reqwest/0.12.7 \
> +    crate://crates.io/resvg/0.29.0 \
> +    crate://crates.io/retry-policies/0.4.0 \
> +    crate://crates.io/rgb/0.8.50 \
> +    crate://crates.io/ring/0.17.8 \
> +    crate://crates.io/rkyv/0.8.8 \
> +    crate://crates.io/rkyv_derive/0.8.8 \
> +    crate://crates.io/rmp/0.8.14 \
> +    crate://crates.io/rmp-serde/1.3.0 \
> +    crate://crates.io/rosvgtree/0.1.0 \
> +    crate://crates.io/roxmltree/0.18.1 \
> +    crate://crates.io/roxmltree/0.20.0 \
> +    crate://crates.io/rust-netrc/0.1.1 \
> +    crate://crates.io/rustc-demangle/0.1.24 \
> +    crate://crates.io/rustc-hash/2.0.0 \
> +    crate://crates.io/rustix/0.38.37 \
> +    crate://crates.io/rustls/0.23.13 \
> +    crate://crates.io/rustls-native-certs/0.7.3 \
> +    crate://crates.io/rustls-native-certs/0.8.0 \
> +    crate://crates.io/rustls-pemfile/2.1.3 \
> +    crate://crates.io/rustls-pki-types/1.8.0 \
> +    crate://crates.io/rustls-webpki/0.102.8 \
> +    crate://crates.io/rustybuzz/0.7.0 \
> +    crate://crates.io/ryu/1.0.18 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/schannel/0.1.24 \
> +    crate://crates.io/schemars/0.8.21 \
> +    crate://crates.io/schemars_derive/0.8.21 \
> +    crate://crates.io/scopeguard/1.2.0 \
> +    crate://crates.io/scroll/0.12.0 \
> +    crate://crates.io/scroll_derive/0.12.0 \
> +    crate://crates.io/seahash/4.1.0 \
> +    crate://crates.io/security-framework/2.11.1 \
> +    crate://crates.io/security-framework-sys/2.11.1 \
> +    crate://crates.io/semver/1.0.23 \
> +    crate://crates.io/serde/1.0.210 \
> +    crate://crates.io/serde-untagged/0.1.6 \
> +    crate://crates.io/serde_derive/1.0.210 \
> +    crate://crates.io/serde_derive_internals/0.29.1 \
> +    crate://crates.io/serde_json/1.0.128 \
> +    crate://crates.io/serde_spanned/0.6.7 \
> +    crate://crates.io/serde_urlencoded/0.7.1 \
> +    crate://crates.io/sha2/0.10.8 \
> +    crate://crates.io/sharded-slab/0.1.7 \
> +    crate://crates.io/shell-escape/0.1.5 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/signal-hook-registry/1.4.2 \
> +    crate://crates.io/simd-adler32/0.3.7 \
> +    crate://crates.io/simdutf8/0.1.4 \
> +    crate://crates.io/similar/2.6.0 \
> +    crate://crates.io/simplecss/0.2.1 \
> +    crate://crates.io/siphasher/0.3.11 \
> +    crate://crates.io/slab/0.4.9 \
> +    crate://crates.io/smallvec/1.13.2 \
> +    crate://crates.io/smawk/0.3.2 \
> +    crate://crates.io/socket2/0.5.7 \
> +    crate://crates.io/spin/0.9.8 \
> +    crate://crates.io/strict-num/0.1.1 \
> +    crate://crates.io/strsim/0.11.1 \
> +    crate://crates.io/subtle/2.6.1 \
> +    crate://crates.io/supports-color/3.0.1 \
> +    crate://crates.io/supports-hyperlinks/3.0.0 \
> +    crate://crates.io/supports-unicode/3.0.0 \
> +    crate://crates.io/svg/0.17.0 \
> +    crate://crates.io/svgfilters/0.4.0 \
> +    crate://crates.io/svgtypes/0.9.0 \
> +    crate://crates.io/svgtypes/0.10.0 \
> +    crate://crates.io/syn/2.0.79 \
> +    crate://crates.io/sync_wrapper/1.0.1 \
> +    crate://crates.io/sys-info/0.9.1 \
> +    crate://crates.io/tagu/0.1.6 \
> +    crate://crates.io/target-lexicon/0.12.16 \
> +    crate://crates.io/temp-env/0.3.6 \
> +    crate://crates.io/tempfile/3.13.0 \
> +    crate://crates.io/terminal_size/0.3.0 \
> +    crate://crates.io/termtree/0.4.1 \
> +    crate://crates.io/test-case/3.3.1 \
> +    crate://crates.io/test-case-core/3.3.1 \
> +    crate://crates.io/test-case-macros/3.3.1 \
> +    crate://crates.io/test-log/0.2.16 \
> +    crate://crates.io/test-log-macros/0.2.16 \
> +    crate://crates.io/testing_logger/0.1.1 \
> +    crate://crates.io/textwrap/0.16.1 \
> +    crate://crates.io/thiserror/1.0.64 \
> +    crate://crates.io/thiserror-impl/1.0.64 \
> +    crate://crates.io/thread_local/1.1.8 \
> +    crate://
> crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e0=
2839f328f7
> \
> +    crate://crates.io/tikv-jemallocator/0.6.0 \
> +    crate://crates.io/tiny-skia/0.8.4 \
> +    crate://crates.io/tiny-skia-path/0.8.4 \
> +    crate://crates.io/tinytemplate/1.2.1 \
> +    crate://crates.io/tinyvec/1.8.0 \
> +    crate://crates.io/tinyvec_macros/0.1.1 \
> +    crate://crates.io/tokio/1.40.0 \
> +    crate://crates.io/tokio-macros/2.4.0 \
> +    crate://crates.io/tokio-rustls/0.26.0 \
> +    crate://crates.io/tokio-socks/0.5.2 \
> +    crate://crates.io/tokio-stream/0.1.16 \
> +    crate://crates.io/tokio-util/0.7.12 \
> +    crate://crates.io/toml/0.8.19 \
> +    crate://crates.io/toml_datetime/0.6.8 \
> +    crate://crates.io/toml_edit/0.22.22 \
> +    crate://crates.io/tower-service/0.3.3 \
> +    crate://crates.io/tracing/0.1.40 \
> +    crate://crates.io/tracing-attributes/0.1.27 \
> +    crate://crates.io/tracing-core/0.1.32 \
> +    crate://crates.io/tracing-durations-export/0.3.0 \
> +    crate://crates.io/tracing-log/0.2.0 \
> +    crate://crates.io/tracing-serde/0.1.3 \
> +    crate://crates.io/tracing-subscriber/0.3.18 \
> +    crate://crates.io/tracing-tree/0.4.0 \
> +    crate://crates.io/try-lock/0.2.5 \
> +    crate://crates.io/ttf-parser/0.18.1 \
> +    crate://crates.io/typeid/1.0.2 \
> +    crate://crates.io/typenum/1.17.0 \
> +    crate://crates.io/ucd-trie/0.1.6 \
> +    crate://crates.io/unicase/2.7.0 \
> +    crate://crates.io/unicode-bidi/0.3.15 \
> +    crate://crates.io/unicode-bidi-mirroring/0.1.0 \
> +    crate://crates.io/unicode-ccc/0.1.2 \
> +    crate://crates.io/unicode-general-category/0.6.0 \
> +    crate://crates.io/unicode-ident/1.0.13 \
> +    crate://crates.io/unicode-linebreak/0.1.5 \
> +    crate://crates.io/unicode-normalization/0.1.23 \
> +    crate://crates.io/unicode-script/0.5.6 \
> +    crate://crates.io/unicode-vo/0.1.0 \
> +    crate://crates.io/unicode-width/0.1.13 \
> +    crate://crates.io/unscanny/0.1.0 \
> +    crate://crates.io/untrusted/0.9.0 \
> +    crate://crates.io/url/2.5.2 \
> +    crate://crates.io/urlencoding/2.1.3 \
> +    crate://crates.io/usvg/0.29.0 \
> +    crate://crates.io/usvg-text-layout/0.29.0 \
> +    crate://crates.io/utf8-width/0.1.7 \
> +    crate://crates.io/utf8parse/0.2.2 \
> +    crate://crates.io/uuid/1.10.0 \
> +    crate://crates.io/valuable/0.1.0 \
> +    crate://crates.io/version_check/0.9.5 \
> +    crate://crates.io/wait-timeout/0.2.0 \
> +    crate://crates.io/walkdir/2.5.0 \
> +    crate://crates.io/want/0.3.1 \
> +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> +    crate://crates.io/wasm-bindgen/0.2.93 \
> +    crate://crates.io/wasm-bindgen-backend/0.2.93 \
> +    crate://crates.io/wasm-bindgen-futures/0.4.43 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.93 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.93 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.93 \
> +    crate://crates.io/wasm-streams/0.4.0 \
> +    crate://crates.io/wasm-timer/0.2.5 \
> +    crate://crates.io/web-sys/0.3.70 \
> +    crate://crates.io/webpki-roots/0.26.5 \
> +    crate://crates.io/weezl/0.1.8 \
> +    crate://crates.io/which/6.0.3 \
> +    crate://crates.io/widestring/1.1.0 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.9 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows/0.57.0 \
> +    crate://crates.io/windows/0.58.0 \
> +    crate://crates.io/windows-core/0.57.0 \
> +    crate://crates.io/windows-core/0.58.0 \
> +    crate://crates.io/windows-implement/0.57.0 \
> +    crate://crates.io/windows-implement/0.58.0 \
> +    crate://crates.io/windows-interface/0.57.0 \
> +    crate://crates.io/windows-interface/0.58.0 \
> +    crate://crates.io/windows-registry/0.2.0 \
> +    crate://crates.io/windows-result/0.1.2 \
> +    crate://crates.io/windows-result/0.2.0 \
> +    crate://crates.io/windows-strings/0.1.0 \
> +    crate://crates.io/windows-sys/0.48.0 \
> +    crate://crates.io/windows-sys/0.52.0 \
> +    crate://crates.io/windows-sys/0.59.0 \
> +    crate://crates.io/windows-targets/0.48.5 \
> +    crate://crates.io/windows-targets/0.52.6 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> +    crate://crates.io/windows_aarch64_msvc/0.52.6 \
> +    crate://crates.io/windows_i686_gnu/0.48.5 \
> +    crate://crates.io/windows_i686_gnu/0.52.6 \
> +    crate://crates.io/windows_i686_gnullvm/0.52.6 \
> +    crate://crates.io/windows_i686_msvc/0.48.5 \
> +    crate://crates.io/windows_i686_msvc/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnu/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_x86_64_msvc/0.48.5 \
> +    crate://crates.io/windows_x86_64_msvc/0.52.6 \
> +    crate://crates.io/winnow/0.6.18 \
> +    crate://crates.io/winreg/0.52.0 \
> +    crate://crates.io/winsafe/0.0.19 \
> +    crate://crates.io/winsafe/0.0.22 \
> +    crate://crates.io/wiremock/0.6.2 \
> +    crate://crates.io/xattr/1.3.1 \
> +    crate://crates.io/xmlparser/0.13.6 \
> +    crate://crates.io/xz2/0.1.7 \
> +    crate://crates.io/yansi/1.0.1 \
> +    crate://crates.io/zerocopy/0.7.35 \
> +    crate://crates.io/zerocopy-derive/0.7.35 \
> +    crate://crates.io/zeroize/1.8.1 \
> +    crate://crates.io/zip/0.6.6 \
> +    crate://crates.io/zstd/0.13.2 \
> +    crate://crates.io/zstd-safe/7.2.1 \
> +    crate://crates.io/zstd-sys/2.0.13+zstd.1.5.6 \
> +"
> +
> +SRC_URI[addr2line-0.24.1.sha256sum] =3D
> "f5fb1d8e4442bd405fdfd1dacb42792696b0cf9cb15882e5d097b742a676d375"
> +SRC_URI[adler-1.0.2.sha256sum] =3D
> "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
> +SRC_URI[adler2-2.0.0.sha256sum] =3D
> "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D
> "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
> +SRC_URI[anes-0.1.6.sha256sum] =3D
> "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
> +SRC_URI[anstream-0.6.15.sha256sum] =3D
> "64e15c1ab1f89faffbf04a634d5e1962e9074f2741eef6d97f3c4e322426d526"
> +SRC_URI[anstyle-1.0.8.sha256sum] =3D
> "1bec1de6f59aedf83baf9ff929c98f2ad654b97c9510f4e70cf6f661d49fd5b1"
> +SRC_URI[anstyle-parse-0.2.5.sha256sum] =3D
> "eb47de1e80c2b463c735db5b217a0ddc39d612e7ac9e2e96a5aed1f57616c1cb"
> +SRC_URI[anstyle-query-1.1.1.sha256sum] =3D
> "6d36fc52c7f6c869915e99412912f22093507da8d9e942ceaf66fe4b7c14422a"
> +SRC_URI[anstyle-wincon-3.0.4.sha256sum] =3D
> "5bf74e1b6e971609db8ca7a9ce79fd5768ab6ae46441c572e46cf596f59e57f8"
> +SRC_URI[anyhow-1.0.89.sha256sum] =3D
> "86fdf8605db99b54d3cd748a44c6d04df638eb5dafb219b135d0149bd0db01f6"
> +SRC_URI[arrayref-0.3.9.sha256sum] =3D
> "76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb"
> +SRC_URI[arrayvec-0.7.6.sha256sum] =3D
> "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
> +SRC_URI[assert-json-diff-2.0.2.sha256sum] =3D
> "47e4f2b81832e72834d7518d8487a0396a28cc408186a2e8854c0f98011faf12"
> +SRC_URI[assert_cmd-2.0.16.sha256sum] =3D
> "dc1835b7f27878de8525dc71410b5a31cdcc5f230aed5ba5df968e09c201b23d"
> +SRC_URI[assert_fs-1.1.2.sha256sum] =3D
> "7efdb1fdb47602827a342857666feb372712cbc64b414172bd6b167a02927674"
> +SRC_URI[async-channel-2.3.1.sha256sum] =3D
> "89b47800b0be77592da0afd425cc03468052844aff33b84e33cc696f64e77b6a"
> +SRC_URI[async-compression-0.4.12.sha256sum] =3D
> "fec134f64e2bc57411226dfc4e52dec859ddfc7e711fc5e07b612584f000e4aa"
> +SRC_URI[async-trait-0.1.83.sha256sum] =3D
> "721cae7de5c34fbb2acd27e21e6d2cf7b886dce0c27388d46c4e6c47ea4318dd"
> +SRC_URI[async_http_range_reader-0.8.0.sha256sum] =3D
> "f1a0e0571c5d724d17fbe0b608d31a91e94938722c141877d3a2982216b084c2"
> +SRC_URI[atomic-waker-1.1.2.sha256sum] =3D
> "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
> +SRC_URI[autocfg-1.3.0.sha256sum] =3D
> "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
> +SRC_URI[axoasset-1.0.0.sha256sum] =3D
> "45e7b7ac1c1cd4fdcaa2f9e704defa9defd996039083d85e17efa5e8eefb3bd2"
> +SRC_URI[axoprocess-0.2.0.sha256sum] =3D
> "4de46920588aef95658797996130bacd542436aee090084646521260a74bda7d"
> +SRC_URI[axotag-0.2.0.sha256sum] =3D
> "d888fac0b73e64cbdf36a743fc5a25af5ae955c357535cb420b389bf1e1a6c54"
> +SRC_URI[axoupdater-0.7.2.sha256sum] =3D
> "fa6f92ef9ab41a352f403f709ef0f09cda1f461795de52085cd46ed831ead02e"
> +SRC_URI[backoff-0.4.0.sha256sum] =3D
> "b62ddb9cb1ec0a098ad4bbf9344d0713fa193ae1a80af55febcff2627b6a00c1"
> +SRC_URI[backtrace-0.3.74.sha256sum] =3D
> "8d82cb332cdfaed17ae235a638438ac4d4839913cc2af585c3c6746e8f8bee1a"
> +SRC_URI[base64-0.21.7.sha256sum] =3D
> "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> +SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> +SRC_URI[bisection-0.1.0.sha256sum] =3D
> "021e079a1bab0ecce6cf4b4b74c0c37afa4a697136eb3b127875c84a8f04a8c3"
> +SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[bitflags-2.6.0.sha256sum] =3D
> "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
> +SRC_URI[block-buffer-0.10.4.sha256sum] =3D
> "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
> +SRC_URI[boxcar-0.2.5.sha256sum] =3D
> "510a90332002c1af3317ef6b712f0dab697f30bbe809b86965eac2923c0bca8e"
> +SRC_URI[bstr-1.10.0.sha256sum] =3D
> "40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c"
> +SRC_URI[bumpalo-3.16.0.sha256sum] =3D
> "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
> +SRC_URI[bytecheck-0.8.0.sha256sum] =3D
> "50c8f430744b23b54ad15161fcbc22d82a29b73eacbe425fea23ec822600bc6f"
> +SRC_URI[bytecheck_derive-0.8.0.sha256sum] =3D
> "523363cbe1df49b68215efdf500b103ac3b0fb4836aed6d15689a076eadb8fff"
> +SRC_URI[bytemuck-1.18.0.sha256sum] =3D
> "94bbb0ad554ad961ddc5da507a12a29b14e4ae5bda06b19f575a3e6079d2e2ae"
> +SRC_URI[byteorder-1.5.0.sha256sum] =3D
> "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
> +SRC_URI[byteorder-lite-0.1.0.sha256sum] =3D
> "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
> +SRC_URI[bytes-1.7.1.sha256sum] =3D
> "8318a53db07bb3f8dca91a600466bdb3f2eaadeedfdbcf02e1accbad9271ba50"
> +SRC_URI[bzip2-0.4.4.sha256sum] =3D
> "bdb116a6ef3f6c3698828873ad02c3014b3c85cadb88496095628e3ef1e347f8"
> +SRC_URI[bzip2-sys-0.1.11+1.0.8.sha256sum] =3D
> "736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a186b6cd4cdc"
> +SRC_URI[cachedir-0.3.1.sha256sum] =3D
> "4703f3937077db8fa35bee3c8789343c1aec2585f0146f09d658d4ccc0e8d873"
> +SRC_URI[camino-1.1.9.sha256sum] =3D
> "8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980879c3424042a02fd1ad3"
> +SRC_URI[cargo-util-0.2.14.sha256sum] =3D
> "cc680c90073156fb5280c0c0127b779eef1f6292e41f7d6621acba3041e81c7d"
> +SRC_URI[cast-0.3.0.sha256sum] =3D
> "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
> +SRC_URI[cc-1.1.19.sha256sum] =3D
> "2d74707dde2ba56f86ae90effb3b43ddd369504387e718014de010cec7959800"
> +SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D
> "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> +SRC_URI[charset-0.1.5.sha256sum] =3D
> "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
> +SRC_URI[ciborium-0.2.2.sha256sum] =3D
> "42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e"
> +SRC_URI[ciborium-io-0.2.2.sha256sum] =3D
> "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
> +SRC_URI[ciborium-ll-0.2.2.sha256sum] =3D
> "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
> +SRC_URI[clap-4.5.18.sha256sum] =3D
> "b0956a43b323ac1afaffc053ed5c4b7c1f1800bacd1683c353aabbb752515dd3"
> +SRC_URI[clap_builder-4.5.18.sha256sum] =3D
> "4d72166dd41634086d5803a47eb71ae740e61d84709c36f3c34110173db3961b"
> +SRC_URI[clap_complete-4.5.26.sha256sum] =3D
> "205d5ef6d485fa47606b98b0ddc4ead26eb850aaa86abfb562a94fb3280ecba0"
> +SRC_URI[clap_complete_command-0.6.1.sha256sum] =3D
> "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
> +SRC_URI[clap_complete_nushell-4.5.3.sha256sum] =3D
> "5fe32110e006bccf720f8c9af3fee1ba7db290c724eab61544e1d3295be3a40e"
> +SRC_URI[clap_derive-4.5.18.sha256sum] =3D
> "4ac6a0c7b1a9e9a5186361f67dfa1b88213572f427fb9ab038efb2bd8c582dab"
> +SRC_URI[clap_lex-0.7.2.sha256sum] =3D
> "1462739cb27611015575c0c11df5df7601141071f07518d56fcc1be504cbec97"
> +SRC_URI[cmake-0.1.51.sha256sum] =3D
> "fb1e43aa7fd152b1f968787f7dbcdeb306d1867ff373c69955211876c053f91a"
> +SRC_URI[codspeed-2.7.2.sha256sum] =3D
> "450a0e9df9df1c154156f4344f99d8f6f6e69d0fc4de96ef6e2e68b2ec3bce97"
> +SRC_URI[codspeed-criterion-compat-2.7.2.sha256sum] =3D
> "8eb1a6cb9c20e177fde58cdef97c1c7c9264eb1424fe45c4fccedc2fb078a569"
> +SRC_URI[color_quant-1.1.0.sha256sum] =3D
> "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"
> +SRC_URI[colorchoice-1.0.2.sha256sum] =3D
> "d3fd119d74b830634cea2a0f58bbd0d54540518a14397557951e79340abc28c0"
> +SRC_URI[colored-2.1.0.sha256sum] =3D
> "cbf2150cce219b664a8a70df7a1f933836724b503f8a413af9365b4dcc4d90b8"
> +SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D
> "4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973"
> +SRC_URI[configparser-3.1.0.sha256sum] =3D
> "e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b"
> +SRC_URI[console-0.15.8.sha256sum] =3D
> "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
> +SRC_URI[core-foundation-0.9.4.sha256sum] =3D
> "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
> +SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D
> "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
> +SRC_URI[cpufeatures-0.2.14.sha256sum] =3D
> "608697df725056feaccfa42cffdaeeec3fccc4ffc38358ecd19b243e716a78e0"
> +SRC_URI[crc32fast-1.4.2.sha256sum] =3D
> "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
> +SRC_URI[criterion-0.5.1.sha256sum] =3D
> "f2b12d017a929603d80db1831cd3a24082f8137ce19c69e6447f54f5fc8d692f"
> +SRC_URI[criterion-plot-0.5.0.sha256sum] =3D
> "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
> +SRC_URI[crossbeam-deque-0.8.5.sha256sum] =3D
> "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
> +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D
> "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
> +SRC_URI[crossbeam-utils-0.8.20.sha256sum] =3D
> "22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80"
> +SRC_URI[crunchy-0.2.2.sha256sum] =3D
> "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
> +SRC_URI[crypto-common-0.1.6.sha256sum] =3D
> "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
> +SRC_URI[csv-1.3.0.sha256sum] =3D
> "ac574ff4d437a7b5ad237ef331c17ccca63c46479e5b5453eb8e10bb99a759fe"
> +SRC_URI[csv-core-0.1.11.sha256sum] =3D
> "5efa2b3d7902f4b634a20cae3c9c4e6209dc4779feb6863329607560143efa70"
> +SRC_URI[ctrlc-3.4.5.sha256sum] =3D
> "90eeab0aa92f3f9b4e87f258c72b139c207d251f9cbc1080a0086b86a8870dd3"
> +SRC_URI[dashmap-6.1.0.sha256sum] =3D
> "5041cc499144891f3790297212f32a74fb938e5136a14943f338ef9e0ae276cf"
> +SRC_URI[data-encoding-2.6.0.sha256sum] =3D
> "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
> +SRC_URI[data-url-0.2.0.sha256sum] =3D
> "8d7439c3735f405729d52c3fbbe4de140eaf938a1fe47d227c27f8254d4302a5"
> +SRC_URI[deadpool-0.10.0.sha256sum] =3D
> "fb84100978c1c7b37f09ed3ce3e5f843af02c2a2c431bae5b19230dad2c1b490"
> +SRC_URI[deadpool-runtime-0.1.4.sha256sum] =3D
> "092966b41edc516079bdf31ec78a2e0588d1d0c08f78b91d8307215928642b2b"
> +SRC_URI[diff-0.1.13.sha256sum] =3D
> "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
> +SRC_URI[difflib-0.4.0.sha256sum] =3D
> "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
> +SRC_URI[digest-0.10.7.sha256sum] =3D
> "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
> +SRC_URI[directories-5.0.1.sha256sum] =3D
> "9a49173b84e034382284f27f1af4dcbbd231ffa358c0fe316541a7337f376a35"
> +SRC_URI[dirs-sys-0.4.1.sha256sum] =3D
> "520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c"
> +SRC_URI[doc-comment-0.3.3.sha256sum] =3D
> "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
> +SRC_URI[dunce-1.0.5.sha256sum] =3D
> "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
> +SRC_URI[dyn-clone-1.0.17.sha256sum] =3D
> "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
> +SRC_URI[either-1.13.0.sha256sum] =3D
> "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
> +SRC_URI[encode_unicode-0.3.6.sha256sum] =3D
> "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
> +SRC_URI[encoding_rs-0.8.34.sha256sum] =3D
> "b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59"
> +SRC_URI[encoding_rs_io-0.1.7.sha256sum] =3D
> "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
> +SRC_URI[equivalent-1.0.1.sha256sum] =3D
> "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
> +SRC_URI[erased-serde-0.4.5.sha256sum] =3D
> "24e2389d65ab4fab27dc2a5de7b191e1f6617d1f1c8855c0dc569c94a4cbb18d"
> +SRC_URI[errno-0.3.9.sha256sum] =3D
> "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
> +SRC_URI[etcetera-0.8.0.sha256sum] =3D
> "136d1b5283a1ab77bd9257427ffd09d8667ced0570b6f938942bc7568ed5b943"
> +SRC_URI[event-listener-5.3.1.sha256sum] =3D
> "6032be9bd27023a771701cc49f9f053c751055f71efb2e0ae5c15809093675ba"
> +SRC_URI[event-listener-strategy-0.5.2.sha256sum] =3D
> "0f214dc438f977e6d4e3500aaa277f5ad94ca83fbbd9b1a15713ce2344ccc5a1"
> +SRC_URI[fastrand-2.1.1.sha256sum] =3D
> "e8c02a5121d4ea3eb16a80748c74f5549a5665e4c21333c6098f283870fbdea6"
> +SRC_URI[fdeflate-0.3.4.sha256sum] =3D
> "4f9bfee30e4dedf0ab8b422f03af778d9612b63f502710fc500a334ebe2de645"
> +SRC_URI[filetime-0.2.25.sha256sum] =3D
> "35c0522e981e68cbfa8c3f978441a5f34b30b96e146b33cd3359176b50fe8586"
> +SRC_URI[fixedbitset-0.4.2.sha256sum] =3D
> "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
> +SRC_URI[flate2-1.0.34.sha256sum] =3D
> "a1b589b4dc103969ad3cf85c950899926ec64300a1a46d76c03a6072957036f0"
> +SRC_URI[float-cmp-0.9.0.sha256sum] =3D
> "98de4bbd547a563b716d8dfa9aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4"
> +SRC_URI[fnv-1.0.7.sha256sum] =3D
> "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
> +SRC_URI[fontconfig-parser-0.5.7.sha256sum] =3D
> "c1fcfcd44ca6e90c921fee9fa665d530b21ef1327a4c1a6c5250ea44b776ada7"
> +SRC_URI[fontdb-0.12.0.sha256sum] =3D
> "ff20bef7942a72af07104346154a70a70b089c572e454b41bef6eb6cb10e9c06"
> +SRC_URI[form_urlencoded-1.2.1.sha256sum] =3D
> "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
> +SRC_URI[fs-err-2.11.0.sha256sum] =3D
> "88a41f105fe1d5b6b34b2055e3dc59bb79b46b48b2040b9e6c7b4b5de097aa41"
> +SRC_URI[fs2-0.4.3.sha256sum] =3D
> "9564fc758e15025b46aa6643b1b77d047d1a56a1aea6e01002ac0c7026876213"
> +SRC_URI[futures-0.3.30.sha256sum] =3D
> "645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0"
> +SRC_URI[futures-channel-0.3.30.sha256sum] =3D
> "eac8f7d7865dcb88bd4373ab671c8cf4508703796caa2b1985a9ca867b3fcb78"
> +SRC_URI[futures-core-0.3.30.sha256sum] =3D
> "dfc6580bb841c5a68e9ef15c77ccc837b40a7504914d52e47b8b0e9bbda25a1d"
> +SRC_URI[futures-executor-0.3.30.sha256sum] =3D
> "a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d"
> +SRC_URI[futures-io-0.3.30.sha256sum] =3D
> "a44623e20b9681a318efdd71c299b6b222ed6f231972bfe2f224ebad6311f0c1"
> +SRC_URI[futures-lite-2.3.0.sha256sum] =3D
> "52527eb5074e35e9339c6b4e8d12600c7128b68fb25dcb9fa9dec18f7c25f3a5"
> +SRC_URI[futures-macro-0.3.30.sha256sum] =3D
> "87750cf4b7a4c0625b1529e4c543c2182106e4dedc60a2a6455e00d212c489ac"
> +SRC_URI[futures-sink-0.3.30.sha256sum] =3D
> "9fb8e00e87438d937621c1c6269e53f536c14d3fbd6a042bb24879e57d474fb5"
> +SRC_URI[futures-task-0.3.30.sha256sum] =3D
> "38d84fa142264698cdce1a9f9172cf383a0c82de1bddcf3092901442c4097004"
> +SRC_URI[futures-util-0.3.30.sha256sum] =3D
> "3d6401deb83407ab3da39eba7e33987a73c3df0c82b4bb5813ee871c19c41d48"
> +SRC_URI[generic-array-0.14.7.sha256sum] =3D
> "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
> +SRC_URI[getrandom-0.2.15.sha256sum] =3D
> "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
> +SRC_URI[gif-0.12.0.sha256sum] =3D
> "80792593675e051cf94a4b111980da2ba60d4a83e43e0048c5693baab3977045"
> +SRC_URI[gimli-0.31.0.sha256sum] =3D
> "32085ea23f3234fc7846555e85283ba4de91e21016dc0455a16286d87a292d64"
> +SRC_URI[glob-0.3.1.sha256sum] =3D
> "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
> +SRC_URI[globset-0.4.15.sha256sum] =3D
> "15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19"
> +SRC_URI[globwalk-0.9.1.sha256sum] =3D
> "0bf760ebf69878d9fd8f110c89703d90ce35095324d1f1edcb595c63945ee757"
> +SRC_URI[goblin-0.8.2.sha256sum] =3D
> "1b363a30c165f666402fe6a3024d3bec7ebc898f96a4a23bd1c99f8dbf3f4f47"
> +SRC_URI[h2-0.4.6.sha256sum] =3D
> "524e8ac6999421f49a846c2d4411f337e53497d8ec55d67753beffa43c5d9205"
> +SRC_URI[half-2.4.1.sha256sum] =3D
> "6dd08c532ae367adf81c312a4580bc67f1d0fe8bc9c460520283f4c0ff277888"
> +SRC_URI[hashbrown-0.14.5.sha256sum] =3D
> "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
> +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[hermit-abi-0.3.9.sha256sum] =3D
> "d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024"
> +SRC_URI[hermit-abi-0.4.0.sha256sum] =3D
> "fbf6a919d6cf397374f7dfeeea91d974c7c0a7221d0d0f4f20d859d329e53fcc"
> +SRC_URI[hex-0.4.3.sha256sum] =3D
> "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
> +SRC_URI[home-0.5.9.sha256sum] =3D
> "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
> +SRC_URI[homedir-0.3.3.sha256sum] =3D
> "2bed305c13ce3829a09d627f5d43ff738482a09361ae4eb8039993b55fb10e5e"
> +SRC_URI[html-escape-0.2.13.sha256sum] =3D
> "6d1ad449764d627e22bfd7cd5e8868264fc9236e07c752972b4080cd351cb476"
> +SRC_URI[http-1.1.0.sha256sum] =3D
> "21b9ddb458710bc376481b842f5da65cdf31522de232c1ca8146abce2a358258"
> +SRC_URI[http-body-1.0.1.sha256sum] =3D
> "1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62566c93184"
> +SRC_URI[http-body-util-0.1.2.sha256sum] =3D
> "793429d76616a256bcb62c2a2ec2bed781c8307e797e2598c50010f2bee2544f"
> +SRC_URI[http-content-range-0.1.2.sha256sum] =3D
> "9f0d1a8ef218a86416107794b34cc446958d9203556c312bb41eab4c924c1d2e"
> +SRC_URI[httparse-1.9.4.sha256sum] =3D
> "0fcc0b4a115bf80b728eb8ea024ad5bd707b615bfed49e0665b6e0f86fd082d9"
> +SRC_URI[httpdate-1.0.3.sha256sum] =3D
> "df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9"
> +SRC_URI[hyper-1.4.1.sha256sum] =3D
> "50dfd22e0e76d0f662d429a5f80fcaf3855009297eab6a0a9f8543834744ba05"
> +SRC_URI[hyper-rustls-0.27.3.sha256sum] =3D
> "08afdbb5c31130e3034af566421053ab03787c640246a446327f550d11bcb333"
> +SRC_URI[hyper-util-0.1.9.sha256sum] =3D
> "41296eb09f183ac68eec06e03cdbea2e759633d4067b2f6552fc2e009bcad08b"
> +SRC_URI[idna-0.5.0.sha256sum] =3D
> "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
> +SRC_URI[ignore-0.4.23.sha256sum] =3D
> "6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b"
> +SRC_URI[image-0.25.2.sha256sum] =3D
> "99314c8a2152b8ddb211f924cdae532d8c5e4c8bb54728e12fff1b0cd5963a10"
> +SRC_URI[imagesize-0.11.0.sha256sum] =3D
> "b72ad49b554c1728b1e83254a1b1565aea4161e28dabbfa171fc15fe62299caf"
> +SRC_URI[indexmap-2.5.0.sha256sum] =3D
> "68b900aa2f7301e21c36462b170ee99994de34dff39a4a6a528e80e7376d07e5"
> +SRC_URI[indicatif-0.17.8.sha256sum] =3D
> "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
> +SRC_URI[indoc-2.0.5.sha256sum] =3D
> "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
> +SRC_URI[insta-1.40.0.sha256sum] =3D
> "6593a41c7a73841868772495db7dc1e8ecab43bb5c0b6da2059246c4b506ab60"
> +SRC_URI[instant-0.1.13.sha256sum] =3D
> "e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222"
> +SRC_URI[ipnet-2.10.0.sha256sum] =3D
> "187674a687eed5fe42285b40c6291f9a01517d415fad1c3cbc6a9f778af7fcd4"
> +SRC_URI[is-terminal-0.4.13.sha256sum] =3D
> "261f68e344040fbd0edea105bef17c66edf46f984ddb1115b775ce31be948f4b"
> +SRC_URI[is_ci-1.2.0.sha256sum] =3D
> "7655c9839580ee829dfacba1d1278c2b7883e50a277ff7541299489d6bdfdc45"
> +SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D
> "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
> +SRC_URI[itertools-0.10.5.sha256sum] =3D
> "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
> +SRC_URI[itertools-0.12.1.sha256sum] =3D
> "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
> +SRC_URI[itertools-0.13.0.sha256sum] =3D
> "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
> +SRC_URI[itoa-1.0.11.sha256sum] =3D
> "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
> +SRC_URI[jiff-0.1.13.sha256sum] =3D
> "8a45489186a6123c128fdf6016183fcfab7113e1820eb813127e036e287233fb"
> +SRC_URI[jiff-tzdb-0.1.1.sha256sum] =3D
> "91335e575850c5c4c673b9bd467b0e025f164ca59d0564f69d0c2ee0ffad4653"
> +SRC_URI[jiff-tzdb-platform-0.1.1.sha256sum] =3D
> "9835f0060a626fe59f160437bc725491a6af23133ea906500027d1bd2f8f4329"
> +SRC_URI[jobserver-0.1.32.sha256sum] =3D
> "48d1dbcbbeb6a7fec7e059840aa538bd62aaccf972c7346c4d9d2059312853d0"
> +SRC_URI[jpeg-decoder-0.3.1.sha256sum] =3D
> "f5d4a7da358eff58addd2877a45865158f0d78c911d43a5784ceb7bbf52833b0"
> +SRC_URI[js-sys-0.3.70.sha256sum] =3D
> "1868808506b929d7b0cfa8f75951347aa71bb21144b7791bae35d9bccfcfe37a"
> +SRC_URI[junction-1.2.0.sha256sum] =3D
> "72bbdfd737a243da3dfc1f99ee8d6e166480f17ab4ac84d7c34aacd73fc7bd16"
> +SRC_URI[krata-tokio-tar-0.4.2.sha256sum] =3D
> "e8bd5fee9b96acb5fc36b401896d601e6fdcce52b0e651ce24a3b21fb524e79f"
> +SRC_URI[kurbo-0.8.3.sha256sum] =3D
> "7a53776d271cfb873b17c618af0298445c88afc52837f3e948fa3fafd131f449"
> +SRC_URI[kurbo-0.9.5.sha256sum] =3D
> "bd85a5776cd9500c2e2059c8c76c3b01528566b7fcbaf8098b55a33fc298849b"
> +SRC_URI[lazy_static-1.5.0.sha256sum] =3D
> "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
> +SRC_URI[libc-0.2.158.sha256sum] =3D
> "d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439"
> +SRC_URI[libmimalloc-sys-0.1.39.sha256sum] =3D
> "23aa6811d3bd4deb8a84dde645f943476d13b248d818edcf8ce0b2f37f036b44"
> +SRC_URI[libredox-0.1.3.sha256sum] =3D
> "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
> +SRC_URI[libz-ng-sys-1.1.16.sha256sum] =3D
> "4436751a01da56f1277f323c80d584ffad94a3d14aecd959dd0dff75aa73a438"
> +SRC_URI[linked-hash-map-0.5.6.sha256sum] =3D
> "0717cef1bc8b636c6e1c1bbdefc09e6322da8a9321966e8928ef80d20f7f770f"
> +SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D
> "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
> +SRC_URI[lock_api-0.4.12.sha256sum] =3D
> "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
> +SRC_URI[log-0.4.22.sha256sum] =3D
> "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
> +SRC_URI[lzma-sys-0.1.20.sha256sum] =3D
> "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
> +SRC_URI[mailparse-0.15.0.sha256sum] =3D
> "3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e"
> +SRC_URI[markdown-0.3.0.sha256sum] =3D
> "ef3aab6a1d529b112695f72beec5ee80e729cb45af58663ec902c8fac764ecdd"
> +SRC_URI[matchers-0.1.0.sha256sum] =3D
> "8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558"
> +SRC_URI[md-5-0.10.6.sha256sum] =3D
> "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
> +SRC_URI[memchr-2.7.4.sha256sum] =3D
> "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
> +SRC_URI[memmap2-0.5.10.sha256sum] =3D
> "83faa42c0a078c393f6b29d5db232d8be22776a891f8f56e5284faee4a20b327"
> +SRC_URI[memmap2-0.9.5.sha256sum] =3D
> "fd3f7eed9d3848f8b98834af67102b720745c4ec028fcd0aa0239277e7de374f"
> +SRC_URI[memoffset-0.7.1.sha256sum] =3D
> "5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4"
> +SRC_URI[miette-7.2.0.sha256sum] =3D
> "4edc8853320c2a0dab800fbda86253c8938f6ea88510dc92c5f1ed20e794afc1"
> +SRC_URI[miette-derive-7.2.0.sha256sum] =3D
> "dcf09caffaac8068c346b6df2a7fc27a177fd20b39421a39ce0a211bde679a6c"
> +SRC_URI[mimalloc-0.1.43.sha256sum] =3D
> "68914350ae34959d83f732418d51e2427a794055d0b9529f48259ac07af65633"
> +SRC_URI[mime-0.3.17.sha256sum] =3D
> "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
> +SRC_URI[mime_guess-2.0.5.sha256sum] =3D
> "f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e"
> +SRC_URI[miniz_oxide-0.7.4.sha256sum] =3D
> "b8a240ddb74feaf34a79a7add65a741f3167852fba007066dcac1ca548d89c08"
> +SRC_URI[miniz_oxide-0.8.0.sha256sum] =3D
> "e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1"
> +SRC_URI[mio-1.0.2.sha256sum] =3D
> "80e04d1dcff3aae0704555fe5fee3bcfaf3d1fdf8a7e521d5b9d2b42acb52cec"
> +SRC_URI[miow-0.6.0.sha256sum] =3D
> "359f76430b20a79f9e20e115b3428614e654f04fab314482fc0fda0ebd3c6044"
> +SRC_URI[munge-0.4.1.sha256sum] =3D
> "64142d38c84badf60abf06ff9bd80ad2174306a5b11bd4706535090a30a419df"
> +SRC_URI[munge_macro-0.4.1.sha256sum] =3D
> "1bb5c1d8184f13f7d0ccbeeca0def2f9a181bce2624302793005f5ca8aa62e5e"
> +SRC_URI[nanoid-0.4.0.sha256sum] =3D
> "3ffa00dec017b5b1a8b7cf5e2c008bfda1aa7e0697ac1508b491fdf2622fb4d8"
> +SRC_URI[nix-0.26.4.sha256sum] =3D
> "598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1b"
> +SRC_URI[nix-0.29.0.sha256sum] =3D
> "71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46"
> +SRC_URI[normalize-line-endings-0.3.0.sha256sum] =3D
> "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
> +SRC_URI[nu-ansi-term-0.46.0.sha256sum] =3D
> "77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84"
> +SRC_URI[nu-ansi-term-0.50.1.sha256sum] =3D
> "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
> +SRC_URI[num-traits-0.2.19.sha256sum] =3D
> "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
> +SRC_URI[num_cpus-1.16.0.sha256sum] =3D
> "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43"
> +SRC_URI[number_prefix-0.4.0.sha256sum] =3D
> "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
> +SRC_URI[object-0.36.4.sha256sum] =3D
> "084f1a5821ac4c651660a94a7153d27ac9d8a53736203f58b31945ded098070a"
> +SRC_URI[once_cell-1.20.0.sha256sum] =3D
> "33ea5043e58958ee56f3e15a90aee535795cd7dfd319846288d93c5b57d85cbe"
> +SRC_URI[oorandom-11.1.4.sha256sum] =3D
> "b410bbe7e14ab526a0e86877eb47c6996a2bd7746f027ba551028c925390e4e9"
> +SRC_URI[openssl-probe-0.1.5.sha256sum] =3D
> "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
> +SRC_URI[option-ext-0.2.0.sha256sum] =3D
> "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
> +SRC_URI[overload-0.1.1.sha256sum] =3D
> "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
> +SRC_URI[owo-colors-4.1.0.sha256sum] =3D
> "fb37767f6569cd834a413442455e0f066d0d522de8630436e2a1761d9726ba56"
> +SRC_URI[parking-2.2.1.sha256sum] =3D
> "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
> +SRC_URI[parking_lot-0.11.2.sha256sum] =3D
> "7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99"
> +SRC_URI[parking_lot-0.12.3.sha256sum] =3D
> "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
> +SRC_URI[parking_lot_core-0.8.6.sha256sum] =3D
> "60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd44a23efa72aa342d90177356dc"
> +SRC_URI[parking_lot_core-0.9.10.sha256sum] =3D
> "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
> +SRC_URI[paste-1.0.15.sha256sum] =3D
> "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
> +SRC_URI[path-slash-0.2.1.sha256sum] =3D
> "1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42"
> +SRC_URI[pathdiff-0.2.1.sha256sum] =3D
> "8835116a5c179084a830efb3adc117ab007512b535bc1a21c991d3b32a6b44dd"
> +SRC_URI[percent-encoding-2.3.1.sha256sum] =3D
> "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
> +SRC_URI[pest-2.7.12.sha256sum] =3D
> "9c73c26c01b8c87956cea613c907c9d6ecffd8d18a2a5908e5de0adfaa185cea"
> +SRC_URI[pest_derive-2.7.12.sha256sum] =3D
> "664d22978e2815783adbdd2c588b455b1bd625299ce36b2a99881ac9627e6d8d"
> +SRC_URI[pest_generator-2.7.12.sha256sum] =3D
> "a2d5487022d5d33f4c30d91c22afa240ce2a644e87fe08caad974d4eab6badbe"
> +SRC_URI[pest_meta-2.7.12.sha256sum] =3D
> "0091754bbd0ea592c4deb3a122ce8ecbb0753b738aa82bc055fcc2eccc8d8174"
> +SRC_URI[petgraph-0.6.5.sha256sum] =3D
> "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
> +SRC_URI[pico-args-0.5.0.sha256sum] =3D
> "5be167a7af36ee22fe3115051bc51f6e6c7054c9348e28deb4f49bd6f705a315"
> +SRC_URI[pin-project-1.1.5.sha256sum] =3D
> "b6bf43b791c5b9e34c3d182969b4abb522f9343702850a2e57f460d00d09b4b3"
> +SRC_URI[pin-project-internal-1.1.5.sha256sum] =3D
> "2f38a4412a78282e09a2cf38d195ea5420d15ba0602cb375210efbc877243965"
> +SRC_URI[pin-project-lite-0.2.14.sha256sum] =3D
> "bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d1aaa6923f45801bdd02"
> +SRC_URI[pin-utils-0.1.0.sha256sum] =3D
> "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> +SRC_URI[pipeline-0.5.0.sha256sum] =3D
> "d15b6607fa632996eb8a17c9041cb6071cb75ac057abd45dece578723ea8c7c0"
> +SRC_URI[pkg-config-0.3.30.sha256sum] =3D
> "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
> +SRC_URI[plain-0.2.3.sha256sum] =3D
> "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
> +SRC_URI[platform-info-2.0.4.sha256sum] =3D
> "91077ffd05d058d70d79eefcd7d7f6aac34980860a7519960f7913b6563a8c3a"
> +SRC_URI[png-0.17.13.sha256sum] =3D
> "06e4b0d3d1312775e782c86c91a111aa1f910cbb65e1337f9975b5f9a554b5e1"
> +SRC_URI[poloto-19.1.2.sha256sum] =3D
> "164dbd541c9832e92fa34452e9c2e98b515a548a3f8549fb2402fe1cd5e46b96"
> +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D
> "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
> +SRC_URI[ppv-lite86-0.2.20.sha256sum] =3D
> "77957b295656769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04"
> +SRC_URI[predicates-3.1.2.sha256sum] =3D
> "7e9086cc7640c29a356d1a29fd134380bee9d8f79a17410aa76e7ad295f42c97"
> +SRC_URI[predicates-core-1.0.8.sha256sum] =3D
> "ae8177bee8e75d6846599c6b9ff679ed51e882816914eec639944d7c9aa11931"
> +SRC_URI[predicates-tree-1.0.11.sha256sum] =3D
> "41b740d195ed3166cd147c8047ec98db0e22ec019eb8eeb76d343b795304fb13"
> +SRC_URI[pretty_assertions-1.4.1.sha256sum] =3D
> "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
> +SRC_URI[priority-queue-2.1.0.sha256sum] =3D
> "560bcab673ff7f6ca9e270c17bf3affd8a05e3bd9207f123b0d45076fd8197e8"
> +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
> "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
> +SRC_URI[ptr_meta-0.3.0.sha256sum] =3D
> "fe9e76f66d3f9606f44e45598d155cb13ecf09f4a28199e48daf8c8fc937ea90"
> +SRC_URI[ptr_meta_derive-0.3.0.sha256sum] =3D
> "ca414edb151b4c8d125c12566ab0d74dc9cdba36fb80eb7b848c15f495fd32d1"
> +SRC_URI[quinn-0.11.5.sha256sum] =3D
> "8c7c5fdde3cdae7203427dc4f0a68fe0ed09833edc525a03456b153b79828684"
> +SRC_URI[quinn-proto-0.11.8.sha256sum] =3D
> "fadfaed2cd7f389d0161bb73eeb07b7b78f8691047a6f3e73caaeae55310a4a6"
> +SRC_URI[quinn-udp-0.5.5.sha256sum] =3D
> "4fe68c2e9e1a1234e218683dbdf9f9dfcb094113c5ac2b938dfcb9bab4c4140b"
> +SRC_URI[quote-1.0.37.sha256sum] =3D
> "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
> +SRC_URI[quoted_printable-0.5.1.sha256sum] =3D
> "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
> +SRC_URI[rancor-0.1.0.sha256sum] =3D
> "caf5f7161924b9d1cea0e4cabc97c372cea92b5f927fc13c6bca67157a0ad947"
> +SRC_URI[rand-0.8.5.sha256sum] =3D
> "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
> +SRC_URI[rand_chacha-0.3.1.sha256sum] =3D
> "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> +SRC_URI[rand_core-0.6.4.sha256sum] =3D
> "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> +SRC_URI[rayon-1.10.0.sha256sum] =3D
> "b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa"
> +SRC_URI[rayon-core-1.12.1.sha256sum] =3D
> "1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2"
> +SRC_URI[rctree-0.5.0.sha256sum] =3D
> "3b42e27ef78c35d3998403c1d26f3efd9e135d3e5121b0a4845cc5cc27547f4f"
> +SRC_URI[redox_syscall-0.2.16.sha256sum] =3D
> "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
> +SRC_URI[redox_syscall-0.3.5.sha256sum] =3D
> "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
> +SRC_URI[redox_syscall-0.5.4.sha256sum] =3D
> "0884ad60e090bf1345b93da0a5de8923c93884cd03f40dfcfddd3b4bee661853"
> +SRC_URI[redox_users-0.4.6.sha256sum] =3D
> "ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43"
> +SRC_URI[reflink-copy-0.1.19.sha256sum] =3D
> "dc31414597d1cd7fdd2422798b7652a6329dda0fe0219e6335a13d5bcaa9aeb6"
> +SRC_URI[regex-1.11.0.sha256sum] =3D
> "38200e5ee88914975b69f657f0801b6f6dccafd44fd9326302a4aaeecfacb1d8"
> +SRC_URI[regex-automata-0.1.10.sha256sum] =3D
> "6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132"
> +SRC_URI[regex-automata-0.4.8.sha256sum] =3D
> "368758f23274712b504848e9d5a6f010445cc8b87a7cdb4d7cbee666c1288da3"
> +SRC_URI[regex-syntax-0.6.29.sha256sum] =3D
> "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
> +SRC_URI[regex-syntax-0.8.5.sha256sum] =3D
> "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
> +SRC_URI[rend-0.5.1.sha256sum] =3D
> "a31c1f1959e4db12c985c0283656be0925f1539549db1e47c4bd0b8b599e1ef7"
> +SRC_URI[reqwest-0.12.7.sha256sum] =3D
> "f8f4955649ef5c38cc7f9e8aa41761d48fb9677197daea9984dc54f56aad5e63"
> +SRC_URI[resvg-0.29.0.sha256sum] =3D
> "76888219c0881e22b0ceab06fddcfe83163cd81642bd60c7842387f9c968a72e"
> +SRC_URI[retry-policies-0.4.0.sha256sum] =3D
> "5875471e6cab2871bc150ecb8c727db5113c9338cc3354dc5ee3425b6aa40a1c"
> +SRC_URI[rgb-0.8.50.sha256sum] =3D
> "57397d16646700483b67d2dd6511d79318f9d057fdbd21a4066aeac8b41d310a"
> +SRC_URI[ring-0.17.8.sha256sum] =3D
> "c17fa4cb658e3583423e915b9f3acc01cceaee1860e33d59ebae66adc3a2dc0d"
> +SRC_URI[rkyv-0.8.8.sha256sum] =3D
> "395027076c569819ea6035ee62e664f5e03d74e281744f55261dd1afd939212b"
> +SRC_URI[rkyv_derive-0.8.8.sha256sum] =3D
> "09cb82b74b4810f07e460852c32f522e979787691b0b7b7439fe473e49d49b2f"
> +SRC_URI[rmp-0.8.14.sha256sum] =3D
> "228ed7c16fa39782c3b3468e974aec2795e9089153cd08ee2e9aefb3613334c4"
> +SRC_URI[rmp-serde-1.3.0.sha256sum] =3D
> "52e599a477cf9840e92f2cde9a7189e67b42c57532749bf90aea6ec10facd4db"
> +SRC_URI[rosvgtree-0.1.0.sha256sum] =3D
> "bdc23d1ace03d6b8153c7d16f0708cd80b61ee8e80304954803354e67e40d150"
> +SRC_URI[roxmltree-0.18.1.sha256sum] =3D
> "862340e351ce1b271a378ec53f304a5558f7db87f3769dc655a8f6ecbb68b302"
> +SRC_URI[roxmltree-0.20.0.sha256sum] =3D
> "6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97"
> +SRC_URI[rust-netrc-0.1.1.sha256sum] =3D
> "32662f97cbfdbad9d5f78f1338116f06871e7dae4fd37e9f59a0f57cf2044868"
> +SRC_URI[rustc-demangle-0.1.24.sha256sum] =3D
> "719b953e2095829ee67db738b3bfa9fa368c94900df327b3f07fe6e794d2fe1f"
> +SRC_URI[rustc-hash-2.0.0.sha256sum] =3D
> "583034fd73374156e66797ed8e5b0d5690409c9226b22d87cb7f19821c05d152"
> +SRC_URI[rustix-0.38.37.sha256sum] =3D
> "8acb788b847c24f28525660c4d7758620a7210875711f79e7f663cc152726811"
> +SRC_URI[rustls-0.23.13.sha256sum] =3D
> "f2dabaac7466917e566adb06783a81ca48944c6898a1b08b9374106dd671f4c8"
> +SRC_URI[rustls-native-certs-0.7.3.sha256sum] =3D
> "e5bfb394eeed242e909609f56089eecfe5fda225042e8b171791b9c95f5931e5"
> +SRC_URI[rustls-native-certs-0.8.0.sha256sum] =3D
> "fcaf18a4f2be7326cd874a5fa579fae794320a0f388d365dca7e480e55f83f8a"
> +SRC_URI[rustls-pemfile-2.1.3.sha256sum] =3D
> "196fe16b00e106300d3e45ecfcb764fa292a535d7326a29a5875c579c7417425"
> +SRC_URI[rustls-pki-types-1.8.0.sha256sum] =3D
> "fc0a2ce646f8655401bb81e7927b812614bd5d91dbc968696be50603510fcaf0"
> +SRC_URI[rustls-webpki-0.102.8.sha256sum] =3D
> "64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9"
> +SRC_URI[rustybuzz-0.7.0.sha256sum] =3D
> "162bdf42e261bee271b3957691018634488084ef577dddeb6420a9684cab2a6a"
> +SRC_URI[ryu-1.0.18.sha256sum] =3D
> "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
> +SRC_URI[same-file-1.0.6.sha256sum] =3D
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> +SRC_URI[schannel-0.1.24.sha256sum] =3D
> "e9aaafd5a2b6e3d657ff009d82fbd630b6bd54dd4eb06f21693925cdf80f9b8b"
> +SRC_URI[schemars-0.8.21.sha256sum] =3D
> "09c024468a378b7e36765cd36702b7a90cc3cba11654f6685c8f233408e89e92"
> +SRC_URI[schemars_derive-0.8.21.sha256sum] =3D
> "b1eee588578aff73f856ab961cd2f79e36bc45d7ded33a7562adba4667aecc0e"
> +SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> +SRC_URI[scroll-0.12.0.sha256sum] =3D
> "6ab8598aa408498679922eff7fa985c25d58a90771bd6be794434c5277eab1a6"
> +SRC_URI[scroll_derive-0.12.0.sha256sum] =3D
> "7f81c2fde025af7e69b1d1420531c8a8811ca898919db177141a85313b1cb932"
> +SRC_URI[seahash-4.1.0.sha256sum] =3D
> "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
> +SRC_URI[security-framework-2.11.1.sha256sum] =3D
> "897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02"
> +SRC_URI[security-framework-sys-2.11.1.sha256sum] =3D
> "75da29fe9b9b08fe9d6b22b5b4bcbc75d8db3aa31e639aa56bb62e9d46bfceaf"
> +SRC_URI[semver-1.0.23.sha256sum] =3D
> "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
> +SRC_URI[serde-1.0.210.sha256sum] =3D
> "c8e3592472072e6e22e0a54d5904d9febf8508f65fb8552499a1abc7d1078c3a"
> +SRC_URI[serde-untagged-0.1.6.sha256sum] =3D
> "2676ba99bd82f75cae5cbd2c8eda6fa0b8760f18978ea840e980dd5567b5c5b6"
> +SRC_URI[serde_derive-1.0.210.sha256sum] =3D
> "243902eda00fad750862fc144cea25caca5e20d615af0a81bee94ca738f1df1f"
> +SRC_URI[serde_derive_internals-0.29.1.sha256sum] =3D
> "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
> +SRC_URI[serde_json-1.0.128.sha256sum] =3D
> "6ff5456707a1de34e7e37f2a6fd3d3f808c318259cbd01ab6377795054b483d8"
> +SRC_URI[serde_spanned-0.6.7.sha256sum] =3D
> "eb5b1b31579f3811bf615c144393417496f152e12ac8b7663bf664f4a815306d"
> +SRC_URI[serde_urlencoded-0.7.1.sha256sum] =3D
> "d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd"
> +SRC_URI[sha2-0.10.8.sha256sum] =3D
> "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
> +SRC_URI[sharded-slab-0.1.7.sha256sum] =3D
> "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
> +SRC_URI[shell-escape-0.1.5.sha256sum] =3D
> "45bb67a18fa91266cc7807181f62f9178a6873bfad7dc788c42e6430db40184f"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[signal-hook-registry-1.4.2.sha256sum] =3D
> "a9e9e0b4211b72e7b8b6e85c807d36c212bdb33ea8587f7569562a84df5465b1"
> +SRC_URI[simd-adler32-0.3.7.sha256sum] =3D
> "d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe"
> +SRC_URI[simdutf8-0.1.4.sha256sum] =3D
> "f27f6278552951f1f2b8cf9da965d10969b2efdea95a6ec47987ab46edfe263a"
> +SRC_URI[similar-2.6.0.sha256sum] =3D
> "1de1d4f81173b03af4c0cbed3c898f6bff5b870e4a7f5d6f4057d62a7a4b686e"
> +SRC_URI[simplecss-0.2.1.sha256sum] =3D
> "a11be7c62927d9427e9f40f3444d5499d868648e2edbc4e2116de69e7ec0e89d"
> +SRC_URI[siphasher-0.3.11.sha256sum] =3D
> "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
> +SRC_URI[slab-0.4.9.sha256sum] =3D
> "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
> +SRC_URI[smallvec-1.13.2.sha256sum] =3D
> "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
> +SRC_URI[smawk-0.3.2.sha256sum] =3D
> "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
> +SRC_URI[socket2-0.5.7.sha256sum] =3D
> "ce305eb0b4296696835b71df73eb912e0f1ffd2556a501fcede6e0c50349191c"
> +SRC_URI[spin-0.9.8.sha256sum] =3D
> "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
> +SRC_URI[strict-num-0.1.1.sha256sum] =3D
> "6637bab7722d379c8b41ba849228d680cc12d0a45ba1fa2b48f2a30577a06731"
> +SRC_URI[strsim-0.11.1.sha256sum] =3D
> "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
> +SRC_URI[subtle-2.6.1.sha256sum] =3D
> "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
> +SRC_URI[supports-color-3.0.1.sha256sum] =3D
> "8775305acf21c96926c900ad056abeef436701108518cf890020387236ac5a77"
> +SRC_URI[supports-hyperlinks-3.0.0.sha256sum] =3D
> "2c0a1e5168041f5f3ff68ff7d95dcb9c8749df29f6e7e89ada40dd4c9de404ee"
> +SRC_URI[supports-unicode-3.0.0.sha256sum] =3D
> "b7401a30af6cb5818bb64852270bb722533397edcfc7344954a38f420819ece2"
> +SRC_URI[svg-0.17.0.sha256sum] =3D
> "700efb40f3f559c23c18b446e8ed62b08b56b2bb3197b36d57e0470b4102779e"
> +SRC_URI[svgfilters-0.4.0.sha256sum] =3D
> "639abcebc15fdc2df179f37d6f5463d660c1c79cd552c12343a4600827a04bce"
> +SRC_URI[svgtypes-0.9.0.sha256sum] =3D
> "c9ee29c1407a5b18ccfe5f6ac82ac11bab3b14407e09c209a6c1a32098b19734"
> +SRC_URI[svgtypes-0.10.0.sha256sum] =3D
> "98ffacedcdcf1da6579c907279b4f3c5492fbce99fbbf227f5ed270a589c2765"
> +SRC_URI[syn-2.0.79.sha256sum] =3D
> "89132cd0bf050864e1d38dc3bbc07a0eb8e7530af26344d3d2bbbef83499f590"
> +SRC_URI[sync_wrapper-1.0.1.sha256sum] =3D
> "a7065abeca94b6a8a577f9bd45aa0867a2238b74e8eb67cf10d492bc39351394"
> +SRC_URI[sys-info-0.9.1.sha256sum] =3D
> "0b3a0d0aba8bf96a0e1ddfdc352fc53b3df7f39318c71854910c3c4b024ae52c"
> +SRC_URI[tagu-0.1.6.sha256sum] =3D
> "eddb6b06d20fba9ed21fca3d696ee1b6e870bca0bcf9fa2971f6ae2436de576a"
> +SRC_URI[target-lexicon-0.12.16.sha256sum] =3D
> "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
> +SRC_URI[temp-env-0.3.6.sha256sum] =3D
> "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
> +SRC_URI[tempfile-3.13.0.sha256sum] =3D
> "f0f2c9fc62d0beef6951ccffd757e241266a2c833136efbe35af6cd2567dca5b"
> +SRC_URI[terminal_size-0.3.0.sha256sum] =3D
> "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
> +SRC_URI[termtree-0.4.1.sha256sum] =3D
> "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
> +SRC_URI[test-case-3.3.1.sha256sum] =3D
> "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
> +SRC_URI[test-case-core-3.3.1.sha256sum] =3D
> "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
> +SRC_URI[test-case-macros-3.3.1.sha256sum] =3D
> "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
> +SRC_URI[test-log-0.2.16.sha256sum] =3D
> "3dffced63c2b5c7be278154d76b479f9f9920ed34e7574201407f0b14e2bbb93"
> +SRC_URI[test-log-macros-0.2.16.sha256sum] =3D
> "5999e24eaa32083191ba4e425deb75cdf25efefabe5aaccb7446dd0d4122a3f5"
> +SRC_URI[testing_logger-0.1.1.sha256sum] =3D
> "6d92b727cb45d33ae956f7f46b966b25f1bc712092aeef9dba5ac798fc89f720"
> +SRC_URI[textwrap-0.16.1.sha256sum] =3D
> "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
> +SRC_URI[thiserror-1.0.64.sha256sum] =3D
> "d50af8abc119fb8bb6dbabcfa89656f46f84aa0ac7688088608076ad2b459a84"
> +SRC_URI[thiserror-impl-1.0.64.sha256sum] =3D
> "08904e7672f5eb876eaaf87e0ce17857500934f4981c4a0ab2b4aa98baac7fc3"
> +SRC_URI[thread_local-1.1.8.sha256sum] =3D
> "8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c"
> +SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02=
839f328f7.sha256sum]
> =3D "cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48ad05037a677e52e4e2d"
> +SRC_URI[tikv-jemallocator-0.6.0.sha256sum] =3D
> "4cec5ff18518d81584f477e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865"
> +SRC_URI[tiny-skia-0.8.4.sha256sum] =3D
> "df8493a203431061e901613751931f047d1971337153f96d0e5e363d6dbf6a67"
> +SRC_URI[tiny-skia-path-0.8.4.sha256sum] =3D
> "adbfb5d3f3dd57a0e11d12f4f13d4ebbbc1b5c15b7ab0a156d030b21da5f677c"
> +SRC_URI[tinytemplate-1.2.1.sha256sum] =3D
> "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
> +SRC_URI[tinyvec-1.8.0.sha256sum] =3D
> "445e881f4f6d382d5f27c034e25eb92edd7c784ceab92a0937db7f2e9471b938"
> +SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D
> "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> +SRC_URI[tokio-1.40.0.sha256sum] =3D
> "e2b070231665d27ad9ec9b8df639893f46727666c6767db40317fbe920a5d998"
> +SRC_URI[tokio-macros-2.4.0.sha256sum] =3D
> "693d596312e88961bc67d7f1f97af8a70227d9f90c31bba5806eec004978d752"
> +SRC_URI[tokio-rustls-0.26.0.sha256sum] =3D
> "0c7bc40d0e5a97695bb96e27995cd3a08538541b0a846f65bba7a359f36700d4"
> +SRC_URI[tokio-socks-0.5.2.sha256sum] =3D
> "0d4770b8024672c1101b3f6733eab95b18007dbe0847a8afe341fcf79e06043f"
> +SRC_URI[tokio-stream-0.1.16.sha256sum] =3D
> "4f4e6ce100d0eb49a2734f8c0812bcd324cf357d21810932c5df6b96ef2b86f1"
> +SRC_URI[tokio-util-0.7.12.sha256sum] =3D
> "61e7c3654c13bcd040d4a03abee2c75b1d14a37b423cf5a813ceae1cc903ec6a"
> +SRC_URI[toml-0.8.19.sha256sum] =3D
> "a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24e"
> +SRC_URI[toml_datetime-0.6.8.sha256sum] =3D
> "0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41"
> +SRC_URI[toml_edit-0.22.22.sha256sum] =3D
> "4ae48d6208a266e853d946088ed816055e556cc6028c5e8e2b84d9fa5dd7c7f5"
> +SRC_URI[tower-service-0.3.3.sha256sum] =3D
> "8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3"
> +SRC_URI[tracing-0.1.40.sha256sum] =3D
> "c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef"
> +SRC_URI[tracing-attributes-0.1.27.sha256sum] =3D
> "34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7"
> +SRC_URI[tracing-core-0.1.32.sha256sum] =3D
> "c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54"
> +SRC_URI[tracing-durations-export-0.3.0.sha256sum] =3D
> "382e025ef8e0db646343dd2cf56af9d7fe6f5eabce5f388f8e5ec7234f555a0f"
> +SRC_URI[tracing-log-0.2.0.sha256sum] =3D
> "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
> +SRC_URI[tracing-serde-0.1.3.sha256sum] =3D
> "bc6b213177105856957181934e4920de57730fc69bf42c37ee5bb664d406d9e1"
> +SRC_URI[tracing-subscriber-0.3.18.sha256sum] =3D
> "ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b"
> +SRC_URI[tracing-tree-0.4.0.sha256sum] =3D
> "f459ca79f1b0d5f71c54ddfde6debfc59c8b6eeb46808ae492077f739dc7b49c"
> +SRC_URI[try-lock-0.2.5.sha256sum] =3D
> "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
> +SRC_URI[ttf-parser-0.18.1.sha256sum] =3D
> "0609f771ad9c6155384897e1df4d948e692667cc0588548b68eb44d052b27633"
> +SRC_URI[typeid-1.0.2.sha256sum] =3D
> "0e13db2e0ccd5e14a544e8a246ba2312cd25223f616442d7f2cb0e3db614236e"
> +SRC_URI[typenum-1.17.0.sha256sum] =3D
> "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
> +SRC_URI[ucd-trie-0.1.6.sha256sum] =3D
> "ed646292ffc8188ef8ea4d1e0e0150fb15a5c2e12ad9b8fc191ae7a8a7f3c4b9"
> +SRC_URI[unicase-2.7.0.sha256sum] =3D
> "f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89"
> +SRC_URI[unicode-bidi-0.3.15.sha256sum] =3D
> "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
> +SRC_URI[unicode-bidi-mirroring-0.1.0.sha256sum] =3D
> "56d12260fb92d52f9008be7e4bca09f584780eb2266dc8fecc6a192bec561694"
> +SRC_URI[unicode-ccc-0.1.2.sha256sum] =3D
> "cc2520efa644f8268dce4dcd3050eaa7fc044fca03961e9998ac7e2e92b77cf1"
> +SRC_URI[unicode-general-category-0.6.0.sha256sum] =3D
> "2281c8c1d221438e373249e065ca4989c4c36952c211ff21a0ee91c44a3869e7"
> +SRC_URI[unicode-ident-1.0.13.sha256sum] =3D
> "e91b56cd4cadaeb79bbf1a5645f6b4f8dc5bde8834ad5894a8db35fda9efa1fe"
> +SRC_URI[unicode-linebreak-0.1.5.sha256sum] =3D
> "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
> +SRC_URI[unicode-normalization-0.1.23.sha256sum] =3D
> "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5"
> +SRC_URI[unicode-script-0.5.6.sha256sum] =3D
> "ad8d71f5726e5f285a935e9fe8edfd53f0491eb6e9a5774097fdabee7cd8c9cd"
> +SRC_URI[unicode-vo-0.1.0.sha256sum] =3D
> "b1d386ff53b415b7fe27b50bb44679e2cc4660272694b7b6f3326d8480823a94"
> +SRC_URI[unicode-width-0.1.13.sha256sum] =3D
> "0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d"
> +SRC_URI[unscanny-0.1.0.sha256sum] =3D
> "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
> +SRC_URI[untrusted-0.9.0.sha256sum] =3D
> "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
> +SRC_URI[url-2.5.2.sha256sum] =3D
> "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c"
> +SRC_URI[urlencoding-2.1.3.sha256sum] =3D
> "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da"
> +SRC_URI[usvg-0.29.0.sha256sum] =3D
> "63b6bb4e62619d9f68aa2d8a823fea2bff302340a1f2d45c264d5b0be170832e"
> +SRC_URI[usvg-text-layout-0.29.0.sha256sum] =3D
> "195386e01bc35f860db024de275a76e7a31afdf975d18beb6d0e44764118b4db"
> +SRC_URI[utf8-width-0.1.7.sha256sum] =3D
> "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
> +SRC_URI[utf8parse-0.2.2.sha256sum] =3D
> "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
> +SRC_URI[uuid-1.10.0.sha256sum] =3D
> "81dfa00651efa65069b0b6b651f4aaa31ba9e3c3ce0137aaad053604ee7e0314"
> +SRC_URI[valuable-0.1.0.sha256sum] =3D
> "830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d"
> +SRC_URI[version_check-0.9.5.sha256sum] =3D
> "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
> +SRC_URI[wait-timeout-0.2.0.sha256sum] =3D
> "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
> +SRC_URI[walkdir-2.5.0.sha256sum] =3D
> "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
> +SRC_URI[want-0.3.1.sha256sum] =3D
> "bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e"
> +SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D
> "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> +SRC_URI[wasm-bindgen-0.2.93.sha256sum] =3D
> "a82edfc16a6c469f5f44dc7b571814045d60404b55a0ee849f9bcfa2e63dd9b5"
> +SRC_URI[wasm-bindgen-backend-0.2.93.sha256sum] =3D
> "9de396da306523044d3302746f1208fa71d7532227f15e347e2d93e4145dd77b"
> +SRC_URI[wasm-bindgen-futures-0.4.43.sha256sum] =3D
> "61e9300f63a621e96ed275155c108eb6f843b6a26d053f122ab69724559dc8ed"
> +SRC_URI[wasm-bindgen-macro-0.2.93.sha256sum] =3D
> "585c4c91a46b072c92e908d99cb1dcdf95c5218eeb6f3bf1efa991ee7a68cccf"
> +SRC_URI[wasm-bindgen-macro-support-0.2.93.sha256sum] =3D
> "afc340c74d9005395cf9dd098506f7f44e38f2b4a21c6aaacf9a105ea5e1e836"
> +SRC_URI[wasm-bindgen-shared-0.2.93.sha256sum] =3D
> "c62a0a307cb4a311d3a07867860911ca130c3494e8c2719593806c08bc5d0484"
> +SRC_URI[wasm-streams-0.4.0.sha256sum] =3D
> "b65dc4c90b63b118468cf747d8bf3566c1913ef60be765b5730ead9e0a3ba129"
> +SRC_URI[wasm-timer-0.2.5.sha256sum] =3D
> "be0ecb0db480561e9a7642b5d3e4187c128914e58aa84330b9493e3eb68c5e7f"
> +SRC_URI[web-sys-0.3.70.sha256sum] =3D
> "26fdeaafd9bd129f65e7c031593c24d62186301e0c72c8978fa1678be7d532c0"
> +SRC_URI[webpki-roots-0.26.5.sha256sum] =3D
> "0bd24728e5af82c6c4ec1b66ac4844bdf8156257fccda846ec58b42cd0cdbe6a"
> +SRC_URI[weezl-0.1.8.sha256sum] =3D
> "53a85b86a771b1c87058196170769dd264f66c0782acf1ae6cc51bfd64b39082"
> +SRC_URI[which-6.0.3.sha256sum] =3D
> "b4ee928febd44d98f2f459a4a79bd4d928591333a494a10a868418ac1b39cf1f"
> +SRC_URI[widestring-1.1.0.sha256sum] =3D
> "7219d36b6eac893fa81e84ebe06485e7dcbb616177469b142df14f1f4deb1311"
> +SRC_URI[winapi-0.3.9.sha256sum] =3D
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.9.sha256sum] =3D
> "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[windows-0.57.0.sha256sum] =3D
> "12342cb4d8e3b046f3d80effd474a7a02447231330ef77d71daa6fbc40681143"
> +SRC_URI[windows-0.58.0.sha256sum] =3D
> "dd04d41d93c4992d421894c18c8b43496aa748dd4c081bac0dc93eb0489272b6"
> +SRC_URI[windows-core-0.57.0.sha256sum] =3D
> "d2ed2439a290666cd67ecce2b0ffaad89c2a56b976b736e6ece670297897832d"
> +SRC_URI[windows-core-0.58.0.sha256sum] =3D
> "6ba6d44ec8c2591c134257ce647b7ea6b20335bf6379a27dac5f1641fcf59f99"
> +SRC_URI[windows-implement-0.57.0.sha256sum] =3D
> "9107ddc059d5b6fbfbffdfa7a7fe3e22a226def0b2608f72e9d552763d3e1ad7"
> +SRC_URI[windows-implement-0.58.0.sha256sum] =3D
> "2bbd5b46c938e506ecbce286b6628a02171d56153ba733b6c741fc627ec9579b"
> +SRC_URI[windows-interface-0.57.0.sha256sum] =3D
> "29bee4b38ea3cde66011baa44dba677c432a78593e202392d1e9070cf2a7fca7"
> +SRC_URI[windows-interface-0.58.0.sha256sum] =3D
> "053c4c462dc91d3b1504c6fe5a726dd15e216ba718e84a0e46a88fbe5ded3515"
> +SRC_URI[windows-registry-0.2.0.sha256sum] =3D
> "e400001bb720a623c1c69032f8e3e4cf09984deec740f007dd2b03ec864804b0"
> +SRC_URI[windows-result-0.1.2.sha256sum] =3D
> "5e383302e8ec8515204254685643de10811af0ed97ea37210dc26fb0032647f8"
> +SRC_URI[windows-result-0.2.0.sha256sum] =3D
> "1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae0e"
> +SRC_URI[windows-strings-0.1.0.sha256sum] =3D
> "4cd9b125c486025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10"
> +SRC_URI[windows-sys-0.48.0.sha256sum] =3D
> "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
> +SRC_URI[windows-sys-0.52.0.sha256sum] =3D
> "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
> +SRC_URI[windows-sys-0.59.0.sha256sum] =3D
> "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
> +SRC_URI[windows-targets-0.48.5.sha256sum] =3D
> "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
> +SRC_URI[windows-targets-0.52.6.sha256sum] =3D
> "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
> +SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D
> "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> +SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D
> "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> +SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D
> "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> +SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D
> "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
> +SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D
> "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
> +SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D
> "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
> +SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D
> "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> +SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D
> "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> +SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D
> "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> +SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D
> "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> +SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D
> "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> +SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D
> "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> +SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D
> "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> +SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D
> "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> +SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D
> "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +SRC_URI[winnow-0.6.18.sha256sum] =3D
> "68a9bda4691f099d435ad181000724da8e5899daa10713c2d432552b9ccd3a6f"
> +SRC_URI[winreg-0.52.0.sha256sum] =3D
> "a277a57398d4bfa075df44f501a17cfdf8542d224f0d36095a2adc7aee4ef0a5"
> +SRC_URI[winsafe-0.0.19.sha256sum] =3D
> "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
> +SRC_URI[winsafe-0.0.22.sha256sum] =3D
> "7d6ad6cbd9c6e5144971e326303f0e453b61d82e4f72067fccf23106bccd8437"
> +SRC_URI[wiremock-0.6.2.sha256sum] =3D
> "7fff469918e7ca034884c7fd8f93fe27bacb7fcb599fd879df6c7b429a29b646"
> +SRC_URI[xattr-1.3.1.sha256sum] =3D
> "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
> +SRC_URI[xmlparser-0.13.6.sha256sum] =3D
> "66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4"
> +SRC_URI[xz2-0.1.7.sha256sum] =3D
> "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
> +SRC_URI[yansi-1.0.1.sha256sum] =3D
> "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
> +SRC_URI[zerocopy-0.7.35.sha256sum] =3D
> "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
> +SRC_URI[zerocopy-derive-0.7.35.sha256sum] =3D
> "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
> +SRC_URI[zeroize-1.8.1.sha256sum] =3D
> "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
> +SRC_URI[zip-0.6.6.sha256sum] =3D
> "760394e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261"
> +SRC_URI[zstd-0.13.2.sha256sum] =3D
> "fcf2b778a664581e31e389454a7072dab1647606d44f7feea22cd5abb9c9f3f9"
> +SRC_URI[zstd-safe-7.2.1.sha256sum] =3D
> "54a3ab4db68cea366acc5c897c7b4d4d1b8994a9cd6e6f841f8964566a419059"
> +SRC_URI[zstd-sys-2.0.13+zstd.1.5.6.sha256sum] =3D
> "38ff0f21cfee8f97d94cef41359e0c89aa6113028ab0291aa8ca0038995a95aa"
> +# from crates/uv-performance-memory-allocator/Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/cc/1.1.21 \
> +    crate://crates.io/libc/0.2.158 \
> +    crate://crates.io/libmimalloc-sys/0.1.39 \
> +    crate://crates.io/mimalloc/0.1.43 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://
> crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e0=
2839f328f7
> \
> +    crate://crates.io/tikv-jemallocator/0.6.0 \
> +"
> +
> +SRC_URI[cc-1.1.21.sha256sum] =3D
> "07b1695e2c7e8fc85310cde85aeaab7e3097f593c91d209d3f9df76c928100f0"
> +SRC_URI[libc-0.2.158.sha256sum] =3D
> "d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439"
> +SRC_URI[libmimalloc-sys-0.1.39.sha256sum] =3D
> "23aa6811d3bd4deb8a84dde645f943476d13b248d818edcf8ce0b2f37f036b44"
> +SRC_URI[mimalloc-0.1.43.sha256sum] =3D
> "68914350ae34959d83f732418d51e2427a794055d0b9529f48259ac07af65633"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02=
839f328f7.sha256sum]
> =3D "cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48ad05037a677e52e4e2d"
> +SRC_URI[tikv-jemallocator-0.6.0.sha256sum] =3D
> "4cec5ff18518d81584f477e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865"
> +# from crates/uv-performance-flate2-backend/Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/adler2/2.0.0 \
> +    crate://crates.io/cc/1.1.22 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/cmake/0.1.51 \
> +    crate://crates.io/crc32fast/1.4.2 \
> +    crate://crates.io/flate2/1.0.34 \
> +    crate://crates.io/libc/0.2.159 \
> +    crate://crates.io/libz-ng-sys/1.1.16 \
> +    crate://crates.io/miniz_oxide/0.8.0 \
> +    crate://crates.io/shlex/1.3.0 \
> +"
> +
> +SRC_URI[adler2-2.0.0.sha256sum] =3D
> "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
> +SRC_URI[cc-1.1.22.sha256sum] =3D
> "9540e661f81799159abee814118cc139a2004b3a3aa3ea37724a1b66530b90e0"
> +SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[cmake-0.1.51.sha256sum] =3D
> "fb1e43aa7fd152b1f968787f7dbcdeb306d1867ff373c69955211876c053f91a"
> +SRC_URI[crc32fast-1.4.2.sha256sum] =3D
> "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
> +SRC_URI[flate2-1.0.34.sha256sum] =3D
> "a1b589b4dc103969ad3cf85c950899926ec64300a1a46d76c03a6072957036f0"
> +SRC_URI[libc-0.2.159.sha256sum] =3D
> "561d97a539a36e26a9a5fad1ea11a3039a67714694aaa379433e580854bc3dc5"
> +SRC_URI[libz-ng-sys-1.1.16.sha256sum] =3D
> "4436751a01da56f1277f323c80d584ffad94a3d14aecd959dd0dff75aa73a438"
> +SRC_URI[miniz_oxide-0.8.0.sha256sum] =3D
> "e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> diff --git a/meta-python/recipes-devtools/python/python3-uv-gitcrates.inc
> b/meta-python/recipes-devtools/python/python3-uv-gitcrates.inc
> new file mode 100644
> index 000000000..b0df28030
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uv-gitcrates.inc
> @@ -0,0 +1,18 @@
> +# Manually compiled list of crates which are not being vendored by
> crates.io
> +
> +SRC_URI:append =3D " \
> +    git://
> github.com/astral-sh/pubgrub;protocol=3Dhttps;nobranch=3D1;name=3Dpubgrub=
 \
> +    git://
> github.com/astral-sh/reqwest-middleware;protocol=3Dhttps;nobranch=3D1;nam=
e=3Dreqwest-middleware;destsuffix=3Dcargo_home/git/db/reqwest-middleware-01=
3793d24a0516f2
> \
> +"
> +
> +SRCREV_FORMAT .=3D "\
> +    _pubgrub \
> +    _reqwest-middleware \
> +"
> +
> +EXTRA_OECARGO_PATHS +=3D "\
> +    ${UNPACKDIR}/cargo_home/git/db/reqwest-middleware-013793d24a0516f2 \
> +"
> +
> +SRCREV_pubgrub =3D "388685a8711092971930986644cfed152d1a1f6c"
> +SRCREV_reqwest-middleware =3D "5e3eaf254b5bd481c75d2710eed055f95b756913"
> diff --git a/meta-python/recipes-devtools/python/python3-uv_0.4.18.bb
> b/meta-python/recipes-devtools/python/python3-uv_0.4.18.bb
> new file mode 100644
> index 000000000..e9d070abc
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uv_0.4.18.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "An extremely fast Python package and project manager, writt=
en
> in Rust."
> +HOMEPAGE =3D "https://github.com/astral-sh/uv"
> +LICENSE =3D "Apache-2.0 & MIT"
> +LIC_FILES_CHKSUM =3D "\
> +    file://LICENSE-APACHE;md5=3D2b42edef8fa55315f34f2370b4715ca9 \
> +    file://LICENSE-MIT;md5=3Dff9fe97bf0d7fa879a706f86817e1b76 \
> +"
> +
> +require ${BPN}-crates.inc
> +# Several crates are not being vendored by crates.io and this is not
> notices by update_crates at the moment
> +# The crates in question have been placed in a separate inc file in orde=
r
> to still use update_crates for the majority
> +require ${BPN}-gitcrates.inc
> +
> +SRC_URI[sha256sum] =3D
> "954964eff8c7e2bc63dd4beeb8d45bcaddb5149a7ef29a36abd77ec76c8b837e"
> +
> +inherit pypi cargo cargo-update-recipe-crates python_maturin
> +
> +PYPI_PACKAGE =3D "uv"
>
>
> Thanks for any help.
>
> Tom Geelen
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112688):
> https://lists.openembedded.org/g/openembedded-devel/message/112688
> Mute This Topic: https://lists.openembedded.org/mt/108855956/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bac6350623dac296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Oct 6, 2024 at 1:01=E2=80=AFPM Tom Geelen via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;t.f.g.g=
eelen=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div>Hi all,</di=
v>
<div>=C2=A0</div>
<div>I could use some support. Currently I am trying to insert support for =
a new Python package manager which is now a requirement for a Python packag=
e I&#39;m trying to maintain (link: <a href=3D"https://pypi.org/project/uv/=
" rel=3D"noopener" target=3D"_blank">UV</a>). A Rust based package manager.=
</div>
<div>=C2=A0</div>
<div>My problem is when I am creating the recipe not all crates are on <a h=
ref=3D"http://crates.io" target=3D"_blank">crates.io</a>. Several are only =
on github. Now is it possible to have both the normal <a href=3D"http://cra=
tes.io" target=3D"_blank">crates.io</a> as well as another provider side by=
 side?</div>
<div>I have tried checking the Yocto manual and found <a href=3D"https://do=
cs.yoctoproject.org/ref-manual/classes.html#cargo" rel=3D"noopener" target=
=3D"_blank">the class cargo</a> which references an example which does not =
exist anymore: <a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb" rel=3D"noope=
ner" target=3D"_blank">zvariant_3.12.0.bb</a>.</div>
<div>=C2=A0</div></blockquote><div dir=3D"auto">you can see what the zvaria=
nt recipe was:</div><div dir=3D"auto"><div><a href=3D"https://git.openembed=
ded.org/openembedded-core/commit/meta-selftest/recipes-extended?id=3D8a286e=
686e5764f4def0644586dd19e2197ef6c2">https://git.openembedded.org/openembedd=
ed-core/commit/meta-selftest/recipes-extended?id=3D8a286e686e5764f4def06445=
86dd19e2197ef6c2</a></div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto"></di=
v>
<div>I am trying to patch the necessary information together but I am falli=
ng short as I cannot seem to get it to work. I will never configure the sou=
rces correctly.</div>
<div>=C2=A0</div>
<div>My recipe so far:</div>
<blockquote>diff --git a/meta-python/recipes-devtools/python/python3-uv-cra=
tes.inc b/meta-python/recipes-devtools/python/python3-uv-crates.inc<br>new =
file mode 100644<br>index 000000000..e2dde977e<br>--- /dev/null<br>+++ b/me=
ta-python/recipes-devtools/python/python3-uv-crates.inc<br>@@ -0,0 +1,1038 =
@@<br>+# Autogenerated with &#39;bitbake -c update_crates python3-uv&#39;<b=
r>+<br>+# from Cargo.lock<br>+SRC_URI +=3D &quot; \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/addr2line/0.24.1" target=3D"_blank">crates.i=
o/addr2line/0.24.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/adler/1.0.2" target=3D"_blank">crates.io/adler/1.0.2</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/adler2/2.0.0" target=3D"_blank">c=
rates.io/adler2/2.0.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/aho-corasick/1.1.3" target=3D"_blank">crates.io/aho-corasick/1.1.3</=
a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/anes/0.1.6" targ=
et=3D"_blank">crates.io/anes/0.1.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/anstream/0.6.15" target=3D"_blank">crates.io/anstream/=
0.6.15</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/anstyle/=
1.0.8" target=3D"_blank">crates.io/anstyle/1.0.8</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/anstyle-parse/0.2.5" target=3D"_blank">cr=
ates.io/anstyle-parse/0.2.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/anstyle-query/1.1.1" target=3D"_blank">crates.io/anstyle-query=
/1.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/anstyle-=
wincon/3.0.4" target=3D"_blank">crates.io/anstyle-wincon/3.0.4</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/anyhow/1.0.89" target=3D"_=
blank">crates.io/anyhow/1.0.89</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"h=
ttp://crates.io/arrayref/0.3.9" target=3D"_blank">crates.io/arrayref/0.3.9<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/arrayvec/0.7.6"=
 target=3D"_blank">crates.io/arrayvec/0.7.6</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/assert-json-diff/2.0.2" target=3D"_blank">crat=
es.io/assert-json-diff/2.0.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/assert_cmd/2.0.16" target=3D"_blank">crates.io/assert_cmd/2.0=
.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/assert_fs/1=
.1.2" target=3D"_blank">crates.io/assert_fs/1.1.2</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/async-channel/2.3.1" target=3D"_blank">c=
rates.io/async-channel/2.3.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/async-compression/0.4.12" target=3D"_blank">crates.io/async-c=
ompression/0.4.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/async-trait/0.1.83" target=3D"_blank">crates.io/async-trait/0.1.83</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/async_http_range_rea=
der/0.8.0" target=3D"_blank">crates.io/async_http_range_reader/0.8.0</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/atomic-waker/1.1.2" t=
arget=3D"_blank">crates.io/atomic-waker/1.1.2</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/autocfg/1.3.0" target=3D"_blank">crates.io/a=
utocfg/1.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ax=
oasset/1.0.0" target=3D"_blank">crates.io/axoasset/1.0.0</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/axoprocess/0.2.0" target=3D"_blan=
k">crates.io/axoprocess/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/axotag/0.2.0" target=3D"_blank">crates.io/axotag/0.2.0</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/axoupdater/0.7.2" ta=
rget=3D"_blank">crates.io/axoupdater/0.7.2</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/backoff/0.4.0" target=3D"_blank">crates.io/back=
off/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/backt=
race/0.3.74" target=3D"_blank">crates.io/backtrace/0.3.74</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/base64/0.21.7" target=3D"_blank"=
>crates.io/base64/0.21.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://=
crates.io/base64/0.22.1" target=3D"_blank">crates.io/base64/0.22.1</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bisection/0.1.0" target=
=3D"_blank">crates.io/bisection/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/bitflags/1.3.2" target=3D"_blank">crates.io/bitflags=
/1.3.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bitflags=
/2.6.0" target=3D"_blank">crates.io/bitflags/2.6.0</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/block-buffer/0.10.4" target=3D"_blank">=
crates.io/block-buffer/0.10.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/boxcar/0.2.5" target=3D"_blank">crates.io/boxcar/0.2.5</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bstr/1.10.0" target=
=3D"_blank">crates.io/bstr/1.10.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/bumpalo/3.16.0" target=3D"_blank">crates.io/bumpalo/3.=
16.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bytecheck/=
0.8.0" target=3D"_blank">crates.io/bytecheck/0.8.0</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/bytecheck_derive/0.8.0" target=3D"_blan=
k">crates.io/bytecheck_derive/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/bytemuck/1.18.0" target=3D"_blank">crates.io/bytemuck/=
1.18.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/byteorde=
r/1.5.0" target=3D"_blank">crates.io/byteorder/1.5.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/byteorder-lite/0.1.0" target=3D"_bla=
nk">crates.io/byteorder-lite/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/bytes/1.7.1" target=3D"_blank">crates.io/bytes/1.7.1</=
a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bzip2/0.4.4" tar=
get=3D"_blank">crates.io/bzip2/0.4.4</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/bzip2-sys/0.1.11+1.0.8" target=3D"_blank">crates.io/b=
zip2-sys/0.1.11+1.0.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/cachedir/0.3.1" target=3D"_blank">crates.io/cachedir/0.3.1</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/camino/1.1.9" target=3D"=
_blank">crates.io/camino/1.1.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"h=
ttp://crates.io/cargo-util/0.2.14" target=3D"_blank">crates.io/cargo-util/0=
.2.14</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cast/0.3.=
0" target=3D"_blank">crates.io/cast/0.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/cc/1.1.19" target=3D"_blank">crates.io/cc/1.1.19=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cfg-if/1.0.0" =
target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/cfg_aliases/0.2.1" target=3D"_blank">crates.io/cf=
g_aliases/0.2.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io=
/charset/0.1.5" target=3D"_blank">crates.io/charset/0.1.5</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/ciborium/0.2.2" target=3D"_blank=
">crates.io/ciborium/0.2.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/ciborium-io/0.2.2" target=3D"_blank">crates.io/ciborium-io/0.2.=
2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ciborium-ll/0=
.2.2" target=3D"_blank">crates.io/ciborium-ll/0.2.2</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/clap/4.5.18" target=3D"_blank">crate=
s.io/clap/4.5.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/clap_builder/4.5.18" target=3D"_blank">crates.io/clap_builder/4.5.18</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/clap_complete/4.5.2=
6" target=3D"_blank">crates.io/clap_complete/4.5.26</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/clap_complete_command/0.6.1" target=
=3D"_blank">crates.io/clap_complete_command/0.6.1</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/clap_complete_nushell/4.5.3" target=3D"_=
blank">crates.io/clap_complete_nushell/4.5.3</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/clap_derive/4.5.18" target=3D"_blank">crates.=
io/clap_derive/4.5.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/clap_lex/0.7.2" target=3D"_blank">crates.io/clap_lex/0.7.2</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cmake/0.1.51" target=3D"=
_blank">crates.io/cmake/0.1.51</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"h=
ttp://crates.io/codspeed/2.7.2" target=3D"_blank">crates.io/codspeed/2.7.2<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/codspeed-criter=
ion-compat/2.7.2" target=3D"_blank">crates.io/codspeed-criterion-compat/2.7=
.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/color_quant/=
1.1.0" target=3D"_blank">crates.io/color_quant/1.1.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/colorchoice/1.0.2" target=3D"_blank"=
>crates.io/colorchoice/1.0.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/colored/2.1.0" target=3D"_blank">crates.io/colored/2.1.0</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/concurrent-queue/2.=
5.0" target=3D"_blank">crates.io/concurrent-queue/2.5.0</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/configparser/3.1.0" target=3D"_bl=
ank">crates.io/configparser/3.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/console/0.15.8" target=3D"_blank">crates.io/console/0.=
15.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/core-found=
ation/0.9.4" target=3D"_blank">crates.io/core-foundation/0.9.4</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/core-foundation-sys/0.8.7"=
 target=3D"_blank">crates.io/core-foundation-sys/0.8.7</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/cpufeatures/0.2.14" target=3D"_bl=
ank">crates.io/cpufeatures/0.2.14</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/crc32fast/1.4.2" target=3D"_blank">crates.io/crc32fast=
/1.4.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/criterio=
n/0.5.1" target=3D"_blank">crates.io/criterion/0.5.1</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/criterion-plot/0.5.0" target=3D"_bla=
nk">crates.io/criterion-plot/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/crossbeam-deque/0.8.5" target=3D"_blank">crates.io/cro=
ssbeam-deque/0.8.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/crossbeam-epoch/0.9.18" target=3D"_blank">crates.io/crossbeam-epoch/0.9=
.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/crossbeam-u=
tils/0.8.20" target=3D"_blank">crates.io/crossbeam-utils/0.8.20</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/crunchy/0.2.2" target=3D"_=
blank">crates.io/crunchy/0.2.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"h=
ttp://crates.io/crypto-common/0.1.6" target=3D"_blank">crates.io/crypto-com=
mon/0.1.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/csv/1=
.3.0" target=3D"_blank">crates.io/csv/1.3.0</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/csv-core/0.1.11" target=3D"_blank">crates.io/c=
sv-core/0.1.11</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
ctrlc/3.4.5" target=3D"_blank">crates.io/ctrlc/3.4.5</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/dashmap/6.1.0" target=3D"_blank">cra=
tes.io/dashmap/6.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/data-encoding/2.6.0" target=3D"_blank">crates.io/data-encoding/2.6.0<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/data-url/0.2.0"=
 target=3D"_blank">crates.io/data-url/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/deadpool/0.10.0" target=3D"_blank">crates.io/d=
eadpool/0.10.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
deadpool-runtime/0.1.4" target=3D"_blank">crates.io/deadpool-runtime/0.1.4<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/diff/0.1.13" ta=
rget=3D"_blank">crates.io/diff/0.1.13</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/difflib/0.4.0" target=3D"_blank">crates.io/difflib/0=
.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/digest/0.1=
0.7" target=3D"_blank">crates.io/digest/0.10.7</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/directories/5.0.1" target=3D"_blank">crates=
.io/directories/5.0.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/dirs-sys/0.4.1" target=3D"_blank">crates.io/dirs-sys/0.4.1</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/doc-comment/0.3.3" targe=
t=3D"_blank">crates.io/doc-comment/0.3.3</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/dunce/1.0.5" target=3D"_blank">crates.io/dunce/1.=
0.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/dyn-clone/1=
.0.17" target=3D"_blank">crates.io/dyn-clone/1.0.17</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/either/1.13.0" target=3D"_blank">cra=
tes.io/either/1.13.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/encode_unicode/0.3.6" target=3D"_blank">crates.io/encode_unicode/0.3.=
6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/encoding_rs/0=
.8.34" target=3D"_blank">crates.io/encoding_rs/0.8.34</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/encoding_rs_io/0.1.7" target=3D"_bla=
nk">crates.io/encoding_rs_io/0.1.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/equivalent/1.0.1" target=3D"_blank">crates.io/equivale=
nt/1.0.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/erased=
-serde/0.4.5" target=3D"_blank">crates.io/erased-serde/0.4.5</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/errno/0.3.9" target=3D"_blank=
">crates.io/errno/0.3.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/etcetera/0.8.0" target=3D"_blank">crates.io/etcetera/0.8.0</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/event-listener/5.3.1" =
target=3D"_blank">crates.io/event-listener/5.3.1</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/event-listener-strategy/0.5.2" target=3D"=
_blank">crates.io/event-listener-strategy/0.5.2</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/fastrand/2.1.1" target=3D"_blank">crates.i=
o/fastrand/2.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/fdeflate/0.3.4" target=3D"_blank">crates.io/fdeflate/0.3.4</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/filetime/0.2.25" target=3D"_b=
lank">crates.io/filetime/0.2.25</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/fixedbitset/0.4.2" target=3D"_blank">crates.io/fixedbitset=
/0.4.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/flate2/1=
.0.34" target=3D"_blank">crates.io/flate2/1.0.34</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/float-cmp/0.9.0" target=3D"_blank">crates=
.io/float-cmp/0.9.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/fnv/1.0.7" target=3D"_blank">crates.io/fnv/1.0.7</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/fontconfig-parser/0.5.7" target=3D"_=
blank">crates.io/fontconfig-parser/0.5.7</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/fontdb/0.12.0" target=3D"_blank">crates.io/fontdb=
/0.12.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/form_ur=
lencoded/1.2.1" target=3D"_blank">crates.io/form_urlencoded/1.2.1</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/fs-err/2.11.0" target=3D=
"_blank">crates.io/fs-err/2.11.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/fs2/0.4.3" target=3D"_blank">crates.io/fs2/0.4.3</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/futures/0.3.30" target=
=3D"_blank">crates.io/futures/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/futures-channel/0.3.30" target=3D"_blank">crates.io/f=
utures-channel/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/futures-core/0.3.30" target=3D"_blank">crates.io/futures-core/0.3.30=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/futures-execut=
or/0.3.30" target=3D"_blank">crates.io/futures-executor/0.3.30</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/futures-io/0.3.30" target=
=3D"_blank">crates.io/futures-io/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate://<a =
href=3D"http://crates.io/futures-lite/2.3.0" target=3D"_blank">crates.io/fu=
tures-lite/2.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/futures-macro/0.3.30" target=3D"_blank">crates.io/futures-macro/0.3.30</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/futures-sink/0.3.=
30" target=3D"_blank">crates.io/futures-sink/0.3.30</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/futures-task/0.3.30" target=3D"_blan=
k">crates.io/futures-task/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/futures-util/0.3.30" target=3D"_blank">crates.io/futures-=
util/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/gen=
eric-array/0.14.7" target=3D"_blank">crates.io/generic-array/0.14.7</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/getrandom/0.2.15" targ=
et=3D"_blank">crates.io/getrandom/0.2.15</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/gif/0.12.0" target=3D"_blank">crates.io/gif/0.12.=
0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/gimli/0.31.0"=
 target=3D"_blank">crates.io/gimli/0.31.0</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/glob/0.3.1" target=3D"_blank">crates.io/glob/0.3=
.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/globset/0.4.=
15" target=3D"_blank">crates.io/globset/0.4.15</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/globwalk/0.9.1" target=3D"_blank">crates.io=
/globwalk/0.9.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io=
/goblin/0.8.2" target=3D"_blank">crates.io/goblin/0.8.2</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/h2/0.4.6" target=3D"_blank">crate=
s.io/h2/0.4.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/h=
alf/2.4.1" target=3D"_blank">crates.io/half/2.4.1</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/hashbrown/0.14.5" target=3D"_blank">crat=
es.io/hashbrown/0.14.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/heck/0.5.0" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/hermit-abi/0.3.9" target=3D"_=
blank">crates.io/hermit-abi/0.3.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/hermit-abi/0.4.0" target=3D"_blank">crates.io/hermit-a=
bi/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/hex/0.=
4.3" target=3D"_blank">crates.io/hex/0.4.3</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/home/0.5.9" target=3D"_blank">crates.io/home/0.=
5.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/homedir/0.3=
.3" target=3D"_blank">crates.io/homedir/0.3.3</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/html-escape/0.2.13" target=3D"_blank">crates=
.io/html-escape/0.2.13</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/http/1.1.0" target=3D"_blank">crates.io/http/1.1.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/http-body/1.0.1" target=3D"_b=
lank">crates.io/http-body/1.0.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/http-body-util/0.1.2" target=3D"_blank">crates.io/http-bod=
y-util/0.1.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ht=
tp-content-range/0.1.2" target=3D"_blank">crates.io/http-content-range/0.1.=
2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/httparse/1.9.=
4" target=3D"_blank">crates.io/httparse/1.9.4</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/httpdate/1.0.3" target=3D"_blank">crates.io/=
httpdate/1.0.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
hyper/1.4.1" target=3D"_blank">crates.io/hyper/1.4.1</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/hyper-rustls/0.27.3" target=3D"_blan=
k">crates.io/hyper-rustls/0.27.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/hyper-util/0.1.9" target=3D"_blank">crates.io/hyper-util/=
0.1.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/idna/0.5.=
0" target=3D"_blank">crates.io/idna/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/ignore/0.4.23" target=3D"_blank">crates.io/ignor=
e/0.4.23</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/image/=
0.25.2" target=3D"_blank">crates.io/image/0.25.2</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/imagesize/0.11.0" target=3D"_blank">crate=
s.io/imagesize/0.11.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/indexmap/2.5.0" target=3D"_blank">crates.io/indexmap/2.5.0</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/indicatif/0.17.8" target=
=3D"_blank">crates.io/indicatif/0.17.8</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/indoc/2.0.5" target=3D"_blank">crates.io/indoc/2.0.=
5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/insta/1.40.0"=
 target=3D"_blank">crates.io/insta/1.40.0</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/instant/0.1.13" target=3D"_blank">crates.io/inst=
ant/0.1.13</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ipne=
t/2.10.0" target=3D"_blank">crates.io/ipnet/2.10.0</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/is-terminal/0.4.13" target=3D"_blank">c=
rates.io/is-terminal/0.4.13</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/is_ci/1.2.0" target=3D"_blank">crates.io/is_ci/1.2.0</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/is_terminal_polyfill/1.7=
0.1" target=3D"_blank">crates.io/is_terminal_polyfill/1.70.1</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/itertools/0.10.5" target=3D"_=
blank">crates.io/itertools/0.10.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/itertools/0.12.1" target=3D"_blank">crates.io/itertool=
s/0.12.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/iterto=
ols/0.13.0" target=3D"_blank">crates.io/itertools/0.13.0</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/itoa/1.0.11" target=3D"_blank">cr=
ates.io/itoa/1.0.11</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/jiff/0.1.13" target=3D"_blank">crates.io/jiff/0.1.13</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/jiff-tzdb/0.1.1" target=3D"_blan=
k">crates.io/jiff-tzdb/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/jiff-tzdb-platform/0.1.1" target=3D"_blank">crates.io/jiff-tz=
db-platform/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/jobserver/0.1.32" target=3D"_blank">crates.io/jobserver/0.1.32</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/jpeg-decoder/0.3.1" targ=
et=3D"_blank">crates.io/jpeg-decoder/0.3.1</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/js-sys/0.3.70" target=3D"_blank">crates.io/js-s=
ys/0.3.70</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/junct=
ion/1.2.0" target=3D"_blank">crates.io/junction/1.2.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/krata-tokio-tar/0.4.2" target=3D"_bl=
ank">crates.io/krata-tokio-tar/0.4.2</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/kurbo/0.8.3" target=3D"_blank">crates.io/kurbo/0.8.3<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/kurbo/0.9.5" ta=
rget=3D"_blank">crates.io/kurbo/0.9.5</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/lazy_static/1.5.0" target=3D"_blank">crates.io/lazy_=
static/1.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/li=
bc/0.2.158" target=3D"_blank">crates.io/libc/0.2.158</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/libmimalloc-sys/0.1.39" target=3D"_b=
lank">crates.io/libmimalloc-sys/0.1.39</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/libredox/0.1.3" target=3D"_blank">crates.io/libredo=
x/0.1.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/libz-ng=
-sys/1.1.16" target=3D"_blank">crates.io/libz-ng-sys/1.1.16</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/linked-hash-map/0.5.6" target=
=3D"_blank">crates.io/linked-hash-map/0.5.6</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/linux-raw-sys/0.4.14" target=3D"_blank">crates=
.io/linux-raw-sys/0.4.14</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://=
crates.io/lock_api/0.4.12" target=3D"_blank">crates.io/lock_api/0.4.12</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/log/0.4.22" target=
=3D"_blank">crates.io/log/0.4.22</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/lzma-sys/0.1.20" target=3D"_blank">crates.io/lzma-sys/0.1=
.20</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/mailparse/0=
.15.0" target=3D"_blank">crates.io/mailparse/0.15.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/markdown/0.3.0" target=3D"_blank">cr=
ates.io/markdown/0.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/matchers/0.1.0" target=3D"_blank">crates.io/matchers/0.1.0</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/md-5/0.10.6" target=3D"=
_blank">crates.io/md-5/0.10.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/memchr/2.7.4" target=3D"_blank">crates.io/memchr/2.7.4</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/memmap2/0.5.10" targ=
et=3D"_blank">crates.io/memmap2/0.5.10</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/memmap2/0.9.5" target=3D"_blank">crates.io/memmap2/=
0.9.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/memoffset=
/0.7.1" target=3D"_blank">crates.io/memoffset/0.7.1</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/miette/7.2.0" target=3D"_blank">crat=
es.io/miette/7.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/miette-derive/7.2.0" target=3D"_blank">crates.io/miette-derive/7.2.0</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/mimalloc/0.1.43" =
target=3D"_blank">crates.io/mimalloc/0.1.43</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/mime/0.3.17" target=3D"_blank">crates.io/mime/=
0.3.17</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/mime_gue=
ss/2.0.5" target=3D"_blank">crates.io/mime_guess/2.0.5</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/miniz_oxide/0.7.4" target=3D"_bla=
nk">crates.io/miniz_oxide/0.7.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/miniz_oxide/0.8.0" target=3D"_blank">crates.io/miniz_oxide=
/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/mio/1.0.=
2" target=3D"_blank">crates.io/mio/1.0.2</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/miow/0.6.0" target=3D"_blank">crates.io/miow/0.6.=
0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/munge/0.4.1" =
target=3D"_blank">crates.io/munge/0.4.1</a> \<br>+ =C2=A0 =C2=A0crate://<a =
href=3D"http://crates.io/munge_macro/0.4.1" target=3D"_blank">crates.io/mun=
ge_macro/0.4.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
nanoid/0.4.0" target=3D"_blank">crates.io/nanoid/0.4.0</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/nix/0.26.4" target=3D"_blank">cra=
tes.io/nix/0.26.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/nix/0.29.0" target=3D"_blank">crates.io/nix/0.29.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/normalize-line-endings/0.3.0" target=
=3D"_blank">crates.io/normalize-line-endings/0.3.0</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/nu-ansi-term/0.46.0" target=3D"_blank">=
crates.io/nu-ansi-term/0.46.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/nu-ansi-term/0.50.1" target=3D"_blank">crates.io/nu-ansi-ter=
m/0.50.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/num-tr=
aits/0.2.19" target=3D"_blank">crates.io/num-traits/0.2.19</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/num_cpus/1.16.0" target=3D"_b=
lank">crates.io/num_cpus/1.16.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/number_prefix/0.4.0" target=3D"_blank">crates.io/number_pr=
efix/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/obje=
ct/0.36.4" target=3D"_blank">crates.io/object/0.36.4</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/once_cell/1.20.0" target=3D"_blank">=
crates.io/once_cell/1.20.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/oorandom/11.1.4" target=3D"_blank">crates.io/oorandom/11.1.4</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/openssl-probe/0.1=
.5" target=3D"_blank">crates.io/openssl-probe/0.1.5</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/option-ext/0.2.0" target=3D"_blank">=
crates.io/option-ext/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/overload/0.1.1" target=3D"_blank">crates.io/overload/0.1.1</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/owo-colors/4.1.0" t=
arget=3D"_blank">crates.io/owo-colors/4.1.0</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/parking/2.2.1" target=3D"_blank">crates.io/par=
king/2.2.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/park=
ing_lot/0.11.2" target=3D"_blank">crates.io/parking_lot/0.11.2</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot/0.12.3" target=
=3D"_blank">crates.io/parking_lot/0.12.3</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/parking_lot_core/0.8.6" target=3D"_blank">crates.=
io/parking_lot_core/0.8.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/parking_lot_core/0.9.10" target=3D"_blank">crates.io/parking_lot=
_core/0.9.10</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pa=
ste/1.0.15" target=3D"_blank">crates.io/paste/1.0.15</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/path-slash/0.2.1" target=3D"_blank">=
crates.io/path-slash/0.2.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/pathdiff/0.2.1" target=3D"_blank">crates.io/pathdiff/0.2.1</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/percent-encoding/2.=
3.1" target=3D"_blank">crates.io/percent-encoding/2.3.1</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/pest/2.7.12" target=3D"_blank">cr=
ates.io/pest/2.7.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/pest_derive/2.7.12" target=3D"_blank">crates.io/pest_derive/2.7.12</a>=
 \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pest_generator/2.7=
.12" target=3D"_blank">crates.io/pest_generator/2.7.12</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/pest_meta/2.7.12" target=3D"_blan=
k">crates.io/pest_meta/2.7.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/petgraph/0.6.5" target=3D"_blank">crates.io/petgraph/0.6.5</=
a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pico-args/0.5.0"=
 target=3D"_blank">crates.io/pico-args/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/pin-project/1.1.5" target=3D"_blank">crates.i=
o/pin-project/1.1.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/pin-project-internal/1.1.5" target=3D"_blank">crates.io/pin-project-in=
ternal/1.1.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pi=
n-project-lite/0.2.14" target=3D"_blank">crates.io/pin-project-lite/0.2.14<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pin-utils/0.1.0=
" target=3D"_blank">crates.io/pin-utils/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/pipeline/0.5.0" target=3D"_blank">crates.io/=
pipeline/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
pkg-config/0.3.30" target=3D"_blank">crates.io/pkg-config/0.3.30</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/plain/0.2.3" target=3D"_b=
lank">crates.io/plain/0.2.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/platform-info/2.0.4" target=3D"_blank">crates.io/platform-info=
/2.0.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/png/0.17=
.13" target=3D"_blank">crates.io/png/0.17.13</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/poloto/19.1.2" target=3D"_blank">crates.io/po=
loto/19.1.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/por=
table-atomic/1.7.0" target=3D"_blank">crates.io/portable-atomic/1.7.0</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ppv-lite86/0.2.20" t=
arget=3D"_blank">crates.io/ppv-lite86/0.2.20</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/predicates/3.1.2" target=3D"_blank">crates.io=
/predicates/3.1.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/predicates-core/1.0.8" target=3D"_blank">crates.io/predicates-core/1.0.8=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/predicates-tre=
e/1.0.11" target=3D"_blank">crates.io/predicates-tree/1.0.11</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/pretty_assertions/1.4.1" targ=
et=3D"_blank">crates.io/pretty_assertions/1.4.1</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/priority-queue/2.1.0" target=3D"_blank">cr=
ates.io/priority-queue/2.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/proc-macro2/1.0.86" target=3D"_blank">crates.io/proc-macro2/1=
.0.86</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ptr_meta/=
0.3.0" target=3D"_blank">crates.io/ptr_meta/0.3.0</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/ptr_meta_derive/0.3.0" target=3D"_blank"=
>crates.io/ptr_meta_derive/0.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/quinn/0.11.5" target=3D"_blank">crates.io/quinn/0.11.5</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/quinn-proto/0.11.=
8" target=3D"_blank">crates.io/quinn-proto/0.11.8</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/quinn-udp/0.5.5" target=3D"_blank">crate=
s.io/quinn-udp/0.5.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/quote/1.0.37" target=3D"_blank">crates.io/quote/1.0.37</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/quoted_printable/0.5.1" targe=
t=3D"_blank">crates.io/quoted_printable/0.5.1</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/rancor/0.1.0" target=3D"_blank">crates.io/ra=
ncor/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rand=
/0.8.5" target=3D"_blank">crates.io/rand/0.8.5</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/rand_chacha/0.3.1" target=3D"_blank">crates=
.io/rand_chacha/0.3.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/rand_core/0.6.4" target=3D"_blank">crates.io/rand_core/0.6.4</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rayon/1.10.0" target=
=3D"_blank">crates.io/rayon/1.10.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/rayon-core/1.12.1" target=3D"_blank">crates.io/rayon-c=
ore/1.12.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rctr=
ee/0.5.0" target=3D"_blank">crates.io/rctree/0.5.0</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/redox_syscall/0.2.16" target=3D"_blank"=
>crates.io/redox_syscall/0.2.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/redox_syscall/0.3.5" target=3D"_blank">crates.io/redox_sys=
call/0.3.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/redo=
x_syscall/0.5.4" target=3D"_blank">crates.io/redox_syscall/0.5.4</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/redox_users/0.4.6" target=
=3D"_blank">crates.io/redox_users/0.4.6</a> \<br>+ =C2=A0 =C2=A0crate://<a =
href=3D"http://crates.io/reflink-copy/0.1.19" target=3D"_blank">crates.io/r=
eflink-copy/0.1.19</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/regex/1.11.0" target=3D"_blank">crates.io/regex/1.11.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/regex-automata/0.1.10" target=
=3D"_blank">crates.io/regex-automata/0.1.10</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/regex-automata/0.4.8" target=3D"_blank">crates=
.io/regex-automata/0.4.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://=
crates.io/regex-syntax/0.6.29" target=3D"_blank">crates.io/regex-syntax/0.6=
.29</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex-synta=
x/0.8.5" target=3D"_blank">crates.io/regex-syntax/0.8.5</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/rend/0.5.1" target=3D"_blank">cra=
tes.io/rend/0.5.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/reqwest/0.12.7" target=3D"_blank">crates.io/reqwest/0.12.7</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/resvg/0.29.0" target=3D"_b=
lank">crates.io/resvg/0.29.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/retry-policies/0.4.0" target=3D"_blank">crates.io/retry-polic=
ies/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rgb/0=
.8.50" target=3D"_blank">crates.io/rgb/0.8.50</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/ring/0.17.8" target=3D"_blank">crates.io/rin=
g/0.17.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rkyv/0=
.8.8" target=3D"_blank">crates.io/rkyv/0.8.8</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/rkyv_derive/0.8.8" target=3D"_blank">crates.i=
o/rkyv_derive/0.8.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/rmp/0.8.14" target=3D"_blank">crates.io/rmp/0.8.14</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/rmp-serde/1.3.0" target=3D"_blank=
">crates.io/rmp-serde/1.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/rosvgtree/0.1.0" target=3D"_blank">crates.io/rosvgtree/0.1.0</=
a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/roxmltree/0.18.1=
" target=3D"_blank">crates.io/roxmltree/0.18.1</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/roxmltree/0.20.0" target=3D"_blank">crates.=
io/roxmltree/0.20.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/rust-netrc/0.1.1" target=3D"_blank">crates.io/rust-netrc/0.1.1</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rustc-demangle/0.1.24"=
 target=3D"_blank">crates.io/rustc-demangle/0.1.24</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/rustc-hash/2.0.0" target=3D"_blank">cra=
tes.io/rustc-hash/2.0.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/rustix/0.38.37" target=3D"_blank">crates.io/rustix/0.38.37</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rustls/0.23.13" target=
=3D"_blank">crates.io/rustls/0.23.13</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/rustls-native-certs/0.7.3" target=3D"_blank">crates.i=
o/rustls-native-certs/0.7.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/rustls-native-certs/0.8.0" target=3D"_blank">crates.io/rustls-=
native-certs/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/rustls-pemfile/2.1.3" target=3D"_blank">crates.io/rustls-pemfile/2.1.3<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rustls-pki-type=
s/1.8.0" target=3D"_blank">crates.io/rustls-pki-types/1.8.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/rustls-webpki/0.102.8" target=
=3D"_blank">crates.io/rustls-webpki/0.102.8</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/rustybuzz/0.7.0" target=3D"_blank">crates.io/r=
ustybuzz/0.7.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
ryu/1.0.18" target=3D"_blank">crates.io/ryu/1.0.18</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/same-file/1.0.6" target=3D"_blank">crat=
es.io/same-file/1.0.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/schannel/0.1.24" target=3D"_blank">crates.io/schannel/0.1.24</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/schemars/0.8.21" targe=
t=3D"_blank">crates.io/schemars/0.8.21</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/schemars_derive/0.8.21" target=3D"_blank">crates.io=
/schemars_derive/0.8.21</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/scopeguard/1.2.0" target=3D"_blank">crates.io/scopeguard/1.2.0</a>=
 \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/scroll/0.12.0" tar=
get=3D"_blank">crates.io/scroll/0.12.0</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/scroll_derive/0.12.0" target=3D"_blank">crates.io/s=
croll_derive/0.12.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/seahash/4.1.0" target=3D"_blank">crates.io/seahash/4.1.0</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/security-framework/2.11.1"=
 target=3D"_blank">crates.io/security-framework/2.11.1</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/security-framework-sys/2.11.1" ta=
rget=3D"_blank">crates.io/security-framework-sys/2.11.1</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/semver/1.0.23" target=3D"_blank">=
crates.io/semver/1.0.23</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/serde/1.0.210" target=3D"_blank">crates.io/serde/1.0.210</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/serde-untagged/0.1.6" ta=
rget=3D"_blank">crates.io/serde-untagged/0.1.6</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/serde_derive/1.0.210" target=3D"_blank">cra=
tes.io/serde_derive/1.0.210</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/serde_derive_internals/0.29.1" target=3D"_blank">crates.io/ser=
de_derive_internals/0.29.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/serde_json/1.0.128" target=3D"_blank">crates.io/serde_json/1.0.=
128</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/serde_spann=
ed/0.6.7" target=3D"_blank">crates.io/serde_spanned/0.6.7</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/serde_urlencoded/0.7.1" target=
=3D"_blank">crates.io/serde_urlencoded/0.7.1</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/sha2/0.10.8" target=3D"_blank">crates.io/sha2=
/0.10.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/sharded=
-slab/0.1.7" target=3D"_blank">crates.io/sharded-slab/0.1.7</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/shell-escape/0.1.5" target=3D=
"_blank">crates.io/shell-escape/0.1.5</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/shlex/1.3.0" target=3D"_blank">crates.io/shlex/1.3.0=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/signal-hook-re=
gistry/1.4.2" target=3D"_blank">crates.io/signal-hook-registry/1.4.2</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/simd-adler32/0.3.7" t=
arget=3D"_blank">crates.io/simd-adler32/0.3.7</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/simdutf8/0.1.4" target=3D"_blank">crates.io/=
simdutf8/0.1.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
similar/2.6.0" target=3D"_blank">crates.io/similar/2.6.0</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/simplecss/0.2.1" target=3D"_blank=
">crates.io/simplecss/0.2.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/siphasher/0.3.11" target=3D"_blank">crates.io/siphasher/0.3.11=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/slab/0.4.9" ta=
rget=3D"_blank">crates.io/slab/0.4.9</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/smallvec/1.13.2" target=3D"_blank">crates.io/smallvec=
/1.13.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/smawk/0=
.3.2" target=3D"_blank">crates.io/smawk/0.3.2</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/socket2/0.5.7" target=3D"_blank">crates.io/s=
ocket2/0.5.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/sp=
in/0.9.8" target=3D"_blank">crates.io/spin/0.9.8</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/strict-num/0.1.1" target=3D"_blank">crate=
s.io/strict-num/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/strsim/0.11.1" target=3D"_blank">crates.io/strsim/0.11.1</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/subtle/2.6.1" target=3D"_b=
lank">crates.io/subtle/2.6.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/supports-color/3.0.1" target=3D"_blank">crates.io/supports-co=
lor/3.0.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/suppo=
rts-hyperlinks/3.0.0" target=3D"_blank">crates.io/supports-hyperlinks/3.0.0=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/supports-unico=
de/3.0.0" target=3D"_blank">crates.io/supports-unicode/3.0.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/svg/0.17.0" target=3D"_blank"=
>crates.io/svg/0.17.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/svgfilters/0.4.0" target=3D"_blank">crates.io/svgfilters/0.4.0</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/svgtypes/0.9.0" targ=
et=3D"_blank">crates.io/svgtypes/0.9.0</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/svgtypes/0.10.0" target=3D"_blank">crates.io/svgtyp=
es/0.10.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/syn/2=
.0.79" target=3D"_blank">crates.io/syn/2.0.79</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/sync_wrapper/1.0.1" target=3D"_blank">crates=
.io/sync_wrapper/1.0.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/sys-info/0.9.1" target=3D"_blank">crates.io/sys-info/0.9.1</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tagu/0.1.6" target=3D"_=
blank">crates.io/tagu/0.1.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/target-lexicon/0.12.16" target=3D"_blank">crates.io/target-lex=
icon/0.12.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/te=
mp-env/0.3.6" target=3D"_blank">crates.io/temp-env/0.3.6</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/tempfile/3.13.0" target=3D"_blank=
">crates.io/tempfile/3.13.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/terminal_size/0.3.0" target=3D"_blank">crates.io/terminal_size=
/0.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/termtree=
/0.4.1" target=3D"_blank">crates.io/termtree/0.4.1</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/test-case/3.3.1" target=3D"_blank">crat=
es.io/test-case/3.3.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/test-case-core/3.3.1" target=3D"_blank">crates.io/test-case-core/3.3=
.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/test-case-ma=
cros/3.3.1" target=3D"_blank">crates.io/test-case-macros/3.3.1</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/test-log/0.2.16" target=3D=
"_blank">crates.io/test-log/0.2.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/test-log-macros/0.2.16" target=3D"_blank">crates.io/te=
st-log-macros/0.2.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/testing_logger/0.1.1" target=3D"_blank">crates.io/testing_logger/0.1.=
1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/textwrap/0.16=
.1" target=3D"_blank">crates.io/textwrap/0.16.1</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/thiserror/1.0.64" target=3D"_blank">crates=
.io/thiserror/1.0.64</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/thiserror-impl/1.0.64" target=3D"_blank">crates.io/thiserror-impl/1.0=
.64</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/thread_loca=
l/1.1.8" target=3D"_blank">crates.io/thread_local/1.1.8</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-g=
e13ca993e8ccb9ba9847cc330696e02839f328f7" target=3D"_blank">crates.io/tikv-=
jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tikv-jemallocator/0.6=
.0" target=3D"_blank">crates.io/tikv-jemallocator/0.6.0</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/tiny-skia/0.8.4" target=3D"_blank=
">crates.io/tiny-skia/0.8.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/tiny-skia-path/0.8.4" target=3D"_blank">crates.io/tiny-skia-pa=
th/0.8.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tinyte=
mplate/1.2.1" target=3D"_blank">crates.io/tinytemplate/1.2.1</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/tinyvec/1.8.0" target=3D"_bla=
nk">crates.io/tinyvec/1.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/tinyvec_macros/0.1.1" target=3D"_blank">crates.io/tinyvec_macr=
os/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tokio/=
1.40.0" target=3D"_blank">crates.io/tokio/1.40.0</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/tokio-macros/2.4.0" target=3D"_blank">cra=
tes.io/tokio-macros/2.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/tokio-rustls/0.26.0" target=3D"_blank">crates.io/tokio-rustls/0.=
26.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tokio-sock=
s/0.5.2" target=3D"_blank">crates.io/tokio-socks/0.5.2</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/tokio-stream/0.1.16" target=3D"_b=
lank">crates.io/tokio-stream/0.1.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/tokio-util/0.7.12" target=3D"_blank">crates.io/tokio-u=
til/0.7.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/toml=
/0.8.19" target=3D"_blank">crates.io/toml/0.8.19</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/toml_datetime/0.6.8" target=3D"_blank">cr=
ates.io/toml_datetime/0.6.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/toml_edit/0.22.22" target=3D"_blank">crates.io/toml_edit/0.22.=
22</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tower-servic=
e/0.3.3" target=3D"_blank">crates.io/tower-service/0.3.3</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/tracing/0.1.40" target=3D"_blank"=
>crates.io/tracing/0.1.40</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/tracing-attributes/0.1.27" target=3D"_blank">crates.io/tracing-a=
ttributes/0.1.27</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/tracing-core/0.1.32" target=3D"_blank">crates.io/tracing-core/0.1.32</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tracing-durations-e=
xport/0.3.0" target=3D"_blank">crates.io/tracing-durations-export/0.3.0</a>=
 \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tracing-log/0.2.0"=
 target=3D"_blank">crates.io/tracing-log/0.2.0</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/tracing-serde/0.1.3" target=3D"_blank">crat=
es.io/tracing-serde/0.1.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/tracing-subscriber/0.3.18" target=3D"_blank">crates.io/tracing-s=
ubscriber/0.3.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/tracing-tree/0.4.0" target=3D"_blank">crates.io/tracing-tree/0.4.0</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/try-lock/0.2.5" targe=
t=3D"_blank">crates.io/try-lock/0.2.5</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/ttf-parser/0.18.1" target=3D"_blank">crates.io/ttf-p=
arser/0.18.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ty=
peid/1.0.2" target=3D"_blank">crates.io/typeid/1.0.2</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/typenum/1.17.0" target=3D"_blank">cr=
ates.io/typenum/1.17.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/ucd-trie/0.1.6" target=3D"_blank">crates.io/ucd-trie/0.1.6</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unicase/2.7.0" target=
=3D"_blank">crates.io/unicase/2.7.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/unicode-bidi/0.3.15" target=3D"_blank">crates.io/unico=
de-bidi/0.3.15</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
unicode-bidi-mirroring/0.1.0" target=3D"_blank">crates.io/unicode-bidi-mirr=
oring/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/uni=
code-ccc/0.1.2" target=3D"_blank">crates.io/unicode-ccc/0.1.2</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unicode-general-category/0=
.6.0" target=3D"_blank">crates.io/unicode-general-category/0.6.0</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unicode-ident/1.0.13" tar=
get=3D"_blank">crates.io/unicode-ident/1.0.13</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/unicode-linebreak/0.1.5" target=3D"_blank">c=
rates.io/unicode-linebreak/0.1.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/unicode-normalization/0.1.23" target=3D"_blank">crates.io=
/unicode-normalization/0.1.23</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/unicode-script/0.5.6" target=3D"_blank">crates.io/unicode-sc=
ript/0.5.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unic=
ode-vo/0.1.0" target=3D"_blank">crates.io/unicode-vo/0.1.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/unicode-width/0.1.13" target=
=3D"_blank">crates.io/unicode-width/0.1.13</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/unscanny/0.1.0" target=3D"_blank">crates.io/uns=
canny/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unt=
rusted/0.9.0" target=3D"_blank">crates.io/untrusted/0.9.0</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/url/2.5.2" target=3D"_blank">cra=
tes.io/url/2.5.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/urlencoding/2.1.3" target=3D"_blank">crates.io/urlencoding/2.1.3</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/usvg/0.29.0" target=3D"=
_blank">crates.io/usvg/0.29.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/usvg-text-layout/0.29.0" target=3D"_blank">crates.io/usvg-te=
xt-layout/0.29.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/utf8-width/0.1.7" target=3D"_blank">crates.io/utf8-width/0.1.7</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/utf8parse/0.2.2" target=
=3D"_blank">crates.io/utf8parse/0.2.2</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/uuid/1.10.0" target=3D"_blank">crates.io/uuid/1.10.0=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/valuable/0.1.0=
" target=3D"_blank">crates.io/valuable/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/version_check/0.9.5" target=3D"_blank">crates=
.io/version_check/0.9.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/wait-timeout/0.2.0" target=3D"_blank">crates.io/wait-timeout/0.2.0=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/walkdir/2.5.0"=
 target=3D"_blank">crates.io/walkdir/2.5.0</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/want/0.3.1" target=3D"_blank">crates.io/want/0.=
3.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/wasi/0.11.0=
+wasi-snapshot-preview1" target=3D"_blank">crates.io/wasi/0.11.0+wasi-snaps=
hot-preview1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/wa=
sm-bindgen/0.2.93" target=3D"_blank">crates.io/wasm-bindgen/0.2.93</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/wasm-bindgen-backend/0.=
2.93" target=3D"_blank">crates.io/wasm-bindgen-backend/0.2.93</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/wasm-bindgen-futures/0.4.4=
3" target=3D"_blank">crates.io/wasm-bindgen-futures/0.4.43</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/wasm-bindgen-macro/0.2.93" ta=
rget=3D"_blank">crates.io/wasm-bindgen-macro/0.2.93</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/wasm-bindgen-macro-support/0.2.93" t=
arget=3D"_blank">crates.io/wasm-bindgen-macro-support/0.2.93</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/wasm-bindgen-shared/0.2.93" t=
arget=3D"_blank">crates.io/wasm-bindgen-shared/0.2.93</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/wasm-streams/0.4.0" target=3D"_blank=
">crates.io/wasm-streams/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"h=
ttp://crates.io/wasm-timer/0.2.5" target=3D"_blank">crates.io/wasm-timer/0.=
2.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/web-sys/0.3=
.70" target=3D"_blank">crates.io/web-sys/0.3.70</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/webpki-roots/0.26.5" target=3D"_blank">cra=
tes.io/webpki-roots/0.26.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/weezl/0.1.8" target=3D"_blank">crates.io/weezl/0.1.8</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/which/6.0.3" target=3D"_b=
lank">crates.io/which/6.0.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/widestring/1.1.0" target=3D"_blank">crates.io/widestring/1.1.0=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/winapi/0.3.9" =
target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/winapi-i686-pc-windows-gnu/0.4.0" target=3D"_blan=
k">crates.io/winapi-i686-pc-windows-gnu/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/winapi-util/0.1.9" target=3D"_blank">crates.=
io/winapi-util/0.1.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/winapi-x86_64-pc-windows-gnu/0.4.0" target=3D"_blank">crates.io/winap=
i-x86_64-pc-windows-gnu/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/windows/0.57.0" target=3D"_blank">crates.io/windows/0.57.0</=
a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows/0.58.0" =
target=3D"_blank">crates.io/windows/0.58.0</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/windows-core/0.57.0" target=3D"_blank">crates.i=
o/windows-core/0.57.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/windows-core/0.58.0" target=3D"_blank">crates.io/windows-core/0.58.0=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows-implem=
ent/0.57.0" target=3D"_blank">crates.io/windows-implement/0.57.0</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows-implement/0.58.0"=
 target=3D"_blank">crates.io/windows-implement/0.58.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/windows-interface/0.57.0" target=3D"=
_blank">crates.io/windows-interface/0.57.0</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/windows-interface/0.58.0" target=3D"_blank">cra=
tes.io/windows-interface/0.58.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/windows-registry/0.2.0" target=3D"_blank">crates.io/window=
s-registry/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/windows-result/0.1.2" target=3D"_blank">crates.io/windows-result/0.1.2</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows-result/0.=
2.0" target=3D"_blank">crates.io/windows-result/0.2.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/windows-strings/0.1.0" target=3D"_bl=
ank">crates.io/windows-strings/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/windows-sys/0.48.0" target=3D"_blank">crates.io/windo=
ws-sys/0.48.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/w=
indows-sys/0.52.0" target=3D"_blank">crates.io/windows-sys/0.52.0</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows-sys/0.59.0" targ=
et=3D"_blank">crates.io/windows-sys/0.59.0</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/windows-targets/0.48.5" target=3D"_blank">crate=
s.io/windows-targets/0.48.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/windows-targets/0.52.6" target=3D"_blank">crates.io/windows-ta=
rgets/0.52.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/wi=
ndows_aarch64_gnullvm/0.48.5" target=3D"_blank">crates.io/windows_aarch64_g=
nullvm/0.48.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/w=
indows_aarch64_gnullvm/0.52.6" target=3D"_blank">crates.io/windows_aarch64_=
gnullvm/0.52.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
windows_aarch64_msvc/0.48.5" target=3D"_blank">crates.io/windows_aarch64_ms=
vc/0.48.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windo=
ws_aarch64_msvc/0.52.6" target=3D"_blank">crates.io/windows_aarch64_msvc/0.=
52.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows_i6=
86_gnu/0.48.5" target=3D"_blank">crates.io/windows_i686_gnu/0.48.5</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows_i686_gnu/0.52.6=
" target=3D"_blank">crates.io/windows_i686_gnu/0.52.6</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/windows_i686_gnullvm/0.52.6" target=
=3D"_blank">crates.io/windows_i686_gnullvm/0.52.6</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/windows_i686_msvc/0.48.5" target=3D"_bla=
nk">crates.io/windows_i686_msvc/0.48.5</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/windows_i686_msvc/0.52.6" target=3D"_blank">crates.=
io/windows_i686_msvc/0.52.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/windows_x86_64_gnu/0.48.5" target=3D"_blank">crates.io/windows=
_x86_64_gnu/0.48.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/windows_x86_64_gnu/0.52.6" target=3D"_blank">crates.io/windows_x86_64_g=
nu/0.52.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windo=
ws_x86_64_gnullvm/0.48.5" target=3D"_blank">crates.io/windows_x86_64_gnullv=
m/0.48.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/window=
s_x86_64_gnullvm/0.52.6" target=3D"_blank">crates.io/windows_x86_64_gnullvm=
/0.52.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows=
_x86_64_msvc/0.48.5" target=3D"_blank">crates.io/windows_x86_64_msvc/0.48.5=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/windows_x86_64=
_msvc/0.52.6" target=3D"_blank">crates.io/windows_x86_64_msvc/0.52.6</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/winnow/0.6.18" target=
=3D"_blank">crates.io/winnow/0.6.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/winreg/0.52.0" target=3D"_blank">crates.io/winreg/0.52=
.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/winsafe/0.0.=
19" target=3D"_blank">crates.io/winsafe/0.0.19</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/winsafe/0.0.22" target=3D"_blank">crates.io=
/winsafe/0.0.22</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io=
/wiremock/0.6.2" target=3D"_blank">crates.io/wiremock/0.6.2</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/xattr/1.3.1" target=3D"_blank=
">crates.io/xattr/1.3.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/xmlparser/0.13.6" target=3D"_blank">crates.io/xmlparser/0.13.6</a>=
 \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/xz2/0.1.7" target=
=3D"_blank">crates.io/xz2/0.1.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/yansi/1.0.1" target=3D"_blank">crates.io/yansi/1.0.1</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/zerocopy/0.7.35" tar=
get=3D"_blank">crates.io/zerocopy/0.7.35</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/zerocopy-derive/0.7.35" target=3D"_blank">crates.=
io/zerocopy-derive/0.7.35</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/zeroize/1.8.1" target=3D"_blank">crates.io/zeroize/1.8.1</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/zip/0.6.6" target=3D"_=
blank">crates.io/zip/0.6.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/zstd/0.13.2" target=3D"_blank">crates.io/zstd/0.13.2</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/zstd-safe/7.2.1" target=
=3D"_blank">crates.io/zstd-safe/7.2.1</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/zstd-sys/2.0.13+zstd.1.5.6" target=3D"_blank">crates=
.io/zstd-sys/2.0.13+zstd.1.5.6</a> \<br>+&quot;<br>+<br>+SRC_URI[addr2line-=
0.24.1.sha256sum] =3D &quot;f5fb1d8e4442bd405fdfd1dacb42792696b0cf9cb15882e=
5d097b742a676d375&quot;<br>+SRC_URI[adler-1.0.2.sha256sum] =3D &quot;f26201=
604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe&quot;<br>+SRC_UR=
I[adler2-2.0.0.sha256sum] =3D &quot;512761e0bb2578dd7380c6baaa0f4ce03e84f95=
e960231d1dec8bf4d7d6e2627&quot;<br>+SRC_URI[aho-corasick-1.1.3.sha256sum] =
=3D &quot;8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916&=
quot;<br>+SRC_URI[anes-0.1.6.sha256sum] =3D &quot;4b46cbb362ab8752921c97e04=
1f5e366ee6297bd428a31275b9fcf1e380f7299&quot;<br>+SRC_URI[anstream-0.6.15.s=
ha256sum] =3D &quot;64e15c1ab1f89faffbf04a634d5e1962e9074f2741eef6d97f3c4e3=
22426d526&quot;<br>+SRC_URI[anstyle-1.0.8.sha256sum] =3D &quot;1bec1de6f59a=
edf83baf9ff929c98f2ad654b97c9510f4e70cf6f661d49fd5b1&quot;<br>+SRC_URI[anst=
yle-parse-0.2.5.sha256sum] =3D &quot;eb47de1e80c2b463c735db5b217a0ddc39d612=
e7ac9e2e96a5aed1f57616c1cb&quot;<br>+SRC_URI[anstyle-query-1.1.1.sha256sum]=
 =3D &quot;6d36fc52c7f6c869915e99412912f22093507da8d9e942ceaf66fe4b7c14422a=
&quot;<br>+SRC_URI[anstyle-wincon-3.0.4.sha256sum] =3D &quot;5bf74e1b6e9716=
09db8ca7a9ce79fd5768ab6ae46441c572e46cf596f59e57f8&quot;<br>+SRC_URI[anyhow=
-1.0.89.sha256sum] =3D &quot;86fdf8605db99b54d3cd748a44c6d04df638eb5dafb219=
b135d0149bd0db01f6&quot;<br>+SRC_URI[arrayref-0.3.9.sha256sum] =3D &quot;76=
a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb&quot;<br>+SR=
C_URI[arrayvec-0.7.6.sha256sum] =3D &quot;7c02d123df017efcdfbd739ef81735b36=
c5ba83ec3c59c80a9d7ecc718f92e50&quot;<br>+SRC_URI[assert-json-diff-2.0.2.sh=
a256sum] =3D &quot;47e4f2b81832e72834d7518d8487a0396a28cc408186a2e8854c0f98=
011faf12&quot;<br>+SRC_URI[assert_cmd-2.0.16.sha256sum] =3D &quot;dc1835b7f=
27878de8525dc71410b5a31cdcc5f230aed5ba5df968e09c201b23d&quot;<br>+SRC_URI[a=
ssert_fs-1.1.2.sha256sum] =3D &quot;7efdb1fdb47602827a342857666feb372712cbc=
64b414172bd6b167a02927674&quot;<br>+SRC_URI[async-channel-2.3.1.sha256sum] =
=3D &quot;89b47800b0be77592da0afd425cc03468052844aff33b84e33cc696f64e77b6a&=
quot;<br>+SRC_URI[async-compression-0.4.12.sha256sum] =3D &quot;fec134f64e2=
bc57411226dfc4e52dec859ddfc7e711fc5e07b612584f000e4aa&quot;<br>+SRC_URI[asy=
nc-trait-0.1.83.sha256sum] =3D &quot;721cae7de5c34fbb2acd27e21e6d2cf7b886dc=
e0c27388d46c4e6c47ea4318dd&quot;<br>+SRC_URI[async_http_range_reader-0.8.0.=
sha256sum] =3D &quot;f1a0e0571c5d724d17fbe0b608d31a91e94938722c141877d3a298=
2216b084c2&quot;<br>+SRC_URI[atomic-waker-1.1.2.sha256sum] =3D &quot;1505bd=
5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0&quot;<br>+SRC_UR=
I[autocfg-1.3.0.sha256sum] =3D &quot;0c4b4d0bd25bd0b74681c0ad21497610ce1b7c=
91b1022cd21c80c6fbdd9476b0&quot;<br>+SRC_URI[axoasset-1.0.0.sha256sum] =3D =
&quot;45e7b7ac1c1cd4fdcaa2f9e704defa9defd996039083d85e17efa5e8eefb3bd2&quot=
;<br>+SRC_URI[axoprocess-0.2.0.sha256sum] =3D &quot;4de46920588aef956587979=
96130bacd542436aee090084646521260a74bda7d&quot;<br>+SRC_URI[axotag-0.2.0.sh=
a256sum] =3D &quot;d888fac0b73e64cbdf36a743fc5a25af5ae955c357535cb420b389bf=
1e1a6c54&quot;<br>+SRC_URI[axoupdater-0.7.2.sha256sum] =3D &quot;fa6f92ef9a=
b41a352f403f709ef0f09cda1f461795de52085cd46ed831ead02e&quot;<br>+SRC_URI[ba=
ckoff-0.4.0.sha256sum] =3D &quot;b62ddb9cb1ec0a098ad4bbf9344d0713fa193ae1a8=
0af55febcff2627b6a00c1&quot;<br>+SRC_URI[backtrace-0.3.74.sha256sum] =3D &q=
uot;8d82cb332cdfaed17ae235a638438ac4d4839913cc2af585c3c6746e8f8bee1a&quot;<=
br>+SRC_URI[base64-0.21.7.sha256sum] =3D &quot;9d297deb1925b89f2ccc13d7635f=
a0714f12c87adce1c75356b39ca9b7178567&quot;<br>+SRC_URI[base64-0.22.1.sha256=
sum] =3D &quot;72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fb=
b8c6&quot;<br>+SRC_URI[bisection-0.1.0.sha256sum] =3D &quot;021e079a1bab0ec=
ce6cf4b4b74c0c37afa4a697136eb3b127875c84a8f04a8c3&quot;<br>+SRC_URI[bitflag=
s-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4=
fdc18d06fb1037718a&quot;<br>+SRC_URI[bitflags-2.6.0.sha256sum] =3D &quot;b0=
48fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de&quot;<br>+SR=
C_URI[block-buffer-0.10.4.sha256sum] =3D &quot;3078c7629b62d3f0439517fa3949=
96acacc5cbc91c5a20d8c658e77abd503a71&quot;<br>+SRC_URI[boxcar-0.2.5.sha256s=
um] =3D &quot;510a90332002c1af3317ef6b712f0dab697f30bbe809b86965eac2923c0bc=
a8e&quot;<br>+SRC_URI[bstr-1.10.0.sha256sum] =3D &quot;40723b8fb387abc38f4f=
4a37c09073622e41dd12327033091ef8950659e6dc0c&quot;<br>+SRC_URI[bumpalo-3.16=
.0.sha256sum] =3D &quot;79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28=
adb49162e012c&quot;<br>+SRC_URI[bytecheck-0.8.0.sha256sum] =3D &quot;50c8f4=
30744b23b54ad15161fcbc22d82a29b73eacbe425fea23ec822600bc6f&quot;<br>+SRC_UR=
I[bytecheck_derive-0.8.0.sha256sum] =3D &quot;523363cbe1df49b68215efdf500b1=
03ac3b0fb4836aed6d15689a076eadb8fff&quot;<br>+SRC_URI[bytemuck-1.18.0.sha25=
6sum] =3D &quot;94bbb0ad554ad961ddc5da507a12a29b14e4ae5bda06b19f575a3e6079d=
2e2ae&quot;<br>+SRC_URI[byteorder-1.5.0.sha256sum] =3D &quot;1fd0f2584146f6=
f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b&quot;<br>+SRC_URI[byteor=
der-lite-0.1.0.sha256sum] =3D &quot;8f1fe948ff07f4bd06c30984e69f5b4899c516a=
3ef74f34df92a2df2ab535495&quot;<br>+SRC_URI[bytes-1.7.1.sha256sum] =3D &quo=
t;8318a53db07bb3f8dca91a600466bdb3f2eaadeedfdbcf02e1accbad9271ba50&quot;<br=
>+SRC_URI[bzip2-0.4.4.sha256sum] =3D &quot;bdb116a6ef3f6c3698828873ad02c301=
4b3c85cadb88496095628e3ef1e347f8&quot;<br>+SRC_URI[bzip2-sys-0.1.11+1.0.8.s=
ha256sum] =3D &quot;736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a18=
6b6cd4cdc&quot;<br>+SRC_URI[cachedir-0.3.1.sha256sum] =3D &quot;4703f393707=
7db8fa35bee3c8789343c1aec2585f0146f09d658d4ccc0e8d873&quot;<br>+SRC_URI[cam=
ino-1.1.9.sha256sum] =3D &quot;8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980=
879c3424042a02fd1ad3&quot;<br>+SRC_URI[cargo-util-0.2.14.sha256sum] =3D &qu=
ot;cc680c90073156fb5280c0c0127b779eef1f6292e41f7d6621acba3041e81c7d&quot;<b=
r>+SRC_URI[cast-0.3.0.sha256sum] =3D &quot;37b2a672a2cb129a2e41c10b1224bb36=
8f9f37a2b16b612598138befd7b37eb5&quot;<br>+SRC_URI[cc-1.1.19.sha256sum] =3D=
 &quot;2d74707dde2ba56f86ae90effb3b43ddd369504387e718014de010cec7959800&quo=
t;<br>+SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619e3cb=
c0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>+SRC_URI[cfg_aliases-0.2.1.=
sha256sum] =3D &quot;613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad=
1658eb5724&quot;<br>+SRC_URI[charset-0.1.5.sha256sum] =3D &quot;f1f927b07c7=
4ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e&quot;<br>+SRC_URI[cib=
orium-0.2.2.sha256sum] =3D &quot;42e69ffd6f0917f5c029256a24d0161db17cea3997=
d185db0d35926308770f0e&quot;<br>+SRC_URI[ciborium-io-0.2.2.sha256sum] =3D &=
quot;05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757&quot;=
<br>+SRC_URI[ciborium-ll-0.2.2.sha256sum] =3D &quot;57663b653d948a338bfb3ee=
ba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9&quot;<br>+SRC_URI[clap-4.5.18.sha=
256sum] =3D &quot;b0956a43b323ac1afaffc053ed5c4b7c1f1800bacd1683c353aabbb75=
2515dd3&quot;<br>+SRC_URI[clap_builder-4.5.18.sha256sum] =3D &quot;4d72166d=
d41634086d5803a47eb71ae740e61d84709c36f3c34110173db3961b&quot;<br>+SRC_URI[=
clap_complete-4.5.26.sha256sum] =3D &quot;205d5ef6d485fa47606b98b0ddc4ead26=
eb850aaa86abfb562a94fb3280ecba0&quot;<br>+SRC_URI[clap_complete_command-0.6=
.1.sha256sum] =3D &quot;da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11=
eeb7a644a1b62&quot;<br>+SRC_URI[clap_complete_nushell-4.5.3.sha256sum] =3D =
&quot;5fe32110e006bccf720f8c9af3fee1ba7db290c724eab61544e1d3295be3a40e&quot=
;<br>+SRC_URI[clap_derive-4.5.18.sha256sum] =3D &quot;4ac6a0c7b1a9e9a518636=
1f67dfa1b88213572f427fb9ab038efb2bd8c582dab&quot;<br>+SRC_URI[clap_lex-0.7.=
2.sha256sum] =3D &quot;1462739cb27611015575c0c11df5df7601141071f07518d56fcc=
1be504cbec97&quot;<br>+SRC_URI[cmake-0.1.51.sha256sum] =3D &quot;fb1e43aa7f=
d152b1f968787f7dbcdeb306d1867ff373c69955211876c053f91a&quot;<br>+SRC_URI[co=
dspeed-2.7.2.sha256sum] =3D &quot;450a0e9df9df1c154156f4344f99d8f6f6e69d0fc=
4de96ef6e2e68b2ec3bce97&quot;<br>+SRC_URI[codspeed-criterion-compat-2.7.2.s=
ha256sum] =3D &quot;8eb1a6cb9c20e177fde58cdef97c1c7c9264eb1424fe45c4fccedc2=
fb078a569&quot;<br>+SRC_URI[color_quant-1.1.0.sha256sum] =3D &quot;3d7b894f=
5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b&quot;<br>+SRC_URI[=
colorchoice-1.0.2.sha256sum] =3D &quot;d3fd119d74b830634cea2a0f58bbd0d54540=
518a14397557951e79340abc28c0&quot;<br>+SRC_URI[colored-2.1.0.sha256sum] =3D=
 &quot;cbf2150cce219b664a8a70df7a1f933836724b503f8a413af9365b4dcc4d90b8&quo=
t;<br>+SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D &quot;4ca0197aee26d1ae=
37445ee532fefce43251d24cc7c166799f4d46817f1d3973&quot;<br>+SRC_URI[configpa=
rser-3.1.0.sha256sum] =3D &quot;e57e3272f0190c3f1584272d613719ba5fc7df7f494=
2fe542e63d949cf3a649b&quot;<br>+SRC_URI[console-0.15.8.sha256sum] =3D &quot=
;0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb&quot;<br>=
+SRC_URI[core-foundation-0.9.4.sha256sum] =3D &quot;91e195e091a93c46f7102ec=
7818a2aa394e1e1771c3ab4825963fa03e45afb8f&quot;<br>+SRC_URI[core-foundation=
-sys-0.8.7.sha256sum] =3D &quot;773648b94d0e5d620f64f280777445740e61fe70102=
5087ec8b57f45c791888b&quot;<br>+SRC_URI[cpufeatures-0.2.14.sha256sum] =3D &=
quot;608697df725056feaccfa42cffdaeeec3fccc4ffc38358ecd19b243e716a78e0&quot;=
<br>+SRC_URI[crc32fast-1.4.2.sha256sum] =3D &quot;a97769d94ddab943e4510d138=
150169a2758b5ef3eb191a9ee688de3e23ef7b3&quot;<br>+SRC_URI[criterion-0.5.1.s=
ha256sum] =3D &quot;f2b12d017a929603d80db1831cd3a24082f8137ce19c69e6447f54f=
5fc8d692f&quot;<br>+SRC_URI[criterion-plot-0.5.0.sha256sum] =3D &quot;6b508=
26342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1&quot;<br>+SRC_U=
RI[crossbeam-deque-0.8.5.sha256sum] =3D &quot;613f8cc01fe9cf1a3eb3d7f488fd2=
fa8388403e97039e2f73692932e291a770d&quot;<br>+SRC_URI[crossbeam-epoch-0.9.1=
8.sha256sum] =3D &quot;5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3=
714ad1b5420e&quot;<br>+SRC_URI[crossbeam-utils-0.8.20.sha256sum] =3D &quot;=
22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80&quot;<br>+=
SRC_URI[crunchy-0.2.2.sha256sum] =3D &quot;7a81dae078cea95a014a339291cec439=
d2f232ebe854a9d672b796c6afafa9b7&quot;<br>+SRC_URI[crypto-common-0.1.6.sha2=
56sum] =3D &quot;1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34a=
f26bb3&quot;<br>+SRC_URI[csv-1.3.0.sha256sum] =3D &quot;ac574ff4d437a7b5ad2=
37ef331c17ccca63c46479e5b5453eb8e10bb99a759fe&quot;<br>+SRC_URI[csv-core-0.=
1.11.sha256sum] =3D &quot;5efa2b3d7902f4b634a20cae3c9c4e6209dc4779feb686332=
9607560143efa70&quot;<br>+SRC_URI[ctrlc-3.4.5.sha256sum] =3D &quot;90eeab0a=
a92f3f9b4e87f258c72b139c207d251f9cbc1080a0086b86a8870dd3&quot;<br>+SRC_URI[=
dashmap-6.1.0.sha256sum] =3D &quot;5041cc499144891f3790297212f32a74fb938e51=
36a14943f338ef9e0ae276cf&quot;<br>+SRC_URI[data-encoding-2.6.0.sha256sum] =
=3D &quot;e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2&=
quot;<br>+SRC_URI[data-url-0.2.0.sha256sum] =3D &quot;8d7439c3735f405729d52=
c3fbbe4de140eaf938a1fe47d227c27f8254d4302a5&quot;<br>+SRC_URI[deadpool-0.10=
.0.sha256sum] =3D &quot;fb84100978c1c7b37f09ed3ce3e5f843af02c2a2c431bae5b19=
230dad2c1b490&quot;<br>+SRC_URI[deadpool-runtime-0.1.4.sha256sum] =3D &quot=
;092966b41edc516079bdf31ec78a2e0588d1d0c08f78b91d8307215928642b2b&quot;<br>=
+SRC_URI[diff-0.1.13.sha256sum] =3D &quot;56254986775e3233ffa9c4d7d3faaf6d3=
6a2c09d30b20687e9f88bc8bafc16c8&quot;<br>+SRC_URI[difflib-0.4.0.sha256sum] =
=3D &quot;6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8&=
quot;<br>+SRC_URI[digest-0.10.7.sha256sum] =3D &quot;9ed9a281f7bc9b7576e614=
68ba615a66a5c8cfdff42420a70aa82701a3b1e292&quot;<br>+SRC_URI[directories-5.=
0.1.sha256sum] =3D &quot;9a49173b84e034382284f27f1af4dcbbd231ffa358c0fe3165=
41a7337f376a35&quot;<br>+SRC_URI[dirs-sys-0.4.1.sha256sum] =3D &quot;520f05=
a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c&quot;<br>+SRC_UR=
I[doc-comment-0.3.3.sha256sum] =3D &quot;fea41bba32d969b513997752735605054b=
c0dfa92b4c56bf1189f2e174be7a10&quot;<br>+SRC_URI[dunce-1.0.5.sha256sum] =3D=
 &quot;92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813&quo=
t;<br>+SRC_URI[dyn-clone-1.0.17.sha256sum] =3D &quot;0d6ef0072f8a535281e487=
6be788938b528e9a1d43900b82c2569af7da799125&quot;<br>+SRC_URI[either-1.13.0.=
sha256sum] =3D &quot;60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4=
bc7c0d4cf0&quot;<br>+SRC_URI[encode_unicode-0.3.6.sha256sum] =3D &quot;a357=
d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f&quot;<br>+SRC_=
URI[encoding_rs-0.8.34.sha256sum] =3D &quot;b45de904aa0b010bce2ab45264d0631=
681847fa7b6f2eaa7dab7619943bc4f59&quot;<br>+SRC_URI[encoding_rs_io-0.1.7.sh=
a256sum] =3D &quot;1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa3184=
0c252a83&quot;<br>+SRC_URI[equivalent-1.0.1.sha256sum] =3D &quot;5443807d6d=
ff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5&quot;<br>+SRC_URI[er=
ased-serde-0.4.5.sha256sum] =3D &quot;24e2389d65ab4fab27dc2a5de7b191e1f6617=
d1f1c8855c0dc569c94a4cbb18d&quot;<br>+SRC_URI[errno-0.3.9.sha256sum] =3D &q=
uot;534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba&quot;<=
br>+SRC_URI[etcetera-0.8.0.sha256sum] =3D &quot;136d1b5283a1ab77bd9257427ff=
d09d8667ced0570b6f938942bc7568ed5b943&quot;<br>+SRC_URI[event-listener-5.3.=
1.sha256sum] =3D &quot;6032be9bd27023a771701cc49f9f053c751055f71efb2e0ae5c1=
5809093675ba&quot;<br>+SRC_URI[event-listener-strategy-0.5.2.sha256sum] =3D=
 &quot;0f214dc438f977e6d4e3500aaa277f5ad94ca83fbbd9b1a15713ce2344ccc5a1&quo=
t;<br>+SRC_URI[fastrand-2.1.1.sha256sum] =3D &quot;e8c02a5121d4ea3eb16a8074=
8c74f5549a5665e4c21333c6098f283870fbdea6&quot;<br>+SRC_URI[fdeflate-0.3.4.s=
ha256sum] =3D &quot;4f9bfee30e4dedf0ab8b422f03af778d9612b63f502710fc500a334=
ebe2de645&quot;<br>+SRC_URI[filetime-0.2.25.sha256sum] =3D &quot;35c0522e98=
1e68cbfa8c3f978441a5f34b30b96e146b33cd3359176b50fe8586&quot;<br>+SRC_URI[fi=
xedbitset-0.4.2.sha256sum] =3D &quot;0ce7134b9999ecaf8bcd65542e436736ef32dd=
ca1b3e06094cb6ec5755203b80&quot;<br>+SRC_URI[flate2-1.0.34.sha256sum] =3D &=
quot;a1b589b4dc103969ad3cf85c950899926ec64300a1a46d76c03a6072957036f0&quot;=
<br>+SRC_URI[float-cmp-0.9.0.sha256sum] =3D &quot;98de4bbd547a563b716d8dfa9=
aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4&quot;<br>+SRC_URI[fnv-1.0.7.sha256s=
um] =3D &quot;3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab8=
2c1&quot;<br>+SRC_URI[fontconfig-parser-0.5.7.sha256sum] =3D &quot;c1fcfcd4=
4ca6e90c921fee9fa665d530b21ef1327a4c1a6c5250ea44b776ada7&quot;<br>+SRC_URI[=
fontdb-0.12.0.sha256sum] =3D &quot;ff20bef7942a72af07104346154a70a70b089c57=
2e454b41bef6eb6cb10e9c06&quot;<br>+SRC_URI[form_urlencoded-1.2.1.sha256sum]=
 =3D &quot;e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456=
&quot;<br>+SRC_URI[fs-err-2.11.0.sha256sum] =3D &quot;88a41f105fe1d5b6b34b2=
055e3dc59bb79b46b48b2040b9e6c7b4b5de097aa41&quot;<br>+SRC_URI[fs2-0.4.3.sha=
256sum] =3D &quot;9564fc758e15025b46aa6643b1b77d047d1a56a1aea6e01002ac0c702=
6876213&quot;<br>+SRC_URI[futures-0.3.30.sha256sum] =3D &quot;645c6916888f6=
cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0&quot;<br>+SRC_URI[futur=
es-channel-0.3.30.sha256sum] =3D &quot;eac8f7d7865dcb88bd4373ab671c8cf45087=
03796caa2b1985a9ca867b3fcb78&quot;<br>+SRC_URI[futures-core-0.3.30.sha256su=
m] =3D &quot;dfc6580bb841c5a68e9ef15c77ccc837b40a7504914d52e47b8b0e9bbda25a=
1d&quot;<br>+SRC_URI[futures-executor-0.3.30.sha256sum] =3D &quot;a576fc72a=
e164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d&quot;<br>+SRC_URI[f=
utures-io-0.3.30.sha256sum] =3D &quot;a44623e20b9681a318efdd71c299b6b222ed6=
f231972bfe2f224ebad6311f0c1&quot;<br>+SRC_URI[futures-lite-2.3.0.sha256sum]=
 =3D &quot;52527eb5074e35e9339c6b4e8d12600c7128b68fb25dcb9fa9dec18f7c25f3a5=
&quot;<br>+SRC_URI[futures-macro-0.3.30.sha256sum] =3D &quot;87750cf4b7a4c0=
625b1529e4c543c2182106e4dedc60a2a6455e00d212c489ac&quot;<br>+SRC_URI[future=
s-sink-0.3.30.sha256sum] =3D &quot;9fb8e00e87438d937621c1c6269e53f536c14d3f=
bd6a042bb24879e57d474fb5&quot;<br>+SRC_URI[futures-task-0.3.30.sha256sum] =
=3D &quot;38d84fa142264698cdce1a9f9172cf383a0c82de1bddcf3092901442c4097004&=
quot;<br>+SRC_URI[futures-util-0.3.30.sha256sum] =3D &quot;3d6401deb83407ab=
3da39eba7e33987a73c3df0c82b4bb5813ee871c19c41d48&quot;<br>+SRC_URI[generic-=
array-0.14.7.sha256sum] =3D &quot;85649ca51fd72272d7821adaf274ad91c28827771=
3d9c18820d8499a7ff69e9a&quot;<br>+SRC_URI[getrandom-0.2.15.sha256sum] =3D &=
quot;c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7&quot;=
<br>+SRC_URI[gif-0.12.0.sha256sum] =3D &quot;80792593675e051cf94a4b111980da=
2ba60d4a83e43e0048c5693baab3977045&quot;<br>+SRC_URI[gimli-0.31.0.sha256sum=
] =3D &quot;32085ea23f3234fc7846555e85283ba4de91e21016dc0455a16286d87a292d6=
4&quot;<br>+SRC_URI[glob-0.3.1.sha256sum] =3D &quot;d2fabcfbdc87f4758337ca5=
35fb41a6d701b65693ce38287d856d1674551ec9b&quot;<br>+SRC_URI[globset-0.4.15.=
sha256sum] =3D &quot;15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797=
578b42fb19&quot;<br>+SRC_URI[globwalk-0.9.1.sha256sum] =3D &quot;0bf760ebf6=
9878d9fd8f110c89703d90ce35095324d1f1edcb595c63945ee757&quot;<br>+SRC_URI[go=
blin-0.8.2.sha256sum] =3D &quot;1b363a30c165f666402fe6a3024d3bec7ebc898f96a=
4a23bd1c99f8dbf3f4f47&quot;<br>+SRC_URI[h2-0.4.6.sha256sum] =3D &quot;524e8=
ac6999421f49a846c2d4411f337e53497d8ec55d67753beffa43c5d9205&quot;<br>+SRC_U=
RI[half-2.4.1.sha256sum] =3D &quot;6dd08c532ae367adf81c312a4580bc67f1d0fe8b=
c9c460520283f4c0ff277888&quot;<br>+SRC_URI[hashbrown-0.14.5.sha256sum] =3D =
&quot;e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1&quot=
;<br>+SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3=
b60a884b5d30c0fca7d82fe33449bbe55ea&quot;<br>+SRC_URI[hermit-abi-0.3.9.sha2=
56sum] =3D &quot;d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97=
ec5024&quot;<br>+SRC_URI[hermit-abi-0.4.0.sha256sum] =3D &quot;fbf6a919d6cf=
397374f7dfeeea91d974c7c0a7221d0d0f4f20d859d329e53fcc&quot;<br>+SRC_URI[hex-=
0.4.3.sha256sum] =3D &quot;7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5=
fd8f86ba55232a70&quot;<br>+SRC_URI[home-0.5.9.sha256sum] =3D &quot;e3d1354b=
f6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5&quot;<br>+SRC_URI[=
homedir-0.3.3.sha256sum] =3D &quot;2bed305c13ce3829a09d627f5d43ff738482a093=
61ae4eb8039993b55fb10e5e&quot;<br>+SRC_URI[html-escape-0.2.13.sha256sum] =
=3D &quot;6d1ad449764d627e22bfd7cd5e8868264fc9236e07c752972b4080cd351cb476&=
quot;<br>+SRC_URI[http-1.1.0.sha256sum] =3D &quot;21b9ddb458710bc376481b842=
f5da65cdf31522de232c1ca8146abce2a358258&quot;<br>+SRC_URI[http-body-1.0.1.s=
ha256sum] =3D &quot;1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62=
566c93184&quot;<br>+SRC_URI[http-body-util-0.1.2.sha256sum] =3D &quot;79342=
9d76616a256bcb62c2a2ec2bed781c8307e797e2598c50010f2bee2544f&quot;<br>+SRC_U=
RI[http-content-range-0.1.2.sha256sum] =3D &quot;9f0d1a8ef218a86416107794b3=
4cc446958d9203556c312bb41eab4c924c1d2e&quot;<br>+SRC_URI[httparse-1.9.4.sha=
256sum] =3D &quot;0fcc0b4a115bf80b728eb8ea024ad5bd707b615bfed49e0665b6e0f86=
fd082d9&quot;<br>+SRC_URI[httpdate-1.0.3.sha256sum] =3D &quot;df3b46402a9d5=
adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9&quot;<br>+SRC_URI[hyper=
-1.4.1.sha256sum] =3D &quot;50dfd22e0e76d0f662d429a5f80fcaf3855009297eab6a0=
a9f8543834744ba05&quot;<br>+SRC_URI[hyper-rustls-0.27.3.sha256sum] =3D &quo=
t;08afdbb5c31130e3034af566421053ab03787c640246a446327f550d11bcb333&quot;<br=
>+SRC_URI[hyper-util-0.1.9.sha256sum] =3D &quot;41296eb09f183ac68eec06e03cd=
bea2e759633d4067b2f6552fc2e009bcad08b&quot;<br>+SRC_URI[idna-0.5.0.sha256su=
m] =3D &quot;634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12=
f6&quot;<br>+SRC_URI[ignore-0.4.23.sha256sum] =3D &quot;6d89fd380afde86567d=
fba715db065673989d6253f42b88179abd3eae47bda4b&quot;<br>+SRC_URI[image-0.25.=
2.sha256sum] =3D &quot;99314c8a2152b8ddb211f924cdae532d8c5e4c8bb54728e12fff=
1b0cd5963a10&quot;<br>+SRC_URI[imagesize-0.11.0.sha256sum] =3D &quot;b72ad4=
9b554c1728b1e83254a1b1565aea4161e28dabbfa171fc15fe62299caf&quot;<br>+SRC_UR=
I[indexmap-2.5.0.sha256sum] =3D &quot;68b900aa2f7301e21c36462b170ee99994de3=
4dff39a4a6a528e80e7376d07e5&quot;<br>+SRC_URI[indicatif-0.17.8.sha256sum] =
=3D &quot;763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3&=
quot;<br>+SRC_URI[indoc-2.0.5.sha256sum] =3D &quot;b248f5224d1d606005e02c97=
f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5&quot;<br>+SRC_URI[insta-1.40.0.sha=
256sum] =3D &quot;6593a41c7a73841868772495db7dc1e8ecab43bb5c0b6da2059246c4b=
506ab60&quot;<br>+SRC_URI[instant-0.1.13.sha256sum] =3D &quot;e0242819d153c=
ba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222&quot;<br>+SRC_URI[ipnet=
-2.10.0.sha256sum] =3D &quot;187674a687eed5fe42285b40c6291f9a01517d415fad1c=
3cbc6a9f778af7fcd4&quot;<br>+SRC_URI[is-terminal-0.4.13.sha256sum] =3D &quo=
t;261f68e344040fbd0edea105bef17c66edf46f984ddb1115b775ce31be948f4b&quot;<br=
>+SRC_URI[is_ci-1.2.0.sha256sum] =3D &quot;7655c9839580ee829dfacba1d1278c2b=
7883e50a277ff7541299489d6bdfdc45&quot;<br>+SRC_URI[is_terminal_polyfill-1.7=
0.1.sha256sum] =3D &quot;7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81c=
e38704e97b8ecf&quot;<br>+SRC_URI[itertools-0.10.5.sha256sum] =3D &quot;b0fd=
2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473&quot;<br>+SRC_=
URI[itertools-0.12.1.sha256sum] =3D &quot;ba291022dbbd398a455acf126c1e34195=
4079855bc60dfdda641363bd6922569&quot;<br>+SRC_URI[itertools-0.13.0.sha256su=
m] =3D &quot;413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f011=
86&quot;<br>+SRC_URI[itoa-1.0.11.sha256sum] =3D &quot;49f1f14873335454500d5=
9611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b&quot;<br>+SRC_URI[jiff-0.1.13.s=
ha256sum] =3D &quot;8a45489186a6123c128fdf6016183fcfab7113e1820eb813127e036=
e287233fb&quot;<br>+SRC_URI[jiff-tzdb-0.1.1.sha256sum] =3D &quot;91335e5758=
50c5c4c673b9bd467b0e025f164ca59d0564f69d0c2ee0ffad4653&quot;<br>+SRC_URI[ji=
ff-tzdb-platform-0.1.1.sha256sum] =3D &quot;9835f0060a626fe59f160437bc72549=
1a6af23133ea906500027d1bd2f8f4329&quot;<br>+SRC_URI[jobserver-0.1.32.sha256=
sum] =3D &quot;48d1dbcbbeb6a7fec7e059840aa538bd62aaccf972c7346c4d9d20593128=
53d0&quot;<br>+SRC_URI[jpeg-decoder-0.3.1.sha256sum] =3D &quot;f5d4a7da358e=
ff58addd2877a45865158f0d78c911d43a5784ceb7bbf52833b0&quot;<br>+SRC_URI[js-s=
ys-0.3.70.sha256sum] =3D &quot;1868808506b929d7b0cfa8f75951347aa71bb21144b7=
791bae35d9bccfcfe37a&quot;<br>+SRC_URI[junction-1.2.0.sha256sum] =3D &quot;=
72bbdfd737a243da3dfc1f99ee8d6e166480f17ab4ac84d7c34aacd73fc7bd16&quot;<br>+=
SRC_URI[krata-tokio-tar-0.4.2.sha256sum] =3D &quot;e8bd5fee9b96acb5fc36b401=
896d601e6fdcce52b0e651ce24a3b21fb524e79f&quot;<br>+SRC_URI[kurbo-0.8.3.sha2=
56sum] =3D &quot;7a53776d271cfb873b17c618af0298445c88afc52837f3e948fa3fafd1=
31f449&quot;<br>+SRC_URI[kurbo-0.9.5.sha256sum] =3D &quot;bd85a5776cd9500c2=
e2059c8c76c3b01528566b7fcbaf8098b55a33fc298849b&quot;<br>+SRC_URI[lazy_stat=
ic-1.5.0.sha256sum] =3D &quot;bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c66=
85e1f298068316e66fe&quot;<br>+SRC_URI[libc-0.2.158.sha256sum] =3D &quot;d8a=
dc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439&quot;<br>+SRC=
_URI[libmimalloc-sys-0.1.39.sha256sum] =3D &quot;23aa6811d3bd4deb8a84dde645=
f943476d13b248d818edcf8ce0b2f37f036b44&quot;<br>+SRC_URI[libredox-0.1.3.sha=
256sum] =3D &quot;c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79=
f00268d&quot;<br>+SRC_URI[libz-ng-sys-1.1.16.sha256sum] =3D &quot;4436751a0=
1da56f1277f323c80d584ffad94a3d14aecd959dd0dff75aa73a438&quot;<br>+SRC_URI[l=
inked-hash-map-0.5.6.sha256sum] =3D &quot;0717cef1bc8b636c6e1c1bbdefc09e632=
2da8a9321966e8928ef80d20f7f770f&quot;<br>+SRC_URI[linux-raw-sys-0.4.14.sha2=
56sum] =3D &quot;78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d7=
93fa89&quot;<br>+SRC_URI[lock_api-0.4.12.sha256sum] =3D &quot;07af8b9cdd281=
b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17&quot;<br>+SRC_URI[log-0=
.4.22.sha256sum] =3D &quot;a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7=
f72f873a39d07b24&quot;<br>+SRC_URI[lzma-sys-0.1.20.sha256sum] =3D &quot;5fd=
a04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27&quot;<br>+SRC=
_URI[mailparse-0.15.0.sha256sum] =3D &quot;3da03d5980411a724e8aaf7b61a7b5e3=
86ec55a7fb49ee3d0ff79efc7e5e7c7e&quot;<br>+SRC_URI[markdown-0.3.0.sha256sum=
] =3D &quot;ef3aab6a1d529b112695f72beec5ee80e729cb45af58663ec902c8fac764ecd=
d&quot;<br>+SRC_URI[matchers-0.1.0.sha256sum] =3D &quot;8263075bb86c5a1b142=
7b5ae862e8889656f126e9f77c484496e8b47cf5c5558&quot;<br>+SRC_URI[md-5-0.10.6=
.sha256sum] =3D &quot;d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df9=
17a6d2e78cf&quot;<br>+SRC_URI[memchr-2.7.4.sha256sum] =3D &quot;78ca9ab1a0b=
abb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3&quot;<br>+SRC_URI[mem=
map2-0.5.10.sha256sum] =3D &quot;83faa42c0a078c393f6b29d5db232d8be22776a891=
f8f56e5284faee4a20b327&quot;<br>+SRC_URI[memmap2-0.9.5.sha256sum] =3D &quot=
;fd3f7eed9d3848f8b98834af67102b720745c4ec028fcd0aa0239277e7de374f&quot;<br>=
+SRC_URI[memoffset-0.7.1.sha256sum] =3D &quot;5de893c32cde5f383baa4c04c5d6d=
bdd735cfd4a794b0debdb2bb1b421da5ff4&quot;<br>+SRC_URI[miette-7.2.0.sha256su=
m] =3D &quot;4edc8853320c2a0dab800fbda86253c8938f6ea88510dc92c5f1ed20e794af=
c1&quot;<br>+SRC_URI[miette-derive-7.2.0.sha256sum] =3D &quot;dcf09caffaac8=
068c346b6df2a7fc27a177fd20b39421a39ce0a211bde679a6c&quot;<br>+SRC_URI[mimal=
loc-0.1.43.sha256sum] =3D &quot;68914350ae34959d83f732418d51e2427a794055d0b=
9529f48259ac07af65633&quot;<br>+SRC_URI[mime-0.3.17.sha256sum] =3D &quot;68=
77bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a&quot;<br>+SR=
C_URI[mime_guess-2.0.5.sha256sum] =3D &quot;f7c44f8e672c00fe5308fa235f821cb=
4198414e1c77935c1ab6948d3fd78550e&quot;<br>+SRC_URI[miniz_oxide-0.7.4.sha25=
6sum] =3D &quot;b8a240ddb74feaf34a79a7add65a741f3167852fba007066dcac1ca548d=
89c08&quot;<br>+SRC_URI[miniz_oxide-0.8.0.sha256sum] =3D &quot;e2d80299ef12=
ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1&quot;<br>+SRC_URI[mio-=
1.0.2.sha256sum] =3D &quot;80e04d1dcff3aae0704555fe5fee3bcfaf3d1fdf8a7e521d=
5b9d2b42acb52cec&quot;<br>+SRC_URI[miow-0.6.0.sha256sum] =3D &quot;359f7643=
0b20a79f9e20e115b3428614e654f04fab314482fc0fda0ebd3c6044&quot;<br>+SRC_URI[=
munge-0.4.1.sha256sum] =3D &quot;64142d38c84badf60abf06ff9bd80ad2174306a5b1=
1bd4706535090a30a419df&quot;<br>+SRC_URI[munge_macro-0.4.1.sha256sum] =3D &=
quot;1bb5c1d8184f13f7d0ccbeeca0def2f9a181bce2624302793005f5ca8aa62e5e&quot;=
<br>+SRC_URI[nanoid-0.4.0.sha256sum] =3D &quot;3ffa00dec017b5b1a8b7cf5e2c00=
8bfda1aa7e0697ac1508b491fdf2622fb4d8&quot;<br>+SRC_URI[nix-0.26.4.sha256sum=
] =3D &quot;598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1=
b&quot;<br>+SRC_URI[nix-0.29.0.sha256sum] =3D &quot;71e2746dc3a24dd78b3cfcb=
7be93368c6de9963d30f43a6a73998a9cf4b17b46&quot;<br>+SRC_URI[normalize-line-=
endings-0.3.0.sha256sum] =3D &quot;61807f77802ff30975e01f4f071c8ba10c022052=
f98b3294119f3e615d13e5be&quot;<br>+SRC_URI[nu-ansi-term-0.46.0.sha256sum] =
=3D &quot;77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84&=
quot;<br>+SRC_URI[nu-ansi-term-0.50.1.sha256sum] =3D &quot;d4a28e057d01f97e=
61255210fcff094d74ed0466038633e95017f5beb68e4399&quot;<br>+SRC_URI[num-trai=
ts-0.2.19.sha256sum] =3D &quot;071dfc062690e90b734c0b2273ce72ad0ffa95f0c745=
96bc250dcfd960262841&quot;<br>+SRC_URI[num_cpus-1.16.0.sha256sum] =3D &quot=
;4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43&quot;<br>=
+SRC_URI[number_prefix-0.4.0.sha256sum] =3D &quot;830b246a0e5f20af87141b25c=
173cd1b609bd7779a4617d6ec582abaf90870f3&quot;<br>+SRC_URI[object-0.36.4.sha=
256sum] =3D &quot;084f1a5821ac4c651660a94a7153d27ac9d8a53736203f58b31945ded=
098070a&quot;<br>+SRC_URI[once_cell-1.20.0.sha256sum] =3D &quot;33ea5043e58=
958ee56f3e15a90aee535795cd7dfd319846288d93c5b57d85cbe&quot;<br>+SRC_URI[oor=
andom-11.1.4.sha256sum] =3D &quot;b410bbe7e14ab526a0e86877eb47c6996a2bd7746=
f027ba551028c925390e4e9&quot;<br>+SRC_URI[openssl-probe-0.1.5.sha256sum] =
=3D &quot;ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf&=
quot;<br>+SRC_URI[option-ext-0.2.0.sha256sum] =3D &quot;04744f49eae99ab78e0=
d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d&quot;<br>+SRC_URI[overload-0.=
1.1.sha256sum] =3D &quot;b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa2=
34dac9b15aaf39&quot;<br>+SRC_URI[owo-colors-4.1.0.sha256sum] =3D &quot;fb37=
767f6569cd834a413442455e0f066d0d522de8630436e2a1761d9726ba56&quot;<br>+SRC_=
URI[parking-2.2.1.sha256sum] =3D &quot;f38d5652c16fde515bb1ecef450ab0f6a219=
d619a7274976324d5e377f7dceba&quot;<br>+SRC_URI[parking_lot-0.11.2.sha256sum=
] =3D &quot;7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff9=
9&quot;<br>+SRC_URI[parking_lot-0.12.3.sha256sum] =3D &quot;f1bf18183cf54e8=
d6059647fc3063646a1801cf30896933ec2311622cc4b9a27&quot;<br>+SRC_URI[parking=
_lot_core-0.8.6.sha256sum] =3D &quot;60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd=
44a23efa72aa342d90177356dc&quot;<br>+SRC_URI[parking_lot_core-0.9.10.sha256=
sum] =3D &quot;1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d46872=
6cf8&quot;<br>+SRC_URI[paste-1.0.15.sha256sum] =3D &quot;57c0d7b74b563b49d3=
8dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a&quot;<br>+SRC_URI[path-slash=
-0.2.1.sha256sum] =3D &quot;1e91099d4268b0e11973f036e885d652fb0b21fedcf6973=
8c627f94db6a44f42&quot;<br>+SRC_URI[pathdiff-0.2.1.sha256sum] =3D &quot;883=
5116a5c179084a830efb3adc117ab007512b535bc1a21c991d3b32a6b44dd&quot;<br>+SRC=
_URI[percent-encoding-2.3.1.sha256sum] =3D &quot;e3148f5046208a5d56bcfc0305=
3e3ca6334e51da8dfb19b6cdc8b306fae3283e&quot;<br>+SRC_URI[pest-2.7.12.sha256=
sum] =3D &quot;9c73c26c01b8c87956cea613c907c9d6ecffd8d18a2a5908e5de0adfaa18=
5cea&quot;<br>+SRC_URI[pest_derive-2.7.12.sha256sum] =3D &quot;664d22978e28=
15783adbdd2c588b455b1bd625299ce36b2a99881ac9627e6d8d&quot;<br>+SRC_URI[pest=
_generator-2.7.12.sha256sum] =3D &quot;a2d5487022d5d33f4c30d91c22afa240ce2a=
644e87fe08caad974d4eab6badbe&quot;<br>+SRC_URI[pest_meta-2.7.12.sha256sum] =
=3D &quot;0091754bbd0ea592c4deb3a122ce8ecbb0753b738aa82bc055fcc2eccc8d8174&=
quot;<br>+SRC_URI[petgraph-0.6.5.sha256sum] =3D &quot;b4c5cc86750666a3ed20b=
daf5ca2a0344f9c67674cae0515bec2da16fbaa47db&quot;<br>+SRC_URI[pico-args-0.5=
.0.sha256sum] =3D &quot;5be167a7af36ee22fe3115051bc51f6e6c7054c9348e28deb4f=
49bd6f705a315&quot;<br>+SRC_URI[pin-project-1.1.5.sha256sum] =3D &quot;b6bf=
43b791c5b9e34c3d182969b4abb522f9343702850a2e57f460d00d09b4b3&quot;<br>+SRC_=
URI[pin-project-internal-1.1.5.sha256sum] =3D &quot;2f38a4412a78282e09a2cf3=
8d195ea5420d15ba0602cb375210efbc877243965&quot;<br>+SRC_URI[pin-project-lit=
e-0.2.14.sha256sum] =3D &quot;bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d=
1aaa6923f45801bdd02&quot;<br>+SRC_URI[pin-utils-0.1.0.sha256sum] =3D &quot;=
8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184&quot;<br>+=
SRC_URI[pipeline-0.5.0.sha256sum] =3D &quot;d15b6607fa632996eb8a17c9041cb60=
71cb75ac057abd45dece578723ea8c7c0&quot;<br>+SRC_URI[pkg-config-0.3.30.sha25=
6sum] =3D &quot;d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2=
907ec&quot;<br>+SRC_URI[plain-0.2.3.sha256sum] =3D &quot;b4596b6d070b27117e=
987119b4dac604f3c58cfb0b191112e24771b2faeac1a6&quot;<br>+SRC_URI[platform-i=
nfo-2.0.4.sha256sum] =3D &quot;91077ffd05d058d70d79eefcd7d7f6aac34980860a75=
19960f7913b6563a8c3a&quot;<br>+SRC_URI[png-0.17.13.sha256sum] =3D &quot;06e=
4b0d3d1312775e782c86c91a111aa1f910cbb65e1337f9975b5f9a554b5e1&quot;<br>+SRC=
_URI[poloto-19.1.2.sha256sum] =3D &quot;164dbd541c9832e92fa34452e9c2e98b515=
a548a3f8549fb2402fe1cd5e46b96&quot;<br>+SRC_URI[portable-atomic-1.7.0.sha25=
6sum] =3D &quot;da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc=
67265&quot;<br>+SRC_URI[ppv-lite86-0.2.20.sha256sum] =3D &quot;77957b295656=
769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04&quot;<br>+SRC_URI[pred=
icates-3.1.2.sha256sum] =3D &quot;7e9086cc7640c29a356d1a29fd134380bee9d8f79=
a17410aa76e7ad295f42c97&quot;<br>+SRC_URI[predicates-core-1.0.8.sha256sum] =
=3D &quot;ae8177bee8e75d6846599c6b9ff679ed51e882816914eec639944d7c9aa11931&=
quot;<br>+SRC_URI[predicates-tree-1.0.11.sha256sum] =3D &quot;41b740d195ed3=
166cd147c8047ec98db0e22ec019eb8eeb76d343b795304fb13&quot;<br>+SRC_URI[prett=
y_assertions-1.4.1.sha256sum] =3D &quot;3ae130e2f271fbc2ac3a40fb1d07180839c=
dbbe443c7a27e1e3c13c5cac0116d&quot;<br>+SRC_URI[priority-queue-2.1.0.sha256=
sum] =3D &quot;560bcab673ff7f6ca9e270c17bf3affd8a05e3bd9207f123b0d45076fd81=
97e8&quot;<br>+SRC_URI[proc-macro2-1.0.86.sha256sum] =3D &quot;5e719e8df665=
df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77&quot;<br>+SRC_URI[ptr_=
meta-0.3.0.sha256sum] =3D &quot;fe9e76f66d3f9606f44e45598d155cb13ecf09f4a28=
199e48daf8c8fc937ea90&quot;<br>+SRC_URI[ptr_meta_derive-0.3.0.sha256sum] =
=3D &quot;ca414edb151b4c8d125c12566ab0d74dc9cdba36fb80eb7b848c15f495fd32d1&=
quot;<br>+SRC_URI[quinn-0.11.5.sha256sum] =3D &quot;8c7c5fdde3cdae7203427dc=
4f0a68fe0ed09833edc525a03456b153b79828684&quot;<br>+SRC_URI[quinn-proto-0.1=
1.8.sha256sum] =3D &quot;fadfaed2cd7f389d0161bb73eeb07b7b78f8691047a6f3e73c=
aaeae55310a4a6&quot;<br>+SRC_URI[quinn-udp-0.5.5.sha256sum] =3D &quot;4fe68=
c2e9e1a1234e218683dbdf9f9dfcb094113c5ac2b938dfcb9bab4c4140b&quot;<br>+SRC_U=
RI[quote-1.0.37.sha256sum] =3D &quot;b5b9d34b8991d19d98081b46eacdd8eb58c6f2=
b201139f7c5f643cc155a633af&quot;<br>+SRC_URI[quoted_printable-0.5.1.sha256s=
um] =3D &quot;640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17=
c73&quot;<br>+SRC_URI[rancor-0.1.0.sha256sum] =3D &quot;caf5f7161924b9d1cea=
0e4cabc97c372cea92b5f927fc13c6bca67157a0ad947&quot;<br>+SRC_URI[rand-0.8.5.=
sha256sum] =3D &quot;34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef58=
1b46327404&quot;<br>+SRC_URI[rand_chacha-0.3.1.sha256sum] =3D &quot;e6c10a6=
3a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88&quot;<br>+SRC_URI=
[rand_core-0.6.4.sha256sum] =3D &quot;ec0be4795e2f6a28069bec0b5ff3e2ac9bafc=
99e6a9a7dc3547996c5c816922c&quot;<br>+SRC_URI[rayon-1.10.0.sha256sum] =3D &=
quot;b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa&quot;=
<br>+SRC_URI[rayon-core-1.12.1.sha256sum] =3D &quot;1465873a3dfdaa8ae7cb14b=
4383657caab0b3e8a0aa9ae8e04b044854c8dfce2&quot;<br>+SRC_URI[rctree-0.5.0.sh=
a256sum] =3D &quot;3b42e27ef78c35d3998403c1d26f3efd9e135d3e5121b0a4845cc5cc=
27547f4f&quot;<br>+SRC_URI[redox_syscall-0.2.16.sha256sum] =3D &quot;fb5a58=
c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a&quot;<br>+SRC_UR=
I[redox_syscall-0.3.5.sha256sum] =3D &quot;567664f262709473930a4bf9e51bf2eb=
f3348f2e748ccc50dea20646858f8f29&quot;<br>+SRC_URI[redox_syscall-0.5.4.sha2=
56sum] =3D &quot;0884ad60e090bf1345b93da0a5de8923c93884cd03f40dfcfddd3b4bee=
661853&quot;<br>+SRC_URI[redox_users-0.4.6.sha256sum] =3D &quot;ba009ff324d=
1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43&quot;<br>+SRC_URI[ref=
link-copy-0.1.19.sha256sum] =3D &quot;dc31414597d1cd7fdd2422798b7652a6329dd=
a0fe0219e6335a13d5bcaa9aeb6&quot;<br>+SRC_URI[regex-1.11.0.sha256sum] =3D &=
quot;38200e5ee88914975b69f657f0801b6f6dccafd44fd9326302a4aaeecfacb1d8&quot;=
<br>+SRC_URI[regex-automata-0.1.10.sha256sum] =3D &quot;6c230d73fb8d8c1b9c0=
b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132&quot;<br>+SRC_URI[regex-autom=
ata-0.4.8.sha256sum] =3D &quot;368758f23274712b504848e9d5a6f010445cc8b87a7c=
db4d7cbee666c1288da3&quot;<br>+SRC_URI[regex-syntax-0.6.29.sha256sum] =3D &=
quot;f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1&quot;=
<br>+SRC_URI[regex-syntax-0.8.5.sha256sum] =3D &quot;2b15c43186be67a4fd63be=
e50d0303afffcef381492ebe2c5d87f324e1b8815c&quot;<br>+SRC_URI[rend-0.5.1.sha=
256sum] =3D &quot;a31c1f1959e4db12c985c0283656be0925f1539549db1e47c4bd0b8b5=
99e1ef7&quot;<br>+SRC_URI[reqwest-0.12.7.sha256sum] =3D &quot;f8f4955649ef5=
c38cc7f9e8aa41761d48fb9677197daea9984dc54f56aad5e63&quot;<br>+SRC_URI[resvg=
-0.29.0.sha256sum] =3D &quot;76888219c0881e22b0ceab06fddcfe83163cd81642bd60=
c7842387f9c968a72e&quot;<br>+SRC_URI[retry-policies-0.4.0.sha256sum] =3D &q=
uot;5875471e6cab2871bc150ecb8c727db5113c9338cc3354dc5ee3425b6aa40a1c&quot;<=
br>+SRC_URI[rgb-0.8.50.sha256sum] =3D &quot;57397d16646700483b67d2dd6511d79=
318f9d057fdbd21a4066aeac8b41d310a&quot;<br>+SRC_URI[ring-0.17.8.sha256sum] =
=3D &quot;c17fa4cb658e3583423e915b9f3acc01cceaee1860e33d59ebae66adc3a2dc0d&=
quot;<br>+SRC_URI[rkyv-0.8.8.sha256sum] =3D &quot;395027076c569819ea6035ee6=
2e664f5e03d74e281744f55261dd1afd939212b&quot;<br>+SRC_URI[rkyv_derive-0.8.8=
.sha256sum] =3D &quot;09cb82b74b4810f07e460852c32f522e979787691b0b7b7439fe4=
73e49d49b2f&quot;<br>+SRC_URI[rmp-0.8.14.sha256sum] =3D &quot;228ed7c16fa39=
782c3b3468e974aec2795e9089153cd08ee2e9aefb3613334c4&quot;<br>+SRC_URI[rmp-s=
erde-1.3.0.sha256sum] =3D &quot;52e599a477cf9840e92f2cde9a7189e67b42c575327=
49bf90aea6ec10facd4db&quot;<br>+SRC_URI[rosvgtree-0.1.0.sha256sum] =3D &quo=
t;bdc23d1ace03d6b8153c7d16f0708cd80b61ee8e80304954803354e67e40d150&quot;<br=
>+SRC_URI[roxmltree-0.18.1.sha256sum] =3D &quot;862340e351ce1b271a378ec53f3=
04a5558f7db87f3769dc655a8f6ecbb68b302&quot;<br>+SRC_URI[roxmltree-0.20.0.sh=
a256sum] =3D &quot;6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a4=
6f487c97&quot;<br>+SRC_URI[rust-netrc-0.1.1.sha256sum] =3D &quot;32662f97cb=
fdbad9d5f78f1338116f06871e7dae4fd37e9f59a0f57cf2044868&quot;<br>+SRC_URI[ru=
stc-demangle-0.1.24.sha256sum] =3D &quot;719b953e2095829ee67db738b3bfa9fa36=
8c94900df327b3f07fe6e794d2fe1f&quot;<br>+SRC_URI[rustc-hash-2.0.0.sha256sum=
] =3D &quot;583034fd73374156e66797ed8e5b0d5690409c9226b22d87cb7f19821c05d15=
2&quot;<br>+SRC_URI[rustix-0.38.37.sha256sum] =3D &quot;8acb788b847c24f2852=
5660c4d7758620a7210875711f79e7f663cc152726811&quot;<br>+SRC_URI[rustls-0.23=
.13.sha256sum] =3D &quot;f2dabaac7466917e566adb06783a81ca48944c6898a1b08b93=
74106dd671f4c8&quot;<br>+SRC_URI[rustls-native-certs-0.7.3.sha256sum] =3D &=
quot;e5bfb394eeed242e909609f56089eecfe5fda225042e8b171791b9c95f5931e5&quot;=
<br>+SRC_URI[rustls-native-certs-0.8.0.sha256sum] =3D &quot;fcaf18a4f2be732=
6cd874a5fa579fae794320a0f388d365dca7e480e55f83f8a&quot;<br>+SRC_URI[rustls-=
pemfile-2.1.3.sha256sum] =3D &quot;196fe16b00e106300d3e45ecfcb764fa292a535d=
7326a29a5875c579c7417425&quot;<br>+SRC_URI[rustls-pki-types-1.8.0.sha256sum=
] =3D &quot;fc0a2ce646f8655401bb81e7927b812614bd5d91dbc968696be50603510fcaf=
0&quot;<br>+SRC_URI[rustls-webpki-0.102.8.sha256sum] =3D &quot;64ca1bc8749b=
d4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9&quot;<br>+SRC_URI[rust=
ybuzz-0.7.0.sha256sum] =3D &quot;162bdf42e261bee271b3957691018634488084ef57=
7dddeb6420a9684cab2a6a&quot;<br>+SRC_URI[ryu-1.0.18.sha256sum] =3D &quot;f3=
cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f&quot;<br>+SR=
C_URI[same-file-1.0.6.sha256sum] =3D &quot;93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502&quot;<br>+SRC_URI[schannel-0.1.24.sha256su=
m] =3D &quot;e9aaafd5a2b6e3d657ff009d82fbd630b6bd54dd4eb06f21693925cdf80f9b=
8b&quot;<br>+SRC_URI[schemars-0.8.21.sha256sum] =3D &quot;09c024468a378b7e3=
6765cd36702b7a90cc3cba11654f6685c8f233408e89e92&quot;<br>+SRC_URI[schemars_=
derive-0.8.21.sha256sum] =3D &quot;b1eee588578aff73f856ab961cd2f79e36bc45d7=
ded33a7562adba4667aecc0e&quot;<br>+SRC_URI[scopeguard-1.2.0.sha256sum] =3D =
&quot;94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49&quot=
;<br>+SRC_URI[scroll-0.12.0.sha256sum] =3D &quot;6ab8598aa408498679922eff7f=
a985c25d58a90771bd6be794434c5277eab1a6&quot;<br>+SRC_URI[scroll_derive-0.12=
.0.sha256sum] =3D &quot;7f81c2fde025af7e69b1d1420531c8a8811ca898919db177141=
a85313b1cb932&quot;<br>+SRC_URI[seahash-4.1.0.sha256sum] =3D &quot;1c107b6f=
4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b&quot;<br>+SRC_URI[=
security-framework-2.11.1.sha256sum] =3D &quot;897b2245f0b511c87893af39b033=
e5ca9cce68824c4d7e7630b5a1d339658d02&quot;<br>+SRC_URI[security-framework-s=
ys-2.11.1.sha256sum] =3D &quot;75da29fe9b9b08fe9d6b22b5b4bcbc75d8db3aa31e63=
9aa56bb62e9d46bfceaf&quot;<br>+SRC_URI[semver-1.0.23.sha256sum] =3D &quot;6=
1697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b&quot;<br>+S=
RC_URI[serde-1.0.210.sha256sum] =3D &quot;c8e3592472072e6e22e0a54d5904d9feb=
f8508f65fb8552499a1abc7d1078c3a&quot;<br>+SRC_URI[serde-untagged-0.1.6.sha2=
56sum] =3D &quot;2676ba99bd82f75cae5cbd2c8eda6fa0b8760f18978ea840e980dd5567=
b5c5b6&quot;<br>+SRC_URI[serde_derive-1.0.210.sha256sum] =3D &quot;243902ed=
a00fad750862fc144cea25caca5e20d615af0a81bee94ca738f1df1f&quot;<br>+SRC_URI[=
serde_derive_internals-0.29.1.sha256sum] =3D &quot;18d26a20a969b9e3fdf2fc2d=
9f21eda6c40e2de84c9408bb5d3b05d499aae711&quot;<br>+SRC_URI[serde_json-1.0.1=
28.sha256sum] =3D &quot;6ff5456707a1de34e7e37f2a6fd3d3f808c318259cbd01ab637=
7795054b483d8&quot;<br>+SRC_URI[serde_spanned-0.6.7.sha256sum] =3D &quot;eb=
5b1b31579f3811bf615c144393417496f152e12ac8b7663bf664f4a815306d&quot;<br>+SR=
C_URI[serde_urlencoded-0.7.1.sha256sum] =3D &quot;d3491c14715ca2294c4d6a88f=
15e84739788c1d030eed8c110436aafdaa2f3fd&quot;<br>+SRC_URI[sha2-0.10.8.sha25=
6sum] =3D &quot;793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3=
a3dc8&quot;<br>+SRC_URI[sharded-slab-0.1.7.sha256sum] =3D &quot;f40ca3c4682=
3713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6&quot;<br>+SRC_URI[she=
ll-escape-0.1.5.sha256sum] =3D &quot;45bb67a18fa91266cc7807181f62f9178a6873=
bfad7dc788c42e6430db40184f&quot;<br>+SRC_URI[shlex-1.3.0.sha256sum] =3D &qu=
ot;0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64&quot;<b=
r>+SRC_URI[signal-hook-registry-1.4.2.sha256sum] =3D &quot;a9e9e0b4211b72e7=
b8b6e85c807d36c212bdb33ea8587f7569562a84df5465b1&quot;<br>+SRC_URI[simd-adl=
er32-0.3.7.sha256sum] =3D &quot;d66dc143e6b11c1eddc06d5c423cfc97062865baf29=
9914ab64caa38182078fe&quot;<br>+SRC_URI[simdutf8-0.1.4.sha256sum] =3D &quot=
;f27f6278552951f1f2b8cf9da965d10969b2efdea95a6ec47987ab46edfe263a&quot;<br>=
+SRC_URI[similar-2.6.0.sha256sum] =3D &quot;1de1d4f81173b03af4c0cbed3c898f6=
bff5b870e4a7f5d6f4057d62a7a4b686e&quot;<br>+SRC_URI[simplecss-0.2.1.sha256s=
um] =3D &quot;a11be7c62927d9427e9f40f3444d5499d868648e2edbc4e2116de69e7ec0e=
89d&quot;<br>+SRC_URI[siphasher-0.3.11.sha256sum] =3D &quot;38b58827f4464d8=
7d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d&quot;<br>+SRC_URI[slab-0.=
4.9.sha256sum] =3D &quot;8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4=
856390e3d3bb67&quot;<br>+SRC_URI[smallvec-1.13.2.sha256sum] =3D &quot;3c5e1=
a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67&quot;<br>+SRC_U=
RI[smawk-0.3.2.sha256sum] =3D &quot;b7c388c1b5e93756d0c740965c41e8822f86662=
1d41acbdf6336a6a168f8840c&quot;<br>+SRC_URI[socket2-0.5.7.sha256sum] =3D &q=
uot;ce305eb0b4296696835b71df73eb912e0f1ffd2556a501fcede6e0c50349191c&quot;<=
br>+SRC_URI[spin-0.9.8.sha256sum] =3D &quot;6980e8d7511241f8acf4aebddbb1ff9=
38df5eebe98691418c4468d0b72a96a67&quot;<br>+SRC_URI[strict-num-0.1.1.sha256=
sum] =3D &quot;6637bab7722d379c8b41ba849228d680cc12d0a45ba1fa2b48f2a30577a0=
6731&quot;<br>+SRC_URI[strsim-0.11.1.sha256sum] =3D &quot;7da8b5736845d9f2f=
cb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f&quot;<br>+SRC_URI[subtle-2.=
6.1.sha256sum] =3D &quot;13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d=
74c157bdea3292&quot;<br>+SRC_URI[supports-color-3.0.1.sha256sum] =3D &quot;=
8775305acf21c96926c900ad056abeef436701108518cf890020387236ac5a77&quot;<br>+=
SRC_URI[supports-hyperlinks-3.0.0.sha256sum] =3D &quot;2c0a1e5168041f5f3ff6=
8ff7d95dcb9c8749df29f6e7e89ada40dd4c9de404ee&quot;<br>+SRC_URI[supports-uni=
code-3.0.0.sha256sum] =3D &quot;b7401a30af6cb5818bb64852270bb722533397edcfc=
7344954a38f420819ece2&quot;<br>+SRC_URI[svg-0.17.0.sha256sum] =3D &quot;700=
efb40f3f559c23c18b446e8ed62b08b56b2bb3197b36d57e0470b4102779e&quot;<br>+SRC=
_URI[svgfilters-0.4.0.sha256sum] =3D &quot;639abcebc15fdc2df179f37d6f5463d6=
60c1c79cd552c12343a4600827a04bce&quot;<br>+SRC_URI[svgtypes-0.9.0.sha256sum=
] =3D &quot;c9ee29c1407a5b18ccfe5f6ac82ac11bab3b14407e09c209a6c1a32098b1973=
4&quot;<br>+SRC_URI[svgtypes-0.10.0.sha256sum] =3D &quot;98ffacedcdcf1da657=
9c907279b4f3c5492fbce99fbbf227f5ed270a589c2765&quot;<br>+SRC_URI[syn-2.0.79=
.sha256sum] =3D &quot;89132cd0bf050864e1d38dc3bbc07a0eb8e7530af26344d3d2bbb=
ef83499f590&quot;<br>+SRC_URI[sync_wrapper-1.0.1.sha256sum] =3D &quot;a7065=
abeca94b6a8a577f9bd45aa0867a2238b74e8eb67cf10d492bc39351394&quot;<br>+SRC_U=
RI[sys-info-0.9.1.sha256sum] =3D &quot;0b3a0d0aba8bf96a0e1ddfdc352fc53b3df7=
f39318c71854910c3c4b024ae52c&quot;<br>+SRC_URI[tagu-0.1.6.sha256sum] =3D &q=
uot;eddb6b06d20fba9ed21fca3d696ee1b6e870bca0bcf9fa2971f6ae2436de576a&quot;<=
br>+SRC_URI[target-lexicon-0.12.16.sha256sum] =3D &quot;61c41af27dd6d1e27b1=
b16b489db798443478cef1f06a660c96db617ba5de3b1&quot;<br>+SRC_URI[temp-env-0.=
3.6.sha256sum] =3D &quot;96374855068f47402c3121c6eed88d29cb1de8f3ab27090e27=
3e420bdabcf050&quot;<br>+SRC_URI[tempfile-3.13.0.sha256sum] =3D &quot;f0f2c=
9fc62d0beef6951ccffd757e241266a2c833136efbe35af6cd2567dca5b&quot;<br>+SRC_U=
RI[terminal_size-0.3.0.sha256sum] =3D &quot;21bebf2b7c9e0a515f6e0f8c51dc0f8=
e4696391e6f1ff30379559f8365fb0df7&quot;<br>+SRC_URI[termtree-0.4.1.sha256su=
m] =3D &quot;3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a=
76&quot;<br>+SRC_URI[test-case-3.3.1.sha256sum] =3D &quot;eb2550dd13afcd286=
853192af8601920d959b14c401fcece38071d53bf0768a8&quot;<br>+SRC_URI[test-case=
-core-3.3.1.sha256sum] =3D &quot;adcb7fd841cd518e279be3d5a3eb0636409487998a=
4aff22f3de87b81e88384f&quot;<br>+SRC_URI[test-case-macros-3.3.1.sha256sum] =
=3D &quot;5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb&=
quot;<br>+SRC_URI[test-log-0.2.16.sha256sum] =3D &quot;3dffced63c2b5c7be278=
154d76b479f9f9920ed34e7574201407f0b14e2bbb93&quot;<br>+SRC_URI[test-log-mac=
ros-0.2.16.sha256sum] =3D &quot;5999e24eaa32083191ba4e425deb75cdf25efefabe5=
aaccb7446dd0d4122a3f5&quot;<br>+SRC_URI[testing_logger-0.1.1.sha256sum] =3D=
 &quot;6d92b727cb45d33ae956f7f46b966b25f1bc712092aeef9dba5ac798fc89f720&quo=
t;<br>+SRC_URI[textwrap-0.16.1.sha256sum] =3D &quot;23d434d3f8967a09480fb04=
132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9&quot;<br>+SRC_URI[thiserror-1.0.6=
4.sha256sum] =3D &quot;d50af8abc119fb8bb6dbabcfa89656f46f84aa0ac76880886080=
76ad2b459a84&quot;<br>+SRC_URI[thiserror-impl-1.0.64.sha256sum] =3D &quot;0=
8904e7672f5eb876eaaf87e0ce17857500934f4981c4a0ab2b4aa98baac7fc3&quot;<br>+S=
RC_URI[thread_local-1.1.8.sha256sum] =3D &quot;8b9ef9bad013ada3808854ceac7b=
46812a6465ba368859a37e2100283d2d719c&quot;<br>+SRC_URI[tikv-jemalloc-sys-0.=
6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] =3D &quot;=
cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48ad05037a677e52e4e2d&quot;<br>+=
SRC_URI[tikv-jemallocator-0.6.0.sha256sum] =3D &quot;4cec5ff18518d81584f477=
e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865&quot;<br>+SRC_URI[tiny-skia-0.8.=
4.sha256sum] =3D &quot;df8493a203431061e901613751931f047d1971337153f96d0e5e=
363d6dbf6a67&quot;<br>+SRC_URI[tiny-skia-path-0.8.4.sha256sum] =3D &quot;ad=
bfb5d3f3dd57a0e11d12f4f13d4ebbbc1b5c15b7ab0a156d030b21da5f677c&quot;<br>+SR=
C_URI[tinytemplate-1.2.1.sha256sum] =3D &quot;be4d6b5f19ff7664e8c98d03e2139=
cb510db9b0a60b55f8e8709b689d939b6bc&quot;<br>+SRC_URI[tinyvec-1.8.0.sha256s=
um] =3D &quot;445e881f4f6d382d5f27c034e25eb92edd7c784ceab92a0937db7f2e9471b=
938&quot;<br>+SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D &quot;1f3ccbac311=
fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20&quot;<br>+SRC_URI[tok=
io-1.40.0.sha256sum] =3D &quot;e2b070231665d27ad9ec9b8df639893f46727666c676=
7db40317fbe920a5d998&quot;<br>+SRC_URI[tokio-macros-2.4.0.sha256sum] =3D &q=
uot;693d596312e88961bc67d7f1f97af8a70227d9f90c31bba5806eec004978d752&quot;<=
br>+SRC_URI[tokio-rustls-0.26.0.sha256sum] =3D &quot;0c7bc40d0e5a97695bb96e=
27995cd3a08538541b0a846f65bba7a359f36700d4&quot;<br>+SRC_URI[tokio-socks-0.=
5.2.sha256sum] =3D &quot;0d4770b8024672c1101b3f6733eab95b18007dbe0847a8afe3=
41fcf79e06043f&quot;<br>+SRC_URI[tokio-stream-0.1.16.sha256sum] =3D &quot;4=
f4e6ce100d0eb49a2734f8c0812bcd324cf357d21810932c5df6b96ef2b86f1&quot;<br>+S=
RC_URI[tokio-util-0.7.12.sha256sum] =3D &quot;61e7c3654c13bcd040d4a03abee2c=
75b1d14a37b423cf5a813ceae1cc903ec6a&quot;<br>+SRC_URI[toml-0.8.19.sha256sum=
] =3D &quot;a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24=
e&quot;<br>+SRC_URI[toml_datetime-0.6.8.sha256sum] =3D &quot;0dd7358ecb8fc2=
f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41&quot;<br>+SRC_URI[toml_e=
dit-0.22.22.sha256sum] =3D &quot;4ae48d6208a266e853d946088ed816055e556cc602=
8c5e8e2b84d9fa5dd7c7f5&quot;<br>+SRC_URI[tower-service-0.3.3.sha256sum] =3D=
 &quot;8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3&quo=
t;<br>+SRC_URI[tracing-0.1.40.sha256sum] =3D &quot;c3523ab5a71916ccf420eebd=
f5521fcef02141234bbc0b8a49f2fdc4544364ef&quot;<br>+SRC_URI[tracing-attribut=
es-0.1.27.sha256sum] =3D &quot;34704c8d6ebcbc939824180af020566b01a7c01f8064=
1264eba0999f6c2b6be7&quot;<br>+SRC_URI[tracing-core-0.1.32.sha256sum] =3D &=
quot;c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54&quot;=
<br>+SRC_URI[tracing-durations-export-0.3.0.sha256sum] =3D &quot;382e025ef8=
e0db646343dd2cf56af9d7fe6f5eabce5f388f8e5ec7234f555a0f&quot;<br>+SRC_URI[tr=
acing-log-0.2.0.sha256sum] =3D &quot;ee855f1f400bd0e5c02d150ae5de3840039a3f=
54b025156404e34c23c03f47c3&quot;<br>+SRC_URI[tracing-serde-0.1.3.sha256sum]=
 =3D &quot;bc6b213177105856957181934e4920de57730fc69bf42c37ee5bb664d406d9e1=
&quot;<br>+SRC_URI[tracing-subscriber-0.3.18.sha256sum] =3D &quot;ad0f048c9=
7dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b&quot;<br>+SRC_URI[t=
racing-tree-0.4.0.sha256sum] =3D &quot;f459ca79f1b0d5f71c54ddfde6debfc59c8b=
6eeb46808ae492077f739dc7b49c&quot;<br>+SRC_URI[try-lock-0.2.5.sha256sum] =
=3D &quot;e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b&=
quot;<br>+SRC_URI[ttf-parser-0.18.1.sha256sum] =3D &quot;0609f771ad9c615538=
4897e1df4d948e692667cc0588548b68eb44d052b27633&quot;<br>+SRC_URI[typeid-1.0=
.2.sha256sum] =3D &quot;0e13db2e0ccd5e14a544e8a246ba2312cd25223f616442d7f2c=
b0e3db614236e&quot;<br>+SRC_URI[typenum-1.17.0.sha256sum] =3D &quot;42ff0bf=
0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825&quot;<br>+SRC_URI=
[ucd-trie-0.1.6.sha256sum] =3D &quot;ed646292ffc8188ef8ea4d1e0e0150fb15a5c2=
e12ad9b8fc191ae7a8a7f3c4b9&quot;<br>+SRC_URI[unicase-2.7.0.sha256sum] =3D &=
quot;f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89&quot;=
<br>+SRC_URI[unicode-bidi-0.3.15.sha256sum] =3D &quot;08f95100a766bf4f8f28f=
90d77e0a5461bbdb219042e7679bebe79004fed8d75&quot;<br>+SRC_URI[unicode-bidi-=
mirroring-0.1.0.sha256sum] =3D &quot;56d12260fb92d52f9008be7e4bca09f584780e=
b2266dc8fecc6a192bec561694&quot;<br>+SRC_URI[unicode-ccc-0.1.2.sha256sum] =
=3D &quot;cc2520efa644f8268dce4dcd3050eaa7fc044fca03961e9998ac7e2e92b77cf1&=
quot;<br>+SRC_URI[unicode-general-category-0.6.0.sha256sum] =3D &quot;2281c=
8c1d221438e373249e065ca4989c4c36952c211ff21a0ee91c44a3869e7&quot;<br>+SRC_U=
RI[unicode-ident-1.0.13.sha256sum] =3D &quot;e91b56cd4cadaeb79bbf1a5645f6b4=
f8dc5bde8834ad5894a8db35fda9efa1fe&quot;<br>+SRC_URI[unicode-linebreak-0.1.=
5.sha256sum] =3D &quot;3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934a=
b501a190571f&quot;<br>+SRC_URI[unicode-normalization-0.1.23.sha256sum] =3D =
&quot;a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5&quot=
;<br>+SRC_URI[unicode-script-0.5.6.sha256sum] =3D &quot;ad8d71f5726e5f285a9=
35e9fe8edfd53f0491eb6e9a5774097fdabee7cd8c9cd&quot;<br>+SRC_URI[unicode-vo-=
0.1.0.sha256sum] =3D &quot;b1d386ff53b415b7fe27b50bb44679e2cc4660272694b7b6=
f3326d8480823a94&quot;<br>+SRC_URI[unicode-width-0.1.13.sha256sum] =3D &quo=
t;0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d&quot;<br=
>+SRC_URI[unscanny-0.1.0.sha256sum] =3D &quot;e9df2af067a7953e9c3831320f35c=
1cc0600c30d44d9f7a12b01db1cd88d6b47&quot;<br>+SRC_URI[untrusted-0.9.0.sha25=
6sum] =3D &quot;8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28=
a47c1&quot;<br>+SRC_URI[url-2.5.2.sha256sum] =3D &quot;22784dbdf76fdde8af1a=
eda5622b546b422b6fc585325248a2bf9f5e41e94d6c&quot;<br>+SRC_URI[urlencoding-=
2.1.3.sha256sum] =3D &quot;daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521=
b087cc33ae4c49da&quot;<br>+SRC_URI[usvg-0.29.0.sha256sum] =3D &quot;63b6bb4=
e62619d9f68aa2d8a823fea2bff302340a1f2d45c264d5b0be170832e&quot;<br>+SRC_URI=
[usvg-text-layout-0.29.0.sha256sum] =3D &quot;195386e01bc35f860db024de275a7=
6e7a31afdf975d18beb6d0e44764118b4db&quot;<br>+SRC_URI[utf8-width-0.1.7.sha2=
56sum] =3D &quot;86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e700=
4392e3&quot;<br>+SRC_URI[utf8parse-0.2.2.sha256sum] =3D &quot;06abde3611657=
adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821&quot;<br>+SRC_URI[uuid-=
1.10.0.sha256sum] =3D &quot;81dfa00651efa65069b0b6b651f4aaa31ba9e3c3ce0137a=
aad053604ee7e0314&quot;<br>+SRC_URI[valuable-0.1.0.sha256sum] =3D &quot;830=
b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d&quot;<br>+SRC=
_URI[version_check-0.9.5.sha256sum] =3D &quot;0b928f33d975fc6ad9f86c8f28385=
3ad26bdd5b10b7f1542aa2fa15e2289105a&quot;<br>+SRC_URI[wait-timeout-0.2.0.sh=
a256sum] =3D &quot;9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a=
2498f3f6&quot;<br>+SRC_URI[walkdir-2.5.0.sha256sum] =3D &quot;29790946404f9=
1d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b&quot;<br>+SRC_URI[want-=
0.3.1.sha256sum] =3D &quot;bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb=
82ac61bc6d760b0e&quot;<br>+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha25=
6sum] =3D &quot;9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b798=
7e423&quot;<br>+SRC_URI[wasm-bindgen-0.2.93.sha256sum] =3D &quot;a82edfc16a=
6c469f5f44dc7b571814045d60404b55a0ee849f9bcfa2e63dd9b5&quot;<br>+SRC_URI[wa=
sm-bindgen-backend-0.2.93.sha256sum] =3D &quot;9de396da306523044d3302746f12=
08fa71d7532227f15e347e2d93e4145dd77b&quot;<br>+SRC_URI[wasm-bindgen-futures=
-0.4.43.sha256sum] =3D &quot;61e9300f63a621e96ed275155c108eb6f843b6a26d053f=
122ab69724559dc8ed&quot;<br>+SRC_URI[wasm-bindgen-macro-0.2.93.sha256sum] =
=3D &quot;585c4c91a46b072c92e908d99cb1dcdf95c5218eeb6f3bf1efa991ee7a68cccf&=
quot;<br>+SRC_URI[wasm-bindgen-macro-support-0.2.93.sha256sum] =3D &quot;af=
c340c74d9005395cf9dd098506f7f44e38f2b4a21c6aaacf9a105ea5e1e836&quot;<br>+SR=
C_URI[wasm-bindgen-shared-0.2.93.sha256sum] =3D &quot;c62a0a307cb4a311d3a07=
867860911ca130c3494e8c2719593806c08bc5d0484&quot;<br>+SRC_URI[wasm-streams-=
0.4.0.sha256sum] =3D &quot;b65dc4c90b63b118468cf747d8bf3566c1913ef60be765b5=
730ead9e0a3ba129&quot;<br>+SRC_URI[wasm-timer-0.2.5.sha256sum] =3D &quot;be=
0ecb0db480561e9a7642b5d3e4187c128914e58aa84330b9493e3eb68c5e7f&quot;<br>+SR=
C_URI[web-sys-0.3.70.sha256sum] =3D &quot;26fdeaafd9bd129f65e7c031593c24d62=
186301e0c72c8978fa1678be7d532c0&quot;<br>+SRC_URI[webpki-roots-0.26.5.sha25=
6sum] =3D &quot;0bd24728e5af82c6c4ec1b66ac4844bdf8156257fccda846ec58b42cd0c=
dbe6a&quot;<br>+SRC_URI[weezl-0.1.8.sha256sum] =3D &quot;53a85b86a771b1c870=
58196170769dd264f66c0782acf1ae6cc51bfd64b39082&quot;<br>+SRC_URI[which-6.0.=
3.sha256sum] =3D &quot;b4ee928febd44d98f2f459a4a79bd4d928591333a494a10a8684=
18ac1b39cf1f&quot;<br>+SRC_URI[widestring-1.1.0.sha256sum] =3D &quot;7219d3=
6b6eac893fa81e84ebe06485e7dcbb616177469b142df14f1f4deb1311&quot;<br>+SRC_UR=
I[winapi-0.3.9.sha256sum] =3D &quot;5c839a674fcd7a98952e593242ea400abe93992=
746761e38641405d28b00f419&quot;<br>+SRC_URI[winapi-i686-pc-windows-gnu-0.4.=
0.sha256sum] =3D &quot;ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff=
6fb6ab51b7b6&quot;<br>+SRC_URI[winapi-util-0.1.9.sha256sum] =3D &quot;cf221=
c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb&quot;<br>+SRC_U=
RI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;712e227841d057c1=
ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f&quot;<br>+SRC_URI[windows-=
0.57.0.sha256sum] =3D &quot;12342cb4d8e3b046f3d80effd474a7a02447231330ef77d=
71daa6fbc40681143&quot;<br>+SRC_URI[windows-0.58.0.sha256sum] =3D &quot;dd0=
4d41d93c4992d421894c18c8b43496aa748dd4c081bac0dc93eb0489272b6&quot;<br>+SRC=
_URI[windows-core-0.57.0.sha256sum] =3D &quot;d2ed2439a290666cd67ecce2b0ffa=
ad89c2a56b976b736e6ece670297897832d&quot;<br>+SRC_URI[windows-core-0.58.0.s=
ha256sum] =3D &quot;6ba6d44ec8c2591c134257ce647b7ea6b20335bf6379a27dac5f164=
1fcf59f99&quot;<br>+SRC_URI[windows-implement-0.57.0.sha256sum] =3D &quot;9=
107ddc059d5b6fbfbffdfa7a7fe3e22a226def0b2608f72e9d552763d3e1ad7&quot;<br>+S=
RC_URI[windows-implement-0.58.0.sha256sum] =3D &quot;2bbd5b46c938e506ecbce2=
86b6628a02171d56153ba733b6c741fc627ec9579b&quot;<br>+SRC_URI[windows-interf=
ace-0.57.0.sha256sum] =3D &quot;29bee4b38ea3cde66011baa44dba677c432a78593e2=
02392d1e9070cf2a7fca7&quot;<br>+SRC_URI[windows-interface-0.58.0.sha256sum]=
 =3D &quot;053c4c462dc91d3b1504c6fe5a726dd15e216ba718e84a0e46a88fbe5ded3515=
&quot;<br>+SRC_URI[windows-registry-0.2.0.sha256sum] =3D &quot;e400001bb720=
a623c1c69032f8e3e4cf09984deec740f007dd2b03ec864804b0&quot;<br>+SRC_URI[wind=
ows-result-0.1.2.sha256sum] =3D &quot;5e383302e8ec8515204254685643de10811af=
0ed97ea37210dc26fb0032647f8&quot;<br>+SRC_URI[windows-result-0.2.0.sha256su=
m] =3D &quot;1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae=
0e&quot;<br>+SRC_URI[windows-strings-0.1.0.sha256sum] =3D &quot;4cd9b125c48=
6025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10&quot;<br>+SRC_URI[win=
dows-sys-0.48.0.sha256sum] =3D &quot;677d2418bec65e3338edb076e806bc1ec15693=
c5d0104683f2efe857f61056a9&quot;<br>+SRC_URI[windows-sys-0.52.0.sha256sum] =
=3D &quot;282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d&=
quot;<br>+SRC_URI[windows-sys-0.59.0.sha256sum] =3D &quot;1e38bc4d79ed67fd0=
75bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b&quot;<br>+SRC_URI[windows-t=
argets-0.48.5.sha256sum] =3D &quot;9a2fa6e2155d7247be68c096456083145c183cbb=
bc2764150dda45a87197940c&quot;<br>+SRC_URI[windows-targets-0.52.6.sha256sum=
] =3D &quot;9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e9997=
3&quot;<br>+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D &quot;2b3=
8e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8&quot;<br>+SRC=
_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D &quot;32a4622180e7a0ec04=
4bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3&quot;<br>+SRC_URI[windows_aa=
rch64_msvc-0.48.5.sha256sum] =3D &quot;dc35310971f3b2dbbf3f0690a219f40e2d9a=
fcf64f9ab7cc1be722937c26b4bc&quot;<br>+SRC_URI[windows_aarch64_msvc-0.52.6.=
sha256sum] =3D &quot;09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627c=
abbd05d469&quot;<br>+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D &quot;a=
75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e&quot;<br>+S=
RC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D &quot;8e9b5ad5ab802e97eb8e295=
ac6720e509ee4c243f69d781394014ebfe8bbfa0b&quot;<br>+SRC_URI[windows_i686_gn=
ullvm-0.52.6.sha256sum] =3D &quot;0eee52d38c090b3caa76c563b86c3a4bd71ef1a81=
9287c19d586d7334ae8ed66&quot;<br>+SRC_URI[windows_i686_msvc-0.48.5.sha256su=
m] =3D &quot;8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca4=
06&quot;<br>+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D &quot;240948bc=
05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66&quot;<br>+SRC_URI[=
windows_x86_64_gnu-0.48.5.sha256sum] =3D &quot;53d40abd2583d23e4718fddf1ebe=
c84dbff8381c07cae67ff7768bbf19c6718e&quot;<br>+SRC_URI[windows_x86_64_gnu-0=
.52.6.sha256sum] =3D &quot;147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab=
29ca94c5b08b1a78&quot;<br>+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum]=
 =3D &quot;0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc=
&quot;<br>+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D &quot;24d5b=
23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d&quot;<br>+SRC_U=
RI[windows_x86_64_msvc-0.48.5.sha256sum] =3D &quot;ed94fce61571a4006852b738=
9a063ab983c02eb1bb37b47f8272ce92d06d9538&quot;<br>+SRC_URI[windows_x86_64_m=
svc-0.52.6.sha256sum] =3D &quot;589f6da84c646204747d1270a2a5661ea66ed1cced2=
631d546fdfb155959f9ec&quot;<br>+SRC_URI[winnow-0.6.18.sha256sum] =3D &quot;=
68a9bda4691f099d435ad181000724da8e5899daa10713c2d432552b9ccd3a6f&quot;<br>+=
SRC_URI[winreg-0.52.0.sha256sum] =3D &quot;a277a57398d4bfa075df44f501a17cfd=
f8542d224f0d36095a2adc7aee4ef0a5&quot;<br>+SRC_URI[winsafe-0.0.19.sha256sum=
] =3D &quot;d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc90=
4&quot;<br>+SRC_URI[winsafe-0.0.22.sha256sum] =3D &quot;7d6ad6cbd9c6e514497=
1e326303f0e453b61d82e4f72067fccf23106bccd8437&quot;<br>+SRC_URI[wiremock-0.=
6.2.sha256sum] =3D &quot;7fff469918e7ca034884c7fd8f93fe27bacb7fcb599fd879df=
6c7b429a29b646&quot;<br>+SRC_URI[xattr-1.3.1.sha256sum] =3D &quot;8da84f1a2=
5939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f&quot;<br>+SRC_URI[x=
mlparser-0.13.6.sha256sum] =3D &quot;66fee0b777b0f5ac1c69bb06d361268faafa61=
cd4682ae064a171c16c433e9e4&quot;<br>+SRC_URI[xz2-0.1.7.sha256sum] =3D &quot=
;388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2&quot;<br>=
+SRC_URI[yansi-1.0.1.sha256sum] =3D &quot;cfe53a6657fd280eaa890a3bc59152892=
ffa3e30101319d168b781ed6529b049&quot;<br>+SRC_URI[zerocopy-0.7.35.sha256sum=
] =3D &quot;1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f=
0&quot;<br>+SRC_URI[zerocopy-derive-0.7.35.sha256sum] =3D &quot;fa4f8080344=
d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e&quot;<br>+SRC_URI[zer=
oize-1.8.1.sha256sum] =3D &quot;ced3678a2879b30306d323f4542626697a464a97c0a=
07c9aebf7ebca65cd4dde&quot;<br>+SRC_URI[zip-0.6.6.sha256sum] =3D &quot;7603=
94e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261&quot;<br>+SRC_=
URI[zstd-0.13.2.sha256sum] =3D &quot;fcf2b778a664581e31e389454a7072dab16476=
06d44f7feea22cd5abb9c9f3f9&quot;<br>+SRC_URI[zstd-safe-7.2.1.sha256sum] =3D=
 &quot;54a3ab4db68cea366acc5c897c7b4d4d1b8994a9cd6e6f841f8964566a419059&quo=
t;<br>+SRC_URI[zstd-sys-2.0.13+zstd.1.5.6.sha256sum] =3D &quot;38ff0f21cfee=
8f97d94cef41359e0c89aa6113028ab0291aa8ca0038995a95aa&quot;<br>+# from crate=
s/uv-performance-memory-allocator/Cargo.lock<br>+SRC_URI +=3D &quot; \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cc/1.1.21" target=3D"_bla=
nk">crates.io/cc/1.1.21</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/libc/0.2.158" target=3D"_blank">crates.io/libc/0.2.158</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/libmimalloc-sys/0.1.39" ta=
rget=3D"_blank">crates.io/libmimalloc-sys/0.1.39</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/mimalloc/0.1.43" target=3D"_blank">crates=
.io/mimalloc/0.1.43</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/shlex/1.3.0" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-=
ge13ca993e8ccb9ba9847cc330696e02839f328f7" target=3D"_blank">crates.io/tikv=
-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/tikv-jemallocator/0.=
6.0" target=3D"_blank">crates.io/tikv-jemallocator/0.6.0</a> \<br>+&quot;<b=
r>+<br>+SRC_URI[cc-1.1.21.sha256sum] =3D &quot;07b1695e2c7e8fc85310cde85aea=
ab7e3097f593c91d209d3f9df76c928100f0&quot;<br>+SRC_URI[libc-0.2.158.sha256s=
um] =3D &quot;d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56=
439&quot;<br>+SRC_URI[libmimalloc-sys-0.1.39.sha256sum] =3D &quot;23aa6811d=
3bd4deb8a84dde645f943476d13b248d818edcf8ce0b2f37f036b44&quot;<br>+SRC_URI[m=
imalloc-0.1.43.sha256sum] =3D &quot;68914350ae34959d83f732418d51e2427a79405=
5d0b9529f48259ac07af65633&quot;<br>+SRC_URI[shlex-1.3.0.sha256sum] =3D &quo=
t;0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64&quot;<br=
>+SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e028=
39f328f7.sha256sum] =3D &quot;cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48=
ad05037a677e52e4e2d&quot;<br>+SRC_URI[tikv-jemallocator-0.6.0.sha256sum] =
=3D &quot;4cec5ff18518d81584f477e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865&=
quot;<br>+# from crates/uv-performance-flate2-backend/Cargo.lock<br>+SRC_UR=
I +=3D &quot; \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/adler=
2/2.0.0" target=3D"_blank">crates.io/adler2/2.0.0</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/cc/1.1.22" target=3D"_blank">crates.io/c=
c/1.1.22</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cfg-if=
/1.0.0" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/cmake/0.1.51" target=3D"_blank">crates.io=
/cmake/0.1.51</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/c=
rc32fast/1.4.2" target=3D"_blank">crates.io/crc32fast/1.4.2</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/flate2/1.0.34" target=3D"_bla=
nk">crates.io/flate2/1.0.34</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/libc/0.2.159" target=3D"_blank">crates.io/libc/0.2.159</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/libz-ng-sys/1.1.16" ta=
rget=3D"_blank">crates.io/libz-ng-sys/1.1.16</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/miniz_oxide/0.8.0" target=3D"_blank">crates.i=
o/miniz_oxide/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/shlex/1.3.0" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>+&quot;<=
br>+<br>+SRC_URI[adler2-2.0.0.sha256sum] =3D &quot;512761e0bb2578dd7380c6ba=
aa0f4ce03e84f95e960231d1dec8bf4d7d6e2627&quot;<br>+SRC_URI[cc-1.1.22.sha256=
sum] =3D &quot;9540e661f81799159abee814118cc139a2004b3a3aa3ea37724a1b66530b=
90e0&quot;<br>+SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc=
0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>+SRC_URI[cmake-0.1.=
51.sha256sum] =3D &quot;fb1e43aa7fd152b1f968787f7dbcdeb306d1867ff373c699552=
11876c053f91a&quot;<br>+SRC_URI[crc32fast-1.4.2.sha256sum] =3D &quot;a97769=
d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3&quot;<br>+SRC_UR=
I[flate2-1.0.34.sha256sum] =3D &quot;a1b589b4dc103969ad3cf85c950899926ec643=
00a1a46d76c03a6072957036f0&quot;<br>+SRC_URI[libc-0.2.159.sha256sum] =3D &q=
uot;561d97a539a36e26a9a5fad1ea11a3039a67714694aaa379433e580854bc3dc5&quot;<=
br>+SRC_URI[libz-ng-sys-1.1.16.sha256sum] =3D &quot;4436751a01da56f1277f323=
c80d584ffad94a3d14aecd959dd0dff75aa73a438&quot;<br>+SRC_URI[miniz_oxide-0.8=
.0.sha256sum] =3D &quot;e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e=
41b65deec4df1&quot;<br>+SRC_URI[shlex-1.3.0.sha256sum] =3D &quot;0fda2ff0d0=
84019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64&quot;<br>diff --git =
a/meta-python/recipes-devtools/python/python3-uv-gitcrates.inc b/meta-pytho=
n/recipes-devtools/python/python3-uv-gitcrates.inc<br>new file mode 100644<=
br>index 000000000..b0df28030<br>--- /dev/null<br>+++ b/meta-python/recipes=
-devtools/python/python3-uv-gitcrates.inc<br>@@ -0,0 +1,18 @@<br>+# Manuall=
y compiled list of crates which are not being vendored by <a href=3D"http:/=
/crates.io" target=3D"_blank">crates.io</a><br>+<br>+SRC_URI:append =3D &qu=
ot; \<br>+ =C2=A0 =C2=A0git://<a href=3D"http://github.com/astral-sh/pubgru=
b;protocol=3Dhttps;nobranch=3D1;name=3Dpubgrub" target=3D"_blank">github.co=
m/astral-sh/pubgrub;protocol=3Dhttps;nobranch=3D1;name=3Dpubgrub</a> \<br>+=
 =C2=A0 =C2=A0git://<a href=3D"http://github.com/astral-sh/reqwest-middlewa=
re;protocol=3Dhttps;nobranch=3D1;name=3Dreqwest-middleware;destsuffix=3Dcar=
go_home/git/db/reqwest-middleware-013793d24a0516f2" target=3D"_blank">githu=
b.com/astral-sh/reqwest-middleware;protocol=3Dhttps;nobranch=3D1;name=3Dreq=
west-middleware;destsuffix=3Dcargo_home/git/db/reqwest-middleware-013793d24=
a0516f2</a> \<br>+&quot;<br>+<br>+SRCREV_FORMAT .=3D &quot;\<br>+ =C2=A0 =
=C2=A0_pubgrub \<br>+ =C2=A0 =C2=A0_reqwest-middleware \<br>+&quot;<br>+<br=
>+EXTRA_OECARGO_PATHS +=3D &quot;\<br>+ =C2=A0 =C2=A0${UNPACKDIR}/cargo_hom=
e/git/db/reqwest-middleware-013793d24a0516f2 \<br>+&quot;<br>+<br>+SRCREV_p=
ubgrub =3D &quot;388685a8711092971930986644cfed152d1a1f6c&quot;<br>+SRCREV_=
reqwest-middleware =3D &quot;5e3eaf254b5bd481c75d2710eed055f95b756913&quot;=
<br>diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-uv_0.4.18.bb" target=3D"_blank">python3-uv_0.4.18.bb</a> b/meta-python/=
recipes-devtools/python/<a href=3D"http://python3-uv_0.4.18.bb" target=3D"_=
blank">python3-uv_0.4.18.bb</a><br>new file mode 100644<br>index 000000000.=
.e9d070abc<br>--- /dev/null<br>+++ b/meta-python/recipes-devtools/python/<a=
 href=3D"http://python3-uv_0.4.18.bb" target=3D"_blank">python3-uv_0.4.18.b=
b</a><br>@@ -0,0 +1,18 @@<br>+SUMMARY =3D &quot;An extremely fast Python pa=
ckage and project manager, written in Rust.&quot;<br>+HOMEPAGE =3D &quot;<a=
 href=3D"https://github.com/astral-sh/uv" target=3D"_blank">https://github.=
com/astral-sh/uv</a>&quot;<br>+LICENSE =3D &quot;Apache-2.0 &amp; MIT&quot;=
<br>+LIC_FILES_CHKSUM =3D &quot;\<br>+ =C2=A0 =C2=A0file://LICENSE-APACHE;m=
d5=3D2b42edef8fa55315f34f2370b4715ca9 \<br>+ =C2=A0 =C2=A0file://LICENSE-MI=
T;md5=3Dff9fe97bf0d7fa879a706f86817e1b76 \<br>+&quot;<br>+<br>+require ${BP=
N}-crates.inc<br>+# Several crates are not being vendored by <a href=3D"htt=
p://crates.io" target=3D"_blank">crates.io</a> and this is not notices by u=
pdate_crates at the moment<br>+# The crates in question have been placed in=
 a separate inc file in order to still use update_crates for the majority<b=
r>+require ${BPN}-gitcrates.inc<br>+<br>+SRC_URI[sha256sum] =3D &quot;95496=
4eff8c7e2bc63dd4beeb8d45bcaddb5149a7ef29a36abd77ec76c8b837e&quot;<br>+<br>+=
inherit pypi cargo cargo-update-recipe-crates python_maturin<br>+<br>+PYPI_=
PACKAGE =3D &quot;uv&quot;</blockquote>
<div>=C2=A0</div>
<div>Thanks for any help.</div>
<div>=C2=A0</div>
<div>Tom Geelen</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112688): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112688" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112688</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108855956/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/108855956/924729</a><br>
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

--000000000000bac6350623dac296--

