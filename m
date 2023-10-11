Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25794CDB482
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 19:34:08 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.25991.1697052833473872741
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 12:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XHYNlvPL;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1dcfb2a3282so80323fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 12:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697052833; x=1697657633; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx1/Ml+Ow+YrsUi0AyYr7gqYEes6A4dhO7f+fgbb/TQ=;
        b=XHYNlvPLuNza49nJI/obkuuXTEIrfMSKu+ZEAP2GlAQ2Kq4fhohHhLtVPrcUkMHAiH
         DAX4AfOALHfQ6l2HCBETjVYoc2wmOiux39T53YZEpMkOXe3cd5ViMDn/geiKKBGIwFVz
         IDBs1WsD46LQzqY0jQXcrozwPVRKGw7T+ydFla4y9SvsbpOsh4tDZLjUSHERgZnSpLsh
         zfl6pZrw0Q2hYXNarHHACQqZZ3oKmvjD0EXS5oyK+o316hEqdVBlOmBLp7S9nsr9DQAn
         +pK/F4kP2TtXZ061TAUY/ad+2yqDGbF4uyWm1JuNXmgWOZr6RTw968+4FQ+RkB9rcKx4
         bx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697052833; x=1697657633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx1/Ml+Ow+YrsUi0AyYr7gqYEes6A4dhO7f+fgbb/TQ=;
        b=P5+jYJAvm3hK1xPeaYyAZqn34anYAhXoBzc1R1q9W1wNJbAklwtMtwEFs3luEOKEFH
         6RUm8ukNw3NE7Gnkz/H7XwOu2npVzQRLipMj/sLLJmvaR9IrF5Q9SEMTNnm/hGXGC3Nt
         njhmppatw+q7RVRUjtLq9a6PBfrBsza8l+VtkPX0RaHU7NAChDHYIuUI+aAdnO8aAjOe
         Mcfb9rGmcNNbJg3pOzfLGBdjgAt1FCm/x9MNxODQkJrFt7RmS7i4sUnfT2CFlHUb5hdM
         ksIyVAVtQFMQmX0wcs3NOeF1WWCN20iw+mIkfh9ldfwwh+OX12qC6FHA9fhtli8KWrjV
         60Eg==
X-Gm-Message-State: AOJu0Yx6n0QwxmV0wjiMmbApfARBiswvmZP+drukPNSmfRrVItY4+LXY
	bdHR2OhJST0fI4Qb4FpvnAd/KfdCyclGDaKWxk8=
X-Google-Smtp-Source: AGHT+IFX2L2JO+9DsitRXOCEJuGOBMTObPL9JeYF6EN1empWBDK4Zscq+0kFwjfLa4q2ynedWqkGLee5PLio64QQI5s=
X-Received: by 2002:a05:6870:c6a4:b0:1b0:3637:2bbe with SMTP id
 cv36-20020a056870c6a400b001b036372bbemr27202420oab.54.1697052832684; Wed, 11
 Oct 2023 12:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231011190650.622937-1-daniel.mcgregor@vecima.com>
In-Reply-To: <20231011190650.622937-1-daniel.mcgregor@vecima.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2023 12:33:26 -0700
Message-ID: <CAMKF1sozn5Bgw0Wb0dP9Atu8r7+V=M8jWiG=wQ6KHYGoWPDM-Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pylint: allow native build
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 19:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105438

Thanks for heads up. Armin is planning another downmerge from master
which should cover this too

On Wed, Oct 11, 2023 at 12:07=E2=80=AFPM Dan McGregor <danismostlikely@gmai=
l.com> wrote:
>
> We use pylint for some native recipes in our build. Allow pylint
> to be a native recipe, and likewise allow its runtime dependencies
> to be native recipes.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb  | 2 ++
>  meta-python/recipes-devtools/python/python3-dill_0.3.7.bb     | 2 ++
>  meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb   | 2 ++
>  meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb   | 2 ++
>  meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb | 2 ++
>  5 files changed, 10 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb=
 b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
> index 2f80187b2b2..cdf6fc74edf 100644
> --- a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
> @@ -34,3 +34,5 @@ RDEPENDS:${PN}-tests:class-target +=3D "\
>      ${PYTHON_PN}-unittest \
>      ${PYTHON_PN}-xml \
>  "
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb b/=
meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
> index b6b788110d9..673964f3b70 100644
> --- a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
> @@ -15,3 +15,5 @@ RDEPENDS:${PN} +=3D "\
>      ${PYTHON_PN}-profile \
>      ${PYTHON_PN}-core \
>  "
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb =
b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
> index a2c72fcc997..265b28a7715 100644
> --- a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
> @@ -9,3 +9,5 @@ SRC_URI[sha256sum] =3D "348e0240c33b60bbdf4e523192ef919f2=
8cb2c3d7d5c7794f74009290f
>  inherit pypi setuptools3
>
>  DEPENDS +=3D "${PYTHON_PN}-pytest-runner-native"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb =
b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> index 413e6599db1..bd2faa5b5af 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> @@ -48,3 +48,5 @@ do_install_ptest() {
>      install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PTES=
T_PATH}/tests/.pylint_primer_tests/.gitkeep
>      sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tes=
ts/data/ascript
>  }
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.b=
b b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
> index e86a3c78981..59e83e00db7 100644
> --- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
> @@ -27,3 +27,5 @@ do_install_ptest() {
>          install -d ${D}${PTEST_PATH}/tests
>          cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>  }
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105436): https://lists.openembedded.org/g/openembedde=
d-devel/message/105436
> Mute This Topic: https://lists.openembedded.org/mt/101903777/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

