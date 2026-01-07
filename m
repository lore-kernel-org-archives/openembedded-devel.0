Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640A1D0D169
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:38:48 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13445.1767811120245515841
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gid5Nts2;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64476c85854so2335913d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767811119; x=1768415919; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ7P2cs1jIAlt9oIMxqV7eSXKHW5B9y+83Bv3vvd7zE=;
        b=Gid5Nts2NFpV1KuhztbFUSWxBp6CpJ++J7+wgeBe5IodiM4vWYfslCephUkM4K0ITW
         ys/7mzL4fOqmU1t1JIlGRZ2AY4jYLfgUKGloQCeug2rpsF1fa2qopNOxdiNtvgIvNFIO
         rGP+ET0BEy8K4/1e863E8bc0QG2F0SOo/omWMlc/7RfNNT7PPHOqQ7cbS7XqucSU5Gtk
         Ap/vZCWGlzXC5yG3yaqAkZ4uvoulB+BKxziSntq3BTzQyxoJJNASVDMXT7Rs3FSsqzCv
         FgVTMsrFG7YSN6uAYfeA4g1VtboWuGG8N2uqmy5xLgRCSkaOvCbjPUKdEUQDLsMY9R5M
         PvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767811119; x=1768415919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ7P2cs1jIAlt9oIMxqV7eSXKHW5B9y+83Bv3vvd7zE=;
        b=rPaI/cLfHztysFNpaoFtFJ1Edz1RDQT1ULBp6rcViEmk3XRoFh8I98hSM4K9MmbVNm
         zYzKn+M0HIpHuw1x1zQ4zS5WFYzovfJmJQ6WM+3BZGvk4Fyugtaidd4QiXaCkqPy2Xzz
         XFIvlxLpOayDRze4pPlq9cq+yMUMVI1gHzh3BTrcWqUOa48l5yg1YVnFm3Wrz+k7tt1D
         68loecH6frh9XaKNLZUfjm3oW5mWYpaD3bWLbPnwIISIHtSntRvyv6CFI8UdcDcL82+b
         gNkaHGHLo0XyG8qAg25aQNAvK3YLJZmLqGzkREEt/0lvny+4+3YKaFI1OtjgSfJYnMwj
         8M+Q==
X-Gm-Message-State: AOJu0YzYCFK7AF0ED4tN7rLp+DJBaVPQ08Ax3x+4ODRbQr8g64is/RzY
	03m6wkh1kJSVFlCVKl7NkVUlF73IRjuIhsslcjJxCN+xDZdG1KF8hLP1GAgIkWpXQuiRg8CdLmi
	CxMzZPmEkRcQWBFab+9RMtymrThsKy84Tzg==
X-Gm-Gg: AY/fxX4zS8CWUy22k6b9FGUJLaj//ewP61nXYhCbx31m2dpIQT9HXCXEnTi2TdCu414
	KX8g9sxikCzf2AS5PNU+vgeSW32nTC6ecebtFyLu5TJPoa61LBCxYK+FWBQL+4yvJGX4OXxq1Pe
	2P8vyQiSSr9NNaeCCQsi7AyCbNE5Y/HwiTiIoFslcgOa08c+Bic7qnB0iQJgAUexaqI8ExaMCPM
	m6606w00VOkyMbZm2h0zPxzzKAUIso6SltqhxTnHxJK8OsRc3Bc9q3/lMxpAtDwsP0zmBQSjUY8
	9JpBI92uHfOfkPLGIR+gKhAnpPmRIwqYuk6oCeLQOLu23fHPf1KsufL2gWIeSFRbQ9WfTacGpIh
	iJqHVRECl2C7Bj26bUHcpsl016rkCoibD2GEnXozebVHVUL/cHaq6PhlP
X-Google-Smtp-Source: AGHT+IHii4uGHqSx1L4V2uwr/Ab288pgItCTYNFpfxx+FRaNPLCmdzr42F5ATLoQHDt/jDSMAkcv3+iQaQpI8h35GJ4=
X-Received: by 2002:a05:690c:2607:b0:78f:c1ce:edd1 with SMTP id
 00721157ae682-790b572d2b7mr74757137b3.10.1767811119044; Wed, 07 Jan 2026
 10:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20260107181357.1028131-1-ankur.tyagi85@gmail.com>
 <CAMKF1spyYULpf0kUQsh59GTJTBqTFpRaLY2ixAVWZ_z1fd8wsA@mail.gmail.com> <CADySD0EMcCAv4CCbEn5wuBKZ6t6tVgopUeJi6g2MxJPBC44e=g@mail.gmail.com>
In-Reply-To: <CADySD0EMcCAv4CCbEn5wuBKZ6t6tVgopUeJi6g2MxJPBC44e=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2026 10:38:12 -0800
X-Gm-Features: AQt7F2qpM2_o4tmqXfjEBKOOVbF9kGe5lAbvbOhApBQXTFG5tb-f-QSrQ7nPqnQ
Message-ID: <CAMKF1spvw1tKmmR1s8vtGP74m_zdDDp9SVMj6qvHn6mcGBpV4w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] mozjs-128: Fix build error with arm and musl
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c7de650647d09905"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123236

