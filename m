Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2572C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 01:43:45 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.2558.1652924622461217153
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 18:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mtFeIbxy;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id s22so3960264qta.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U3BnZ4BVKoS+ysqwkNlvu2I6txZE/uVqbeGfgtQRULM=;
        b=mtFeIbxymBelzgovkiDEs71PnbofGu5vKcSMuDoQuP6DM1lbFSyNXBSwW0FblMGGU1
         BKKKOmlmNuys27SfSpwBkJHMFX0vGM6o7oQ6pWUU59fI+CrcTBuIkEbccyKBmOIA5WQ6
         4Byk41sWQH2xXXMeyAPh6mmqk0oAg93GzSKfR3lG4GgKidm60Zxz1Vb7wICYlzucMyU+
         jYW3Ustrj3pSY5B1HOTSueC4LTv2M268uAsbkqnYPO5ypy1lehLDen0tMzldE4I64nR3
         SKWNEEqX5VzdC4MeVmyDs/aSgfR3x+pl8u8PcFYIgmviIC6m+xU4yar92waxLT4Bi4Ry
         P5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U3BnZ4BVKoS+ysqwkNlvu2I6txZE/uVqbeGfgtQRULM=;
        b=FPpeVgzFhaDgeMaPQeLAhY0LS+sEyDYPSmaoyU0nWbyjGcyVlf3KtgbeR7F1LCh1go
         fFfbJKv76Bey6+X2rHrOwkaRlM1x6/4UjwysicB2GBny/rB9qgapWmlHhpuDyV7bS94p
         pbdILvbNXQ+k2Tkzg38yZNodKvioPX80ZMRLeGK9kYjHnStSaPSbTRfQehg2EXbkHfQ7
         ekgFHzVsRwV+RksK6z3HIzgMmKr72W9p1yZlrrxwSFuNpaqFza99WL0uLje7D7tAUTe4
         IC4E6dVqWdhCT4EAG5IR5Sdf6/uFicPOXS9O50PQsJ56bSZuHU7XexbiwoDIJQpckTQw
         vdbQ==
X-Gm-Message-State: AOAM530wM0NnM2kjSDjN/xmNeEuVUmjgM7ZjX4iAADav8HCggMWCcvV8
	8zkBVir6A9vbg974oqQM2bfLDugeR1A6jitt5x4=
X-Google-Smtp-Source: 
 ABdhPJzp7Z5eQ/EDIMn+cUrLT5YQjt/YORiz2Xqn4WEhh3yiYc5as2SLGptuI7UNamGozmr0CFHmVZg4RJTbQF+i74Y=
X-Received: by 2002:a05:622a:18aa:b0:2f3:badf:beae with SMTP id
 v42-20020a05622a18aa00b002f3badfbeaemr2241936qtc.229.1652924621457; Wed, 18
 May 2022 18:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220518071915.113319-1-zboszor@pr.hu>
 <20220518071915.113319-2-zboszor@pr.hu>
In-Reply-To: <20220518071915.113319-2-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2022 18:43:15 -0700
Message-ID: 
 <CAMKF1srW+SjvZ+=wC+ZxPdMUsNDce5O4kcv=i3Sx0zHw-64kyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] python3-pyproj: New recipe for pyproj
 version 3.3.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 01:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97166

I am seeing this

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1766

On Wed, May 18, 2022 at 12:19 AM Zoltan Boszormenyi via
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
> View/Reply Online (#97155): https://lists.openembedded.org/g/openembedded=
-devel/message/97155
> Mute This Topic: https://lists.openembedded.org/mt/91181351/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

