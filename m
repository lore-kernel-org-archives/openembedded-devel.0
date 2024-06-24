Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BD0C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 20:52:11 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.153722.1719262321873296657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 13:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WscjKVR3;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-254aec5a084so2798703fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719262321; x=1719867121; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yFKGnX+oQlQnCx0/GmI3SJ+5r0mA/fuHx/Uy07mBL0=;
        b=WscjKVR3QyXdqpYyOLFW0dddR7+s3Qlwwmbr/LeKwvdccDAfFsRQYwxaEbUh6tuimk
         ZWQ70lMmjjVeu/u/yE3YHkCaLdOOVtbXLSkDA0aNaKi7kEnJZFCv3WW2QakuHc2KB0Jg
         CN4Xygv80TQWciDaoN4MLjVdBc9zlrmeAUVsDqGKFVbJqoBi2fxZAUHHTJqvPE+9eZwm
         y6W5SCoF/4/3lw71/JFSfrQ6sjrT/LTZy5FOJYs2bjcJ7Mx+HZiyqoXGeQYS2xpHGa12
         IdY7xEr6S4tDK0hLTl6jHRRn2mhXtpg20XvvXrRcsAWau89VGNCtPB6uTXavks0bZWk+
         9KVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719262321; x=1719867121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yFKGnX+oQlQnCx0/GmI3SJ+5r0mA/fuHx/Uy07mBL0=;
        b=fFkocQ/150UON6iTt4NuFpIo2C/hV+Rx/MfjJbrvDHutjsVb48CKkweDGeyuH8NLXw
         So97QupAlEzuk5Q0CvcFa/dh1Hz7mNmrsOzj85tWvQKf2GMWul+M2r8TyrJ+hcfxDJg/
         QrCThY2++rJgsAv35s5E6P1JeFaQw6rUOcDOh1RF2Yle21bEVCIyl9sArzzGzvW/QMrD
         a+ZNqfND3ZC8puuTHGHed5bdsmghuy+2zR61B/A7ybduOj0g2YxaAzGbF/ySXfkqqXpm
         mmWg4a0aCW+Rs12RUEAjtKYA8Prz9fUD7zpjQ9tkTC2/BCuIiUjL4IR+SB/Ts4n08wtk
         SiHA==
X-Gm-Message-State: AOJu0YyOPg3sd/vvR8d3a4yJ46vjakcTFWT25jpVUsBIcuCtlE+xzoKJ
	yYOrp+T+gDjun0M0YFNloi2uq1SOJJZSRH+O0iNYb8f64B8zyarXV2GcWynKIaBvBnoNXQJ5I9s
	UPQ1J8YUpYVcEhJiWM7WPaGm/6PE=
X-Google-Smtp-Source: AGHT+IEaC21d4EAdxzvrlXR2tJSgMkhhngO/qYQcvq04UF0sZfiTFgDkfqIvyE8utYuFUFZXJQAQh3MmDQxIoGKexyU=
X-Received: by 2002:a05:6870:c696:b0:254:b186:e520 with SMTP id
 586e51a60fabf-25d016b8383mr6870250fac.13.1719262321055; Mon, 24 Jun 2024
 13:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <2662af04-b171-4f5b-9010-2e9b1bad0431@kernel.crashing.org>
 <CAMKF1srMod9wgJMjfoQTWZY4tbfQ9oDoa9aGs=uO7fY7wOV21A@mail.gmail.com>
 <17DBFD48ACB3DC07.28936@lists.openembedded.org> <fbbf98b9-fefb-49fe-8b0c-ba0ef7d6ad49@kernel.crashing.org>
In-Reply-To: <fbbf98b9-fefb-49fe-8b0c-ba0ef7d6ad49@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jun 2024 13:51:34 -0700
Message-ID: <CAMKF1spAiDRjujUONwyEbxqAha1gWe=0-mvbjqA1U05CDYBeOg@mail.gmail.com>
Subject: Re: [oe][master][scarthgap][meta-oe][PATCH] v4l-utils: Install media
 ctrl header and library files
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, neel.gandhi@amd.com, 
	Mark Hatle <mark.hatle@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 20:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111008

thanks, pulled it from your GH PR

On Mon, Jun 24, 2024 at 12:33=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> No idea what is going with my email.  But I pushed to a github repository=
:
>
> https://github.com/mhatle/meta-openembedded.git mgh/master
>
> The specific commit:
>
> https://github.com/mhatle/meta-openembedded/commit/2323c8ec565b895d6e634d=
43061039b4a0d41ff2
>
> Thanks!  Sorry for the extra work.
>
> --Mark
>
> On 6/24/24 11:21 AM, Mark Hatle wrote:
> > What kind of error are you getting?  I just rebased and the system told=
 me there
