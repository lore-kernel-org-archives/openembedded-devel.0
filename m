Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D4BCEE35D
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 22:20:04 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.30136.1728512402686715098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 15:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfJ6+jHD;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so280268a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728512402; x=1729117202; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TByZaLeQvWajKM+L72V44FxGtMIqBxSqRz8PIWDHO+M=;
        b=CfJ6+jHD42LXKiOgd4mm3Jmt2c1zlqVkYkG2VDhq2g8igZ4UkxszqVdV5xLc0gSHID
         Xp9EOMn2IlIu/sbvnu9pQkRbgzjGTcMNeOUiFtUJ29t8rWBzKcT4yzwHKv5Mg8CElQTA
         KpEsNBOn1gJtd3ahksrqdw2xZrhGY7sFiw9shEUybNu0Hw8CE5TslOYKS3m5MWj6i5Nh
         Z+lPX23p3MvN0AFScHKFzsj7RHUpSsufU0sG+FSEGJhD6LCcieUFoQ8QqIRx2X6xWZY1
         8p9V7PxvUZ+PYO8OiZofZAYgFmlaJUKx80Bb8yZyRnEFRjWrxAQIu3vyBfqSTVOGW10N
         l90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728512402; x=1729117202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TByZaLeQvWajKM+L72V44FxGtMIqBxSqRz8PIWDHO+M=;
        b=S3btmJcFyA9zaRLdfV3TIjoUljYWPlrcy2k/8SlsUs53qrq2jbr+nzbDaheV/d2m2X
         UvrlUVtmy/P/NxFTc00Sc3x6O3Wa5pf8Shd5xX3EDu2Ft0D9On2kFsdrYJEwpw9N85aK
         PZfLFx1lL3myf9ouJqe9riMdUZA6M9NeOkB7CU0D387Ing2HI/qrXt8Lfb1VcfYnzxxp
         wOpm/rPXx2dXh+I4daw2vI6FKR2ujkEZrPSq3xe1DzrisQGq6pBUq05vlQ4497ly/3Dg
         2z0aIzXQql2buyX6E6iIhi4cf8R2LBlJxaSrzbZw6/svSSMJRAX+RimMSOucj4HyJgxC
         BQ9w==
X-Gm-Message-State: AOJu0YyzD2Fveq9pKe2pMQ7tLFelWh3TNsdDXqyMUOk0BDC8wemdYnxm
	8i90jurZI145MRaHPhZT6drFBAN7rkcWdS1/dVyDDH0g3RqmdsxIQbc1ZVFmuqTzazaE5SZvsWW
	8W1I7PG0Ms5PooMSxQd3nGYoTOac=
X-Google-Smtp-Source: AGHT+IGs7WGUpk5QbQPF62BlDw+/6wY6IS/AyAJpPOM+/L1vGI/weack+ecfE97EGMYBjRXa0m6Qma64+bQOR5/rcew=
X-Received: by 2002:a17:90a:be0f:b0:2d1:bf48:e767 with SMTP id
 98e67ed59e1d1-2e2c63aa926mr1641414a91.29.1728512401765; Wed, 09 Oct 2024
 15:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <NerH.1728244868207142777.kUNX@lists.openembedded.org> <CANx9H-CcbOtuSTpWjpjYyUf1eLgia=-fU52DVVkkJG2gVRqRwA@mail.gmail.com>
In-Reply-To: <CANx9H-CcbOtuSTpWjpjYyUf1eLgia=-fU52DVVkkJG2gVRqRwA@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Thu, 10 Oct 2024 00:19:52 +0200
Message-ID: <CAJo0Az47JZhcewM=ATtJ9CG2F+47xjXmeitS_RB-zVODozd-tw@mail.gmail.com>
Subject: Re: [oe] [master][meta-python] Need some help with non crates.io
 vendored crates.
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b27e89062412a758"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 22:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112747

--000000000000b27e89062412a758
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the tip. I'll try and see if I can spot the difference, no luck
so far.

Regards

Tom

