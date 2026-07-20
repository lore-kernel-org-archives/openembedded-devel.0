Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142DDC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 04:59:09 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2391.1784523545960819161
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 21:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O3Vktl7d;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7dbcb505578so60145787b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 21:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784523545; cv=none;
        d=google.com; s=arc-20260327;
        b=emxPkDbfJM2UT6lloUc0B7F/Ah8tv/x8obaGEnHZH+cKgMSn+Uci0Ew9zJjB+pdLNI
         aYRI/5JpvWraBnXAHsuOlMZ4WMoiG3i0L5lSFvn3rvztdFuIYJNtJfHsXUIBhDNtAbMs
         FdaD+OMRxtVv+fpN3TkQsZqZ8k/AVM2f7FiN2LaNRmjP+LR0aTX+WE8Jp5FHQ6Zv2Yrf
         +TSOR+gHbWl+qN9AsN+pRykzPxYhsSM8zXx4FpnH5k5PA0LwJCvuu9ifZz6ZSH6XoAVT
         ga+6oTntTM87WQVW40IhHvcRAVrQxSBveZOsd+3Tnyr0+UxMtsr7uW9NXjFNZf8AY8DF
         ihoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nn09n2JfHEkRf2vUJ7jEFwJiYuAaEhxJHssJgNv0XJk=;
        fh=eM843g4a7CQS7KyONwiKEJCHBnl8qh2VbAFTI7/b+LU=;
        b=ic7Tu7gqE43xpPp7didufU1fYnA2KNKEPPiprij0Fn2KxzNyulZEduytMNoc5s5GLt
         h56+ClLGfcrv9ur0r8j/VdJ3c+3pPVNmcH0EWQ6PL4VnPTXcTqinZDVxNvHBV4azyjQi
         FUI6Gw7bc/GYPizF2zTAdZCr/EYkXlyYxGjj3/fk19UdqMXd3e4g3oxSnN3jajEJdToo
         1rb38i/vpbPw2Lfr0ckJo/F4+njw14DwXNJXkZ6pw+ma/hPs46sMeXT1LX1iRJKk2Si1
         zaUxCm6gu4t+tpUv85c5N6m+d9OZTLgKTzSHrE7rSEjhJXYZ5/baygW0aJsBMormcILK
         lsOg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784523545; x=1785128345; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nn09n2JfHEkRf2vUJ7jEFwJiYuAaEhxJHssJgNv0XJk=;
        b=O3Vktl7dQgPpKAsSQeR75zZE7eIq/CH2uIm45/6bR1m1vamGtE4fbMa7BUN0F8MImw
         5Xv22bpFVmBifDaMUAN+TXYjz4+bcGJWX6DFh57XPBFQtQx4qlZbn3UKbZgztqBQaA8n
         HOGBFfgS0rQpm4+FrTPkAOqxnmrRmPWFdk9VrjdWi0K0S/0JFdiSW/ULE6AboExqk3ky
         pc/pm+Q2xnuzO22FKM8FCjT94ltnogqLT6HNEKrY+F2MhXXPHTM5eHLPUGQev3C2QVWX
         pS5v24A5j1w9IVwC5XuQUwtriRrGvDS6IG2NNXO9teu1jHm7K9qJViJlGwKgXtSgFQiw
         b7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784523545; x=1785128345;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nn09n2JfHEkRf2vUJ7jEFwJiYuAaEhxJHssJgNv0XJk=;
        b=F0XNpbNISpv96WUPLg1v9FXi0S2FmPPmEO/ODnAcy46oLjj3dHiwblnHmBg83h1pgW
         23F3u20qp31SrQSmL7wiFJEOsQ1ej6JhlNHvLB2Q/ZXoQgpgZFEggsiPl+M20fp8rRgS
         JRzcskY8hnVj/c9oONmcRvvfLEFFx6XmEiMT8nYEz12hZNuAgGIQmD4tusBkh1AQkLLF
         R850uNYtixZZ2c9ZyBAtZPAKOepiYxVagsA4k2T00nOVsjyzWXoh7txyw1IriTme77Ml
         GGZCDe90jxaalySyRObrirYkn0kMCQ/4YqWCWq2V4ApTGdBCZPm7dmVIe2PrF4xNSQK4
         K+AA==
