Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608A4D0D15D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:36:38 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13390.1767810997889368095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QBjzggv7;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-459ac606f0bso1395289b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767810997; x=1768415797; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QnLIYUk7wxXlNJhMqZ8rM7T9yTOmopYGswuoXTFkcI=;
        b=QBjzggv794T2rCmmdpcCzDRVsMeEprgkIa46q0mGejkZxCXCMFX4QAWs8PfLdnfuYQ
         ncVvPuYW60LTxDh17Q5X4CDghZTGvSSKG8kPex7gJ3AqkASkv4yoICh38u5rwVrCwJj2
         CKGwzuPWewRWQ9Z2+AGwlJN6WlB/VwZ0GAIat3H4aN19fku10vfxLBZKHnYw5PHc0av0
         bfcu6CT1+7ADKBoJmLxuW9Jrwp4Lyracjcd9GZBGI3GjRsQaYos9dwH4I2xVLUeV7Gjo
         cgSDLN59cfx11DA9fTVoX8DMOSzAKm7881TpKIZJsGt30iGuRgB+0XJ6L7ylqPzrUWHP
         9pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810997; x=1768415797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8QnLIYUk7wxXlNJhMqZ8rM7T9yTOmopYGswuoXTFkcI=;
        b=Bs/Nf9EOpbFB0CREHE/T730da7sxuMSTUl3NIT3QqPx5oIpPLzTwmdPr+DiO84+hrZ
         XiiuVCbd6TEM4hA3OwBdNGWSRRoUr5VHuKCLajQEYM1tY9lmwCeq+N1H1yo5NM7ndsCq
         Y+8M1VK9CCCfsMz137Cu44mBytOW1m7vEqpPML/JrWuy394yzUcjen1EIz44TI47BP1g
         14F58nsSgegJggwbH2bxCD/N2BmCsD3PGvEIbKDAoLa/JyhSLFjm672Lb6WbLsAtqK7C
         z0pIi0S0wTNmdDf5FsKfuRHVI/ydtLI0qjcTvsbT0DD6jbQn9KPtrSu+Fa+JmBuQCrbS
         k0Vw==
X-Gm-Message-State: AOJu0Yw6CQ9UXx0xDgFJ+XyhIE4VCENukAjXiiAAneGGH27x0gtoVaCC
	UakplLtB6A3bk6AIzbPDa3e4rwnCzy/2LFON0y0hd7oolbR2JA6Y0uDtfL8S0ZZk/uuRbJNs2YF
	XjIB7z1nyKqk1A9v6SnOU3Q8XTJtQ7M0=
X-Gm-Gg: AY/fxX40pgN5cfw/tfi3UeMJXx/e1jJRWDFsSlFIRvsAAllwCL73eHPJov4x95DmZkT
	OdIPAimDSTpQ6oTgMzWMxKqU9z3SUGAE7FENhidBE0TGPWojycq+yA8kRmPxcU8s6Ds3Cr+sd/c
	KxacmSbeE+vS0j95y2geo4+95h5zvKVQxDVR2FGwwdcZIBStzxLa0gWn2M8CcYijHtzrd+soUAr
	hQsrSkREu6WKwsFKkqFXQBdAvNzrWWcwbPMWi5WyK4PvfQL417wxTu24v3zhG2+pufhMXwG9Wsr
	j4H7930=
X-Google-Smtp-Source: AGHT+IGfKL3l0JfEofHqLolctkY2mNijSYYDKWJTBdfn3oRya/2bRdJjFeQGUoK5Ddy6FUyCojieYW10ZTDUl07pgY4=
X-Received: by 2002:a05:6808:3445:b0:43f:63cc:aefa with SMTP id
 5614622812f47-45a6be91403mr1289969b6e.48.1767810996994; Wed, 07 Jan 2026
 10:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20260107181357.1028131-1-ankur.tyagi85@gmail.com> <CAMKF1spyYULpf0kUQsh59GTJTBqTFpRaLY2ixAVWZ_z1fd8wsA@mail.gmail.com>
In-Reply-To: <CAMKF1spyYULpf0kUQsh59GTJTBqTFpRaLY2ixAVWZ_z1fd8wsA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 8 Jan 2026 07:36:25 +1300
X-Gm-Features: AQt7F2plvLvRgaap2uwL0CV1JnpcKYiv1E9OeU-nxHDfSv9EQNgsUZJT59Y3Zy8
Message-ID: <CADySD0EMcCAv4CCbEn5wuBKZ6t6tVgopUeJi6g2MxJPBC44e=g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] mozjs-128: Fix build error with arm and musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 18:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123235

