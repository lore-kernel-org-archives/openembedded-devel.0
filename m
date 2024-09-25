Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7389FCF9C7D
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 15:11:38 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.18750.1727277097721303909
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 08:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMp4hpQI;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5d5eec95a74so3196452eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727277097; x=1727881897; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBG1WiWDviomzMmbQiVu6R6NtsBOR4+FsvAddnV/kiI=;
        b=KMp4hpQINnB8IN6QQtN5Wj0lwZjA0R6mBJrJTVBKMXGO7Ko7BQxmVTDvu/y42dlhS2
         jqIm/7vRJQbeI2ziitLIsbPlrw3Rjeb/HL3s1UpHbi0A6tJe0RWDl0qmpOx5CYvcyKZK
         1dK1YEN/XGjBxelOqGpeRetSzgvCTG0QuhdYVa+x8WpiAhc6d+8Cbx4annxWXnJ3zlbc
         F3F2R991fhoyVeOSYSyRvaVBCiSaDxlmeJiUqMHkqLVd5Y9fKM8Wx4/62sknl8COvXot
         99/zPDAaIe8oC8CQ71yWDifpN4u5QICyp0dmjtQFFf8txl9RP6+6nKESveTO72fN+jY0
         ZhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727277097; x=1727881897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBG1WiWDviomzMmbQiVu6R6NtsBOR4+FsvAddnV/kiI=;
        b=EGmR8rW/97K+ZwCqX33lfr1Dc5JclgRXJGUr+PyciAXKcIAQYpFO6q++xWLkBqX8q0
         2kFEbG+8uqvjl1MEGohRxMXESrlNh13HDk0nSUVQLhatwkNOHq1zSOMOfupXh7NFTevd
         +0+s501iNc/Ima/aguwHoyo35uawUL9dwr258dSeC4oxoTmAPZEQHodQV9paK0/FzTZJ
         QSv1LpR1wnyfJxUK8ayHevha47vME6VNq5Mv1RkQQmZCH+feOfl8s0K9IE8/MRPXOpBY
         1bxbt4LeuYnxtIsfElzFF0aeSMlPpSslPlsUuHEcpgwmfhmH3xzIp3n5cOZbnQ9/yv6i
         RJCQ==
X-Gm-Message-State: AOJu0Yx4bOfO+szeDgEQC0K8cb1iIXJ9r5aAWm1EhD/PFF73XvTuDUKM
	ztc04syB68rCtY5bdRD4BiaDxnVnLnt7xh22wVPvexssOhXZijksx/YbLx9sy+QEJCoD3qO3mw1
	q+YbsghQoZAMmgCwrjr9JFNIPnHpErzAN
X-Google-Smtp-Source: AGHT+IHjEPl2nuS5VImiM1hpLl5lb/IZMtYrdYb9k8euio/n0TB5T6o1c0rFnJzM1/ATrPgfopBAf/KBobpZ/3BCNQ8=
X-Received: by 2002:a05:6820:22a2:b0:5e5:b882:fd86 with SMTP id
 006d021491bc7-5e5c6b8746fmr1794861eaf.8.1727277096794; Wed, 25 Sep 2024
 08:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240925095224.1383106-1-yogesh.tyagi@intel.com>
In-Reply-To: <20240925095224.1383106-1-yogesh.tyagi@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2024 08:11:11 -0700
Message-ID: <CAMKF1srzWN1U9MOS3V9qArjCtbZ3o57TkTYraZut8mBo=-yB5A@mail.gmail.com>
Subject: Re: [oe] [scarthgap][PATCH] tbb-native: Fix build with gcc-13
To: yogesh.tyagi@intel.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 15:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112498

do we need this on master as well ?

On Wed, Sep 25, 2024 at 2:52=E2=80=AFAM Yogesh Tyagi via
lists.openembedded.org <yogesh.tyagi=3Dintel.com@lists.openembedded.org>
wrote:
>
> * Fixes following stringop-overflow warning with gcc-13:
>
> In file included from /usr/include/c++/13/atomic:41,
>                  from /poky/build/tmp/work/x86_64-linux/tbb-native/2021.1=
1.0/git/src/tbb/../../include/oneapi/tbb/detail/_utils.h:22,
>                  from /poky/build/tmp/work/x86_64-linux/tbb-native/2021.1=
1.0/git/src/tbb/task_dispatcher.h:20,
>                  from /poky/build/tmp/work/x86_64-linux/tbb-native/2021.1=
1.0/git/src/tbb/arena.cpp:17:
> In member function =E2=80=98void std::__atomic_base<_IntTp>::store(__int_=
type, std::memory_order) [with _ITp =3D bool]=E2=80=99,
>     inlined from =E2=80=98void std::atomic<bool>::store(bool, std::memory=
_order)=E2=80=99 at /usr/include/c++/13/atomic:104:20,
>     inlined from =E2=80=98void tbb::detail::r1::concurrent_monitor_base<C=
ontext>::notify_one_relaxed() [with Context =3D long unsigned int]=E2=80=99=
 at /poky/build/tmp/work/x86_64-linux/tbb-native/2021.11.0/git/src/tbb/conc=
