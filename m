Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A651C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:09:13 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.1112.1721070551900081687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lzqXZP0E;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5cce7626c87so1307859eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721070551; x=1721675351; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QdVY+V3dJHoALMt0tP/VbDQLxOWyyTWRBOU6dldar8=;
        b=lzqXZP0EnAVeyFMWTOx8j3OodLwAXp/pOjTS46p+tv612jrb8Xp9h+ze5yr/faCAUN
         R7lL2kiLRKJop9oRW7rW7OW0yieN1pYFvae+MfAU+WNXy9xfS79Z3JGy10KOTEAbC+o0
         eoxA6q/QwulRoqz2B6Wf3PMKT8YqDUKUmBQIl2HcwhCtmpD8D+2Sm52MvR7rLwSv96mm
         gA2Us8fqEyyXGe+vUekLNacNGiM2nVWPfnoo80Ivg2SANA98Xq5F7F+uCSzpvALuQh/r
         8kJjBtZNL1eKudR8ZGJjHPVpJELk0NbmmxBsmuqbU/7mlmcTpWsOSNkmDIp/0+7sQtk6
         nNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721070551; x=1721675351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QdVY+V3dJHoALMt0tP/VbDQLxOWyyTWRBOU6dldar8=;
        b=wZYRL+qtlSCbZx1DmQ3SbqO6baZTE4HlhYIWLOUytJOceSooZgnXGyE66t6D6tPjMl
         +8RZLC2xS54DPXBHtOoLEqUcYQNGDwjWa1VNZIkbgBUu6obseBH3NF1HDQ4D33AVq1j4
         Y1nEYxyEQr6DyZ4/VNvtukxpxACI3t7r6zKo07szP78RhZyjspx3m5ipjraefblUguaC
         LkHS0rNfTsENu+FBU2y2Ze0GEH65WoQLbshU5zAGU9NMofeMQ3eYZCZSqrsbhfP+XBnC
         Z09sqvDZC8tlghjbtY2Ui4NmGy03mW8w+3tlywXenQOnTd/qHXlp2Vx/P7G/EOha0Jk9
         SgSA==
X-Gm-Message-State: AOJu0YzJjTa5u8TE+ybk6PGaHkwnzcK+r+zBOPOJ7E9tQaJJ3ZhXLHQL
	4Ib65hZqvHPe4Bhw+g4kl1cuuWizPpyBcMHOtrmF6KZ5+njL/6vMStIO1WA0IGHZOzxt73e2vdX
	pWLrIWf9Y/HmrOGIORLhJhz6tJnU=
X-Google-Smtp-Source: AGHT+IGplNohgMcbrH9moo0USHWBF8FSVD9o660LpO5a9akRO/ixWq6XGMnW4rEJ9RbfSIzZ3gOjr0USNoXYfToL4zs=
X-Received: by 2002:a05:6871:294:b0:254:94a4:35e2 with SMTP id
 586e51a60fabf-25eaec980d0mr13895362fac.59.1721070551049; Mon, 15 Jul 2024
 12:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <17DBFA54632A2792.21660@lists.openembedded.org> <183db266-05c8-48f5-840d-93d93925bcf8@kernel.crashing.org>
In-Reply-To: <183db266-05c8-48f5-840d-93d93925bcf8@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jul 2024 12:08:44 -0700
Message-ID: <CAMKF1srQ5ZeQfwbcc-Ht=jVYQ9j3P1Y3dYqdis0hMYg57vWaTg@mail.gmail.com>
Subject: Re: [oe][master][scarthgap][meta-oe][PATCH] v4l-utils: Install media
 ctrl header and library files
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, neel.gandhi@amd.com, 
	Mark Hatle <mark.hatle@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 19:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111363

I am ok with it. Adding Armin as well.

