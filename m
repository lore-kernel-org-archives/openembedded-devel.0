Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2136C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:54:39 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.48974.1745848473610857558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nIEjguSx;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3fcfc85f1f5so1198563b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745848473; x=1746453273; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K792/z5FTrwUQfJT49sRCxnNufXe9RxpO9TlbrTATs=;
        b=nIEjguSxdV02g0suVJrkOWfHaMogovBvgr8tYHpxIQc3XOsY7S6n9VvwjcVxH4eK9m
         PNH9cKvehYmgsi7A6iFk4qYBvMChLqhzVMh8+3EDtj5DVcUrNgy7C0OoSccui2zhPLMV
         u52xVkL4X6ax6S6jUsY5LYUyglQ/Lbv/EXijd8tI22Wyl9X/oPyhEChSQ26xix3ATuty
         d44cllZFyHV+HuZJ5ApR6IE9pB+pJhVr/qgdpBr/KjCWVV53ID1dXvlSprieUQ7kFIne
         2IID24iXbWh5VwMpTt6s8gnmdsS0jWvf3iLM7rXRh4u+yfHDOEqOF2h+8YrQ7xeRjUsv
         xPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848473; x=1746453273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K792/z5FTrwUQfJT49sRCxnNufXe9RxpO9TlbrTATs=;
        b=VzqOCnhUarhY3ANRN2ZM2Hc0ECd4sUhMdSk/4FbOP7+KoTtupbpDds3wby9mdXbXQw
         kZnEakhPFzTMfzpC1JlkXPNbNnnRG1LrJfTyiCkrTLIfFO19MSSlPJokUWU1dkp5u+HJ
         dBiFio2umMuytCfFTp9WITPdkWWkm2y5IwXowBx6pa7TTKwdsVaXLJns+vOQqT/vGXiV
         DmJhLC04AaqJ+YLL0hjbQgkZZfggN2jxJ/hDpBUANfJf62KgHie1PgFI9jnt1eJypjC0
         T+foJIw1HyvsHCkb3Qq3dTbPGaYAOFKzXfZdK6GuklIJMQ1dazmknZRQ45HqCSXPJtzo
         8yZw==
X-Forwarded-Encrypted: i=1; AJvYcCUywY7kg4NGcCccd2cwK/BcbaAn9FT+3tsd4FL5nvLgbgF3fH5xxy+VQt6/W8U2ab/5q7za/aVFeL7D8VfpdwrfDYQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7emnAIY5uK8zVByT2ZwSoZqhyOYj+VVjVugCwKGoa3QtKLnHx
	Ih/9TI2F31BmkLtGBSFoG0kYdwNMbWQ3Brt6Lpyf1Q5V7CQWQm3C7S96y3/CyGPWKiJzNFgpxhe
	RyPwaswNuA5PKZ0huRTmKJM3JIfSEgdPMSW8=
X-Gm-Gg: ASbGnctojah6Yxb5s+e10NX7r+FKo0BktJdm1E9Che/l6bFrJEFt6hFg9TQt5d8KGlO
	70iW+7UvHcHWdLZwuJ9xNxe4YlKlzqbDew8+IUzHnuzgG7mpFnpMqWS3mXxg63z3M48umCmn6Xk
	eZdgsCywjO7KmjLEkSIh35
X-Google-Smtp-Source: AGHT+IGpxJc4SlkkvddM9QKDAbvJWTsLCnnvT3jtTK0zyv+DGc7GmNnbWg0sIJu6YC7XzgXeWDgiiH61ktdqube3+Vo=
X-Received: by 2002:a05:6808:6a8c:b0:401:cd6d:25e2 with SMTP id
 5614622812f47-401fd6e2cd9mr7012273b6e.4.1745848472665; Mon, 28 Apr 2025
 06:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250427152746.8099-1-wen.yang@linux.dev> <570e3112-1eb8-443e-9a96-97dab147c8dd@gmail.com>
In-Reply-To: <570e3112-1eb8-443e-9a96-97dab147c8dd@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 06:54:06 -0700
X-Gm-Features: ATxdqUFAJ-SsuwftLNsQ-Lf7ehIoZ19Bn9bhDgOTUMqDd2PSPBrcG-2qSI7R_sY
Message-ID: <CAMKF1spBjiBt_KjFM+XqDiP5LFrHwTu4706OBiV7WsBMZeNz5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] testdisk: add recipe
To: skandigraun@gmail.com
Cc: wen.yang@linux.dev, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 13:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117196

On Mon, Apr 28, 2025 at 12:56=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> It looks like this recipe was created with/for an old version of Yocto.
> Could you please prepare it for master branch?
> I have added some comments inline.
>
> On 4/27/25 17:27, Wen Yang via lists.openembedded.org wrote:
> > testdisk is a free data recovery software primarily designed to help
> > recover lost partitions and/or make non-booting disks bootable again
> > when these symptoms are caused by faulty software.
> >
> > Signed-off-by: Wen Yang <wen.yang@linux.dev>
> > ---
> >  .../recipes-support/testdisk/testdisk_7.2.bb  | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/testdisk/testdisk_7.2.bb
> >
> > diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe=
/recipes-support/testdisk/testdisk_7.2.bb
> > new file mode 100644
> > index 0000000000..64e3d612c1
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
> > @@ -0,0 +1,19 @@
> > +DESCRIPTION =3D "TestDisk is a free data recovery software primarily d=
esigned to help recover lost partitions and/or make non-booting disks boota=
ble again when these symptoms are caused by faulty software, certain types =
of viruses or human error (such as accidentally deleting your Partition Tab=
le)."
> > +LICENSE =3D "GPLv2"
> This LICENSE value is deprecated. Please use spdx identifiers if
> possible/applicable, like GPL-2.0-only or GPL-2.0-or-later
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> > +PR =3D "r1"
> Is PR needed in this recipe?
> > +
> > +DEPENDS =3D "jpeg ncurses e2fsprogs"
> > +
> > +SRC_URI =3D "https://github.com/cgsecurity/testdisk/archive/refs/tags/=
v7.2.tar.gz"
> Archived tags in Github are unfortunately not immutable, so their use is
> discouraged (and it also throws a fatal QA check). It is preferred to
> use the direct commit ID.

it should be flagged by build too
ERROR: testdisk-7.2-r1 do_recipe_qa: QA Issue: testdisk: SRC_URI uses
unstable GitHub/GitLab archives, convert recipe to use git protocol
[src-uri-bad]


> > +S =3D "${WORKDIR}/testdisk-7.2"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PACKAGES =3D+ "photorec"
> It is recommended to prepend the extra packages' names with the main
> recipe name, like ${PN}-photorec
> > +
> > +DESCRIPTION_photorec =3D "Photorec is file data recovery software desi=
gned to recover lost files including video, documents and archives from Har=
d Disks and CDRom and lost pictures (Photo Recovery) from digital camera me=
mory."
> > +FILES_photorec =3D "${sbindir}/photorec"
> The underscore override syntax has changed to ":".
> > +
> > +SRC_URI[md5sum] =3D "c47d69e2c950b6b2f0dadb2a2921d6c6"
> > +SRC_URI[sha256sum] =3D "f3fe7ec02cafcbe792a4c783976de3a6312963b0ce8a61=
3d38adbcd8bdca0517"
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117189): https://lists.openembedded.org/g/openembedde=
d-devel/message/117189
> Mute This Topic: https://lists.openembedded.org/mt/112489401/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