X-Gm-Message-State: AOJu0YyxgjCusiyJ4CipsDhQeUGNdgs8q5DeVXhAwPIdBenndRtdO9iu
	DcFxmV9DdyMmbaOTrNO+RTOFHpGpmZfXmPEMtkcVGThBym5rwtWJ20XX8y50thLPgUtc4KPiixR
	P2a0rtz4GjWoGhNTMToGEWB4LoJZxmSs=
X-Gm-Gg: AR+sD13gu2A8IIBd/GlH5XgWm3ETz+za0RojFmztMNx/JLMt08fkdgRZLn+5mcpC1Cb
	o2Hm9USjesJdc7Fna0AVFOk5mzG9C40JpVJvNgrz/818qECa1oBLbal5LEMQ4M48kStvJ5lBYy0
	Wpt2HATMGP/jZgCd8Wdo5XL7Xe+pnQfSxL6Mq+P7AJdU6LmZuu6lgLBhFtALLqRCs6b3d44YMvA
	HcJVFmrcZuCdTOXU5tvAYTYcmF3EMOwZisJikItr1APydad8GOUb063jqayk5sVVMq5PRZJtt8b
	RDs+DT0rhDgRzijpk2vd64lSchBYiAo1252cUNKYUkLPDoaly3eWjRFFhXVhjRViFQC9T2U+rbE
	AGwGGDV+uRE4GgE+IbLZmbkvjp6ioBLBS7EGd8m5g0qgD5jbPyGWiY1+3B98=
X-Received: by 2002:a05:690c:3a0:b0:80d:e322:5426 with SMTP id
 00721157ae682-81ef25d6533mr45412057b3.40.1784523544777; Sun, 19 Jul 2026
 21:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260718180442.405120-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20260718180442.405120-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Jul 2026 21:58:38 -0700
X-Gm-Features: AUfX_mxTElwk3mlgxoTLA8jWk_k6KI5Rv_gIbWIFhMXQmMB0WRio4cgbFYWMa5Y
Message-ID: <CAMKF1sqoMi3ibjbSU90NK80L6OUW82qvN3-BV+CnYYHBaCWQ1w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] 1. Add new feature - binary log.
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fad9bf065703c30a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 04:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128270

--000000000000fad9bf065703c30a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please fix the commit message as per guidelines.

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#imp=
lement-and-commit-changes

On Sat, Jul 18, 2026 at 11:09=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org <nguyenthaithuanalg=3Dgmail.com@lists.openembedded.o=
rg>
wrote:

