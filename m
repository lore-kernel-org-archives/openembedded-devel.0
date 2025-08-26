Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DA7C8303F
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 02:54:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.55853.1756176879765928390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 19:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dm/nsECn;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71fd1f94ad9so41349667b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 19:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756176879; x=1756781679; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8PXKVWIdksvc72mTwpy1KwyfBa0NBabLwr3vMOAre8=;
        b=dm/nsECnJchEXOyCqeM+UMscWBUn2jfQK8nAv9T6L3qlooB7+dg8j73nG9ZiNv+iV5
         Zx0DsRZAYwJYIwdIk3ncb+5QpTGZnkOfkQoaxZ3/xoerZurVnKm/1FsoEBiW/KOtiBlx
         1ROZ3wBpILBDoXNh1C4ow+2Q0zx7gQglFJLeKFoe62faIE1Uzw0yRXQwm+XOmEVj+yqh
         NxrUtkqIv6wbsjlm6Y1hAHw1XdqnX+HaIb0qZNeDKboyggOatKAN0Uqtv2y2zsAbNj6p
         Y1x5qQppxWYlzVnwvUR//3RchLL65NnJ6hR3/K8p9c4ksTX8/UobgjYoR57c2GiBq8Jt
         zDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756176879; x=1756781679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8PXKVWIdksvc72mTwpy1KwyfBa0NBabLwr3vMOAre8=;
        b=fbNN8cTxJ4bQrztO1Ehjgs9CBji1AmNvNwVkN4iIMcLXG2ptTYGIqT5ISYGeY2CBZ4
         tYVYUsMdHAc25HSGoXScUMOTDUxDGPI4k8tLp9yjhMPoP8CKwNbTQPsCNMzFP5K99WG4
         uo49kRT3HC0tW6FbBB/UhXzMwuuEwyALrl3RM3/N+/f79wIXeYYqGeNkaZeZZWvvCEFp
         LcKHBP4OAIb7rYkBDfdZaUsH6VQTR+FoCog5x879XMW7ruOd24H8WOcLQTODP7NZ1qSP
         o+WtTfsjlLdkv0boGxjd/XzrXJby9oMp8AWsytMW3a9gTsGjW/7zWSDFOA1Wj0HucCgI
         BCdA==
X-Gm-Message-State: AOJu0Yw8VXcCVUGD8NV1FOZQSfy0WgYDCHAfFeEedIEGZ4yK5yOgMp5N
	hfEFrup0fotJ23UQEgFfkNyjNa87D1gFQY1bGrWL4xjKvAmP8eyKLDaKn+8vWRi6xEvKKkYsZG3
	9r6C5YvMPTPvWfqgMsdSALhk4Gn1KpfQ=
X-Gm-Gg: ASbGncsPA2EUlokPQgoxSpa7VWfadOcCal4RgPVfj7WsOXOB47KAj1zBpeVwoUEy+eL
	VkrZIPUiiJvlXq56jR6LdFTWu8I99xH8GekFmtQL4R4MwIF/5dCdIuXOcY/atIAVNQuFKufh61g
	FbFoSJu3U6/i8UYP0uSEBGXL1bbW5AkRp+3z89gApmtqoja6Kd5Uz+O80hK2+Jlng5x3TBZHsqi
	JTwHt/0POld01GbI8190bB/+qk6+YG7f3kj2LWRFSxsMSAG5eO4ewDUSNyc97goaXCPUxcmKDk2
	8N6jtiSjtjBk83Rxf0gbYAM=
X-Google-Smtp-Source: AGHT+IFi+wy8OZDsYkgNcxVCcbRVaDsp+GBx09Ok6QMgQMiAXWAOHj07qilN8D9hD5ABidsF/JB47GH5ueF4nil8clY=
X-Received: by 2002:a05:690c:6e0c:b0:71f:f942:8441 with SMTP id
 00721157ae682-71ff9428584mr102556977b3.50.1756176878719; Mon, 25 Aug 2025
 19:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250825074558.2945810-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250825074558.2945810-1-jiaying.song.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Aug 2025 19:54:12 -0700
X-Gm-Features: Ac12FXw2mkaoAEhYZ90W7QaBFudCfH9U4ocmfzpbGrWfpvuYZNfPCSHOLfh0I58
Message-ID: <CAMKF1so6Op20oegGgQYxneRFj3Q3Bnvte7h_F2Z0j6Zh8w_CVA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libconfig: switch source to GitHub repository
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 02:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119106

On Mon, Aug 25, 2025 at 12:46=E2=80=AFAM Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> The original tarball URL no longer provides version 1.7.3 or any other
> historical releases.To ensure reproducible builds, the source has been
> switched to the official GitHub repository.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta=
-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
> index a4df707dd7..ace2698fa4 100644
> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
> @@ -7,9 +7,11 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dfad9b3332be894bab9bc50157=
2864b29"
>
> -SRC_URI =3D "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}=
.tar.gz \
> +SRC_URI =3D "git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;=
branch=3Dmaster \

add tag=3Dv${PV} as well.

>      file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
>  "
> +SRCREV =3D "525922a6b49ca19235cdf307376e7c9c539d1b93"
> +S =3D "${WORKDIR}/git"

setting S not needed.

>
>  # needed when we modify grammar.y with above patch
>  DEPENDS +=3D "bison-native"
> @@ -19,7 +21,5 @@ UPSTREAM_CHECK_REGEX =3D "Version (?P<pver>\d+(\.\d+)+)=
"
>
>  inherit autotools-brokensep pkgconfig
>
> -SRC_URI[sha256sum] =3D "545166d6cac037744381d1e9cc5a5405094e7bfad16a4116=
99bcff40bbb31ee7"
> -
>  PACKAGE_BEFORE_PN =3D "${PN}++"
>  FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119092): https://lists.openembedded.org/g/openembedde=
d-devel/message/119092
> Mute This Topic: https://lists.openembedded.org/mt/114878025/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