--000000000000c7de650647d09905
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 10:36=E2=80=AFAM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:

> On Thu, Jan 8, 2026 at 7:18=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> >
> >
> > On Wed, Jan 7, 2026 at 10:14=E2=80=AFAM Ankur Tyagi via lists.openembed=
ded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>
> >> Build fails for qemuarm with musl with following error:
> >> mozglue/misc/StackWalk.o: in function
> `unwind_callback(_Unwind_Context*, void*)':
> >> |
> /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._Z=
L15unwind_callbackP15_Unwind_ContextPv+0x4):
> undefined reference to `_Unwind_GetIP'
> >>
> >> Referenced commit[1] for the fix, also refreshed patches.
> >>
> >> [1]
> https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec=
35c3803c344b1e72
> >>
> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> ---
> >>  ...001-Cargo.toml-do-not-abort-on-panic.patch |  2 +-
> >>  ...nfigure-do-not-look-for-llvm-objdump.patch |  2 +-
> >>  ...o-not-try-to-find-a-suitable-upstrea.patch |  2 +-
> >>  .../mozjs-128/0004-use-asm-sgidefs.h.patch    |  2 +-
> >>  ...2.patch =3D> 0005-Add-RISCV32-support.patch} |  2 +-
> >>  ...x-one-occasionally-reproduced-confi.patch} |  2 +-
> >>  ...ewrite-cargo-host-linker-in-python3.patch} |  2 +-
> >>  ...e-stack-unwinder-like-glibc-therefo.patch} |  2 +-
> >>  ...om-firefox-bugzilla-to-fix-compile-.patch} |  2 +-
> >>  ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |  2 +-
> >>  ...ith-icu-uc-to-fix-build-with-ICU-76.patch} |  2 +-
> >>  ...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++++++------=
-
> >>  .../0013-Fix-build-error-with-musl.patch      | 30 +++++++++++++++
> >>  .../mozjs/mozjs-128_128.5.2.bb                | 17 +++++----
> >>  14 files changed, 75 insertions(+), 32 deletions(-)
> >>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch =3D>
> 0005-Add-RISCV32-support.patch} (97%)
> >>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-fix-one-occ=
asionally-reproduced-confi.patch
> =3D> 0006-util.configure-fix-one-occasionally-reproduced-confi.patch} (96=
%)
> >>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-host-linker-=
in-python3.patch
> =3D> 0007-Rewrite-cargo-host-linker-in-python3.patch} (97%)
> >>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwalk.patch =
=3D>
> 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch} (94%)
> >>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list-of-mozinli=
ne.patch
> =3D> 0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch} (95=
%)
> >>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch =3D>
> 0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)
> >>  rename
> meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-uc-to-fix-bu=
ild-with-ICU-76.patch
> =3D> 0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch} (92%)
> >>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch =3D>
> 0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)
> >>  create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.p=
atch
> >>
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> >> index 97a4439628..5c81126f0b 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> >> @@ -1,4 +1,4 @@
> >> -From ddd23f8547f3a56aa542924aa400d3535f734bff Mon Sep 17 00:00:00 200=
1
> >> +From ffb7b90712189c9fa8634e4dc915c3afb4448d87 Mon Sep 17 00:00:00 200=
1
> >>  From: Alexander Kanavin <alex@linutronix.de>
> >>  Date: Fri, 1 Oct 2021 13:00:24 +0200
> >>  Subject: [PATCH] Cargo.toml: do not abort on panic
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> >> index 9a82acf77b..0616aa3ee7 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> >> @@ -1,4 +1,4 @@
> >> -From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 200=
1
> >> +From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 200=
1
> >>  From: Alexander Kanavin <alex@linutronix.de>
> >>  Date: Fri, 1 Oct 2021 13:01:10 +0200
> >>  Subject: [PATCH] moz.configure: do not look for llvm-objdump
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> >> index 40025fbc68..8367a62a39 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> >> @@ -1,4 +1,4 @@
> >> -From 2d7f06cdf631e4d4d94e9d8e33a953dc57672750 Mon Sep 17 00:00:00 200=
1
> >> +From ca6cf215462de8f82fd27ad75eb20ac24fc0c512 Mon Sep 17 00:00:00 200=
1
> >>  From: Alexander Kanavin <alex@linutronix.de>
> >>  Date: Fri, 1 Oct 2021 13:02:17 +0200
> >>  Subject: [PATCH] rust.configure: do not try to find a suitable
> upstream target
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> >> index eb3ff452b3..5832f36975 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> >> @@ -1,4 +1,4 @@
> >> -From 1691939a22ec12245f008993e0b9a1b1dfb91e9c Mon Sep 17 00:00:00 200=
1
> >> +From af704b888a91fc3a0f88b0ef2f36de1faaf7d6e2 Mon Sep 17 00:00:00 200=
1
> >>  From: Andre McCurdy <amccurdy@gmail.com>
> >>  Date: Sat, 30 Apr 2016 15:29:06 -0700
> >>  Subject: [PATCH] use <asm/sgidefs.h>
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> >> similarity index 97%
> >> rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> >> index 67e23c5fcc..2359373999 100644
> >> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> >> @@ -1,4 +1,4 @@
> >> -From 0cc41bc953974d4852b263708bf8d12f823ca8ad Mon Sep 17 00:00:00 200=
1
> >> +From 8b7f96cc479c99a286591ac6dcd0be19bcf83b15 Mon Sep 17 00:00:00 200=
1
> >>  From: Khem Raj <raj.khem@gmail.com>
> >>  Date: Sun, 24 Oct 2021 22:32:50 -0700
> >>  Subject: [PATCH] Add RISCV32 support
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> >> similarity index 96%
> >> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
> >> index d53cc2bd41..9cc7831876 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> >> @@ -1,4 +1,4 @@
> >> -From 683cd23dd269509a1d913adb2b049b84771e0a94 Mon Sep 17 00:00:00 200=
1
> >> +From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 200=
1
> >>  From: Changqing Li <changqing.li@windriver.com>
> >>  Date: Thu, 11 Nov 2021 16:05:54 +0800
> >>  Subject: [PATCH] util.configure: fix one occasionally reproduced
> configure
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker=
-in-python3.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker=
-in-python3.patch
> >> similarity index 97%
> >> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker-i=
n-python3.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker-i=
n-python3.patch
> >> index 94e1651b33..9d6a89214b 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker=
-in-python3.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker=
-in-python3.patch
> >> @@ -1,4 +1,4 @@
> >> -From 6f6b78628a8edc834aa147c87ebce3eb8e670e7a Mon Sep 17 00:00:00 200=
1
> >> +From 31d56eba10e7cf856a2a118e0523633195fe9ea2 Mon Sep 17 00:00:00 200=
1
> >>  From: Changqing Li <changqing.li@windriver.com>
> >>  Date: Thu, 18 Nov 2021 07:16:39 +0000
> >>  Subject: [PATCH] Rewrite cargo-host-linker in python3
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-=
unwinder-like-glibc-therefo.patch
> >> similarity index 94%
> >> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-un=
winder-like-glibc-therefo.patch
> >> index 3d5452ce4d..91614291c7 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-=
unwinder-like-glibc-therefo.patch
> >> @@ -1,4 +1,4 @@
> >> -From d96e9a40e9da9163e0a4b3475178fe30c26deb19 Mon Sep 17 00:00:00 200=
1
> >> +From fae21326f717f1c0031f3ad0ff4c3112ffb3a936 Mon Sep 17 00:00:00 200=
1
> >>  From: Khem Raj <raj.khem@gmail.com>
> >>  Date: Fri, 22 Sep 2023 22:59:56 +0000
> >>  Subject: [PATCH] Musl does not have stack unwinder like glibc
> therefore we can
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinl=
ine.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firef=
ox-bugzilla-to-fix-compile-.patch
> >> similarity index 95%
> >> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinlin=
e.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firefox=
-bugzilla-to-fix-compile-.patch
> >> index 960b4593c2..a2e3c08edf 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinl=
ine.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firef=
ox-bugzilla-to-fix-compile-.patch
> >> @@ -1,4 +1,4 @@
> >> -From 2d1fb35bd81acadc12cc077de86361ac59cee2f1 Mon Sep 17 00:00:00 200=
1
> >> +From 7dc235e1558b087c69024ed40c6066bd8126f2a3 Mon Sep 17 00:00:00 200=
1
> >>  From: Kai Kang <kai.kang@windriver.com>
> >>  Date: Fri, 22 Sep 2023 22:59:59 +0000
> >>  Subject: [PATCH] Backport patch from firefox bugzilla to fix compile
> error for
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t=
-available-in-ARMv5-or-v6-s.patch
> >> similarity index 93%
> >> rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-a=
vailable-in-ARMv5-or-v6-s.patch
> >> index 564f423fb4..e2e935eb03 100644
> >> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t=
-available-in-ARMv5-or-v6-s.patch
> >> @@ -1,4 +1,4 @@
> >> -From 0dd6fdbf6a821898617f1bd8e57123be048c07f5 Mon Sep 17 00:00:00 200=
1
> >> +From e94edc3eba7ea158806283d92ecd71ab87351838 Mon Sep 17 00:00:00 200=
1
> >>  From: Ross Burton <ross.burton@arm.com>
> >>  Date: Mon, 16 Dec 2024 05:49:57 +0000
> >>  Subject: [PATCH] The ISB instruction isn't available in ARMv5 or v6,
> so guard
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> >> similarity index 92%
> >> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-bui=
ld-with-ICU-76.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-bui=
ld-with-ICU-76.patch
> >> index 4fb7a28eeb..2d85e29005 100644
> >> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> >> @@ -1,4 +1,4 @@
> >> -From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 200=
1
> >> +From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 200=
1
> >>  From: Khem Raj <raj.khem@gmail.com>
> >>  Date: Sat, 23 Nov 2024 13:28:33 -0800
> >>  Subject: [PATCH] Link with icu-uc to fix build with ICU-76
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> >> similarity index 60%
> >> rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
> >> rename to
> meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-ris=
cv32gc-as-valid-architect.patch
> >> index cb2dc66525..9cdb9fe913 100644
> >> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> >> @@ -1,12 +1,35 @@
> >> -Recognise riscv64gc and riscv32gc as valid architectures
> >> +From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 200=
1
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Tue, 7 Jan 2025 15:17:16 -0800
> >> +Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid
> architectures
> >>
> >>  Rust uses above for architecture in tuples
> >>
> >>  Upstream-Status: Pending
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + build/autoconf/config.sub                                     | 2 +-
> >> + .../mozbuild/test/configure/test_toolchain_configure.py       | 4 ++=
++
> >> + 2 files changed, 5 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub
> >> +index 2c6a07ab3c..f7ee82380c 100755
> >> +--- a/build/autoconf/config.sub
> >> ++++ b/build/autoconf/config.sub
> >> +@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
> >> +                       | powerpc | powerpc64 | powerpc64le | powerpcl=
e
> | powerpcspe \
> >> +                       | pru \
> >> +                       | pyramid \
> >> +-                      | riscv | riscv32 | riscv32be | riscv64 |
> riscv64be \
> >> ++                      | riscv | riscv32 | riscv32be | riscv32gc |
> riscv64 | riscv64be | riscv64gc \
> >> +                       | rl78 | romp | rs6000 | rx \
> >> +                       | s390 | s390x \
> >> +                       | score \
> >> +diff --git
> a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> >> +index 1be0d02e54..a476d787b2 100644
> >>  ---
> a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> >>  +++
> b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> >> -@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas
> >> +@@ -1327,6 +1327,10 @@ class
> LinuxCrossCompileToolchainTest(BaseToolchainTest):
> >>           "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
> >>           "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 32},
> >>           "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 64},
> >> @@ -17,14 +40,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>           "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
> >>       }
> >>
> >> ---- a/build/autoconf/config.sub
> >> -+++ b/build/autoconf/config.sub
> >> -@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
> >> -                       | powerpc | powerpc64 | powerpc64le | powerpcl=
e
> | powerpcspe \
> >> -                       | pru \
> >> -                       | pyramid \
> >> --                      | riscv | riscv32 | riscv32be | riscv64 |
> riscv64be \
> >> -+                      | riscv | riscv32 | riscv32be | riscv32gc |
> riscv64 | riscv64be | riscv64gc \
> >> -                       | rl78 | romp | rs6000 | rx \
> >> -                       | s390 | s390x \
> >> -                       | score \
> >> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl=
.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl=
.patch
> >> new file mode 100644
> >> index 0000000000..1900c17f74
> >> --- /dev/null
> >> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl=
.patch
> >> @@ -0,0 +1,30 @@
> >> +From 0f903fa0be39e39083599306018fa7bd724dba9d Mon Sep 17 00:00:00 200=
1
> >> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> +Date: Wed, 7 Jan 2026 20:26:53 +1300
> >> +Subject: [PATCH] Fix build error with musl
> >> +
> >> +_Unwind_GetIP symbol is not implemented by musl, so use it only with
> libc.
> >> +
> >> +mozglue/misc/StackWalk.o: in function
> `unwind_callback(_Unwind_Context*, void*)':
> >> +|
> /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._Z=
L15unwind_callbackP15_Unwind_ContextPv+0x4):
> undefined reference to `_Unwind_GetIP'
> >> +
> >> +Reference:
> https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec=
35c3803c344b1e72
> >> +Upstream-Status: Inappropriate [musl-specific]
> >> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> +---
> >> + mozglue/misc/StackWalk.cpp | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp
> >> +index d3d9208fdb..9f7155a4f7 100644
> >> +--- a/mozglue/misc/StackWalk.cpp
> >> ++++ b/mozglue/misc/StackWalk.cpp
> >> +@@ -696,7 +696,7 @@ MFBT_API bool MozDescribeCodeAddress(void* aPC,
> >> + //
> >> + // Changes to to OS/Architecture support here should be reflected in
> >> + // build/moz.configure/memory.configure
> >> +-#elif HAVE_DLADDR &&                                           \
> >> ++#elif defined(__GLIBC__) && HAVE_DLADDR &&                     \
> >> +     (HAVE__UNWIND_BACKTRACE || MOZ_STACKWALK_SUPPORTS_LINUX || \
> >
> >
> > I am wondering if HAVE__UNWIND_BACKTRACE should have been false for mus=
l
> already. so need to
> > check __GLIBC__ is not needed perhaps
> >
>
> Hi Khem,
>
> Seems HAVE__UNWIND_BACKTRACE is not false for musl, I was getting build
> error.
> Following commit[1] is also checking for the environment
>
> [1]
> https://github.com/openembedded/meta-openembedded/commit/82c7bdd4cb4b0f11=
76afe0ad6a599f9db49f7055
>
>
OK, in that case lets add the same check here as well.


> cheers
> Ankur
>
> >>
> >> +      MOZ_STACKWALK_SUPPORTS_MACOSX)
> >> +
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> >> index ceb81d07e5..fbbe3749ba 100644
> >> --- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> >> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> >> @@ -8,14 +8,15 @@ SRC_URI =3D "
> https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
> >>
>  file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
> >>
>  file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
> >>             file://0004-use-asm-sgidefs.h.patch \
> >> -           file://riscv32.patch \
> >> -
>  file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
> >> -           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
> >> -           file://musl-disable-stackwalk.patch \
> >> -           file://0001-add-arm-to-list-of-mozinline.patch \
> >> -           file://armv5.patch \
> >> -           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patc=
h
> \
> >> -           file://riscv.patch \
> >> +           file://0005-Add-RISCV32-support.patch \
> >> +
>  file://0006-util.configure-fix-one-occasionally-reproduced-confi.patch \
> >> +           file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
> >> +
>  file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch \
> >> +
>  file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch \
> >> +
>  file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch \
> >> +           file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patc=
h
> \
> >> +
>  file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch \
> >> +           file://0013-Fix-build-error-with-musl.patch \
> >>             "
> >>  SRC_URI[sha256sum] =3D
> "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef495d4997154d68358f"
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#123230):
> https://lists.openembedded.org/g/openembedded-devel/message/123230
> >> Mute This Topic: https://lists.openembedded.org/mt/117139023/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000c7de650647d09905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 7, =
2026 at 10:36=E2=80=AFAM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gm=
ail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Jan 8, 2026 at 7:18=E2=80=AFAM Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Jan 7, 2026 at 10:14=E2=80=AFAM Ankur Tyagi via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Build fails for qemuarm with musl with following error:<br>
&gt;&gt; mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Con=
text*, void*)&#39;:<br>
&gt;&gt; | /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:=
(.text._ZL15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference t=
o `_Unwind_GetIP&#39;<br>
&gt;&gt;<br>
&gt;&gt; Referenced commit[1] for the fix, also refreshed patches.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://github.com/OSSystems/meta-browser/commit/bb=
8662912354dae13634c0ec35c3803c344b1e72" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/OSSystems/meta-browser/commit/bb8662912354dae13634c0ec=
35c3803c344b1e72</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gma=
il.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...001-Cargo.toml-do-not-abort-on-panic.patch |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...nfigure-do-not-look-for-llvm-objdump.patch |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...o-not-try-to-find-a-suitable-upstrea.patch |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 .../mozjs-128/0004-use-asm-sgidefs.h.patch=C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
&gt;&gt;=C2=A0 ...2.patch =3D&gt; 0005-Add-RISCV32-support.patch} |=C2=A0 2=
 +-<br>
&gt;&gt;=C2=A0 ...x-one-occasionally-reproduced-confi.patch} |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...ewrite-cargo-host-linker-in-python3.patch} |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...e-stack-unwinder-like-glibc-therefo.patch} |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...om-firefox-bugzilla-to-fix-compile-.patch} |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...ith-icu-uc-to-fix-build-with-ICU-76.patch} |=C2=A0 2 +-<b=
r>
&gt;&gt;=C2=A0 ...gc-and-riscv32gc-as-valid-architect.patch} | 38 +++++++++=
+++-------<br>
&gt;&gt;=C2=A0 .../0013-Fix-build-error-with-musl.patch=C2=A0 =C2=A0 =C2=A0=
 | 30 +++++++++++++++<br>
&gt;&gt;=C2=A0 .../mozjs/<a href=3D"http://mozjs-128_128.5.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++++----<br>
&gt;&gt;=C2=A0 14 files changed, 75 insertions(+), 32 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.pat=
ch =3D&gt; 0005-Add-RISCV32-support.patch} (97%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.c=
onfigure-fix-one-occasionally-reproduced-confi.patch =3D&gt; 0006-util.conf=
igure-fix-one-occasionally-reproduced-confi.patch} (96%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrit=
e-cargo-host-linker-in-python3.patch =3D&gt; 0007-Rewrite-cargo-host-linker=
-in-python3.patch} (97%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disabl=
e-stackwalk.patch =3D&gt; 0008-Musl-does-not-have-stack-unwinder-like-glibc=
-therefo.patch} (94%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-ar=
m-to-list-of-mozinline.patch =3D&gt; 0009-Backport-patch-from-firefox-bugzi=
lla-to-fix-compile-.patch} (95%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch=
 =3D&gt; 0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (=
93%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-w=
ith-icu-uc-to-fix-build-with-ICU-76.patch =3D&gt; 0011-Link-with-icu-uc-to-=
fix-build-with-ICU-76.patch} (92%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch=
 =3D&gt; 0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (=
60%)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/=
0013-Fix-build-error-with-musl.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.t=
oml-do-not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/=
0001-Cargo.toml-do-not-abort-on-panic.patch<br>
&gt;&gt; index 97a4439628..5c81126f0b 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-=
not-abort-on-panic.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-=
not-abort-on-panic.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From ddd23f8547f3a56aa542924aa400d3535f734bff Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From ffb7b90712189c9fa8634e4dc915c3afb4448d87 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Fri, 1 Oct 2021 13:00:24 +0200<br>
&gt;&gt;=C2=A0 Subject: [PATCH] Cargo.toml: do not abort on panic<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.con=
figure-do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/=
mozjs-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch<br>
&gt;&gt; index 9a82acf77b..0616aa3ee7 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-=
do-not-look-for-llvm-objdump.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-=
do-not-look-for-llvm-objdump.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Fri, 1 Oct 2021 13:01:10 +0200<br>
&gt;&gt;=C2=A0 Subject: [PATCH] moz.configure: do not look for llvm-objdump=
<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.co=
nfigure-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-exten=
ded/mozjs/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstr=
ea.patch<br>
&gt;&gt; index 40025fbc68..8367a62a39 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 2d7f06cdf631e4d4d94e9d8e33a953dc57672750 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From ca6cf215462de8f82fd27ad75eb20ac24fc0c512 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Fri, 1 Oct 2021 13:02:17 +0200<br>
&gt;&gt;=C2=A0 Subject: [PATCH] rust.configure: do not try to find a suitab=
le upstream target<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm=
-sgidefs.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sg=
idefs.h.patch<br>
&gt;&gt; index eb3ff452b3..5832f36975 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidef=
s.h.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidef=
s.h.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 1691939a22ec12245f008993e0b9a1b1dfb91e9c Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From af704b888a91fc3a0f88b0ef2f36de1faaf7d6e2 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Andre McCurdy &lt;<a href=3D"mailto:amccurdy@gmail.com=
" target=3D"_blank">amccurdy@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Sat, 30 Apr 2016 15:29:06 -0700<br>
&gt;&gt;=C2=A0 Subject: [PATCH] use &lt;asm/sgidefs.h&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patc=
h b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch=
<br>
&gt;&gt; similarity index 97%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch=
<br>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV3=
2-support.patch<br>
&gt;&gt; index 67e23c5fcc..2359373999 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-su=
pport.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 0cc41bc953974d4852b263708bf8d12f823ca8ad Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From 8b7f96cc479c99a286591ac6dcd0be19bcf83b15 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Sun, 24 Oct 2021 22:32:50 -0700<br>
&gt;&gt;=C2=A0 Subject: [PATCH] Add RISCV32 support<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.co=
nfigure-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-exten=
ded/mozjs/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-con=
fi.patch<br>
&gt;&gt; similarity index 96%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.con=
figure-fix-one-occasionally-reproduced-confi.patch<br>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.confi=
gure-fix-one-occasionally-reproduced-confi.patch<br>
&gt;&gt; index d53cc2bd41..9cc7831876 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure=
-fix-one-occasionally-reproduced-confi.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure=
-fix-one-occasionally-reproduced-confi.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 683cd23dd269509a1d913adb2b049b84771e0a94 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Thu, 11 Nov 2021 16:05:54 +0800<br>
&gt;&gt;=C2=A0 Subject: [PATCH] util.configure: fix one occasionally reprod=
uced configure<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite=
-cargo-host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-=
128/0007-Rewrite-cargo-host-linker-in-python3.patch<br>
&gt;&gt; similarity index 97%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-=
cargo-host-linker-in-python3.patch<br>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-ca=
rgo-host-linker-in-python3.patch<br>
&gt;&gt; index 94e1651b33..9d6a89214b 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-=
host-linker-in-python3.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-=
host-linker-in-python3.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 6f6b78628a8edc834aa147c87ebce3eb8e670e7a Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From 31d56eba10e7cf856a2a118e0523633195fe9ea2 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Thu, 18 Nov 2021 07:16:39 +0000<br>
&gt;&gt;=C2=A0 Subject: [PATCH] Rewrite cargo-host-linker in python3<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable=
-stackwalk.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-=
not-have-stack-unwinder-like-glibc-therefo.patch<br>
&gt;&gt; similarity index 94%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-=
stackwalk.patch<br>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-=
not-have-stack-unwinder-like-glibc-therefo.patch<br>
&gt;&gt; index 3d5452ce4d..91614291c7 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackw=
alk.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-=
have-stack-unwinder-like-glibc-therefo.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From d96e9a40e9da9163e0a4b3475178fe30c26deb19 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From fae21326f717f1c0031f3ad0ff4c3112ffb3a936 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Fri, 22 Sep 2023 22:59:56 +0000<br>
&gt;&gt;=C2=A0 Subject: [PATCH] Musl does not have stack unwinder like glib=
c therefore we can<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm=
-to-list-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0009=
-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch<br>
&gt;&gt; similarity index 95%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-=
to-list-of-mozinline.patch<br>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-p=
atch-from-firefox-bugzilla-to-fix-compile-.patch<br>
&gt;&gt; index 960b4593c2..a2e3c08edf 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-lis=
t-of-mozinline.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch=
-from-firefox-bugzilla-to-fix-compile-.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 2d1fb35bd81acadc12cc077de86361ac59cee2f1 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From 7dc235e1558b087c69024ed40c6066bd8126f2a3 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Fri, 22 Sep 2023 22:59:59 +0000<br>
&gt;&gt;=C2=A0 Subject: [PATCH] Backport patch from firefox bugzilla to fix=
 compile error for<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch =
b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-a=
vailable-in-ARMv5-or-v6-s.patch<br>
&gt;&gt; similarity index 93%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch<b=
r>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-in=
struction-isn-t-available-in-ARMv5-or-v6-s.patch<br>
&gt;&gt; index 564f423fb4..e2e935eb03 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instru=
ction-isn-t-available-in-ARMv5-or-v6-s.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From 0dd6fdbf6a821898617f1bd8e57123be048c07f5 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From e94edc3eba7ea158806283d92ecd71ab87351838 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Mon, 16 Dec 2024 05:49:57 +0000<br>
&gt;&gt;=C2=A0 Subject: [PATCH] The ISB instruction isn&#39;t available in =
ARMv5 or v6, so guard<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-wi=
th-icu-uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/m=
ozjs-128/0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch<br>
&gt;&gt; similarity index 92%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-wit=
h-icu-uc-to-fix-build-with-ICU-76.patch<br>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-=
icu-uc-to-fix-build-with-ICU-76.patch<br>
&gt;&gt; index 4fb7a28eeb..2d85e29005 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-=
uc-to-fix-build-with-ICU-76.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-=
uc-to-fix-build-with-ICU-76.patch<br>
&gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; -From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 Date: Sat, 23 Nov 2024 13:28:33 -0800<br>
&gt;&gt;=C2=A0 Subject: [PATCH] Link with icu-uc to fix build with ICU-76<b=
r>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch =
b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-ris=
cv32gc-as-valid-architect.patch<br>
&gt;&gt; similarity index 60%<br>
&gt;&gt; rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch<b=
r>
&gt;&gt; rename to meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-=
riscv64gc-and-riscv32gc-as-valid-architect.patch<br>
&gt;&gt; index cb2dc66525..9cdb9fe913 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-risc=
v64gc-and-riscv32gc-as-valid-architect.patch<br>
&gt;&gt; @@ -1,12 +1,35 @@<br>
&gt;&gt; -Recognise riscv64gc and riscv32gc as valid architectures<br>
&gt;&gt; +From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Tue, 7 Jan 2025 15:17:16 -0800<br>
&gt;&gt; +Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid archi=
tectures<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 Rust uses above for architecture in tuples<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + build/autoconf/config.sub=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; + .../mozbuild/test/configure/test_toolchain_configure.py=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt;&gt; + 2 files changed, 5 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/build/autoconf/config.sub b/build/autoconf/config.su=
b<br>
&gt;&gt; +index 2c6a07ab3c..f7ee82380c 100755<br>
&gt;&gt; +--- a/build/autoconf/config.sub<br>
&gt;&gt; ++++ b/build/autoconf/config.sub<br>
&gt;&gt; +@@ -1236,7 +1236,7 @@ case $cpu-$vendor in<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| powerpc | powerpc64 | powerpc64le | powerpcle | power=
pcspe \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| pru \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| pyramid \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | riscv | riscv32 | riscv32be | riscv64 | riscv64be \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64=
be | riscv64gc \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| rl78 | romp | rs6000 | rx \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| s390 | s390x \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| score \<br>
&gt;&gt; +diff --git a/python/mozbuild/mozbuild/test/configure/test_toolcha=
in_configure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_co=
nfigure.py<br>
&gt;&gt; +index 1be0d02e54..a476d787b2 100644<br>
&gt;&gt;=C2=A0 --- a/python/mozbuild/mozbuild/test/configure/test_toolchain=
_configure.py<br>
&gt;&gt;=C2=A0 +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain=
_configure.py<br>
&gt;&gt; -@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas<b=
r>
&gt;&gt; +@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(BaseT=
oolchainTest):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mips-unknown-linux-g=
nu&quot;: big_endian + {&quot;__mips__&quot;: 1},<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;riscv32-unknown-linu=
x-gnu&quot;: little_endian + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&qu=
ot;: 32},<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;riscv64-unknown-linu=
x-gnu&quot;: little_endian + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&qu=
ot;: 64},<br>
&gt;&gt; @@ -17,14 +40,3 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sh4-unknown-linux-gn=
u&quot;: little_endian + {&quot;__sh__&quot;: 1},<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; ---- a/build/autoconf/config.sub<br>
&gt;&gt; -+++ b/build/autoconf/config.sub<br>
&gt;&gt; -@@ -1236,7 +1236,7 @@ case $cpu-$vendor in<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| powerpc | powerpc64 | powerpc64le | powerpcle | power=
pcspe \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| pru \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| pyramid \<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | riscv | riscv32 | riscv32be | riscv64 | riscv64be \<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64=
be | riscv64gc \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| rl78 | romp | rs6000 | rx \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| s390 | s390x \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| score \<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-bui=
ld-error-with-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fi=
x-build-error-with-musl.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..1900c17f74<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-erro=
r-with-musl.patch<br>
&gt;&gt; @@ -0,0 +1,30 @@<br>
&gt;&gt; +From 0f903fa0be39e39083599306018fa7bd724dba9d Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 7 Jan 2026 20:26:53 +1300<br>
&gt;&gt; +Subject: [PATCH] Fix build error with musl<br>
&gt;&gt; +<br>
&gt;&gt; +_Unwind_GetIP symbol is not implemented by musl, so use it only w=
ith libc.<br>
&gt;&gt; +<br>
&gt;&gt; +mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Co=
ntext*, void*)&#39;:<br>
&gt;&gt; +| /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810=
:(.text._ZL15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference =
to `_Unwind_GetIP&#39;<br>
&gt;&gt; +<br>
&gt;&gt; +Reference: <a href=3D"https://github.com/OSSystems/meta-browser/c=
ommit/bb8662912354dae13634c0ec35c3803c344b1e72" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/OSSystems/meta-browser/commit/bb8662912354da=
e13634c0ec35c3803c344b1e72</a><br>
&gt;&gt; +Upstream-Status: Inappropriate [musl-specific]<br>
&gt;&gt; +Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gm=
ail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + mozglue/misc/StackWalk.cpp | 2 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.=
cpp<br>
&gt;&gt; +index d3d9208fdb..9f7155a4f7 100644<br>
&gt;&gt; +--- a/mozglue/misc/StackWalk.cpp<br>
&gt;&gt; ++++ b/mozglue/misc/StackWalk.cpp<br>
&gt;&gt; +@@ -696,7 +696,7 @@ MFBT_API bool MozDescribeCodeAddress(void* aP=
C,<br>
&gt;&gt; + //<br>
&gt;&gt; + // Changes to to OS/Architecture support here should be reflecte=
d in<br>
&gt;&gt; + // build/moz.configure/memory.configure<br>
&gt;&gt; +-#elif HAVE_DLADDR &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++#elif defined(__GLIBC__) &amp;&amp; HAVE_DLADDR &amp;&amp;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0(HAVE__UNWIND_BACKTRACE || MOZ_STACKWALK_SUPP=
ORTS_LINUX || \<br>
&gt;<br>
&gt;<br>
&gt; I am wondering if HAVE__UNWIND_BACKTRACE should have been false for mu=
sl already. so need to<br>
&gt; check __GLIBC__ is not needed perhaps<br>
&gt;<br>
<br>
Hi Khem,<br>
<br>
Seems HAVE__UNWIND_BACKTRACE is not false for musl, I was getting build err=
or.<br>
Following commit[1] is also checking for the environment<br>
<br>
[1] <a href=3D"https://github.com/openembedded/meta-openembedded/commit/82c=
7bdd4cb4b0f1176afe0ad6a599f9db49f7055" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/openembedded/meta-openembedded/commit/82c7bdd4cb4b0f117=
6afe0ad6a599f9db49f7055</a><br>
<br></blockquote><div><br></div><div>OK, in that case lets add the same che=
ck here as well.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
cheers<br>
Ankur<br>
<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 MOZ_STACKWALK_SUPPORTS_MACOSX)<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozj=
s-128_128.5.2.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb=
</a> b/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.5.2.b=
b" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a><br>
&gt;&gt; index ceb81d07e5..fbbe3749ba 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_1=
28.5.2.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a><br=
>
&gt;&gt; +++ b/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_1=
28.5.2.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.5.2.bb</a><br=
>
&gt;&gt; @@ -8,14 +8,15 @@ SRC_URI =3D &quot;<a href=3D"https://archive.moz=
illa.org/pub/firefox/releases/$%7BPV%7Desr/source/fire" rel=3D"noreferrer" =
target=3D"_blank">https://archive.mozilla.org/pub/firefox/releases/${PV}esr=
/source/fire</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-moz.con=
figure-do-not-look-for-llvm-objdump.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-rust.co=
nfigure-do-not-try-to-find-a-suitable-upstrea.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-use-asm=
-sgidefs.h.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://riscv32.patch \<b=
r>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-util.configu=
re-fix-one-occasionally-reproduced-confi.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-rewrite-carg=
o-host-linker-in-python3.patch=C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://musl-disable-stac=
kwalk.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-add-arm-to-l=
ist-of-mozinline.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://armv5.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Link-with-ic=
u-uc-to-fix-build-with-ICU-76.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://riscv.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Add-RISCV32-=
support.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-util.configu=
re-fix-one-occasionally-reproduced-confi.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-Rewrite-carg=
o-host-linker-in-python3.patch=C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-Musl-does-no=
t-have-stack-unwinder-like-glibc-therefo.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-Backport-pat=
ch-from-firefox-bugzilla-to-fix-compile-.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-The-ISB-inst=
ruction-isn-t-available-in-ARMv5-or-v6-s.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-Link-with-ic=
u-uc-to-fix-build-with-ICU-76.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-Recognise-ri=
scv64gc-and-riscv32gc-as-valid-architect.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-Fix-build-er=
ror-with-musl.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;25d633eb81499cbda44b8c64fa1c1a5=
879d55024b864ef495d4997154d68358f&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#123230): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/123230" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/123230</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1171=
39023/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/117139023/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000c7de650647d09905--