On Mon, Oct 7, 2024, 5:38=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Sun, Oct 6, 2024 at 1:01=E2=80=AFPM Tom Geelen via lists.openembedded.=
org
> <t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Hi all,
>>
>> I could use some support. Currently I am trying to insert support for a
>> new Python package manager which is now a requirement for a Python packa=
ge
>> I'm trying to maintain (link: UV <https://pypi.org/project/uv/>). A Rust
>> based package manager.
>>
>> My problem is when I am creating the recipe not all crates are on
>> crates.io. Several are only on github. Now is it possible to have both
>> the normal crates.io as well as another provider side by side?
>> I have tried checking the Yocto manual and found the class cargo
>> <https://docs.yoctoproject.org/ref-manual/classes.html#cargo> which
>> references an example which does not exist anymore: zvariant_3.12.0.bb
>> <https://git.openembedded.org/openembedded-core/tree/meta-selftest/recip=
es-extended/zvariant/zvariant_3.12.0.bb>
>> .
>>
>>
> you can see what the zvariant recipe was:
>
> https://git.openembedded.org/openembedded-core/commit/meta-selftest/recip=
es-extended?id=3D8a286e686e5764f4def0644586dd19e2197ef6c2
>
> I am trying to patch the necessary information together but I am falling
>> short as I cannot seem to get it to work. I will never configure the
>> sources correctly.
>>
>> My recipe so far:
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-uv-crates.inc
>> b/meta-python/recipes-devtools/python/python3-uv-crates.inc
>> new file mode 100644
>> index 000000000..e2dde977e
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-uv-crates.inc
>> @@ -0,0 +1,1038 @@
>> +# Autogenerated with 'bitbake -c update_crates python3-uv'
>> +
>> +# from Cargo.lock
>> +SRC_URI +=3D " \
>> +    crate://crates.io/addr2line/0.24.1 \
>> +    crate://crates.io/adler/1.0.2 \
>> +    crate://crates.io/adler2/2.0.0 \
>> +    crate://crates.io/aho-corasick/1.1.3 \
>> +    crate://crates.io/anes/0.1.6 \
>> +    crate://crates.io/anstream/0.6.15 \
>> +    crate://crates.io/anstyle/1.0.8 \
>> +    crate://crates.io/anstyle-parse/0.2.5 \
>> +    crate://crates.io/anstyle-query/1.1.1 \
>> +    crate://crates.io/anstyle-wincon/3.0.4 \
>> +    crate://crates.io/anyhow/1.0.89 \
>> +    crate://crates.io/arrayref/0.3.9 \
>> +    crate://crates.io/arrayvec/0.7.6 \
>> +    crate://crates.io/assert-json-diff/2.0.2 \
>> +    crate://crates.io/assert_cmd/2.0.16 \
>> +    crate://crates.io/assert_fs/1.1.2 \
>> +    crate://crates.io/async-channel/2.3.1 \
>> +    crate://crates.io/async-compression/0.4.12 \
>> +    crate://crates.io/async-trait/0.1.83 \
>> +    crate://crates.io/async_http_range_reader/0.8.0 \
>> +    crate://crates.io/atomic-waker/1.1.2 \
>> +    crate://crates.io/autocfg/1.3.0 \
>> +    crate://crates.io/axoasset/1.0.0 \
>> +    crate://crates.io/axoprocess/0.2.0 \
>> +    crate://crates.io/axotag/0.2.0 \
>> +    crate://crates.io/axoupdater/0.7.2 \
>> +    crate://crates.io/backoff/0.4.0 \
>> +    crate://crates.io/backtrace/0.3.74 \
>> +    crate://crates.io/base64/0.21.7 \
>> +    crate://crates.io/base64/0.22.1 \
>> +    crate://crates.io/bisection/0.1.0 \
>> +    crate://crates.io/bitflags/1.3.2 \
>> +    crate://crates.io/bitflags/2.6.0 \
>> +    crate://crates.io/block-buffer/0.10.4 \
>> +    crate://crates.io/boxcar/0.2.5 \
>> +    crate://crates.io/bstr/1.10.0 \
>> +    crate://crates.io/bumpalo/3.16.0 \
>> +    crate://crates.io/bytecheck/0.8.0 \
>> +    crate://crates.io/bytecheck_derive/0.8.0 \
>> +    crate://crates.io/bytemuck/1.18.0 \
>> +    crate://crates.io/byteorder/1.5.0 \
>> +    crate://crates.io/byteorder-lite/0.1.0 \
>> +    crate://crates.io/bytes/1.7.1 \
>> +    crate://crates.io/bzip2/0.4.4 \
>> +    crate://crates.io/bzip2-sys/0.1.11+1.0.8 \
>> +    crate://crates.io/cachedir/0.3.1 \
>> +    crate://crates.io/camino/1.1.9 \
>> +    crate://crates.io/cargo-util/0.2.14 \
>> +    crate://crates.io/cast/0.3.0 \
>> +    crate://crates.io/cc/1.1.19 \
>> +    crate://crates.io/cfg-if/1.0.0 \
>> +    crate://crates.io/cfg_aliases/0.2.1 \
>> +    crate://crates.io/charset/0.1.5 \
>> +    crate://crates.io/ciborium/0.2.2 \
>> +    crate://crates.io/ciborium-io/0.2.2 \
>> +    crate://crates.io/ciborium-ll/0.2.2 \
>> +    crate://crates.io/clap/4.5.18 \
>> +    crate://crates.io/clap_builder/4.5.18 \
>> +    crate://crates.io/clap_complete/4.5.26 \
>> +    crate://crates.io/clap_complete_command/0.6.1 \
>> +    crate://crates.io/clap_complete_nushell/4.5.3 \
>> +    crate://crates.io/clap_derive/4.5.18 \
>> +    crate://crates.io/clap_lex/0.7.2 \
>> +    crate://crates.io/cmake/0.1.51 \
>> +    crate://crates.io/codspeed/2.7.2 \
>> +    crate://crates.io/codspeed-criterion-compat/2.7.2 \
>> +    crate://crates.io/color_quant/1.1.0 \
>> +    crate://crates.io/colorchoice/1.0.2 \
>> +    crate://crates.io/colored/2.1.0 \
>> +    crate://crates.io/concurrent-queue/2.5.0 \
>> +    crate://crates.io/configparser/3.1.0 \
>> +    crate://crates.io/console/0.15.8 \
>> +    crate://crates.io/core-foundation/0.9.4 \
>> +    crate://crates.io/core-foundation-sys/0.8.7 \
>> +    crate://crates.io/cpufeatures/0.2.14 \
>> +    crate://crates.io/crc32fast/1.4.2 \
>> +    crate://crates.io/criterion/0.5.1 \
>> +    crate://crates.io/criterion-plot/0.5.0 \
>> +    crate://crates.io/crossbeam-deque/0.8.5 \
>> +    crate://crates.io/crossbeam-epoch/0.9.18 \
>> +    crate://crates.io/crossbeam-utils/0.8.20 \
>> +    crate://crates.io/crunchy/0.2.2 \
>> +    crate://crates.io/crypto-common/0.1.6 \
>> +    crate://crates.io/csv/1.3.0 \
>> +    crate://crates.io/csv-core/0.1.11 \
>> +    crate://crates.io/ctrlc/3.4.5 \
>> +    crate://crates.io/dashmap/6.1.0 \
>> +    crate://crates.io/data-encoding/2.6.0 \
>> +    crate://crates.io/data-url/0.2.0 \
>> +    crate://crates.io/deadpool/0.10.0 \
>> +    crate://crates.io/deadpool-runtime/0.1.4 \
>> +    crate://crates.io/diff/0.1.13 \
>> +    crate://crates.io/difflib/0.4.0 \
>> +    crate://crates.io/digest/0.10.7 \
>> +    crate://crates.io/directories/5.0.1 \
>> +    crate://crates.io/dirs-sys/0.4.1 \
>> +    crate://crates.io/doc-comment/0.3.3 \
>> +    crate://crates.io/dunce/1.0.5 \
>> +    crate://crates.io/dyn-clone/1.0.17 \
>> +    crate://crates.io/either/1.13.0 \
>> +    crate://crates.io/encode_unicode/0.3.6 \
>> +    crate://crates.io/encoding_rs/0.8.34 \
>> +    crate://crates.io/encoding_rs_io/0.1.7 \
>> +    crate://crates.io/equivalent/1.0.1 \
>> +    crate://crates.io/erased-serde/0.4.5 \
>> +    crate://crates.io/errno/0.3.9 \
>> +    crate://crates.io/etcetera/0.8.0 \
>> +    crate://crates.io/event-listener/5.3.1 \
>> +    crate://crates.io/event-listener-strategy/0.5.2 \
>> +    crate://crates.io/fastrand/2.1.1 \
>> +    crate://crates.io/fdeflate/0.3.4 \
>> +    crate://crates.io/filetime/0.2.25 \
>> +    crate://crates.io/fixedbitset/0.4.2 \
>> +    crate://crates.io/flate2/1.0.34 \
>> +    crate://crates.io/float-cmp/0.9.0 \
>> +    crate://crates.io/fnv/1.0.7 \
>> +    crate://crates.io/fontconfig-parser/0.5.7 \
>> +    crate://crates.io/fontdb/0.12.0 \
>> +    crate://crates.io/form_urlencoded/1.2.1 \
>> +    crate://crates.io/fs-err/2.11.0 \
>> +    crate://crates.io/fs2/0.4.3 \
>> +    crate://crates.io/futures/0.3.30 \
>> +    crate://crates.io/futures-channel/0.3.30 \
>> +    crate://crates.io/futures-core/0.3.30 \
>> +    crate://crates.io/futures-executor/0.3.30 \
>> +    crate://crates.io/futures-io/0.3.30 \
>> +    crate://crates.io/futures-lite/2.3.0 \
>> +    crate://crates.io/futures-macro/0.3.30 \
>> +    crate://crates.io/futures-sink/0.3.30 \
>> +    crate://crates.io/futures-task/0.3.30 \
>> +    crate://crates.io/futures-util/0.3.30 \
>> +    crate://crates.io/generic-array/0.14.7 \
>> +    crate://crates.io/getrandom/0.2.15 \
>> +    crate://crates.io/gif/0.12.0 \
>> +    crate://crates.io/gimli/0.31.0 \
>> +    crate://crates.io/glob/0.3.1 \
>> +    crate://crates.io/globset/0.4.15 \
>> +    crate://crates.io/globwalk/0.9.1 \
>> +    crate://crates.io/goblin/0.8.2 \
>> +    crate://crates.io/h2/0.4.6 \
>> +    crate://crates.io/half/2.4.1 \
>> +    crate://crates.io/hashbrown/0.14.5 \
>> +    crate://crates.io/heck/0.5.0 \
>> +    crate://crates.io/hermit-abi/0.3.9 \
>> +    crate://crates.io/hermit-abi/0.4.0 \
>> +    crate://crates.io/hex/0.4.3 \
>> +    crate://crates.io/home/0.5.9 \
>> +    crate://crates.io/homedir/0.3.3 \
>> +    crate://crates.io/html-escape/0.2.13 \
>> +    crate://crates.io/http/1.1.0 \
>> +    crate://crates.io/http-body/1.0.1 \
>> +    crate://crates.io/http-body-util/0.1.2 \
>> +    crate://crates.io/http-content-range/0.1.2 \
>> +    crate://crates.io/httparse/1.9.4 \
>> +    crate://crates.io/httpdate/1.0.3 \
>> +    crate://crates.io/hyper/1.4.1 \
>> +    crate://crates.io/hyper-rustls/0.27.3 \
>> +    crate://crates.io/hyper-util/0.1.9 \
>> +    crate://crates.io/idna/0.5.0 \
>> +    crate://crates.io/ignore/0.4.23 \
>> +    crate://crates.io/image/0.25.2 \
>> +    crate://crates.io/imagesize/0.11.0 \
>> +    crate://crates.io/indexmap/2.5.0 \
>> +    crate://crates.io/indicatif/0.17.8 \
>> +    crate://crates.io/indoc/2.0.5 \
>> +    crate://crates.io/insta/1.40.0 \
>> +    crate://crates.io/instant/0.1.13 \
>> +    crate://crates.io/ipnet/2.10.0 \
>> +    crate://crates.io/is-terminal/0.4.13 \
>> +    crate://crates.io/is_ci/1.2.0 \
>> +    crate://crates.io/is_terminal_polyfill/1.70.1 \
>> +    crate://crates.io/itertools/0.10.5 \
>> +    crate://crates.io/itertools/0.12.1 \
>> +    crate://crates.io/itertools/0.13.0 \
>> +    crate://crates.io/itoa/1.0.11 \
>> +    crate://crates.io/jiff/0.1.13 \
>> +    crate://crates.io/jiff-tzdb/0.1.1 \
>> +    crate://crates.io/jiff-tzdb-platform/0.1.1 \
>> +    crate://crates.io/jobserver/0.1.32 \
>> +    crate://crates.io/jpeg-decoder/0.3.1 \
>> +    crate://crates.io/js-sys/0.3.70 \
>> +    crate://crates.io/junction/1.2.0 \
>> +    crate://crates.io/krata-tokio-tar/0.4.2 \
>> +    crate://crates.io/kurbo/0.8.3 \
>> +    crate://crates.io/kurbo/0.9.5 \
>> +    crate://crates.io/lazy_static/1.5.0 \
>> +    crate://crates.io/libc/0.2.158 \
>> +    crate://crates.io/libmimalloc-sys/0.1.39 \
>> +    crate://crates.io/libredox/0.1.3 \
>> +    crate://crates.io/libz-ng-sys/1.1.16 \
>> +    crate://crates.io/linked-hash-map/0.5.6 \
>> +    crate://crates.io/linux-raw-sys/0.4.14 \
>> +    crate://crates.io/lock_api/0.4.12 \
>> +    crate://crates.io/log/0.4.22 \
>> +    crate://crates.io/lzma-sys/0.1.20 \
>> +    crate://crates.io/mailparse/0.15.0 \
>> +    crate://crates.io/markdown/0.3.0 \
>> +    crate://crates.io/matchers/0.1.0 \
>> +    crate://crates.io/md-5/0.10.6 \
>> +    crate://crates.io/memchr/2.7.4 \
>> +    crate://crates.io/memmap2/0.5.10 \
>> +    crate://crates.io/memmap2/0.9.5 \
>> +    crate://crates.io/memoffset/0.7.1 \
>> +    crate://crates.io/miette/7.2.0 \
>> +    crate://crates.io/miette-derive/7.2.0 \
>> +    crate://crates.io/mimalloc/0.1.43 \
>> +    crate://crates.io/mime/0.3.17 \
>> +    crate://crates.io/mime_guess/2.0.5 \
>> +    crate://crates.io/miniz_oxide/0.7.4 \
>> +    crate://crates.io/miniz_oxide/0.8.0 \
>> +    crate://crates.io/mio/1.0.2 \
>> +    crate://crates.io/miow/0.6.0 \
>> +    crate://crates.io/munge/0.4.1 \
>> +    crate://crates.io/munge_macro/0.4.1 \
>> +    crate://crates.io/nanoid/0.4.0 \
>> +    crate://crates.io/nix/0.26.4 \
>> +    crate://crates.io/nix/0.29.0 \
>> +    crate://crates.io/normalize-line-endings/0.3.0 \
>> +    crate://crates.io/nu-ansi-term/0.46.0 \
>> +    crate://crates.io/nu-ansi-term/0.50.1 \
>> +    crate://crates.io/num-traits/0.2.19 \
>> +    crate://crates.io/num_cpus/1.16.0 \
>> +    crate://crates.io/number_prefix/0.4.0 \
>> +    crate://crates.io/object/0.36.4 \
>> +    crate://crates.io/once_cell/1.20.0 \
>> +    crate://crates.io/oorandom/11.1.4 \
>> +    crate://crates.io/openssl-probe/0.1.5 \
>> +    crate://crates.io/option-ext/0.2.0 \
>> +    crate://crates.io/overload/0.1.1 \
>> +    crate://crates.io/owo-colors/4.1.0 \
>> +    crate://crates.io/parking/2.2.1 \
>> +    crate://crates.io/parking_lot/0.11.2 \
>> +    crate://crates.io/parking_lot/0.12.3 \
>> +    crate://crates.io/parking_lot_core/0.8.6 \
>> +    crate://crates.io/parking_lot_core/0.9.10 \
>> +    crate://crates.io/paste/1.0.15 \
>> +    crate://crates.io/path-slash/0.2.1 \
>> +    crate://crates.io/pathdiff/0.2.1 \
>> +    crate://crates.io/percent-encoding/2.3.1 \
>> +    crate://crates.io/pest/2.7.12 \
>> +    crate://crates.io/pest_derive/2.7.12 \
>> +    crate://crates.io/pest_generator/2.7.12 \
>> +    crate://crates.io/pest_meta/2.7.12 \
>> +    crate://crates.io/petgraph/0.6.5 \
>> +    crate://crates.io/pico-args/0.5.0 \
>> +    crate://crates.io/pin-project/1.1.5 \
>> +    crate://crates.io/pin-project-internal/1.1.5 \
>> +    crate://crates.io/pin-project-lite/0.2.14 \
>> +    crate://crates.io/pin-utils/0.1.0 \
>> +    crate://crates.io/pipeline/0.5.0 \
>> +    crate://crates.io/pkg-config/0.3.30 \
>> +    crate://crates.io/plain/0.2.3 \
>> +    crate://crates.io/platform-info/2.0.4 \
>> +    crate://crates.io/png/0.17.13 \
>> +    crate://crates.io/poloto/19.1.2 \
>> +    crate://crates.io/portable-atomic/1.7.0 \
>> +    crate://crates.io/ppv-lite86/0.2.20 \
>> +    crate://crates.io/predicates/3.1.2 \
>> +    crate://crates.io/predicates-core/1.0.8 \
>> +    crate://crates.io/predicates-tree/1.0.11 \
>> +    crate://crates.io/pretty_assertions/1.4.1 \
>> +    crate://crates.io/priority-queue/2.1.0 \
>> +    crate://crates.io/proc-macro2/1.0.86 \
>> +    crate://crates.io/ptr_meta/0.3.0 \
>> +    crate://crates.io/ptr_meta_derive/0.3.0 \
>> +    crate://crates.io/quinn/0.11.5 \
>> +    crate://crates.io/quinn-proto/0.11.8 \
>> +    crate://crates.io/quinn-udp/0.5.5 \
>> +    crate://crates.io/quote/1.0.37 \
>> +    crate://crates.io/quoted_printable/0.5.1 \
>> +    crate://crates.io/rancor/0.1.0 \
>> +    crate://crates.io/rand/0.8.5 \
>> +    crate://crates.io/rand_chacha/0.3.1 \
>> +    crate://crates.io/rand_core/0.6.4 \
>> +    crate://crates.io/rayon/1.10.0 \
>> +    crate://crates.io/rayon-core/1.12.1 \
>> +    crate://crates.io/rctree/0.5.0 \
>> +    crate://crates.io/redox_syscall/0.2.16 \
>> +    crate://crates.io/redox_syscall/0.3.5 \
>> +    crate://crates.io/redox_syscall/0.5.4 \
>> +    crate://crates.io/redox_users/0.4.6 \
>> +    crate://crates.io/reflink-copy/0.1.19 \
>> +    crate://crates.io/regex/1.11.0 \
>> +    crate://crates.io/regex-automata/0.1.10 \
>> +    crate://crates.io/regex-automata/0.4.8 \
>> +    crate://crates.io/regex-syntax/0.6.29 \
>> +    crate://crates.io/regex-syntax/0.8.5 \
>> +    crate://crates.io/rend/0.5.1 \
>> +    crate://crates.io/reqwest/0.12.7 \
>> +    crate://crates.io/resvg/0.29.0 \
>> +    crate://crates.io/retry-policies/0.4.0 \
>> +    crate://crates.io/rgb/0.8.50 \
>> +    crate://crates.io/ring/0.17.8 \
>> +    crate://crates.io/rkyv/0.8.8 \
>> +    crate://crates.io/rkyv_derive/0.8.8 \
>> +    crate://crates.io/rmp/0.8.14 \
>> +    crate://crates.io/rmp-serde/1.3.0 \
>> +    crate://crates.io/rosvgtree/0.1.0 \
>> +    crate://crates.io/roxmltree/0.18.1 \
>> +    crate://crates.io/roxmltree/0.20.0 \
>> +    crate://crates.io/rust-netrc/0.1.1 \
>> +    crate://crates.io/rustc-demangle/0.1.24 \
>> +    crate://crates.io/rustc-hash/2.0.0 \
>> +    crate://crates.io/rustix/0.38.37 \
>> +    crate://crates.io/rustls/0.23.13 \
>> +    crate://crates.io/rustls-native-certs/0.7.3 \
>> +    crate://crates.io/rustls-native-certs/0.8.0 \
>> +    crate://crates.io/rustls-pemfile/2.1.3 \
>> +    crate://crates.io/rustls-pki-types/1.8.0 \
>> +    crate://crates.io/rustls-webpki/0.102.8 \
>> +    crate://crates.io/rustybuzz/0.7.0 \
>> +    crate://crates.io/ryu/1.0.18 \
>> +    crate://crates.io/same-file/1.0.6 \
>> +    crate://crates.io/schannel/0.1.24 \
>> +    crate://crates.io/schemars/0.8.21 \
>> +    crate://crates.io/schemars_derive/0.8.21 \
>> +    crate://crates.io/scopeguard/1.2.0 \
>> +    crate://crates.io/scroll/0.12.0 \
>> +    crate://crates.io/scroll_derive/0.12.0 \
>> +    crate://crates.io/seahash/4.1.0 \
>> +    crate://crates.io/security-framework/2.11.1 \
>> +    crate://crates.io/security-framework-sys/2.11.1 \
>> +    crate://crates.io/semver/1.0.23 \
>> +    crate://crates.io/serde/1.0.210 \
>> +    crate://crates.io/serde-untagged/0.1.6 \
>> +    crate://crates.io/serde_derive/1.0.210 \
>> +    crate://crates.io/serde_derive_internals/0.29.1 \
>> +    crate://crates.io/serde_json/1.0.128 \
>> +    crate://crates.io/serde_spanned/0.6.7 \
>> +    crate://crates.io/serde_urlencoded/0.7.1 \
>> +    crate://crates.io/sha2/0.10.8 \
>> +    crate://crates.io/sharded-slab/0
>> <http://crates.io/sharded-slab/0.1.7>
>>
>>

