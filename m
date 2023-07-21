Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01E0C0015E
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 15:49:20 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.10520.1689954551021585638
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 08:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aplYpsL1;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6bb07d274feso1453657a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689954550; x=1690559350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXk8ZS7qOK++dyGfpKbemkSqH5nazF0+sYCRCCvRoTE=;
        b=aplYpsL12wyZFu2KF95j2vsS4KP6YFasCC11tKTXBWnbM9p5WmKDWW0x+aFKbTgKLC
         TllkH//T53GHxmbUGPcd0+h7vg2t3KrknzhMmtNcY1xV7mrucT9DC4mYAT9+RzDamymO
         Tvdn6+qDwzEr/NzkPr7irlcq7bmgHAmffi61c7ji8tBSY1z1oJ2/OVPlLDDOxXBNFecg
         3MloR1jw6ZuWgQTahHXoXmrcRVwSdq98Sdrus+Mfbdh6Tld7GujKrtwbwTDbD7WDW0p5
         EKSJvQOacvRrqbKqYUHQ6JhysIV/PPldZ63vPObb/IIPG73QRNKuxOeqj3lPdM54v1t8
         XJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954550; x=1690559350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXk8ZS7qOK++dyGfpKbemkSqH5nazF0+sYCRCCvRoTE=;
        b=h5NfoRlh+adWltWA8QjPBnoZ+pzdDsPRWe5I4a8OFtwnANQSE48t63Sf1luCDgoOs6
         xUtCGlKFcCQTOrd+6ry5az7HvAHF0FxtbXobeqj5qEc6ABFtxQ99qgZe+0jI9qIf8acA
         ZwegKO5bIgyOR9zEOCVdc5VqveOtG8GTReqo4Lu2KrXBJMa68DrTRcmXxHZ06jeWhRof
         wG86MX1/JDcGV03zTsZ4KD3eG5PXAuAGTcQwuIQf+ddSuqb+jK/sy/9Fs/htLvNwrbur
         d0Wvs7Pv1Zapkswl7VvjrBizl0NQoIo8wSoaQ7uXeam+GoRmFX99L0TJkt62iFU2armJ
         xUWQ==
X-Gm-Message-State: ABy/qLYMQuBs4xrKUpK8xnzoFPhgPbxWp5Etah08weu8i+9UX24/u869
	gxYOZaBrEGXw/W7I/cI9Q6y+lCWFFVLu97bTUd0=
X-Google-Smtp-Source: APBJJlF9bvbZdyev7YaR/VQnTIvT7IK5xaPGslqKAyGnLZ88fNCmNpkUrdZ0eEs6EqfopWmwxfMuUFgF2XmTXyFaMws=
X-Received: by 2002:a05:6808:1446:b0:3a2:ee9b:4262 with SMTP id
 x6-20020a056808144600b003a2ee9b4262mr3050194oiv.52.1689954550069; Fri, 21 Jul
 2023 08:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <1689755422-8405-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1689755422-8405-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jul 2023 08:48:44 -0700
Message-ID: <CAMKF1sqmCg-yt6LLBWHTk7_mEXF=PkwyD1g8d9UU8byPUni_Eg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] lastlog2: add new recipe
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 15:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103972

fails to build

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2918/step=
s/15/logs/stdio

On Wed, Jul 19, 2023 at 1:30=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...emove-lto-to-fix-link-error-of-clang.patch | 31 +++++++++++++++++
>  .../lastlog2/lastlog2_1.1.0.bb                | 33 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/lastlog2/files/0001-remove-l=
to-to-fix-link-error-of-clang.patch
>  create mode 100644 meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
>
> diff --git a/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-f=
ix-link-error-of-clang.patch b/meta-oe/recipes-extended/lastlog2/files/0001=
-remove-lto-to-fix-link-error-of-clang.patch
> new file mode 100644
> index 0000000000..71c3de9748
> --- /dev/null
> +++ b/meta-oe/recipes-extended/lastlog2/files/0001-remove-lto-to-fix-link=
-error-of-clang.patch
> @@ -0,0 +1,31 @@
> +From 692523d2f8bf0ce893a781761154db4277f0fceb Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Wed, 19 Jul 2023 07:11:15 +0000
> +Subject: remove lto to fix link error of clang
> +
> +error message:
> +| tests/tst-y2038-64bit-time_t.p/tst-y2038-64bit-time_t.c.o: file not re=
cognized: file format not recognized
> +| clang-16: error: linker command failed with exit code 1 (use -v to see=
 invocation)
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index c521577..13d993b 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -26,7 +26,6 @@ add_project_arguments(['-D_GNU_SOURCE=3D1',
> +                        '-DPROJECT_VERSION=3D"@0@"'.format(meson.project=
_version()) ], language : 'c')
> +
> + possible_cc_flags =3D [
> +-                  '-flto=3Dauto',
> +                   '-ffat-lto-objects',
> +                 '-fstack-protector-strong',
> +                 '-funwind-tables',
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb b/meta-o=
e/recipes-extended/lastlog2/lastlog2_1.1.0.bb
> new file mode 100644
> index 0000000000..969ceaa166
> --- /dev/null
> +++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.1.0.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Y2038 safe version of lastlog"
> +HOMEPAGE =3D "https://github.com/thkukuk/lastlog2"
> +DESCRIPTION =3D "lastlog reports the last login of a given user or of al=
l users who did ever login on a system."
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D020090a00b69dd2af9ab82eb0003e=
a2c"
> +SECTION =3D "libs"
> +
> +SRCREV =3D "585153a577788c590370d20e40263b61238dfab3"
> +
> +SRC_URI =3D "git://github.com/thkukuk/lastlog2.git;branch=3Dmain;protoco=
l=3Dhttps \
> +           file://0001-remove-lto-to-fix-link-error-of-clang.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd
> +
> +DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)} sqlite3 "
> +
> +SYSTEMD_SERVICE:${PN} =3D "lastlog2-import.service"
> +
> +EXTRA_OEMESON =3D " -Dpamlibdir=3D${libdir}"
> +
> +do_install:append () {
> +      # Fix makefile hardcoded path assumptions for systemd (assumes $pr=
efix)
> +      # without usrmerge distro feature enabled
> +      install -d `dirname ${D}${systemd_unitdir}`
> +      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +}
> +
> +FILES:${PN} +=3D " ${systemd_system_unitdir} "
> +FILES:${PN} +=3D " ${libdir} "
> +FILES:${PN} +=3D " ${nonarch_libdir}/tmpfiles.d/* "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103956): https://lists.openembedded.org/g/openembedde=
d-devel/message/103956
> Mute This Topic: https://lists.openembedded.org/mt/100231709/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

