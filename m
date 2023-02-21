Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C774C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:10:59 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.52823.1677010255910522726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ijmmgCL7;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1720ea61e29so6651309fac.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sallGy0LeXNLNenmGf6C5MV0lLbhA2LeRAJ4cNujDA0=;
        b=ijmmgCL7ysggvWz+inUdeH5yhgECy08Qgjqcl/0eiRXjfRWwsKZHxUwUemrLgL+au+
         fPb9XLeH5kHFV3ntM/Il15PR31rJGWVP9v+/+lvD2+mXWaEHRpWm9LPdQHOOwqNpVXqZ
         WjzfTTNTWByuzrVFOGS0uGYWwqvjTn57aLoqYoc4AZSpO2MEQrkUGKULAND2TIgn+71p
         OyF2vluKQ35v86Xk8KqEKS1Fl4oQEhC67MnEG4hXZmoUyGxGwKehsRATaVh2us1VShvT
         ud2P5/Ygw8VvStwRviiFqo209mbhwdggeAy5x6Ri/XuLJULH7W+o7PmGFvuuK+mXsDxo
         iYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sallGy0LeXNLNenmGf6C5MV0lLbhA2LeRAJ4cNujDA0=;
        b=aCCeqy5xuKmViXGDAbha48YUHqWKuoGQ/MWCdGcoRZ98lam6pO2M8e11Rpz/paDpBc
         x6dhJbmrd92n1fzbcqTKrH8aWUToj8VCPxaFXYK/3FAta+mXxyoCqIkfrL4qZtSCAW17
         4Bxqtp5qrGOiQy0orRtxgN69EdSkO36KhxVDWXmY96RExsrW91iDykJ5RLYnNkQehQ5q
         P0T3Vh/MWghpxlf8/6Rl99IlqqaanhOUOI3Fwjbv4tY5VNrLF7LNxepITEFxhdniybtz
         umbJ/2HFfNgXSoJVYYGiU+hY2GdLu5vVWyviLa1UdvCbvnvXTGzjKyhKvXfdN4hnKsp8
         +qwQ==
X-Gm-Message-State: AO0yUKVeU497NP9llHZOzKGfGurs1M4Nvaec/Zy7bswZttx493z79U0p
	8Re7MMVnA5SxUFPl8x4Z0Ec50iaJmvKVMqbgADnAAsPq+pw=
X-Google-Smtp-Source: AK7set8c+7Mv0KSk3C7oFltO/8VypCHpEVA+yrCYYMXX+m7R8V7JfemUpsGNxODMmwrzlCtmdQv1RbjIlSv+cP1GaeE=
X-Received: by 2002:a05:6870:d188:b0:163:b85e:f1ca with SMTP id
 a8-20020a056870d18800b00163b85ef1camr936034oac.262.1677010254817; Tue, 21 Feb
 2023 12:10:54 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR01MB5129158BB0A2A117BD35F94F9EA59@DM6PR01MB5129.prod.exchangelabs.com>
In-Reply-To: <DM6PR01MB5129158BB0A2A117BD35F94F9EA59@DM6PR01MB5129.prod.exchangelabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2023 12:10:28 -0800
Message-ID: <CAMKF1sp7vs2=zBXJz5jwDys_d7xT=QPgnwCzh9Gf5hbpK28N1w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python-systemd: update from v234 to v235
To: "Cook, Samuel" <samuel.cook@cornelisnetworks.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 20:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101198

I have to rework it a bit, on top of master-next, please take a look
at https://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-next

