Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA980C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 19:29:49 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.37455.1704223786417996168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 11:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8OHnNHV;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6dbfdb41a63so4035764a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704223785; x=1704828585; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNTXwVSBXbc3MVadL+q5MuPhYX49aTo0GL50y5V61Is=;
        b=l8OHnNHV3wN3j0Qbb6H0T45f5+NJiIlJxzbP9WAgQpxj99Bb548xKMTrWgpaj0etXy
         kyYNBICBgBCHHpZL0776bdaq6EV66XXhy9ZpjBr+1zC5CFz77ppE9UoSgX9JmVZ7XAwE
         0i9ZVk/tfOR0aGIpa2e3RarEj6ZLKTh1vCa4wBiuSQPji7tvA3vPzRlhQ3/SFpef8GjX
         L0QzF/WhyjkYh/woJ5pWY8iDgEZ2LjsWy3HjcUeR92ETl5k2fApunMhCQ1bmyuW4mXc1
         ksaRrWpk+tPp9PDDQ86Ik1zrFeKLZ8VoRtXdc3R0GF3y9xUvXAGhfmJC++fSahigzNez
         XScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704223785; x=1704828585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNTXwVSBXbc3MVadL+q5MuPhYX49aTo0GL50y5V61Is=;
        b=pMJREmCcsmEVld/MsB7XQxvgpCXaxAdgtZ6dS6/xKAKZBJFenJ261uZ/lvTCdEsitW
         fEfD5YHFUyMUwCtuLExsZfRNkn3hLxRF2PHyRQViSV5trz/Ssm6Qc2NdX/oYe0KLoN4i
         HwMzDak5D4uGxIUBwoIPIY/jYrOvibx+O+efCQnJNtcCmjzo4KcbsL/rRABpRDORPwye
         WPluvGVJQNUPU8LP4WhQQqrlrDvqwOYkttzWtbk11zM5dWj/t57UvRbpJupzOAnkBdE5
         Di0tNonHuvLB+Ga67KIpk3RwWcDxq53alRLGGXcrMv6fJ7cn6SgzdfaQ/ztxf0Htm3mX
         gquw==
X-Gm-Message-State: AOJu0Yz5luPEr1ioKmxMrT3qkt/HHsfcwyxZnq8N4DBmqcVzzosrayi8
	xBjyyqTCcjiVQR6een81jBCXkFizjlI9ryb+bXU=
X-Google-Smtp-Source: AGHT+IEMrBccmJnzcPk5KpvTNGvcWEbtDBX3fv9leDoniIDBlJscXWk+BJrvaEAXG7NUrdx0DBdM06fX09wP4vHXSto=
X-Received: by 2002:a05:6870:ac21:b0:203:f926:5b4c with SMTP id
 kw33-20020a056870ac2100b00203f9265b4cmr23460956oab.20.1704223785485; Tue, 02
 Jan 2024 11:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20240102191222.833181-1-iillyyaa@gmail.com>
In-Reply-To: <20240102191222.833181-1-iillyyaa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Jan 2024 11:29:19 -0800
Message-ID: <CAMKF1sr1QZEW-fJB6sncQNhF-Huaa3iEXinZr9n87-Ub+Pau+A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] srecord: fix install prefix
To: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 19:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108016

On Tue, Jan 2, 2024 at 11:12=E2=80=AFAM Ilya A. Kriveshko <iillyyaa@gmail.c=
om> wrote:
>
> srecord's CMakeLists.txt was unconditionally setting CMAKE_INSTALL_PREFIX
> for non-WIN32 builds, which caused it to ignore OE-supplied prefix
> that contained the sysroot portion of the path.  Fixed by removing the
> offending line.
>
> Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
> ---
>  ...rnally-supplied-CMAKE_INSTALL_PREFIX.patch | 27 +++++++++++++++++++
>  .../recipes-support/srecord/srecord_1.65.0.bb |  3 ++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/srecord/files/0001-allow-exte=
rnally-supplied-CMAKE_INSTALL_PREFIX.patch
>
> diff --git a/meta-oe/recipes-support/srecord/files/0001-allow-externally-=
supplied-CMAKE_INSTALL_PREFIX.patch b/meta-oe/recipes-support/srecord/files=
/0001-allow-externally-supplied-CMAKE_INSTALL_PREFIX.patch
> new file mode 100644
> index 000000000..19b5c88f6
> --- /dev/null
> +++ b/meta-oe/recipes-support/srecord/files/0001-allow-externally-supplie=
d-CMAKE_INSTALL_PREFIX.patch
> @@ -0,0 +1,27 @@
> +From 023b3de19a9c04858f34143d5d9b32bd0287f6d7 Mon Sep 17 00:00:00 2001
> +From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
> +Date: Fri, 29 Dec 2023 20:48:37 +0000
> +Subject: [PATCH] Allow externally supplied CMAKE_INSTALL_PREFIX
> +
> +CMAKE_INSTALL_PREFIX variable is supposed to be left as a default,
> +or overwritten by the packager.  In particular, OE-provided prefix
> +includes the sysroots path and should be used.
> +

I think if we can change the logic to check for CMAKE_INSTALL_PREFIX
before setting it to /usr here
could work here as well as become worth upstreaming too.

> +Upstream-Status: Inappropriate [OE-specific]
> +
> +---
> + CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 74b8108..f149917 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -32,7 +32,6 @@ include(GNUInstallDirs)
> + # FHS compliant paths for Linux installation
> + if(NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
> + #  set(CMAKE_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
> +-  set(CMAKE_INSTALL_PREFIX "/usr")
> + endif()
> +
> + # Pull in the rest of the pieces
> diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/=
recipes-support/srecord/srecord_1.65.0.bb
> index 06ce48e65..6887f629e 100644
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
> +    file://0001-allow-externally-supplied-CMAKE_INSTALL_PREFIX.patch"
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
> View/Reply Online (#108015): https://lists.openembedded.org/g/openembedde=
d-devel/message/108015
> Mute This Topic: https://lists.openembedded.org/mt/103487925/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