--000000000000b27e89062412a758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks f=
or the tip. I&#39;ll try and see if I can spot the difference, no luck so f=
ar.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Tom</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 7, 2024, 5:38=
=E2=80=AFAM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br></=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Oct 6, 2024 at 1:01=E2=80=AFPM Tom Geelen via <a href=3D"http://=
lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembe=
dded.org</a> &lt;t.f.g.geelen=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)"><div>Hi all,</div>
<div>=C2=A0</div>
<div>I could use some support. Currently I am trying to insert support for =
a new Python package manager which is now a requirement for a Python packag=
e I&#39;m trying to maintain (link: <a href=3D"https://pypi.org/project/uv/=
" rel=3D"noopener noreferrer" target=3D"_blank">UV</a>). A Rust based packa=
ge manager.</div>
<div>=C2=A0</div>
<div>My problem is when I am creating the recipe not all crates are on <a h=
ref=3D"http://crates.io" target=3D"_blank" rel=3D"noreferrer">crates.io</a>=
. Several are only on github. Now is it possible to have both the normal <a=
 href=3D"http://crates.io" target=3D"_blank" rel=3D"noreferrer">crates.io</=
a> as well as another provider side by side?</div>
<div>I have tried checking the Yocto manual and found <a href=3D"https://do=
cs.yoctoproject.org/ref-manual/classes.html#cargo" rel=3D"noopener noreferr=
er" target=3D"_blank">the class cargo</a> which references an example which=
 does not exist anymore: <a href=3D"https://git.openembedded.org/openembedd=
