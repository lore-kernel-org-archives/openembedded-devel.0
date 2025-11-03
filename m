Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11D1CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 06:14:27 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14582.1762150459330349568
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Nov 2025 22:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Inp3KQzr;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63f9beb2730so1808837d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 22:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762150458; x=1762755258; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Eqw7/05XoAQAbYvX21LlTDT8oEVzyjQUCRUXPyb1vg=;
        b=Inp3KQzrMWyfILgBplqD26XBVDXTAJY7ZqOGW7bM5Vi6NXoQPg2SFmq+NJVuPOCogr
         Y3DUHxmYb8gnz1VtTuqstyoiLvAnYnIdcXd8MfNYCx4ouCaVY9gtgVzHGgc6C5GjbL8j
         C0E7vi0iw9r9dqYVecG4nEgJH1NSGHaMXbt4mMYKgKt6ZErWuMyPX74eHyuGZpp8CmOz
         713mj0DzieSfbgy3vkJ9OJL7ujj59zcNO6C/9mnXjIfXVDjnW3tUNNGnAsaSjFe5TecO
         4cGieGBHe7zzFK0lPU8aYlh30xs+Hm8uuEY1/hiwphW/1BdPlTBZfBfRhCycr0p7XEen
         5A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762150458; x=1762755258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Eqw7/05XoAQAbYvX21LlTDT8oEVzyjQUCRUXPyb1vg=;
        b=Ck5H8cM0dJlYz2LcqZRrfGSkxd3tZ8IdHkKkJeRSaHzKpvXNCXM3FH1HtWQbYDGlvf
         1rJpBlJ9KaneHCPW8qzvNoYF946k/4bqLc+5Ar5X6jBdRDJbWtgSPu+tZce6SiThwNV7
         DT8xHgjxm6OHehUlSBJRI8GKYzrGPTV1ulVcmvcLrbZd0OekizTqcHP8bokBFbrERScU
         clmQjua35SWiQRNQXEO7gvKiDQg3BkxHO1vJRdskD1tw5ajkgcPsd7kd/1+Y68rV2o9p
         HuyUvP4PLrxxMWVhZtTVQaE6UPAlIjS2tLX0itdhUwpxfK/jYXl8clrtHClIcyAmuTqI
         c0Mg==
X-Gm-Message-State: AOJu0YxdvvivvR7xgHGPYGIwsjpDlUD3Z0fNI5L/dFJ/AQ/Vz3HlU2UG
	FH69fgj5z9UnCR+OA9j+eH2v+NitfJTV3YVIpKBr51yqNNSpIQOjVEEgj7mHDkikuyZaIo04PHZ
	AV6YZXAwjlAPx41ozJkOXdFLxiUjjcZo=
X-Gm-Gg: ASbGncvScZHgkEDfMsfPAah5rok2rec9HdFJjj0xN3jL7Ps0hDD+OiTdk/fywntW5kQ
	yBRUs/j1A9uaL5TNPORdmubnGAeVBBNqzvDEYOJNn6DSjYpFfrOk1B+WMECrp3piIASL3KRGlYU
	xhzGPm83l7rmEzmcytNIkRvgT1y1MxYlRhda/1V+gY8tmPezeBB4YeTKLsOIeLEUUhFTA80vZA9
	OqdbRZMhkJUXmQYfQ7iMj/rGoIgk8H9+7/aM9H2Oevhr7RNFGHoSM0s58goY+Q5GNTGHQ8aSF4m
	bRfmy+aXroDXTAv63P5TGAW4R+VubPw50ky/RUakaWDzK+X8T8soKRrS1UqR
X-Google-Smtp-Source: AGHT+IG5T6U6XY7QlDiwOtNQ2KfvixxfOM0on9AxVgGP1uYnsfXpPv8pfttX35yb0cVz7WXFR/mQ7yytLFLkWiD8JpY=
X-Received: by 2002:a05:690e:d01:b0:63e:e04:fc31 with SMTP id
 956f58d0204a3-63f92316e46mr8321026d50.43.1762150458360; Sun, 02 Nov 2025
 22:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20251101081537.437029-1-f_l_k@t-online.de>
In-Reply-To: <20251101081537.437029-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Nov 2025 22:13:52 -0800
X-Gm-Features: AWmQ_bmV5CMqqPEhSSidzj8HnUBNUxCBlYDcFU2IoHQoreemCyiZ6UiuvB4NiXs
Message-ID: <CAMKF1srq0yUsBVWvs0QpO0AVyLBihztUxWcvHViSWz=TUO-5NQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libtinyxml2: use cmake buildsystem
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 06:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121266

Fathi added support for generating both static and shared objects
since uuu static build needed. If I accept this patch then that
case breaks, if I don't then cmake based dependencies have issues.  I
guess we need to find some middle path. Perhaps offer a packageconfig
option to build static version or shared and then default to shared it fine=
.

On Sat, Nov 1, 2025 at 1:15=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Currently tinyxml2 is built with meson, which doesn't generate files in /=
usr/lib/cmake
> Use cmake instead. This will generate files in both /usr/lib/cmake and /u=
sr/lib/pkgconfig
> and allow cmake projects to find libtinyxml2.
>
> Avoids errors such as:
>
> | CMake Error at CMakeLists.txt:11 (find_package):
> |   By not providing "FindTinyXML2.cmake" in CMAKE_MODULE_PATH this proje=
ct has
> |   asked CMake to find a package configuration file provided by "TinyXML=
2",
> |   but CMake did not find one.
> |
> |   Could not find a package configuration file provided by "TinyXML2" wi=
th any
> |   of the following names:
> |
> |     TinyXML2Config.cmake
> |     tinyxml2-config.cmake
> |
> |   Add the installation prefix of "TinyXML2" to CMAKE_PREFIX_PATH or set
> |   "TinyXML2_DIR" to a directory containing one of the above files.  If
> |   "TinyXML2" provides a separate development package or SDK, be sure it=
 has
> |   been installed.
> |
> |
> | -- Configuring incomplete, errors occurred!
> ---
>  meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> index 89e6eca99b..84baeca8d9 100644
> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "git://github.com/leethomason/tinyxml2.git;=
branch=3Dmaster;protocol=3Dhttp
>             file://run-ptest"
>
>
> -inherit meson ptest
> +inherit cmake ptest
>
>  EXTRA_OEMESON +=3D " \
>      ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=3Dtrue', '', d)}=
 \
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121245): https://lists.openembedded.org/g/openembedde=
d-devel/message/121245
> Mute This Topic: https://lists.openembedded.org/mt/116061822/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

