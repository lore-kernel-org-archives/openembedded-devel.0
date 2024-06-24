Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24578C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 16:02:33 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.144995.1719244952108184063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 09:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGb9LWXw;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-24c9f630e51so2298226fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719244951; x=1719849751; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwZNlN1o/vJ7DLaNh1aNJBvnfxhwsXt2fNVsXzuhiV0=;
        b=VGb9LWXwo+MDFMMC4a1mm5WCIv2JWzeLYVLX3xxpcdZ351r+64t2oVHIAYAPm7XyC0
         8WsBLKQIfYilRfvhxS9PFE4iCE+a/2eqdJtEcZcFddKq/M2bZgNSWeiTaGs+FnkX/XJ7
         F852Vsffdg0W2XoAygJqrZZgsJFgTZCBeOdeT9eHv8YWrSTQ0OccYKPzS6+2Wnme/Tj+
         R0ALVyqhfdRFnu68RfKRzbvp1zvfUCuDMRAhUe0L17iyvPYgnWKRt1S1ZA8n0rxG+xiU
         1ZTV4CN2BeyIAMC7VeYIYkdKTgloErxWU5K8w/xLqgkrmom2f82LZXtmteIexJq95aRO
         vtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244951; x=1719849751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwZNlN1o/vJ7DLaNh1aNJBvnfxhwsXt2fNVsXzuhiV0=;
        b=E72+8TzTWe5K7muNQbr5e4qw+580ZzEERZBI3N3J4XeSdQjk5JNfZ9FXzIWidCcs1K
         Vu+f2uBL86liaIDhKlVY1pbaa6cQrhpIpMa58sFKDQ9Svy9BLAjFpYbib1EvxpOiDcqc
         JY//F+s3DnvruVaJTM7nwNoW7TRQRr810vxtJSy9rTrjOzKA6jRVZ93NLh0GK0Isogmb
         nLANcN50cGUjWYEOOoFm30BS6FTHC3rOt05bwHVqHYGab03cv7Wfr/Wp4pTXEIxRrV5/
         FqGkzEt/xgbx0TLVuyvVTjAZcX/opNwksJVV+Ckw3g31lCk7PGv1cLADn6270Qxikscr
         3Aqw==
X-Gm-Message-State: AOJu0YyI0WQyutvg/VtFKaY8ol8pyxXX/74NXIO2j9Dv0XfIrVtIHv1o
	Da8KLIflRZAcLo7CdU/CgOYK6nlndI7TeVTuPSGh50HsIO0RofObRzvpnz3F/a+jTdkyyYYrboe
	G5XL1w4d9bpC2brpFXsdVn+osYiQ=
X-Google-Smtp-Source: AGHT+IEtO748DgfGqwwytSl1P/HoH3/2/VHvch15oyhDXbMC337B0i3AI3V5khaTx8BH3dw/qNCHkxEhAeA7RCTakUw=
X-Received: by 2002:a05:6871:721:b0:259:8b7d:1544 with SMTP id
 586e51a60fabf-25d016c1b49mr5427405fac.15.1719244951262; Mon, 24 Jun 2024
 09:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <2662af04-b171-4f5b-9010-2e9b1bad0431@kernel.crashing.org>
In-Reply-To: <2662af04-b171-4f5b-9010-2e9b1bad0431@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jun 2024 09:02:05 -0700
Message-ID: <CAMKF1srMod9wgJMjfoQTWZY4tbfQ9oDoa9aGs=uO7fY7wOV21A@mail.gmail.com>
Subject: Re: [oe][master][scarthgap][meta-oe][PATCH] v4l-utils: Install media
 ctrl header and library files
To: mark.hatle@kernel.crashing.org
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, neel.gandhi@amd.com, 
	Mark Hatle <mark.hatle@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 16:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111003

Hi Mark

This patch does not apply cleanly on master or master-next, please
rebase it on either of these branches and resend

Thanks
-Khem