On Tue, Feb 21, 2023 at 6:51 AM Cook, Samuel
<samuel.cook@cornelisnetworks.com> wrote:
>
> Includes bugfix from v234 which won=E2=80=99t run on python3.10
>
> See: https://github.com/systemd/python-systemd/issues/107
>
>
>
> Removes patches now no longer required as they are implemented in v235
>
>
>
> V235 released to PyPI on 11 Feb 23
>
> https://pypi.org/project/systemd-python/235/
>
>
>
> Signed-off-by: Samuel Cook <samuel.cook@cornelisnetworks.com>
>
> ---
>
>  ...-switch-from-distutils-to-setuptools.patch | 30 -------------------
>
>  .../python/python-systemd/endian.patch        | 14 ---------
>
>  .../python/python3-systemd_234.bb             | 11 ++-----
>
>  3 files changed, 3 insertions(+), 52 deletions(-)
>
>  delete mode 100644 meta-python/recipes-devtools/python/python-systemd/00=
02-setup.py-switch-from-distutils-to-setuptools.patch
>
>  delete mode 100644 meta-python/recipes-devtools/python/python-systemd/en=
dian.patch
>
>
>
> diff --git a/meta-python/recipes-devtools/python/python-systemd/0002-setu=
p.py-switch-from-distutils-to-setuptools.patch b/meta-python/recipes-devtoo=
ls/python/python-systemd/0002-setup.py-switch-from-distutils-to-setuptools.=
patch
>
> deleted file mode 100644
>
> index b3180f29f..000000000
>
> --- a/meta-python/recipes-devtools/python/python-systemd/0002-setup.py-sw=
itch-from-distutils-to-setuptools.patch
>
> +++ /dev/null
>
> @@ -1,30 +0,0 @@
>
> -From a681a79472df85cdc8c052bc61fb8b9e7b9a6495 Mon Sep 17 00:00:00 2001
>
> -From: Tim Orling <tim.orling@konsulko.com>
>
> -Date: Sun, 27 Feb 2022 11:50:36 -0800
>
> -Subject: [PATCH] setup.py: switch from distutils to setuptools
>
> -
>
> -In Python 3.10, distutils is deprecated and slated for removal in Python
>
> -3.12. It also prevents 'setup.py bdist_wheel' from building a wheel.
>
> -
>
> -Upstream-Status: Submitted
>
> -[https://github.com/systemd/python-systemd/pull/103]
>
> -
>
> -Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>
> ----
>
> - setup.py | 2 +-
>
> - 1 file changed, 1 insertion(+), 1 deletion(-)
>
> -
>
> -diff --git a/setup.py b/setup.py
>
> -index 099819b..fe9c03a 100644
>
> ---- a/setup.py
>
> -+++ b/setup.py
>
> -@@ -1,5 +1,5 @@
>
> - import sys, os
>
> --from distutils.core import setup, Extension
>
> -+from setuptools import setup, Extension
>
> - from subprocess import Popen, PIPE, check_output
>
> -
>
> - def call(*cmd):
>
> ---
>
> -2.30.2
>
> -
>
> diff --git a/meta-python/recipes-devtools/python/python-systemd/endian.pa=
tch b/meta-python/recipes-devtools/python/python-systemd/endian.patch
>
> deleted file mode 100644
>
> index e09aea733..000000000
>
> --- a/meta-python/recipes-devtools/python/python-systemd/endian.patch
>
> +++ /dev/null
>
> @@ -1,14 +0,0 @@
>
> -Include endian.h for missing definitions of htobe16
>
> -
>
> -Upstream-Status: Pending
>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> ---- a/systemd/util.c
>
> -+++ b/systemd/util.c
>
> -@@ -28,6 +28,7 @@
>
> - #include <stdbool.h>
>
> - #include <assert.h>
>
> - #include <errno.h>
>
> -+#include <endian.h>
>
> - #include <fcntl.h>
>
> - #include <unistd.h>
>
> - #include <net/if.h>
>
> diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b=
/meta-python/recipes-devtools/python/python3-systemd_234.bb
>
> index 10614fe37..411f80881 100644
>
> --- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
>
> +++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
>
> @@ -4,20 +4,15 @@ LICENSE =3D "LGPL-2.1-or-later"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fbd65380cdd255951079008b=
364516c"
>
>
>
>  PYPI_PACKAGE =3D "systemd-python"
>
> -DEPENDS +=3D "systemd (<=3D234)"
>
> +DEPENDS +=3D "systemd (<=3D235)"
>
>  RDEPENDS:${PN} +=3D "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging py=
thon3-syslog"
>
>  REQUIRED_DISTRO_FEATURES =3D "systemd"
>
>  inherit pypi features_check pkgconfig setuptools3
>
>
>
> -SRC_URI[md5sum] =3D "5071ea5bcb976186e92a3f5e75df221d"
>
> -SRC_URI[sha256sum] =3D "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b39122=
8047d33895db83e7"
>
> +SRC_URI[md5sum] =3D "93f3ca09f35719ca6a4edd1d62d38dd4"
>
> +SRC_URI[sha256sum] =3D "4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71=
c8c6b8008e695c0a"
>
>
>
>  # allow for common patches for python- and python3-systemd
>
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-systemd:"
>
>
>
> -SRC_URI +=3D " \
>
> -    file://endian.patch \
>
> -    file://0002-setup.py-switch-from-distutils-to-setuptools.patch \
>
> -"
>
> -
>
>  SRC_URI:append:libc-musl =3D " file://0001-Provide-implementation-of-str=
ndupa-for-musl.patch"
>
> --
>
> 2.25.1
>
>
>
>
>
> External recipient
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101188): https://lists.openembedded.org/g/openembedde=
d-devel/message/101188
> Mute This Topic: https://lists.openembedded.org/mt/97109929/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

