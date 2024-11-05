Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37BBD3E76C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 21:06:38 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.31127.1730840795478871259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P0c8muZP;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ee35ef95daso135262eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840795; x=1731445595; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV+qat7cP9cr6rvYU0qQgliUMVhVHCmzUuv3YzzcOWM=;
        b=P0c8muZPoBfmQHhmT9GRsA/rjesHs3g3SfZU9lg+RXtXkqFgCizcnsw+ypAfN9OQ06
         OGZrErZ7qM3feCLATyV7jaQBMy7Po38AxBJ33vZnJM9WEqpx5kQEWaRblddJ3mDol5J9
         T++3vvGYJyww/Qklbsknl+KNHnoBbFadF2dmG0j+nIv3jFk6URRX9v16UMXU4ZOmKbdT
         akYflF8eT+SHCNLWWzxQ48oZUdH3ad8HUKz7JWvTfVIGMmTNbFtv9HQ+QP/+UWBz39K7
         WJTG7qOwlYBOZt9MiG6dyEqgfcDdlbkYFMb36qcgRxi9qRct6wcM8fsMXrwblRtHqakY
         LSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840795; x=1731445595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV+qat7cP9cr6rvYU0qQgliUMVhVHCmzUuv3YzzcOWM=;
        b=TuYFEdlS1U6IBMQWccRQb5u8pNIfZCAet+S7vvhTi8/ZDMZ65b5ld70jb+rhj3agbJ
         aCdvSVqxH29ypEi0FdN31pIDn0lQoNXDyYxVZlFz/OTlBkUHpv6lHgImXBpT+BZdLpZf
         BBzfZfCD7yLZpidttVL9fH/BtUSx4EXktMTSC7PlEzcizH3fppDqDkkmrGLXg7OztxLB
         dSwLrzo8RstZdML2EQ1HUMkVJRQ4ahgC1I5x4YOqJW7oXwp/xKUavXBfnrYWXqfDI1TU
         u8F/fHx6lTRMcZgcF5DuGNVuv66H7ktbMzhH0Qx7nc8g3CIiTjwzDAcpKqeGkx7od5ic
         ++xA==
X-Gm-Message-State: AOJu0YxVqg5O9ViQlBHuKg6qwhgfow8ocPa8/A2GVotFHNRbfpjeevPp
	ZOoVNK0J2YPvIb9tJAaK3Z64JmPIyXOVCBsdE9AVvRIFV2b44vNHleg3d/IMWDO5L93MwngKf+W
	DvB+53TmTNmVK7P6K2y9TIVIEMXrF9sT3
X-Google-Smtp-Source: AGHT+IEIFwDx7/s+PrrDqUyMxtE70g21/fpK8YunAFKSJbQ0EYPmq7CpYznbkGrF9Wr80kuXRUOZLBzGINyzZbN9ycQ=
X-Received: by 2002:a05:6820:161e:b0:5e1:ea03:9286 with SMTP id
 006d021491bc7-5ec6db4a30dmr12254714eaf.6.1730840794677; Tue, 05 Nov 2024
 13:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20241105071627.2768743-1-thomas.perrot@bootlin.com> <CAMKF1srLh=vyw89hvpJhQg_XxBHXb0byiTtJuZFtch-R_Qg0eQ@mail.gmail.com>
In-Reply-To: <CAMKF1srLh=vyw89hvpJhQg_XxBHXb0byiTtJuZFtch-R_Qg0eQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 13:06:08 -0800
Message-ID: <CAMKF1sosB+RLm_RoBRUa+j+q=T1Sqn61RRcVCb0NP_03EOsb3Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] taisei: add a recipe for version 1.4.2
To: thomas.perrot@bootlin.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 21:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113615

it seems to fail YP layer compatibility check as well

https://valkyrie.yoctoproject.org/#/builders/81/builds/134/steps/11/logs/er=
rors

opusfile in from meta-multimedia and meta-oe does not depend upon
meta-multimedia
so you can make it a packageconfig and disable it by default, or
perhaps disable it completely if
not needed. Other option would be to move it under dynamic layers.

On Tue, Nov 5, 2024 at 8:19=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Nov 4, 2024 at 11:16=E2=80=AFPM Thomas Perrot via
> lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >
> > Taisei Project is an open source danmaku.
> >
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> >  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
> >  .../recipes-graphics/taisei/taisei_1.4.2.bb   | 52 +++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb=
 b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index 178256c83f63..4635fe3d44d0 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -521,6 +521,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D "\
> >      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
> >      stalonetray \
> >      surf \
> > +    taisei \
> >      terminus-font-consolefonts \
> >      terminus-font-pcf \
> >      tesseract \
> > diff --git a/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/=
recipes-graphics/taisei/taisei_1.4.2.bb
> > new file mode 100644
> > index 000000000000..2d2ab32bace7
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
> > @@ -0,0 +1,52 @@
> > +SUMMARY =3D "Taisei Project is an open source danmaku"
> > +DESCRIPTION =3D "Taisei Project is an open source fan-game set in the =
world of \
> > +               T=C5=8Dh=C5=8D Project. It is a top-down vertical-scrol=
ling curtain fire \
> > +               shooting game (STG), also known as a 'bullet hell' or '=
danmaku'. \
> > +               STGs are fast-paced games focused around pattern recogn=
ition and \
> > +               mastery through practice."
> > +HOMEPAGE =3D "https://taisei-project.org"
> > +BUGTRACKER =3D "https://github.com/taisei-project/taisei/issues"
> > +LICENSE =3D "CC-BY-4.0 & CC0-1.0 & MIT"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1a11ffd7e1bdd1d3156cecec60a=
2846f"
> > +
> > +DEPENDS =3D "\
> > +    cglm \
> > +    freetype \
> > +    libsdl2 \
> > +    libwebp \
> > +    opusfile \
> > +    zstd \
> > +"
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    cglm (>=3D 0.7.8) \
> > +    freetype \
> > +    libsdl2 (>=3D 2.0.16) \
> > +    libpng (>=3D 1.5.0) \
> > +    libwebp (>=3D 0.5) \
> > +    libzstd (>=3D 1.4.0) \
> > +    opengl (>=3D 3.3) \
> > +    opusfile \
> > +    zlib \
> > +"
> > +
> > +SRC_URI =3D "gitsm://github.com/taisei-project/taisei.git;branch=3Dv1.=
4.x;protocol=3Dhttps"
> > +SRCREV =3D "c098579d4fa0f004ccc204c5bc46eac3717cba28"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit features_check meson mime mime-xdg pkgconfig python3native
> > +
> > +REQUIRED_DISTRO_FEATURES =3D "opengl"
> > +
> > +PACKAGECONFIG ??=3D ""
> > +
> > +PACKAGECONFIG[a_null] =3D "-Da_null=3Dtrue,-Da_null=3Dfalse"
> > +PACKAGECONFIG[developer] =3D "-Ddeveloper=3Dtrue,-Ddeveloper=3Dfalse"
> > +PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,python3-docutils=
-native"
> > +
> > +
> > +
> > +FILES:${PN} +=3D "${prefix}/share"
>
> there is a dedicated variable ${datadir} you can use here
>
> > +
> > +INSANE_SKIP:${PN} =3D "already-stripped"
>
> can we patch the makefiles to not strip the binaries and leave it to OE t=
asks ?
> This can improve debugging experience.
>
> > --
> > 2.47.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#113413): https://lists.openembedded.org/g/openembed=
ded-devel/message/113413
> > Mute This Topic: https://lists.openembedded.org/mt/109402043/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