On Thu, Jan 8, 2026 at 7:18=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Wed, Jan 7, 2026 at 10:14=E2=80=AFAM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Build fails for qemuarm with musl with following error:
>> mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*,=
 void*)':
>> | /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text=
._ZL15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference to `_Un=
wind_GetIP'
>>
>> Referenced commit[1] for the fix, also refreshed patches.
>>
>> [1] https://github.com/OSSystems/meta-browser/commit/bb8662912354dae1363=
4c0ec35c3803c344b1e72
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  ...001-Cargo.toml-do-not-abort-on-panic.patch |  2 +-
>>  ...nfigure-do-not-look-for-llvm-objdump.patch |  2 +-
>>  ...o-not-try-to-find-a-suitable-upstrea.patch |  2 +-
>>  .../mozjs-128/0004-use-asm-sgidefs.h.patch    |  2 +-
>>  ...2.patch =3D> 0005-Add-RISCV32-support.patch} |  2 +-
>>  ...x-one-occasionally-reproduced-confi.patch} |  2 +-
>>  ...ewrite-cargo-host-linker-in-python3.patch} |  2 +-
>>  ...e-stack-unwinder-like-glibc-therefo.patch} |  2 +-
>>  ...om-firefox-bugzilla-to-fix-compile-.patch} |  2 +-
>>  ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |  2 +-
>>  ...ith-icu-uc-to-fix-build-with-ICU-76.patch} |  2 +-
>>  ...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++++++-------
>>  .../0013-Fix-build-error-with-musl.patch      | 30 +++++++++++++++
>>  .../mozjs/mozjs-128_128.5.2.bb                | 17 +++++----
>>  14 files changed, 75 insertions(+), 32 deletions(-)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch =3D> 000=
5-Add-RISCV32-support.patch} (97%)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-fi=
x-one-occasionally-reproduced-confi.patch =3D> 0006-util.configure-fix-one-=
occasionally-reproduced-confi.patch} (96%)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-hos=
t-linker-in-python3.patch =3D> 0007-Rewrite-cargo-host-linker-in-python3.pa=
tch} (97%)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwalk=
.patch =3D> 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch=
} (94%)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list-o=
f-mozinline.patch =3D> 0009-Backport-patch-from-firefox-bugzilla-to-fix-com=
pile-.patch} (95%)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch =3D> 0010-=
The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-uc-=
to-fix-build-with-ICU-76.patch =3D> 0011-Link-with-icu-uc-to-fix-build-with=
-ICU-76.patch} (92%)
>>  rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch =3D> 0012-=
Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)
>>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-bu=
ild-error-with-musl.patch
>>
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do=
-not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-C=
argo.toml-do-not-abort-on-panic.patch
>> index 97a4439628..5c81126f0b 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-ab=
ort-on-panic.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-ab=
ort-on-panic.patch
>> @@ -1,4 +1,4 @@
>> -From ddd23f8547f3a56aa542924aa400d3535f734bff Mon Sep 17 00:00:00 2001
>> +From ffb7b90712189c9fa8634e4dc915c3afb4448d87 Mon Sep 17 00:00:00 2001
>>  From: Alexander Kanavin <alex@linutronix.de>
>>  Date: Fri, 1 Oct 2021 13:00:24 +0200
>>  Subject: [PATCH] Cargo.toml: do not abort on panic
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure=
-do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-=
128/0002-moz.configure-do-not-look-for-llvm-objdump.patch
>> index 9a82acf77b..0616aa3ee7 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not=
-look-for-llvm-objdump.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not=
-look-for-llvm-objdump.patch
>> @@ -1,4 +1,4 @@
>> -From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001
>> +From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 2001
>>  From: Alexander Kanavin <alex@linutronix.de>
>>  Date: Fri, 1 Oct 2021 13:01:10 +0200
>>  Subject: [PATCH] moz.configure: do not look for llvm-objdump
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configur=
e-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mo=
zjs/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.pat=
ch
>> index 40025fbc68..8367a62a39 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-no=
t-try-to-find-a-suitable-upstrea.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-no=
t-try-to-find-a-suitable-upstrea.patch
>> @@ -1,4 +1,4 @@
>> -From 2d7f06cdf631e4d4d94e9d8e33a953dc57672750 Mon Sep 17 00:00:00 2001
>> +From ca6cf215462de8f82fd27ad75eb20ac24fc0c512 Mon Sep 17 00:00:00 2001
>>  From: Alexander Kanavin <alex@linutronix.de>
>>  Date: Fri, 1 Oct 2021 13:02:17 +0200
>>  Subject: [PATCH] rust.configure: do not try to find a suitable upstream=
 target
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgide=
fs.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.=
h.patch
>> index eb3ff452b3..5832f36975 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.pa=
tch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.pa=
tch
>> @@ -1,4 +1,4 @@
>> -From 1691939a22ec12245f008993e0b9a1b1dfb91e9c Mon Sep 17 00:00:00 2001
>> +From af704b888a91fc3a0f88b0ef2f36de1faaf7d6e2 Mon Sep 17 00:00:00 2001
>>  From: Andre McCurdy <amccurdy@gmail.com>
>>  Date: Sat, 30 Apr 2016 15:29:06 -0700
>>  Subject: [PATCH] use <asm/sgidefs.h>
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch b/me=
ta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
>> similarity index 97%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-supp=
ort.patch
>> index 67e23c5fcc..2359373999 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.=
patch
>> @@ -1,4 +1,4 @@
>> -From 0cc41bc953974d4852b263708bf8d12f823ca8ad Mon Sep 17 00:00:00 2001
>> +From 8b7f96cc479c99a286591ac6dcd0be19bcf83b15 Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Sun, 24 Oct 2021 22:32:50 -0700
>>  Subject: [PATCH] Add RISCV32 support
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configur=
e-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mo=
zjs/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-confi.pat=
ch
>> similarity index 96%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure=
-fix-one-occasionally-reproduced-confi.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-f=
ix-one-occasionally-reproduced-confi.patch
>> index d53cc2bd41..9cc7831876 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-o=
ne-occasionally-reproduced-confi.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-o=
ne-occasionally-reproduced-confi.patch
>> @@ -1,4 +1,4 @@
>> -From 683cd23dd269509a1d913adb2b049b84771e0a94 Mon Sep 17 00:00:00 2001
>> +From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 2001
>>  From: Changqing Li <changqing.li@windriver.com>
>>  Date: Thu, 11 Nov 2021 16:05:54 +0800
>>  Subject: [PATCH] util.configure: fix one occasionally reproduced config=
ure
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo=
-host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/00=
07-Rewrite-cargo-host-linker-in-python3.patch
>> similarity index 97%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-=
host-linker-in-python3.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-ho=
st-linker-in-python3.patch
>> index 94e1651b33..9d6a89214b 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-l=
inker-in-python3.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-l=
inker-in-python3.patch
>> @@ -1,4 +1,4 @@
>> -From 6f6b78628a8edc834aa147c87ebce3eb8e670e7a Mon Sep 17 00:00:00 2001
>> +From 31d56eba10e7cf856a2a118e0523633195fe9ea2 Mon Sep 17 00:00:00 2001
>>  From: Changqing Li <changqing.li@windriver.com>
>>  Date: Thu, 18 Nov 2021 07:16:39 +0000
>>  Subject: [PATCH] Rewrite cargo-host-linker in python3
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stack=
walk.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-ha=
ve-stack-unwinder-like-glibc-therefo.patch
>> similarity index 94%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackw=
alk.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-ha=
ve-stack-unwinder-like-glibc-therefo.patch
>> index 3d5452ce4d..91614291c7 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.pa=
tch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-s=
tack-unwinder-like-glibc-therefo.patch
>> @@ -1,4 +1,4 @@
>> -From d96e9a40e9da9163e0a4b3475178fe30c26deb19 Mon Sep 17 00:00:00 2001
>> +From fae21326f717f1c0031f3ad0ff4c3112ffb3a936 Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Fri, 22 Sep 2023 22:59:56 +0000
>>  Subject: [PATCH] Musl does not have stack unwinder like glibc therefore=
 we can
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-li=
st-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backp=
ort-patch-from-firefox-bugzilla-to-fix-compile-.patch
>> similarity index 95%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-lis=
t-of-mozinline.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-f=
rom-firefox-bugzilla-to-fix-compile-.patch
>> index 960b4593c2..a2e3c08edf 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-m=
ozinline.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-=
firefox-bugzilla-to-fix-compile-.patch
>> @@ -1,4 +1,4 @@
>> -From 2d1fb35bd81acadc12cc077de86361ac59cee2f1 Mon Sep 17 00:00:00 2001
>> +From 7dc235e1558b087c69024ed40c6066bd8126f2a3 Mon Sep 17 00:00:00 2001
>>  From: Kai Kang <kai.kang@windriver.com>
>>  Date: Fri, 22 Sep 2023 22:59:59 +0000
>>  Subject: [PATCH] Backport patch from firefox bugzilla to fix compile er=
ror for
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch b/meta=
-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-availab=
le-in-ARMv5-or-v6-s.patch
>> similarity index 93%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruct=
ion-isn-t-available-in-ARMv5-or-v6-s.patch
>> index 564f423fb4..e2e935eb03 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-=
isn-t-available-in-ARMv5-or-v6-s.patch
>> @@ -1,4 +1,4 @@
>> -From 0dd6fdbf6a821898617f1bd8e57123be048c07f5 Mon Sep 17 00:00:00 2001
>> +From e94edc3eba7ea158806283d92ecd71ab87351838 Mon Sep 17 00:00:00 2001
>>  From: Ross Burton <ross.burton@arm.com>
>>  Date: Mon, 16 Dec 2024 05:49:57 +0000
>>  Subject: [PATCH] The ISB instruction isn't available in ARMv5 or v6, so=
 guard
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu=
-uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-1=
28/0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
>> similarity index 92%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-=
uc-to-fix-build-with-ICU-76.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc=
-to-fix-build-with-ICU-76.patch
>> index 4fb7a28eeb..2d85e29005 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-=
fix-build-with-ICU-76.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-=
fix-build-with-ICU-76.patch
>> @@ -1,4 +1,4 @@
>> -From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001
>> +From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Sat, 23 Nov 2024 13:28:33 -0800
>>  Subject: [PATCH] Link with icu-uc to fix build with ICU-76
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch b/meta=
-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-riscv32gc=
-as-valid-architect.patch
>> similarity index 60%
>> rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
>> rename to meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv6=
4gc-and-riscv32gc-as-valid-architect.patch
>> index cb2dc66525..9cdb9fe913 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-=
and-riscv32gc-as-valid-architect.patch
>> @@ -1,12 +1,35 @@
>> -Recognise riscv64gc and riscv32gc as valid architectures
>> +From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 7 Jan 2025 15:17:16 -0800
>> +Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid architectur=
es
>>
>>  Rust uses above for architecture in tuples
>>
>>  Upstream-Status: Pending
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + build/autoconf/config.sub                                     | 2 +-
>> + .../mozbuild/test/configure/test_toolchain_configure.py       | 4 ++++
>> + 2 files changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub
>> +index 2c6a07ab3c..f7ee82380c 100755
>> +--- a/build/autoconf/config.sub
>> ++++ b/build/autoconf/config.sub
>> +@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
>> +                       | powerpc | powerpc64 | powerpc64le | powerpcle =
| powerpcspe \
>> +                       | pru \
>> +                       | pyramid \
>> +-                      | riscv | riscv32 | riscv32be | riscv64 | riscv6=
4be \
>> ++                      | riscv | riscv32 | riscv32be | riscv32gc | risc=
v64 | riscv64be | riscv64gc \
>> +                       | rl78 | romp | rs6000 | rx \
>> +                       | s390 | s390x \
>> +                       | score \
>> +diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_con=
figure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configur=
e.py
>> +index 1be0d02e54..a476d787b2 100644
>>  --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.=
py
>>  +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.=
py
>> -@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas
>> +@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(BaseToolcha=
inTest):
>>           "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
>>           "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "_=
_riscv_xlen": 32},
>>           "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "_=
_riscv_xlen": 64},
>> @@ -17,14 +40,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>           "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
>>       }
>>
>> ---- a/build/autoconf/config.sub
>> -+++ b/build/autoconf/config.sub
>> -@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
>> -                       | powerpc | powerpc64 | powerpc64le | powerpcle =
| powerpcspe \
>> -                       | pru \
>> -                       | pyramid \
>> --                      | riscv | riscv32 | riscv32be | riscv64 | riscv6=
4be \
>> -+                      | riscv | riscv32 | riscv32be | riscv32gc | risc=
v64 | riscv64be | riscv64gc \
>> -                       | rl78 | romp | rs6000 | rx \
>> -                       | s390 | s390x \
>> -                       | score \
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-err=
or-with-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-buil=
d-error-with-musl.patch
>> new file mode 100644
>> index 0000000000..1900c17f74
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with=
-musl.patch
>> @@ -0,0 +1,30 @@
>> +From 0f903fa0be39e39083599306018fa7bd724dba9d Mon Sep 17 00:00:00 2001
>> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> +Date: Wed, 7 Jan 2026 20:26:53 +1300
>> +Subject: [PATCH] Fix build error with musl
>> +
>> +_Unwind_GetIP symbol is not implemented by musl, so use it only with li=
bc.
>> +
>> +mozglue/misc/StackWalk.o: in function `unwind_callback(_Unwind_Context*=
, void*)':
>> +| /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.tex=
t._ZL15unwind_callbackP15_Unwind_ContextPv+0x4): undefined reference to `_U=
nwind_GetIP'
>> +
>> +Reference: https://github.com/OSSystems/meta-browser/commit/bb866291235=
4dae13634c0ec35c3803c344b1e72
>> +Upstream-Status: Inappropriate [musl-specific]
>> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> +---
>> + mozglue/misc/StackWalk.cpp | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp
>> +index d3d9208fdb..9f7155a4f7 100644
>> +--- a/mozglue/misc/StackWalk.cpp
>> ++++ b/mozglue/misc/StackWalk.cpp
>> +@@ -696,7 +696,7 @@ MFBT_API bool MozDescribeCodeAddress(void* aPC,
>> + //
>> + // Changes to to OS/Architecture support here should be reflected in
>> + // build/moz.configure/memory.configure
>> +-#elif HAVE_DLADDR &&                                           \
>> ++#elif defined(__GLIBC__) && HAVE_DLADDR &&                     \
>> +     (HAVE__UNWIND_BACKTRACE || MOZ_STACKWALK_SUPPORTS_LINUX || \
>
>
> I am wondering if HAVE__UNWIND_BACKTRACE should have been false for musl =
already. so need to
> check __GLIBC__ is not needed perhaps
>

Hi Khem,

Seems HAVE__UNWIND_BACKTRACE is not false for musl, I was getting build err=
or.
Following commit[1] is also checking for the environment

[1] https://github.com/openembedded/meta-openembedded/commit/82c7bdd4cb4b0f=
1176afe0ad6a599f9db49f7055

cheers
Ankur

>>
>> +      MOZ_STACKWALK_SUPPORTS_MACOSX)
>> +
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-=
oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
>> index ceb81d07e5..fbbe3749ba 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
>> @@ -8,14 +8,15 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/r=
eleases/${PV}esr/source/fire
>>             file://0002-moz.configure-do-not-look-for-llvm-objdump.patch=
 \
>>             file://0003-rust.configure-do-not-try-to-find-a-suitable-ups=
trea.patch \
>>             file://0004-use-asm-sgidefs.h.patch \
>> -           file://riscv32.patch \
>> -           file://0001-util.configure-fix-one-occasionally-reproduced-c=
onfi.patch \
>> -           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
>> -           file://musl-disable-stackwalk.patch \
>> -           file://0001-add-arm-to-list-of-mozinline.patch \
>> -           file://armv5.patch \
>> -           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch =
\
>> -           file://riscv.patch \
>> +           file://0005-Add-RISCV32-support.patch \
>> +           file://0006-util.configure-fix-one-occasionally-reproduced-c=
onfi.patch \
>> +           file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
>> +           file://0008-Musl-does-not-have-stack-unwinder-like-glibc-the=
refo.patch \
>> +           file://0009-Backport-patch-from-firefox-bugzilla-to-fix-comp=
ile-.patch \
>> +           file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-=
v6-s.patch \
>> +           file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch =
\
>> +           file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-archi=
tect.patch \
>> +           file://0013-Fix-build-error-with-musl.patch \
>>             "
>>  SRC_URI[sha256sum] =3D "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef4=
95d4997154d68358f"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#123230): https://lists.openembedded.org/g/openembedd=
ed-devel/message/123230
>> Mute This Topic: https://lists.openembedded.org/mt/117139023/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

