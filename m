Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B98C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:04:34 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.1749.1683047072173980322
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 10:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Fx2gZkB+;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-541f2112f82so1480390eaf.1
        for <Openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683047071; x=1685639071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2wAPf/b5UB1fRZ+R2Yib9a/qGFGpITZe+jDI18okew=;
        b=Fx2gZkB+xKBgp5Mcj+5NiV+LaKBxuJyQQt/EQeyLzNh7OCIkUv4NQMdvSg5EJ0xabX
         hdsYaUvlVNmue2748dJDCUVLkYCcmX0C42+m7pdQ3shopaTGmB2sZbpOfcRacznK60IP
         dzvrjJ/4td4AE/KTvhHZAnaIWCLX2TSqgzQOhzAW391tWq8WlRT3mz9ymnBXsUlR0KFy
         clt5K9ke80c9ZMTFTizd4nLBSqOiGPAOZkp9Mu+tSS4FXoZjsq4VbqM1VMoRM/PWbMNN
         H5O179T6N68Gmn1Vyo2qNJ2tp6HRKamknaU+xQ/DubiiqbpVlygnfXYeBWr2mtGMDL5h
         BPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683047071; x=1685639071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2wAPf/b5UB1fRZ+R2Yib9a/qGFGpITZe+jDI18okew=;
        b=dVlAh4kNAL/WQm1dWXHfffw+Y1/MPIq7pEgovUK7arxS7ovdYUqqmbcJxV8VuCYOda
         GDTY4C6+3Yp5N7KKQvGfs51SBI8vkq/lQdkcd9i9E65muP9/VnwKua+grkZeh8OLR2+U
         VC8bcCbayoTH5rG3lpB3Y4BHevVOb2yQh7U2VApopYkTH0BZmK/Ud4pfpU6/+3nCZEQR
         jJLiiHnUhEubDfZkdu7yVQ6p2BPcszqUf70iYfVU28C1QzYbDPXgNYjMdi0sUzkHYoXi
         iS7mwV5nbgT2zb+JgWUvPN8YzYALEkFvnEsQnuld/nAZtA0OYikiJ0J9l3fm3oef+pgM
         pPbA==
X-Gm-Message-State: AC+VfDx7AteDz6cfkuZX3+khjwbtbyHr86wnNxzRnn/tNekRtdm8pURP
	JLQK4HgwkrGg3/zQc6/UoJlMs40B5lIQGDwkQeM=
X-Google-Smtp-Source: ACHHUZ74NteA+12U4lOFQTbx8TgaHuM8oOGgic75mtYqP8BXBb27TIGPNaCY2KB/DRTKHad0x0pz0dtFj6/DkoQrlzM=
X-Received: by 2002:a4a:2c07:0:b0:54c:a43f:d4ac with SMTP id
 o7-20020a4a2c07000000b0054ca43fd4acmr2377727ooo.4.1683047071253; Tue, 02 May
 2023 10:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230427164723.863197-1-rs@ti.com> <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
 <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com> <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
 <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com> <CAMKF1squ-NOf4+qgDGVV3yPjX95Kp_nCOq0zK5QWGeqxb=h9OQ@mail.gmail.com>
 <20230502165939.GA9226@denix.org>
In-Reply-To: <20230502165939.GA9226@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 10:04:05 -0700
Message-ID: <CAMKF1sqRpjDKYYrZcu4hkT7otDAVj0h8Q0QeYL+GiUe-LAhoxQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCHv2] glfw: add packageconfig and
 wayland dependencies
To: Denys Dmytriyenko <denis@denix.org>
Cc: Randolph Sapp <rs@ti.com>, Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>, 
	afd@ti.com, detheridge@ti.com, reatmon@ti.com, 
	Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 17:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102273

On Tue, May 2, 2023 at 10:00=E2=80=AFAM Denys Dmytriyenko <denis@denix.org>=
 wrote:
