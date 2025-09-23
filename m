Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA26CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:52:32 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.4081.1758649943987996372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JIOx6s9b;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931c858dbbso4088255276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649943; x=1759254743; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQiSJ41tnMLBfa63BH5QE98g4L/fgtQx/5NpUHqmi3E=;
        b=JIOx6s9bsxE7pWXcNHqllNOE6N81AoarlCkQM3ToR+dwpW+mUyLklt7QHkSgl9iII9
         cIq0mhZ8gDycFo3cugQG/sKa/tNcMqQiDLyFT87r8siO5cnPND03NdW9fKFy+Fzao5MC
         DhI7IQAu8LkbP+6hHIaJtAGP+bla7U2n8YOXb/xEIHTMmUaX6JfJwoqn5SV4AvZEHWTv
         bYjKmTvl7XGrN5R2ORYEdLdBdamBhvjC4tR5/VB+5oCEq9nTsZjY5wpneDBSwolMlXfV
         CwzB3v1QY99EIAXgEj7DZqOpMYtmnW1qtaoNNP5ESOwJXC3OrtFLtzPPov3tSKVQAlgN
         q+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649943; x=1759254743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQiSJ41tnMLBfa63BH5QE98g4L/fgtQx/5NpUHqmi3E=;
        b=R6/HxVTuTYf+VJrJEtkvKqZIG4HV7VuYFARAvZVRvKMyHDOiMj6phj+XtuQPC+lUNm
         yG3xYUWtoXtaktDZLOIufXFxwseuHov/IC6KMfIuF7jFUGuq76Sqf+pCffq83kzmns7P
         pldxL6ri4c6KQ9WE8QCuAkbbRJbGfOPDAY5Yl4idWAPruXB15Hz+p4KldEj7J8f/YLxR
         AoxyzfA8QZxuhUIal+cGgzeAQ9vVOo54nxmCt1G4L0QeXOfFSwoFmGcTCtIL/kXHSjxr
         ngv0ngYi6W7WjLKgxTtUZekvaY7s7nb+1lREye0wY4JAJbqzDc0c5CeemYNjOoCCxHU0
         o2Vg==
X-Gm-Message-State: AOJu0Ywxc0nHRbXX2dAVWF4NHoxX2PIuAmMt/qO3WLPO5aYnTtVRwuIl
	wvc25fNClXcvvQpNutGEXpe440jWwbN4kJ6QXI3vbh1H5yaqIlQklNa0JZgxhANGLYmd4uYOKb3
	/mrbpVzyJf6LLCK6lHMdl4Qin5ROWxeM=
X-Gm-Gg: ASbGncti9m4qvzgVZsBMfh+YLX6B4vxmIO1FBPGeAgUi2U5iiQHufLqPhtAyOtE6tai
	rKjLKuCDPU/oPYyCxD3uvnG2eltvowWM2XbbD6eFALnuz3KT+aMZ9S1Pe3gfcyiPdafRz8Wu9wm
	jKCYMsQ60ESWXHoeVsFl4K/q/kOqnXBeTy4gVSoWUd6OB7C090CrkrVuM0JUTucuby1iUWLRoU5
	b4Ee0PzOybwlwU1w4mgel1mNQqruxpo82p3TEw67Fpbm9xDxpgm+E0P/fCpfL01ZNFyxg3AWVCp
	7NTBt3fNcDnWgJHWSDOFLsFoW0OUqa/eHwXm4FYNW2Bt5LFi5F71npOyVQ==
X-Google-Smtp-Source: AGHT+IG3Iq/nRpYMpYBo2k+5cLnASjbecZqTK+1mgnbFrf8JPHqmFaa+8pcTBS3FXpyQ9M4H6a8hsrLYUhGvVYThABE=
X-Received: by 2002:a05:6902:4412:b0:ead:c01d:9c3 with SMTP id
 3f1490d57ef6-eb32fbab5c9mr2400720276.31.1758649942790; Tue, 23 Sep 2025
 10:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250923110636.3413021-1-skandigraun@gmail.com>
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Sep 2025 10:51:56 -0700
X-Gm-Features: AS18NWBoeBVmrbjA9DOV-qb33pPUDKU33lF0rEMGKePhoejkPpab7uIrpNh786E
Message-ID: <CAMKF1sr241qM_Nwuf3V6jSQ__6SH-iNQqK1uWf9p5A9a04K_cA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 00/22] Cherry-picks from Master
 Batch A
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119726

The version updates can be a bit dicey, since they may change API
behavior that can break existing apps at runtime, its tedious and hard
to look at every change that got into that release
I am hoping we have done due diligence here. Overall, it looks fine to
me. Please combine all of the proposed fixed into a single PR for
final merge.