ed-core/tree/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb" re=
l=3D"noopener noreferrer" target=3D"_blank">zvariant_3.12.0.bb</a>.</div>
<div>=C2=A0</div></blockquote><div dir=3D"auto">you can see what the zvaria=
nt recipe was:</div><div dir=3D"auto"><div><a href=3D"https://git.openembed=
ded.org/openembedded-core/commit/meta-selftest/recipes-extended?id=3D8a286e=
686e5764f4def0644586dd19e2197ef6c2" target=3D"_blank" rel=3D"noreferrer">ht=
tps://git.openembedded.org/openembedded-core/commit/meta-selftest/recipes-e=
xtended?id=3D8a286e686e5764f4def0644586dd19e2197ef6c2</a></div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)"><div dir=3D"auto"></div>
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
://<a href=3D"http://crates.io/addr2line/0.24.1" target=3D"_blank" rel=3D"n=
oreferrer">crates.io/addr2line/0.24.1</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/adler/1.0.2" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/adler/1.0.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/adler2/2.0.0" target=3D"_blank" rel=3D"noreferrer">crates.io/adler2/2.=
0.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/aho-corasic=
k/1.1.3" target=3D"_blank" rel=3D"noreferrer">crates.io/aho-corasick/1.1.3<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/anes/0.1.6" tar=
get=3D"_blank" rel=3D"noreferrer">crates.io/anes/0.1.6</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/anstream/0.6.15" target=3D"_blank=
" rel=3D"noreferrer">crates.io/anstream/0.6.15</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/anstyle/1.0.8" target=3D"_blank" rel=3D"nor=
eferrer">crates.io/anstyle/1.0.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/anstyle-parse/0.2.5" target=3D"_blank" rel=3D"noreferrer"=
>crates.io/anstyle-parse/0.2.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"h=
ttp://crates.io/anstyle-query/1.1.1" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/anstyle-query/1.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/anstyle-wincon/3.0.4" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/anstyle-wincon/3.0.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/anyhow/1.0.89" target=3D"_blank" rel=3D"noreferrer">crates.io=
/anyhow/1.0.89</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
arrayref/0.3.9" target=3D"_blank" rel=3D"noreferrer">crates.io/arrayref/0.3=
.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/arrayvec/0.7=
.6" target=3D"_blank" rel=3D"noreferrer">crates.io/arrayvec/0.7.6</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/assert-json-diff/2.0.2" =
target=3D"_blank" rel=3D"noreferrer">crates.io/assert-json-diff/2.0.2</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/assert_cmd/2.0.16" t=
arget=3D"_blank" rel=3D"noreferrer">crates.io/assert_cmd/2.0.16</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/assert_fs/1.1.2" target=3D=
"_blank" rel=3D"noreferrer">crates.io/assert_fs/1.1.2</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/async-channel/2.3.1" target=3D"_blan=
k" rel=3D"noreferrer">crates.io/async-channel/2.3.1</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/async-compression/0.4.12" target=3D"=
_blank" rel=3D"noreferrer">crates.io/async-compression/0.4.12</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/async-trait/0.1.83" target=
=3D"_blank" rel=3D"noreferrer">crates.io/async-trait/0.1.83</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/async_http_range_reader/0.8.0=
" target=3D"_blank" rel=3D"noreferrer">crates.io/async_http_range_reader/0.=
8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/atomic-wake=
r/1.1.2" target=3D"_blank" rel=3D"noreferrer">crates.io/atomic-waker/1.1.2<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/autocfg/1.3.0" =
target=3D"_blank" rel=3D"noreferrer">crates.io/autocfg/1.3.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/axoasset/1.0.0" target=3D"_bl=
ank" rel=3D"noreferrer">crates.io/axoasset/1.0.0</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/axoprocess/0.2.0" target=3D"_blank" rel=
=3D"noreferrer">crates.io/axoprocess/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/axotag/0.2.0" target=3D"_blank" rel=3D"noreferr=
er">crates.io/axotag/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/axoupdater/0.7.2" target=3D"_blank" rel=3D"noreferrer">crates.i=
o/axoupdater/0.7.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/backoff/0.4.0" target=3D"_blank" rel=3D"noreferrer">crates.io/backoff/0=
.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/backtrace/=
0.3.74" target=3D"_blank" rel=3D"noreferrer">crates.io/backtrace/0.3.74</a>=
 \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/base64/0.21.7" tar=
get=3D"_blank" rel=3D"noreferrer">crates.io/base64/0.21.7</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/base64/0.22.1" target=3D"_blank"=
 rel=3D"noreferrer">crates.io/base64/0.22.1</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/bisection/0.1.0" target=3D"_blank" rel=3D"nore=
