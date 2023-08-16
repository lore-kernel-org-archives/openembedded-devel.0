Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C433FC04A6A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 15:09:09 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.163120.1692198539691777573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 08:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Q7CA4Xx1;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1c5451a1fbaso637013fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692198539; x=1692803339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcEh2F+B/Ak/oQbEbPt6QjJcTcUhvONsS9UJHdy4cPQ=;
        b=Q7CA4Xx1YWyuIkuLv6ZKdZNtCe1XJULZNIx5yqCrwGbBuaLzlOfNhVID1RjwT+hET8
         drpdm9SxE+xXACffIBqLwCBAuHEvxtSAid71l1k7isEIvp4gqrBzP3amksqDMIHVfxKZ
         t5rsVJbB2hi7ardjCsCfNCz/DyrJYeB+dkj9zgWGitZlLH9cEfrl9pYng12lHpLRa1fi
         zqlj872KBbSJcAybHS5bLZEJsQeFLhaDIq0xZUwl6wMC6QgJn726Nid340BXl+PM6Gcr
         cUrSaYb+gvzeKZdNu1wdYLxL3X9WhgOORBoxxk+lOjzq+7sKHSCJeRk5K2j3gC11aKKo
         IXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692198539; x=1692803339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcEh2F+B/Ak/oQbEbPt6QjJcTcUhvONsS9UJHdy4cPQ=;
        b=enuccLpQXT0rpuApQB3XbZXrR297qChgf7W+VK+p6/J6NRM7x+/jOfkUyZGz+KmDY4
         N6fw+wvnBQRVkW8vMjS1YkKF0jzwwkYwQb73FSbJaggf0BlBk8LeS2X5F08lvIChPO7G
         jhuR/1ltqt2HHdz95wPIyZxKx7ed/D2KDrEjMyffJuhvVgwc+8D8FP4jsmX5IEz2sQrV
         6cayrI/sxOCQxcJRb0E6buNksLiDvGOEYXpwM4F42hH3J5EskGz44GhfR0bc4nGk5Ksv
         49mVPgJTGUBCisobKm37++GMjv5VfZca1D+0UXPWeX7C52ZcWYRiWzUBgBkJem2KnwM6
         56qw==
X-Gm-Message-State: AOJu0YzW5Z3S5F9fmiVK3ofFkZpy3qmhEMq515T94zr7Trq5J46MpT6k
	5Nf+EbAqfIJTItE8F4U4GiHGdTx0ictxbonUJR4=
X-Google-Smtp-Source: AGHT+IGQhzXkAqtgdU1/O+ffIo72SooURKXmSMxKD2PDLxh5oagPQQohxvDTkzFk4nKbU03/rikVj0ZaV5QPzuu1ePM=
X-Received: by 2002:a05:6871:106:b0:1ba:3a7f:50eb with SMTP id
 y6-20020a056871010600b001ba3a7f50ebmr2567167oab.22.1692198538846; Wed, 16 Aug
 2023 08:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230816073725.9331-1-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20230816073725.9331-1-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2023 08:08:32 -0700
Message-ID: <CAMKF1so+=msuRvehh9_SvAnVihPC4bYBOU3bzGYG0LJtdmv6FQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ttf-google-fira: add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 15:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104430

On Wed, Aug 16, 2023 at 12:37=E2=80=AFAM Tymoteusz Burak
<tymoteusz.burak@3mdeb.com> wrote:
>
> ---
>  .../ttf-fonts/ttf-google-fira.bb              | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
> new file mode 100644
> index 000000000000..b330f40387bb
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
> @@ -0,0 +1,54 @@
> +SUMMARY =3D "Google Fira Fonts- TTF Edition"
> +HOMEPAGE =3D "https://fonts.google.com/?query=3Dfira"
> +LICENSE =3D "OFL-1.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://${S}/firamono/OFL.txt;md5=3D0373cf792d4b95c61399b94c02702892 =
\
> +    file://${S}/firacode/OFL.txt;md5=3Dc75ca55aa0a5809a854d87db2a8ebf23 =
\
> +    file://${S}/firasans/OFL.txt;md5=3Dde28deb2f8c1f23fd4d6918113ac3ddd =
\
> +    file://${S}/firasanscondensed/OFL.txt;md5=3Dde28deb2f8c1f23fd4d69181=
13ac3ddd \
> +    file://${S}/firasansextracondensed/OFL.txt;md5=3Dde28deb2f8c1f23fd4d=
6918113ac3ddd \
> +"
> +SRCREV =3D "47a6c224b3e0287b2e48e3ffef8c9ce2ca4931f4"
> +
> +SRC_URI =3D "git://github.com/google/fonts.git;protocol=3Dhttps;branch=
=3Dmain;subpath=3Dofl/firamono \
> +           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firacode \
> +           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasans \
> +           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasanscondensed \
> +           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasansextracondensed"
> +

We need to define SRCREV_FORMAT since it uses multiple uris here it
will be fail to parse otherwise with latest core
check meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
for example.

> +S =3D "${WORKDIR}"
> +
> +do_install:append() {
> +    install -d ${D}${datadir}/fonts/truetype/
> +    find ${S} -path 'fira*/*.tt[cf]' -exec install -m 0644 {} ${D}${data=
dir}/fonts/truetype/{} \;
> +    install -D -m 0644 ${S}/firamono/OFL.txt ${D}${datadir}/licenses/${P=
N}mono/OFL.txt
> +    install -D -m 0644 ${S}/firacode/OFL.txt ${D}${datadir}/licenses/${P=
N}code/OFL.txt
> +    install -D -m 0644 ${S}/firasans/OFL.txt ${D}${datadir}/licenses/${P=
N}sans/OFL.txt
> +    install -D -m 0644 ${S}/firasanscondensed/OFL.txt ${D}${datadir}/lic=
enses/${PN}sanscondensed/OFL.txt
> +    install -D -m 0644 ${S}/firasansextracondensed/OFL.txt ${D}${datadir=
}/licenses/${PN}sansextracondensed/OFL.txt
> +}
> +
> +PACKAGES =3D+ "${PN}-mono ${PN}-code ${PN}-sans ${PN}-sanscondensed ${PN=
}-sansextracondensed"
> +
> +FILES:${PN}-mono +=3D " \
> +                    ${datadir}/fonts/truetype/FiraMono* \
> +                    ${datadir}/licenses/${PN}mono/OFL.txt \
> +                "
> +FILES:${PN}-code +=3D " \
> +                    ${datadir}/fonts/truetype/FiraCode* \
> +                    ${datadir}/licenses/${PN}code/OFL.txt \
> +                "
> +FILES:${PN}-sans +=3D " \
> +                    ${datadir}/fonts/truetype/FiraSans-* \
> +                    ${datadir}/licenses/${PN}sans/OFL.txt \
> +                "
> +FILES:${PN}-sanscondensed +=3D " \
> +                            ${datadir}/fonts/truetype/FiraSansCondensed-=
* \
> +                            ${datadir}/licenses/${PN}sanscondensed/OFL.t=
xt \
> +                        "
> +FILES:${PN}-sansextracondensed +=3D " \
> +                                    ${datadir}/fonts/truetype/FiraSansEx=
traCondensed-* \
> +                                    ${datadir}/licenses/${PN}sansextraco=
ndensed/OFL.txt \
> +                                 "
> +
> +require ttf.inc
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104415): https://lists.openembedded.org/g/openembedde=
d-devel/message/104415
> Mute This Topic: https://lists.openembedded.org/mt/100775201/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

