Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD687C3DA6E
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 03:35:47 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.9506.1704771340470784295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 19:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DcqBCvXJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-205cdc4b2b8so1808465fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 19:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704771340; x=1705376140; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PzS3179x/7+3+Pv3z05HSLh1Q9K2BWJRGx1kPHNGTI=;
        b=DcqBCvXJ8PRMuCijW8R2AyY0r2cDuKTKrxDsGwNlD6S3YGPX5bP8fv69mwyvv2BBq7
         JjqEdlcWFB6D27ogLNW36OZKdgIINraOlHBigfn3L5IuaRljBG4hNoLT/rgo7fyXngO0
         keHbguK4ykR8Dk+CJWoazjeIN80UD4nDClNa3BhvbqZrT1f9poAYIjao3S9oNNgW/kkD
         hz7cM2Lec0086AQP20VUWDv9WDprhCchJbScsNm9gdo4KgdLx0Uqr7B3j8LNCMsvKJmB
         KwuCfjUN0ClxtujtA3SLybwFFcC4UkYHHzYHxZeAD9RO4Q+ODBSTQjKbtgkjnwhYFWEW
         n/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704771340; x=1705376140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PzS3179x/7+3+Pv3z05HSLh1Q9K2BWJRGx1kPHNGTI=;
        b=JaFdxGOwZZVUjYgsbqltzDKhP+kWCYjPNx79jf02Un3suYvJof/AvuP0leDoaf3Hvf
         RH0auHp/en+AJeOxcbzQ2HIwivEOokpx70w2NbtnLdvCeXvmtan4UK7buLPVv+fO7sT4
         RDkP5EGPJms78O1dbgybvu5wce+fDPf7ZhJvX/Wfonu8bGWUeLbybNHTJqQXCY1ld24W
         zmZXemHK4bNqLtjsadO1LuANVLpzIizuB5sM8LbgnYwP33z3HlWN+XuTexpYVgAcHadg
         rDdgdZ9qnp9XrBBssyY94txXd2eRON+pX1ruVYrldkkUKsObyZigL62asE9UPC4cu1fO
         MpZA==
X-Gm-Message-State: AOJu0YwyVklYw9Nwc6T53Y6Pumzr2dZ1R1m9F5zuo2Tb4WtRTBF2JUML
	DFMCAx72R1vtvc9pxuGj2quuJB2WefcS6eVaqQk=
X-Google-Smtp-Source: AGHT+IGKWIoySxwxWdI1gYVSmdqb1BpAVKkCNZpgn+SEOhcjmocyga5DUcy/O9u1f1mq8G+ikmfIwlb70rX+EJ1jyHk=
X-Received: by 2002:a05:6870:7254:b0:205:f283:52f9 with SMTP id
 y20-20020a056870725400b00205f28352f9mr5826464oaf.108.1704771339666; Mon, 08
 Jan 2024 19:35:39 -0800 (PST)
MIME-Version: 1.0
References: <1704720002-29880-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1704720002-29880-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 19:35:13 -0800
Message-ID: <CAMKF1sob+5dMHqJyz9O0QE5N1aBx-EVTfrXDw-HeGxpoEiF=PQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] iwd: upgrade 2.8 -> 2.12
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 03:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108177

fails on musl

https://sprunge.us/756nOz

See my fixes to use POSIX basename for various recipes. You will need
something similar.

On Mon, Jan 8, 2024 at 5:20=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D
> -Fix issue with DPP extra settings not being used.
> -Fix issue with DPP and PRF+ handling on AARCH64.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...s_top_srcdir-instead-of-abs_srcdir-for-e.patch | 15 +++++++--------
>  .../iwd/{iwd_2.8.bb =3D> iwd_2.12.bb}               |  2 +-
>  2 files changed, 8 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb =3D> iwd_2.12.bb} (9=
4%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_=
srcdir-instead-of-abs_srcdir-for-e.patch b/meta-oe/recipes-connectivity/iwd=
/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
> index 9ed73104e..bc72f17e0 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-=
instead-of-abs_srcdir-for-e.patch
> +++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-=
instead-of-abs_srcdir-for-e.patch
> @@ -1,20 +1,22 @@
> -From b0b51d762f45ff9d320b96bd0acb89313148a446 Mon Sep 17 00:00:00 2001
> +From 2e782b849a2202d5a77bd5ac67160c4a47ae306d Mon Sep 17 00:00:00 2001
>  From: Zang Ruochen <zangrc.fnst@fujitsu.com>
>  Date: Wed, 12 May 2021 14:28:24 +0900
> -Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell=
 sources
> +Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell
> + sources
>
>  this makes it build when build dir is outside of sources dir
>
>  Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lis=
ts.01.org/message/SYX6Z7SUQHU7UWM6ECZTTJ6SPODIS6KB/]
> +
>  ---
>   Makefile.am | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 68035e4..e3f7990 100644
> +index 5ed6ab3..e0e3c87 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -628,7 +628,7 @@ ell/shared: Makefile
> +@@ -697,7 +697,7 @@ ell/shared: Makefile
>         $(AM_V_at)$(MKDIR_P) ell
>         $(AM_V_GEN)for f in $(ell_shared) ; do \
>                 if [ ! -f $$f ] ; then \
> @@ -23,7 +25,7 @@ index 68035e4..e3f7990 100644
>                 fi \
>         done > $@
>
> -@@ -636,7 +636,7 @@ ell/internal: Makefile
> +@@ -705,7 +705,7 @@ ell/internal: Makefile
>         $(AM_V_at)$(MKDIR_P) ell
>         $(AM_V_GEN)for f in $(ell_headers) $(ell_sources) ; do \
>                 if [ ! -f $$f ] ; then \
> @@ -32,6 +34,3 @@ index 68035e4..e3f7990 100644
>                 fi \
>         done > $@
>
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_2.12.bb
> similarity index 94%
> rename from meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_2.12.bb
> index ee310d295..2ed13afe3 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_2.12.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "ell"
>  SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
>             file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
>             "
> -SRC_URI[sha256sum] =3D "a90e621f45b9c2f9021beea0fa6477ee0334fcd2ee34beaa=
b42e31ea0fd3be29"
> +SRC_URI[sha256sum] =3D "6b71a78c1e1a0200c6b0097efe0f4055a76f445c0e17cdd6=
225d89538d7dc35e"
>
>  inherit autotools manpages pkgconfig python3native systemd
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108133): https://lists.openembedded.org/g/openembedde=
d-devel/message/108133
> Mute This Topic: https://lists.openembedded.org/mt/103596458/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

