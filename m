Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FC3C79F89
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 03:02:27 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1654.1788577338203307538
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 20:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XeYVKlWZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-86e7f44b773so19970357b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 20:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788577337; cv=none;
        d=google.com; s=arc-20260327;
        b=qq35MMdp5VgEQ+RqrjjZHtFYHDMgck/dSBCh7XrlIqnlF0DYSLJA4+fwsP2WP/0ZAh
         DKRYSgm+S59irLmsq1H6uU0hczQb1AkXjlY48HMWkJgaaEmAtgVb3c2LQa0p73hCbFTI
         7boDIb09ameleCk78aMbnEweN/zA9LW7O5svv0jeQO5FAVVMe7V2MafxgBliosv8KEtG
         FGnHYfRMTTLw7kFDuqzKMbzbq+iEYv/tDcJECc9o8C/fXx0CQYM0Gnq3shy78K3RiT/w
         PCaGKwgcH9S9SM0T0YoqMqR4FLtsgNBfZ4IbKbbEwX9wWf69sfy2W0KMl7Jjj1eibPgY
         GDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dcks49vSas3mzsU8588wjvJTkg+4LajELPpU41QKVDc=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=kPHaKns1V8Ovbdx3b/kO+7rq3AkXzys8l9Rgc4NZVV22yuhx7r/nkZ8SqojNNzDETq
         X/tmgY8YXrm7heC+WtXUuSaJ47+DtaX3oviaWtBXc/gxK/7mcCo8nFDrFlaaqYH2gHS9
         3utQG+ujfnMAtG4BDLORiTwNMQMbqmFSgLMF8oe1fx2Apb8eRCAkyPxAPiQUbNDMaBGh
         WqTgCk0W2nIVaq7DFUcFeGjJ1hOu3uRZITlzAb3zhYQ4c6t3FesRYyPFjrlyI53lP+HS
         LF4qfbs4FU6ZCb/8uNTmKn4vV7GajZdFc+C3Ed2ube+JhiWoCjEVJ/ha2fd0NpWLUpMp
         KEvQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577337; x=1789182137; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dcks49vSas3mzsU8588wjvJTkg+4LajELPpU41QKVDc=;
        b=XeYVKlWZxTKbzc/Tc308nCS60lH+XjqH8bstU3gyaQNzQltvGBinKIAtUoxeFmggc3
         dNUg8Sk4+OPRCFl3OvFRdJJSTxtl28w7HCye7ZLme0gNtJ2MBMYK4JkxKhKxOlAqftEf
         xt282nMeKnNlnL/LJ+MNg5s2oRUfgv0IeL0qRiOx7Gtj6IbHmJZT2V1Ly49SCq60j6EK
         KVqdotOH9tmlHvdMRPBpBTZKQgNSVi41FGokvze+WdK0HY1SU1OAE4LrEaMVqSxTDhjB
         g5qRUjFr4pLLMhQs/A2LWViYNaFforfN6aUwQ0MLrTVFM1D2qQ83NDJ9aKX+eV1fuOEA
         norA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577337; x=1789182137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dcks49vSas3mzsU8588wjvJTkg+4LajELPpU41QKVDc=;
        b=A6y4yP+j/8puKu2HpPdag0CraYSQ31iBh4gw/sQJqxNdLHz0nd366zwUa3wqLdUUGI
         x/nQRgauWWjlrN9oilXev5bd2V6ns0p9vktcgYFSjG7qYLYgYsCxVsULHIFA2ChG5iGd
         FhXvCqLcbZRVOPVxgHjl1ftkUfhw4B2HhTuxD49cpNb12QCNBADSJwN2+H2ppGzUxaKX
         KKtFD8bTmg4/ITGRkF4BpzSRDjZ4sLgDN+xgfq7BQeygxWwaj2bN1w48yC4zDf8slNOW
         MQfT+S+JTOcAHF3qGLUtDLraHQcsrL/TVfKJi1LuGNM44TQEe6pztp6lHTyIT1uWpZbu
         OT7Q==
X-Gm-Message-State: AFuF++lxqaexI4rB7Yro+jFigh+nawNWiym7gBzXnIMpuoD55ofSbPTf
	yeLQdOzijhgInFAHVL3U9NfzGCsep60ssKNf0R4jLmi70yN88xJ8F/dNuhiwTrYZYabRqQ/LnKX
	v7O5RQFx8Bqr1XrKF3oOfVZBp3pmlP60=
X-Gm-Gg: AYBFou3Eb/Nq481Fm34FclEQkMZRZ9eRDou8tHCK9TBnYtSKd9tij9lv9MSjZxLGSZ/
	GSiAOviSfT4zHJkPTMU5YFgWc5FiIl7hMBoXYmbMBnIeUP8JuYRmtNENRBDaJ2dLmH/jFp/YlLp
	Y0ru3GIQdsqFttPGeK78omxxBQJWbWSSsYpV0IrQ/6QIJgWlC/04HI6SdvaiPky+NPUaW2EcAJ0
	k1Vdxfx2F7PFsNJAbE9cTk7SL0aa7PuWWuQ+pApU+eY6hYcLrFldjWZxmylaN2YL1wjFyHittj/
	29OBH/LbK2Rg7pVZZM5E6IcGG+LKlyBZ7hS1zXSidpI68T8+B9K43W9GAERpD7BDqcFs5vvKoTd
	WUs1kR4BpGeZdOye3C2se3JZ2Eq7w6xqATGL2CtpctimrXyJXV1RkIXpkf8h/295263VwgPRWKY
	/kQHfabPP1rzN6Qn8XeIXBS+hqT1DrnJ6cMLKShDtA+a797+4NLPZmWXJvLUQrPer/SKIDQ6q36
	yf2eMNSkv+rcA==
X-Received: by 2002:a05:690c:e3c3:b0:873:5ddf:d85f with SMTP id
 00721157ae682-8735ddfd999mr18698867b3.42.1788577336580; Fri, 04 Sep 2026
 20:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260903081916.156273-1-f_l_k@t-online.de>
In-Reply-To: <20260903081916.156273-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Sep 2026 20:01:50 -0700
X-Gm-Features: AcwNN1V9vLepa2xK8QYzLjYkvoVWLFZmdhLLAtILcSvLMnmbvIIm2-emWXlIwCw
Message-ID: <CAMKF1soAYaDQRiTpZk1SAJH3zAVkUd_G3_d3g3S9tSqwQyxe0Q@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/6] glycin: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cce18f065ab39c8b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2026 03:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129775

--000000000000cce18f065ab39c8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing this

stdio: ERROR: Nothing PROVIDES 'libheif' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/reci=
pes-gnome/glycin/
glycin_2.1.5.bb DEPENDS on or otherwise requires it)