>
> On Tue, May 02, 2023 at 09:08:07AM -0700, Khem Raj wrote:
> > On Tue, May 2, 2023 at 9:06=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
> > >
> > > On 5/2/23 10:56, Martin Jansa wrote:
> > > > The version which was merged with:
> > > >
> > > > PACKAGECONFIG ??=3D "x11"
> > > >
> > > > Should still respect x11 in DISTRO_FEATURES, now this causes:
> > > >
> > > > ERROR: Nothing PROVIDES 'libxi' (but
> > > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > > otherwise requires it)
> > > > libxi was skipped: missing required distro feature 'x11' (not in
> > > > DISTRO_FEATURES)
> > > > ERROR: Nothing PROVIDES 'libxinerama' (but
> > > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > > otherwise requires it)
> > > > libxinerama was skipped: missing required distro feature 'x11' (not=
 in
> > > > DISTRO_FEATURES)
> > > > ERROR: Nothing PROVIDES 'libxrandr' (but
> > > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > > otherwise requires it)
> > > > libxrandr was skipped: missing required distro feature 'x11' (not i=
n
> > > > DISTRO_FEATURES)
> > > > ERROR: Nothing PROVIDES 'libglu' (but
> > > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > > otherwise requires it)
> > > > libglu was skipped: missing required distro feature 'x11' (not in
> > > > DISTRO_FEATURES)
> > > > ERROR: Nothing PROVIDES 'libxcursor' (but
> > > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > > otherwise requires it)
> > > > libxcursor was skipped: missing required distro feature 'x11' (not =
in
> > > > DISTRO_FEATURES)
> > > >
> > > > when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.
> > > >
> > >
> > > Yeah, that's expected behavior at this point. You need to manually
> > > override the PACKAGECONFIG for wayland in this patch. Just slightly
> > > better than no wayland at all.
> > >
> > > The only way we can get around it is if this layer or one of it's
> > > dependencies decides to adopt extra-cmake-modules. They the
> > > packageconfig can automatically configure itself. Discussion on who's
> > > job it is to carry this package has yet to conclude.
> > >
> >
> > May be bring it to meta-oe at this point.
>
> I wonder if it would be better/cleaner to extract a single CMake module t=
his
> glfw package needs to configure wayland support and carry it locally, ins=
tead
> of bringing in the entire KDE-specific set of such CMake modules and be o=
n the
> hook for updating it forever?
> https://api.kde.org/frameworks/extra-cmake-modules/html/index.html
> https://invent.kde.org/frameworks/extra-cmake-modules
>

if it does not get updated often then it should be fine too. Its
maintenance either way

>
> > > > REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and
> > > > ANY_OF_DISTRO_FEATURES by "wayland", but the default PACKAGECONFIG
> > > > doesn't match with that.
> > > >
> > > > On Fri, Apr 28, 2023 at 6:32=E2=80=AFPM Randolph Sapp via lists.ope=
nembedded.org
> > > > <http://lists.openembedded.org> <rs=3Dti.com@lists.openembedded.org
> > > > <mailto:ti.com@lists.openembedded.org>> wrote:
> > > >
> > > >     On 4/28/23 06:16, akuster808 wrote:
> > > >      > Doesn't this need to land it Master first? Kirkstone is in t=
he
> > > >     subject
> > > >      >
> > > >      > - armin
> > > >      >
> > > >
> > > >     Perhaps, but I've only had a chance to test it against kirkston=
e so I
> > > >     flagged it as such. At this point I'm still vetting solutions t=
o this
> > > >     dependency chain though. Looking for something this layer would
> > > >     actually
> > > >     like to carry.
> > > >
> > > >      > On 4/27/23 12:47 PM, rs@ti.com <mailto:rs@ti.com> wrote:
> > > >      >> From: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> > > >      >>
> > > >      >> GLFW has the ability to use a wayland backend. This patch a=
dds a
> > > >     config
> > > >      >> for it, but does not enable it by default because it has a
> > > >     dependency on
> > > >      >> extra-cmake-modules which is provided (most commonly) by
> > > >     meta-qt5-extra.
> > > >      >>
> > > >      >> Signed-off-by: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> > > >      >> ---
> > > >      >>   meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
> |
> > > >     14 ++++++++++++--
> > > >      >>   1 file changed, 12 insertions(+), 2 deletions(-)
> > > >      >>
> > > >      >> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> > > >     <http://glfw_3.3.bb>
> > > >      >> b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
>
> > > >      >> index b31bba6b6b..5b0d61241e 100644
> > > >      >> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.=
3.bb>
> > > >      >> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.=
3.bb>
> > > >      >> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=
=3DON
> > > >      >> -DGLFW_BUILD_DOCS=3DOFF"
> > > >      >>   CFLAGS +=3D "-fPIC"
> > > >      >> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libx=
i
> > > >     libxcursor"
> > > >      >> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> > > >      >> +DEPENDS =3D "libpng libglu zlib"
> > > >      >> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> > > >      >> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> > > >      >> +
> > > >      >> +# upstream considers x11 and wayland backends mutually
> > > >     exclusive and
> > > >      >> will
> > > >      >> +# prioritize wayland if it is enabled, but wayland has
> > > >     dependencies
> > > >      >> that cannot
> > > >      >> +# be satisfied by this layer so it is disabled by default
> > > >      >> +
> > > >      >> +PACKAGECONFIG ??=3D "x11"
> > > >      >> +
> > > >      >> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayla=
nd
> > > >      >> wayland-native wayland-protocols extra-cmake-modules libxkb=
common"
> > > >      >> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libx=
cursor"
> > > >      >>   COMPATIBLE_HOST:libc-musl =3D "null"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102272): https://lists.openembedded.org/g/openembedde=
d-devel/message/102272
> Mute This Topic: https://lists.openembedded.org/mt/98540896/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

