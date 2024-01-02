Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7BAC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 21:50:04 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.3104.1704232195621731542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 13:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jIFME+ht;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2041c292da8so5192385fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704232195; x=1704836995; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0INefFUvg9BtQ3SL1aQm139AYMmUkkbzQEdM1gG10A=;
        b=jIFME+htDtuNPP0JieZQokyNlYRtRci5DCibIqgMgIE//6U5TdXr708QUq8EMHdYzG
         fk13kDTaRcJnrsx+kHfKuTIcZ960UEYX/QBDk/IQQ8Qq2ZyenYuMvUG2v94nVpTSzMKX
         h/fvpoHfOhygiaakA7Fl7vgJnmKSzRhETet/CNCQYklDeEbzdY1Z+zAhJoEefLeCWE81
         dVc77TV5fkfdT6UZZwdGTSM0XQSoTGP4TWGxX8a1a1WHdILv+F0+3tYZ2lsU7sSJv8Zh
         cn/WKcc2IqeuviRQ39XkT/otmc8IOaYnf955sh9cePcxKf+lQcABrA4bXj7ubLz3a5/L
         EHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232195; x=1704836995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0INefFUvg9BtQ3SL1aQm139AYMmUkkbzQEdM1gG10A=;
        b=vOZJwHNN9v9K182fXmE25t05JXB+PFfvF5oRC4gNQApm7VHR1mKskWLlfd1YXtmi0B
         L4Nw+DiJQF5PO9skPN/tPOu9d6PfNke/JzxcI5pUj9ZWRMTT5SYTmExSJh5grmo+jfV1
         30Umeso0Fb2Z2SwaN2+Haus8rUfc3SSRmwotY0HR7acVCft7JsbmkFMw495HsKYqiqdV
         5ZxXDQdcY7xLo3MOqvsCApgQ1F1uFBikrWL4pSuA2IKV1mOBpf4/sPAsP044UOGOExfy
         cyRaKwnDX7Qddtvluxh8AHDHcC8dtI551qkgiCU8zscdIEVWSpSnELshmCAeM432QA2u
         fRUg==
X-Gm-Message-State: AOJu0YyE2MdzMJUttSwvMrmExTTuJNX+GK/3VPoGvUXhPZ5BdKeuLL3Z
	06NdKA66d7JTXv1+zoULmiGzoaL3FAMGhEDMDGXG9gZ3
X-Google-Smtp-Source: AGHT+IF08hOfggMl2C1BbdTjoGrfzitfK8Zs8tnFPXxWV8kItOcmQa0FbH/Dv0PYLsWzb+pkGA/8lA6diTngL3HuX/k=
X-Received: by 2002:a05:6870:3308:b0:203:6d48:cf9f with SMTP id
 x8-20020a056870330800b002036d48cf9fmr14104611oae.79.1704232194761; Tue, 02
 Jan 2024 13:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20240102210554.843148-1-iillyyaa@gmail.com>
In-Reply-To: <20240102210554.843148-1-iillyyaa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Jan 2024 13:49:28 -0800
Message-ID: <CAMKF1sqwWaq=v31nD+YRg_6YXYA573-9QO-ATDJ8=OMaePth2w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] srecord: fix install prefix
To: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 21:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108020

On Tue, Jan 2, 2024 at 1:06=E2=80=AFPM Ilya A. Kriveshko <iillyyaa@gmail.co=
m> wrote:
>
> srecord's CMakeLists.txt was unconditionally setting CMAKE_INSTALL_PREFIX
> for non-WIN32 builds, which caused it to ignore OE-supplied prefix
> that contained the sysroot portion of the path.  Fixed by setting
> the prefix only if it wasn't explicitly provided.
>
> Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
> ---
>  ...make-respect-explicit-install-prefix.patch | 31 +++++++++++++++++++
>  .../recipes-support/srecord/srecord_1.65.0.bb |  3 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/srecord/files/0001-cmake-resp=
ect-explicit-install-prefix.patch
>
> diff --git a/meta-oe/recipes-support/srecord/files/0001-cmake-respect-exp=
licit-install-prefix.patch b/meta-oe/recipes-support/srecord/files/0001-cma=
ke-respect-explicit-install-prefix.patch
> new file mode 100644
> index 000000000..d310d0410
> --- /dev/null
> +++ b/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-i=
nstall-prefix.patch
> @@ -0,0 +1,31 @@
> +From 4aa8cf8c93e1fa6ffeb40fc3473f32b1b83af141 Mon Sep 17 00:00:00 2001
> +From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
> +Date: Tue, 2 Jan 2024 15:37:10 -0500
> +Subject: [PATCH] cmake: respect explicit install prefix
> +
> +If CMAKE_INSTALL_PREFIX was supplied externally, use it.  This follows
> +the pattern suggested by cmake documentation in:
> +https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX_INITIA=
LIZED_TO_DEFAULT.html
> +
> +Upstream-status: Submitted

It will be good to add the tag to point to location of upstream
submitted location

Upstream-Status: Submitted [url detailing where the submission activity is]

> +---
> + CMakeLists.txt | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 74b8108c..ac9f464e 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -30,9 +30,9 @@ include(InstallRequiredSystemLibraries)
> + include(GNUInstallDirs)
> +
> + # FHS compliant paths for Linux installation
> +-if(NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
> +-#  set(CMAKE_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
> +-  set(CMAKE_INSTALL_PREFIX "/usr")
> ++if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT
> ++        AND NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURC=
E_DIR)
> ++  set(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Install prefix" FORCE)
> + endif()
> +
> + # Pull in the rest of the pieces
> diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/=
recipes-support/srecord/srecord_1.65.0.bb
> index 06ce48e65..3e8a87d07 100644
> --- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
> +++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
> @@ -4,11 +4,12 @@ LICENSE =3D "GPL-3.0-or-later & LGPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
>  SRC_URI =3D " \
>      https://sourceforge.net/projects/${BPN}/files/srecord/${@oe.utils.tr=
im_version('${PV}', 2)}/${BP}-Source.tar.gz \
>      file://0001-Disable-doxygen.patch \
> -    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.pat=
ch"
> +    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.pat=
ch \
> +    file://0001-cmake-respect-explicit-install-prefix.patch"
>  SRC_URI[sha256sum] =3D "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc=
41bd2311d1337644"
>  S =3D "${WORKDIR}/${BP}-Source"
>
>  UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/srecord/files/r=
eleases"
>
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108019): https://lists.openembedded.org/g/openembedde=
d-devel/message/108019
> Mute This Topic: https://lists.openembedded.org/mt/103487925/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