> 2. Cache hit/miss.
>
> Signed-off-by: Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=A1i <nguyenthaithuanalg=
@gmail.com>
> ---
>  .../0001-allow-build-with-cmake-4.patch       | 40 -------------------
>  ...mplelog_1.0.8.bb =3D> libsimplelog_1.1.0.bb} | 11 ++---
>  2 files changed, 6 insertions(+), 45 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-c=
make-4.patch
>  rename meta-oe/recipes-support/libsimplelog/{libsimplelog_1.0.8.bb =3D>
> libsimplelog_1.1.0.bb} (63%)
>
> diff --git
> a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with=
-cmake-4.patch
> b/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with=
-cmake-4.patch
> deleted file mode 100644
> index 17adf92bb0..0000000000
> ---
> a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with=
-cmake-4.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 77be1b3e7d6ff4261114424278413a679672bb92 Mon Sep 17 00:00:00 2001
> -From: Alper Ak <alperyasinak1@gmail.com>
> -Date: Wed, 9 Jul 2025 12:10:37 +0300
> -Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> - compatibility
> -
> -Fix:
> -
> -| CMake Error in CMakeLists.txt:
> -|   No cmake_minimum_required command is present.  A line of code such a=
s
> -|
> -|     cmake_minimum_required(VERSION 4.0)
> -|
> -|   should be added at the top of the file.  The version specified may b=
e
> lower
> -|   if you wish to support older CMake versions for this project.  For
> more
> -|   information run "cmake --help-policy CMP0000".
> -|
> -|
> -| -- Configuring incomplete, errors occurred!
> -
> -Upstream-Status: Submitted [
> https://github.com/thuanalg/simplelog-topic/pull/1]
> -
> -Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ----
> - CMakeLists.txt | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index dca80f1..0fc6db0 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -1,3 +1,5 @@
> -+cmake_minimum_required(VERSION 3.5)
> -+
> - # Add main.cpp file of the project root directory as a source file
> - project(simplelog_topic_project)
> - set(SOURCE_LIB_FILES src/simplelog.c )
> ---
> -2.43.0
> -
> diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
> similarity index 63%
> rename from meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
> index 41b9d47686..fbfa926166 100644
> --- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
> +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
> @@ -3,16 +3,17 @@ SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful =
of
> logging library in ANSI
>  DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o
> external dependencies."
>  HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517952ac7c"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D594fdc3cb85f0b684cf5d7b332a741be"
>
> -SRC_URI =3D "git://
> github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3Dhttps;ta=
g=3Dv${PV}
> <http://github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3D=
https;tag=3Dv$%7BPV%7D>
> \
> -        file://0001-allow-build-with-cmake-4.patch"
> +SRC_URI =3D "git://
> github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3Dhttps;"
>
> -SRCREV =3D "093d80b4006042b75a433a5e63760ae9bebad142"
> +SRCREV =3D "151e83902ca9755bcd285791d2f49de6fc30bfe6"
> +
> +S =3D "${WORKDIR}/git"
>
>  inherit cmake
>
>  # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> -EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1 -D__LINUX__=3D1 -D_GNU_SOURCE=3D1"
>
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128257):
> https://lists.openembedded.org/g/openembedded-devel/message/128257
> Mute This Topic: https://lists.openembedded.org/mt/120334975/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fad9bf065703c30a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please fix the commit message as per guidelines.=C2=A0<div=
><br></div><div><a href=3D"https://docs.yoctoproject.org/dev/contributor-gu=
ide/submit-changes.html#implement-and-commit-changes">https://docs.yoctopro=
ject.org/dev/contributor-guide/submit-changes.html#implement-and-commit-cha=
nges</a></div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 18, 2026 at 11:09=E2=80=AFA=
M Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=A1i via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;nguyenthaithuanalg=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">2.=
 Cache hit/miss.<br>
