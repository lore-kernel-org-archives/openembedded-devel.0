Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8037C3DA6E
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 03:25:27 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.9355.1704770726038717308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 19:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PlyKnXOK;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-204301f2934so1973628fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 19:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704770725; x=1705375525; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubs0hNoUM+2YEptQ/a55VrTRaoPERT31HWu44dZdz3U=;
        b=PlyKnXOK1NGm6ALXbHxcTbcfu91Y/h40t8Tg5yXD+80OIj3kaXUOUgYoiLi0/VatMp
         udtDlQK5S7p2O/vlLffXLfa1oquLwkCu8h6oIYLMU3WIQCuXSd1aeK6Ge34H/Uq3bZa5
         32d52Ei5VyIMnXitJ4NbjmGr5hRy4WLespiupBmxe6YtH1fLVTQkVopwhE/CuvPT/RQO
         dH/n/D95PmvKJGJVGGbnVx0pJ3zdqHsUcE3AnDE86e6rRtnbf+yU/OwfWYpOJ8abs7Vb
         p5aDCQuxN1g+HHdkvzZQ0HlxcLbfGT0Mr2exyscSrU1t3DLBiPESomRcGOAc9ymMz2Bb
         MZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704770725; x=1705375525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubs0hNoUM+2YEptQ/a55VrTRaoPERT31HWu44dZdz3U=;
        b=i+g95gQ6zkyBytj6cWL4KeVM0N9lkcFRa9CG012bU2NgwCMoNwb1NnbwWO7JX5AZUT
         L3TC8UL69JKiPgAZLLu9g3vn2e8w4rcX23bgOXKhcCUzZA0gSj1im0uaQ+7hcO23JRY8
         oXAXvOluUR41WM/hvE7Ng/aMO9Qz9lYQVn8avUnFD1IfLBQIY72r9pn6nbB/zfmPfAg6
         Cav8poM/8y3F0hApv6vQ2Gnd2qQ8lzUZFsnFNuCfgh82HEAwMaf+xeV2IfxjplSC4PIk
         cbBqqWtJl+qbXh5EJpvzRNtQlMJ4bKEa4Df0cHEB7Yb5XFxqbYLqUSCBp9l15fFI6BqF
         JYEA==
X-Gm-Message-State: AOJu0YwnEKLmU1TpqdOpkmeCoexWeRTzUUnvOygTvRo7BOXYjyH1N91A
	2u66n89XBNpjKegZmil/MBUTj5YRunIHD+jUpA4=
X-Google-Smtp-Source: AGHT+IH2xblLfmDJJV7MUnlGk7zV+2rPFZMC9xhutUvq9X3zbiuYdw3brEhEAJBY/dmInPEKcsuI6EhJ3Qp+T0FXO5Q=
X-Received: by 2002:a05:6871:651:b0:205:ee9e:f39f with SMTP id
 x17-20020a056871065100b00205ee9ef39fmr6297279oan.6.1704770725174; Mon, 08 Jan
 2024 19:25:25 -0800 (PST)
MIME-Version: 1.0
References: <17A7D9AEDE09B8A6.11644@lists.openembedded.org> <3ZUU6S.4D2P6KFZ7X3W2@t-online.de>
In-Reply-To: <3ZUU6S.4D2P6KFZ7X3W2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 19:24:59 -0800
Message-ID: <CAMKF1sqN7mt5J0k58k9P2FTs7548uNYsfcikZB4V6SZ64z5t6A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libplacebo: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 03:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108175

Hi Markus

This has build time issues

https://sprunge.us/Ddf9jj

I think wither we need to provide a recipe for fast-float or use gitsm
fetcher instead of git fetcher.
In next version drop PV setting in recipe instead use it in recipe name its=
elf.

I will drop related patches from master-next, so please send the
complete series together again.

Thanks
-Khem

On Sat, Jan 6, 2024 at 11:47=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> v2 drops the patches that are not needed anymore
>
> On Sat, Jan 6 2024 at 08:45:11 PM +01:00:00, Markus Volk <f_l_k@t-online.=
de> wrote:
>
> libplacebo is a required build dependency for mpv-0.37 Signed-off-by: Mar=
kus Volk <f_l_k@t-online.de> --- .../mplayer/libplacebo_git.bb | 24 +++++++=
++++++++++++ 1 file changed, 24 insertions(+) create mode 100644 meta-oe/re=
cipes-multimedia/mplayer/libplacebo_git.bb diff --git a/meta-oe/recipes-mul=
timedia/mplayer/libplacebo_git.bb b/meta-oe/recipes-multimedia/mplayer/libp=
lacebo_git.bb new file mode 100644 index 000000000..337ccd23b --- /dev/null=
 +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb @@ -0,0 +1,24 @=
@ +SUMMARY =3D "The core rendering algorithms and ideas of mpv rewritten as=
 an independent library." +SECTION =3D "multimedia" +HOMEPAGE =3D "https://=
opensourcelibs.com/lib/libplacebo" + +LICENSE =3D "LGPL-2.1-only" +LIC_FILE=
S_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85da" + +SRC=
_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3Dhttps;=
branch=3Dv6.338" + +S =3D "${WORKDIR}/git" +SRCREV =3D "2805a0d01c029084ab3=
6bf5d0e3c8742012a0b27" +PV =3D "6.338.1" + +inherit meson pkgconfig + +PACK=
AGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan opengl', d)}=
" + +PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulk=
an-loader vulkan-headers shaderc spirv-shader-generator python3-mako-native=
 python3-jinja2-native glad-native" +PACKAGECONFIG[opengl] =3D "-Dopengl=3D=
enabled,-Dopengl=3Ddisabled,glad,glad" +PACKAGECONFIG[lcms] =3D "-Dlcms=3De=
nabled,-Dlcms=3Ddisabled,lcms" +PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-D=
demos=3Dfalse,ffmpeg libsdl2 libsdl2-image" + +EXTRA_OEMESON =3D "-Dvulkan-=
registry=3D${STAGING_DATADIR}/vulkan/registry/vk.xml" +
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108065): https://lists.openembedded.org/g/openembedde=
d-devel/message/108065
> Mute This Topic: https://lists.openembedded.org/mt/103566960/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

