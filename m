Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5323CD0D15E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:18:38 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12906.1767809914950566112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k6Hth/My;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-640e065991dso2177274d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809914; x=1768414714; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lsV7vrxci84mJWhI6nIiphxmGwhg6AjlmDqx4li3ICg=;
        b=k6Hth/MyZf9eQmF/CCGaKFSuftB0prcr8YpCc+kV4HeNC2ojujSZ7jrYUwrCRH97ti
         EKeZQ2zDb3gLL2u0Xkoms5uflTI/0lVQZxmqkW+9hn/hVg5kUldIA7lPxzQMdgVYr3lu
         p7OlPEhsQA3qVqwlN7c55Q9EvA7Rpz3K+mh2bRK7pFFg03wEE9OSdliN1/Zf+dKgKvOg
         q+L6tiVo7QZWoBkl294cnUpxYrYIq/vnPiu/xoDyo+xubzKGs2L36j+lqvz2XolnAcY/
         IrF8LEaB6/yQaHcdWHE8rwDCbj0oR5jV7mZ17rOVTFhwcqeoZhwy4XH3/cMRf50c7pGU
         a7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809914; x=1768414714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsV7vrxci84mJWhI6nIiphxmGwhg6AjlmDqx4li3ICg=;
        b=YNFtb2ndjQ3rMRm5/mezMFcYhygLQWfErBd2rY9Eyyny3R1s7M+5TZ6q/lwXSmFj6c
         RQ5CXFE0l6GPW5m/rg0QelR5VzGCK5aTeL7JlcAXesKtS4tAgWnaWhiahAPwU5I/juvX
         RY7gA+XD8NSEtIeqORnOomV4X2raQvyR4Oda1n/+e9htts1psDIh9wVbpaUWHkOUTbAw
         TwyUHZWzlo2RgkyBQ24xr6AxsyN6lFABf0vvzyWcQEepJaVXBiCRckFixAoU3dqYD7OB
         gskVvTRtScBTHp3VY6cIah7WWElMHflSlJEy3DhKCYBWFNVZR5ZkzOodrPKRHDZAFcJp
         Sqzw==
X-Gm-Message-State: AOJu0Yxhvx4zuxVGAwLguOJegmK0HXmXoHYbtogp62ZYzBOMOXUZRn+B
	qUbZzZMOOEMwymQS+mzT+NhLCntGd3WWOqvJRo3whriAP9MdhVKfs7/axj56udVo57lwFUg6HcE
	82TswJ/KfqqNlvKb1QKOfuY3JohbKJMQUtQ==
X-Gm-Gg: AY/fxX6YOVSmQyyOOQBz+MhHm4qWJhHD4YKsSjaJXHJGEdcta3eMrJdxctk4yEBbfhE
	axeWBcVe0+RSWY8guVMFSmNfRtNFIxUvtn3BXFEGzJeIdvnw4njmh3xAv5M+1yZQNNCS3r6e1Gh
	ZotDnFL3As3aWYF7zZoi7u5JvBUqr0HEsVr232TfCQR3NR8lb9TUqOoFQ2lKLxupANcrXzXVMDc
	DBddN/2hiHyXNxc4th6DzK9sx/J3ZN5BliWC1USZP/3vrFjWf1YX4yKpghvsJD6QkNM9Fqk+KoR
	Ni4nUznhecDqLk+VvUBmJttdancNWPrS7f9bpp2hzgTjKTUXW6Pbr3zJ+kv4t4QmBtkjKsMXmkn
	S9cvk+jzh5PH/hgh9gvm83iKSoU4ysWZB1OViClj2+lXZDg==
X-Google-Smtp-Source: AGHT+IFyROq6vrI4JHH5MzevQ4MHRv0Emv4AlJGrErJ08PJe3yo3+XUwdkULFkn8ZoiIYiH+/fwFNvwAAQC0h1YWLY4=
X-Received: by 2002:a05:690e:188f:b0:646:6942:ee80 with SMTP id
 956f58d0204a3-64716c49248mr2875663d50.88.1767809913674; Wed, 07 Jan 2026
 10:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20260107181357.1028131-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260107181357.1028131-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2026 10:18:06 -0800