ferrer">crates.io/bisection/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/bitflags/1.3.2" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/bitflags/1.3.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/bitflags/2.6.0" target=3D"_blank" rel=3D"noreferrer">crates.io/bit=
flags/2.6.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/blo=
ck-buffer/0.10.4" target=3D"_blank" rel=3D"noreferrer">crates.io/block-buff=
er/0.10.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/boxca=
r/0.2.5" target=3D"_blank" rel=3D"noreferrer">crates.io/boxcar/0.2.5</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bstr/1.10.0" target=
=3D"_blank" rel=3D"noreferrer">crates.io/bstr/1.10.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/bumpalo/3.16.0" target=3D"_blank" re=
l=3D"noreferrer">crates.io/bumpalo/3.16.0</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/bytecheck/0.8.0" target=3D"_blank" rel=3D"norefe=
rrer">crates.io/bytecheck/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/bytecheck_derive/0.8.0" target=3D"_blank" rel=3D"noreferre=
r">crates.io/bytecheck_derive/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/bytemuck/1.18.0" target=3D"_blank" rel=3D"noreferrer">=
crates.io/bytemuck/1.18.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/byteorder/1.5.0" target=3D"_blank" rel=3D"noreferrer">crates.io/=
byteorder/1.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io=
/byteorder-lite/0.1.0" target=3D"_blank" rel=3D"noreferrer">crates.io/byteo=
rder-lite/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io=
/bytes/1.7.1" target=3D"_blank" rel=3D"noreferrer">crates.io/bytes/1.7.1</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/bzip2/0.4.4" targ=
et=3D"_blank" rel=3D"noreferrer">crates.io/bzip2/0.4.4</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/bzip2-sys/0.1.11+1.0.8" target=3D=
"_blank" rel=3D"noreferrer">crates.io/bzip2-sys/0.1.11+1.0.8</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/cachedir/0.3.1" target=3D"_bl=
ank" rel=3D"noreferrer">crates.io/cachedir/0.3.1</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/camino/1.1.9" target=3D"_blank" rel=3D"no=
referrer">crates.io/camino/1.1.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/cargo-util/0.2.14" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/cargo-util/0.2.14</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/cast/0.3.0" target=3D"_blank" rel=3D"noreferrer">crates.io/cast=
/0.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cc/1.1.1=
9" target=3D"_blank" rel=3D"noreferrer">crates.io/cc/1.1.19</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/cfg-if/1.0.0" target=3D"_blan=
k" rel=3D"noreferrer">crates.io/cfg-if/1.0.0</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/cfg_aliases/0.2.1" target=3D"_blank" rel=3D"n=
oreferrer">crates.io/cfg_aliases/0.2.1</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/charset/0.1.5" target=3D"_blank" rel=3D"noreferrer"=
>crates.io/charset/0.1.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://=
crates.io/ciborium/0.2.2" target=3D"_blank" rel=3D"noreferrer">crates.io/ci=
borium/0.2.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ci=
borium-io/0.2.2" target=3D"_blank" rel=3D"noreferrer">crates.io/ciborium-io=
/0.2.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ciborium=
-ll/0.2.2" target=3D"_blank" rel=3D"noreferrer">crates.io/ciborium-ll/0.2.2=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/clap/4.5.18" t=
arget=3D"_blank" rel=3D"noreferrer">crates.io/clap/4.5.18</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/clap_builder/4.5.18" target=3D"_=
blank" rel=3D"noreferrer">crates.io/clap_builder/4.5.18</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/clap_complete/4.5.26" target=3D"_=
blank" rel=3D"noreferrer">crates.io/clap_complete/4.5.26</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/clap_complete_command/0.6.1" targ=
et=3D"_blank" rel=3D"noreferrer">crates.io/clap_complete_command/0.6.1</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/clap_complete_nushe=
ll/4.5.3" target=3D"_blank" rel=3D"noreferrer">crates.io/clap_complete_nush=
ell/4.5.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/clap_=
derive/4.5.18" target=3D"_blank" rel=3D"noreferrer">crates.io/clap_derive/4=
.5.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/clap_lex/=
0.7.2" target=3D"_blank" rel=3D"noreferrer">crates.io/clap_lex/0.7.2</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cmake/0.1.51" target=
=3D"_blank" rel=3D"noreferrer">crates.io/cmake/0.1.51</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/codspeed/2.7.2" target=3D"_blank" re=
l=3D"noreferrer">crates.io/codspeed/2.7.2</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/codspeed-criterion-compat/2.7.2" target=3D"_blan=
k" rel=3D"noreferrer">crates.io/codspeed-criterion-compat/2.7.2</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/color_quant/1.1.0" target=
=3D"_blank" rel=3D"noreferrer">crates.io/color_quant/1.1.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/colorchoice/1.0.2" target=3D"=
_blank" rel=3D"noreferrer">crates.io/colorchoice/1.0.2</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/colored/2.1.0" target=3D"_blank" =
rel=3D"noreferrer">crates.io/colored/2.1.0</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/concurrent-queue/2.5.0" target=3D"_blank" rel=
=3D"noreferrer">crates.io/concurrent-queue/2.5.0</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/configparser/3.1.0" target=3D"_blank" rel=
=3D"noreferrer">crates.io/configparser/3.1.0</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/console/0.15.8" target=3D"_blank" rel=3D"nore=
ferrer">crates.io/console/0.15.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/core-foundation/0.9.4" target=3D"_blank" rel=3D"noreferre=
r">crates.io/core-foundation/0.9.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/core-foundation-sys/0.8.7" target=3D"_blank" rel=3D"no=
referrer">crates.io/core-foundation-sys/0.8.7</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/cpufeatures/0.2.14" target=3D"_blank" rel=3D=
"noreferrer">crates.io/cpufeatures/0.2.14</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/crc32fast/1.4.2" target=3D"_blank" rel=3D"norefe=
rrer">crates.io/crc32fast/1.4.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/criterion/0.5.1" target=3D"_blank" rel=3D"noreferrer">crat=
es.io/criterion/0.5.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/criterion-plot/0.5.0" target=3D"_blank" rel=3D"noreferrer">crates.io=
/criterion-plot/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/crossbeam-deque/0.8.5" target=3D"_blank" rel=3D"noreferrer">crates.i=
o/crossbeam-deque/0.8.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/crossbeam-epoch/0.9.18" target=3D"_blank" rel=3D"noreferrer">crate=
s.io/crossbeam-epoch/0.9.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/crossbeam-utils/0.8.20" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/crossbeam-utils/0.8.20</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/crunchy/0.2.2" target=3D"_blank" rel=3D"noreferrer">crates=
.io/crunchy/0.2.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/crypto-common/0.1.6" target=3D"_blank" rel=3D"noreferrer">crates.io/cryp=
to-common/0.1.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io=
/csv/1.3.0" target=3D"_blank" rel=3D"noreferrer">crates.io/csv/1.3.0</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/csv-core/0.1.11" targ=
et=3D"_blank" rel=3D"noreferrer">crates.io/csv-core/0.1.11</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/ctrlc/3.4.5" target=3D"_blank=
" rel=3D"noreferrer">crates.io/ctrlc/3.4.5</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/dashmap/6.1.0" target=3D"_blank" rel=3D"norefer=
rer">crates.io/dashmap/6.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/data-encoding/2.6.0" target=3D"_blank" rel=3D"noreferrer">cra=
tes.io/data-encoding/2.6.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:=
//crates.io/data-url/0.2.0" target=3D"_blank" rel=3D"noreferrer">crates.io/=
data-url/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
deadpool/0.10.0" target=3D"_blank" rel=3D"noreferrer">crates.io/deadpool/0.=
10.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/deadpool-r=
untime/0.1.4" target=3D"_blank" rel=3D"noreferrer">crates.io/deadpool-runti=
me/0.1.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/diff/0=
.1.13" target=3D"_blank" rel=3D"noreferrer">crates.io/diff/0.1.13</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/difflib/0.4.0" target=3D=
"_blank" rel=3D"noreferrer">crates.io/difflib/0.4.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/digest/0.10.7" target=3D"_blank" rel=
=3D"noreferrer">crates.io/digest/0.10.7</a> \<br>+ =C2=A0 =C2=A0crate://<a =
href=3D"http://crates.io/directories/5.0.1" target=3D"_blank" rel=3D"norefe=
rrer">crates.io/directories/5.0.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/dirs-sys/0.4.1" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/dirs-sys/0.4.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/doc-comment/0.3.3" target=3D"_blank" rel=3D"noreferrer">crates.io/=
doc-comment/0.3.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/dunce/1.0.5" target=3D"_blank" rel=3D"noreferrer">crates.io/dunce/1.0.5<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/dyn-clone/1.0.1=
7" target=3D"_blank" rel=3D"noreferrer">crates.io/dyn-clone/1.0.17</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/either/1.13.0" target=
=3D"_blank" rel=3D"noreferrer">crates.io/either/1.13.0</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/encode_unicode/0.3.6" target=3D"_=
blank" rel=3D"noreferrer">crates.io/encode_unicode/0.3.6</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/encoding_rs/0.8.34" target=3D"_bl=
ank" rel=3D"noreferrer">crates.io/encoding_rs/0.8.34</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/encoding_rs_io/0.1.7" target=3D"_bla=
nk" rel=3D"noreferrer">crates.io/encoding_rs_io/0.1.7</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/equivalent/1.0.1" target=3D"_blank" =
rel=3D"noreferrer">crates.io/equivalent/1.0.1</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/erased-serde/0.4.5" target=3D"_blank" rel=3D=
"noreferrer">crates.io/erased-serde/0.4.5</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/errno/0.3.9" target=3D"_blank" rel=3D"noreferrer=
">crates.io/errno/0.3.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/etcetera/0.8.0" target=3D"_blank" rel=3D"noreferrer">crates.io/etc=
etera/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/eve=
nt-listener/5.3.1" target=3D"_blank" rel=3D"noreferrer">crates.io/event-lis=
tener/5.3.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/eve=
nt-listener-strategy/0.5.2" target=3D"_blank" rel=3D"noreferrer">crates.io/=
event-listener-strategy/0.5.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/fastrand/2.1.1" target=3D"_blank" rel=3D"noreferrer">crates.=
io/fastrand/2.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/fdeflate/0.3.4" target=3D"_blank" rel=3D"noreferrer">crates.io/fdeflate/=
0.3.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/filetime/=
0.2.25" target=3D"_blank" rel=3D"noreferrer">crates.io/filetime/0.2.25</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/fixedbitset/0.4.2" =
target=3D"_blank" rel=3D"noreferrer">crates.io/fixedbitset/0.4.2</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/flate2/1.0.34" target=3D"=
_blank" rel=3D"noreferrer">crates.io/flate2/1.0.34</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/float-cmp/0.9.0" target=3D"_blank" rel=
=3D"noreferrer">crates.io/float-cmp/0.9.0</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/fnv/1.0.7" target=3D"_blank" rel=3D"noreferrer">=
crates.io/fnv/1.0.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/fontconfig-parser/0.5.7" target=3D"_blank" rel=3D"noreferrer">crates.i=
o/fontconfig-parser/0.5.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/fontdb/0.12.0" target=3D"_blank" rel=3D"noreferrer">crates.io/fo=
ntdb/0.12.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/for=
m_urlencoded/1.2.1" target=3D"_blank" rel=3D"noreferrer">crates.io/form_url=
encoded/1.2.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/f=
s-err/2.11.0" target=3D"_blank" rel=3D"noreferrer">crates.io/fs-err/2.11.0<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/fs2/0.4.3" targ=
et=3D"_blank" rel=3D"noreferrer">crates.io/fs2/0.4.3</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/futures/0.3.30" target=3D"_blank" re=
l=3D"noreferrer">crates.io/futures/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/futures-channel/0.3.30" target=3D"_blank" rel=3D=
"noreferrer">crates.io/futures-channel/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/futures-core/0.3.30" target=3D"_blank" rel=
=3D"noreferrer">crates.io/futures-core/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/futures-executor/0.3.30" target=3D"_blank" r=
el=3D"noreferrer">crates.io/futures-executor/0.3.30</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/futures-io/0.3.30" target=3D"_blank"=
 rel=3D"noreferrer">crates.io/futures-io/0.3.30</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/futures-lite/2.3.0" target=3D"_blank" rel=
