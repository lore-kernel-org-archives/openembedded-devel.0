Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A17D711D2
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 17:40:46 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.20109.1732124437553642250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 09:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BBvE7KLR;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e5fbc40239so27899b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 09:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732124437; x=1732729237; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maxeg6nSw1j3XrhKLspIuHhL1xRX8ADN4GVqUFIhPCE=;
        b=BBvE7KLRcEbfVHinCJ5JOTnADcPsGOUNHODKyTORpLkMpQmqeEUHLvsmd2e+4b+Qw9
         uabQddnaqMguPLAxaKRYXkQ4MG1ctzlJujJHKvO4ucMycJR8R3KmIIh+dzPtqHewXVHG
         FjpR2IKjrEbXtz/w2qR7kuGBN2kkzGluiO1q3gMXW/hlPs0sZO2JyorZCi0r+hn6QTKz
         +zbYMQ1NFEIWwa79kr+k3ATkO9mz0W0FUSstH2HOWF1iH3+pGNAOdGyj/57spCI6dAsg
         cZ+j+OD5aUZW2jj3FTL1AXyoJB02ANV8OXZD4QcIui8kkKBRxIYeY96PkXyfMi1Xr2fj
         v2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732124437; x=1732729237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maxeg6nSw1j3XrhKLspIuHhL1xRX8ADN4GVqUFIhPCE=;
        b=R7TjFt25ip9AYt0edI5liPNB7ZUiUNnM4GpCbNK3RF1ESi0R25t9Wb1Q+57v9wPYej
         uTUJxmwj5JDhP8tnPKAqWmBshA0hrxX06oKGIJO4o0pB2odbw+OAJ9/gwDgj5bHkD3Vf
         a9XJxfFQB4WljuOY9s1xrWIbO6wU7vh8LT/UISTzJj5/FLFBkiVQqqg9TBkZsv+L6/P4
         y3ouKdB9Jdu3S4v42kcrzlxFwCwUkmKPU2ZjCjxWn5AALxd3aiEOl/buOgr3ifGF2dqT
         XGHlV+oBI1Bxq/fraz/3/BalAj7akWOiYX+G0HDRGGqYSHZbT5E7J7ixZNMdX9Emygq2
         hrxg==
X-Gm-Message-State: AOJu0YxOD/6xamSnG6X45LIoxFIhv2QztNh+xt7MwwIuq/4tl7Pn65qa
	DxjSonScC+xCip5MnMKpvDEuxsh0+U4bTFn1XYC/sDsihX0bMBRPRjd6cW+U5X/TpLDKgBDE44j
	fHcYA+2nMoYs5dmJCflR41rryM/I=
X-Google-Smtp-Source: AGHT+IHCdx7YXJOlv78puScpYz3Pb8E++1GrwgNa0WDFKOLeTcgM1MEgebuNlIAC19z7XlAvL8TJvMuERrbSLHOcsrY=
X-Received: by 2002:a05:6808:2508:b0:3e6:5522:b4d8 with SMTP id
 5614622812f47-3e7eb6f56c3mr4217791b6e.17.1732124436804; Wed, 20 Nov 2024
 09:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20241120082208.1619368-1-martin.jansa@gmail.com>
In-Reply-To: <20241120082208.1619368-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2024 09:40:10 -0800
Message-ID: <CAMKF1squMc9aFOjS=GMZvvwxGRkP86a2peHdSVTuxcCzgyj8cA@mail.gmail.com>
Subject: Re: [meta-oe][styhead][PATCH 1/2] python3-pdm-build-locked: Add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 17:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113932

lgtm

On Wed, Nov 20, 2024 at 12:22=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> * backporting new recipes is against stable policy, but
>   https://git.openembedded.org/meta-openembedded/commit/?h=3Dstyhead&id=
=3Dcb58461c8f9067247d630ec385851ed9c3889f79
>   was backported and added this dependency, so now styhead is failing wit=
h:
>
> ERROR: Nothing PROVIDES 'python3-pdm-build-locked-native' (but
> meta-oe/meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb
> DEPENDS on or otherwise requires it). Close matches:
>   python3-build-native
>   python3-filelock-native
>   python3-pdm-backend-native
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../python/python3-pdm-build-locked_0.3.3.bb        | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pdm-build=
-locked_0.3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pdm-build-locked=
_0.3.3.bb b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.=
3.3.bb
> new file mode 100644
> index 0000000000..f20f11ff44
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.=
bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "pdm plugin to publish locked dependencies as optional-depen=
dencies"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D19382cdf9c143df4f00b9caa0b60c=
75a"
> +
> +SRC_URI[sha256sum] =3D "b784135abf62b93ce0a11332ee24723a2699b7f266fddb79=
50a5b70c93df6214"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +DEPENDS +=3D " python3-pdm-backend-native"
> +
> +PYPI_PACKAGE =3D "pdm_build_locked"
> +
> +BBCLASSEXTEND +=3D "native nativesdk"
> --
> 2.47.0
>