On Mon, Jun 24, 2024 at 8:28=E2=80=AFAM Mark Hatle via lists.openembedded.o=
rg
<mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
>
> From: Neel Gandhi <neel.gandhi@amd.com>
>
> Commit 9389d63fdddcab400cb0b243b74d47bf665aba18 removed a previous patch
> that caused the recipe to install the header and library files. Restore
> this behavior to the new meson based build system.
>
> Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>
> This is a resend, the first copy seems to have not been delivered to the =
list?
>
> We would like to get this applied to both master and scarthgap.  Any ques=
tions
> let me know.
>
>   ...l-media-ctl-header-and-library-files.patch | 78 +++++++++++++++++++
>   .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
>   2 files changed, 79 insertions(+)
>   create mode 100644
> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-medi=
a-ctl-header-and-library-files.patch
>
> diff --git
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-me=
dia-ctl-header-and-library-files.patch
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-me=
dia-ctl-header-and-library-files.patch
> new file mode 100644
> index 000000000..6c946d8c4
> --- /dev/null
> +++
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-me=
dia-ctl-header-and-library-files.patch
> @@ -0,0 +1,78 @@
> +From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:00 2001
> +From: Neel Gandhi <neel.gandhi@amd.com>
> +Date: Wed, 5 Jun 2024 13:51:36 +0530
> +Subject: [PATCH] media-ctl: Install media-ctl header and library files
> +
> +Install mediactl and v4l2subdev header and library
> +files, which may be required by 3rd party applications
> +to populate and control v4l2subdev device node tree
> +
> +Install of these files was removed in upstream commit
> +0911dce53b08b0df3066be2c75f67e8a314d8729.
> +
> +Upstream-Status: Denied
> +
> +v4l-utils maintainers do not promise a stable API for this library, and
> +do not currently have the time to do so. So exporting the API in this
> +way is fine, as long as we understand that it will change and users of
> +the API will need to adapt over time.
> +
> +Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> +---
> + utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> + 1 file changed, 21 insertions(+), 7 deletions(-)
> +
> +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
> +index 3a7b0c9a..40669b4c 100644
> +--- a/utils/media-ctl/meson.build
> ++++ b/utils/media-ctl/meson.build
> +@@ -3,14 +3,24 @@ libmediactl_sources =3D files(
> +     'mediactl-priv.h',
> + )
> + ++libmediactl_api =3D files(
> ++    'mediactl.h',
> ++    'v4l2subdev.h',
> ++)
> ++
> ++install_headers(libmediactl_api, subdir: 'mediactl')
> ++
> + libmediactl_deps =3D [
> +     dep_libudev,
> + ]
> + +-libmediactl =3D static_library('mediactl',
> +-                             libmediactl_sources,
> +-                             dependencies : libmediactl_deps,
> +-                             include_directories : v4l2_utils_incdir)
> ++libmediactl =3D library('mediactl',
> ++                      libmediactl_sources,
> ++                      soversion: '0',
> ++                      version: '0.0.0',
> ++                      install : true,
> ++                      dependencies : libmediactl_deps,
> ++                      include_directories : v4l2_utils_incdir)
> + + dep_libmediactl =3D declare_dependency(link_with : libmediactl)
> + +@@ -18,9 +28,13 @@ libv4l2subdev_sources =3D files('libv4l2subdev.c')
> + libv4l2subdev_sources +=3D media_bus_format_names_h
> + libv4l2subdev_sources +=3D media_bus_format_codes_h
> + +-libv4l2subdev =3D static_library('v4l2subdev',
> +-                               libv4l2subdev_sources,
> +-                               include_directories : v4l2_utils_incdir)
> ++libv4l2subdev =3D library('v4l2subdev',
> ++                        libv4l2subdev_sources,
> ++                        soversion: '0',
> ++                        version: '0.0.0',
> ++                        install : true,
> ++                        dependencies : dep_libmediactl,
> ++                        include_directories : v4l2_utils_incdir)
> + + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev)
> + +-- +2.34.1
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> index 52759ef18..eb38d9713 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> @@ -28,6 +28,7 @@ PACKAGECONFIG[v4l2-tracer] =3D ",-Dv4l2-tracer=3Ddisabl=
ed,json-c"
>   SRC_URI =3D "\
>       git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstabl=
e-1.26 \
>       file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.pa=
tch \
> +    file://0001-media-ctl-Install-media-ctl-header-and-library-files.pat=
ch \
>   "
>    SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
> --
> 2.39.3 (Apple Git-146)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111001): https://lists.openembedded.org/g/openembedde=
d-devel/message/111001
> Mute This Topic: https://lists.openembedded.org/mt/106851971/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

