Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D6DC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 09:32:03 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.72014.1746523916316959734
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 02:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmAJEu2F;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549b159c84cso5993914e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523914; x=1747128714; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GwB5JGXSWXlJQV9ezhhhIJF8PLeA1rTpx+zf8ut4Cc=;
        b=dmAJEu2F4jtE/2Txc0SQ4dM7XrkgLm9+9tZwDgdMDDI/1rOojcvgal35dpDYPfUyVH
         n06kLqM+6aj5Y55LkDI/wRNqIYBnd+fOO3e1+SPFeKWwxK9DnxxfjZQtgEJ15DqwpX9a
         clHPSf/uYkIKSN9nelFhvZhdqg2LhBpLrinzqP0KM9NQP/OrU9BQMGsZD8AMAMOo+YmB
         4rJWn9uv8XTkL3NbbrXz77exC6SFwo4RohqR70xgJ/915xIk1IDQ7vM8Mo7tSJNscNRa
         uGpWqgPpPaVMCUV10h6YTpWmado9IG1+H2sUeb+Eg3s5POuk4ah2df+rpr81CNWyjCM6
         Fiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523914; x=1747128714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GwB5JGXSWXlJQV9ezhhhIJF8PLeA1rTpx+zf8ut4Cc=;
        b=qTLG/laXa4uq37802UbDgv+o1kD8ZP/9Gs1PV9ZihlRGOiqRTnRQW1TlQx0mJnSdX3
         SnkdpQoa6wgJ/QUpjaGHzVRK48u47yiYE2YEArsyB942QnhsF1b1C2kS82oiIup/MxBg
         i9ZOZbtJCVKuiNDcWxrQjeNbGyn0ozLCHH3tL+ZHJdNqicZuOshVv7rmT5SJur1B4Wsr
         GUcFprOyKzI5pL23LUaB6mlGjhFsjBhKVcEl28L2acPUgL4W3NdttlIByPlyYawZ3U/g
         WikL355y7dB4RGMsUlLXbQd9mB56E/Ffd2duBdjErKHuzCaJGcuzmDe0bvlqztha6hJK
         UbVA==
X-Gm-Message-State: AOJu0YxX7qY73ppu00K3lvu6E3KrbytiCRJAoqQY/2maPI06B6nQCRP5
	yj7vtavlASCokDig0wfHkEm3KK1kGn4V3K2ClJ58hKCgGh7JK3+Loey7ZZzGlbiH91B/D2ytTct
	c8cxyIDWFsuehDG1AOXaObyzamm8=
X-Gm-Gg: ASbGncscMKCM0wevoKkD/HwCBU5U8xGwvaOYX5g8VmV0ojTkuvgk6kBW1Tc0/nDz9Fj
	oyKRyCC0cbkRilZgb+E0tG+LoaO1l1RZpmskkkApTlsvQL+MhwOtQM81wVyXbNO/QiDzBOUwx16
	ai00i5RUPyKgV0ilZBWcagNk/1
X-Google-Smtp-Source: AGHT+IF14YPgwUlKqkUemSmKEb1GsTHdYU2SHNQUDBErhYLF8WR6yDmTrZIiIn/MsDD1BapuhNC5x/LevjpzHN7mmZU=
X-Received: by 2002:a05:6512:696:b0:549:8d67:c48e with SMTP id
 2adb3069b0e04-54fb4a1451dmr649989e87.29.1746523913845; Tue, 06 May 2025
 02:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250505062142.3478500-1-raj.khem@gmail.com> <20250505062142.3478500-6-raj.khem@gmail.com>
In-Reply-To: <20250505062142.3478500-6-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 May 2025 11:31:42 +0200
X-Gm-Features: ATxdqUHphMVF5NdTPbL_zjfD4GRhd9q-cxnYshWNGYJMCwv1p9TSF0OCcI8T3Mg
Message-ID: <CA+chaQcmQLw=3AH0sjj3U_MLLSYQaR_XOR4A25uKKpEJNT-Vwg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-icu: Fix build with GCC-15
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 09:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117342

FYI: In next release we should be able to drop this .patch as it
should be resolved by:
https://gitlab.pyicu.org/main/pyicu/-/commit/82fa082b149db81c894e0d887c0fff=
67c3d2826f

On Mon, May 5, 2025 at 8:21=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> drop is_trivial check
> Fixes
> | In file included from bases.cpp:32:
> | arg.h:856:37: error: static assertion failed
> |   856 |   static_assert(std::is_trivial<T>::value);             \
> |       |                 ~~~~~~~~~~~~~~~~~~~~^~~~~
> | arg.h:859:1: note: in expansion of macro '_IS_POD'
> |   859 | _IS_POD(AnyPythonObject);
> |       | ^~~~~~~
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ove-assert-checking-for-trivial-type.patch | 26 +++++++++++++++++++
>  .../python/python3-icu_2.15.2.bb              |  3 ++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-icu/0001-=
Remove-assert-checking-for-trivial-type.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Remove-=
assert-checking-for-trivial-type.patch b/meta-python/recipes-devtools/pytho=
n/python3-icu/0001-Remove-assert-checking-for-trivial-type.patch
> new file mode 100644
> index 0000000000..4c75eb5f7b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-icu/0001-Remove-assert-=
checking-for-trivial-type.patch
> @@ -0,0 +1,26 @@
> +From 3d58fb48bb1cef2177aab8e291167638993495f4 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 3 May 2025 21:27:34 -0700
> +Subject: [PATCH] Remove assert checking for trivial type
> +
> +This fails with GCC-15, is_trivial is deprecated in C++26
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + arg.h | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/arg.h b/arg.h
> +index a493d11..6cb232d 100644
> +--- a/arg.h
> ++++ b/arg.h
> +@@ -853,7 +853,6 @@ public:
> + };
> +
> + #define _IS_POD(T)                                      \
> +-  static_assert(std::is_trivial<T>::value);             \
> +   static_assert(std::is_standard_layout<T>::value)
> +
> + _IS_POD(AnyPythonObject);
> diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb b/=
meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> index 77013330d8..d265a20975 100644
> --- a/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-icu_2.15.2.bb
> @@ -12,7 +12,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
>  SRC_URI[sha256sum] =3D "561e77eedff17cec6839f26211f7a5ce3c071b776e8a0ec9=
d1207f46cbce598f"
>
> -SRC_URI +=3D "file://0001-Fix-host-contamination-of-include-files.patch"
> +SRC_URI +=3D "file://0001-Fix-host-contamination-of-include-files.patch =
\
> +            file://0001-Remove-assert-checking-for-trivial-type.patch"
>
>  inherit pkgconfig pypi python_setuptools_build_meta
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117295): https://lists.openembedded.org/g/openembedde=
d-devel/message/117295
> Mute This Topic: https://lists.openembedded.org/mt/112625197/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

