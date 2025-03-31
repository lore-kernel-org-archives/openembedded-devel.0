Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AE7C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 14:30:42 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.53561.1743431440433287673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 07:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gc3na2Tb;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f9832f798aso2817350b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743431439; x=1744036239; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJo2JHQTYjlaztarq05YVfwCwmhQa+Lg8ukG2qTrKdw=;
        b=gc3na2Tbf+37tDYZke+3aa5UiZDXzRxV8BoL0BmmfpWxeJF88axrtoyDICb8gBQPiX
         X4v1OAPv8qMucIl7XT+WDSa+FMoJ6uznyuUxJTMKvya3OIGDi5skJzE44qlvt/xGJnrt
         V6yNlt23LbzhAriX5lcEqGT5ZVQwLtV1Eu9/iW+8JeYC/Zxxs08YE9k8yk6ZXTXqShs4
         7xSMC+fRjzfIccczS9zi1llHk506TTSE9L4g9CN6Y259roiieu5/EbIMgaMhMdcyYQcH
         Ed9kcUe0/AsWHROVdRpDd2ZdjVDzuZD/FtrKRBv3orPEzWRAY4EggHcpayP74Ei+Zfi9
         pC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743431439; x=1744036239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJo2JHQTYjlaztarq05YVfwCwmhQa+Lg8ukG2qTrKdw=;
        b=tkoLjmt+Xnko8xZBKOFCFnwkHvcULrwB425saVqwdiCI0bGfuSITHZf5OLwhAKB0fO
         mUrlY3PKa5pIqRhoHeS0yrU+tsyMMXlXPrmPUfebIUTVo/A7Odaqj+3Y6yb3NB2fohqy
         6Cuog9IhHFNCthA02zSlQOWx8yRAYVKyy+fkBSQZc7nse7c7iui7Mk1NlgRpXfpWLCwU
         fqV+r3h8ZoN6XcIZrMB1KMfmkZszzJP+PZoqibJFWoV+eTi11cw3y38pvmkJdXat7Dtg
         sQM8fUuo3k8OSb3kShO0JpIbfhymPY/D7NmpdS2wjuw3HdWzd7rqjCPpFfQ623oaTEeo
         0UXA==
X-Gm-Message-State: AOJu0YwrsNUH5fU32jxZfFVoJdwvIcmF1qV0LJeB81DDs3+6pB44JrIP
	HqdK/R4Ps7Woxl/eKnMV/kp03mZ2Q8bi+GkdpReLojbZV/V0RCzPksvcQrwc2MAv1rfoRDt/YH7
	NUngHoj2PoHpEUOxOr9gUkqx1VkE=
X-Gm-Gg: ASbGncvqzW0i8gVVG7gktP041FduEdnYze4tDThsxKv8M2PmGrkZy2spbq93KC+LRND
	msyPJOvN/MFqRnFpuaA01cmYxQhE+ro7H+2+boCIvH2UMpciVS2D/U+5rSKTrciaSL4NQ8n4QQC
	RMy4pqIxgLBW6y+TjP/JXgQICL
X-Google-Smtp-Source: AGHT+IHPppfcqLvKlszbTAb8Bt9iyY9B7WwULLYf0Q+YzYpAh9bV6S4wyV9JyAFhQAIBBr7G/LvaIELQWunIRYGBDbc=
X-Received: by 2002:a05:6808:244e:b0:3f6:65fe:2672 with SMTP id
 5614622812f47-3ff0f4e44c4mr5600646b6e.2.1743431439662; Mon, 31 Mar 2025
 07:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com> <1743412308-21887-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1743412308-21887-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 07:30:13 -0700
X-Gm-Features: AQ5f1JoUKLb0KAQaR3VP8VhZ3Yae-EjDfb3g2kN_H_FV3ht8hTUUe2XMYdj2Ltw
Message-ID: <CAMKF1spnPAj2X=k2EiOLiymQiE6S6=e236mhc_1k++Pr=+WKKg@mail.gmail.com>
Subject: Re: [oe] [PATCH] libdnf: upgrade 0.73.4 -> 0.74.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116433

wrong ml. Send it to oe-core ml please

