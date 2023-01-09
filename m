Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661F2C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:20:17 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.67336.1673256007181425857
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kAFUDHTf;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id s5so2914940qtx.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QozZ/OH0+J1XkvbNzUfU8Dj/40sFi6SKOvTnew8125o=;
        b=kAFUDHTfWk/1S1DiB/OlcZSGc2A/YonEsK7ufGkX0LmpB8uaV/RUgkspIUMVMZZ9JP
         iBDDGJjiIAR20wHnx2ZskNwIxo4uD9cIIsC9spbodnAt3spj3owPg0mwn3PlQT847A5O
         HktwpCHQlTK2Ifibr3XX63azyURM8l8wr/3Jtj2P7MdkT5phTaYVbQQuXxegQh0DXP9z
         QPiXzB4HETXeBArW0GfNFY0OWaMCEbbzKZq2fkBty0myBLJ8X21XpMjmiZmA8xbpr5Cg
         076Uz6ijg6/UWcMO90fKfc/gH+ORRLIWFDRJmGv7h8DADFjDAHo+EM/VoAd5N/KCCOkp
         vtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QozZ/OH0+J1XkvbNzUfU8Dj/40sFi6SKOvTnew8125o=;
        b=zh3gAFqjMV/HiDeLgP4cGpjr/BhODbaWRhReHEFh1aJoRRPPp1nJ3a8ft2dAWfZrwh
         0ZNCArVsCPN6QnmVe9xK6PRG1R4o69wceZ//MGyF+PYpk2YFH2tlBN4DdZN9mgvOqh05
         pb6uQXbHXYq3efAkr85qOM+DASIDe4QrQ0RJhn5ZhwFrNaGBmPYUqNC92sCLnsVwOH3d
         gNKTrlfYZiwEe3LDQrpK3UC/Oz2wICI8xMRx4eLpqc0lFU/bSgD7ua3/JEyPi+h7V0dI
         IVWrCtqHcS1F2r9UdxG9bKvC2UWSAs4mYA3sKe+NEIiDUSqKtcmoCz4tndQe1lCs7gP2
         y5sg==
X-Gm-Message-State: AFqh2krRm4am0qVtzM4zkCHwTXfXGmQnPAzLoEDKk1d9AZXW0qTF+ukj
	Cac6Oj08WrLqH7XdTQiNNOex3vT7H/8WUSonEsI=
X-Google-Smtp-Source: AMrXdXu2LqwtCuUd2P+LT/Sd6XAWrEPulGs9YLhHjTR6vNPEVD3oDYBWM7Vb6QDyzaN7zRkCDVsQkOIETS3fMKpp734=
X-Received: by 2002:ac8:4a07:0:b0:3a7:eb5d:73e4 with SMTP id
 x7-20020ac84a07000000b003a7eb5d73e4mr3099800qtq.250.1673256005991; Mon, 09
 Jan 2023 01:20:05 -0800 (PST)
MIME-Version: 1.0
References: <1729E999E4AE6822.5511@lists.openembedded.org>
In-Reply-To: <1729E999E4AE6822.5511@lists.openembedded.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 9 Jan 2023 10:19:55 +0100
Message-ID: <CAJiuCceZepMz2j+uQ8NOw=SojWq31utbCPR==V_Z0tMYfLnt2g@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] navigation: bump proj to 9.1.0 library
To: peron.clem@gmail.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 09:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100480

Hi Khem and OE Users,

On Tue, 22 Nov 2022 at 13:59, Cl=C3=A9ment P=C3=A9ron via lists.openembedde=
d.org
<peron.clem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Proj has moved to CMake build system.
>
> Update the recipe and make more PACKAGECONFIG available following
> the ./contrib/oe-stylize.py output.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>
> Changes in v2:
>  - Disable BUILD_TESTING
>
>  meta-oe/recipes-navigation/proj/proj_8.2.1.bb | 22 -------------------
>  meta-oe/recipes-navigation/proj/proj_9.1.0.bb | 22 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 22 deletions(-)
>  delete mode 100644 meta-oe/recipes-navigation/proj/proj_8.2.1.bb
>  create mode 100644 meta-oe/recipes-navigation/proj/proj_9.1.0.bb
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb b/meta-oe/reci=
pes-navigation/proj/proj_8.2.1.bb
> deleted file mode 100644
> index 0c1104926..000000000
> --- a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY =3D "PROJ.4 - Cartographic Projections library"
> -HOMEPAGE =3D "http://trac.osgeo.org/proj/"
> -SECTION =3D "libs"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27445198ba1500f508fce2b183ce=
0ff"
> -
> -SRC_URI =3D "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
> -
> -SRC_URI[sha256sum] =3D "76ed3d0c3a348a6693dfae535e5658bbfd47f71cb7ff7eb9=
6d9f12f7e068b1cf"
> -
> -DEPENDS =3D "sqlite3 sqlite3-native tiff"
> -
> -inherit autotools pkgconfig lib_package
> -
> -PACKAGECONFIG ?=3D "curl"
> -
> -PACKAGECONFIG[curl] =3D ",--without-curl,curl"
> -
> -FILES:${PN} +=3D "${datadir}/proj"

When marking the proj as a DEPENDS of another recipe only the lib.so
is installed.
Running my executable will failed saying that:
"Cannot find proj.db"

I can fix this by marking the proj as a RDEPENDS of my recipe.
But is it the correct fix?
Can I tell bitbake that the proj.db is a dependency of the library?

Regards,
Clement

> -
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb b/meta-oe/reci=
pes-navigation/proj/proj_9.1.0.bb
> new file mode 100644
> index 000000000..b956ce50f
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "PROJ.4 - Cartographic Projections library"
> +HOMEPAGE =3D "http://trac.osgeo.org/proj/"
> +SECTION =3D "libs"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27445198ba1500f508fce2b183ce=
0ff"
> +DEPENDS =3D "sqlite3 sqlite3-native"
> +
> +SRC_URI =3D "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
> +SRC_URI[sha256sum] =3D "81b2239b94cad0886222cde4f53cb49d34905aad2a131724=
4a0c30a553db2315"
> +
> +inherit cmake lib_package
> +
> +EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"
> +
> +FILES:${PN} +=3D "${datadir}/proj"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +PACKAGECONFIG ?=3D "curl"
> +PACKAGECONFIG[apps] =3D "-DBUILD_APPS=3DON, -DBUILD_APPS=3DOFF"
> +PACKAGECONFIG[curl] =3D "-DENABLE_CURL=3DON,-DENABLE_CURL=3DOFF,curl"
> +PACKAGECONFIG[tiff] =3D "-DENABLE_TIFF=3DON,-DENABLE_TIFF=3DOFF,tiff"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99686): https://lists.openembedded.org/g/openembedded=
-devel/message/99686
> Mute This Topic: https://lists.openembedded.org/mt/95194626/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [p=
eron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

