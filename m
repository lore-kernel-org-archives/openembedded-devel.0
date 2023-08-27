Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BED9C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 15:43:26 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.403.1693151000282538605
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Aug 2023 08:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D3tmtdDE;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-571194584e2so1625862eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693150999; x=1693755799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoWg6xcp56ixP0kQJM5/ilimF0YRH98UuKvovWeHZkg=;
        b=D3tmtdDEP+EQ8yFq4U6PAuygdjh/oBsb4BtNxSOc8iouvLEfVNUFdptwcYfmxlNvef
         7UFEqhIpxDZ5HyAqt2z/3y6ltOaJPeo6z/5Fg2gSDORGXW8Teis+yEhyIoDygfnYTkt4
         vRl8VcD/JRrcirhEWFLNG6oYTExinyX1jAlXigJ24eTzMDyPhIsLK8nP0U2FSn8YT8B7
         nqyqF89iqImKhfq6br9eYqP1SPdiQ9yF7RhpyY7QJiDTyzgGKefvuJfGDRLMjkMUOknM
         TTxLxlEg7l2GduYFH2iJ9fVOL+0QVpulX3S6bB18J/nYULlHS/9nIj91Y6xuhJIi+g/V
         d+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693150999; x=1693755799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoWg6xcp56ixP0kQJM5/ilimF0YRH98UuKvovWeHZkg=;
        b=GrRsM7qptn7SUkCRbhH/BYN9jYqZrAX4GbWnkCUkD4ZA3PcIaDcMbXrhw/6Qfoyc+Z
         knV3kr1m6K0uIWwS/BldLJmpJrWc2YxVTpYRsLxSXdkEo9YwhLGyUFL7We6KGZ4SdO61
         +wC5Kkamb8m1XVI6c9+3t8eBLQ6ALs35yehdRNos/o02BX4pNPbLxf5NfLzGp1cnSHrz
         pOfQtLqtO+57u/9u64yktb2yHHL96yjFZa7Kf5/ySEBjjui+ggZLBFkjmJBGiFkB+jxF
         U7fMatG0FBDNWtW6Vbjz1S5Fz/JH0TqCoUyX/+6L8ncoSRxUxai3uX4VuzS67Zv6lRco
         sHFA==
X-Gm-Message-State: AOJu0Yw3f8/ijQSpzaxrbi1DODyPSGzsGMlMHrhP8llM3JYZj/FfTpmj
	iwMq8J3vygd1+x64817Fa0E9a3atLHeF8/dJIFU=
X-Google-Smtp-Source: AGHT+IHOltwFkHHfosq+kihMA+tH8VN1Es1SymOakT7IvVu45EV9KQpROTO4YBBmFle2xplN84EsX2YwwWchqeVwsL8=
X-Received: by 2002:a05:6870:2214:b0:1be:ca9e:a65 with SMTP id
 i20-20020a056870221400b001beca9e0a65mr9665203oaf.58.1693150999396; Sun, 27
 Aug 2023 08:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB3678A5299B6D4775A7FF4FF181E1A@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB3678A5299B6D4775A7FF4FF181E1A@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Aug 2023 08:42:53 -0700
Message-ID: <CAMKF1sps=wSgy-ZQYYyi2sb4g+6rx2EaJb=vexe+=ssB_uGdEQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-sdbus: add recipe
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 15:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104627

On Sun, Aug 27, 2023 at 8:13=E2=80=AFAM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> sdbus is a modern Python library for D-Bus
> https://github.com/python-sdbus/python-sdbus
> https://python-sdbus.readthedocs.io/en/latest/index.html
>
> Signed-off-by: Petr Gotthard <petr.gotthard@advantech.cz>
> ---
>  .../recipes-devtools/python/python3-sdbus_0.11.0.bb   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-sdbus_0.1=
1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.11.0.bb =
b/meta-python/recipes-devtools/python/python3-sdbus_0.11.0.bb
> new file mode 100644
> index 000000000..84b4178f7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-sdbus_0.11.0.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "Modern Python library for D-Bus"
> +HOMEPAGE =3D "https://python-sdbus.readthedocs.io/en/latest/"
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3De7=
7986dc8e2ee22d44a7c863e96852ae"
> +
> +SRC_URI[md5sum] =3D "9cc6317acc14dbb89894719e06e4b0ff"
> +SRC_URI[sha256sum] =3D "f86fbadae54fea6441ec2f27dc29daf085269d66c5d9df1a=
4fbc9474a24b91d0"

Drop md5sum, its not needed anymore.

> +
> +DEPENDS +=3D "systemd"
> +
> +inherit pypi setuptools3 pkgconfig

If it has hard dependency on systemd then please add

inherit features_check
REQUIRED_DISTRO_FEATURES.=3D "systemd"

> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104626): https://lists.openembedded.org/g/openembedde=
d-devel/message/104626
> Mute This Topic: https://lists.openembedded.org/mt/100991886/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