urrent_monitor.h:293:53:
> /usr/include/c++/13/bits/atomic_base.h:481:25: error: =E2=80=98void __ato=
mic_store_1(volatile void*, unsigned char, int)=E2=80=99 writing 1 byte int=
o a region of size 0 overflows the destination [-Werror=3Dstringop-overflow=
=3D]
>   481 |         __atomic_store_n(&_M_i, __i, int(__m));
>       |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
> compilation terminated due to -Wfatal-errors.
> cc1plus: all warnings being treated as errors
>
> (cherry picked from commit e131071769ee3df51b56b053ba6bfa06ae9eff25)
>
> Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
> ---
>  ...suppress-new-GCC-12-13-warnings-1192.patch | 57 +++++++++++++++++++
>  meta-oe/recipes-support/tbb/tbb_2021.11.0.bb  |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new=
-GCC-12-13-warnings-1192.patch
>
> diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12=
-13-warnings-1192.patch b/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress=
-new-GCC-12-13-warnings-1192.patch
> new file mode 100644
> index 0000000000..489f011b84
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-war=
nings-1192.patch
> @@ -0,0 +1,57 @@
> +From e131071769ee3df51b56b053ba6bfa06ae9eff25 Mon Sep 17 00:00:00 2001
> +From: Dmitri Mokhov <dmitri.n.mokhov@intel.com>
> +Date: Mon, 11 Sep 2023 10:35:07 -0500
> +Subject: [PATCH] Fix/suppress new GCC 12/13 warnings (#1192)
> +
> +Upstream-Status: Backport [https://github.com/oneapi-src/oneTBB/commit/e=
131071769ee3df51b56b053ba6bfa06ae9eff25]
> +Signed-off-by: Dmitri Mokhov <dmitri.n.mokhov@intel.com>
> +---
> + .../oneapi/tbb/detail/_concurrent_unordered_base.h   |  2 +-
> + src/tbb/concurrent_monitor.h                         | 12 +++++++++++-
> + 2 files changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/oneapi/tbb/detail/_concurrent_unordered_base.h b/in=
clude/oneapi/tbb/detail/_concurrent_unordered_base.h
> +index ade91c33..40829208 100644
> +--- a/include/oneapi/tbb/detail/_concurrent_unordered_base.h
> ++++ b/include/oneapi/tbb/detail/_concurrent_unordered_base.h
> +@@ -921,7 +921,7 @@ private:
> +             node_allocator_traits::deallocate(dummy_node_allocator, nod=
e, 1);
> +         } else {
> +             // GCC 11.1 issues a warning here that incorrect destructor=
 might be called for dummy_nodes
> +-            #if (__TBB_GCC_VERSION >=3D 110100 && __TBB_GCC_VERSION < 1=
30000 ) && !__clang__ && !__INTEL_COMPILER
> ++            #if (__TBB_GCC_VERSION >=3D 110100 && __TBB_GCC_VERSION < 1=
40000 ) && !__clang__ && !__INTEL_COMPILER
> +             volatile
> +             #endif
> +             value_node_ptr val_node =3D static_cast<value_node_ptr>(nod=
e);
> +diff --git a/src/tbb/concurrent_monitor.h b/src/tbb/concurrent_monitor.h
> +index 3d20ef5b..3e5c4beb 100644
> +--- a/src/tbb/concurrent_monitor.h
> ++++ b/src/tbb/concurrent_monitor.h
> +@@ -1,5 +1,5 @@
> + /*
> +-    Copyright (c) 2005-2021 Intel Corporation
> ++    Copyright (c) 2005-2023 Intel Corporation
> +
> +     Licensed under the Apache License, Version 2.0 (the "License");
> +     you may not use this file except in compliance with the License.
> +@@ -290,7 +290,17 @@ public:
> +             n =3D my_waitset.front();
> +             if (n !=3D end) {
> +                 my_waitset.remove(*n);
> ++
> ++// GCC 12.x-13.x issues a warning here that to_wait_node(n)->my_is_in_l=
ist might have size 0, since n is
> ++// a base_node pointer. (This cannot happen, because only wait_node poi=
nters are added to my_waitset.)
> ++#if (__TBB_GCC_VERSION >=3D 120100 && __TBB_GCC_VERSION < 140000 ) && !=
__clang__ && !__INTEL_COMPILER
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wstringop-overflow"
> ++#endif
> +                 to_wait_node(n)->my_is_in_list.store(false, std::memory=
_order_relaxed);
> ++#if (__TBB_GCC_VERSION >=3D 120100 && __TBB_GCC_VERSION < 140000 ) && !=
__clang__ && !__INTEL_COMPILER
> ++#pragma GCC diagnostic pop
> ++#endif
> +             }
> +         }
> +
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb b/meta-oe/recip=
es-support/tbb/tbb_2021.11.0.bb
> index f834726bd6..318cd87643 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
> @@ -16,6 +16,7 @@ BRANCH =3D "onetbb_2021"
>  SRCREV =3D "8b829acc65569019edb896c5150d427f288e8aba"
>  SRC_URI =3D "git://github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;bra=
nch=3D${BRANCH} \
>              file://0001-hwloc_detection.cmake-remove-cross-compiation-ch=
eck.patch \
> +            file://0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch \
>  "
>  S =3D "${WORKDIR}/git"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112495): https://lists.openembedded.org/g/openembedde=
d-devel/message/112495
> Mute This Topic: https://lists.openembedded.org/mt/108644971/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