=3D"noreferrer">crates.io/futures-lite/2.3.0</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/futures-macro/0.3.30" target=3D"_blank" rel=
=3D"noreferrer">crates.io/futures-macro/0.3.30</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/futures-sink/0.3.30" target=3D"_blank" rel=
=3D"noreferrer">crates.io/futures-sink/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/futures-task/0.3.30" target=3D"_blank" rel=
=3D"noreferrer">crates.io/futures-task/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/futures-util/0.3.30" target=3D"_blank" rel=
=3D"noreferrer">crates.io/futures-util/0.3.30</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/generic-array/0.14.7" target=3D"_blank" rel=
=3D"noreferrer">crates.io/generic-array/0.14.7</a> \<br>+ =C2=A0 =C2=A0crat=
e://<a href=3D"http://crates.io/getrandom/0.2.15" target=3D"_blank" rel=3D"=
noreferrer">crates.io/getrandom/0.2.15</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/gif/0.12.0" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/gif/0.12.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/gimli/0.31.0" target=3D"_blank" rel=3D"noreferrer">crates.io/gimli/0.31=
.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/glob/0.3.1" =
target=3D"_blank" rel=3D"noreferrer">crates.io/glob/0.3.1</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/globset/0.4.15" target=3D"_blank=
" rel=3D"noreferrer">crates.io/globset/0.4.15</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/globwalk/0.9.1" target=3D"_blank" rel=3D"nor=
eferrer">crates.io/globwalk/0.9.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/goblin/0.8.2" target=3D"_blank" rel=3D"noreferrer">cra=
tes.io/goblin/0.8.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/h2/0.4.6" target=3D"_blank" rel=3D"noreferrer">crates.io/h2/0.4.6</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/half/2.4.1" target=
=3D"_blank" rel=3D"noreferrer">crates.io/half/2.4.1</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/hashbrown/0.14.5" target=3D"_blank" =
rel=3D"noreferrer">crates.io/hashbrown/0.14.5</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/heck/0.5.0" target=3D"_blank" rel=3D"norefer=
rer">crates.io/heck/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/hermit-abi/0.3.9" target=3D"_blank" rel=3D"noreferrer">crates.io=
/hermit-abi/0.3.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/hermit-abi/0.4.0" target=3D"_blank" rel=3D"noreferrer">crates.io/hermit-=
abi/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/hex/0=
.4.3" target=3D"_blank" rel=3D"noreferrer">crates.io/hex/0.4.3</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/home/0.5.9" target=3D"_bla=
nk" rel=3D"noreferrer">crates.io/home/0.5.9</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/homedir/0.3.3" target=3D"_blank" rel=3D"norefe=
rrer">crates.io/homedir/0.3.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/html-escape/0.2.13" target=3D"_blank" rel=3D"noreferrer">cra=
tes.io/html-escape/0.2.13</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/http/1.1.0" target=3D"_blank" rel=3D"noreferrer">crates.io/http/=
1.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/http-body=
/1.0.1" target=3D"_blank" rel=3D"noreferrer">crates.io/http-body/1.0.1</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/http-body-util/0.1.=
2" target=3D"_blank" rel=3D"noreferrer">crates.io/http-body-util/0.1.2</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/http-content-range/=
0.1.2" target=3D"_blank" rel=3D"noreferrer">crates.io/http-content-range/0.=
1.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/httparse/1.=
9.4" target=3D"_blank" rel=3D"noreferrer">crates.io/httparse/1.9.4</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/httpdate/1.0.3" target=
=3D"_blank" rel=3D"noreferrer">crates.io/httpdate/1.0.3</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/hyper/1.4.1" target=3D"_blank" re=
l=3D"noreferrer">crates.io/hyper/1.4.1</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/hyper-rustls/0.27.3" target=3D"_blank" rel=3D"noref=
errer">crates.io/hyper-rustls/0.27.3</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/hyper-util/0.1.9" target=3D"_blank" rel=3D"noreferrer=
">crates.io/hyper-util/0.1.9</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/idna/0.5.0" target=3D"_blank" rel=3D"noreferrer">crates.io/id=
na/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ignore=
/0.4.23" target=3D"_blank" rel=3D"noreferrer">crates.io/ignore/0.4.23</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/image/0.25.2" target=
=3D"_blank" rel=3D"noreferrer">crates.io/image/0.25.2</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/imagesize/0.11.0" target=3D"_blank" =
rel=3D"noreferrer">crates.io/imagesize/0.11.0</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/indexmap/2.5.0" target=3D"_blank" rel=3D"nor=
eferrer">crates.io/indexmap/2.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/indicatif/0.17.8" target=3D"_blank" rel=3D"noreferrer"=
>crates.io/indicatif/0.17.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/indoc/2.0.5" target=3D"_blank" rel=3D"noreferrer">crates.io/in=
doc/2.0.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/insta=
/1.40.0" target=3D"_blank" rel=3D"noreferrer">crates.io/insta/1.40.0</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/instant/0.1.13" targe=
t=3D"_blank" rel=3D"noreferrer">crates.io/instant/0.1.13</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/ipnet/2.10.0" target=3D"_blank" r=
el=3D"noreferrer">crates.io/ipnet/2.10.0</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/is-terminal/0.4.13" target=3D"_blank" rel=3D"nore=
ferrer">crates.io/is-terminal/0.4.13</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/is_ci/1.2.0" target=3D"_blank" rel=3D"noreferrer">cra=
tes.io/is_ci/1.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/is_terminal_polyfill/1.70.1" target=3D"_blank" rel=3D"noreferrer">crate=
s.io/is_terminal_polyfill/1.70.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/itertools/0.10.5" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/itertools/0.10.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://=
crates.io/itertools/0.12.1" target=3D"_blank" rel=3D"noreferrer">crates.io/=
itertools/0.12.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/itertools/0.13.0" target=3D"_blank" rel=3D"noreferrer">crates.io/itertool=
s/0.13.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/itoa/1=
.0.11" target=3D"_blank" rel=3D"noreferrer">crates.io/itoa/1.0.11</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/jiff/0.1.13" target=3D"_=
blank" rel=3D"noreferrer">crates.io/jiff/0.1.13</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/jiff-tzdb/0.1.1" target=3D"_blank" rel=3D"=
noreferrer">crates.io/jiff-tzdb/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/jiff-tzdb-platform/0.1.1" target=3D"_blank" rel=3D"n=
oreferrer">crates.io/jiff-tzdb-platform/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/jobserver/0.1.32" target=3D"_blank" rel=3D"n=
oreferrer">crates.io/jobserver/0.1.32</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/jpeg-decoder/0.3.1" target=3D"_blank" rel=3D"norefer=
rer">crates.io/jpeg-decoder/0.3.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/js-sys/0.3.70" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/js-sys/0.3.70</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/junction/1.2.0" target=3D"_blank" rel=3D"noreferrer">crates.io/junct=
ion/1.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/krata=
-tokio-tar/0.4.2" target=3D"_blank" rel=3D"noreferrer">crates.io/krata-toki=
o-tar/0.4.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/kur=
bo/0.8.3" target=3D"_blank" rel=3D"noreferrer">crates.io/kurbo/0.8.3</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/kurbo/0.9.5" target=
=3D"_blank" rel=3D"noreferrer">crates.io/kurbo/0.9.5</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/lazy_static/1.5.0" target=3D"_blank"=
 rel=3D"noreferrer">crates.io/lazy_static/1.5.0</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/libc/0.2.158" target=3D"_blank" rel=3D"nor=
eferrer">crates.io/libc/0.2.158</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/libmimalloc-sys/0.1.39" target=3D"_blank" rel=3D"noreferre=
r">crates.io/libmimalloc-sys/0.1.39</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/libredox/0.1.3" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/libredox/0.1.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/libz-ng-sys/1.1.16" target=3D"_blank" rel=3D"noreferrer">crates.io=
/libz-ng-sys/1.1.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/linked-hash-map/0.5.6" target=3D"_blank" rel=3D"noreferrer">crates.io/=
linked-hash-map/0.5.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/linux-raw-sys/0.4.14" target=3D"_blank" rel=3D"noreferrer">crates.io=
/linux-raw-sys/0.4.14</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/lock_api/0.4.12" target=3D"_blank" rel=3D"noreferrer">crates.io/lock=
_api/0.4.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/log=
/0.4.22" target=3D"_blank" rel=3D"noreferrer">crates.io/log/0.4.22</a> \<br=
>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/lzma-sys/0.1.20" target=
=3D"_blank" rel=3D"noreferrer">crates.io/lzma-sys/0.1.20</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/mailparse/0.15.0" target=3D"_blan=
k" rel=3D"noreferrer">crates.io/mailparse/0.15.0</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/markdown/0.3.0" target=3D"_blank" rel=3D"=
noreferrer">crates.io/markdown/0.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a hre=
f=3D"http://crates.io/matchers/0.1.0" target=3D"_blank" rel=3D"noreferrer">=
crates.io/matchers/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://=
crates.io/md-5/0.10.6" target=3D"_blank" rel=3D"noreferrer">crates.io/md-5/=
0.10.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/memchr/2=
.7.4" target=3D"_blank" rel=3D"noreferrer">crates.io/memchr/2.7.4</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/memmap2/0.5.10" target=
=3D"_blank" rel=3D"noreferrer">crates.io/memmap2/0.5.10</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/memmap2/0.9.5" target=3D"_blank" =
rel=3D"noreferrer">crates.io/memmap2/0.9.5</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/memoffset/0.7.1" target=3D"_blank" rel=3D"noref=
errer">crates.io/memoffset/0.7.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/miette/7.2.0" target=3D"_blank" rel=3D"noreferrer">crates=
.io/miette/7.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/miette-derive/7.2.0" target=3D"_blank" rel=3D"noreferrer">crates.io/miett=
e-derive/7.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
mimalloc/0.1.43" target=3D"_blank" rel=3D"noreferrer">crates.io/mimalloc/0.=
1.43</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/mime/0.3.1=
7" target=3D"_blank" rel=3D"noreferrer">crates.io/mime/0.3.17</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/mime_guess/2.0.5" target=
=3D"_blank" rel=3D"noreferrer">crates.io/mime_guess/2.0.5</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/miniz_oxide/0.7.4" target=3D"_bl=
ank" rel=3D"noreferrer">crates.io/miniz_oxide/0.7.4</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/miniz_oxide/0.8.0" target=3D"_blank"=
 rel=3D"noreferrer">crates.io/miniz_oxide/0.8.0</a> \<br>+ =C2=A0 =C2=A0cra=
