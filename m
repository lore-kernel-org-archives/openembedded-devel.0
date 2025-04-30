Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CF7C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 14:59:56 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.743.1746025193194031350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 07:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ja0ozgRJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2d54b936ad9so3385995fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746025192; x=1746629992; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaBrFJx6uyA3FkwpQXcVF/Svjyb4yQn3gWZkZRAmvXo=;
        b=ja0ozgRJqaHaWrzYlkie7aCtsfLhc4armqyjHzMy62dtu8VXXilWsyw3JaVnk7oK2B
         ALqO8EEvGzk8mdHNP/i6tH6mrfsjcZdRzxMLYTzL+eNpofBqOGdEg40FeEoY2WRSXVUu
         0gaPJX4XnQXa5Wsx/OhLFK1nlYzwTwdKRTTRbqt4arny5uTKOxpHH6L+eCS5M3Ny0z59
         p8tgXH7ask9fg2IIC3CSo9jtZMYbpoLZQs74Gv6R9vHpRiB7kiT4TravjVkJs8S6RUsS
         Ny0sbl0qK3xnihre/Uad45eK/NE3EEekj0p7IUlLJ5UyO8QUkApR8GGGmWSx8hV1o7LA
         ReVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025192; x=1746629992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaBrFJx6uyA3FkwpQXcVF/Svjyb4yQn3gWZkZRAmvXo=;
        b=wZTbJC3KM+3Bpg+D4fM0jmDG+/2fxNyCgijaIGfEtyhYouE1IdcM/V+N93NhHOI0IH
         y3EtmDPjV+Uy8k2BLVmI6NRaJQUfAB9aeQhR1XH8jdWfXxZ4BT+P8n+mUsUdfa5FRer2
         7GpAHQoSSJGuUHhJ+FfDYmZkZ6gmx3ZP9OVRkY1b6mMxpdlAj5ovgC/27cfUZts2dg2y
         RUVY16ryhT9/KTiezxK8whTc8LgGpIc7U5d53aoAXm5fa24CKxw5uuTPWnQ26b7FQFbK
         P3b7zERyPvvT/LltsYrwb+iWeKZg3zzHU/upLrlUhZYONetEilRQ4/I0s0E+6murjOFu
         flsw==
X-Gm-Message-State: AOJu0Yys3KiZTE32+kNJVkxrJyEiEEm/1IvBjzg+BBFXG9unIlNePrtj
	9C/UPgOA1jwdabQxkYLAhinhEiUXHtuDrAWlbVr8+EZCwLd/CnP/fwqnly4fZCNjgH82VF2fYJL
	zzebnCo27Papx2HyrYLg0VWddaY/S5kzJ
X-Gm-Gg: ASbGncsLVf4r3fu9nnqTD35P/mUtMXrO5IAcPO73eHKyWzt0ezjCM7h/4yqUsBVJUEH
	d8f80a2AuiRG0G2dm3zdC7RA5rQG40AdhZi5uIPcoX4pAcXCcm5Rsozf059kgVbytnEFzXYQgkM
	9zkeBzGoZa+SiLTv4sRea3H+Ky78SWdrexCjK4j0V75uJtfY4=
X-Google-Smtp-Source: AGHT+IE697gEsQadT2vNv3HgGb2IrapLH6NSRlANvXz77QpUZzsVSJIYr8fTkLEIJUthSZAQLy5DHbVRIWmBt8RZJPk=
X-Received: by 2002:a05:6871:4527:b0:2c1:5674:940e with SMTP id
 586e51a60fabf-2da6a096d1cmr1915943fac.21.1746025192384; Wed, 30 Apr 2025
 07:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <FR2P281MB0121CBAFBE8CD25844976884B8832@FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR2P281MB0121CBAFBE8CD25844976884B8832@FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Apr 2025 07:59:25 -0700
X-Gm-Features: ATxdqUHHJWQ9V9m6tnIqSPr7-ThsE4Kf_cmkdItFdwGBt_iKzUHYW69SOrIjBjA
Message-ID: <CAMKF1srKwFozWOXW1auLZZzbN3Hb_b5x=h0_rT=nq8KDnWotjg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
To: thomas.noack@iris-sensing.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 14:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117258

On Wed, Apr 30, 2025 at 5:10=E2=80=AFAM Thomas Noack via
lists.openembedded.org
<thomas.noack=3Diris-sensing.com@lists.openembedded.org> wrote:
>
>
> Signed-off-by: Thomas Noack <thomas.noack@iris-sensing.com>
> ---
>  .../{sdbus-c++-tools_2.0.0.bb =3D> sdbus-c++-tools_2.1.0.bb}      | 2 +-
>  .../sdbus-c++/{sdbus-c++_2.0.0.bb =3D> sdbus-c++_2.1.0.bb}        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_2.0.0.bb =3D> sdb=
us-c++-tools_2.1.0.bb} (88%)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_2.0.0.bb =3D> sdbus-c++=
_2.1.0.bb} (97%)
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb b/me=
ta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
> similarity index 88%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
> index af112ced88..10704a6cd3 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
> @@ -8,7 +8,7 @@ inherit cmake
>
>  DEPENDS +=3D "expat"
>
> -SRCREV =3D "e62472b210d9e7f06a5e611c23471d414c99a99c"
> +SRCREV =3D "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
>  SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhtt=
ps;branch=3Dmaster;subpath=3Dtools"
>
>  S =3D "${WORKDIR}/tools"
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-oe/=
recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> similarity index 97%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> index a3e7c9ab54..a81d94d2aa 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
> @@ -17,7 +17,7 @@ PACKAGECONFIG[with-tests] =3D "-DSDBUSCPP_BUILD_TESTS=
=3DON -DSDBUSCPP_INSTALL_TESTS=3D
>  DEPENDS +=3D "expat"
>
>  PV .=3D "+git"

If SHA is at exact release 2.1.0 then delete adding +git to PV

> -SRCREV =3D "e62472b210d9e7f06a5e611c23471d414c99a99c"
> +SRCREV =3D "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
>  SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhtt=
ps;branch=3Dmaster \
>             file://run-ptest"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117252): https://lists.openembedded.org/g/openembedde=
d-devel/message/117252
> Mute This Topic: https://lists.openembedded.org/mt/112537365/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

