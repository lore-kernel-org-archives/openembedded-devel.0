Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDA0C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 17:51:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.10928.1652982674115082439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 10:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RdJOGpqS;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id v6so2318802qtx.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w/8DPG3frXzUfA/hj2c7MQrw1DoKv9R/FO+MG09Jhm0=;
        b=RdJOGpqS362kwedEZwH+ifhz45nWdTEobrs0DY28h4UtJ01ixgtEppj4PZFL/DQf95
         f0p4qylHYzuvvgE3A3weQW7jeCE7lEqfrCRoWxzUBVXZLdbK4UNcvE14rNS9emHJAV+C
         O+1zRB2jljPnWPo/fAiUopSu/CAK79Vwpm9JVZyzZ5i4rZrt0jk5dbI1iK9clNoyHfB5
         7+/p3hoiA0NTOJPGA09cIwHtKmA0ebITyIEe+k8tgUfk3blJO4zMllErXHpe1dd9PlvV
         ZGVSqlkZSVLXOOlUttmvPrz2aGJ9i60eto9l8PHOJAmwyCad92dLj/9dxq6jYLG5x4Zx
         t1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w/8DPG3frXzUfA/hj2c7MQrw1DoKv9R/FO+MG09Jhm0=;
        b=a31US0FEDqi3Ljalw+7tAWD+t5OdJ9sDPMDSSHdWysCMnBgUIlXZ1D2btCMfr+vb8y
         7AyoOxjjQ9ZNSj8lM1VdikbrtmY9XcpKjbTya5oG14XLmdFtVPy2aCpt24mG+V5AmEZ+
         Hud0ELYRoZLOwfF99sgqHjTKDl98QmhP08EVBXbqj7DuAIgJ4tam077lR1X4QfNTGtpu
         TgCkUxDXL03cU3YTqWnBRcof7IPD68L7RS7nIljw1WXZhhJ0QA42YMDTswDul5Bb2ORn
         j3vlI6aTDyGBwjAnB5KhvT/bLWIOHQYVFfcu4uMf+miyXeiGJHJXlzLZfHp33GYEV6ei
         uZXw==
X-Gm-Message-State: AOAM531s399/g106czQ4H9R56DPYTfYN7ovfF14uApCCTM1Y1wkynmlD
	WL5MX+BgGO2oVs0wnsaFRKwKu+e+dPbtiG7Uebg=
X-Google-Smtp-Source: 
 ABdhPJz8h2cbtdu3Cmowv10gpwV6ymFk1xGex55XFhU5PAv9DVH0bU3F1YPJpYjhuEWc/dn1fGI+lfs3S5Bgmb5XEho=
X-Received: by 2002:a05:622a:18aa:b0:2f3:badf:beae with SMTP id
 v42-20020a05622a18aa00b002f3badfbeaemr4846374qtc.229.1652982673173; Thu, 19
 May 2022 10:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220519051622.1050304-1-zboszor@pr.hu>
 <20220519051622.1050304-2-zboszor@pr.hu>
In-Reply-To: <20220519051622.1050304-2-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 May 2022 10:50:47 -0700
Message-ID: 
 <CAMKF1sokAW+7zY46o5aJGGTatpc+g8Ft_9dgX5FAW4cgLdihDw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] python3-pyproj: New recipe for
 pyproj version 3.3.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 17:51:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97202

fails to build. Seems to access proj-native libs instead of target proj

On Wed, May 18, 2022 at 10:16 PM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> It needs PROJ.4 >=3D 8.x and the fix for setuptools in oe-core.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../recipes-devtools/python/python3-pyproj_3.3.1.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyproj_3.=
3.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb =
b/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb
> new file mode 100644
> index 000000000..ebef1e74c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Python interface to PROJ (cartographic projections and coor=
dinate transformations library)"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc4bb2668871655e24030dfe8d2a7=
ce7"
> +DEPENDS =3D "python3-cython proj"
> +DEPENDS:append:class-target =3D " proj-native python3-cython-native"
> +
> +PYPI_PACKAGE =3D "pyproj"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D "b3d8e14d91cc95fb3dbc03a9d0588ac58326803eefa5bbb0=
978d109de3304fbe"
> +
> +RDEPENDS:${PN} =3D "${PYTHON_PN}-cython proj"
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97169): https://lists.openembedded.org/g/openembedded=
-devel/message/97169
> Mute This Topic: https://lists.openembedded.org/mt/91202579/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