te://<a href=3D"http://crates.io/mio/1.0.2" target=3D"_blank" rel=3D"norefe=
rrer">crates.io/mio/1.0.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/miow/0.6.0" target=3D"_blank" rel=3D"noreferrer">crates.io/miow/=
0.6.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/munge/0.4=
.1" target=3D"_blank" rel=3D"noreferrer">crates.io/munge/0.4.1</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/munge_macro/0.4.1" target=
=3D"_blank" rel=3D"noreferrer">crates.io/munge_macro/0.4.1</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/nanoid/0.4.0" target=3D"_blan=
k" rel=3D"noreferrer">crates.io/nanoid/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate:=
//<a href=3D"http://crates.io/nix/0.26.4" target=3D"_blank" rel=3D"noreferr=
er">crates.io/nix/0.26.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://=
crates.io/nix/0.29.0" target=3D"_blank" rel=3D"noreferrer">crates.io/nix/0.=
29.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/normalize-=
line-endings/0.3.0" target=3D"_blank" rel=3D"noreferrer">crates.io/normaliz=
e-line-endings/0.3.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crat=
es.io/nu-ansi-term/0.46.0" target=3D"_blank" rel=3D"noreferrer">crates.io/n=
u-ansi-term/0.46.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates=
.io/nu-ansi-term/0.50.1" target=3D"_blank" rel=3D"noreferrer">crates.io/nu-=
ansi-term/0.50.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/num-traits/0.2.19" target=3D"_blank" rel=3D"noreferrer">crates.io/num-tra=
its/0.2.19</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/num_=
cpus/1.16.0" target=3D"_blank" rel=3D"noreferrer">crates.io/num_cpus/1.16.0=
</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/number_prefix/=
0.4.0" target=3D"_blank" rel=3D"noreferrer">crates.io/number_prefix/0.4.0</=
a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/object/0.36.4" t=
arget=3D"_blank" rel=3D"noreferrer">crates.io/object/0.36.4</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/once_cell/1.20.0" target=3D"_=
blank" rel=3D"noreferrer">crates.io/once_cell/1.20.0</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/oorandom/11.1.4" target=3D"_blank" r=
el=3D"noreferrer">crates.io/oorandom/11.1.4</a> \<br>+ =C2=A0 =C2=A0crate:/=
/<a href=3D"http://crates.io/openssl-probe/0.1.5" target=3D"_blank" rel=3D"=
noreferrer">crates.io/openssl-probe/0.1.5</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/option-ext/0.2.0" target=3D"_blank" rel=3D"noref=
errer">crates.io/option-ext/0.2.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/overload/0.1.1" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/overload/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/owo-colors/4.1.0" target=3D"_blank" rel=3D"noreferrer">crates.io/o=
wo-colors/4.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io=
/parking/2.2.1" target=3D"_blank" rel=3D"noreferrer">crates.io/parking/2.2.=
1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot/0=
.11.2" target=3D"_blank" rel=3D"noreferrer">crates.io/parking_lot/0.11.2</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot/0.12.=
3" target=3D"_blank" rel=3D"noreferrer">crates.io/parking_lot/0.12.3</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot_core/0.8.=
6" target=3D"_blank" rel=3D"noreferrer">crates.io/parking_lot_core/0.8.6</a=
> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot_core/=
0.9.10" target=3D"_blank" rel=3D"noreferrer">crates.io/parking_lot_core/0.9=
.10</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/paste/1.0.1=
5" target=3D"_blank" rel=3D"noreferrer">crates.io/paste/1.0.15</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/path-slash/0.2.1" target=
=3D"_blank" rel=3D"noreferrer">crates.io/path-slash/0.2.1</a> \<br>+ =C2=A0=
 =C2=A0crate://<a href=3D"http://crates.io/pathdiff/0.2.1" target=3D"_blank=
" rel=3D"noreferrer">crates.io/pathdiff/0.2.1</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/percent-encoding/2.3.1" target=3D"_blank" re=
l=3D"noreferrer">crates.io/percent-encoding/2.3.1</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/pest/2.7.12" target=3D"_blank" rel=3D"no=
referrer">crates.io/pest/2.7.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/pest_derive/2.7.12" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/pest_derive/2.7.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/pest_generator/2.7.12" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/pest_generator/2.7.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/pest_meta/2.7.12" target=3D"_blank" rel=3D"noreferrer">crate=
s.io/pest_meta/2.7.12</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/petgraph/0.6.5" target=3D"_blank" rel=3D"noreferrer">crates.io/petgr=
aph/0.6.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pico-=
args/0.5.0" target=3D"_blank" rel=3D"noreferrer">crates.io/pico-args/0.5.0<=
/a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pin-project/1.1=
.5" target=3D"_blank" rel=3D"noreferrer">crates.io/pin-project/1.1.5</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pin-project-internal/=
1.1.5" target=3D"_blank" rel=3D"noreferrer">crates.io/pin-project-internal/=
1.1.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pin-proje=
ct-lite/0.2.14" target=3D"_blank" rel=3D"noreferrer">crates.io/pin-project-=
lite/0.2.14</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pin=
-utils/0.1.0" target=3D"_blank" rel=3D"noreferrer">crates.io/pin-utils/0.1.=
0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pipeline/0.5.=
0" target=3D"_blank" rel=3D"noreferrer">crates.io/pipeline/0.5.0</a> \<br>+=
 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pkg-config/0.3.30" target=
=3D"_blank" rel=3D"noreferrer">crates.io/pkg-config/0.3.30</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/plain/0.2.3" target=3D"_blank=
" rel=3D"noreferrer">crates.io/plain/0.2.3</a> \<br>+ =C2=A0 =C2=A0crate://=
<a href=3D"http://crates.io/platform-info/2.0.4" target=3D"_blank" rel=3D"n=
oreferrer">crates.io/platform-info/2.0.4</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/png/0.17.13" target=3D"_blank" rel=3D"noreferrer"=
>crates.io/png/0.17.13</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/poloto/19.1.2" target=3D"_blank" rel=3D"noreferrer">crates.io/polot=
o/19.1.2</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/portab=
le-atomic/1.7.0" target=3D"_blank" rel=3D"noreferrer">crates.io/portable-at=
omic/1.7.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ppv-=
lite86/0.2.20" target=3D"_blank" rel=3D"noreferrer">crates.io/ppv-lite86/0.=
2.20</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/predicates=
/3.1.2" target=3D"_blank" rel=3D"noreferrer">crates.io/predicates/3.1.2</a>=
 \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/predicates-core/1.=
0.8" target=3D"_blank" rel=3D"noreferrer">crates.io/predicates-core/1.0.8</=
a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/predicates-tree/=
1.0.11" target=3D"_blank" rel=3D"noreferrer">crates.io/predicates-tree/1.0.=
11</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pretty_asser=
tions/1.4.1" target=3D"_blank" rel=3D"noreferrer">crates.io/pretty_assertio=
ns/1.4.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/priori=
ty-queue/2.1.0" target=3D"_blank" rel=3D"noreferrer">crates.io/priority-que=
ue/2.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/proc-m=
acro2/1.0.86" target=3D"_blank" rel=3D"noreferrer">crates.io/proc-macro2/1.=
0.86</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ptr_meta/0=
.3.0" target=3D"_blank" rel=3D"noreferrer">crates.io/ptr_meta/0.3.0</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ptr_meta_derive/0.3.0"=
 target=3D"_blank" rel=3D"noreferrer">crates.io/ptr_meta_derive/0.3.0</a> \=
