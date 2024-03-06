Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF107C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:49:32 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.17123.1709743768749558722
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lQzf3BB8;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a19de33898so292761eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709743768; x=1710348568; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/8eG7eqxfYYUGLwSQoTwhA+5JTnJD74kHS2lCk8pEM=;
        b=lQzf3BB89HUVljDWiNanfQopOqCxk+TorlirW93TlMMorMI4gyavqG5we7cSpliWJO
         3nBqrZdbq8od1T8prgWkbhaj1bbNO044pgu2Y+nFnLJs4HlfkaZO8/HCvQrw6pCk6OJP
         XYd/Lf6olD9pTbAjH24fgkTt8q69GbVWDl6VgO+BndXb/9RB2kkzFZj3hn4C49JB6dcy
         Y+5ib+/3d1h7prxGmYO0gpj9of4lrY3WK5wfJau6Xr93AokNh0W4u6rh/eQ0NZndcuHk
         KrWhusphX6Cet/qdf26CS6j2oXjI9uol8raOl8OpE2uMEyAbcNTg0s/ah/mFcMB3V1JQ
         MRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709743768; x=1710348568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/8eG7eqxfYYUGLwSQoTwhA+5JTnJD74kHS2lCk8pEM=;
        b=VYt+u9/3sz4jtRIxHDr3VezhWJkEij+/yBom/ICiPaDiliO5u6DZ1Vqn6NVgIDvi9c
         3x4/IQukQ4+lRhkm4awLHeH2qfo1z7EqVff/B48KVCDaScdlhEQQyWHeZhoK8tNtIOsi
         0whUP0wyFN8k+16F7AuecSAV/A3rVvebs3NEZvcorCkUvvGxYQNeRtfaEEQSoAWuTlGA
         y2sV7hMwyuw4Vx5hiImpz5AaB6Nb/9jF7r5WLKeSJGL1tsAjyHoEgn/BpQGEtx3w1a0n
         AIrHERQjllzVss3nWQJuCjKqV+m+wqdELe4MaqFrGa746/hahFlEojvOpUEvkjUWGIgv
         v+UQ==
X-Gm-Message-State: AOJu0YzorcxvdCBp5QAs7WbJhRTthjaC4y7TdsAIj19vezevLWvXojza
	7QCJZWVHo+9wiOz+u3LaCgTBwc6AAH5Z+l3Hn6hsfxHex0hJiIlFC1Mh7e1GF42GWKrFLPdW1EN
	ayi1gAdkw2/5BZFBJulHVvJDvu2CkKc6E
X-Google-Smtp-Source: AGHT+IEolX3gIbiIKReONlyQC4Ho1yDG54gvCLeoNiMBpN2pWOVrMsBcJx3ahfA9bxm4nc6WMkMzmqzLUxZnlFPLeyo=
X-Received: by 2002:a05:6870:93ca:b0:21f:cb2e:de41 with SMTP id
 c10-20020a05687093ca00b0021fcb2ede41mr5499680oal.0.1709743767829; Wed, 06 Mar
 2024 08:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20240306162737.1722284-1-pkj@axis.com>
In-Reply-To: <20240306162737.1722284-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 08:49:02 -0800
Message-ID: <CAMKF1sqZhEby8gOYZSukdMT4DoCGnNPsCAuCn2KqpVqTBqpnQw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] abseil-cpp: A little clean-up
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109171

Which branch is it intended for?, if it is master then always rebase
and test patches on latest master or master-next, otherwise add the
name of branch in subject prefix
makes it easy for maintainers to route the patch.

On Wed, Mar 6, 2024 at 8:27=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> * Remove ASNEEDED:class-native and ASNEEDED:class-nativesdk as they make
>   no difference since ${ASNEEDED} is only added to TARGET_LDFLAGS.
> * Remove additions to FILES:${PN}-dev since the added paths are already
>   added by default.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb=
 b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> index 1ce6ff3fc..667693a4c 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Abseil is a cpp library like STL"
>  DESCRIPTION =3D "Abseil provides pieces missing from the C++ standard. C=
ontains \
>  additional useful libraries like algorithm, container, debugging, hash, =
memory, \
> -meta, numeric, strings, synchronization, time, types and utility"
> +meta, numeric, strings, synchronization, time, types and utility."
>  HOMEPAGE =3D "https://abseil.io/"
>  SECTION =3D "libs"
>  LICENSE =3D "Apache-2.0"
> @@ -19,9 +19,6 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=
=3D${BRANCH};protocol=3Dhttps \
>
>  S =3D "${WORKDIR}/git"
>
> -ASNEEDED:class-native =3D ""
> -ASNEEDED:class-nativesdk =3D ""
> -
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> @@ -29,8 +26,6 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
>                   -DABSL_ENABLE_INSTALL=3DON \
>                  "
>
> -BBCLASSEXTEND =3D "native nativesdk"
> -
>  SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
>
> -FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
> +BBCLASSEXTEND =3D "native nativesdk"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109170): https://lists.openembedded.org/g/openembedde=
d-devel/message/109170
> Mute This Topic: https://lists.openembedded.org/mt/104769052/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

