Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C091C001DE
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 03:24:36 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.6779.1690946669629297652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 20:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sS4RiI+l;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a5a7e7cd61so335074b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 20:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690946669; x=1691551469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSe9T1U2vTj5FpTJ+E53jP3ZjyDXMMi53QjH2AqmsCk=;
        b=sS4RiI+lTKNgytSojr8T5j8WB028R/ZfW3+/F/5groG+qv4M9E+md1Y5hZEc2jdTp0
         y925UV7WYu3uAmDfYCf/HHfd90Qtc5fp5UWTJ4t0sPPPDvvhi68W3FwFY6TJ0F/jrbxu
         t/opW4bOHCf/AHyZhv+kTGRTSxeLTohr8Ziliq08kybpQw0KiAkXcE94snhIJiygkM1Y
         0vqpRZQuE34ls9sDqtr4KcHRWt8zJ3jbLACuH1SkHzTM38z0jFwmsnC5SU3S3cmdxC7/
         +29Jm9cIIbtbecJllBUUl9Y7onAs2pdkG3WoTCSYNoRG4GVeKDSTKHkqqO2Y5hrBS9Fo
         TIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690946669; x=1691551469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSe9T1U2vTj5FpTJ+E53jP3ZjyDXMMi53QjH2AqmsCk=;
        b=Q9It+dQrRzm2jkSFIX8kNqt4j3dCUU1lOVSITPk5A6ZHbjfenN/F1CXxW8iTKeolVs
         EHZsZs1UWqs9fjUZCblb9IojNNyVyJ2ZK7tBOmTz2Xd9ezs4hehwwWxdODg1D09hTQb2
         tl0Y53f59FcD6vGbST5BjCcLuBT6MdsqVMPN2w+0+FUsGgxyHVp2nnzHZn1ZzFqCCo6y
         DYI1tEcGShC3sSNDwrl1mZGiclPKw4qg7eBvy4BfUf5x8L/LXfgeK0eY1Wy1Eb5sPbGV
         w3jE9OiwsC72ceUpMI1gvWZLwsRHz2qPHY2naARfLbzRihHOxC6fnYpdlQwa6NHLLdU+
         bdPw==
X-Gm-Message-State: ABy/qLY/GuiGNMFOb7BjraV9aaLgkLtcZ2ogUS5FrEOSefQMHJfWPcer
	Y9FLdYBZYVKD6b5h7AjW7OBneO3noFbW4tN3B7g=
X-Google-Smtp-Source: APBJJlG5UJm3FX/9X6J47kFbid4s19TpZ1nQN44mMCk3/IwjAcs553LWDFGOZ4Vjdx0FA430IKhbfRwwmyKhnhXORyg=
X-Received: by 2002:a05:6808:1488:b0:3a3:de2f:b8f8 with SMTP id
 e8-20020a056808148800b003a3de2fb8f8mr14342569oiw.16.1690946668582; Tue, 01
 Aug 2023 20:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230801225139.3011215-1-nicolas.marguet@windriver.com>
In-Reply-To: <20230801225139.3011215-1-nicolas.marguet@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2023 20:24:02 -0700
Message-ID: <CAMKF1sqzUsXn17Vz0=kRc2JB3J8MHZbUj6UX3Wr=gEyFUMhq-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Fix function inline errors in debug optimization
To: nicolas.marguet@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 03:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104200

On Tue, Aug 1, 2023 at 3:52=E2=80=AFPM nicolas.marguet via
lists.openembedded.org
<nicolas.marguet=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Nicolas Marguet <nicolas.marguet@windriver.com>
>
> Compiler does not inline any functions when using debug optimization (-Og=
).
> Hence, remove -Winline flag when compiling with debug optimization.
>
> Backport upstream fix: https://github.com/rsyslog/librelp/pull/258
> Remove previous local fix: https://github.com/rsyslog/librelp/issues/256
>
> Upstream-Status: Backport [https://github.com/rsyslog/librelp/commit/6d57=
5d9]

Upstream-Status: should be added to .patch file header [1]

[1] https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch=
_Header_Recommendations:_Upstream-Status

>
> Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
> ---
>  ...line-errors-in-debug-optimization-Og.patch | 29 +++++++++++++++++++
>  .../rsyslog/librelp_1.11.0.bb                 |  5 +---
>  2 files changed, 30 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/files/0001-Fix-funct=
ion-inline-errors-in-debug-optimization-Og.patch
>
> diff --git a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inl=
ine-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsyslo=
g/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
> new file mode 100644
> index 000000000..509bfbf8a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-err=
ors-in-debug-optimization-Og.patch
> @@ -0,0 +1,29 @@
> +From 6d575d98565ce3119a14359eecb11ccdff92a303 Mon Sep 17 00:00:00 2001
> +From: Yash Shinde <53660251+Yashinde145@users.noreply.github.com>
> +Date: Thu, 29 Jun 2023 18:10:15 +0530
> +Subject: [PATCH] Fix function inline errors in debug optimization (-Og)
> +
> +Compiler does not inline any functions when using debug optimization (-O=
g). Hence, remove -Winline flag when compiling with debug optimization.
> +---
> + configure.ac | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 21c1fde..1204c4e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -230,6 +230,12 @@ if test "$enable_debug" =3D "no"; then
> +         AC_DEFINE(NDEBUG, 1, [Defined if debug mode is disabled.])
> + fi
> +
> ++#Compiler does not inline any functions when not optimizing(-Og).
> ++#Hence, remove -Winline flag when DEBUG is enabled.
> ++#ifdef DEBUG
> ++WARN_CFLAGS=3D"$(echo "$WARN_CFLAGS" | sed s/-Winline//g)"
> ++#endif
> ++
> + # valgrind
> + AC_ARG_ENABLE(valgrind,
> +         [AS_HELP_STRING([--enable-valgrind],[Enable valgrind tests@<:@d=
efault=3Dyes@:>@])],
> +--
> +2.39.0
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
> index e7b79ad03..bac5abb05 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1fb9c10ed9fd68=
26757615455ca893a9"
>  DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
>
>  SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;branc=
h=3Dstable \
> +           file://0001-Fix-function-inline-errors-in-debug-optimization-=
Og.patch \
>  "
>
>  SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
> @@ -14,7 +15,3 @@ SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
>  S =3D "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> -
> -DEBUG_OPTIMIZATION:append =3D " -Wno-error=3Dinline"
> -
> -
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104199): https://lists.openembedded.org/g/openembedde=
d-devel/message/104199
> Mute This Topic: https://lists.openembedded.org/mt/100494901/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

