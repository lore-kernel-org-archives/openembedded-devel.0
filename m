Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DFFCD8CAA
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 16:14:31 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.95668.1696954470328299908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 09:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mRc+oXr+;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1e96c9c4597so396804fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696954469; x=1697559269; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kROhrHNQA9euL63BpwYztDfho8mcSuPoZfVBC143j0=;
        b=mRc+oXr+ajn8kDYuf3BhKiUWkZtilrWd/Is3H5O8A2ROKwtCBOl9uj8pQ1I2T0/9o2
         dNSrhHdNivzzNaemvPKHiI7WVm1O+P7PKI8tAc1LjTuaorqmu1q74bRewwYjbTYWhuUZ
         KqHYlTwMr3UCT9FoRTVWaJIuNxNt9ZotHfpFtgpGShIviI4qoTqBxNTWwSMGuTtY4myM
         rdQWZ4fn3RbSb4PTzb0rc3XcKe07S4nJuK0pFJ1CEsZC6neaFdF9uVN7twv0TT9DX3uV
         cFzs6yoR99nvXEvqOfIuC4nnyZrLrPAdwUgk7FxY3V1i7T/9+vAR6K2jofPGe+gt7MSQ
         /SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954469; x=1697559269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kROhrHNQA9euL63BpwYztDfho8mcSuPoZfVBC143j0=;
        b=QsCxkz06LG/+WVwaz2lS85bq3/5xkEeFSD9d4ZqpUfiEu59MRc0yCV78DVs8spK/d2
         Hcwxh0gTq1sFHU+OKnJ6n4JYyAuF1CQdxh10/9hkuxYjBe25bW6VlE42oXL2UnyafOYv
         Qcxh6mBUmd/m4mvUMRuRlVvOc28kEL+jkUmkU4gTMqZBkd3Omves0PHtMDI57HIgImAC
         Am70yJwJFOmpxxG7XMfIDbfBUDB/F0PCwqJ477f1LDQ7ldaKdiFpJqtSUf8yig1/sAbP
         0zW5Y+TvbE/Wubegv+2uxDt6MP65yB0O9WxwXJAZxjlXyFwWhc0zbD5tKcwtfgh3z1aR
         Yqbw==
X-Gm-Message-State: AOJu0YxlXGKjcZJWl4RU9ageC/xjJirJQ9DyDCvh9RtQwSHngbeb4HGG
	NWvO1qBulQJEH4XyUy3SQViscCmHo8ERxSkYLXY=
X-Google-Smtp-Source: AGHT+IFgBX74FVn6d3qeIYA/V9YzTAMh5570QAXIbG9YTFb+ClMUVvKftm2Okn4V5EmS3jQup+SU7zTyoVCmNYWS2Eg=
X-Received: by 2002:a05:6870:910c:b0:1d5:aab3:ecd3 with SMTP id
 o12-20020a056870910c00b001d5aab3ecd3mr19556822oae.6.1696954469419; Tue, 10
 Oct 2023 09:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231010160932.1711687-1-yoann.congal@smile.fr>
In-Reply-To: <20231010160932.1711687-1-yoann.congal@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2023 09:14:03 -0700
Message-ID: <CAMKF1so4-2Y1LSjHqYRFgnyDqysAnbrrwyHU4f52U2hw0SdjhA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-rapidjson: add ptest
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, 
	Mickael RAMILISON <mickael.ramilison@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 16:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105410

Thanks for this patch, I am wondering what those 8 fails are and if we
can perhaps fix them or add them to known failure list. Then add it to
PTESTS_SLOW_META_PYTHON or PTESTS_FAST_META_PYTHON depending upon how
quick it takes to complete. So we can track regressions
regularly.

On Tue, Oct 10, 2023 at 9:10=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> From: Mickael RAMILISON <mickael.ramilison@smile.fr>
>
> Signed-off-by: Mickael RAMILISON <mickael.ramilison@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> Note:
> As of now, the ptest shows:
>   Testsuite summary
>   # TOTAL: 940
>   # PASS: 913
>   # SKIP: 17
>   # XFAIL: 2
>   # FAIL: 8
>   # XPASS: 0
>   # ERROR: 0
>
>  .../python/python3-rapidjson/run-ptest        |  3 +++
>  .../python/python3-rapidjson_1.11.bb          | 20 ++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-rapidjson=
/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-rapidjson/run-pt=
est b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
> new file mode 100644
> index 000000000..8d2017d39
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.b=
b b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
> index 930ad3434..3ea559488 100644
> --- a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
> @@ -9,14 +9,32 @@ SRCREV =3D "e1b41f64df1705770b7b70d7221a4812909c1d0f"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit setuptools3
> +# Inheriting ptest provides functionality for packaging and installing r=
untime tests for this recipe
> +inherit setuptools3 ptest
>
>  SETUPTOOLS_BUILD_ARGS +=3D " --rj-include-dir=3D${RECIPE_SYSROOT}${inclu=
dedir}"
>
> +# run-ptest is a shell script that starts the test suite
> +SRC_URI +=3D " \
> +    file://run-ptest \
> +"
> +
>  DEPENDS +=3D " \
>      rapidjson \
>  "
>
> +# Adding required python package for the ptest (pytest and pytest->autom=
ake report translation)
> +RDEPENDS:${PN}-ptest +=3D " \
> +    ${PYTHON_PN}-pytest \
> +    ${PYTHON_PN}-unittest-automake-output \
> +"
> +
>  RDEPENDS:${PN} +=3D " \
>      ${PYTHON_PN}-core \
>  "
> +
> +# Installing the test suite on the target
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105409): https://lists.openembedded.org/g/openembedde=
d-devel/message/105409
> Mute This Topic: https://lists.openembedded.org/mt/101878478/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