On Mon, Mar 31, 2025 at 2:12=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...n-iterator-of-a-ConfigParser-section.patch | 84 -------------------
>  .../libdnf/enable_test_data_dir_set.patch     | 13 +--
>  .../{libdnf_0.73.4.bb =3D> libdnf_0.74.0.bb}    |  3 +-
>  3 files changed, 9 insertions(+), 91 deletions(-)
>  delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfau=
lt-in-iterator-of-a-ConfigParser-section.patch
>  rename meta/recipes-devtools/libdnf/{libdnf_0.73.4.bb =3D> libdnf_0.74.0=
.bb} (93%)
>
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-i=
terator-of-a-ConfigParser-section.patch b/meta/recipes-devtools/libdnf/libd=
nf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
> deleted file mode 100644
> index 1c62d02455..0000000000
> --- a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator=
-of-a-ConfigParser-section.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From f3302a865b230e021e9defbcea978ed1290a9b2f Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Miro=3D20Hron=3DC4=3D8Dok?=3D <miro@hroncok.cz>
> -Date: Fri, 6 Dec 2024 18:01:16 +0100
> -Subject: [PATCH] Fix a segfault in iterator of a ConfigParser section
> -
> -An iterator should return self on __iter__.
> -
> -So that this works:
> -
> -    >>> it1 =3D iter(sectObj)
> -    >>> it2 =3D iter(it1)
> -    >>> it1 is it2
> -    True
> -
> -Previously, this iterator did not return self on __iter__, it was like t=
his:
> -
> -    class PreserveOrderMapStringStringIterator(object):
> -        ...
> -        def __iter__(self):
> -            return _common_types.PreserveOrderMapStringStringIterator___=
iter__(self)
> -
> -And that returned a new Python object.
> -
> -This fixes https://bugzilla.redhat.com/2330562 by avoiding a second iter=
ator object.
> -
> -My SWIG skills are close to zero,
> -perhaps this is not the best way to return self, but it seems to work.
> -
> -Upstream-Status: Backport
> -(https://github.com/rpm-software-management/libdnf/commit/f3302a865b)
> -
> -Backport so that it works properly with Python 3.13.1.
> -
> -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> -
> ----
> - bindings/swig/common_types.i | 11 +++++++----
> - bindings/swig/conf.i         |  4 ----
> - 2 files changed, 7 insertions(+), 8 deletions(-)
> -
> -diff --git a/bindings/swig/common_types.i b/bindings/swig/common_types.i
> -index c9ae798a..a1f90d9e 100644
> ---- a/bindings/swig/common_types.i
> -+++ b/bindings/swig/common_types.i
> -@@ -63,10 +63,6 @@ template<class T>
> - class Iterator {
> - public:
> -     Iterator(typename T::iterator _cur, typename T::iterator _end) : cu=
r(_cur), end(_end) {}
> --    Iterator* __iter__()
> --    {
> --      return this;
> --    }
> -
> -     typename T::iterator cur;
> -     typename T::iterator end;
> -@@ -165,3 +161,10 @@ EXTEND_TEMPLATE_PreserveOrderMapIterator(std::strin=
g, std::string)
> - EXTEND_TEMPLATE_PreserveOrderMapIterator(std::string, libdnf::PreserveO=
rderMap<std::string, std::string>)
> -
> - %exception;  // beware this resets all exception handlers if you import=
 this file after defining any
> -+
> -+%pythoncode %{
> -+def PreserveOrderMapStringStringIterator___iter__(self):
> -+    return self
> -+PreserveOrderMapStringStringIterator.__iter__ =3D PreserveOrderMapStrin=
gStringIterator___iter__
> -+del PreserveOrderMapStringStringIterator___iter__
> -+%}
> -diff --git a/bindings/swig/conf.i b/bindings/swig/conf.i
> -index b6a0ce88..2f77003f 100644
> ---- a/bindings/swig/conf.i
> -+++ b/bindings/swig/conf.i
> -@@ -71,10 +71,6 @@ template<class T>
> - class Iterator {
> - public:
> -     Iterator(typename T::iterator _cur, typename T::iterator _end) : cu=
r(_cur), end(_end) {}
> --    Iterator* __iter__()
> --    {
> --        return this;
> --    }
> -
> -     typename T::iterator cur;
> -     typename T::iterator end;
> ---
> -2.39.5
> -
> diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set=
.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> index 5620b51d4c..6fc05d9ff8 100644
> --- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> +++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
> @@ -1,4 +1,4 @@
> -From 05fff53c13fc5969e17f1e887b0b59bf0a088a6e Mon Sep 17 00:00:00 2001
> +From 870f50ba4761317f2db018ac130a42087230dded Mon Sep 17 00:00:00 2001
>  From: Joe Slater <joe.slater@windriver.com>
>  Date: Wed, 22 Jul 2020 13:31:11 -0700
>  Subject: [PATCH] libdnf: allow reproducible binary builds
> @@ -14,14 +14,14 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 60c66e94..1459dfbf 100644
> +index b1daacb..f461e54 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -132,7 +132,12 @@ add_definitions(-DGETTEXT_DOMAIN=3D\\"libdnf\\")
> - add_definitions(-DG_LOG_DOMAIN=3D\\"libdnf\\")
> +@@ -131,7 +131,12 @@ add_definitions(-DGETTEXT_DOMAIN=3D"libdnf")
> + add_definitions(-DG_LOG_DOMAIN=3D"libdnf")
>
>   # tests
> --add_definitions(-DTESTDATADIR=3D\\"${CMAKE_SOURCE_DIR}/data/tests\\")
> +-add_definitions(-DTESTDATADIR=3D"${CMAKE_SOURCE_DIR}/data/tests")
>  +if(NOT WITH_TESTS)
>  +  set(TEST_DATA_DIR "/notests")
>  +elseif(NOT DEFINED TEST_DATA_DIR)
> @@ -31,3 +31,6 @@ index 60c66e94..1459dfbf 100644
>
>   # librhsm
>   if(ENABLE_RHSM_SUPPORT)
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.74.0.bb
> similarity index 93%
> rename from meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
> rename to meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
> index 5b9e734e82..5a2d4d9364 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
> @@ -11,10 +11,9 @@ SRC_URI =3D "git://github.com/rpm-software-management/=
libdnf;branch=3Ddnf-4-master;p
>             file://enable_test_data_dir_set.patch \
>             file://0001-drop-FindPythonInstDir.cmake.patch \
>             file://armarch.patch \
> -           file://0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-sect=
ion.patch \
>             "
>
> -SRCREV =3D "79ed383cd5a822e6d8d9d549835383f5c5106204"
> +SRCREV =3D "91a0bf9aada36a722855051526f012e0b5ab1af9"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116397): https://lists.openembedded.org/g/openembedde=
d-devel/message/116397
> Mute This Topic: https://lists.openembedded.org/mt/112000730/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

