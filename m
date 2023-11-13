Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5B1C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:50:02 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.3650.1699901394902562316
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hjyKiPkn;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1ef9f1640a5so2951539fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699901394; x=1700506194; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybl31omqKYRLxCK+hfzdPozwafCG4GPl26Zp8Leo6rc=;
        b=hjyKiPknddrYWDWChuPm55cAKUEqKLL2NaL5pNcHlvOIrastptsMojofcfZL+HAQZt
         abjPpzbaa+Z0S+rKCnCquFGeigVti7Q8r6mYL9wU0tJrBrou1qNKeMN2YNHCEA9MTDJr
         GvCx2GVR/KM/+Xx/o0dWncoTHGpZiZ5J15UaEMsAjoncr9Pg3gcDIrhYwoJVFezovyK0
         mRm3hwNqq52PHeyGyH9HJU4fMlW0NWz+tLwE8NP8eOVb3UKmBZcEcpWweI3xfzRIZqNW
         rHSedorqFWo8ZHYeWNswfUIs9BPkfIhAZzl682fpd03nDOevi8Xg2oAjJyJ7i8gV1tTJ
         J0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901394; x=1700506194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybl31omqKYRLxCK+hfzdPozwafCG4GPl26Zp8Leo6rc=;
        b=fsy0frRsU6vh6K4ETSUmk0YAebsdYBKZDBwYyhqmnajI4LGMDEIiUHW5r7C2y3xxYg
         2gjq1GOXIVWDKOyGEt63DKDQTlCB5zpXP7fQK5xfVnUr5NA3D2le1aiT/IqmLI1J3K4T
         c2v2GfBqP8etM3NM2pWxnJw25eFAz6T9y+bYUudLXQLvWqonNpM0QWAQZ2yuCB0WYwNA
         ZeGMGnOwVKn58tvJrBhsRUOCjrq2eGKBliLBSF4qpkhw0cXJb0mc19LPe7HA5ySA4vx3
         889+4e8gEqS0o8ccXhODIcqc3cFwtOlD203dq3ovC9rKffMnM4ThgFfFM1EuiZHDelqg
         xQ4w==
X-Gm-Message-State: AOJu0Yws1fAu5lNP8M+I+KwvxJnanZ670FsSzfAp7bSdcXB+zSXCZADK
	Uu5mWxCxhfAbETovVknzSbrbiom2vrqOZpYxBa4=
X-Google-Smtp-Source: AGHT+IEw122JBJot+308JT6+eZi7b45ItqK+XmAgFQ3DQCzZUbRwZftKxv5J9BYc9fNuS5vT+2buX5uey/NwSJgRwKo=
X-Received: by 2002:a05:6870:2c90:b0:1ea:c913:3494 with SMTP id
 oh16-20020a0568702c9000b001eac9133494mr10002701oab.6.1699901394100; Mon, 13
 Nov 2023 10:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20231113123441.104938-1-alperyasinak1@gmail.com>
In-Reply-To: <20231113123441.104938-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Nov 2023 10:49:28 -0800
Message-ID: <CAMKF1sqWqZgrpLyUtCJJnL3=1KP6NthNamQC55Li322pwwBrBw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCHv2] civetweb: upgrade 1.12 -> 1.16
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106673

Please rebase all of your v2 patches on top of master and resend please.

On Mon, Nov 13, 2023 at 4:35=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> License-Update:
>
> - Copyright years changed
> - Added additional components Copyright
> - The website keplerproject.org seems to no longer exist. So, the source =
URL used was changed
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> - Added "-DCIVETWEB_SSL_OPENSSL_API_3_0=3DON" because of following error:
>
> civetweb.c:1561:2: error: #error "Please define OPENSSL_API_#_# or USE_MB=
EDTLS"
>
> You may also want to check out the available CMake options here:
>
> https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba=
988a15159/CMakeLists.txt
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> Changelog:
>
> https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba=
988a15159/RELEASE_NOTES.md
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  Added explanation about why the license was updated.
>
>  .../civetweb/{civetweb_git.bb =3D> civetweb_1.16.bb}         | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/civetweb/{civetweb_git.bb =
=3D> civetweb_1.16.bb} (91%)
>
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.b=
b b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> similarity index 91%
> rename from meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> rename to meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> index e9c205618..0a654a10f 100644
> --- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> @@ -2,10 +2,10 @@ SUMMARY =3D "Civetweb embedded web server"
>  HOMEPAGE =3D "https://github.com/civetweb/civetweb"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D50bd1d7f135b50d7e218996ba2=
8d0d88"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dce6ce6eb1b2fd59ee6bab21947=
0442a3"
> +
> +SRCREV =3D "d7ba35bbb649209c66e582d5a0244ba988a15159"
>
> -SRCREV =3D "4b440a339979852d5a51fb11a822952712231c23"
> -PV =3D "1.12+git${SRCPV}"
>  SRC_URI =3D "git://github.com/civetweb/civetweb.git;branch=3Dmaster;prot=
ocol=3Dhttps \
>             file://0001-Unittest-Link-librt-and-libm-using-l-option.patch=
 \
>             "
> @@ -23,6 +23,7 @@ EXTRA_OECMAKE =3D " \
>      -DCIVETWEB_ENABLE_LUA=3DOFF \
>      -DCIVETWEB_ENABLE_ASAN=3DOFF \
>      -DCIVETWEB_BUILD_TESTING=3DOFF \
> +    -DCIVETWEB_SSL_OPENSSL_API_3_0=3DON \
>  "
>
>  # Building with ninja fails on missing third_party/lib/libcheck.a (which
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106641): https://lists.openembedded.org/g/openembedde=
d-devel/message/106641
> Mute This Topic: https://lists.openembedded.org/mt/102560182/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