On Tue, Sep 23, 2025 at 4:06=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This is batch A of cherry picks from master branch, that I deem to be use=
ful and
> appropriate to be in Kirkstone branch.
>
> These include assorted recipe fixes (SRC_URI, LICENSE, typo fixes), and r=
ecipe
> version updates. With recipe updates I have spent effort to ensure that t=
hey
> contain only bugfixes - I did go through all the change logs and/or the c=
ommit logs,
> and I did skip commits that introduced some backwards incompatible change=
s.
>
> This batch has so far survived a "bitbake world" build for arm, aarch64, =
x86 and x86-64.
>
> Even though I tried to be careful with my cherry picks, your review and c=
omments
> would be very appreciated.
>
> Thank you.
>
> P.S: I plan to send similar batches (consisting of ~20 patches), once a d=
ay, for
> the next couple of days.
>
> --
>
> Changqing Li (1):
>   libtimezonemap: correct package version
>
> Gyorgy Sarvari (1):
>   fatresize: set correct LICENSE
>
> Kai Kang (1):
>   libtimezonemap: rename downloaded file name
>
> Khem Raj (2):
>   faenza-icon-theme: Switch to a valid download  location for SRC_URI
>   libtimezonemap: Point to a working SRC_URI
>
> Mingli Yu (6):
>   libnma: add opengl to REQUIRED_DISTRO_FEATURES
>   network-manager-applet: add opengl to REQUIRED_DISTRO_FEATURES
>   gnome-bluetooth: add opengl to REQUIRED_DISTRO_FEATURES
>   gnome-desktop: add opengl to REQUIRED_DISTRO_FEATURES
>   gtksourceview5: add opengl to REQUIRED_DISTRO_FEATURES
>   evince: add opengl to REQUIRED_DISTRO_FEATURES
>
> Wang Mingyu (4):
>   sshfs-fuse: upgrade 3.7.2 -> 3.7.3
>   evolution-data-server: upgrade 3.44.1 -> 3.44.2
>   gjs: upgrade 1.72.1 -> 1.72.2
>   gnome-bluetooth: upgrade 42.2 -> 42.3
>
> Yi Zhao (2):
>   yaffs2-utils: update SRC_URI
>   evince: fix typo for RRECOMMENDS
>
> wangmy (5):
>   evolution-data-server: upgrade 3.44.0 -> 3.44.1
>   gjs: upgrade 1.72.0 -> 1.72.1
>   gnome-bluetooth: upgrade 42.0 -> 42.1
>   gnome-bluetooth: upgrade 42.1 -> 42.2
>   evince: upgrade 42.2 -> 42.3
>
>  ...shfs-fuse_3.7.2.bb =3D> sshfs-fuse_3.7.3.bb} |  2 +-
>  .../yaffs2/yaffs2-utils_git.bb                |  3 +-
>  .../fatresize/fatresize_1.1.0.bb              |  2 +-
>  .../libnma/libnma_1.8.38.bb                   |  2 +-
>  .../network-manager-applet_1.26.0.bb          |  2 +-
>  .../evince/{evince_42.2.bb =3D> evince_42.3.bb} |  8 +++--
>  .../evolution-data-server.inc                 |  4 +--
>  .../faenza-icon-theme_1.3.bb                  |  3 +-
>  .../gjs/{gjs_1.72.0.bb =3D> gjs_1.72.2.bb}      |  2 +-
>  ...etooth_42.0.bb =3D> gnome-bluetooth_42.3.bb} |  4 +--
>  .../gnome-desktop/gnome-desktop_42.0.bb       |  2 +-
>  .../gtksourceview/gtksourceview5_5.4.1.bb     |  1 +
>  ...001-configure.ac-correct-the-version.patch | 29 +++++++++++++++++++
>  .../libtimezonemap/libtimezonemap_0.4.6.bb    |  4 +--
>  14 files changed, 49 insertions(+), 19 deletions(-)
>  rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.2=
.bb =3D> sshfs-fuse_3.7.3.bb} (93%)
>  rename meta-gnome/recipes-gnome/evince/{evince_42.2.bb =3D> evince_42.3.=
bb} (80%)
>  rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb =3D> gjs_1.72.2.bb} (=
92%)
>  rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.0.bb=
 =3D> gnome-bluetooth_42.3.bb} (87%)
>  create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/files/0001-co=
nfigure.ac-correct-the-version.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119664): https://lists.openembedded.org/g/openembedde=
d-devel/message/119664
> Mute This Topic: https://lists.openembedded.org/mt/115391835/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