> > were no differences.  Did it get munged by my email sending?
> >
> > --Mark
> >
> > On 6/24/24 11:02 AM, Khem Raj wrote:
> >> Hi Mark
> >>
> >> This patch does not apply cleanly on master or master-next, please
> >> rebase it on either of these branches and resend
> >>
> >> Thanks
> >> -Khem
> >>
> >> On Mon, Jun 24, 2024 at 8:28=E2=80=AFAM Mark Hatle via lists.openembed=
ded.org
> >> <mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
> >>>
> >>> From: Neel Gandhi <neel.gandhi@amd.com>
> >>>
> >>> Commit 9389d63fdddcab400cb0b243b74d47bf665aba18 removed a previous pa=
tch
> >>> that caused the recipe to install the header and library files. Resto=
re
> >>> this behavior to the new meson based build system.
> >>>
> >>> Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> >>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> >>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> >>> ---
> >>>
> >>> This is a resend, the first copy seems to have not been delivered to =
the list?
> >>>
> >>> We would like to get this applied to both master and scarthgap.  Any =
questions
> >>> let me know.
> >>>
> >>>     ...l-media-ctl-header-and-library-files.patch | 78 ++++++++++++++=
+++++
> >>>     .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
> >>>     2 files changed, 79 insertions(+)
> >>>     create mode 100644
> >>> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-=
media-ctl-header-and-library-files.patch
> >>>
> >>> diff --git
> >>> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Instal=
l-media-ctl-header-and-library-files.patch
> >>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Instal=
l-media-ctl-header-and-library-files.patch
> >>> new file mode 100644
> >>> index 000000000..6c946d8c4
> >>> --- /dev/null
> >>> +++
> >>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Instal=
l-media-ctl-header-and-library-files.patch
> >>> @@ -0,0 +1,78 @@
> >>> +From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:00 20=
01
> >>> +From: Neel Gandhi <neel.gandhi@amd.com>
> >>> +Date: Wed, 5 Jun 2024 13:51:36 +0530
> >>> +Subject: [PATCH] media-ctl: Install media-ctl header and library fil=
es
> >>> +
> >>> +Install mediactl and v4l2subdev header and library
> >>> +files, which may be required by 3rd party applications
> >>> +to populate and control v4l2subdev device node tree
> >>> +
> >>> +Install of these files was removed in upstream commit
> >>> +0911dce53b08b0df3066be2c75f67e8a314d8729.
> >>> +
> >>> +Upstream-Status: Denied
> >>> +
> >>> +v4l-utils maintainers do not promise a stable API for this library, =
and
> >>> +do not currently have the time to do so. So exporting the API in thi=
s
> >>> +way is fine, as long as we understand that it will change and users =
of
> >>> +the API will need to adapt over time.
> >>> +
> >>> +Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> >>> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> >>> +---
> >>> + utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> >>> + 1 file changed, 21 insertions(+), 7 deletions(-)
> >>> +
> >>> +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.bui=
ld
> >>> +index 3a7b0c9a..40669b4c 100644
> >>> +--- a/utils/media-ctl/meson.build
> >>> ++++ b/utils/media-ctl/meson.build
> >>> +@@ -3,14 +3,24 @@ libmediactl_sources =3D files(
> >>> +     'mediactl-priv.h',
> >>> + )
> >>> + ++libmediactl_api =3D files(
> >>> ++    'mediactl.h',
> >>> ++    'v4l2subdev.h',
> >>> ++)
> >>> ++
> >>> ++install_headers(libmediactl_api, subdir: 'mediactl')
> >>> ++
> >>> + libmediactl_deps =3D [
> >>> +     dep_libudev,
> >>> + ]
> >>> + +-libmediactl =3D static_library('mediactl',
> >>> +-                             libmediactl_sources,
> >>> +-                             dependencies : libmediactl_deps,
> >>> +-                             include_directories : v4l2_utils_incdi=
r)
> >>> ++libmediactl =3D library('mediactl',
> >>> ++                      libmediactl_sources,
> >>> ++                      soversion: '0',
> >>> ++                      version: '0.0.0',
> >>> ++                      install : true,
> >>> ++                      dependencies : libmediactl_deps,
> >>> ++                      include_directories : v4l2_utils_incdir)
> >>> + + dep_libmediactl =3D declare_dependency(link_with : libmediactl)
> >>> + +@@ -18,9 +28,13 @@ libv4l2subdev_sources =3D files('libv4l2subdev.=
c')
> >>> + libv4l2subdev_sources +=3D media_bus_format_names_h
> >>> + libv4l2subdev_sources +=3D media_bus_format_codes_h
> >>> + +-libv4l2subdev =3D static_library('v4l2subdev',
> >>> +-                               libv4l2subdev_sources,
> >>> +-                               include_directories : v4l2_utils_inc=
dir)
> >>> ++libv4l2subdev =3D library('v4l2subdev',
> >>> ++                        libv4l2subdev_sources,
> >>> ++                        soversion: '0',
> >>> ++                        version: '0.0.0',
> >>> ++                        install : true,
> >>> ++                        dependencies : dep_libmediactl,
> >>> ++                        include_directories : v4l2_utils_incdir)
> >>> + + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subde=
v)
> >>> + +-- +2.34.1
> >>> +
> >>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> >>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> >>> index 52759ef18..eb38d9713 100644
> >>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> >>> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> >>> @@ -28,6 +28,7 @@ PACKAGECONFIG[v4l2-tracer] =3D ",-Dv4l2-tracer=3Ddi=
sabled,json-c"
> >>>     SRC_URI =3D "\
> >>>         git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=
=3Dstable-1.26 \
> >>>         file://0001-keytable-meson-Restrict-the-installation-of-50-rc=
_ke.patch \
> >>> +    file://0001-media-ctl-Install-media-ctl-header-and-library-files=
.patch \
> >>>     "
> >>>      SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
> >>> --
> >>> 2.39.3 (Apple Git-146)
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#111004): https://lists.openembedded.org/g/openemb=
edded-devel/message/111004
> >>> Mute This Topic: https://lists.openembedded.org/mt/106851971/3616948
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [mark.hatle@kernel.crashing.org]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>