<br>
Signed-off-by: Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=A1i &lt;<a href=3D"mailto=
:nguyenthaithuanalg@gmail.com" target=3D"_blank">nguyenthaithuanalg@gmail.c=
om</a>&gt;<br>
---<br>
=C2=A0.../0001-allow-build-with-cmake-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
0 -------------------<br>
=C2=A0...<a href=3D"http://mplelog_1.0.8.bb" rel=3D"noreferrer" target=3D"_=
blank">mplelog_1.0.8.bb</a> =3D&gt; <a href=3D"http://libsimplelog_1.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.1.0.bb</a>} | 11 ++--=
-<br>
=C2=A02 files changed, 6 insertions(+), 45 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog/=
0001-allow-build-with-cmake-4.patch<br>
=C2=A0rename meta-oe/recipes-support/libsimplelog/{<a href=3D"http://libsim=
plelog_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.0.8.bb=
</a> =3D&gt; <a href=3D"http://libsimplelog_1.1.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libsimplelog_1.1.0.bb</a>} (63%)<br>
<br>
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-b=
uild-with-cmake-4.patch b/meta-oe/recipes-support/libsimplelog/libsimplelog=
/0001-allow-build-with-cmake-4.patch<br>
deleted file mode 100644<br>
index 17adf92bb0..0000000000<br>
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-wi=
th-cmake-4.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 77be1b3e7d6ff4261114424278413a679672bb92 Mon Sep 17 00:00:00 2001<br>
-From: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" target=3D"_b=
lank">alperyasinak1@gmail.com</a>&gt;<br>
-Date: Wed, 9 Jul 2025 12:10:37 +0300<br>
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+<b=
r>
- compatibility<br>
-<br>
-Fix:<br>
-<br>
-| CMake Error in CMakeLists.txt:<br>
-|=C2=A0 =C2=A0No cmake_minimum_required command is present.=C2=A0 A line o=
f code such as<br>
-|<br>
-|=C2=A0 =C2=A0 =C2=A0cmake_minimum_required(VERSION 4.0)<br>
-|<br>
-|=C2=A0 =C2=A0should be added at the top of the file.=C2=A0 The version sp=
ecified may be lower<br>
-|=C2=A0 =C2=A0if you wish to support older CMake versions for this project=
.=C2=A0 For more<br>
-|=C2=A0 =C2=A0information run &quot;cmake --help-policy CMP0000&quot;.<br>
-|<br>
-|<br>
-| -- Configuring incomplete, errors occurred!<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/thuanalg/simplel=
og-topic/pull/1" rel=3D"noreferrer" target=3D"_blank">https://github.com/th=
uanalg/simplelog-topic/pull/1</a>]<br>
-<br>
-Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" tar=
get=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
----<br>
- CMakeLists.txt | 2 ++<br>
- 1 file changed, 2 insertions(+)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index dca80f1..0fc6db0 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -1,3 +1,5 @@<br>
-+cmake_minimum_required(VERSION 3.5)<br>
-+<br>
- # Add main.cpp file of the project root directory as a source file<br>
- project(simplelog_topic_project)<br>
- set(SOURCE_LIB_FILES src/simplelog.c )<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimp=
lelog_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.0.8.bb<=
/a> b/meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimplelog_1=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.1.0.bb</a><br>
similarity index 63%<br>
rename from meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimpl=
elog_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.0.8.bb</=
a><br>
rename to meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimplel=
og_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.1.0.bb</a>=
<br>
index 41b9d47686..fbfa926166 100644<br>
--- a/meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimplelog_1=
.0.8.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.0.8.bb</a><br>
+++ b/meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimplelog_1=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_1.1.0.bb</a><br>
@@ -3,16 +3,17 @@ SUMMARY =3D &quot;simplelog-topc - Simple, STABLE, powerf=
ul of logging library in ANSI<br>
=C2=A0DESCRIPTION =3D &quot;Async and Fast C/C++ multi-thread logger with t=
opics. No external dependencies.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/thuanalg/simplelog-t=
opic" rel=3D"noreferrer" target=3D"_blank">https://github.com/thuanalg/simp=
lelog-topic</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c=
517952ac7c&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D594fdc3cb85f0b684cf5d7=
b332a741be&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/thuanalg/simplelog-to=
pic.git;branch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer"=
 target=3D"_blank">github.com/thuanalg/simplelog-topic.git;branch=3Dmain;pr=
otocol=3Dhttps;tag=3Dv${PV}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-allow-build-with-cmake-4.patch&quo=
t;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/thuanalg/simplelog-to=
pic.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3Dhttps</a=
>;&quot;<br>
<br>
-SRCREV =3D &quot;093d80b4006042b75a433a5e63760ae9bebad142&quot;<br>
+SRCREV =3D &quot;151e83902ca9755bcd285791d2f49de6fc30bfe6&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
=C2=A0# Specify any options you want to pass to cmake using EXTRA_OECMAKE:<=
br>
-EXTRA_OECMAKE +=3D &quot;-DUNIX_LINUX=3D1&quot;<br>
+EXTRA_OECMAKE +=3D &quot;-DUNIX_LINUX=3D1 -D__LINUX__=3D1 -D_GNU_SOURCE=3D=
1&quot;<br>
<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128257): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128257" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128257</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120334975/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120334975/1997914</a><br>
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

--000000000000fad9bf065703c30a--