X-Gm-Features: AQt7F2pgXFMIb8lhj8WCD0IpdfpjIbZ2yvQ2cTveMwVOaxhVKFvWCDyx93jLSIs
Message-ID: <CAMKF1spyYULpf0kUQsh59GTJTBqTFpRaLY2ixAVWZ_z1fd8wsA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] mozjs-128: Fix build error with arm and musl
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ef60390647d0518e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123231

--000000000000ef60390647d0518e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 10:14=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Build fails for qemuarm with musl with following error:
> mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*,
> void*)':
> |
> /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._Z=
L15unwind_callbackP15_Unwind_ContextPv+0x4):
> undefined reference to `_Unwind_GetIP'
>
> Referenced commit[1] for the fix, also refreshed patches.
>
> [1]
> https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec=
35c3803c344b1e72
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...001-Cargo.toml-do-not-abort-on-panic.patch |  2 +-
>  ...nfigure-do-not-look-for-llvm-objdump.patch |  2 +-
>  ...o-not-try-to-find-a-suitable-upstrea.patch |  2 +-
>  .../mozjs-128/0004-use-asm-sgidefs.h.patch    |  2 +-
>  ...2.patch =3D> 0005-Add-RISCV32-support.patch} |  2 +-
>  ...x-one-occasionally-reproduced-confi.patch} |  2 +-
>  ...ewrite-cargo-host-linker-in-python3.patch} |  2 +-
>  ...e-stack-unwinder-like-glibc-therefo.patch} |  2 +-
>  ...om-firefox-bugzilla-to-fix-compile-.patch} |  2 +-
>  ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |  2 +-
>  ...ith-icu-uc-to-fix-build-with-ICU-76.patch} |  2 +-
>  ...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++++++-------
>  .../0013-Fix-build-error-with-musl.patch      | 30 +++++++++++++++
>  .../mozjs/mozjs-128_128.5.2.bb                | 17 +++++----
>  14 files changed, 75 insertions(+), 32 deletions(-)
>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch =3D>
> 0005-Add-RISCV32-support.patch} (97%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-fix-one-occ=
asionally-reproduced-confi.patch
> =3D> 0006-util.configure-fix-one-occasionally-reproduced-confi.patch} (96=
%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-host-linker-=
in-python3.patch
> =3D> 0007-Rewrite-cargo-host-linker-in-python3.patch} (97%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwalk.patch =
=3D>
> 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch} (94%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list-of-mozinli=
ne.patch
> =3D> 0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch} (95=
%)
>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch =3D>
> 0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)
>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-uc-to-fix-bu=
ild-with-ICU-76.patch
> =3D> 0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch} (92%)
>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch =3D>
> 0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)
>  create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.p=
atch
>
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> index 97a4439628..5c81126f0b 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> @@ -1,4 +1,4 @@
> -From ddd23f8547f3a56aa542924aa400d3535f734bff Mon Sep 17 00:00:00 2001
> +From ffb7b90712189c9fa8634e4dc915c3afb4448d87 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 1 Oct 2021 13:00:24 +0200
>  Subject: [PATCH] Cargo.toml: do not abort on panic
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> index 9a82acf77b..0616aa3ee7 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> @@ -1,4 +1,4 @@
> -From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001
> +From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 1 Oct 2021 13:01:10 +0200
>  Subject: [PATCH] moz.configure: do not look for llvm-objdump
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> index 40025fbc68..8367a62a39 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> @@ -1,4 +1,4 @@
> -From 2d7f06cdf631e4d4d94e9d8e33a953dc57672750 Mon Sep 17 00:00:00 2001
> +From ca6cf215462de8f82fd27ad75eb20ac24fc0c512 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 1 Oct 2021 13:02:17 +0200
>  Subject: [PATCH] rust.configure: do not try to find a suitable upstream
> target
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> index eb3ff452b3..5832f36975 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.pat=
ch
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.pat=
ch
> @@ -1,4 +1,4 @@
> -From 1691939a22ec12245f008993e0b9a1b1dfb91e9c Mon Sep 17 00:00:00 2001
> +From af704b888a91fc3a0f88b0ef2f36de1faaf7d6e2 Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <amccurdy@gmail.com>
>  Date: Sat, 30 Apr 2016 15:29:06 -0700
>  Subject: [PATCH] use <asm/sgidefs.h>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> similarity index 97%
> rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> index 67e23c5fcc..2359373999 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> @@ -1,4 +1,4 @@
> -From 0cc41bc953974d4852b263708bf8d12f823ca8ad Mon Sep 17 00:00:00 2001
> +From 8b7f96cc479c99a286591ac6dcd0be19bcf83b15 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 24 Oct 2021 22:32:50 -0700
>  Subject: [PATCH] Add RISCV32 support
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> similarity index 96%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
> index d53cc2bd41..9cc7831876 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> @@ -1,4 +1,4 @@
> -From 683cd23dd269509a1d913adb2b049b84771e0a94 Mon Sep 17 00:00:00 2001
> +From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 11 Nov 2021 16:05:54 +0800
>  Subject: [PATCH] util.configure: fix one occasionally reproduced configu=
re
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker=
-in-python3.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker=
-in-python3.patch
> similarity index 97%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker-i=
n-python3.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker-i=
n-python3.patch
> index 94e1651b33..9d6a89214b 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker=
-in-python3.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker=
-in-python3.patch
> @@ -1,4 +1,4 @@
> -From 6f6b78628a8edc834aa147c87ebce3eb8e670e7a Mon Sep 17 00:00:00 2001
> +From 31d56eba10e7cf856a2a118e0523633195fe9ea2 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 18 Nov 2021 07:16:39 +0000
>  Subject: [PATCH] Rewrite cargo-host-linker in python3
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-=
unwinder-like-glibc-therefo.patch
> similarity index 94%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-un=
winder-like-glibc-therefo.patch
> index 3d5452ce4d..91614291c7 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.pat=
ch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-=
unwinder-like-glibc-therefo.patch
> @@ -1,4 +1,4 @@
> -From d96e9a40e9da9163e0a4b3475178fe30c26deb19 Mon Sep 17 00:00:00 2001
> +From fae21326f717f1c0031f3ad0ff4c3112ffb3a936 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 22 Sep 2023 22:59:56 +0000
>  Subject: [PATCH] Musl does not have stack unwinder like glibc therefore
> we can
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinl=
ine.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firef=
ox-bugzilla-to-fix-compile-.patch
> similarity index 95%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinlin=
e.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firefox=
-bugzilla-to-fix-compile-.patch
> index 960b4593c2..a2e3c08edf 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinl=
ine.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firef=
ox-bugzilla-to-fix-compile-.patch
> @@ -1,4 +1,4 @@
> -From 2d1fb35bd81acadc12cc077de86361ac59cee2f1 Mon Sep 17 00:00:00 2001
> +From 7dc235e1558b087c69024ed40c6066bd8126f2a3 Mon Sep 17 00:00:00 2001
>  From: Kai Kang <kai.kang@windriver.com>
>  Date: Fri, 22 Sep 2023 22:59:59 +0000
>  Subject: [PATCH] Backport patch from firefox bugzilla to fix compile
> error for
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t=
-available-in-ARMv5-or-v6-s.patch
> similarity index 93%
> rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-a=
vailable-in-ARMv5-or-v6-s.patch
> index 564f423fb4..e2e935eb03 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t=
-available-in-ARMv5-or-v6-s.patch
> @@ -1,4 +1,4 @@
> -From 0dd6fdbf6a821898617f1bd8e57123be048c07f5 Mon Sep 17 00:00:00 2001
> +From e94edc3eba7ea158806283d92ecd71ab87351838 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Mon, 16 Dec 2024 05:49:57 +0000
>  Subject: [PATCH] The ISB instruction isn't available in ARMv5 or v6, so
> guard
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> similarity index 92%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-bui=
ld-with-ICU-76.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-bui=
ld-with-ICU-76.patch
> index 4fb7a28eeb..2d85e29005 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> @@ -1,4 +1,4 @@
> -From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001
> +From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 23 Nov 2024 13:28:33 -0800
>  Subject: [PATCH] Link with icu-uc to fix build with ICU-76
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> similarity index 60%
> rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-ris=
cv32gc-as-valid-architect.patch
> index cb2dc66525..9cdb9fe913 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> @@ -1,12 +1,35 @@
> -Recognise riscv64gc and riscv32gc as valid architectures
> +From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 7 Jan 2025 15:17:16 -0800
> +Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid architecture=
s
>
>  Rust uses above for architecture in tuples
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + build/autoconf/config.sub                                     | 2 +-
> + .../mozbuild/test/configure/test_toolchain_configure.py       | 4 ++++
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub
> +index 2c6a07ab3c..f7ee82380c 100755
> +--- a/build/autoconf/config.sub
> ++++ b/build/autoconf/config.sub
> +@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
> +                       | powerpc | powerpc64 | powerpc64le | powerpcle |
> powerpcspe \
> +                       | pru \
> +                       | pyramid \
> +-                      | riscv | riscv32 | riscv32be | riscv64 |
> riscv64be \
> ++                      | riscv | riscv32 | riscv32be | riscv32gc |
> riscv64 | riscv64be | riscv64gc \
> +                       | rl78 | romp | rs6000 | rx \
> +                       | s390 | s390x \
> +                       | score \
> +diff --git
> a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> +index 1be0d02e54..a476d787b2 100644
>  --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
>  +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
> -@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas
> +@@ -1327,6 +1327,10 @@ class
> LinuxCrossCompileToolchainTest(BaseToolchainTest):
>           "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
>           "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 32},
>           "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 64},
> @@ -17,14 +40,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>           "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
>       }
>
> ---- a/build/autoconf/config.sub
> -+++ b/build/autoconf/config.sub
> -@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
> -                       | powerpc | powerpc64 | powerpc64le | powerpcle |
> powerpcspe \
> -                       | pru \
> -                       | pyramid \
> --                      | riscv | riscv32 | riscv32be | riscv64 |
> riscv64be \
> -+                      | riscv | riscv32 | riscv32be | riscv32gc |
> riscv64 | riscv64be | riscv64gc \
> -                       | rl78 | romp | rs6000 | rx \
> -                       | s390 | s390x \
> -                       | score \
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl=
.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl=
.patch
> new file mode 100644
> index 0000000000..1900c17f74
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl=
.patch
> @@ -0,0 +1,30 @@
> +From 0f903fa0be39e39083599306018fa7bd724dba9d Mon Sep 17 00:00:00 2001
> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +Date: Wed, 7 Jan 2026 20:26:53 +1300
> +Subject: [PATCH] Fix build error with musl
> +
> +_Unwind_GetIP symbol is not implemented by musl, so use it only with lib=
c.
> +
> +mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*,
> void*)':
> +|
> /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._Z=
L15unwind_callbackP15_Unwind_ContextPv+0x4):
> undefined reference to `_Unwind_GetIP'
> +
> +Reference:
> https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec=
35c3803c344b1e72
> +Upstream-Status
> <https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0e=
c35c3803c344b1e72+Upstream-Status>:
> Inappropriate [musl-specific]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + mozglue/misc/StackWalk.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp
> +index d3d9208fdb..9f7155a4f7 100644
> +--- a/mozglue/misc/StackWalk.cpp
> ++++ b/mozglue/misc/StackWalk.cpp
> +@@ -696,7 +696,7 @@ MFBT_API bool MozDescribeCodeAddress(void* aPC,
> + //
> + // Changes to to OS/Architecture support here should be reflected in
> + // build/moz.configure/memory.configure
> +-#elif HAVE_DLADDR &&                                           \
> ++#elif defined(__GLIBC__) && HAVE_DLADDR &&                     \
> +     (HAVE__UNWIND_BACKTRACE || MOZ_STACKWALK_SUPPORTS_LINUX || \
>

I am wondering if HAVE__UNWIND_BACKTRACE should have been false for musl
already. so need to
check __GLIBC__ is not needed perhaps


> +      MOZ_STACKWALK_SUPPORTS_MACOSX)
> +
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> index ceb81d07e5..fbbe3749ba 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> @@ -8,14 +8,15 @@ SRC_URI =3D "
> https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
>             file://0002-moz.configure-do-not-look-for-llvm-objdump.patch =
\
>
> file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
>             file://0004-use-asm-sgidefs.h.patch \
> -           file://riscv32.patch \
> -
>  file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
> -           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
> -           file://musl-disable-stackwalk.patch \
> -           file://0001-add-arm-to-list-of-mozinline.patch \
> -           file://armv5.patch \
> -           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
> -           file://riscv.patch \
> +           file://0005-Add-RISCV32-support.patch \
> +
>  file://0006-util.configure-fix-one-occasionally-reproduced-confi.patch \
> +           file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
> +
>  file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch \
> +
>  file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch \
> +
>  file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch \
> +           file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
> +
>  file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch \
> +           file://0013-Fix-build-error-with-musl.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef495d4997154d68358f"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123230):
> https://lists.openembedded.org/g/openembedded-devel/message/123230
> Mute This Topic: https://lists.openembedded.org/mt/117139023/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ef60390647d0518e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, =
2026 at 10:14=E2=80=AFAM Ankur Tyagi via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur=
 Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ank=
ur.tyagi85@gmail.com</a>&gt;<br>
<br>
Build fails for qemuarm with musl with following error:<br>
mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*, vo=
id*)&#39;:<br>
| /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._Z=
L15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference to `_Unwin=
d_GetIP&#39;<br>
<br>
Referenced commit[1] for the fix, also refreshed patches.<br>
<br>
[1] <a href=3D"https://github.com/OSSystems/meta-browser/commit/bb866291235=
4dae13634c0ec35c3803c344b1e72" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec35c3803c3=
44b1e72</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0...001-Cargo.toml-do-not-abort-on-panic.patch |=C2=A0 2 +-<br>
=C2=A0...nfigure-do-not-look-for-llvm-objdump.patch |=C2=A0 2 +-<br>
=C2=A0...o-not-try-to-find-a-suitable-upstrea.patch |=C2=A0 2 +-<br>
=C2=A0.../mozjs-128/0004-use-asm-sgidefs.h.patch=C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
=C2=A0...2.patch =3D&gt; 0005-Add-RISCV32-support.patch} |=C2=A0 2 +-<br>
=C2=A0...x-one-occasionally-reproduced-confi.patch} |=C2=A0 2 +-<br>
=C2=A0...ewrite-cargo-host-linker-in-python3.patch} |=C2=A0 2 +-<br>
=C2=A0...e-stack-unwinder-like-glibc-therefo.patch} |=C2=A0 2 +-<br>
=C2=A0...om-firefox-bugzilla-to-fix-compile-.patch} |=C2=A0 2 +-<br>
=C2=A0...on-isn-t-available-in-ARMv5-or-v6-s.patch} |=C2=A0 2 +-<br>
=C2=A0...ith-icu-uc-to-fix-build-with-ICU-76.patch} |=C2=A0 2 +-<br>
=C2=A0...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++++++------=
-<br>
=C2=A0.../0013-Fix-build-error-with-musl.patch=C2=A0 =C2=A0 =C2=A0 | 30 +++=
++++++++++++<br>
=C2=A0.../mozjs/<a href=3D"http://mozjs-128_128.5.2.bb" rel=3D"noreferrer" =
target=3D"_blank">mozjs-128_128.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++++----<br>
=C2=A014 files changed, 75 insertions(+), 32 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch =3D&gt=
; 0005-Add-RISCV32-support.patch} (97%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-=
fix-one-occasionally-reproduced-confi.patch =3D&gt; 0006-util.configure-fix=
-one-occasionally-reproduced-confi.patch} (96%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-h=
ost-linker-in-python3.patch =3D&gt; 0007-Rewrite-cargo-host-linker-in-pytho=
n3.patch} (97%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwa=
lk.patch =3D&gt; 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.=
patch} (94%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list=
-of-mozinline.patch =3D&gt; 0009-Backport-patch-from-firefox-bugzilla-to-fi=
x-compile-.patch} (95%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch =3D&gt; =
0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-u=
c-to-fix-build-with-ICU-76.patch =3D&gt; 0011-Link-with-icu-uc-to-fix-build=
-with-ICU-76.patch} (92%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch =3D&gt; =
0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-=
build-error-with-musl.patch<br>
<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-no=
t-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Carg=
o.toml-do-not-abort-on-panic.patch<br>
index 97a4439628..5c81126f0b 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort=
-on-panic.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort=
-on-panic.patch<br>
@@ -1,4 +1,4 @@<br>
-From ddd23f8547f3a56aa542924aa400d3535f734bff Mon Sep 17 00:00:00 2001<br>
+From ffb7b90712189c9fa8634e4dc915c3afb4448d87 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Fri, 1 Oct 2021 13:00:24 +0200<br>
=C2=A0Subject: [PATCH] Cargo.toml: do not abort on panic<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do=
-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-128=
/0002-moz.configure-do-not-look-for-llvm-objdump.patch<br>
index 9a82acf77b..0616aa3ee7 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-lo=
ok-for-llvm-objdump.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-lo=
ok-for-llvm-objdump.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001<br>
+From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Fri, 1 Oct 2021 13:01:10 +0200<br>
=C2=A0Subject: [PATCH] moz.configure: do not look for llvm-objdump<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-d=
o-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch<=
br>
index 40025fbc68..8367a62a39 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-t=
ry-to-find-a-suitable-upstrea.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-t=
ry-to-find-a-suitable-upstrea.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2d7f06cdf631e4d4d94e9d8e33a953dc57672750 Mon Sep 17 00:00:00 2001<br>
+From ca6cf215462de8f82fd27ad75eb20ac24fc0c512 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Fri, 1 Oct 2021 13:02:17 +0200<br>
=C2=A0Subject: [PATCH] rust.configure: do not try to find a suitable upstre=
am target<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.=
h.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.p=
atch<br>
index eb3ff452b3..5832f36975 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch=
<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch=
<br>
@@ -1,4 +1,4 @@<br>
-From 1691939a22ec12245f008993e0b9a1b1dfb91e9c Mon Sep 17 00:00:00 2001<br>
+From af704b888a91fc3a0f88b0ef2f36de1faaf7d6e2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Andre McCurdy &lt;<a href=3D"mailto:amccurdy@gmail.com" target=
=3D"_blank">amccurdy@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 30 Apr 2016 15:29:06 -0700<br>
=C2=A0Subject: [PATCH] use &lt;asm/sgidefs.h&gt;<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch<br>
similarity index 97%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support=
.patch<br>
index 67e23c5fcc..2359373999 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.pat=
ch<br>
@@ -1,4 +1,4 @@<br>
-From 0cc41bc953974d4852b263708bf8d12f823ca8ad Mon Sep 17 00:00:00 2001<br>
+From 8b7f96cc479c99a286591ac6dcd0be19bcf83b15 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 24 Oct 2021 22:32:50 -0700<br>
=C2=A0Subject: [PATCH] Add RISCV32 support<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-f=
ix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-confi.patch<=
br>
similarity index 96%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fi=
x-one-occasionally-reproduced-confi.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-=
one-occasionally-reproduced-confi.patch<br>
index d53cc2bd41..9cc7831876 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-=
occasionally-reproduced-confi.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-=
occasionally-reproduced-confi.patch<br>
@@ -1,4 +1,4 @@<br>
-From 683cd23dd269509a1d913adb2b049b84771e0a94 Mon Sep 17 00:00:00 2001<br>
+From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 11 Nov 2021 16:05:54 +0800<br>
=C2=A0Subject: [PATCH] util.configure: fix one occasionally reproduced conf=
igure<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-ho=
st-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-=
Rewrite-cargo-host-linker-in-python3.patch<br>
similarity index 97%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-hos=
t-linker-in-python3.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-=
linker-in-python3.patch<br>
index 94e1651b33..9d6a89214b 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-link=
er-in-python3.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-link=
er-in-python3.patch<br>
@@ -1,4 +1,4 @@<br>
-From 6f6b78628a8edc834aa147c87ebce3eb8e670e7a Mon Sep 17 00:00:00 2001<br>
+From 31d56eba10e7cf856a2a118e0523633195fe9ea2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 18 Nov 2021 07:16:39 +0000<br>
=C2=A0Subject: [PATCH] Rewrite cargo-host-linker in python3<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwal=
k.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-=
stack-unwinder-like-glibc-therefo.patch<br>
similarity index 94%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk=
.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-=
stack-unwinder-like-glibc-therefo.patch<br>
index 3d5452ce4d..91614291c7 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch=
<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stac=
k-unwinder-like-glibc-therefo.patch<br>
@@ -1,4 +1,4 @@<br>
-From d96e9a40e9da9163e0a4b3475178fe30c26deb19 Mon Sep 17 00:00:00 2001<br>
+From fae21326f717f1c0031f3ad0ff4c3112ffb3a936 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 22 Sep 2023 22:59:56 +0000<br>
=C2=A0Subject: [PATCH] Musl does not have stack unwinder like glibc therefo=
re we can<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-=
of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport=
-patch-from-firefox-bugzilla-to-fix-compile-.patch<br>
similarity index 95%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-o=
f-mozinline.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from=
-firefox-bugzilla-to-fix-compile-.patch<br>
index 960b4593c2..a2e3c08edf 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozi=
nline.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-fir=
efox-bugzilla-to-fix-compile-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2d1fb35bd81acadc12cc077de86361ac59cee2f1 Mon Sep 17 00:00:00 2001<br>
+From 7dc235e1558b087c69024ed40c6066bd8126f2a3 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=
=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
=C2=A0Date: Fri, 22 Sep 2023 22:59:59 +0000<br>
=C2=A0Subject: [PATCH] Backport patch from firefox bugzilla to fix compile =
error for<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch b/meta-oe=
/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-available-=
in-ARMv5-or-v6-s.patch<br>
similarity index 93%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction=
-isn-t-available-in-ARMv5-or-v6-s.patch<br>
index 564f423fb4..e2e935eb03 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn=
-t-available-in-ARMv5-or-v6-s.patch<br>
@@ -1,4 +1,4 @@<br>
-From 0dd6fdbf6a821898617f1bd8e57123be048c07f5 Mon Sep 17 00:00:00 2001<br>
+From e94edc3eba7ea158806283d92ecd71ab87351838 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">ross.burton@arm.com</a>&gt;<br>
=C2=A0Date: Mon, 16 Dec 2024 05:49:57 +0000<br>
=C2=A0Subject: [PATCH] The ISB instruction isn&#39;t available in ARMv5 or =
v6, so guard<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc=
-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/=
0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch<br>
similarity index 92%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-=
to-fix-build-with-ICU-76.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to=
-fix-build-with-ICU-76.patch<br>
index 4fb7a28eeb..2d85e29005 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix=
-build-with-ICU-76.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix=
-build-with-ICU-76.patch<br>
@@ -1,4 +1,4 @@<br>
-From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001<br>
+From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 23 Nov 2024 13:28:33 -0800<br>
=C2=A0Subject: [PATCH] Link with icu-uc to fix build with ICU-76<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch b/meta-oe=
/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-riscv32gc-as=
-valid-architect.patch<br>
similarity index 60%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc=
-and-riscv32gc-as-valid-architect.patch<br>
index cb2dc66525..9cdb9fe913 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and=
-riscv32gc-as-valid-architect.patch<br>
@@ -1,12 +1,35 @@<br>
-Recognise riscv64gc and riscv32gc as valid architectures<br>
+From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Tue, 7 Jan 2025 15:17:16 -0800<br>
+Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid architectures<=
br>
<br>
=C2=A0Rust uses above for architecture in tuples<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ build/autoconf/config.sub=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
+ .../mozbuild/test/configure/test_toolchain_configure.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ++++<br>
+ 2 files changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub<br>
+index 2c6a07ab3c..f7ee82380c 100755<br>
+--- a/build/autoconf/config.sub<br>
++++ b/build/autoconf/config.sub<br>
+@@ -1236,7 +1236,7 @@ case $cpu-$vendor in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| pru \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| pyramid \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv | riscv32 | riscv32be | riscv64 | riscv64be \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | riscv=
64gc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| rl78 | romp | rs6000 | rx \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| s390 | s390x \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| score \<br>
+diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_config=
ure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y<br>
+index 1be0d02e54..a476d787b2 100644<br>
=C2=A0--- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configur=
e.py<br>
=C2=A0+++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configur=
e.py<br>
-@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas<br>
+@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(BaseToolchainT=
est):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mips-unknown-linux-gnu&quot;: big_=
endian + {&quot;__mips__&quot;: 1},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv32-unknown-linux-gnu&quot;: l=
ittle_endian + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&quot;: 32},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv64-unknown-linux-gnu&quot;: l=
ittle_endian + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&quot;: 64},<br>
@@ -17,14 +40,3 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sh4-unknown-linux-gnu&quot;: littl=
e_endian + {&quot;__sh__&quot;: 1},<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
---- a/build/autoconf/config.sub<br>
-+++ b/build/autoconf/config.sub<br>
-@@ -1236,7 +1236,7 @@ case $cpu-$vendor in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| pru \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| pyramid \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv | riscv32 | riscv32be | riscv64 | riscv64be \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | riscv=
64gc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| rl78 | romp | rs6000 | rx \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| s390 | s390x \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| score \<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-=
with-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-e=
rror-with-musl.patch<br>
new file mode 100644<br>
index 0000000000..1900c17f74<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-mu=
sl.patch<br>
@@ -0,0 +1,30 @@<br>
+From 0f903fa0be39e39083599306018fa7bd724dba9d Mon Sep 17 00:00:00 2001<br>
+From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D=
"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
+Date: Wed, 7 Jan 2026 20:26:53 +1300<br>
+Subject: [PATCH] Fix build error with musl<br>
+<br>
+_Unwind_GetIP symbol is not implemented by musl, so use it only with libc.=
<br>
+<br>
+mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*, v=
oid*)&#39;:<br>
+| /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._=
ZL15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference to `_Unwi=
nd_GetIP&#39;<br>
+<br>
+Reference: <a href=3D"https://github.com/OSSystems/meta-browser/commit/bb8=
662912354dae13634c0ec35c3803c344b1e72+Upstream-Status" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/OSSystems/meta-browser/commit/bb8662912=
354dae13634c0ec35c3803c344b1e72<br>
+Upstream-Status</a>: Inappropriate [musl-specific]<br>
+Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
+---<br>
+ mozglue/misc/StackWalk.cpp | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp<br>
+index d3d9208fdb..9f7155a4f7 100644<br>
+--- a/mozglue/misc/StackWalk.cpp<br>
++++ b/mozglue/misc/StackWalk.cpp<br>
+@@ -696,7 +696,7 @@ MFBT_API bool MozDescribeCodeAddress(void* aPC,<br>
+ //<br>
+ // Changes to to OS/Architecture support here should be reflected in<br>
+ // build/moz.configure/memory.configure<br>
+-#elif HAVE_DLADDR &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++#elif defined(__GLIBC__) &amp;&amp; HAVE_DLADDR &amp;&amp;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0(HAVE__UNWIND_BACKTRACE || MOZ_STACKWALK_SUPPORTS_LINU=
X || \<br></blockquote><div><br></div><div>I am wondering if HAVE__UNWIND_B=
ACKTRACE should have been false for musl already. so need to</div><div>chec=
k __GLIBC__ is not needed perhaps</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 MOZ_STACKWALK_SUPPORTS_MACOSX)<br>
+ <br>
diff --git a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128=
.5.2.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a> b/me=
ta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.5.2.bb" rel=3D=
"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a><br>
index ceb81d07e5..fbbe3749ba 100644<br>
--- a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.5.2.bb=
" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a><br>
+++ b/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.5.2.bb=
" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a><br>
@@ -8,14 +8,15 @@ SRC_URI =3D &quot;<a href=3D"https://archive.mozilla.org/=
pub/firefox/releases/$%7BPV%7Desr/source/fire" rel=3D"noreferrer" target=3D=
"_blank">https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/f=
ire</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-moz.configure-do-not-=
look-for-llvm-objdump.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-rust.configure-do-not=
-try-to-find-a-suitable-upstrea.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-use-asm-sgidefs.h.pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://riscv32.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-util.configure-fix-on=
e-occasionally-reproduced-confi.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-rewrite-cargo-host-li=
nker-in-python3.patch=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://musl-disable-stackwalk.pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-add-arm-to-list-of-mo=
zinline.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://armv5.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Link-with-icu-uc-to-f=
ix-build-with-ICU-76.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://riscv.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Add-RISCV32-support.p=
atch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-util.configure-fix-on=
e-occasionally-reproduced-confi.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-Rewrite-cargo-host-li=
nker-in-python3.patch=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-Musl-does-not-have-st=
ack-unwinder-like-glibc-therefo.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-Backport-patch-from-f=
irefox-bugzilla-to-fix-compile-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-The-ISB-instruction-i=
sn-t-available-in-ARMv5-or-v6-s.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-Link-with-icu-uc-to-f=
ix-build-with-ICU-76.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-Recognise-riscv64gc-a=
nd-riscv32gc-as-valid-architect.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-Fix-build-error-with-=
musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;25d633eb81499cbda44b8c64fa1c1a5879d55024=
b864ef495d4997154d68358f&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123230): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123230" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123230</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117139023/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117139023/1997914</a><br>
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

--000000000000ef60390647d0518e--

