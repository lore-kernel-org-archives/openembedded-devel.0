Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862FDD6D232
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:38:52 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.79875.1732736322920990752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeCt6TyR;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71d41932d32so34201a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732736322; x=1733341122; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQByErH0Ch9/sFXz6cHq84cER3Rf1mbf7TykQSuOE2Y=;
        b=OeCt6TyRr1Qd1YCeam+DRbTbXEQUKj5ljsEIShLoqcBPUTyyTZNOhAeg70tB/7uHtV
         2TerTHGtBSdhmH4W7XWQVop07G60qdNN7qUBrmCy5zMTApD23FeDJkVWM7edOmkKlibd
         NpsBfUQspPBsm1ovXqk2tEVQ9YwjkVkJMlqRxeWWlXUZmMvs4INZWEGrdL0e+qimomch
         EPydGPi16hmsPh0lNJxw008/JxrsXKKFUHlF6ZQK5K/8D3dNfucJtZT/pWO1HcTOsnlB
         ljMXmn8PjiX3I86cGg/sbtYM+hCHai5jPUJ00xxl1CRHQXPxoWNOBSpRj4ipBsBc2gx0
         S92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732736322; x=1733341122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQByErH0Ch9/sFXz6cHq84cER3Rf1mbf7TykQSuOE2Y=;
        b=d+VWiHA30t4tOzjYeUsfRTHgURREysJo4VRzjY1UKm6sx02R7nODnR+RcDEfG7/SSt
         WhBNc8n3xFS4O+HZmKa1uiWV0VC0YeUYOzIfxPUry3amwQE/KlsLNR0qcwTlMTJ6Jlw5
         qOGhA8VCGU2N1iAKVK3cPnDKiGhVdypmfRuxpSJvx+UfaYBD4tF2EQFxIpaxRWyDNinK
         mMz2NScfQ1sHcxLrg21/ysnQvkhE1tn0+8nKxpTGtb09qRbwjwmHsbXJD0Kr918flexC
         Cj5xozhMrvbWLmtKnaYKwDxc6CgBnuRh+N8RGasMhMYmebwSgftLHtvcwNX813GFy23d
         iufg==
X-Gm-Message-State: AOJu0YylNNyUOL8tlwdujhXZRGzmY88MH+MdDncoT9UxMkt7x1v6kLJ+
	11LACaCaLt+py67jqU9zyyrm5wRVblGT62dDr2f8JVLzaVc3h6tchxQ7dcx4rU/irOjGruoS2Oj
	D9FRZBeIDmBdYI9eh69/5R7adimU=
X-Gm-Gg: ASbGnctu8/LhoQn85KVNYbT5bN7Rs+jfhjIkpZo1Wam0mBPsftm8eT9q4EnHoNiX/3o
	ld+923OZ3JBEXenm4iSgy8v8fUEQ0Eg==
X-Google-Smtp-Source: AGHT+IFW3pKdfwbX1socIVr7gdSSW6N+qXA2YJ6gNceU9xwQ3bk2vAXCpI0jns4WlzvhOYCVqhpS0KplDhGhEiW91Ho=
X-Received: by 2002:a05:6830:6509:b0:71d:5812:1595 with SMTP id
 46e09a7af769-71d65cf7451mr3846879a34.24.1732736322131; Wed, 27 Nov 2024
 11:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20241127190841.137119-1-hiagofranco@gmail.com>
In-Reply-To: <20241127190841.137119-1-hiagofranco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2024 11:38:16 -0800
Message-ID: <CAMKF1srjsW3gH6P7Yy1TRvxO=BPPj4NaRB4sRQZ1suOAi1w1HA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: drop recipe
To: hiagofranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 19:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114095

On Wed, Nov 27, 2024 at 11:09=E2=80=AFAM Hiago De Franco via
lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This recipe has been added to openembedded-core layer, since hwdata is
> now a requirement to build libdisplay-info, used by weston (see commit
> 3e5d5ba74bea "hwdata: add recipe from meta-openembedded" from oe-core).
>
> Therefore, drop this recipe.
>

Thanks, this also needs to be dropped from
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  .../recipes-support/hwdata/hwdata_0.389.bb    | 28 -------------------
>  1 file changed, 28 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.389.bb
>
> diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb b/meta-oe/rec=
ipes-support/hwdata/hwdata_0.389.bb
> deleted file mode 100644
> index fffd491178b1..000000000000
> --- a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -DESCRIPTION =3D "Hardware identification and configuration data"
> -HOMEPAGE =3D "https://github.com/vcrhonek/hwdata"
> -SECTION =3D "System/Base"
> -
> -LICENSE =3D "GPL-2.0-or-later | XFree86-1.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd9445=
a57"
> -
> -SRCREV =3D "5313a12eb992a354c17fc895c1d69c8c42b09a06"
> -SRC_URI =3D "git://github.com/vcrhonek/${BPN}.git;branch=3Dmaster;protoc=
ol=3Dhttps"
> -
> -S =3D "${WORKDIR}/git"
> -
> -inherit allarch
> -
> -do_configure() {
> -    ${S}/configure --datadir=3D${datadir} --libdir=3D${libdir}
> -}
> -
> -do_compile[noexec] =3D "1"
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> -}
> -
> -FILES:${PN} =3D "${libdir}/* \
> -               ${datadir}/* "
> -
> -BBCLASSEXTEND +=3D "native"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114094): https://lists.openembedded.org/g/openembedde=
d-devel/message/114094
> Mute This Topic: https://lists.openembedded.org/mt/109811489/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