On Thu, Sep 3, 2026 at 1:19=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gnome/glycin/glycin-crates.inc    | 612 ++++++++++++++++++
>  ...oss-compilation-via-a-rust_target-cr.patch |  97 +++
>  ...argo-artifacts-from-the-per-target-s.patch |  31 +
>  .../recipes-gnome/glycin/glycin_2.1.5.bb      | 106 +++
>  4 files changed, 846 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/glycin/glycin-crates.inc
>  create mode 100644
> meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cross-compilati=
on-via-a-rust_target-cr.patch
>  create mode 100644
> meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-cargo-artifact=
s-from-the-per-target-s.patch
>  create mode 100644 meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
>
> diff --git a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
> b/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
> new file mode 100644
> index 0000000000..b1a982eff2
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
> @@ -0,0 +1,612 @@
> +# Autogenerated with 'bitbake -c update_crates glycin'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/adler2/2.0.1 \
> +    crate://crates.io/ahash/0.8.12 \
> +    crate://crates.io/aho-corasick/1.1.4 \
> +    crate://crates.io/allocator-api2/0.2.21 \
> +    crate://crates.io/android_system_properties/0.1.5 \
> +    crate://crates.io/anyhow/1.0.102 \
> +    crate://crates.io/approx/0.5.1 \
> +    crate://crates.io/async-broadcast/0.7.2 \
> +    crate://crates.io/async-channel/2.5.0 \
> +    crate://crates.io/async-executor/1.14.0 \
> +    crate://crates.io/async-fs/2.2.0 \
> +    crate://crates.io/async-global-executor/3.1.0 \
> +    crate://crates.io/async-io/2.6.0 \
> +    crate://crates.io/async-lock/3.4.2 \
> +    crate://crates.io/async-process/2.5.0 \
> +    crate://crates.io/async-recursion/1.1.1 \
> +    crate://crates.io/async-signal/0.2.13 \
> +    crate://crates.io/async-task/4.7.1 \
> +    crate://crates.io/async-trait/0.1.89 \
> +    crate://crates.io/atomic-waker/1.1.2 \
> +    crate://crates.io/autocfg/1.5.0 \
> +    crate://crates.io/bit_field/0.10.3 \
> +    crate://crates.io/bitflags/2.11.0 \
> +    crate://crates.io/bitreader/0.3.11 \
> +    crate://crates.io/blocking/1.6.2 \
> +    crate://crates.io/bon/3.9.0 \
> +    crate://crates.io/bon-macros/3.9.0 \
> +    crate://crates.io/bumpalo/3.20.2 \
> +    crate://crates.io/bytemuck/1.25.0 \
> +    crate://crates.io/byteorder/1.5.0 \
> +    crate://crates.io/byteorder-lite/0.1.0 \
> +    crate://crates.io/bytes/1.11.1 \
> +    crate://crates.io/cairo-rs/0.22.0 \
> +    crate://crates.io/cairo-sys-rs/0.22.0 \
> +    crate://crates.io/cc/1.2.56 \
> +    crate://crates.io/cfg-expr/0.20.7 \
> +    crate://crates.io/cfg-if/1.0.4 \
> +    crate://crates.io/cfg_aliases/0.2.1 \
> +    crate://crates.io/chrono/0.4.44 \
> +    crate://crates.io/color_quant/1.1.0 \
> +    crate://crates.io/concurrent-queue/2.5.0 \
> +    crate://crates.io/core-foundation-sys/0.8.7 \
> +    crate://crates.io/crc32fast/1.5.0 \
> +    crate://crates.io/crossbeam-deque/0.8.6 \
> +    crate://crates.io/crossbeam-epoch/0.9.18 \
> +    crate://crates.io/crossbeam-utils/0.8.21 \
> +    crate://crates.io/crunchy/0.2.4 \
> +    crate://crates.io/darling/0.23.0 \
> +    crate://crates.io/darling_core/0.23.0 \
> +    crate://crates.io/darling_macro/0.23.0 \
> +    crate://crates.io/dlib/0.5.3 \
> +    crate://crates.io/dunce/1.0.5 \
> +    crate://crates.io/either/1.15.0 \
> +    crate://crates.io/encoding_rs/0.8.35 \
> +    crate://crates.io/endi/1.1.1 \
> +    crate://crates.io/enumflags2/0.7.12 \
> +    crate://crates.io/enumflags2_derive/0.7.12 \
> +    crate://crates.io/enumn/0.1.14 \
> +    crate://crates.io/env_filter/1.0.0 \
> +    crate://crates.io/env_logger/0.11.9 \
> +    crate://crates.io/equivalent/1.0.2 \
> +    crate://crates.io/errno/0.3.14 \
> +    crate://crates.io/event-listener/5.4.1 \
> +    crate://crates.io/event-listener-strategy/0.5.4 \
> +    crate://crates.io/exr/1.74.0 \
> +    crate://crates.io/fallible_collections/0.5.1 \
> +    crate://crates.io/fastrand/2.3.0 \
> +    crate://crates.io/fax/0.2.6 \
> +    crate://crates.io/fax_derive/0.2.0 \
> +    crate://crates.io/fdeflate/0.3.7 \
> +    crate://crates.io/fearless_simd/0.3.0 \
> +    crate://crates.io/find-msvc-tools/0.1.9 \
> +    crate://crates.io/flate2/1.1.9 \
> +    crate://crates.io/foldhash/0.1.5 \
> +    crate://crates.io/foreign-types/0.5.0 \
> +    crate://crates.io/foreign-types-macros/0.2.3 \
> +    crate://crates.io/foreign-types-shared/0.3.1 \
> +    crate://crates.io/four-cc/0.4.0 \
> +    crate://crates.io/futures-channel/0.3.32 \
> +    crate://crates.io/futures-core/0.3.32 \
> +    crate://crates.io/futures-executor/0.3.32 \
> +    crate://crates.io/futures-io/0.3.32 \
> +    crate://crates.io/futures-lite/2.6.1 \
> +    crate://crates.io/futures-macro/0.3.32 \
> +    crate://crates.io/futures-task/0.3.32 \
> +    crate://crates.io/futures-timer/3.0.3 \
> +    crate://crates.io/futures-util/0.3.32 \
> +    crate://crates.io/gdk-pixbuf/0.22.0 \
> +    crate://crates.io/gdk-pixbuf-sys/0.22.0 \
> +    crate://crates.io/gdk4/0.11.0 \
> +    crate://crates.io/gdk4-sys/0.11.0 \
> +    crate://crates.io/getopts/0.2.24 \
> +    crate://crates.io/getrandom/0.3.4 \
> +    crate://crates.io/getrandom/0.4.1 \
> +    crate://crates.io/gif/0.14.1 \
> +    crate://crates.io/gio/0.22.2 \
> +    crate://crates.io/gio-sys/0.22.0 \
> +    crate://crates.io/gio-unix/0.22.0 \
> +    crate://crates.io/gio-unix-sys/0.22.0 \
> +    crate://crates.io/glib/0.22.2 \
> +    crate://crates.io/glib-macros/0.22.2 \
> +    crate://crates.io/glib-sys/0.22.0 \
> +    crate://crates.io/gobject-sys/0.22.0 \
> +    crate://crates.io/gufo/0.4.1 \
> +    crate://crates.io/gufo-common/1.1.0 \
> +    crate://crates.io/gufo-exif/0.4.0 \
> +    crate://crates.io/gufo-jpeg/0.4.0 \
> +    crate://crates.io/gufo-png/0.4.1 \
> +    crate://crates.io/gufo-tiff/0.4.0 \
> +    crate://crates.io/gufo-webp/0.4.0 \
> +    crate://crates.io/gufo-xmp/0.4.0 \
> +    crate://crates.io/half/2.7.1 \
> +    crate://crates.io/hashbrown/0.14.5 \
> +    crate://crates.io/hashbrown/0.15.5 \
> +    crate://crates.io/hashbrown/0.16.1 \
> +    crate://crates.io/hayro-jpeg2000/0.3.4 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/hermit-abi/0.5.2 \
> +    crate://crates.io/hex/0.4.3 \
> +    crate://crates.io/iana-time-zone/0.1.65 \
> +    crate://crates.io/iana-time-zone-haiku/0.1.2 \
> +    crate://crates.io/id-arena/2.3.0 \
> +    crate://crates.io/ident_case/1.0.1 \
> +    crate://crates.io/image/0.25.10 \
> +    crate://crates.io/image-extras/0.1.0 \
> +    crate://crates.io/image-webp/0.2.4 \
> +    crate://crates.io/indexmap/2.13.0 \
> +    crate://crates.io/itoa/1.0.17 \
> +    crate://crates.io/jiff/0.2.23 \
> +    crate://crates.io/jiff-static/0.2.23 \
> +    crate://crates.io/jobserver/0.1.34 \
> +    crate://crates.io/jpeg-decoder/0.3.2 \
> +    crate://crates.io/jpeg-encoder/0.7.0 \
> +    crate://crates.io/jpegxl-rs/0.12.0+libjxl-0.11.1 \
> +    crate://crates.io/jpegxl-sys/0.12.0+libjxl-0.11.1 \
> +    crate://crates.io/js-sys/0.3.91 \
> +    crate://crates.io/lazy_static/1.5.0 \
> +    crate://crates.io/lcms2/6.1.1 \
> +    crate://crates.io/lcms2-sys/4.0.6 \
> +    crate://crates.io/leb128fmt/0.1.0 \
> +    crate://crates.io/lebe/0.5.3 \
> +    crate://crates.io/libc/0.2.183 \
> +    crate://crates.io/libheif-rs/2.7.0 \
> +    crate://crates.io/libheif-sys/5.2.0+1.21.2 \
> +    crate://crates.io/libloading/0.8.9 \
> +    crate://crates.io/libopenraw/0.4.0-alpha.12 \
> +    crate://crates.io/librsvg-rebind/0.3.0 \
> +    crate://crates.io/librsvg-rebind-sys/0.3.0 \
> +    crate://crates.io/libseccomp/0.4.0 \
> +    crate://crates.io/libseccomp-sys/0.3.0 \
> +    crate://crates.io/linux-raw-sys/0.12.1 \
> +    crate://crates.io/log/0.4.29 \
> +    crate://crates.io/matchers/0.2.0 \
> +    crate://crates.io/matrixmultiply/0.3.10 \
> +    crate://crates.io/memchr/2.8.0 \
> +    crate://crates.io/memfd/0.6.5 \
> +    crate://crates.io/memmap2/0.9.11 \
> +    crate://crates.io/memoffset/0.9.1 \
> +    crate://crates.io/miniz_oxide/0.8.9 \
> +    crate://crates.io/miniz_oxide/0.9.0 \
> +    crate://crates.io/mio/1.1.1 \
> +    crate://crates.io/moxcms/0.8.1 \
> +    crate://crates.io/multiversion/0.8.0 \
> +    crate://crates.io/multiversion-macros/0.8.0 \
> +    crate://crates.io/nalgebra/0.33.2 \
> +    crate://crates.io/nalgebra-macros/0.2.2 \
> +    crate://crates.io/nix/0.30.1 \
> +    crate://crates.io/nu-ansi-term/0.50.3 \
> +    crate://crates.io/num-bigint/0.4.6 \
> +    crate://crates.io/num-complex/0.4.6 \
> +    crate://crates.io/num-integer/0.1.46 \
> +    crate://crates.io/num-rational/0.4.2 \
> +    crate://crates.io/num-traits/0.2.19 \
> +    crate://crates.io/num_enum/0.7.5 \
> +    crate://crates.io/num_enum_derive/0.7.5 \
> +    crate://crates.io/once_cell/1.21.3 \
> +    crate://crates.io/ordered-stream/0.2.0 \
> +    crate://crates.io/pango/0.22.0 \
> +    crate://crates.io/pango-sys/0.22.0 \
> +    crate://crates.io/parking/2.2.1 \
> +    crate://crates.io/paste/1.0.15 \
> +    crate://crates.io/pin-project-lite/0.2.17 \
> +    crate://crates.io/piper/0.2.5 \
> +    crate://crates.io/pkg-config/0.3.32 \
> +    crate://crates.io/png/0.18.1 \
> +    crate://crates.io/polling/3.11.0 \
> +    crate://crates.io/portable-atomic/1.13.1 \
> +    crate://crates.io/portable-atomic-util/0.2.5 \
> +    crate://crates.io/prettyplease/0.2.37 \
> +    crate://crates.io/proc-macro-crate/3.4.0 \
> +    crate://crates.io/proc-macro2/1.0.106 \
> +    crate://crates.io/pxfm/0.1.28 \
> +    crate://crates.io/qoi/0.4.1 \
> +    crate://crates.io/quick-error/2.0.1 \
> +    crate://crates.io/quote/1.0.45 \
> +    crate://crates.io/r-efi/5.3.0 \
> +    crate://crates.io/rawpointer/0.2.1 \
> +    crate://crates.io/rayon/1.11.0 \
> +    crate://crates.io/rayon-core/1.13.0 \
> +    crate://crates.io/regex-automata/0.4.14 \
> +    crate://crates.io/regex-syntax/0.8.10 \
> +    crate://crates.io/rmp/0.8.15 \
> +    crate://crates.io/rmp-serde/1.3.1 \
> +    crate://crates.io/rustix/1.1.4 \
> +    crate://crates.io/rustversion/1.0.22 \
> +    crate://crates.io/ryu/1.0.23 \
> +    crate://crates.io/safe-transmute/0.11.3 \
> +    crate://crates.io/safe_arch/0.7.4 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/semver/1.0.27 \
> +    crate://crates.io/serde/1.0.228 \
> +    crate://crates.io/serde_core/1.0.228 \
> +    crate://crates.io/serde_derive/1.0.228 \
> +    crate://crates.io/serde_json/1.0.149 \
> +    crate://crates.io/serde_repr/0.1.20 \
> +    crate://crates.io/serde_spanned/1.0.4 \
> +    crate://crates.io/serde_yaml_ng/0.10.0 \
> +    crate://crates.io/sharded-slab/0.1.7 \
> +    crate://crates.io/shell-words/1.1.1 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/signal-hook-registry/1.4.8 \
> +    crate://crates.io/simba/0.9.1 \
> +    crate://crates.io/simd-adler32/0.3.8 \
> +    crate://crates.io/simple_logger/5.2.0 \
> +    crate://crates.io/slab/0.4.12 \
> +    crate://crates.io/smallvec/1.15.1 \
> +    crate://crates.io/socket2/0.6.3 \
> +    crate://crates.io/static_assertions/1.1.0 \
> +    crate://crates.io/strsim/0.11.1 \
> +    crate://crates.io/syn/2.0.117 \
> +    crate://crates.io/system-deps/7.0.7 \
> +    crate://crates.io/target-features/0.1.6 \
> +    crate://crates.io/target-lexicon/0.13.3 \
> +    crate://crates.io/tempfile/3.26.0 \
> +    crate://crates.io/thiserror/2.0.18 \
> +    crate://crates.io/thiserror-impl/2.0.18 \
> +    crate://crates.io/thread_local/1.1.9 \
> +    crate://crates.io/tiff/0.11.3 \
> +    crate://crates.io/tokio/1.50.0 \
> +    crate://crates.io/tokio-stream/0.1.18 \
> +    crate://crates.io/toml/0.9.12+spec-1.1.0 \
> +    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
> +    crate://crates.io/toml_edit/0.23.10+spec-1.0.0 \
> +    crate://crates.io/toml_parser/1.0.9+spec-1.1.0 \
> +    crate://crates.io/toml_writer/1.0.6+spec-1.1.0 \
> +    crate://crates.io/tracing/0.1.44 \
> +    crate://crates.io/tracing-attributes/0.1.31 \
> +    crate://crates.io/tracing-core/0.1.36 \
> +    crate://crates.io/tracing-log/0.2.0 \
> +    crate://crates.io/tracing-subscriber/0.3.22 \
> +    crate://crates.io/typenum/1.19.0 \
> +    crate://crates.io/uds_windows/1.2.1 \
> +    crate://crates.io/unicode-ident/1.0.24 \
> +    crate://crates.io/unicode-width/0.2.2 \
> +    crate://crates.io/unicode-xid/0.2.6 \
> +    crate://crates.io/unsafe-libyaml/0.2.11 \
> +    crate://crates.io/uuid/1.22.0 \
> +    crate://crates.io/valuable/0.1.1 \
> +    crate://crates.io/vcpkg/0.2.15 \
> +    crate://crates.io/version-compare/0.2.1 \
> +    crate://crates.io/version_check/0.9.5 \
> +    crate://crates.io/walkdir/2.5.0 \
> +    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
> +    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
> +    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
> +    crate://crates.io/wasm-bindgen/0.2.114 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.114 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.114 \
> +    crate://crates.io/wasm-encoder/0.244.0 \
> +    crate://crates.io/wasm-metadata/0.244.0 \
> +    crate://crates.io/wasmparser/0.244.0 \
> +    crate://crates.io/weezl/0.1.12 \
> +    crate://crates.io/wide/0.7.33 \
> +    crate://crates.io/winapi-util/0.1.11 \
> +    crate://crates.io/windows-core/0.62.2 \
> +    crate://crates.io/windows-implement/0.60.2 \
> +    crate://crates.io/windows-interface/0.59.3 \
> +    crate://crates.io/windows-link/0.2.1 \
> +    crate://crates.io/windows-result/0.4.1 \
> +    crate://crates.io/windows-strings/0.5.1 \
> +    crate://crates.io/windows-sys/0.61.2 \
> +    crate://crates.io/winnow/0.7.15 \
> +    crate://crates.io/wit-bindgen/0.51.0 \
> +    crate://crates.io/wit-bindgen-core/0.51.0 \
> +    crate://crates.io/wit-bindgen-rust/0.51.0 \
> +    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
> +    crate://crates.io/wit-component/0.244.0 \
> +    crate://crates.io/wit-parser/0.244.0 \
> +    crate://crates.io/xml-rs/0.8.28 \
> +    crate://crates.io/yeslogic-fontconfig-sys/6.0.0 \
> +    crate://crates.io/zbus/5.14.0 \
> +    crate://crates.io/zbus_macros/5.14.0 \
> +    crate://crates.io/zbus_names/4.3.1 \
> +    crate://crates.io/zerocopy/0.8.42 \
> +    crate://crates.io/zerocopy-derive/0.8.42 \
> +    crate://crates.io/zmij/1.0.21 \
> +    crate://crates.io/zune-core/0.5.1 \
> +    crate://crates.io/zune-inflate/0.2.54 \
> +    crate://crates.io/zune-jpeg/0.5.12 \
> +    crate://crates.io/zvariant/5.10.0 \
> +    crate://crates.io/zvariant_derive/5.10.0 \
> +    crate://crates.io/zvariant_utils/3.3.0 \
> +"
> +
> +SRC_URI[adler2-2.0.1.sha256sum] =3D
> "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
> +SRC_URI[ahash-0.8.12.sha256sum] =3D
> "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
> +SRC_URI[aho-corasick-1.1.4.sha256sum] =3D
> "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
> +SRC_URI[allocator-api2-0.2.21.sha256sum] =3D
> "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
> +SRC_URI[android_system_properties-0.1.5.sha256sum] =3D
> "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
> +SRC_URI[anyhow-1.0.102.sha256sum] =3D
> "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
> +SRC_URI[approx-0.5.1.sha256sum] =3D
> "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
> +SRC_URI[async-broadcast-0.7.2.sha256sum] =3D
> "435a87a52755b8f27fcf321ac4f04b2802e337c8c4872923137471ec39c37532"
> +SRC_URI[async-channel-2.5.0.sha256sum] =3D
> "924ed96dd52d1b75e9c1a3e6275715fd320f5f9439fb5a4a11fa51f4221158d2"
> +SRC_URI[async-executor-1.14.0.sha256sum] =3D
> "c96bf972d85afc50bf5ab8fe2d54d1586b4e0b46c97c50a0c9e71e2f7bcd812a"
> +SRC_URI[async-fs-2.2.0.sha256sum] =3D
> "8034a681df4aed8b8edbd7fbe472401ecf009251c8b40556b304567052e294c5"
> +SRC_URI[async-global-executor-3.1.0.sha256sum] =3D
> "13f937e26114b93193065fd44f507aa2e9169ad0cdabbb996920b1fe1ddea7ba"
> +SRC_URI[async-io-2.6.0.sha256sum] =3D
> "456b8a8feb6f42d237746d4b3e9a178494627745c3c56c6ea55d92ba50d026fc"
> +SRC_URI[async-lock-3.4.2.sha256sum] =3D
> "290f7f2596bd5b78a9fec8088ccd89180d7f9f55b94b0576823bbbdc72ee8311"
> +SRC_URI[async-process-2.5.0.sha256sum] =3D
> "fc50921ec0055cdd8a16de48773bfeec5c972598674347252c0399676be7da75"
> +SRC_URI[async-recursion-1.1.1.sha256sum] =3D
> "3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11"
> +SRC_URI[async-signal-0.2.13.sha256sum] =3D
> "43c070bbf59cd3570b6b2dd54cd772527c7c3620fce8be898406dd3ed6adc64c"
> +SRC_URI[async-task-4.7.1.sha256sum] =3D
> "8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de"
> +SRC_URI[async-trait-0.1.89.sha256sum] =3D
> "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
> +SRC_URI[atomic-waker-1.1.2.sha256sum] =3D
> "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
> +SRC_URI[autocfg-1.5.0.sha256sum] =3D
> "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
> +SRC_URI[bit_field-0.10.3.sha256sum] =3D
> "1e4b40c7323adcfc0a41c4b88143ed58346ff65a288fc144329c5c45e05d70c6"
> +SRC_URI[bitflags-2.11.0.sha256sum] =3D
> "843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af"
> +SRC_URI[bitreader-0.3.11.sha256sum] =3D
> "886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066"
> +SRC_URI[blocking-1.6.2.sha256sum] =3D
> "e83f8d02be6967315521be875afa792a316e28d57b5a2d401897e2a7921b7f21"
> +SRC_URI[bon-3.9.0.sha256sum] =3D
> "2d13a61f2963b88eef9c1be03df65d42f6996dfeac1054870d950fcf66686f83"
> +SRC_URI[bon-macros-3.9.0.sha256sum] =3D
> "d314cc62af2b6b0c65780555abb4d02a03dd3b799cd42419044f0c38d99738c0"
> +SRC_URI[bumpalo-3.20.2.sha256sum] =3D
> "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
> +SRC_URI[bytemuck-1.25.0.sha256sum] =3D
> "c8efb64bd706a16a1bdde310ae86b351e4d21550d98d056f22f8a7f7a2183fec"
> +SRC_URI[byteorder-1.5.0.sha256sum] =3D
> "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
> +SRC_URI[byteorder-lite-0.1.0.sha256sum] =3D
> "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
> +SRC_URI[bytes-1.11.1.sha256sum] =3D
> "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
> +SRC_URI[cairo-rs-0.22.0.sha256sum] =3D
> "5cc8d9aa793480744cd9a0524fef1a2e197d9eaa0f739cde19d16aba530dcb95"
> +SRC_URI[cairo-sys-rs-0.22.0.sha256sum] =3D
> "f8b4985713047f5faee02b8db6a6ef32bbb50269ff53c1aee716d1d195b76d54"
> +SRC_URI[cc-1.2.56.sha256sum] =3D
> "aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2"
> +SRC_URI[cfg-expr-0.20.7.sha256sum] =3D
> "3c6b04e07d8080154ed4ac03546d9a2b303cc2fe1901ba0b35b301516e289368"
> +SRC_URI[cfg-if-1.0.4.sha256sum] =3D
> "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D
> "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> +SRC_URI[chrono-0.4.44.sha256sum] =3D
> "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
> +SRC_URI[color_quant-1.1.0.sha256sum] =3D
> "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"
> +SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D
> "4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973"
> +SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D
> "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
> +SRC_URI[crc32fast-1.5.0.sha256sum] =3D
> "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
> +SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D
> "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
> +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D
> "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D
> "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
> +SRC_URI[crunchy-0.2.4.sha256sum] =3D
> "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
> +SRC_URI[darling-0.23.0.sha256sum] =3D
> "25ae13da2f202d56bd7f91c25fba009e7717a1e4a1cc98a76d844b65ae912e9d"
> +SRC_URI[darling_core-0.23.0.sha256sum] =3D
> "9865a50f7c335f53564bb694ef660825eb8610e0a53d3e11bf1b0d3df31e03b0"
> +SRC_URI[darling_macro-0.23.0.sha256sum] =3D
> "ac3984ec7bd6cfa798e62b4a642426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d"
> +SRC_URI[dlib-0.5.3.sha256sum] =3D
> "ab8ecd87370524b461f8557c119c405552c396ed91fc0a8eec68679eab26f94a"
> +SRC_URI[dunce-1.0.5.sha256sum] =3D
> "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
> +SRC_URI[either-1.15.0.sha256sum] =3D
> "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
> +SRC_URI[encoding_rs-0.8.35.sha256sum] =3D
> "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
> +SRC_URI[endi-1.1.1.sha256sum] =3D
> "66b7e2430c6dff6a955451e2cfc438f09cea1965a9d6f87f7e3b90decc014099"
> +SRC_URI[enumflags2-0.7.12.sha256sum] =3D
> "1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef"
> +SRC_URI[enumflags2_derive-0.7.12.sha256sum] =3D
> "67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827"
> +SRC_URI[enumn-0.1.14.sha256sum] =3D
> "2f9ed6b3789237c8a0c1c505af1c7eb2c560df6186f01b098c3a1064ea532f38"
> +SRC_URI[env_filter-1.0.0.sha256sum] =3D
> "7a1c3cc8e57274ec99de65301228b537f1e4eedc1b8e0f9411c6caac8ae7308f"
> +SRC_URI[env_logger-0.11.9.sha256sum] =3D
> "b2daee4ea451f429a58296525ddf28b45a3b64f1acf6587e2067437bb11e218d"
> +SRC_URI[equivalent-1.0.2.sha256sum] =3D
> "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
> +SRC_URI[errno-0.3.14.sha256sum] =3D
> "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
> +SRC_URI[event-listener-5.4.1.sha256sum] =3D
> "e13b66accf52311f30a0db42147dadea9850cb48cd070028831ae5f5d4b856ab"
> +SRC_URI[event-listener-strategy-0.5.4.sha256sum] =3D
> "8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93"
> +SRC_URI[exr-1.74.0.sha256sum] =3D
> "4300e043a56aa2cb633c01af81ca8f699a321879a7854d3896a0ba89056363be"
> +SRC_URI[fallible_collections-0.5.1.sha256sum] =3D
> "8b3e85d14d419ba3e1db925519461c0d17a49bdd2d67ea6316fa965ca7acdf74"
> +SRC_URI[fastrand-2.3.0.sha256sum] =3D
> "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
> +SRC_URI[fax-0.2.6.sha256sum] =3D
> "f05de7d48f37cd6730705cbca900770cab77a89f413d23e100ad7fad7795a0ab"
> +SRC_URI[fax_derive-0.2.0.sha256sum] =3D
> "a0aca10fb742cb43f9e7bb8467c91aa9bcb8e3ffbc6a6f7389bb93ffc920577d"
> +SRC_URI[fdeflate-0.3.7.sha256sum] =3D
> "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
> +SRC_URI[fearless_simd-0.3.0.sha256sum] =3D
> "8fb2907d1f08b2b316b9223ced5b0e89d87028ba8deae9764741dba8ff7f3903"
> +SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D
> "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
> +SRC_URI[flate2-1.1.9.sha256sum] =3D
> "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
> +SRC_URI[foldhash-0.1.5.sha256sum] =3D
> "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
> +SRC_URI[foreign-types-0.5.0.sha256sum] =3D
> "d737d9aa519fb7b749cbc3b962edcf310a8dd1f4b67c91c4f83975dbdd17d965"
> +SRC_URI[foreign-types-macros-0.2.3.sha256sum] =3D
> "1a5c6c585bc94aaf2c7b51dd4c2ba22680844aba4c687be581871a6f518c5742"
> +SRC_URI[foreign-types-shared-0.3.1.sha256sum] =3D
> "aa9a19cbb55df58761df49b23516a86d432839add4af60fc256da840f66ed35b"
> +SRC_URI[four-cc-0.4.0.sha256sum] =3D
> "795cbfc56d419a7ce47ccbb7504dd9a5b7c484c083c356e797de08bd988d9629"
> +SRC_URI[futures-channel-0.3.32.sha256sum] =3D
> "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
> +SRC_URI[futures-core-0.3.32.sha256sum] =3D
> "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
> +SRC_URI[futures-executor-0.3.32.sha256sum] =3D
> "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
> +SRC_URI[futures-io-0.3.32.sha256sum] =3D
> "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
> +SRC_URI[futures-lite-2.6.1.sha256sum] =3D
> "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
> +SRC_URI[futures-macro-0.3.32.sha256sum] =3D
> "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
> +SRC_URI[futures-task-0.3.32.sha256sum] =3D
> "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
> +SRC_URI[futures-timer-3.0.3.sha256sum] =3D
> "f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24"
> +SRC_URI[futures-util-0.3.32.sha256sum] =3D
> "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
> +SRC_URI[gdk-pixbuf-0.22.0.sha256sum] =3D
> "25f420376dbee041b2db374ce4573892a36222bb3f6c0c43e24f0d67eae9b646"
> +SRC_URI[gdk-pixbuf-sys-0.22.0.sha256sum] =3D
> "48f31b37b1fc4b48b54f6b91b7ef04c18e00b4585d98359dd7b998774bbd91fb"
> +SRC_URI[gdk4-0.11.0.sha256sum] =3D
> "2e9a95621b043a35e70ea9f6da89e1a471658ee5771258874f000a11f6a9cb89"
> +SRC_URI[gdk4-sys-0.11.0.sha256sum] =3D
> "4d322515677e4a12e10efe7e758743c3e5faa56940237f19ba6890ba8edbbb76"
> +SRC_URI[getopts-0.2.24.sha256sum] =3D
> "cfe4fbac503b8d1f88e6676011885f34b7174f46e59956bba534ba83abded4df"
> +SRC_URI[getrandom-0.3.4.sha256sum] =3D
> "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
> +SRC_URI[getrandom-0.4.1.sha256sum] =3D
> "139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec"
> +SRC_URI[gif-0.14.1.sha256sum] =3D
> "f5df2ba84018d80c213569363bdcd0c64e6933c67fe4c1d60ecf822971a3c35e"
> +SRC_URI[gio-0.22.2.sha256sum] =3D
> "816b6743c46b217aa8fba679095ac6f2162fd53259dc8f186fcdbff9c555db03"
> +SRC_URI[gio-sys-0.22.0.sha256sum] =3D
> "64729ba2772c080448f9f966dba8f4456beeb100d8c28a865ef8a0f2ef4987e1"
> +SRC_URI[gio-unix-0.22.0.sha256sum] =3D
> "69db2f0bb80c9d97c315720c395db76d4649969bce3a130aea6c5c9d757bf80f"
> +SRC_URI[gio-unix-sys-0.22.0.sha256sum] =3D
> "44bab97ce39112040216e268f074645f50b31caeb53af708ab5d7e4e67f0dbfd"
> +SRC_URI[glib-0.22.2.sha256sum] =3D
> "16877c6e619447e0bcb6de326a42a8bd02b36328cfeeda210135425e576efa3d"
> +SRC_URI[glib-macros-0.22.2.sha256sum] =3D
> "bda575994e3689b1bc12f89c3df621ead46ff292623b76b4710a3a5b79be54bb"
> +SRC_URI[glib-sys-0.22.0.sha256sum] =3D
> "48073e3b228419faa80b9b7f7122759d4ab2f44cd52a065fde7ca08f34c03147"
> +SRC_URI[gobject-sys-0.22.0.sha256sum] =3D
> "18eda93f09d3778f38255b231b17ef67195013a592c91624a4daf8bead875565"
> +SRC_URI[gufo-0.4.1.sha256sum] =3D
> "99a86855fe55303654418ebd8b07312057a32b5887fb768a38170fd54ed944db"
> +SRC_URI[gufo-common-1.1.0.sha256sum] =3D
> "9f23bc0d0e791259ce4fe703c4d988c64317e33477bc4d1d7526ab8eb9fcaab6"
> +SRC_URI[gufo-exif-0.4.0.sha256sum] =3D
> "ad61fccc591119491879e7bee63ebbfbd27811b35367b4728a857119fde78843"
> +SRC_URI[gufo-jpeg-0.4.0.sha256sum] =3D
> "5606b919ea2538d6e761781be87eaf5186427c3d64849c1013359aa3681e68d2"
> +SRC_URI[gufo-png-0.4.1.sha256sum] =3D
> "aa9d6a919b2c9f4b5f344bf0e2991b08b23ab69ab336b65195657a6c624fb8a5"
> +SRC_URI[gufo-tiff-0.4.0.sha256sum] =3D
> "51743619d12e8ead9fdd3cdd2ad3d0ed994a538542857f5115d74d6547a0083b"
> +SRC_URI[gufo-webp-0.4.0.sha256sum] =3D
> "218ea90042f1766b38b487dfbb261b6f21636e5cfd570e1ac6709119dae92fe2"
> +SRC_URI[gufo-xmp-0.4.0.sha256sum] =3D
> "020d604dbaf16f257f9d8bf7c1109551089be459ad8dc54c4205d28fe1688399"
> +SRC_URI[half-2.7.1.sha256sum] =3D
> "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
> +SRC_URI[hashbrown-0.14.5.sha256sum] =3D
> "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
> +SRC_URI[hashbrown-0.15.5.sha256sum] =3D
> "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
> +SRC_URI[hashbrown-0.16.1.sha256sum] =3D
> "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
> +SRC_URI[hayro-jpeg2000-0.3.4.sha256sum] =3D
> "c1a74cfc18c0093ef8009a0d6c1ba3024df0cce228503a14c1372e1e23eed43e"
> +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[hermit-abi-0.5.2.sha256sum] =3D
> "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
> +SRC_URI[hex-0.4.3.sha256sum] =3D
> "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
> +SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D
> "e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
> +SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D
> "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
> +SRC_URI[id-arena-2.3.0.sha256sum] =3D
> "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
> +SRC_URI[ident_case-1.0.1.sha256sum] =3D
> "b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39"
> +SRC_URI[image-0.25.10.sha256sum] =3D
> "85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104"
> +SRC_URI[image-extras-0.1.0.sha256sum] =3D
> "86d29ba92ef6970a2685cc758b455d190842b8b9e96c865ffd31cdb9954b7548"
> +SRC_URI[image-webp-0.2.4.sha256sum] =3D
> "525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3"
> +SRC_URI[indexmap-2.13.0.sha256sum] =3D
> "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
> +SRC_URI[itoa-1.0.17.sha256sum] =3D
> "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
> +SRC_URI[jiff-0.2.23.sha256sum] =3D
> "1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359"
> +SRC_URI[jiff-static-0.2.23.sha256sum] =3D
> "2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4"
> +SRC_URI[jobserver-0.1.34.sha256sum] =3D
> "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
> +SRC_URI[jpeg-decoder-0.3.2.sha256sum] =3D
> "00810f1d8b74be64b13dbf3db89ac67740615d6c891f0e7b6179326533011a07"
> +SRC_URI[jpeg-encoder-0.7.0.sha256sum] =3D
> "0b0b36cbb4e6704f12f5b5d7b01dac593982c6550859ebd5a66fb15c9ea27fd5"
> +SRC_URI[jpegxl-rs-0.12.0+libjxl-0.11.1.sha256sum] =3D
> "4bc73de4d7188a80badb62062780510e402a17947f663e50f6390ebb6e7b90ed"
> +SRC_URI[jpegxl-sys-0.12.0+libjxl-0.11.1.sha256sum] =3D
> "d07cb5b362c69ced9ebfcdb3301dc6cadf7d186a3e6a3d8f4fcb9094a83ab408"
> +SRC_URI[js-sys-0.3.91.sha256sum] =3D
> "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
> +SRC_URI[lazy_static-1.5.0.sha256sum] =3D
> "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
> +SRC_URI[lcms2-6.1.1.sha256sum] =3D
> "b75877b724685dd49310bdbadbf973fc69b1d01992a6d4a861b928fc3943f87b"
> +SRC_URI[lcms2-sys-4.0.6.sha256sum] =3D
> "1c2604b23848ca80b2add60f0fb2270fd980e622c25029b6597fa01cfd5f8d5f"
> +SRC_URI[leb128fmt-0.1.0.sha256sum] =3D
> "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
> +SRC_URI[lebe-0.5.3.sha256sum] =3D
> "7a79a3332a6609480d7d0c9eab957bca6b455b91bb84e66d19f5ff66294b85b8"
> +SRC_URI[libc-0.2.183.sha256sum] =3D
> "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
> +SRC_URI[libheif-rs-2.7.0.sha256sum] =3D
> "39c4e7037b43e1431961745e5c4004eedae3735a4fddd687810ff9d70beb9882"
> +SRC_URI[libheif-sys-5.2.0+1.21.2.sha256sum] =3D
> "107c0d813a0cf5ddf7af2c58a60611f18efdb2830e84d9b37580fb20e6e27a2b"
> +SRC_URI[libloading-0.8.9.sha256sum] =3D
> "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
> +SRC_URI[libopenraw-0.4.0-alpha.12.sha256sum] =3D
> "cb7af949edc773f32dd45ff5a0692860b619b03d2fa3741c1db1acfd1db3a553"
> +SRC_URI[librsvg-rebind-0.3.0.sha256sum] =3D
> "8e29b54b27b49901092b20ef1177d42a068beec0ce5f3344a664118d586d2443"
> +SRC_URI[librsvg-rebind-sys-0.3.0.sha256sum] =3D
> "4ab4a782ee37dfa57e9f03a169cc7ea652d20164e9e023f3df355d5d8b4e6c34"
> +SRC_URI[libseccomp-0.4.0.sha256sum] =3D
> "0e5310a2c5b6ffbc094b5f70a2ca7b79ed36ad90e6f90994b166489a1bce3fcc"
> +SRC_URI[libseccomp-sys-0.3.0.sha256sum] =3D
> "60276e2d41bbb68b323e566047a1bfbf952050b157d8b5cdc74c07c1bf4ca3b6"
> +SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D
> "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
> +SRC_URI[log-0.4.29.sha256sum] =3D
> "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
> +SRC_URI[matchers-0.2.0.sha256sum] =3D
> "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
> +SRC_URI[matrixmultiply-0.3.10.sha256sum] =3D
> "a06de3016e9fae57a36fd14dba131fccf49f74b40b7fbdb472f96e361ec71a08"
> +SRC_URI[memchr-2.8.0.sha256sum] =3D
> "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
> +SRC_URI[memfd-0.6.5.sha256sum] =3D
> "ad38eb12aea514a0466ea40a80fd8cc83637065948eb4a426e4aa46261175227"
> +SRC_URI[memmap2-0.9.11.sha256sum] =3D
> "d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0"
> +SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> +SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D
> "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
> +SRC_URI[miniz_oxide-0.9.0.sha256sum] =3D
> "5faa9f23e86bd5768d76def086192ff5f869fb088da12a976ea21e9796b975f6"
> +SRC_URI[mio-1.1.1.sha256sum] =3D
> "a69bcab0ad47271a0234d9422b131806bf3968021e5dc9328caf2d4cd58557fc"
> +SRC_URI[moxcms-0.8.1.sha256sum] =3D
> "bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b"
> +SRC_URI[multiversion-0.8.0.sha256sum] =3D
> "7edb7f0ff51249dfda9ab96b5823695e15a052dc15074c9dbf3d118afaf2c201"
> +SRC_URI[multiversion-macros-0.8.0.sha256sum] =3D
> "b093064383341eb3271f42e381cb8f10a01459478446953953c75d24bd339fc0"
> +SRC_URI[nalgebra-0.33.2.sha256sum] =3D
> "26aecdf64b707efd1310e3544d709c5c0ac61c13756046aaaba41be5c4f66a3b"
> +SRC_URI[nalgebra-macros-0.2.2.sha256sum] =3D
> "254a5372af8fc138e36684761d3c0cdb758a4410e938babcff1c860ce14ddbfc"
> +SRC_URI[nix-0.30.1.sha256sum] =3D
> "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
> +SRC_URI[nu-ansi-term-0.50.3.sha256sum] =3D
> "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
> +SRC_URI[num-bigint-0.4.6.sha256sum] =3D
> "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
> +SRC_URI[num-complex-0.4.6.sha256sum] =3D
> "73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495"
> +SRC_URI[num-integer-0.1.46.sha256sum] =3D
> "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
> +SRC_URI[num-rational-0.4.2.sha256sum] =3D
> "f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824"
> +SRC_URI[num-traits-0.2.19.sha256sum] =3D
> "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
> +SRC_URI[num_enum-0.7.5.sha256sum] =3D
> "b1207a7e20ad57b847bbddc6776b968420d38292bbfe2089accff5e19e82454c"
> +SRC_URI[num_enum_derive-0.7.5.sha256sum] =3D
> "ff32365de1b6743cb203b710788263c44a03de03802daf96092f2da4fe6ba4d7"
> +SRC_URI[once_cell-1.21.3.sha256sum] =3D
> "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
> +SRC_URI[ordered-stream-0.2.0.sha256sum] =3D
> "9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50"
> +SRC_URI[pango-0.22.0.sha256sum] =3D
> "25d8f224eddef627b896d2f7b05725b3faedbd140e0e8343446f0d34f34238ee"
> +SRC_URI[pango-sys-0.22.0.sha256sum] =3D
> "bbd111a20ca90fedf03e09c59783c679c00900f1d8491cca5399f5e33609d5d6"
> +SRC_URI[parking-2.2.1.sha256sum] =3D
> "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
> +SRC_URI[paste-1.0.15.sha256sum] =3D
> "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
> +SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D
> "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
> +SRC_URI[piper-0.2.5.sha256sum] =3D
> "c835479a4443ded371d6c535cbfd8d31ad92c5d23ae9770a61bc155e4992a3c1"
> +SRC_URI[pkg-config-0.3.32.sha256sum] =3D
> "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
> +SRC_URI[png-0.18.1.sha256sum] =3D
> "60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61"
> +SRC_URI[polling-3.11.0.sha256sum] =3D
> "5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218"
> +SRC_URI[portable-atomic-1.13.1.sha256sum] =3D
> "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
> +SRC_URI[portable-atomic-util-0.2.5.sha256sum] =3D
> "7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
> +SRC_URI[prettyplease-0.2.37.sha256sum] =3D
> "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
> +SRC_URI[proc-macro-crate-3.4.0.sha256sum] =3D
> "219cb19e96be00ab2e37d6e299658a0cfa83e52429179969b0f0121b4ac46983"
> +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D
> "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> +SRC_URI[pxfm-0.1.28.sha256sum] =3D
> "b5a041e753da8b807c9255f28de81879c78c876392ff2469cde94799b2896b9d"
> +SRC_URI[qoi-0.4.1.sha256sum] =3D
> "7f6d64c71eb498fe9eae14ce4ec935c555749aef511cca85b5568910d6e48001"
> +SRC_URI[quick-error-2.0.1.sha256sum] =3D
> "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
> +SRC_URI[quote-1.0.45.sha256sum] =3D
> "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
> +SRC_URI[r-efi-5.3.0.sha256sum] =3D
> "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
> +SRC_URI[rawpointer-0.2.1.sha256sum] =3D
> "60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3"
> +SRC_URI[rayon-1.11.0.sha256sum] =3D
> "368f01d005bf8fd9b1206fb6fa653e6c4a81ceb1466406b81792d87c5677a58f"
> +SRC_URI[rayon-core-1.13.0.sha256sum] =3D
> "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
> +SRC_URI[regex-automata-0.4.14.sha256sum] =3D
> "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
> +SRC_URI[regex-syntax-0.8.10.sha256sum] =3D
> "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
> +SRC_URI[rmp-0.8.15.sha256sum] =3D
> "4ba8be72d372b2c9b35542551678538b562e7cf86c3315773cae48dfbfe7790c"
> +SRC_URI[rmp-serde-1.3.1.sha256sum] =3D
> "72f81bee8c8ef9b577d1681a70ebbc962c232461e397b22c208c43c04b67a155"
> +SRC_URI[rustix-1.1.4.sha256sum] =3D
> "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
> +SRC_URI[rustversion-1.0.22.sha256sum] =3D
> "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
> +SRC_URI[ryu-1.0.23.sha256sum] =3D
> "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
> +SRC_URI[safe-transmute-0.11.3.sha256sum] =3D
> "3944826ff8fa8093089aba3acb4ef44b9446a99a16f3bf4e74af3f77d340ab7d"
> +SRC_URI[safe_arch-0.7.4.sha256sum] =3D
> "96b02de82ddbe1b636e6170c21be622223aea188ef2e139be0a5b219ec215323"
> +SRC_URI[same-file-1.0.6.sha256sum] =3D
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> +SRC_URI[semver-1.0.27.sha256sum] =3D
> "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
> +SRC_URI[serde-1.0.228.sha256sum] =3D
> "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
> +SRC_URI[serde_core-1.0.228.sha256sum] =3D
> "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
> +SRC_URI[serde_derive-1.0.228.sha256sum] =3D
> "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
> +SRC_URI[serde_json-1.0.149.sha256sum] =3D
> "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
> +SRC_URI[serde_repr-0.1.20.sha256sum] =3D
> "175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c"
> +SRC_URI[serde_spanned-1.0.4.sha256sum] =3D
> "f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776"
> +SRC_URI[serde_yaml_ng-0.10.0.sha256sum] =3D
> "7b4db627b98b36d4203a7b458cf3573730f2bb591b28871d916dfa9efabfd41f"
> +SRC_URI[sharded-slab-0.1.7.sha256sum] =3D
> "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
> +SRC_URI[shell-words-1.1.1.sha256sum] =3D
> "dc6fe69c597f9c37bfeeeeeb33da3530379845f10be461a66d16d03eca2ded77"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D
> "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
> +SRC_URI[simba-0.9.1.sha256sum] =3D
> "c99284beb21666094ba2b75bbceda012e610f5479dfcc2d6e2426f53197ffd95"
> +SRC_URI[simd-adler32-0.3.8.sha256sum] =3D
> "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1cb8f047f75a8aeaf8da139da2"
> +SRC_URI[simple_logger-5.2.0.sha256sum] =3D
> "c7038d0e96661bf9ce647e1a6f6ef6d6f3663f66d9bf741abf14ba4876071c17"
> +SRC_URI[slab-0.4.12.sha256sum] =3D
> "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
> +SRC_URI[smallvec-1.15.1.sha256sum] =3D
> "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
> +SRC_URI[socket2-0.6.3.sha256sum] =3D
> "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
> +SRC_URI[static_assertions-1.1.0.sha256sum] =3D
> "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> +SRC_URI[strsim-0.11.1.sha256sum] =3D
> "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
> +SRC_URI[syn-2.0.117.sha256sum] =3D
> "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
> +SRC_URI[system-deps-7.0.7.sha256sum] =3D
> "48c8f33736f986f16d69b6cb8b03f55ddcad5c41acc4ccc39dd88e84aa805e7f"
> +SRC_URI[target-features-0.1.6.sha256sum] =3D
> "c1bbb9f3c5c463a01705937a24fdabc5047929ac764b2d5b9cf681c1f5041ed5"
> +SRC_URI[target-lexicon-0.13.3.sha256sum] =3D
> "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
> +SRC_URI[tempfile-3.26.0.sha256sum] =3D
> "82a72c767771b47409d2345987fda8628641887d5466101319899796367354a0"
> +SRC_URI[thiserror-2.0.18.sha256sum] =3D
> "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
> +SRC_URI[thiserror-impl-2.0.18.sha256sum] =3D
> "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
> +SRC_URI[thread_local-1.1.9.sha256sum] =3D
> "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
> +SRC_URI[tiff-0.11.3.sha256sum] =3D
> "b63feaf3343d35b6ca4d50483f94843803b0f51634937cc2ec519fc32232bc52"
> +SRC_URI[tokio-1.50.0.sha256sum] =3D
> "27ad5e34374e03cfffefc301becb44e9dc3c17584f414349ebe29ed26661822d"
> +SRC_URI[tokio-stream-0.1.18.sha256sum] =3D
> "32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70"
> +SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] =3D
> "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
> +SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D
> "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
> +SRC_URI[toml_edit-0.23.10+spec-1.0.0.sha256sum] =3D
> "84c8b9f757e028cee9fa244aea147aab2a9ec09d5325a9b01e0a49730c2b5269"
> +SRC_URI[toml_parser-1.0.9+spec-1.1.0.sha256sum] =3D
> "702d4415e08923e7e1ef96cd5727c0dfed80b4d2fa25db9647fe5eb6f7c5a4c4"
> +SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] =3D
> "ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607"
> +SRC_URI[tracing-0.1.44.sha256sum] =3D
> "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
> +SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D
> "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
> +SRC_URI[tracing-core-0.1.36.sha256sum] =3D
> "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
> +SRC_URI[tracing-log-0.2.0.sha256sum] =3D
> "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
> +SRC_URI[tracing-subscriber-0.3.22.sha256sum] =3D
> "2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
> +SRC_URI[typenum-1.19.0.sha256sum] =3D
> "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
> +SRC_URI[uds_windows-1.2.1.sha256sum] =3D
> "f2f6fb2847f6742cd76af783a2a2c49e9375d0a111c7bef6f71cd9e738c72d6e"
> +SRC_URI[unicode-ident-1.0.24.sha256sum] =3D
> "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
> +SRC_URI[unicode-width-0.2.2.sha256sum] =3D
> "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
> +SRC_URI[unicode-xid-0.2.6.sha256sum] =3D
> "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
> +SRC_URI[unsafe-libyaml-0.2.11.sha256sum] =3D
> "673aac59facbab8a9007c7f6108d11f63b603f7cabff99fabf650fea5c32b861"
> +SRC_URI[uuid-1.22.0.sha256sum] =3D
> "a68d3c8f01c0cfa54a75291d83601161799e4a89a39e0929f4b0354d88757a37"
> +SRC_URI[valuable-0.1.1.sha256sum] =3D
> "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
> +SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> +SRC_URI[version-compare-0.2.1.sha256sum] =3D
> "03c2856837ef78f57382f06b2b8563a2f512f7185d732608fd9176cb3b8edf0e"
> +SRC_URI[version_check-0.9.5.sha256sum] =3D
> "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
> +SRC_URI[walkdir-2.5.0.sha256sum] =3D
> "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
> +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D
> "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> +SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] =3D
> "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
> +SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] =3D
> "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
> +SRC_URI[wasm-bindgen-0.2.114.sha256sum] =3D
> "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
> +SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] =3D
> "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
> +SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] =3D
> "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
> +SRC_URI[wasm-bindgen-shared-0.2.114.sha256sum] =3D
> "75a326b8c223ee17883a4251907455a2431acc2791c98c26279376490c378c16"
> +SRC_URI[wasm-encoder-0.244.0.sha256sum] =3D
> "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
> +SRC_URI[wasm-metadata-0.244.0.sha256sum] =3D
> "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
> +SRC_URI[wasmparser-0.244.0.sha256sum] =3D
> "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
> +SRC_URI[weezl-0.1.12.sha256sum] =3D
> "a28ac98ddc8b9274cb41bb4d9d4d5c425b6020c50c46f25559911905610b4a88"
> +SRC_URI[wide-0.7.33.sha256sum] =3D
> "0ce5da8ecb62bcd8ec8b7ea19f69a51275e91299be594ea5cc6ef7819e16cd03"
> +SRC_URI[winapi-util-0.1.11.sha256sum] =3D
> "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
> +SRC_URI[windows-core-0.62.2.sha256sum] =3D
> "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
> +SRC_URI[windows-implement-0.60.2.sha256sum] =3D
> "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
> +SRC_URI[windows-interface-0.59.3.sha256sum] =3D
> "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
> +SRC_URI[windows-link-0.2.1.sha256sum] =3D
> "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
> +SRC_URI[windows-result-0.4.1.sha256sum] =3D
> "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
> +SRC_URI[windows-strings-0.5.1.sha256sum] =3D
> "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
> +SRC_URI[windows-sys-0.61.2.sha256sum] =3D
> "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
> +SRC_URI[winnow-0.7.15.sha256sum] =3D
> "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
> +SRC_URI[wit-bindgen-0.51.0.sha256sum] =3D
> "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
> +SRC_URI[wit-bindgen-core-0.51.0.sha256sum] =3D
> "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
> +SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] =3D
> "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
> +SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] =3D
> "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
> +SRC_URI[wit-component-0.244.0.sha256sum] =3D
> "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
> +SRC_URI[wit-parser-0.244.0.sha256sum] =3D
> "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
> +SRC_URI[xml-rs-0.8.28.sha256sum] =3D
> "3ae8337f8a065cfc972643663ea4279e04e7256de865aa66fe25cec5fb912d3f"
> +SRC_URI[yeslogic-fontconfig-sys-6.0.0.sha256sum] =3D
> "503a066b4c037c440169d995b869046827dbc71263f6e8f3be6d77d4f3229dbd"
> +SRC_URI[zbus-5.14.0.sha256sum] =3D
> "ca82f95dbd3943a40a53cfded6c2d0a2ca26192011846a1810c4256ef92c60bc"
> +SRC_URI[zbus_macros-5.14.0.sha256sum] =3D
> "897e79616e84aac4b2c46e9132a4f63b93105d54fe8c0e8f6bffc21fa8d49222"
> +SRC_URI[zbus_names-4.3.1.sha256sum] =3D
> "ffd8af6d5b78619bab301ff3c560a5bd22426150253db278f164d6cf3b72c50f"
> +SRC_URI[zerocopy-0.8.42.sha256sum] =3D
> "f2578b716f8a7a858b7f02d5bd870c14bf4ddbbcf3a4c05414ba6503640505e3"
> +SRC_URI[zerocopy-derive-0.8.42.sha256sum] =3D
> "7e6cc098ea4d3bd6246687de65af3f920c430e236bee1e3bf2e441463f08a02f"
> +SRC_URI[zmij-1.0.21.sha256sum] =3D
> "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
> +SRC_URI[zune-core-0.5.1.sha256sum] =3D
> "cb8a0807f7c01457d0379ba880ba6322660448ddebc890ce29bb64da71fb40f9"
> +SRC_URI[zune-inflate-0.2.54.sha256sum] =3D
> "73ab332fe2f6680068f3582b16a24f90ad7096d5d39b974d1c0aff0125116f02"
> +SRC_URI[zune-jpeg-0.5.12.sha256sum] =3D
> "410e9ecef634c709e3831c2cfdb8d9c32164fae1c67496d5b68fff728eec37fe"
> +SRC_URI[zvariant-5.10.0.sha256sum] =3D
> "5708299b21903bbe348e94729f22c49c55d04720a004aa350f1f9c122fd2540b"
> +SRC_URI[zvariant_derive-5.10.0.sha256sum] =3D
> "5b59b012ebe9c46656f9cc08d8da8b4c726510aef12559da3e5f1bf72780752c"
> +SRC_URI[zvariant_utils-3.3.0.sha256sum] =3D
> "f75c23a64ef8f40f13a6989991e643554d9bef1d682a281160cf0c1bc389c5e9"
> diff --git
> a/meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cross-compila=
tion-via-a-rust_target-cr.patch
> b/meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cross-compila=
tion-via-a-rust_target-cr.patch
> new file mode 100644
> index 0000000000..9d14326214
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cross-compila=
tion-via-a-rust_target-cr.patch
> @@ -0,0 +1,97 @@
> +From b4fac7e77a2a88be19fc83b3890711e2e3165859 Mon Sep 17 00:00:00 2001
> +From: Anton Politov <ampernic@inbox.ru>
> +Date: Thu, 18 Jun 2026 14:03:36 +0300
> +Subject: [PATCH] meson: Support cross-compilation via a rust_target cros=
s
> + property
> +
> +cargo was always invoked without --target and the artifact paths assumed
> +the native layout (cargo-target/<profile>/), so the Rust components coul=
d
> +not be cross-compiled. Read the rust target triple from the cross file's
> +[properties] (rust_target); when set, pass it as --target and read the
> +artifacts from the per-target subdirectory cargo writes to. When it is
> +unset the build is unchanged.
> +
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/glycin/-/commit/13b6b060d41aa4cdce3eb878e8=
3c6dd01014e669
> ]
> +---
> + glycin-loaders/meson.build     | 4 ++--
> + glycin-thumbnailer/meson.build | 3 ++-
> + libglycin/meson.build          | 2 +-
> + meson.build                    | 9 +++++++++
> + 4 files changed, 14 insertions(+), 4 deletions(-)
> +
> +diff --git a/glycin-loaders/meson.build b/glycin-loaders/meson.build
> +index 805a646..03db09e 100644
> +--- a/glycin-loaders/meson.build
> ++++ b/glycin-loaders/meson.build
> +@@ -49,7 +49,7 @@ manifest =3D meson.project_source_root() / 'Cargo.toml=
'
> + cargo_options =3D [
> +   '--profile', cargo_profile,
> +   '--manifest-path', manifest,
> +-]
> ++] + cargo_target_args
> +
> + git_version =3D ''
> +
> +@@ -103,7 +103,7 @@ foreach loader : get_option('loaders')
> +     output: loader,
> +     command: [
> +       'cp',
> +-      cargo_target_dir / rust_target / loader,
> ++      cargo_artifact_dir / rust_target / loader,
> +       '@OUTPUT@',
> +     ],
> +   )
> +diff --git a/glycin-thumbnailer/meson.build
> b/glycin-thumbnailer/meson.build
> +index 3e205e3..1580378 100644
> +--- a/glycin-thumbnailer/meson.build
> ++++ b/glycin-thumbnailer/meson.build
> +@@ -21,6 +21,7 @@ cargo_build =3D custom_target(
> +         '--profile', cargo_profile,
> +         '--manifest-path', cargo_manifest,
> +         '--package=3Dglycin-thumbnailer',
> ++        cargo_target_args,
> +     ],
> + )
> +
> +@@ -34,7 +35,7 @@ custom_target(
> +     output: 'glycin-thumbnailer',
> +     command: [
> +         'cp',
> +-        cargo_target_dir / rust_target / 'glycin-thumbnailer',
> ++        cargo_artifact_dir / rust_target / 'glycin-thumbnailer',
> +         '@OUTPUT@',
> +     ],
> + )
> +diff --git a/libglycin/meson.build b/libglycin/meson.build
> +index 12cbd5f..3a2a8b6 100644
> +--- a/libglycin/meson.build
> ++++ b/libglycin/meson.build
> +@@ -17,7 +17,7 @@ cargo_options =3D [
> +     '--target-dir', cargo_target_dir,
> +     '--profile', cargo_profile,
> +     '--manifest-path', manifest,
> +-]
> ++] + cargo_target_args
> +
> + cargo_env_module =3D cargo_env
> +
> +diff --git a/meson.build b/meson.build
> +index bb4a5e4..72d1ae8 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -25,6 +25,15 @@ cargo_target_dir =3D meson.project_build_root() /
> 'cargo-target'
> + cargo_home =3D meson.project_build_root() / 'cargo-home'
> + cargo_manifest =3D meson.project_source_root() / 'Cargo.toml'
> +
> ++cargo_build_target =3D meson.get_external_property('rust_target', '')
> ++if cargo_build_target !=3D ''
> ++  cargo_target_args =3D ['--target', cargo_build_target]
> ++  cargo_artifact_dir =3D cargo_target_dir / cargo_build_target
> ++else
> ++  cargo_target_args =3D []
> ++  cargo_artifact_dir =3D cargo_target_dir
> ++endif
> ++
> + cargo_bin =3D find_program('cargo')
> + crate_version_bin =3D find_program(meson.project_source_root() /
> 'build-aux/crates-version.py')
> +
> diff --git
> a/meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-cargo-artifa=
cts-from-the-per-target-s.patch
> b/meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-cargo-artifa=
cts-from-the-per-target-s.patch
> new file mode 100644
> index 0000000000..5f431e25cf
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-cargo-artifa=
cts-from-the-per-target-s.patch
> @@ -0,0 +1,31 @@
> +From 6fa1351e99a52e9efc8724952275ee51a15afc7e Mon Sep 17 00:00:00 2001
> +From: x <a@b.c>
> +Date: Wed, 2 Sep 2026 19:57:42 +0000
> +Subject: [PATCH] libglycin: Read cargo artifacts from the per-target
> + subdirectory
> +
> +Commit 13b6b06 ("meson: Support cross-compilation via a rust_target cros=
s
> +property") converted the loaders and the thumbnailer to cargo_artifact_d=
ir
> +but left the libglycin shared object path pointing at cargo_target_dir.
> +When --target is passed, cargo writes to cargo-target/<triple>/<profile>=
/
> +and the copy step fails. Upstream fixed this as part of the much larger
> +windows-gnu commit 4d1a505, so only the relevant hunk is taken here.
> +
> +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/glycin/-/commit/4d1a505]
> +---
> + libglycin/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libglycin/meson.build b/libglycin/meson.build
> +index 3a2a8b6..dbadf49 100644
> +--- a/libglycin/meson.build
> ++++ b/libglycin/meson.build
> +@@ -72,7 +72,7 @@ foreach package : packages
> +         endif
> +     endif
> +
> +-    cargo_output =3D cargo_target_dir / rust_target / f'libglycin@suffi=
x@.so'.replace('-',
> '_')
> ++    cargo_output =3D cargo_artifact_dir / rust_target / f'libglycin@suf=
fix@.so'.replace('-',
> '_')
> +
> +     # Build library with Rust
> +     libglycin =3D custom_target(
> diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
> b/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
> new file mode 100644
> index 0000000000..91734e2bf9
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
> @@ -0,0 +1,106 @@
> +SUMMARY =3D "Sandboxed and extendable image decoding"
> +DESCRIPTION =3D "Glycin decodes images in sandboxed subprocesses. It shi=
ps
> a set of \
> +image loaders, the libglycin C library with GObject introspection
> bindings, and a \
> +thumbnailer implementing the freedesktop thumbnail specification."
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/glycin"
> +BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/glycin/-/issues"
> +SECTION =3D "graphics"
> +
> +LICENSE =3D "MPL-2.0 OR LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE-MPL-2.0;md5=3Df75d2927d3c1ed2414ef72048f5ad640 \
> +
> file://LICENSE-LGPL-2.1;md5=3De5dba73410bf27bc90d66e56336c7e2b"
> +
> +
> +inherit cargo_common cargo-update-recipe-crates meson pkgconfig gettext
> gobject-introspection
> +
> +SRC_URI =3D "git://
> gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;branch=3D2.1;tag=3D${P=
V}
> <http://gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;branch=3D2.1;t=
ag=3D$%7BPV%7D>
> \
> +
>  file://0001-meson-Support-cross-compilation-via-a-rust_target-cr.patch \
> +
>  file://0002-libglycin-Read-cargo-artifacts-from-the-per-target-s.patch \
> +           "
> +SRCREV =3D "62c5096eaac2c92dab84c2eb896936d8da3dd9c1"
> +
> +UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/glycin/-/tags"
> +UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
> +
> +require ${BPN}-crates.inc
> +
> +DEPENDS =3D "glib-2.0 glib-2.0-native libseccomp lcms fontconfig"
> +
> +do_write_config:append:class-target() {
> +       cat > ${WORKDIR}/meson-rust.cross <<-EOF
> +       [properties]
> +       rust_target =3D '${RUST_HOST_SYS}'
> +       EOF
> +}
> +
> +EXTRA_OEMESON:append:class-target =3D " --cross-file
> ${WORKDIR}/meson-rust.cross"
> +
> +do_configure:prepend() {
> +       cargo_common_do_configure
> +}
> +
> +
> +do_compile:prepend() {
> +       mkdir -p ${B}/cargo-home
> +       install -m 0644 ${CARGO_HOME}/config.toml
> ${B}/cargo-home/config.toml
> +}
> +
> +
> +EXTRA_OEMESON +=3D "-Dprofile=3Drelease \
> +                  -Dlto=3Dfalse \
> +                  -Dtests=3Dfalse \
> +                  -Dtest_tokio=3Dfalse \
> +                  -Dpython_tests=3Dfalse \
> +                  -Dcapi_docs=3Dfalse \
> +                  "
> +
> +export CARGO_NET_OFFLINE =3D "1"
> +export CARGO_BUILD_JOBS =3D "${@oe.utils.cpu_count()}"
> +export RUSTFLAGS
> +export SYSTEM_DEPS_GLYCIN_2_NO_PKG_CONFIG =3D "1"
> +export SYSTEM_DEPS_GLYCIN_2_LIB =3D "glycin-2"
> +export SYSTEM_DEPS_GLYCIN_2_SEARCH_NATIVE =3D "${B}/libglycin"
> +
> +PACKAGECONFIG ??=3D "libglycin thumbnailer image-rs heif jxl svg \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'gtk4', '', d)}"
> +
> +PACKAGECONFIG[libglycin] =3D "-Dlibglycin=3Dtrue,-Dlibglycin=3Dfalse"
> +PACKAGECONFIG[gtk4] =3D "-Dlibglycin-gtk4=3Dtrue,-Dlibglycin-gtk4=3Dfals=
e,gtk4"
> +PACKAGECONFIG[thumbnailer] =3D
> "-Dglycin-thumbnailer=3Dtrue,-Dglycin-thumbnailer=3Dfalse"
> +PACKAGECONFIG[vapi] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native"
> +PACKAGECONFIG[image-rs] =3D ",,"
> +PACKAGECONFIG[heif] =3D ",,libheif"
> +PACKAGECONFIG[jxl] =3D ",,libjxl"
> +PACKAGECONFIG[raw] =3D ",,"
> +PACKAGECONFIG[svg] =3D ",,librsvg cairo"
> +
> +def glycin_loaders(d):
> +    known =3D (("heif", "glycin-heif"), ("image-rs", "glycin-image-rs"),
> +             ("jxl", "glycin-jxl"), ("raw", "glycin-raw"), ("svg",
> "glycin-svg"))
> +    enabled =3D d.getVar("PACKAGECONFIG").split()
> +    loaders =3D [name for flag, name in known if flag in enabled]
> +    if not loaders:
> +        return "-Dglycin-loaders=3Dfalse"
> +    return "-Dglycin-loaders=3Dtrue -Dloaders=3D" + ",".join(loaders)
> +
> +EXTRA_OEMESON +=3D "${@glycin_loaders(d)}"
> +EXTRA_OEMESON[vardeps] +=3D "PACKAGECONFIG"
> +
> +GLYCIN_COMPAT_VERSION =3D "2+"
> +
> +PACKAGES =3D+ "${PN}-loaders ${PN}-thumbnailer ${PN}-gtk4"
> +
> +FILES:${PN}-loaders =3D "${libexecdir}/glycin-loaders \
> +                       ${datadir}/glycin-loaders \
> +                       "
> +
> +FILES:${PN}-gtk4 =3D "${libdir}/libglycin-gtk4-2.so.* \
> +                    ${libdir}/girepository-1.0/GlyGtk4-2.typelib \
> +                    "
> +FILES:${PN}-thumbnailer =3D "${bindir}/glycin-thumbnailer \
> +                           ${datadir}/thumbnailers \
> +                           "
> +
> +RDEPENDS:${PN}-loaders +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'thumbnailer', '${PN}-thumbnailer', '', d)}"
> +RDEPENDS:${PN}-thumbnailer +=3D "${PN}"
> +
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129704):
> https://lists.openembedded.org/g/openembedded-devel/message/129704
> Mute This Topic: https://lists.openembedded.org/mt/121065945/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cce18f065ab39c8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">seeing this<div><br></div><div>stdio: ERROR: Nothing PROVI=
DES &#39;libheif&#39; (but /srv/pokybuild/yocto-worker/meta-oe/build/meta-o=
penembedded/meta-gnome/recipes-gnome/glycin/<a href=3D"http://glycin_2.1.5.=
bb">glycin_2.1.5.bb</a> DEPENDS on or otherwise requires it)<br></div></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Sep 3, 2026 at 1:19=E2=80=AFAM Markus Volk via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=
=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-on=
line.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-gnome/glycin/glycin-crates.inc=C2=A0 =C2=A0 | 612 +++++++=
+++++++++++<br>
=C2=A0...oss-compilation-via-a-rust_target-cr.patch |=C2=A0 97 +++<br>
=C2=A0...argo-artifacts-from-the-per-target-s.patch |=C2=A0 31 +<br>
=C2=A0.../recipes-gnome/glycin/<a href=3D"http://glycin_2.1.5.bb" rel=3D"no=
referrer" target=3D"_blank">glycin_2.1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 | 106 +=
++<br>
=C2=A04 files changed, 846 insertions(+)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/glycin/glycin-crates.inc<=
br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/glycin/glycin/0001-meson-=
Support-cross-compilation-via-a-rust_target-cr.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/glycin/glycin/0002-libgly=
cin-Read-cargo-artifacts-from-the-per-target-s.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/glycin/<a href=3D"http://=
glycin_2.1.5.bb" rel=3D"noreferrer" target=3D"_blank">glycin_2.1.5.bb</a><b=
r>
<br>
diff --git a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc b/meta-gnome=
/recipes-gnome/glycin/glycin-crates.inc<br>
new file mode 100644<br>
index 0000000000..b1a982eff2<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/glycin/glycin-crates.inc<br>
@@ -0,0 +1,612 @@<br>
+# Autogenerated with &#39;bitbake -c update_crates glycin&#39;<br>
+<br>
+# from Cargo.lock<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/adler2/2.0.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/adler2/2.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ahash/0.8.12" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/ahash/0.8.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/1.1.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/1.1.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/allocator-api2/0.2.21" r=
el=3D"noreferrer" target=3D"_blank">crates.io/allocator-api2/0.2.21</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/android_system_propertie=
s/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/android_system_prop=
erties/0.1.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anyhow/1.0.102" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/anyhow/1.0.102</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/approx/0.5.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/approx/0.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-broadcast/0.7.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/async-broadcast/0.7.2</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-channel/2.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-channel/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-executor/1.14.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/async-executor/1.14.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-fs/2.2.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/async-fs/2.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-global-executor/3.=
1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/async-global-executor/3=
.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-io/2.6.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/async-io/2.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-lock/3.4.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/async-lock/3.4.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-process/2.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-process/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-recursion/1.1.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/async-recursion/1.1.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-signal/0.2.13" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-signal/0.2.13</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-task/4.7.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/async-task/4.7.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-trait/0.1.89" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-trait/0.1.89</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atomic-waker/1.1.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/atomic-waker/1.1.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.5.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bit_field/0.10.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/bit_field/0.10.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.11.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/bitflags/2.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitreader/0.3.11" rel=3D=
"noreferrer" target=3D"_blank">crates.io/bitreader/0.3.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/blocking/1.6.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/blocking/1.6.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bon/3.9.0" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/bon/3.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bon-macros/3.9.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/bon-macros/3.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bumpalo/3.20.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bumpalo/3.20.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bytemuck/1.25.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/bytemuck/1.25.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteorder/1.5.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/byteorder/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteorder-lite/0.1.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/byteorder-lite/0.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bytes/1.11.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/bytes/1.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cairo-rs/0.22.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/cairo-rs/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cairo-sys-rs/0.22.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cairo-sys-rs/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.2.56" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.2.56</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-expr/0.20.7" rel=3D"=
noreferrer" target=3D"_blank">crates.io/cfg-expr/0.20.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.4" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg_aliases/0.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg_aliases/0.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.44" rel=3D"no=
referrer" target=3D"_blank">crates.io/chrono/0.4.44</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/color_quant/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/color_quant/1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/concurrent-queue/2.5.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/concurrent-queue/2.5.0</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/core-foundation-sys/0.8.=
7" rel=3D"noreferrer" target=3D"_blank">crates.io/core-foundation-sys/0.8.7=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crc32fast/1.5.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/crc32fast/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque/0.8.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8.6</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch/0.9.18" =
rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.9.18</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.8.21" =
rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.8.21</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crunchy/0.2.4" rel=3D"no=
referrer" target=3D"_blank">crates.io/crunchy/0.2.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/darling/0.23.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/darling/0.23.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/darling_core/0.23.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/darling_core/0.23.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/darling_macro/0.23.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/darling_macro/0.23.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dlib/0.5.3" rel=3D"noref=
errer" target=3D"_blank">crates.io/dlib/0.5.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dunce/1.0.5" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/dunce/1.0.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/either/1.15.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/either/1.15.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding_rs/0.8.35" rel=
=3D"noreferrer" target=3D"_blank">crates.io/encoding_rs/0.8.35</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/endi/1.1.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/endi/1.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2/0.7.12" rel=
=3D"noreferrer" target=3D"_blank">crates.io/enumflags2/0.7.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2_derive/0.7.12=
" rel=3D"noreferrer" target=3D"_blank">crates.io/enumflags2_derive/0.7.12</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumn/0.1.14" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/enumn/0.1.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/env_filter/1.0.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/env_filter/1.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/env_logger/0.11.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/env_logger/0.11.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/equivalent/1.0.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/equivalent/1.0.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno/0.3.14" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/errno/0.3.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/event-listener/5.4.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/event-listener/5.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/event-listener-strategy/=
0.5.4" rel=3D"noreferrer" target=3D"_blank">crates.io/event-listener-strate=
gy/0.5.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/exr/1.74.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/exr/1.74.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fallible_collections/0.5=
.1" rel=3D"noreferrer" target=3D"_blank">crates.io/fallible_collections/0.5=
.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fastrand/2.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/fastrand/2.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fax/0.2.6" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/fax/0.2.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fax_derive/0.2.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/fax_derive/0.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fdeflate/0.3.7" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/fdeflate/0.3.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fearless_simd/0.3.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/fearless_simd/0.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/find-msvc-tools/0.1.9" r=
el=3D"noreferrer" target=3D"_blank">crates.io/find-msvc-tools/0.1.9</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/flate2/1.1.9" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/flate2/1.1.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foldhash/0.1.5" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/foldhash/0.1.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types/0.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/foreign-types/0.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types-macros/0.2=
.3" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types-macros/0.2=
.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types-shared/0.3=
.1" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types-shared/0.3=
.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/four-cc/0.4.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/four-cc/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-channel/0.3.32" =
rel=3D"noreferrer" target=3D"_blank">crates.io/futures-channel/0.3.32</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-core/0.3.32" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-core/0.3.32</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-executor/0.3.32"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/futures-executor/0.3.32</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-io/0.3.32" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-io/0.3.32</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-lite/2.6.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-lite/2.6.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-macro/0.3.32" re=
l=3D"noreferrer" target=3D"_blank">crates.io/futures-macro/0.3.32</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-task/0.3.32" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-task/0.3.32</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-timer/3.0.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-timer/3.0.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-util/0.3.32" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-util/0.3.32</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gdk-pixbuf/0.22.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/gdk-pixbuf/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gdk-pixbuf-sys/0.22.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/gdk-pixbuf-sys/0.22.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gdk4/0.11.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/gdk4/0.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gdk4-sys/0.11.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/gdk4-sys/0.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getopts/0.2.24" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/getopts/0.2.24</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.3.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/getrandom/0.3.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.4.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/getrandom/0.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gif/0.14.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/gif/0.14.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gio/0.22.2" rel=3D"noref=
errer" target=3D"_blank">crates.io/gio/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gio-sys/0.22.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/gio-sys/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gio-unix/0.22.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/gio-unix/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gio-unix-sys/0.22.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/gio-unix-sys/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/glib/0.22.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/glib/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/glib-macros/0.22.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/glib-macros/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/glib-sys/0.22.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/glib-sys/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gobject-sys/0.22.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/gobject-sys/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo/0.4.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/gufo/0.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo-common/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/gufo-common/1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo-exif/0.4.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/gufo-exif/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo-jpeg/0.4.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/gufo-jpeg/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo-png/0.4.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/gufo-png/0.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo-tiff/0.4.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/gufo-tiff/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo-webp/0.4.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/gufo-webp/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gufo-xmp/0.4.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/gufo-xmp/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/half/2.7.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/half/2.7.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.14.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hashbrown/0.14.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.15.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hashbrown/0.15.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.16.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hashbrown/0.16.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hayro-jpeg2000/0.3.4" re=
l=3D"noreferrer" target=3D"_blank">crates.io/hayro-jpeg2000/0.3.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.5.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hermit-abi/0.5.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hex/0.4.3" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/hex/0.4.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time-zone/0.1.65" r=
el=3D"noreferrer" target=3D"_blank">crates.io/iana-time-zone/0.1.65</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time-zone-haiku/0.1=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/iana-time-zone-haiku/0.1=
.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/id-arena/2.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/id-arena/2.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ident_case/1.0.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/ident_case/1.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/image/0.25.10" rel=3D"no=
referrer" target=3D"_blank">crates.io/image/0.25.10</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/image-extras/0.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/image-extras/0.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/image-webp/0.2.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/image-webp/0.2.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/2.13.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/indexmap/2.13.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.17" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/itoa/1.0.17</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff/0.2.23" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/jiff/0.2.23</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff-static/0.2.23" rel=
=3D"noreferrer" target=3D"_blank">crates.io/jiff-static/0.2.23</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jobserver/0.1.34" rel=3D=
"noreferrer" target=3D"_blank">crates.io/jobserver/0.1.34</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jpeg-decoder/0.3.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/jpeg-decoder/0.3.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jpeg-encoder/0.7.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/jpeg-encoder/0.7.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jpegxl-rs/0.12.0+libjxl-=
0.11.1" rel=3D"noreferrer" target=3D"_blank">crates.io/jpegxl-rs/0.12.0+lib=
jxl-0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jpegxl-sys/0.12.0+libjxl=
-0.11.1" rel=3D"noreferrer" target=3D"_blank">crates.io/jpegxl-sys/0.12.0+l=
ibjxl-0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/js-sys/0.3.91" rel=3D"no=
referrer" target=3D"_blank">crates.io/js-sys/0.3.91</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lcms2/6.1.1" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/lcms2/6.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lcms2-sys/4.0.6" rel=3D"=
noreferrer" target=3D"_blank">crates.io/lcms2-sys/4.0.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/leb128fmt/0.1.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/leb128fmt/0.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lebe/0.5.3" rel=3D"noref=
errer" target=3D"_blank">crates.io/lebe/0.5.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.183" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.183</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libheif-rs/2.7.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/libheif-rs/2.7.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libheif-sys/5.2.0+1.21.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/libheif-sys/5.2.0+1.21.2</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libloading/0.8.9" rel=3D=
"noreferrer" target=3D"_blank">crates.io/libloading/0.8.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libopenraw/0.4.0-alpha.1=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/libopenraw/0.4.0-alpha.12=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/librsvg-rebind/0.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/librsvg-rebind/0.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/librsvg-rebind-sys/0.3.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/librsvg-rebind-sys/0.3.0</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libseccomp/0.4.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/libseccomp/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libseccomp-sys/0.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/libseccomp-sys/0.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/linux-raw-sys/0.12.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/linux-raw-sys/0.12.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.29" rel=3D"noref=
errer" target=3D"_blank">crates.io/log/0.4.29</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/matchers/0.2.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/matchers/0.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/matrixmultiply/0.3.10" r=
el=3D"noreferrer" target=3D"_blank">crates.io/matrixmultiply/0.3.10</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.8.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/memchr/2.8.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memfd/0.6.5" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/memfd/0.6.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memmap2/0.9.11" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/memmap2/0.9.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.9.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/miniz_oxide/0.8.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/miniz_oxide/0.8.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/miniz_oxide/0.9.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/miniz_oxide/0.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/mio/1.1.1" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/mio/1.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/moxcms/0.8.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/moxcms/0.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/multiversion/0.8.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/multiversion/0.8.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/multiversion-macros/0.8.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/multiversion-macros/0.8.0=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nalgebra/0.33.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/nalgebra/0.33.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nalgebra-macros/0.2.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/nalgebra-macros/0.2.2</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nix/0.30.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/nix/0.30.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nu-ansi-term/0.50.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/nu-ansi-term/0.50.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-bigint/0.4.6" rel=3D=
"noreferrer" target=3D"_blank">crates.io/num-bigint/0.4.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-complex/0.4.6" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-complex/0.4.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.46" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.46</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-rational/0.4.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-rational/0.4.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.19" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.19</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_enum/0.7.5" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/num_enum/0.7.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_enum_derive/0.7.5" r=
el=3D"noreferrer" target=3D"_blank">crates.io/num_enum_derive/0.7.5</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.21.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.21.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ordered-stream/0.2.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/ordered-stream/0.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pango/0.22.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/pango/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pango-sys/0.22.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/pango-sys/0.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking/2.2.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/parking/2.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste/1.0.15" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/paste/1.0.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pin-project-lite/0.2.17"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pin-project-lite/0.2.17</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/piper/0.2.5" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/piper/0.2.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.32" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.32</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/png/0.18.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/png/0.18.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/polling/3.11.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/polling/3.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.13.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.13.1</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic-util/0.2=
.5" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic-util/0.2=
.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/prettyplease/0.2.37" rel=
=3D"noreferrer" target=3D"_blank">crates.io/prettyplease/0.2.37</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-crate/3.4.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-crate/3.4.0</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.106" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.106</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pxfm/0.1.28" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pxfm/0.1.28</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/qoi/0.4.1" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/qoi/0.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quick-error/2.0.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quick-error/2.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.45" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.45</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r-efi/5.3.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/r-efi/5.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rawpointer/0.2.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/rawpointer/0.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rayon/1.11.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/rayon/1.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rayon-core/1.13.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rayon-core/1.13.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-automata/0.4.14" r=
el=3D"noreferrer" target=3D"_blank">crates.io/regex-automata/0.4.14</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.8.10" rel=
=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.8.10</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rmp/0.8.15" rel=3D"noref=
errer" target=3D"_blank">crates.io/rmp/0.8.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rmp-serde/1.3.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/rmp-serde/1.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustix/1.1.4" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/rustix/1.1.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustversion/1.0.22" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rustversion/1.0.22</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.23" rel=3D"noref=
errer" target=3D"_blank">crates.io/ryu/1.0.23</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/safe-transmute/0.11.3" r=
el=3D"noreferrer" target=3D"_blank">crates.io/safe-transmute/0.11.3</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/safe_arch/0.7.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/safe_arch/0.7.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/1.0.6" rel=3D"=
noreferrer" target=3D"_blank">crates.io/same-file/1.0.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/semver/1.0.27" rel=3D"no=
referrer" target=3D"_blank">crates.io/semver/1.0.27</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.228" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.228</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_core/1.0.228" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_core/1.0.228</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.228" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.228</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.149" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.149</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_repr/0.1.20" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_repr/0.1.20</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_spanned/1.0.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_spanned/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_yaml_ng/0.10.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_yaml_ng/0.10.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sharded-slab/0.1.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/sharded-slab/0.1.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/shell-words/1.1.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/shell-words/1.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/shlex/1.3.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/signal-hook-registry/1.4=
.8" rel=3D"noreferrer" target=3D"_blank">crates.io/signal-hook-registry/1.4=
.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/simba/0.9.1" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/simba/0.9.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/simd-adler32/0.3.8" rel=
=3D"noreferrer" target=3D"_blank">crates.io/simd-adler32/0.3.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/simple_logger/5.2.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/simple_logger/5.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/slab/0.4.12" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/slab/0.4.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.15.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/smallvec/1.15.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/socket2/0.6.3" rel=3D"no=
referrer" target=3D"_blank">crates.io/socket2/0.6.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/static_assertions/1.1.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/static_assertions/1.1.0</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strsim/0.11.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/strsim/0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.117" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/syn/2.0.117</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/system-deps/7.0.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/system-deps/7.0.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-features/0.1.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/target-features/0.1.6</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.13.3" r=
el=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.13.3</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tempfile/3.26.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/tempfile/3.26.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/2.0.18" rel=3D=
"noreferrer" target=3D"_blank">crates.io/thiserror/2.0.18</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl/2.0.18" r=
el=3D"noreferrer" target=3D"_blank">crates.io/thiserror-impl/2.0.18</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thread_local/1.1.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/thread_local/1.1.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tiff/0.11.3" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/tiff/0.11.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tokio/1.50.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/tokio/1.50.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tokio-stream/0.1.18" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tokio-stream/0.1.18</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml/0.9.12+spec-1.1.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/toml/0.9.12+spec-1.1.0</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_datetime/0.7.5+spec=
-1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_datetime/0.7.5+=
spec-1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_edit/0.23.10+spec-1=
.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_edit/0.23.10+spec=
-1.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_parser/1.0.9+spec-1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_parser/1.0.9+spec=
-1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_writer/1.0.6+spec-1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_writer/1.0.6+spec=
-1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing/0.1.44" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/tracing/0.1.44</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-attributes/0.1.3=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/tracing-attributes/0.1.31=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-core/0.1.36" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tracing-core/0.1.36</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-log/0.2.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tracing-log/0.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-subscriber/0.3.2=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/tracing-subscriber/0.3.22=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/typenum/1.19.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/typenum/1.19.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uds_windows/1.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/uds_windows/1.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.24" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.24</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-width/0.2.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unicode-width/0.2.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xid/0.2.6" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unicode-xid/0.2.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unsafe-libyaml/0.2.11" r=
el=3D"noreferrer" target=3D"_blank">crates.io/unsafe-libyaml/0.2.11</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/1.22.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/uuid/1.22.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/valuable/0.1.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/valuable/0.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vcpkg/0.2.15" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/vcpkg/0.2.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version-compare/0.2.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/version-compare/0.2.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.5.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/walkdir/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.11.1+wasi-snapsho=
t-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.11.1+wasi=
-snapshot-preview1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasip2/1.0.2+wasi-0.2.9"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/wasip2/1.0.2+wasi-0.2.9</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasip3/0.4.0+wasi-0.3.0-=
rc-2026-01-06" rel=3D"noreferrer" target=3D"_blank">crates.io/wasip3/0.4.0+=
wasi-0.3.0-rc-2026-01-06</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen/0.2.114" re=
l=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen/0.2.114</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro/0.2.1=
14" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-macro/0.2.1=
14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro-suppo=
rt/0.2.114" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-mac=
ro-support/0.2.114</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-shared/0.2.=
114" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-shared/0.2=
.114</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-encoder/0.244.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/wasm-encoder/0.244.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-metadata/0.244.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/wasm-metadata/0.244.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasmparser/0.244.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/wasmparser/0.244.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/weezl/0.1.12" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/weezl/0.1.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wide/0.7.33" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/wide/0.7.33</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.11" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-core/0.62.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-core/0.62.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-implement/0.60.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-implement/0.60.2</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-interface/0.59.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-interface/0.59.3</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-link/0.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-link/0.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-result/0.4.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/windows-result/0.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-strings/0.5.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/windows-strings/0.5.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.61.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.61.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winnow/0.7.15" rel=3D"no=
referrer" target=3D"_blank">crates.io/winnow/0.7.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-bindgen/0.51.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/wit-bindgen/0.51.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-bindgen-core/0.51.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/wit-bindgen-core/0.51.0</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-bindgen-rust/0.51.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/wit-bindgen-rust/0.51.0</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-bindgen-rust-macro/0=
.51.0" rel=3D"noreferrer" target=3D"_blank">crates.io/wit-bindgen-rust-macr=
o/0.51.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-component/0.244.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/wit-component/0.244.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-parser/0.244.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/wit-parser/0.244.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/xml-rs/0.8.28" rel=3D"no=
referrer" target=3D"_blank">crates.io/xml-rs/0.8.28</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/yeslogic-fontconfig-sys/=
6.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/yeslogic-fontconfig-s=
ys/6.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zbus/5.14.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/zbus/5.14.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zbus_macros/5.14.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/zbus_macros/5.14.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zbus_names/4.3.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/zbus_names/4.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy/0.8.42" rel=3D"=
noreferrer" target=3D"_blank">crates.io/zerocopy/0.8.42</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerocopy-derive/0.8.42" =
rel=3D"noreferrer" target=3D"_blank">crates.io/zerocopy-derive/0.8.42</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zmij/1.0.21" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/zmij/1.0.21</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zune-core/0.5.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/zune-core/0.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zune-inflate/0.2.54" rel=
=3D"noreferrer" target=3D"_blank">crates.io/zune-inflate/0.2.54</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zune-jpeg/0.5.12" rel=3D=
"noreferrer" target=3D"_blank">crates.io/zune-jpeg/0.5.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant/5.10.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/zvariant/5.10.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_derive/5.10.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/zvariant_derive/5.10.0</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_utils/3.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/zvariant_utils/3.3.0</a> \<br>
+&quot;<br>
+<br>
+SRC_URI[adler2-2.0.1.sha256sum] =3D &quot;320119579fcad9c21884f5c4861d1617=
4d0e06250625266f50fe6898340abefa&quot;<br>
+SRC_URI[ahash-0.8.12.sha256sum] =3D &quot;5a15f179cd60c4584b8a8c596927aadc=
462e27f2ca70c04e0071964a73ba7a75&quot;<br>
+SRC_URI[aho-corasick-1.1.4.sha256sum] =3D &quot;ddd31a130427c27518df266943=
a5308ed92d4b226cc639f5a8f1002816174301&quot;<br>
+SRC_URI[allocator-api2-0.2.21.sha256sum] =3D &quot;683d7910e743518b0e34f11=
86f92494becacb047c7b6bf616c96772180fef923&quot;<br>
+SRC_URI[android_system_properties-0.1.5.sha256sum] =3D &quot;819e7219dbd41=
043ac279b19830f2efc897156490d7fd6ea916720117ee66311&quot;<br>
+SRC_URI[anyhow-1.0.102.sha256sum] =3D &quot;7f202df86484c868dbad7eaa557ef7=
85d5c66295e41b460ef922eca0723b842c&quot;<br>
+SRC_URI[approx-0.5.1.sha256sum] =3D &quot;cab112f0a86d568ea0e627cc1d6be74a=
1e9cd55214684db5561995f6dad897c6&quot;<br>
+SRC_URI[async-broadcast-0.7.2.sha256sum] =3D &quot;435a87a52755b8f27fcf321=
ac4f04b2802e337c8c4872923137471ec39c37532&quot;<br>
+SRC_URI[async-channel-2.5.0.sha256sum] =3D &quot;924ed96dd52d1b75e9c1a3e62=
75715fd320f5f9439fb5a4a11fa51f4221158d2&quot;<br>
+SRC_URI[async-executor-1.14.0.sha256sum] =3D &quot;c96bf972d85afc50bf5ab8f=
e2d54d1586b4e0b46c97c50a0c9e71e2f7bcd812a&quot;<br>
+SRC_URI[async-fs-2.2.0.sha256sum] =3D &quot;8034a681df4aed8b8edbd7fbe47240=
1ecf009251c8b40556b304567052e294c5&quot;<br>
+SRC_URI[async-global-executor-3.1.0.sha256sum] =3D &quot;13f937e26114b9319=
3065fd44f507aa2e9169ad0cdabbb996920b1fe1ddea7ba&quot;<br>
+SRC_URI[async-io-2.6.0.sha256sum] =3D &quot;456b8a8feb6f42d237746d4b3e9a17=
8494627745c3c56c6ea55d92ba50d026fc&quot;<br>
+SRC_URI[async-lock-3.4.2.sha256sum] =3D &quot;290f7f2596bd5b78a9fec8088ccd=
89180d7f9f55b94b0576823bbbdc72ee8311&quot;<br>
+SRC_URI[async-process-2.5.0.sha256sum] =3D &quot;fc50921ec0055cdd8a16de487=
73bfeec5c972598674347252c0399676be7da75&quot;<br>
+SRC_URI[async-recursion-1.1.1.sha256sum] =3D &quot;3b43422f69d8ff38f95f1b2=
bb76517c91589a924d1559a0e935d7c8ce0274c11&quot;<br>
+SRC_URI[async-signal-0.2.13.sha256sum] =3D &quot;43c070bbf59cd3570b6b2dd54=
cd772527c7c3620fce8be898406dd3ed6adc64c&quot;<br>
+SRC_URI[async-task-4.7.1.sha256sum] =3D &quot;8b75356056920673b02621b35afd=
0f7dda9306d03c79a30f5c56c44cf256e3de&quot;<br>
+SRC_URI[async-trait-0.1.89.sha256sum] =3D &quot;9035ad2d096bed7955a320ee7e=
2230574d28fd3c3a0f186cbea1ff3c7eed5dbb&quot;<br>
+SRC_URI[atomic-waker-1.1.2.sha256sum] =3D &quot;1505bd5d3d116872e7271a6d4e=
16d81d0c8570876c8de68093a09ac269d8aac0&quot;<br>
+SRC_URI[autocfg-1.5.0.sha256sum] =3D &quot;c08606f8c3cbf4ce6ec8e28fb0014a2=
c086708fe954eaa885384a6165172e7e8&quot;<br>
+SRC_URI[bit_field-0.10.3.sha256sum] =3D &quot;1e4b40c7323adcfc0a41c4b88143=
ed58346ff65a288fc144329c5c45e05d70c6&quot;<br>
+SRC_URI[bitflags-2.11.0.sha256sum] =3D &quot;843867be96c8daad0d758b57df939=
2b6d8d271134fce549de6ce169ff98a92af&quot;<br>
+SRC_URI[bitreader-0.3.11.sha256sum] =3D &quot;886559b1e163d56c765bc3a985fe=
bb4eee8009f625244511d8ee3c432e08c066&quot;<br>
+SRC_URI[blocking-1.6.2.sha256sum] =3D &quot;e83f8d02be6967315521be875afa79=
2a316e28d57b5a2d401897e2a7921b7f21&quot;<br>
+SRC_URI[bon-3.9.0.sha256sum] =3D &quot;2d13a61f2963b88eef9c1be03df65d42f69=
96dfeac1054870d950fcf66686f83&quot;<br>
+SRC_URI[bon-macros-3.9.0.sha256sum] =3D &quot;d314cc62af2b6b0c65780555abb4=
d02a03dd3b799cd42419044f0c38d99738c0&quot;<br>
+SRC_URI[bumpalo-3.20.2.sha256sum] =3D &quot;5d20789868f4b01b2f2caec9f5c4e0=
213b41e3e5702a50157d699ae31ced2fcb&quot;<br>
+SRC_URI[bytemuck-1.25.0.sha256sum] =3D &quot;c8efb64bd706a16a1bdde310ae86b=
351e4d21550d98d056f22f8a7f7a2183fec&quot;<br>
+SRC_URI[byteorder-1.5.0.sha256sum] =3D &quot;1fd0f2584146f6f2ef48085050886=
acf353beff7305ebd1ae69500e27c67f64b&quot;<br>
+SRC_URI[byteorder-lite-0.1.0.sha256sum] =3D &quot;8f1fe948ff07f4bd06c30984=
e69f5b4899c516a3ef74f34df92a2df2ab535495&quot;<br>
+SRC_URI[bytes-1.11.1.sha256sum] =3D &quot;1e748733b7cbc798e1434b6ac524f0c1=
ff2ab456fe201501e6497c8417a4fc33&quot;<br>
+SRC_URI[cairo-rs-0.22.0.sha256sum] =3D &quot;5cc8d9aa793480744cd9a0524fef1=
a2e197d9eaa0f739cde19d16aba530dcb95&quot;<br>
+SRC_URI[cairo-sys-rs-0.22.0.sha256sum] =3D &quot;f8b4985713047f5faee02b8db=
6a6ef32bbb50269ff53c1aee716d1d195b76d54&quot;<br>
+SRC_URI[cc-1.2.56.sha256sum] =3D &quot;aebf35691d1bfb0ac386a69bac2fde4dd27=
6fb618cf8bf4f5318fe285e821bb2&quot;<br>
+SRC_URI[cfg-expr-0.20.7.sha256sum] =3D &quot;3c6b04e07d8080154ed4ac03546d9=
a2b303cc2fe1901ba0b35b301516e289368&quot;<br>
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D &quot;9330f8b2ff13f34540b44e946ef35111=
825727b38d33286ef986142615121801&quot;<br>
+SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D &quot;613afe47fcd5fac7ccf1db93bab=
cb082c5994d996f20b8b159f2ad1658eb5724&quot;<br>
+SRC_URI[chrono-0.4.44.sha256sum] =3D &quot;c673075a2e0e5f4a1dde27ce9dee1ea=
4558c7ffe648f576438a20ca1d2acc4b0&quot;<br>
+SRC_URI[color_quant-1.1.0.sha256sum] =3D &quot;3d7b894f5411737b7867f482795=
5924d7c254fc9f4d91a6aad6b097804b1018b&quot;<br>
+SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D &quot;4ca0197aee26d1ae37445e=
e532fefce43251d24cc7c166799f4d46817f1d3973&quot;<br>
+SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D &quot;773648b94d0e5d620f6=
4f280777445740e61fe701025087ec8b57f45c791888b&quot;<br>
+SRC_URI[crc32fast-1.5.0.sha256sum] =3D &quot;9481c1c90cbf2ac953f07c8d4a58a=
a3945c425b7185c9154d67a65e4230da511&quot;<br>
+SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D &quot;9dd111b7b7f7d55b72c0a6a=
e361660ee5853c9af73f70c3c2ef6858b950e2e51&quot;<br>
+SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D &quot;5b82ac4a3c2ca9c3460964=
f020e1402edd5753411d7737aa39c3714ad1b5420e&quot;<br>
+SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D &quot;d0a5c400df2834b80a4c33=
27b3aad3a4c4cd4de0629063962b03235697506a28&quot;<br>
+SRC_URI[crunchy-0.2.4.sha256sum] =3D &quot;460fbee9c2c2f33933d720630a6a0ba=
c33ba7053db5344fac858d4b8952d77d5&quot;<br>
+SRC_URI[darling-0.23.0.sha256sum] =3D &quot;25ae13da2f202d56bd7f91c25fba00=
9e7717a1e4a1cc98a76d844b65ae912e9d&quot;<br>
+SRC_URI[darling_core-0.23.0.sha256sum] =3D &quot;9865a50f7c335f53564bb694e=
f660825eb8610e0a53d3e11bf1b0d3df31e03b0&quot;<br>
+SRC_URI[darling_macro-0.23.0.sha256sum] =3D &quot;ac3984ec7bd6cfa798e62b4a=
642426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d&quot;<br>
+SRC_URI[dlib-0.5.3.sha256sum] =3D &quot;ab8ecd87370524b461f8557c119c405552=
c396ed91fc0a8eec68679eab26f94a&quot;<br>
+SRC_URI[dunce-1.0.5.sha256sum] =3D &quot;92773504d58c093f6de2459af4af33faa=
518c13451eb8f2b5698ed3d36e7c813&quot;<br>
+SRC_URI[either-1.15.0.sha256sum] =3D &quot;48c757948c5ede0e46177b7add2e671=
55f70e33c07fea8284df6576da70b3719&quot;<br>
+SRC_URI[encoding_rs-0.8.35.sha256sum] =3D &quot;75030f3c4f45dafd7586dd6780=
965a8c7e8e285a5ecb86713e63a79c5b2766f3&quot;<br>
+SRC_URI[endi-1.1.1.sha256sum] =3D &quot;66b7e2430c6dff6a955451e2cfc438f09c=
ea1965a9d6f87f7e3b90decc014099&quot;<br>
+SRC_URI[enumflags2-0.7.12.sha256sum] =3D &quot;1027f7680c853e056ebcec68361=
5fb6fbbc07dbaa13b4d5d9442b146ded4ecef&quot;<br>
+SRC_URI[enumflags2_derive-0.7.12.sha256sum] =3D &quot;67c78a4d8fdf9953a5c9=
d458f9efe940fd97a0cab0941c075a813ac594733827&quot;<br>
+SRC_URI[enumn-0.1.14.sha256sum] =3D &quot;2f9ed6b3789237c8a0c1c505af1c7eb2=
c560df6186f01b098c3a1064ea532f38&quot;<br>
+SRC_URI[env_filter-1.0.0.sha256sum] =3D &quot;7a1c3cc8e57274ec99de65301228=
b537f1e4eedc1b8e0f9411c6caac8ae7308f&quot;<br>
+SRC_URI[env_logger-0.11.9.sha256sum] =3D &quot;b2daee4ea451f429a58296525dd=
f28b45a3b64f1acf6587e2067437bb11e218d&quot;<br>
+SRC_URI[equivalent-1.0.2.sha256sum] =3D &quot;877a4ace8713b0bcf2a4e7eec825=
29c029f1d0619886d18145fea96c3ffe5c0f&quot;<br>
+SRC_URI[errno-0.3.14.sha256sum] =3D &quot;39cab71617ae0d63f51a36d69f866391=
735b51691dbda63cf6f96d042b63efeb&quot;<br>
+SRC_URI[event-listener-5.4.1.sha256sum] =3D &quot;e13b66accf52311f30a0db42=
147dadea9850cb48cd070028831ae5f5d4b856ab&quot;<br>
+SRC_URI[event-listener-strategy-0.5.4.sha256sum] =3D &quot;8be9f3dfaaffdae=
2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93&quot;<br>
+SRC_URI[exr-1.74.0.sha256sum] =3D &quot;4300e043a56aa2cb633c01af81ca8f699a=
321879a7854d3896a0ba89056363be&quot;<br>
+SRC_URI[fallible_collections-0.5.1.sha256sum] =3D &quot;8b3e85d14d419ba3e1=
db925519461c0d17a49bdd2d67ea6316fa965ca7acdf74&quot;<br>
+SRC_URI[fastrand-2.3.0.sha256sum] =3D &quot;37909eebbb50d72f9059c3b6d82c04=
63f2ff062c9e95845c43a6c9c0355411be&quot;<br>
+SRC_URI[fax-0.2.6.sha256sum] =3D &quot;f05de7d48f37cd6730705cbca900770cab7=
7a89f413d23e100ad7fad7795a0ab&quot;<br>
+SRC_URI[fax_derive-0.2.0.sha256sum] =3D &quot;a0aca10fb742cb43f9e7bb8467c9=
1aa9bcb8e3ffbc6a6f7389bb93ffc920577d&quot;<br>
+SRC_URI[fdeflate-0.3.7.sha256sum] =3D &quot;1e6853b52649d4ac5c0bd02320cddc=
5ba956bdb407c4b75a2c6b75bf51500f8c&quot;<br>
+SRC_URI[fearless_simd-0.3.0.sha256sum] =3D &quot;8fb2907d1f08b2b316b9223ce=
d5b0e89d87028ba8deae9764741dba8ff7f3903&quot;<br>
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D &quot;5baebc0774151f905a1a2cc=
41989300b1e6fbb29aff0ceffa1064fdd3088d582&quot;<br>
+SRC_URI[flate2-1.1.9.sha256sum] =3D &quot;843fba2746e448b37e26a81957995741=
5c8cef339bf08564fe8b7ddbd959573c&quot;<br>
+SRC_URI[foldhash-0.1.5.sha256sum] =3D &quot;d9c4f5dac5e15c24eb999c26181a6c=
a40b39fe946cbe4c263c7209467bc83af2&quot;<br>
+SRC_URI[foreign-types-0.5.0.sha256sum] =3D &quot;d737d9aa519fb7b749cbc3b96=
2edcf310a8dd1f4b67c91c4f83975dbdd17d965&quot;<br>
+SRC_URI[foreign-types-macros-0.2.3.sha256sum] =3D &quot;1a5c6c585bc94aaf2c=
7b51dd4c2ba22680844aba4c687be581871a6f518c5742&quot;<br>
+SRC_URI[foreign-types-shared-0.3.1.sha256sum] =3D &quot;aa9a19cbb55df58761=
df49b23516a86d432839add4af60fc256da840f66ed35b&quot;<br>
+SRC_URI[four-cc-0.4.0.sha256sum] =3D &quot;795cbfc56d419a7ce47ccbb7504dd9a=
5b7c484c083c356e797de08bd988d9629&quot;<br>
+SRC_URI[futures-channel-0.3.32.sha256sum] =3D &quot;07bbe89c50d7a535e539b8=
c17bc0b49bdb77747034daa8087407d655f3f7cc1d&quot;<br>
+SRC_URI[futures-core-0.3.32.sha256sum] =3D &quot;7e3450815272ef58cec6d5644=
23f6e755e25379b217b0bc688e295ba24df6b1d&quot;<br>
+SRC_URI[futures-executor-0.3.32.sha256sum] =3D &quot;baf29c38818342a3b26b5=
b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d&quot;<br>
+SRC_URI[futures-io-0.3.32.sha256sum] =3D &quot;cecba35d7ad927e23624b22ad55=
235f2239cfa44fd10428eecbeba6d6a717718&quot;<br>
+SRC_URI[futures-lite-2.6.1.sha256sum] =3D &quot;f78e10609fe0e0b3f4157ffab1=
876319b5b0db102a2c60dc4626306dc46b44ad&quot;<br>
+SRC_URI[futures-macro-0.3.32.sha256sum] =3D &quot;e835b70203e41293343137df=
5c0664546da5745f82ec9b84d40be8336958447b&quot;<br>
+SRC_URI[futures-task-0.3.32.sha256sum] =3D &quot;037711b3d59c33004d3856fbd=
c83b99d4ff37a24768fa1be9ce3538a1cde4393&quot;<br>
+SRC_URI[futures-timer-3.0.3.sha256sum] =3D &quot;f288b0a4f20f9a56b5d1da57e=
2227c661b7b16168e2f72365f57b63326e29b24&quot;<br>
+SRC_URI[futures-util-0.3.32.sha256sum] =3D &quot;389ca41296e6190b48053de03=
21d02a77f32f8a5d2461dd38762c0593805c6d6&quot;<br>
+SRC_URI[gdk-pixbuf-0.22.0.sha256sum] =3D &quot;25f420376dbee041b2db374ce45=
73892a36222bb3f6c0c43e24f0d67eae9b646&quot;<br>
+SRC_URI[gdk-pixbuf-sys-0.22.0.sha256sum] =3D &quot;48f31b37b1fc4b48b54f6b9=
1b7ef04c18e00b4585d98359dd7b998774bbd91fb&quot;<br>
+SRC_URI[gdk4-0.11.0.sha256sum] =3D &quot;2e9a95621b043a35e70ea9f6da89e1a47=
1658ee5771258874f000a11f6a9cb89&quot;<br>
+SRC_URI[gdk4-sys-0.11.0.sha256sum] =3D &quot;4d322515677e4a12e10efe7e75874=
3c3e5faa56940237f19ba6890ba8edbbb76&quot;<br>
+SRC_URI[getopts-0.2.24.sha256sum] =3D &quot;cfe4fbac503b8d1f88e6676011885f=
34b7174f46e59956bba534ba83abded4df&quot;<br>
+SRC_URI[getrandom-0.3.4.sha256sum] =3D &quot;899def5c37c4fd7b2664648c28120=
ecec138e4d395b459e5ca34f9cce2dd77fd&quot;<br>
+SRC_URI[getrandom-0.4.1.sha256sum] =3D &quot;139ef39800118c7683f2fd3c98c1b=
23c09ae076556b435f8e9064ae108aaeeec&quot;<br>
+SRC_URI[gif-0.14.1.sha256sum] =3D &quot;f5df2ba84018d80c213569363bdcd0c64e=
6933c67fe4c1d60ecf822971a3c35e&quot;<br>
+SRC_URI[gio-0.22.2.sha256sum] =3D &quot;816b6743c46b217aa8fba679095ac6f216=
2fd53259dc8f186fcdbff9c555db03&quot;<br>
+SRC_URI[gio-sys-0.22.0.sha256sum] =3D &quot;64729ba2772c080448f9f966dba8f4=
456beeb100d8c28a865ef8a0f2ef4987e1&quot;<br>
+SRC_URI[gio-unix-0.22.0.sha256sum] =3D &quot;69db2f0bb80c9d97c315720c395db=
76d4649969bce3a130aea6c5c9d757bf80f&quot;<br>
+SRC_URI[gio-unix-sys-0.22.0.sha256sum] =3D &quot;44bab97ce39112040216e268f=
074645f50b31caeb53af708ab5d7e4e67f0dbfd&quot;<br>
+SRC_URI[glib-0.22.2.sha256sum] =3D &quot;16877c6e619447e0bcb6de326a42a8bd0=
2b36328cfeeda210135425e576efa3d&quot;<br>
+SRC_URI[glib-macros-0.22.2.sha256sum] =3D &quot;bda575994e3689b1bc12f89c3d=
f621ead46ff292623b76b4710a3a5b79be54bb&quot;<br>
+SRC_URI[glib-sys-0.22.0.sha256sum] =3D &quot;48073e3b228419faa80b9b7f71227=
59d4ab2f44cd52a065fde7ca08f34c03147&quot;<br>
+SRC_URI[gobject-sys-0.22.0.sha256sum] =3D &quot;18eda93f09d3778f38255b231b=
17ef67195013a592c91624a4daf8bead875565&quot;<br>
+SRC_URI[gufo-0.4.1.sha256sum] =3D &quot;99a86855fe55303654418ebd8b07312057=
a32b5887fb768a38170fd54ed944db&quot;<br>
+SRC_URI[gufo-common-1.1.0.sha256sum] =3D &quot;9f23bc0d0e791259ce4fe703c4d=
988c64317e33477bc4d1d7526ab8eb9fcaab6&quot;<br>
+SRC_URI[gufo-exif-0.4.0.sha256sum] =3D &quot;ad61fccc591119491879e7bee63eb=
bfbd27811b35367b4728a857119fde78843&quot;<br>
+SRC_URI[gufo-jpeg-0.4.0.sha256sum] =3D &quot;5606b919ea2538d6e761781be87ea=
f5186427c3d64849c1013359aa3681e68d2&quot;<br>
+SRC_URI[gufo-png-0.4.1.sha256sum] =3D &quot;aa9d6a919b2c9f4b5f344bf0e2991b=
08b23ab69ab336b65195657a6c624fb8a5&quot;<br>
+SRC_URI[gufo-tiff-0.4.0.sha256sum] =3D &quot;51743619d12e8ead9fdd3cdd2ad3d=
0ed994a538542857f5115d74d6547a0083b&quot;<br>
+SRC_URI[gufo-webp-0.4.0.sha256sum] =3D &quot;218ea90042f1766b38b487dfbb261=
b6f21636e5cfd570e1ac6709119dae92fe2&quot;<br>
+SRC_URI[gufo-xmp-0.4.0.sha256sum] =3D &quot;020d604dbaf16f257f9d8bf7c11095=
51089be459ad8dc54c4205d28fe1688399&quot;<br>
+SRC_URI[half-2.7.1.sha256sum] =3D &quot;6ea2d84b969582b4b1864a92dc5d27cd2b=
77b622a8d79306834f1be5ba20d84b&quot;<br>
+SRC_URI[hashbrown-0.14.5.sha256sum] =3D &quot;e5274423e17b7c9fc20b6e7e2085=
32f9b19825d82dfd615708b70edd83df41f1&quot;<br>
+SRC_URI[hashbrown-0.15.5.sha256sum] =3D &quot;9229cfe53dfd69f0609a49f65461=
bd93001ea1ef889cd5529dd176593f5338a1&quot;<br>
+SRC_URI[hashbrown-0.16.1.sha256sum] =3D &quot;841d1cc9bed7f9236f321df97703=
0373f4a4163ae1a7dbfe1a51a2c1a51d9100&quot;<br>
+SRC_URI[hayro-jpeg2000-0.3.4.sha256sum] =3D &quot;c1a74cfc18c0093ef8009a0d=
6c1ba3024df0cce228503a14c1372e1e23eed43e&quot;<br>
+SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3b60a8=
84b5d30c0fca7d82fe33449bbe55ea&quot;<br>
+SRC_URI[hermit-abi-0.5.2.sha256sum] =3D &quot;fc0fef456e4baa96da950455cd02=
c081ca953b141298e41db3fc7e36b1da849c&quot;<br>
+SRC_URI[hex-0.4.3.sha256sum] =3D &quot;7f24254aa9a54b5c858eaee2f5bccdb46aa=
f0e486a595ed5fd8f86ba55232a70&quot;<br>
+SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D &quot;e31bc9ad994ba00e440a8aa=
5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470&quot;<br>
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D &quot;f31827a206f56af32e=
590ba56d5d2d085f558508192593743f16b2306495269f&quot;<br>
+SRC_URI[id-arena-2.3.0.sha256sum] =3D &quot;3d3067d79b975e8844ca9eb072e16b=
31c3c1c36928edf9c6789548c524d0d954&quot;<br>
+SRC_URI[ident_case-1.0.1.sha256sum] =3D &quot;b9e0384b61958566e926dc506603=
21d12159025e767c18e043daf26b70104c39&quot;<br>
+SRC_URI[image-0.25.10.sha256sum] =3D &quot;85ab80394333c02fe689eaf900ab500=
fbd0c2213da414687ebf995a65d5a6104&quot;<br>
+SRC_URI[image-extras-0.1.0.sha256sum] =3D &quot;86d29ba92ef6970a2685cc758b=
455d190842b8b9e96c865ffd31cdb9954b7548&quot;<br>
+SRC_URI[image-webp-0.2.4.sha256sum] =3D &quot;525e9ff3e1a4be2fbea1fdf0e986=
86a6d98b4d8f937e1bf7402245af1909e8c3&quot;<br>
+SRC_URI[indexmap-2.13.0.sha256sum] =3D &quot;7714e70437a7dc3ac8eb7e6f8df75=
fd8eb422675fc7678aff7364301092b1017&quot;<br>
+SRC_URI[itoa-1.0.17.sha256sum] =3D &quot;92ecc6618181def0457392ccd0ee51198=
e065e016d1d527a7ac1b6dc7c1f09d2&quot;<br>
+SRC_URI[jiff-0.2.23.sha256sum] =3D &quot;1a3546dc96b6d42c5f24902af9e2538e8=
2e39ad350b0c766eb3fbf2d8f3d8359&quot;<br>
+SRC_URI[jiff-static-0.2.23.sha256sum] =3D &quot;2a8c8b344124222efd714b73bb=
41f8b5120b27a7cc1c75593a6ff768d9d05aa4&quot;<br>
+SRC_URI[jobserver-0.1.34.sha256sum] =3D &quot;9afb3de4395d6b3e67a780b6de64=
b51c978ecf11cb9a462c66be7d4ca9039d33&quot;<br>
+SRC_URI[jpeg-decoder-0.3.2.sha256sum] =3D &quot;00810f1d8b74be64b13dbf3db8=
9ac67740615d6c891f0e7b6179326533011a07&quot;<br>
+SRC_URI[jpeg-encoder-0.7.0.sha256sum] =3D &quot;0b0b36cbb4e6704f12f5b5d7b0=
1dac593982c6550859ebd5a66fb15c9ea27fd5&quot;<br>
+SRC_URI[jpegxl-rs-0.12.0+libjxl-0.11.1.sha256sum] =3D &quot;4bc73de4d7188a=
80badb62062780510e402a17947f663e50f6390ebb6e7b90ed&quot;<br>
+SRC_URI[jpegxl-sys-0.12.0+libjxl-0.11.1.sha256sum] =3D &quot;d07cb5b362c69=
ced9ebfcdb3301dc6cadf7d186a3e6a3d8f4fcb9094a83ab408&quot;<br>
+SRC_URI[js-sys-0.3.91.sha256sum] =3D &quot;b49715b7073f385ba4bc528e5747d02=
e66cb39c6146efb66b781f131f0fb399c&quot;<br>
+SRC_URI[lazy_static-1.5.0.sha256sum] =3D &quot;bbd2bcb4c963f2ddae06a2efc7e=
9f3591312473c50c6685e1f298068316e66fe&quot;<br>
+SRC_URI[lcms2-6.1.1.sha256sum] =3D &quot;b75877b724685dd49310bdbadbf973fc6=
9b1d01992a6d4a861b928fc3943f87b&quot;<br>
+SRC_URI[lcms2-sys-4.0.6.sha256sum] =3D &quot;1c2604b23848ca80b2add60f0fb22=
70fd980e622c25029b6597fa01cfd5f8d5f&quot;<br>
+SRC_URI[leb128fmt-0.1.0.sha256sum] =3D &quot;09edd9e8b54e49e587e4f6295a7d2=
9c3ea94d469cb40ab8ca70b288248a81db2&quot;<br>
+SRC_URI[lebe-0.5.3.sha256sum] =3D &quot;7a79a3332a6609480d7d0c9eab957bca6b=
455b91bb84e66d19f5ff66294b85b8&quot;<br>
+SRC_URI[libc-0.2.183.sha256sum] =3D &quot;b5b646652bf6661599e1da8901b3b952=
2896f01e736bad5f723fe7a3a27f899d&quot;<br>
+SRC_URI[libheif-rs-2.7.0.sha256sum] =3D &quot;39c4e7037b43e1431961745e5c40=
04eedae3735a4fddd687810ff9d70beb9882&quot;<br>
+SRC_URI[libheif-sys-5.2.0+1.21.2.sha256sum] =3D &quot;107c0d813a0cf5ddf7af=
2c58a60611f18efdb2830e84d9b37580fb20e6e27a2b&quot;<br>
+SRC_URI[libloading-0.8.9.sha256sum] =3D &quot;d7c4b02199fee7c5d21a5ae7d8cf=
a79a6ef5bb2fc834d6e9058e89c825efdc55&quot;<br>
+SRC_URI[libopenraw-0.4.0-alpha.12.sha256sum] =3D &quot;cb7af949edc773f32dd=
45ff5a0692860b619b03d2fa3741c1db1acfd1db3a553&quot;<br>
+SRC_URI[librsvg-rebind-0.3.0.sha256sum] =3D &quot;8e29b54b27b49901092b20ef=
1177d42a068beec0ce5f3344a664118d586d2443&quot;<br>
+SRC_URI[librsvg-rebind-sys-0.3.0.sha256sum] =3D &quot;4ab4a782ee37dfa57e9f=
03a169cc7ea652d20164e9e023f3df355d5d8b4e6c34&quot;<br>
+SRC_URI[libseccomp-0.4.0.sha256sum] =3D &quot;0e5310a2c5b6ffbc094b5f70a2ca=
7b79ed36ad90e6f90994b166489a1bce3fcc&quot;<br>
+SRC_URI[libseccomp-sys-0.3.0.sha256sum] =3D &quot;60276e2d41bbb68b323e5660=
47a1bfbf952050b157d8b5cdc74c07c1bf4ca3b6&quot;<br>
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D &quot;32a66949e030da00e8c7d443=
4b251670a91556f4144941d37452769c25d58a53&quot;<br>
+SRC_URI[log-0.4.29.sha256sum] =3D &quot;5e5032e24019045c762d3c0f28f5b6b8bb=
f38563a65908389bf7978758920897&quot;<br>
+SRC_URI[matchers-0.2.0.sha256sum] =3D &quot;d1525a2a28c7f4fa0fc98bb91ae755=
d1e2d1505079e05539e35bc876b5d65ae9&quot;<br>
+SRC_URI[matrixmultiply-0.3.10.sha256sum] =3D &quot;a06de3016e9fae57a36fd14=
dba131fccf49f74b40b7fbdb472f96e361ec71a08&quot;<br>
+SRC_URI[memchr-2.8.0.sha256sum] =3D &quot;f8ca58f447f06ed17d5fc4043ce1b10d=
d205e060fb3ce5b979b8ed8e59ff3f79&quot;<br>
+SRC_URI[memfd-0.6.5.sha256sum] =3D &quot;ad38eb12aea514a0466ea40a80fd8cc83=
637065948eb4a426e4aa46261175227&quot;<br>
+SRC_URI[memmap2-0.9.11.sha256sum] =3D &quot;d1219ed1b7f229ee7104d281dd01d6=
802fe28bb6e95d292942c4daacdeb798c0&quot;<br>
+SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b036d996092f6cb4=
48677611ce4449e970ceaf42695203f218a&quot;<br>
+SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D &quot;1fa76a2c86f704bdb222d66965f=
b3d63269ce38518b83cb0575fca855ebb6316&quot;<br>
+SRC_URI[miniz_oxide-0.9.0.sha256sum] =3D &quot;5faa9f23e86bd5768d76def0861=
92ff5f869fb088da12a976ea21e9796b975f6&quot;<br>
+SRC_URI[mio-1.1.1.sha256sum] =3D &quot;a69bcab0ad47271a0234d9422b131806bf3=
968021e5dc9328caf2d4cd58557fc&quot;<br>
+SRC_URI[moxcms-0.8.1.sha256sum] =3D &quot;bb85c154ba489f01b25c0d36ae69a87e=
4a1c73a72631fc6c0eb6dde34a73e44b&quot;<br>
+SRC_URI[multiversion-0.8.0.sha256sum] =3D &quot;7edb7f0ff51249dfda9ab96b58=
23695e15a052dc15074c9dbf3d118afaf2c201&quot;<br>
+SRC_URI[multiversion-macros-0.8.0.sha256sum] =3D &quot;b093064383341eb3271=
f42e381cb8f10a01459478446953953c75d24bd339fc0&quot;<br>
+SRC_URI[nalgebra-0.33.2.sha256sum] =3D &quot;26aecdf64b707efd1310e3544d709=
c5c0ac61c13756046aaaba41be5c4f66a3b&quot;<br>
+SRC_URI[nalgebra-macros-0.2.2.sha256sum] =3D &quot;254a5372af8fc138e366847=
61d3c0cdb758a4410e938babcff1c860ce14ddbfc&quot;<br>
+SRC_URI[nix-0.30.1.sha256sum] =3D &quot;74523f3a35e05aba87a1d978330aef40f6=
7b0304ac79c1c00b294c9830543db6&quot;<br>
+SRC_URI[nu-ansi-term-0.50.3.sha256sum] =3D &quot;7957b9740744892f114936ab4=
a57b3f487491bbeafaf8083688b16841a4240e5&quot;<br>
+SRC_URI[num-bigint-0.4.6.sha256sum] =3D &quot;a5e44f723f1133c9deac64676357=
9fdb3ac745e418f2a7af9cd0c431da1f20b9&quot;<br>
+SRC_URI[num-complex-0.4.6.sha256sum] =3D &quot;73f88a1307638156682bada9d76=
04135552957b7818057dcef22705b4d509495&quot;<br>
+SRC_URI[num-integer-0.1.46.sha256sum] =3D &quot;7969661fd2958a5cb096e56c8e=
1ad0444ac2bbcd0061bd28660485a44879858f&quot;<br>
+SRC_URI[num-rational-0.4.2.sha256sum] =3D &quot;f83d14da390562dca69fc84082=
e73e548e1ad308d24accdedd2720017cb37824&quot;<br>
+SRC_URI[num-traits-0.2.19.sha256sum] =3D &quot;071dfc062690e90b734c0b2273c=
e72ad0ffa95f0c74596bc250dcfd960262841&quot;<br>
+SRC_URI[num_enum-0.7.5.sha256sum] =3D &quot;b1207a7e20ad57b847bbddc6776b96=
8420d38292bbfe2089accff5e19e82454c&quot;<br>
+SRC_URI[num_enum_derive-0.7.5.sha256sum] =3D &quot;ff32365de1b6743cb203b71=
0788263c44a03de03802daf96092f2da4fe6ba4d7&quot;<br>
+SRC_URI[once_cell-1.21.3.sha256sum] =3D &quot;42f5e15c9953c5e4ccceeb2e7382=
a716482c34515315f7b03532b8b4e8393d2d&quot;<br>
+SRC_URI[ordered-stream-0.2.0.sha256sum] =3D &quot;9aa2b01e1d916879f73a53d0=
1d1d6cee68adbb31d6d9177a8cfce093cced1d50&quot;<br>
+SRC_URI[pango-0.22.0.sha256sum] =3D &quot;25d8f224eddef627b896d2f7b05725b3=
faedbd140e0e8343446f0d34f34238ee&quot;<br>
+SRC_URI[pango-sys-0.22.0.sha256sum] =3D &quot;bbd111a20ca90fedf03e09c59783=
c679c00900f1d8491cca5399f5e33609d5d6&quot;<br>
+SRC_URI[parking-2.2.1.sha256sum] =3D &quot;f38d5652c16fde515bb1ecef450ab0f=
6a219d619a7274976324d5e377f7dceba&quot;<br>
+SRC_URI[paste-1.0.15.sha256sum] =3D &quot;57c0d7b74b563b49d38dae00a0c37d4d=
6de9b432382b2892f0574ddcae73fd0a&quot;<br>
+SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D &quot;a89322df9ebe1c1578d68=
9c92318e070967d1042b512afbe49518723f4e6d5cd&quot;<br>
+SRC_URI[piper-0.2.5.sha256sum] =3D &quot;c835479a4443ded371d6c535cbfd8d31a=
d92c5d23ae9770a61bc155e4992a3c1&quot;<br>
+SRC_URI[pkg-config-0.3.32.sha256sum] =3D &quot;7edddbd0b52d732b21ad9a5fab5=
c704c14cd949e5e9a1ec5929a24fded1b904c&quot;<br>
+SRC_URI[png-0.18.1.sha256sum] =3D &quot;60769b8b31b2a9f263dae2776c37b1b28a=
e246943cf719eb6946a1db05128a61&quot;<br>
+SRC_URI[polling-3.11.0.sha256sum] =3D &quot;5d0e4f59085d47d8241c88ead0f274=
e8a0cb551f3625263c05eb8dd897c34218&quot;<br>
+SRC_URI[portable-atomic-1.13.1.sha256sum] =3D &quot;c33a9471896f1c69cecef8=
d20cbe2f7accd12527ce60845ff44c153bb2a21b49&quot;<br>
+SRC_URI[portable-atomic-util-0.2.5.sha256sum] =3D &quot;7a9db96d7fa8782dd8=
c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5&quot;<br>
+SRC_URI[prettyplease-0.2.37.sha256sum] =3D &quot;479ca8adacdd7ce8f1fb39ce9=
ecccbfe93a3f1344b3d0d97f20bc0196208f62b&quot;<br>
+SRC_URI[proc-macro-crate-3.4.0.sha256sum] =3D &quot;219cb19e96be00ab2e37d6=
e299658a0cfa83e52429179969b0f0121b4ac46983&quot;<br>
+SRC_URI[proc-macro2-1.0.106.sha256sum] =3D &quot;8fd00f0bb2e90d81d1044c2b3=
2617f68fcb9fa3bb7640c23e9c748e53fb30934&quot;<br>
+SRC_URI[pxfm-0.1.28.sha256sum] =3D &quot;b5a041e753da8b807c9255f28de81879c=
78c876392ff2469cde94799b2896b9d&quot;<br>
+SRC_URI[qoi-0.4.1.sha256sum] =3D &quot;7f6d64c71eb498fe9eae14ce4ec935c5557=
49aef511cca85b5568910d6e48001&quot;<br>
+SRC_URI[quick-error-2.0.1.sha256sum] =3D &quot;a993555f31e5a609f617c12db62=
50dedcac1b0a85076912c436e6fc9b2c8e6a3&quot;<br>
+SRC_URI[quote-1.0.45.sha256sum] =3D &quot;41f2619966050689382d2b44f664f4bc=
593e129785a36d6ee376ddf37259b924&quot;<br>
+SRC_URI[r-efi-5.3.0.sha256sum] =3D &quot;69cdb34c158ceb288df11e18b4bd39de9=
94f6657d83847bdffdbd7f346754b0f&quot;<br>
+SRC_URI[rawpointer-0.2.1.sha256sum] =3D &quot;60a357793950651c4ed0f3f52338=
f53b2f809f32d83a07f72909fa13e4c6c1e3&quot;<br>
+SRC_URI[rayon-1.11.0.sha256sum] =3D &quot;368f01d005bf8fd9b1206fb6fa653e6c=
4a81ceb1466406b81792d87c5677a58f&quot;<br>
+SRC_URI[rayon-core-1.13.0.sha256sum] =3D &quot;22e18b0f0062d30d4230b2e85ff=
77fdfe4326feb054b9783a3460d8435c8ab91&quot;<br>
+SRC_URI[regex-automata-0.4.14.sha256sum] =3D &quot;6e1dd4122fc1595e8162618=
945476892eefca7b88c52820e74af6262213cae8f&quot;<br>
+SRC_URI[regex-syntax-0.8.10.sha256sum] =3D &quot;dc897dd8d9e8bd1ed8cdad82b=
5966c3e0ecae09fb1907d58efaa013543185d0a&quot;<br>
+SRC_URI[rmp-0.8.15.sha256sum] =3D &quot;4ba8be72d372b2c9b35542551678538b56=
2e7cf86c3315773cae48dfbfe7790c&quot;<br>
+SRC_URI[rmp-serde-1.3.1.sha256sum] =3D &quot;72f81bee8c8ef9b577d1681a70ebb=
c962c232461e397b22c208c43c04b67a155&quot;<br>
+SRC_URI[rustix-1.1.4.sha256sum] =3D &quot;b6fe4565b9518b83ef4f91bb47ce2962=
0ca828bd32cb7e408f0062e9930ba190&quot;<br>
+SRC_URI[rustversion-1.0.22.sha256sum] =3D &quot;b39cdef0fa800fc44525c84ccb=
54a029961a8215f9619753635a9c0d2538d46d&quot;<br>
+SRC_URI[ryu-1.0.23.sha256sum] =3D &quot;9774ba4a74de5f7b1c1451ed6cd5285a32=
eddb5cccb8cc655a4e50009e06477f&quot;<br>
+SRC_URI[safe-transmute-0.11.3.sha256sum] =3D &quot;3944826ff8fa8093089aba3=
acb4ef44b9446a99a16f3bf4e74af3f77d340ab7d&quot;<br>
+SRC_URI[safe_arch-0.7.4.sha256sum] =3D &quot;96b02de82ddbe1b636e6170c21be6=
22223aea188ef2e139be0a5b219ec215323&quot;<br>
+SRC_URI[same-file-1.0.6.sha256sum] =3D &quot;93fc1dc3aaa9bfed95e02e6eadabb=
4baf7e3078b0bd1b4d7b6b0b68378900502&quot;<br>
+SRC_URI[semver-1.0.27.sha256sum] =3D &quot;d767eb0aabc880b29956c35734170f2=
6ed551a859dbd361d140cdbeca61ab1e2&quot;<br>
+SRC_URI[serde-1.0.228.sha256sum] =3D &quot;9a8e94ea7f378bd32cbbd37198a4a91=
436180c5bb472411e48b5ec2e2124ae9e&quot;<br>
+SRC_URI[serde_core-1.0.228.sha256sum] =3D &quot;41d385c7d4ca58e59fc732af25=
c3983b67ac852c1a25000afe1175de458b67ad&quot;<br>
+SRC_URI[serde_derive-1.0.228.sha256sum] =3D &quot;d540f220d3187173da220f88=
5ab66608367b6574e925011a9353e4badda91d79&quot;<br>
+SRC_URI[serde_json-1.0.149.sha256sum] =3D &quot;83fc039473c5595ace860d8c4f=
afa220ff474b3fc6bfdb4293327f1a37e94d86&quot;<br>
+SRC_URI[serde_repr-0.1.20.sha256sum] =3D &quot;175ee3e80ae9982737ca543e961=
33087cbd9a485eecc3bc4de9c1a37b47ea59c&quot;<br>
+SRC_URI[serde_spanned-1.0.4.sha256sum] =3D &quot;f8bbf91e5a4d6315eee45e704=
372590b30e260ee83af6639d64557f51b067776&quot;<br>
+SRC_URI[serde_yaml_ng-0.10.0.sha256sum] =3D &quot;7b4db627b98b36d4203a7b45=
8cf3573730f2bb591b28871d916dfa9efabfd41f&quot;<br>
+SRC_URI[sharded-slab-0.1.7.sha256sum] =3D &quot;f40ca3c46823713e0d4209592e=
8d6e826aa57e928f09752619fc696c499637f6&quot;<br>
+SRC_URI[shell-words-1.1.1.sha256sum] =3D &quot;dc6fe69c597f9c37bfeeeeeb33d=
a3530379845f10be461a66d16d03eca2ded77&quot;<br>
+SRC_URI[shlex-1.3.0.sha256sum] =3D &quot;0fda2ff0d084019ba4d7c6f371c95d8fd=
75ce3524c3cb8fb653a3023f6323e64&quot;<br>
+SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D &quot;c4db69cba1110affc0=
e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b&quot;<br>
+SRC_URI[simba-0.9.1.sha256sum] =3D &quot;c99284beb21666094ba2b75bbceda012e=
610f5479dfcc2d6e2426f53197ffd95&quot;<br>
+SRC_URI[simd-adler32-0.3.8.sha256sum] =3D &quot;e320a6c5ad31d271ad523dcf3a=
d13e2767ad8b1cb8f047f75a8aeaf8da139da2&quot;<br>
+SRC_URI[simple_logger-5.2.0.sha256sum] =3D &quot;c7038d0e96661bf9ce647e1a6=
f6ef6d6f3663f66d9bf741abf14ba4876071c17&quot;<br>
+SRC_URI[slab-0.4.12.sha256sum] =3D &quot;0c790de23124f9ab44544d7ac05d60440=
adc586479ce501c1d6d7da3cd8c9cf5&quot;<br>
+SRC_URI[smallvec-1.15.1.sha256sum] =3D &quot;67b1b7a3b5fe4f1376887184045fc=
f45c69e92af734b7aaddc05fb777b6fbd03&quot;<br>
+SRC_URI[socket2-0.6.3.sha256sum] =3D &quot;3a766e1110788c36f4fa1c2b71b387a=
7815aa65f88ce0229841826633d93723e&quot;<br>
+SRC_URI[static_assertions-1.1.0.sha256sum] =3D &quot;a2eb9349b6444b326872e=
140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f&quot;<br>
+SRC_URI[strsim-0.11.1.sha256sum] =3D &quot;7da8b5736845d9f2fcb837ea5d9e262=
8564b3b043a70948a3f0b778838c5fb4f&quot;<br>
+SRC_URI[syn-2.0.117.sha256sum] =3D &quot;e665b8803e7b1d2a727f4023456bbbbe7=
4da67099c585258af0ad9c5013b9b99&quot;<br>
+SRC_URI[system-deps-7.0.7.sha256sum] =3D &quot;48c8f33736f986f16d69b6cb8b0=
3f55ddcad5c41acc4ccc39dd88e84aa805e7f&quot;<br>
+SRC_URI[target-features-0.1.6.sha256sum] =3D &quot;c1bbb9f3c5c463a01705937=
a24fdabc5047929ac764b2d5b9cf681c1f5041ed5&quot;<br>
+SRC_URI[target-lexicon-0.13.3.sha256sum] =3D &quot;df7f62577c25e07834649fc=
3b39fafdc597c0a3527dc1c60129201ccfcbaa50c&quot;<br>
+SRC_URI[tempfile-3.26.0.sha256sum] =3D &quot;82a72c767771b47409d2345987fda=
8628641887d5466101319899796367354a0&quot;<br>
+SRC_URI[thiserror-2.0.18.sha256sum] =3D &quot;4288b5bcbc7920c07a1149a35cf9=
590a2aa808e0bc1eafaade0b80947865fbc4&quot;<br>
+SRC_URI[thiserror-impl-2.0.18.sha256sum] =3D &quot;ebc4ee7f67670e9b64d05fa=
4253e753e016c6c95ff35b89b7941d6b856dec1d5&quot;<br>
+SRC_URI[thread_local-1.1.9.sha256sum] =3D &quot;f60246a4944f24f6e018aa17cd=
effb7818b76356965d03b07d6a9886e8962185&quot;<br>
+SRC_URI[tiff-0.11.3.sha256sum] =3D &quot;b63feaf3343d35b6ca4d50483f9484380=
3b0f51634937cc2ec519fc32232bc52&quot;<br>
+SRC_URI[tokio-1.50.0.sha256sum] =3D &quot;27ad5e34374e03cfffefc301becb44e9=
dc3c17584f414349ebe29ed26661822d&quot;<br>
+SRC_URI[tokio-stream-0.1.18.sha256sum] =3D &quot;32da49809aab5c3bc678af039=
02d4ccddea2a87d028d86392a4b1560c6906c70&quot;<br>
+SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] =3D &quot;cf92845e79fc2e2def6a5d=
828f0801e29a2f8acc037becc5ab08595c7d5e9863&quot;<br>
+SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D &quot;92e1cfed4a3038=
bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347&quot;<br>
+SRC_URI[toml_edit-0.23.10+spec-1.0.0.sha256sum] =3D &quot;84c8b9f757e028ce=
e9fa244aea147aab2a9ec09d5325a9b01e0a49730c2b5269&quot;<br>
+SRC_URI[toml_parser-1.0.9+spec-1.1.0.sha256sum] =3D &quot;702d4415e08923e7=
e1ef96cd5727c0dfed80b4d2fa25db9647fe5eb6f7c5a4c4&quot;<br>
+SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] =3D &quot;ab16f14aed21ee8b=
fd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607&quot;<br>
+SRC_URI[tracing-0.1.44.sha256sum] =3D &quot;63e71662fa4b2a2c3a26f570f037eb=
95bb1f85397f3cd8076caed2f026a6d100&quot;<br>
+SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D &quot;7490cfa5ec963746568=
740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da&quot;<br>
+SRC_URI[tracing-core-0.1.36.sha256sum] =3D &quot;db97caf9d906fbde555dd62fa=
95ddba9eecfd14cb388e4f491a66d74cd5fb79a&quot;<br>
+SRC_URI[tracing-log-0.2.0.sha256sum] =3D &quot;ee855f1f400bd0e5c02d150ae5d=
e3840039a3f54b025156404e34c23c03f47c3&quot;<br>
+SRC_URI[tracing-subscriber-0.3.22.sha256sum] =3D &quot;2f30143827ddab0d256=
fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e&quot;<br>
+SRC_URI[typenum-1.19.0.sha256sum] =3D &quot;562d481066bde0658276a35467c4af=
00bdc6ee726305698a55b86e61d7ad82bb&quot;<br>
+SRC_URI[uds_windows-1.2.1.sha256sum] =3D &quot;f2f6fb2847f6742cd76af783a2a=
2c49e9375d0a111c7bef6f71cd9e738c72d6e&quot;<br>
+SRC_URI[unicode-ident-1.0.24.sha256sum] =3D &quot;e6e4313cd5fcd3dad5cafa17=
9702e2b244f760991f45397d14d4ebf38247da75&quot;<br>
+SRC_URI[unicode-width-0.2.2.sha256sum] =3D &quot;b4ac048d71ede7ee76d585517=
add45da530660ef4390e49b098733c6e897f254&quot;<br>
+SRC_URI[unicode-xid-0.2.6.sha256sum] =3D &quot;ebc1c04c71510c7f702b52b7c35=
0734c9ff1295c464a03335b00bb84fc54f853&quot;<br>
+SRC_URI[unsafe-libyaml-0.2.11.sha256sum] =3D &quot;673aac59facbab8a9007c7f=
6108d11f63b603f7cabff99fabf650fea5c32b861&quot;<br>
+SRC_URI[uuid-1.22.0.sha256sum] =3D &quot;a68d3c8f01c0cfa54a75291d836011617=
99e4a89a39e0929f4b0354d88757a37&quot;<br>
+SRC_URI[valuable-0.1.1.sha256sum] =3D &quot;ba73ea9cf16a25df0c8caa16c51acb=
937d5712a8429db78a3ee29d5dcacd3a65&quot;<br>
+SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb7a82fe23066fb0957d4=
8ef677f6eeb8215f372f52e48bb32426&quot;<br>
+SRC_URI[version-compare-0.2.1.sha256sum] =3D &quot;03c2856837ef78f57382f06=
b2b8563a2f512f7185d732608fd9176cb3b8edf0e&quot;<br>
+SRC_URI[version_check-0.9.5.sha256sum] =3D &quot;0b928f33d975fc6ad9f86c8f2=
83853ad26bdd5b10b7f1542aa2fa15e2289105a&quot;<br>
+SRC_URI[walkdir-2.5.0.sha256sum] =3D &quot;29790946404f91d9c5d06f9874efdde=
a1dc06c5efe94541a7d6863108e3a5e4b&quot;<br>
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D &quot;ccf3ec651a=
847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b&quot;<br>
+SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] =3D &quot;9517f9239f02c069db75e=
65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5&quot;<br>
+SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] =3D &quot;5428f8b=
f88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5&quot;<br>
+SRC_URI[wasm-bindgen-0.2.114.sha256sum] =3D &quot;6532f9a5c1ece3798cb1c2cf=
dba640b9b3ba884f5db45973a6f442510a87d38e&quot;<br>
+SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] =3D &quot;18a2d50fcf105fb33b=
b15f00e7a77b772945a2ee45dcf454961fd843e74c18e6&quot;<br>
+SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] =3D &quot;03ce4caeaa=
c547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3&quot;<br>
+SRC_URI[wasm-bindgen-shared-0.2.114.sha256sum] =3D &quot;75a326b8c223ee178=
83a4251907455a2431acc2791c98c26279376490c378c16&quot;<br>
+SRC_URI[wasm-encoder-0.244.0.sha256sum] =3D &quot;990065f2fe63003fe337b932=
cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319&quot;<br>
+SRC_URI[wasm-metadata-0.244.0.sha256sum] =3D &quot;bb0e353e6a2fbdc176932bb=
aab493762eb1255a7900fe0fea1a2f96c296cc909&quot;<br>
+SRC_URI[wasmparser-0.244.0.sha256sum] =3D &quot;47b807c72e1bac69382b3a6fb3=
dbe8ea4c0ed87ff5629b8685ae6b9a611028fe&quot;<br>
+SRC_URI[weezl-0.1.12.sha256sum] =3D &quot;a28ac98ddc8b9274cb41bb4d9d4d5c42=
5b6020c50c46f25559911905610b4a88&quot;<br>
+SRC_URI[wide-0.7.33.sha256sum] =3D &quot;0ce5da8ecb62bcd8ec8b7ea19f69a5127=
5e91299be594ea5cc6ef7819e16cd03&quot;<br>
+SRC_URI[winapi-util-0.1.11.sha256sum] =3D &quot;c2a7b1c03c876122aa43f3020e=
6c3c3ee5c05081c9a00739faf7503aeba10d22&quot;<br>
+SRC_URI[windows-core-0.62.2.sha256sum] =3D &quot;b8e83a14d34d0623b51dce958=
1199302a221863196a1dde71a7663a4c2be9deb&quot;<br>
+SRC_URI[windows-implement-0.60.2.sha256sum] =3D &quot;053e2e040ab57b9dc951=
b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf&quot;<br>
+SRC_URI[windows-interface-0.59.3.sha256sum] =3D &quot;3f316c4a2570ba26bbec=
722032c4099d8c8bc095efccdc15688708623367e358&quot;<br>
+SRC_URI[windows-link-0.2.1.sha256sum] =3D &quot;f0805222e57f7521d6a62e36fa=
9163bc891acd422f971defe97d64e70d0a4fe5&quot;<br>
+SRC_URI[windows-result-0.4.1.sha256sum] =3D &quot;7781fa89eaf60850ac3d2da7=
af8e5242a5ea78d1a11c49bf2910bb5a73853eb5&quot;<br>
+SRC_URI[windows-strings-0.5.1.sha256sum] =3D &quot;7837d08f69c77cf6b076895=
44538e017c1bfcf57e34b4c0ff58e6c2cd3b37091&quot;<br>
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D &quot;ae137229bcbd6cdf0f7b80a31d=
f61766145077ddf49416a728b02cb3921ff3fc&quot;<br>
+SRC_URI[winnow-0.7.15.sha256sum] =3D &quot;df79d97927682d2fd8adb29682d1140=
b343be4ac0f08fd68b7765d9c059d3945&quot;<br>
+SRC_URI[wit-bindgen-0.51.0.sha256sum] =3D &quot;d7249219f66ced02969388cf2b=
b044a09756a083d0fab1e566056b04d9fbcaa5&quot;<br>
+SRC_URI[wit-bindgen-core-0.51.0.sha256sum] =3D &quot;ea61de684c3ea68cb082b=
7a88508a8b27fcc8b797d738bfc99a82facf1d752dc&quot;<br>
+SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] =3D &quot;b7c566e0f4b284dd6561c=
786d9cb0142da491f46a9fbed79ea69cdad5db17f21&quot;<br>
+SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] =3D &quot;0c0f9bfd77e6a48=
eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a&quot;<br>
+SRC_URI[wit-component-0.244.0.sha256sum] =3D &quot;9d66ea20e9553b30172b5e8=
31994e35fbde2d165325bec84fc43dbf6f4eb9cb2&quot;<br>
+SRC_URI[wit-parser-0.244.0.sha256sum] =3D &quot;ecc8ac4bc1dc3381b7f59c34f0=
0b67e18f910c2c0f50015669dde7def656a736&quot;<br>
+SRC_URI[xml-rs-0.8.28.sha256sum] =3D &quot;3ae8337f8a065cfc972643663ea4279=
e04e7256de865aa66fe25cec5fb912d3f&quot;<br>
+SRC_URI[yeslogic-fontconfig-sys-6.0.0.sha256sum] =3D &quot;503a066b4c037c4=
40169d995b869046827dbc71263f6e8f3be6d77d4f3229dbd&quot;<br>
+SRC_URI[zbus-5.14.0.sha256sum] =3D &quot;ca82f95dbd3943a40a53cfded6c2d0a2c=
a26192011846a1810c4256ef92c60bc&quot;<br>
+SRC_URI[zbus_macros-5.14.0.sha256sum] =3D &quot;897e79616e84aac4b2c46e9132=
a4f63b93105d54fe8c0e8f6bffc21fa8d49222&quot;<br>
+SRC_URI[zbus_names-4.3.1.sha256sum] =3D &quot;ffd8af6d5b78619bab301ff3c560=
a5bd22426150253db278f164d6cf3b72c50f&quot;<br>
+SRC_URI[zerocopy-0.8.42.sha256sum] =3D &quot;f2578b716f8a7a858b7f02d5bd870=
c14bf4ddbbcf3a4c05414ba6503640505e3&quot;<br>
+SRC_URI[zerocopy-derive-0.8.42.sha256sum] =3D &quot;7e6cc098ea4d3bd6246687=
de65af3f920c430e236bee1e3bf2e441463f08a02f&quot;<br>
+SRC_URI[zmij-1.0.21.sha256sum] =3D &quot;b8848ee67ecc8aedbaf3e4122217aff89=
2639231befc6a1b58d29fff4c2cabaa&quot;<br>
+SRC_URI[zune-core-0.5.1.sha256sum] =3D &quot;cb8a0807f7c01457d0379ba880ba6=
322660448ddebc890ce29bb64da71fb40f9&quot;<br>
+SRC_URI[zune-inflate-0.2.54.sha256sum] =3D &quot;73ab332fe2f6680068f3582b1=
6a24f90ad7096d5d39b974d1c0aff0125116f02&quot;<br>
+SRC_URI[zune-jpeg-0.5.12.sha256sum] =3D &quot;410e9ecef634c709e3831c2cfdb8=
d9c32164fae1c67496d5b68fff728eec37fe&quot;<br>
+SRC_URI[zvariant-5.10.0.sha256sum] =3D &quot;5708299b21903bbe348e94729f22c=
49c55d04720a004aa350f1f9c122fd2540b&quot;<br>
+SRC_URI[zvariant_derive-5.10.0.sha256sum] =3D &quot;5b59b012ebe9c46656f9cc=
08d8da8b4c726510aef12559da3e5f1bf72780752c&quot;<br>
+SRC_URI[zvariant_utils-3.3.0.sha256sum] =3D &quot;f75c23a64ef8f40f13a69899=
91e643554d9bef1d682a281160cf0c1bc389c5e9&quot;<br>
diff --git a/meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cros=
s-compilation-via-a-rust_target-cr.patch b/meta-gnome/recipes-gnome/glycin/=
glycin/0001-meson-Support-cross-compilation-via-a-rust_target-cr.patch<br>
new file mode 100644<br>
index 0000000000..9d14326214<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/glycin/glycin/0001-meson-Support-cross-compi=
lation-via-a-rust_target-cr.patch<br>
@@ -0,0 +1,97 @@<br>
+From b4fac7e77a2a88be19fc83b3890711e2e3165859 Mon Sep 17 00:00:00 2001<br>
+From: Anton Politov &lt;<a href=3D"mailto:ampernic@inbox.ru" target=3D"_bl=
ank">ampernic@inbox.ru</a>&gt;<br>
+Date: Thu, 18 Jun 2026 14:03:36 +0300<br>
+Subject: [PATCH] meson: Support cross-compilation via a rust_target cross<=
br>
+ property<br>
+<br>
+cargo was always invoked without --target and the artifact paths assumed<b=
r>
+the native layout (cargo-target/&lt;profile&gt;/), so the Rust components =
could<br>
+not be cross-compiled. Read the rust target triple from the cross file&#39=
;s<br>
+[properties] (rust_target); when set, pass it as --target and read the<br>
+artifacts from the per-target subdirectory cargo writes to. When it is<br>
+unset the build is unchanged.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glyci=
n/-/commit/13b6b060d41aa4cdce3eb878e83c6dd01014e669" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.gnome.org/GNOME/glycin/-/commit/13b6b060d41aa=
4cdce3eb878e83c6dd01014e669</a>]<br>
+---<br>
+ glycin-loaders/meson.build=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
+ glycin-thumbnailer/meson.build | 3 ++-<br>
+ libglycin/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 9 +++++++++<br>
+ 4 files changed, 14 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/glycin-loaders/meson.build b/glycin-loaders/meson.build<br>
+index 805a646..03db09e 100644<br>
+--- a/glycin-loaders/meson.build<br>
++++ b/glycin-loaders/meson.build<br>
+@@ -49,7 +49,7 @@ manifest =3D meson.project_source_root() / &#39;Cargo.to=
ml&#39;<br>
+ cargo_options =3D [<br>
+=C2=A0 =C2=A0&#39;--profile&#39;, cargo_profile,<br>
+=C2=A0 =C2=A0&#39;--manifest-path&#39;, manifest,<br>
+-]<br>
++] + cargo_target_args<br>
+ <br>
+ git_version =3D &#39;&#39;<br>
+ <br>
+@@ -103,7 +103,7 @@ foreach loader : get_option(&#39;loaders&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0output: loader,<br>
+=C2=A0 =C2=A0 =C2=A0command: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cp&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 cargo_target_dir / rust_target / loader,<br>
++=C2=A0 =C2=A0 =C2=A0 cargo_artifact_dir / rust_target / loader,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;@OUTPUT@&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0],<br>
+=C2=A0 =C2=A0)<br>
+diff --git a/glycin-thumbnailer/meson.build b/glycin-thumbnailer/meson.bui=
ld<br>
+index 3e205e3..1580378 100644<br>
+--- a/glycin-thumbnailer/meson.build<br>
++++ b/glycin-thumbnailer/meson.build<br>
+@@ -21,6 +21,7 @@ cargo_build =3D custom_target(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--profile&#39;, cargo_profile,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--manifest-path&#39;, cargo_manifes=
t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--package=3Dglycin-thumbnailer&#39;=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_target_args,<br>
+=C2=A0 =C2=A0 =C2=A0],<br>
+ )<br>
+ <br>
+@@ -34,7 +35,7 @@ custom_target(<br>
+=C2=A0 =C2=A0 =C2=A0output: &#39;glycin-thumbnailer&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0command: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cp&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_target_dir / rust_target / &#39;glycin-=
thumbnailer&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_artifact_dir / rust_target / &#39;glyci=
n-thumbnailer&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;@OUTPUT@&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0],<br>
+ )<br>
+diff --git a/libglycin/meson.build b/libglycin/meson.build<br>
+index 12cbd5f..3a2a8b6 100644<br>
+--- a/libglycin/meson.build<br>
++++ b/libglycin/meson.build<br>
+@@ -17,7 +17,7 @@ cargo_options =3D [<br>
+=C2=A0 =C2=A0 =C2=A0&#39;--target-dir&#39;, cargo_target_dir,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;--profile&#39;, cargo_profile,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;--manifest-path&#39;, manifest,<br>
+-]<br>
++] + cargo_target_args<br>
+ <br>
+ cargo_env_module =3D cargo_env<br>
+ <br>
+diff --git a/meson.build b/meson.build<br>
+index bb4a5e4..72d1ae8 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -25,6 +25,15 @@ cargo_target_dir =3D meson.project_build_root() / &#39;=
cargo-target&#39;<br>
+ cargo_home =3D meson.project_build_root() / &#39;cargo-home&#39;<br>
+ cargo_manifest =3D meson.project_source_root() / &#39;Cargo.toml&#39;<br>
+ <br>
++cargo_build_target =3D meson.get_external_property(&#39;rust_target&#39;,=
 &#39;&#39;)<br>
++if cargo_build_target !=3D &#39;&#39;<br>
++=C2=A0 cargo_target_args =3D [&#39;--target&#39;, cargo_build_target]<br>
++=C2=A0 cargo_artifact_dir =3D cargo_target_dir / cargo_build_target<br>
++else<br>
++=C2=A0 cargo_target_args =3D []<br>
++=C2=A0 cargo_artifact_dir =3D cargo_target_dir<br>
++endif<br>
++<br>
+ cargo_bin =3D find_program(&#39;cargo&#39;)<br>
+ crate_version_bin =3D find_program(meson.project_source_root() / &#39;bui=
ld-aux/crates-version.py&#39;)<br>
+ <br>
diff --git a/meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-car=
go-artifacts-from-the-per-target-s.patch b/meta-gnome/recipes-gnome/glycin/=
glycin/0002-libglycin-Read-cargo-artifacts-from-the-per-target-s.patch<br>
new file mode 100644<br>
index 0000000000..5f431e25cf<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/glycin/glycin/0002-libglycin-Read-cargo-arti=
facts-from-the-per-target-s.patch<br>
@@ -0,0 +1,31 @@<br>
+From 6fa1351e99a52e9efc8724952275ee51a15afc7e Mon Sep 17 00:00:00 2001<br>
+From: x &lt;a@b.c&gt;<br>
+Date: Wed, 2 Sep 2026 19:57:42 +0000<br>
+Subject: [PATCH] libglycin: Read cargo artifacts from the per-target<br>
+ subdirectory<br>
+<br>
+Commit 13b6b06 (&quot;meson: Support cross-compilation via a rust_target c=
ross<br>
+property&quot;) converted the loaders and the thumbnailer to cargo_artifac=
t_dir<br>
+but left the libglycin shared object path pointing at cargo_target_dir.<br=
>
+When --target is passed, cargo writes to cargo-target/&lt;triple&gt;/&lt;p=
rofile&gt;/<br>
+and the copy step fails. Upstream fixed this as part of the much larger<br=
>
+windows-gnu commit 4d1a505, so only the relevant hunk is taken here.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glyci=
n/-/commit/4d1a505" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gno=
me.org/GNOME/glycin/-/commit/4d1a505</a>]<br>
+---<br>
+ libglycin/meson.build | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/libglycin/meson.build b/libglycin/meson.build<br>
+index 3a2a8b6..dbadf49 100644<br>
+--- a/libglycin/meson.build<br>
++++ b/libglycin/meson.build<br>
+@@ -72,7 +72,7 @@ foreach package : packages<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
+=C2=A0 =C2=A0 =C2=A0endif<br>
+ <br>
+-=C2=A0 =C2=A0 cargo_output =3D cargo_target_dir / rust_target / f&#39;lib=
glycin@suffix@.so&#39;.replace(&#39;-&#39;, &#39;_&#39;)<br>
++=C2=A0 =C2=A0 cargo_output =3D cargo_artifact_dir / rust_target / f&#39;l=
ibglycin@suffix@.so&#39;.replace(&#39;-&#39;, &#39;_&#39;)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0# Build library with Rust<br>
+=C2=A0 =C2=A0 =C2=A0libglycin =3D custom_target(<br>
diff --git a/meta-gnome/recipes-gnome/glycin/<a href=3D"http://glycin_2.1.5=
.bb" rel=3D"noreferrer" target=3D"_blank">glycin_2.1.5.bb</a> b/meta-gnome/=
recipes-gnome/glycin/<a href=3D"http://glycin_2.1.5.bb" rel=3D"noreferrer" =
target=3D"_blank">glycin_2.1.5.bb</a><br>
new file mode 100644<br>
index 0000000000..91734e2bf9<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/glycin/<a href=3D"http://glycin_2.1.5.bb" re=
l=3D"noreferrer" target=3D"_blank">glycin_2.1.5.bb</a><br>
@@ -0,0 +1,106 @@<br>
+SUMMARY =3D &quot;Sandboxed and extendable image decoding&quot;<br>
+DESCRIPTION =3D &quot;Glycin decodes images in sandboxed subprocesses. It =
ships a set of \<br>
+image loaders, the libglycin C library with GObject introspection bindings=
, and a \<br>
+thumbnailer implementing the freedesktop thumbnail specification.&quot;<br=
>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/glycin" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/glycin</a>=
&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/glycin/-/is=
sues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/g=
lycin/-/issues</a>&quot;<br>
+SECTION =3D &quot;graphics&quot;<br>
+<br>
+LICENSE =3D &quot;MPL-2.0 OR LGPL-2.1-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE-MPL-2.0;md5=3Df75d2927d3c1ed2414=
ef72048f5ad640 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE-LGPL-2.1;md5=3De5dba73410bf27bc90d66e56336c7e2b&quot;<br>
+<br>
+<br>
+inherit cargo_common cargo-update-recipe-crates meson pkgconfig gettext go=
bject-introspection<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.gnome.org/GNOME/glycin.gi=
t;protocol=3Dhttps;branch=3D2.1;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;branch=3D2.1=
;tag=3D${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-Support-cross-c=
ompilation-via-a-rust_target-cr.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-libglycin-Read-cargo-=
artifacts-from-the-per-target-s.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRCREV =3D &quot;62c5096eaac2c92dab84c2eb896936d8da3dd9c1&quot;<br>
+<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/gly=
cin/-/tags" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/G=
NOME/glycin/-/tags</a>&quot;<br>
+UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br>
+<br>
+require ${BPN}-crates.inc<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 glib-2.0-native libseccomp lcms fontconfig&quot=
;<br>
+<br>
+do_write_config:append:class-target() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &gt; ${WORKDIR}/meson-rust.cross &lt;&lt;-E=
OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[properties]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rust_target =3D &#39;${RUST_HOST_SYS}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0EOF<br>
+}<br>
+<br>
+EXTRA_OEMESON:append:class-target =3D &quot; --cross-file ${WORKDIR}/meson=
-rust.cross&quot;<br>
+<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cargo_common_do_configure<br>
+}<br>
+<br>
+<br>
+do_compile:prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${B}/cargo-home<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${CARGO_HOME}/config.toml ${B}/=
cargo-home/config.toml<br>
+}<br>
+<br>
+<br>
+EXTRA_OEMESON +=3D &quot;-Dprofile=3Drelease \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dlto=3Dfal=
se \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtests=3Df=
alse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtest_toki=
o=3Dfalse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dpython_te=
sts=3Dfalse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcapi_docs=
=3Dfalse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+export CARGO_NET_OFFLINE =3D &quot;1&quot;<br>
+export CARGO_BUILD_JOBS =3D &quot;${@oe.utils.cpu_count()}&quot;<br>
+export RUSTFLAGS<br>
+export SYSTEM_DEPS_GLYCIN_2_NO_PKG_CONFIG =3D &quot;1&quot;<br>
+export SYSTEM_DEPS_GLYCIN_2_LIB =3D &quot;glycin-2&quot;<br>
+export SYSTEM_DEPS_GLYCIN_2_SEARCH_NATIVE =3D &quot;${B}/libglycin&quot;<b=
r>
+<br>
+PACKAGECONFIG ??=3D &quot;libglycin thumbnailer image-rs heif jxl svg \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;gtk4&#39;=
, &#39;&#39;, d)}&quot;<br>
+<br>
+PACKAGECONFIG[libglycin] =3D &quot;-Dlibglycin=3Dtrue,-Dlibglycin=3Dfalse&=
quot;<br>
+PACKAGECONFIG[gtk4] =3D &quot;-Dlibglycin-gtk4=3Dtrue,-Dlibglycin-gtk4=3Df=
alse,gtk4&quot;<br>
+PACKAGECONFIG[thumbnailer] =3D &quot;-Dglycin-thumbnailer=3Dtrue,-Dglycin-=
thumbnailer=3Dfalse&quot;<br>
+PACKAGECONFIG[vapi] =3D &quot;-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native&quo=
t;<br>
+PACKAGECONFIG[image-rs] =3D &quot;,,&quot;<br>
+PACKAGECONFIG[heif] =3D &quot;,,libheif&quot;<br>
+PACKAGECONFIG[jxl] =3D &quot;,,libjxl&quot;<br>
+PACKAGECONFIG[raw] =3D &quot;,,&quot;<br>
+PACKAGECONFIG[svg] =3D &quot;,,librsvg cairo&quot;<br>
+<br>
+def glycin_loaders(d):<br>
+=C2=A0 =C2=A0 known =3D ((&quot;heif&quot;, &quot;glycin-heif&quot;), (&qu=
ot;image-rs&quot;, &quot;glycin-image-rs&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;jxl&quot;, &quot;gl=
ycin-jxl&quot;), (&quot;raw&quot;, &quot;glycin-raw&quot;), (&quot;svg&quot=
;, &quot;glycin-svg&quot;))<br>
+=C2=A0 =C2=A0 enabled =3D d.getVar(&quot;PACKAGECONFIG&quot;).split()<br>
+=C2=A0 =C2=A0 loaders =3D [name for flag, name in known if flag in enabled=
]<br>
+=C2=A0 =C2=A0 if not loaders:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;-Dglycin-loaders=3Dfalse&quot;<br=
>
+=C2=A0 =C2=A0 return &quot;-Dglycin-loaders=3Dtrue -Dloaders=3D&quot; + &q=
uot;,&quot;.join(loaders)<br>
+<br>
+EXTRA_OEMESON +=3D &quot;${@glycin_loaders(d)}&quot;<br>
+EXTRA_OEMESON[vardeps] +=3D &quot;PACKAGECONFIG&quot;<br>
+<br>
+GLYCIN_COMPAT_VERSION =3D &quot;2+&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-loaders ${PN}-thumbnailer ${PN}-gtk4&quot;<br>
+<br>
+FILES:${PN}-loaders =3D &quot;${libexecdir}/glycin-loaders \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${datadir}/glycin-loaders \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;<br>
+<br>
+FILES:${PN}-gtk4 =3D &quot;${libdir}/libglycin-gtk4-2.so.* \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${li=
bdir}/girepository-1.0/GlyGtk4-2.typelib \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;<br>
+FILES:${PN}-thumbnailer =3D &quot;${bindir}/glycin-thumbnailer \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/thumbnailers \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+RDEPENDS:${PN}-loaders +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&=
#39;, &#39;thumbnailer&#39;, &#39;${PN}-thumbnailer&#39;, &#39;&#39;, d)}&q=
uot;<br>
+RDEPENDS:${PN}-thumbnailer +=3D &quot;${PN}&quot;<br>
+<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129704): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129704" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129704</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121065945/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121065945/1997914</a><br>
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

--000000000000cce18f065ab39c8b--