<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/quinn/0.11.5" target=
=3D"_blank" rel=3D"noreferrer">crates.io/quinn/0.11.5</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/quinn-proto/0.11.8" target=3D"_blank=
" rel=3D"noreferrer">crates.io/quinn-proto/0.11.8</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/quinn-udp/0.5.5" target=3D"_blank" rel=
=3D"noreferrer">crates.io/quinn-udp/0.5.5</a> \<br>+ =C2=A0 =C2=A0crate://<=
a href=3D"http://crates.io/quote/1.0.37" target=3D"_blank" rel=3D"noreferre=
r">crates.io/quote/1.0.37</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/quoted_printable/0.5.1" target=3D"_blank" rel=3D"noreferrer">cra=
tes.io/quoted_printable/0.5.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/rancor/0.1.0" target=3D"_blank" rel=3D"noreferrer">crates.io=
/rancor/0.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/r=
and/0.8.5" target=3D"_blank" rel=3D"noreferrer">crates.io/rand/0.8.5</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rand_chacha/0.3.1" ta=
rget=3D"_blank" rel=3D"noreferrer">crates.io/rand_chacha/0.3.1</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rand_core/0.6.4" target=3D=
"_blank" rel=3D"noreferrer">crates.io/rand_core/0.6.4</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/rayon/1.10.0" target=3D"_blank" rel=
=3D"noreferrer">crates.io/rayon/1.10.0</a> \<br>+ =C2=A0 =C2=A0crate://<a h=
ref=3D"http://crates.io/rayon-core/1.12.1" target=3D"_blank" rel=3D"norefer=
rer">crates.io/rayon-core/1.12.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D=
"http://crates.io/rctree/0.5.0" target=3D"_blank" rel=3D"noreferrer">crates=
.io/rctree/0.5.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/redox_syscall/0.2.16" target=3D"_blank" rel=3D"noreferrer">crates.io/redo=
x_syscall/0.2.16</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.i=
o/redox_syscall/0.3.5" target=3D"_blank" rel=3D"noreferrer">crates.io/redox=
_syscall/0.3.5</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/=
redox_syscall/0.5.4" target=3D"_blank" rel=3D"noreferrer">crates.io/redox_s=
yscall/0.5.4</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/re=
dox_users/0.4.6" target=3D"_blank" rel=3D"noreferrer">crates.io/redox_users=
/0.4.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/reflink-=
copy/0.1.19" target=3D"_blank" rel=3D"noreferrer">crates.io/reflink-copy/0.=
1.19</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex/1.11=
.0" target=3D"_blank" rel=3D"noreferrer">crates.io/regex/1.11.0</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex-automata/0.1.10" tar=
get=3D"_blank" rel=3D"noreferrer">crates.io/regex-automata/0.1.10</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex-automata/0.4.8" ta=
rget=3D"_blank" rel=3D"noreferrer">crates.io/regex-automata/0.4.8</a> \<br>=
+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex-syntax/0.6.29" tar=
get=3D"_blank" rel=3D"noreferrer">crates.io/regex-syntax/0.6.29</a> \<br>+ =
=C2=A0 =C2=A0crate://<a href=3D"http://crates.io/regex-syntax/0.8.5" target=
=3D"_blank" rel=3D"noreferrer">crates.io/regex-syntax/0.8.5</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/rend/0.5.1" target=3D"_blank"=
 rel=3D"noreferrer">crates.io/rend/0.5.1</a> \<br>+ =C2=A0 =C2=A0crate://<a=
 href=3D"http://crates.io/reqwest/0.12.7" target=3D"_blank" rel=3D"noreferr=
er">crates.io/reqwest/0.12.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"htt=
p://crates.io/resvg/0.29.0" target=3D"_blank" rel=3D"noreferrer">crates.io/=
resvg/0.29.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/re=
try-policies/0.4.0" target=3D"_blank" rel=3D"noreferrer">crates.io/retry-po=
licies/0.4.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rg=
b/0.8.50" target=3D"_blank" rel=3D"noreferrer">crates.io/rgb/0.8.50</a> \<b=
r>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/ring/0.17.8" target=3D=
"_blank" rel=3D"noreferrer">crates.io/ring/0.17.8</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/rkyv/0.8.8" target=3D"_blank" rel=3D"nor=
eferrer">crates.io/rkyv/0.8.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"ht=
tp://crates.io/rkyv_derive/0.8.8" target=3D"_blank" rel=3D"noreferrer">crat=
es.io/rkyv_derive/0.8.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://c=
rates.io/rmp/0.8.14" target=3D"_blank" rel=3D"noreferrer">crates.io/rmp/0.8=
.14</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rmp-serde/1=
.3.0" target=3D"_blank" rel=3D"noreferrer">crates.io/rmp-serde/1.3.0</a> \<=
br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rosvgtree/0.1.0" targ=
et=3D"_blank" rel=3D"noreferrer">crates.io/rosvgtree/0.1.0</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/roxmltree/0.18.1" target=3D"_=
blank" rel=3D"noreferrer">crates.io/roxmltree/0.18.1</a> \<br>+ =C2=A0 =C2=
=A0crate://<a href=3D"http://crates.io/roxmltree/0.20.0" target=3D"_blank" =
rel=3D"noreferrer">crates.io/roxmltree/0.20.0</a> \<br>+ =C2=A0 =C2=A0crate=
://<a href=3D"http://crates.io/rust-netrc/0.1.1" target=3D"_blank" rel=3D"n=
oreferrer">crates.io/rust-netrc/0.1.1</a> \<br>+ =C2=A0 =C2=A0crate://<a hr=
ef=3D"http://crates.io/rustc-demangle/0.1.24" target=3D"_blank" rel=3D"nore=
ferrer">crates.io/rustc-demangle/0.1.24</a> \<br>+ =C2=A0 =C2=A0crate://<a =
href=3D"http://crates.io/rustc-hash/2.0.0" target=3D"_blank" rel=3D"norefer=
rer">crates.io/rustc-hash/2.0.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/rustix/0.38.37" target=3D"_blank" rel=3D"noreferrer">crate=
s.io/rustix/0.38.37</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crate=
s.io/rustls/0.23.13" target=3D"_blank" rel=3D"noreferrer">crates.io/rustls/=
0.23.13</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rustls-=
native-certs/0.7.3" target=3D"_blank" rel=3D"noreferrer">crates.io/rustls-n=
ative-certs/0.7.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.=
io/rustls-native-certs/0.8.0" target=3D"_blank" rel=3D"noreferrer">crates.i=
o/rustls-native-certs/0.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/rustls-pemfile/2.1.3" target=3D"_blank" rel=3D"noreferrer">cra=
tes.io/rustls-pemfile/2.1.3</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http=
://crates.io/rustls-pki-types/1.8.0" target=3D"_blank" rel=3D"noreferrer">c=
rates.io/rustls-pki-types/1.8.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/rustls-webpki/0.102.8" target=3D"_blank" rel=3D"noreferrer=
">crates.io/rustls-webpki/0.102.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/rustybuzz/0.7.0" target=3D"_blank" rel=3D"noreferrer">=
crates.io/rustybuzz/0.7.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http:/=
/crates.io/ryu/1.0.18" target=3D"_blank" rel=3D"noreferrer">crates.io/ryu/1=
.0.18</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/same-file=
/1.0.6" target=3D"_blank" rel=3D"noreferrer">crates.io/same-file/1.0.6</a> =
\<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/schannel/0.1.24" ta=
rget=3D"_blank" rel=3D"noreferrer">crates.io/schannel/0.1.24</a> \<br>+ =C2=
=A0 =C2=A0crate://<a href=3D"http://crates.io/schemars/0.8.21" target=3D"_b=
lank" rel=3D"noreferrer">crates.io/schemars/0.8.21</a> \<br>+ =C2=A0 =C2=A0=
crate://<a href=3D"http://crates.io/schemars_derive/0.8.21" target=3D"_blan=
k" rel=3D"noreferrer">crates.io/schemars_derive/0.8.21</a> \<br>+ =C2=A0 =
=C2=A0crate://<a href=3D"http://crates.io/scopeguard/1.2.0" target=3D"_blan=
k" rel=3D"noreferrer">crates.io/scopeguard/1.2.0</a> \<br>+ =C2=A0 =C2=A0cr=
ate://<a href=3D"http://crates.io/scroll/0.12.0" target=3D"_blank" rel=3D"n=
oreferrer">crates.io/scroll/0.12.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/scroll_derive/0.12.0" target=3D"_blank" rel=3D"norefer=
rer">crates.io/scroll_derive/0.12.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/seahash/4.1.0" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/seahash/4.1.0</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/security-framework/2.11.1" target=3D"_blank" rel=3D"noreferrer">crat=
es.io/security-framework/2.11.1</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"=
http://crates.io/security-framework-sys/2.11.1" target=3D"_blank" rel=3D"no=
referrer">crates.io/security-framework-sys/2.11.1</a> \<br>+ =C2=A0 =C2=A0c=
rate://<a href=3D"http://crates.io/semver/1.0.23" target=3D"_blank" rel=3D"=
noreferrer">crates.io/semver/1.0.23</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/serde/1.0.210" target=3D"_blank" rel=3D"noreferrer">cr=
ates.io/serde/1.0.210</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/serde-untagged/0.1.6" target=3D"_blank" rel=3D"noreferrer">crates.io=
/serde-untagged/0.1.6</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/serde_derive/1.0.210" target=3D"_blank" rel=3D"noreferrer">crates.io=
/serde_derive/1.0.210</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/serde_derive_internals/0.29.1" target=3D"_blank" rel=3D"noreferrer">=
crates.io/serde_derive_internals/0.29.1</a> \<br>+ =C2=A0 =C2=A0crate://<a =
href=3D"http://crates.io/serde_json/1.0.128" target=3D"_blank" rel=3D"noref=
errer">crates.io/serde_json/1.0.128</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/serde_spanned/0.6.7" target=3D"_blank" rel=3D"noreferr=
er">crates.io/serde_spanned/0.6.7</a> \<br>+ =C2=A0 =C2=A0crate://<a href=
=3D"http://crates.io/serde_urlencoded/0.7.1" target=3D"_blank" rel=3D"noref=
errer">crates.io/serde_urlencoded/0.7.1</a> \<br>+ =C2=A0 =C2=A0crate://<a =
href=3D"http://crates.io/sha2/0.10.8" target=3D"_blank" rel=3D"noreferrer">=
crates.io/sha2/0.10.8</a> \<br>+ =C2=A0 =C2=A0crate://<a href=3D"http://cra=
tes.io/sharded-slab/0.1.7" target=3D"_blank" rel=3D"noreferrer">crates.io/s=
harded-slab/0</a></blockquote></blockquote></div></div></blockquote></div>

--000000000000b27e89062412a758--