On Mon, Jul 15, 2024 at 11:59=E2=80=AFAM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> This got merged to master and appears to be working.  Can I get this back=
ported
> to Scarthgap?
>
> Commit (in meta-openembedded master)
>
> commit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab
> Author: Neel Gandhi <neel.gandhi@amd.com>
> Date:   Fri Jun 21 16:53:45 2024 +0530
>
>      v4l-utils: Install media ctrl header and library files
>
>
> I verified this commit can be applied directly to scarthgap.
>
> --Mark
>
> On 6/24/24 10:28 AM, Mark Hatle wrote:
> > From: Neel Gandhi <neel.gandhi@amd.com>
> >
> > Commit 9389d63fdddcab400cb0b243b74d47bf665aba18 removed a previous patc=
h
> > that caused the recipe to install the header and library files. Restore
> > this behavior to the new meson based build system.
> >
> > Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> > Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > ---
> >
> > This is a resend, the first copy seems to have not been delivered to th=
e list?
> >
> > We would like to get this applied to both master and scarthgap.  Any qu=
estions
> > let me know.
> >
> >    ...l-media-ctl-header-and-library-files.patch | 78 +++++++++++++++++=
++
> >    .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
> >    2 files changed, 79 insertions(+)
> >    create mode 100644
> > meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-me=
dia-ctl-header-and-library-files.patch
> >
> > diff --git
> > a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-=
media-ctl-header-and-library-files.patch
> > b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-=
media-ctl-header-and-library-files.patch
> > new file mode 100644
> > index 000000000..6c946d8c4
> > --- /dev/null
> > +++
> > b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-=
media-ctl-header-and-library-files.patch
> > @@ -0,0 +1,78 @@
> > +From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:00 2001
> > +From: Neel Gandhi <neel.gandhi@amd.com>
> > +Date: Wed, 5 Jun 2024 13:51:36 +0530
> > +Subject: [PATCH] media-ctl: Install media-ctl header and library files
> > +
> > +Install mediactl and v4l2subdev header and library
> > +files, which may be required by 3rd party applications
> > +to populate and control v4l2subdev device node tree
> > +
> > +Install of these files was removed in upstream commit
> > +0911dce53b08b0df3066be2c75f67e8a314d8729.
> > +
> > +Upstream-Status: Denied
> > +
> > +v4l-utils maintainers do not promise a stable API for this library, an=
d
> > +do not currently have the time to do so. So exporting the API in this
> > +way is fine, as long as we understand that it will change and users of
> > +the API will need to adapt over time.
> > +
> > +Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> > +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > +---
> > + utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> > + 1 file changed, 21 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> > +index 3a7b0c9a..40669b4c 100644
> > +--- a/utils/media-ctl/meson.build
> > ++++ b/utils/media-ctl/meson.build
> > +@@ -3,14 +3,24 @@ libmediactl_sources =3D files(
> > +     'mediactl-priv.h',
> > + )
> > + ++libmediactl_api =3D files(
> > ++    'mediactl.h',
> > ++    'v4l2subdev.h',
> > ++)
> > ++
> > ++install_headers(libmediactl_api, subdir: 'mediactl')
> > ++
> > + libmediactl_deps =3D [
> > +     dep_libudev,
> > + ]
> > + +-libmediactl =3D static_library('mediactl',
> > +-                             libmediactl_sources,
> > +-                             dependencies : libmediactl_deps,
> > +-                             include_directories : v4l2_utils_incdir)
> > ++libmediactl =3D library('mediactl',
> > ++                      libmediactl_sources,
> > ++                      soversion: '0',
> > ++                      version: '0.0.0',
> > ++                      install : true,
> > ++                      dependencies : libmediactl_deps,
> > ++                      include_directories : v4l2_utils_incdir)
> > + + dep_libmediactl =3D declare_dependency(link_with : libmediactl)
> > + +@@ -18,9 +28,13 @@ libv4l2subdev_sources =3D files('libv4l2subdev.c'=
)
> > + libv4l2subdev_sources +=3D media_bus_format_names_h
> > + libv4l2subdev_sources +=3D media_bus_format_codes_h
> > + +-libv4l2subdev =3D static_library('v4l2subdev',
> > +-                               libv4l2subdev_sources,
> > +-                               include_directories : v4l2_utils_incdi=
r)
> > ++libv4l2subdev =3D library('v4l2subdev',
> > ++                        libv4l2subdev_sources,
> > ++                        soversion: '0',
> > ++                        version: '0.0.0',
> > ++                        install : true,
> > ++                        dependencies : dep_libmediactl,
> > ++                        include_directories : v4l2_utils_incdir)
> > + + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev)
> > + +-- +2.34.1
> > +
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > index 52759ef18..eb38d9713 100644
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > @@ -28,6 +28,7 @@ PACKAGECONFIG[v4l2-tracer] =3D ",-Dv4l2-tracer=3Ddisa=
bled,json-c"
> >    SRC_URI =3D "\
> >        git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dst=
able-1.26 \
> >        file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke=
.patch \
> > +    file://0001-media-ctl-Install-media-ctl-header-and-library-files.p=
atch \
> >    "
> >     SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111001): https://lists.openembedded.org/g/openembed=
ded-devel/message/111001
> > Mute This Topic: https://lists.openembedded.org/mt/106851971/3616948
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mark.hatle@kernel.crashing.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

