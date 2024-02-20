Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6765C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 16:45:06 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.17827.1708447498727447721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 08:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WkkPMKX3;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21e7c3e3cf3so3235466fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708447498; x=1709052298; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvCvo+RaXJ2dHblwr22BJpdRxQGM88RjE/ns1gdazCk=;
        b=WkkPMKX3Myl4MUfWdjdysSPvYfYCzltZ9a3fzAbiH8as14MlL8wqMvZ1jgKCKetY5A
         AVoBjjTXZiJf0w6phxNmbGl4aX/64LAzmgSA70E8vPUkAkFBY2Cl2lxF4ApTsH+IjAJD
         5ST9VX09mgHZZsJEIMA/ebjT7Lz4mUGOZBK/drETLfnMguxN+U4Wuxym8eUdZt5ukQd/
         yb6yXD/aSYUGvsfugJy8GFOyCmqkHV5I4Aqd0KbYsk2IqDAZHs1yYvyMeu9UWdWcwW/u
         f7XFeC757VLXtJ8bgn994plfuJcDt8JgKbhT0QJ3mT5/Y/fHKE+MNxv/QUs9XpwK1ecP
         g6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708447498; x=1709052298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvCvo+RaXJ2dHblwr22BJpdRxQGM88RjE/ns1gdazCk=;
        b=oPCYY3vaafiuNQESz+xx2DRA4NS7BqITlLuDCEEH2AFsDErSQCwTFJVueeWT3vx3NH
         UfZv6kBPZVw02xuujrF73x62EAtuWas9ac6ZxpgugnB4Y5zjH1l+BJlrCythRVmIyqd7
         8B6zGS1TclCnP6kK20cMHaJByKIgx04CkmZOwNxqzxHwIqBmmYMuubk/EYy2n+1/7ef6
         P5ZUD8n7voqzN+eDxfrauerEm5JNpcwCArMIefSXTICPsk0Luhc3DFLK1bV31uhh6lSZ
         79JYGuPtEW6x0aOqYaK+dUEs8w5yHv1GdzCx1HJA3WAiytStNx0hY3+5tDQ0VK7oidFp
         ih9w==
X-Gm-Message-State: AOJu0Yw2z/V2MJD7/iQEgq7+q6Nd6eCKLr7hj5xbWLk1cj9NCnLzlhPB
	8zIlLBonuZfCC9ijQk6aDYYx4bQ7i2tFMXvm3mUaxY1MVAkS/+8EZ6BIt5K4yhqxLQH3hCOztWu
	LjFk9gWbrxrPc1VsFyTerG/aMz6Jw25ryY6k=
X-Google-Smtp-Source: AGHT+IGtz+RaegbmjwTCBSBfxarfm6AVfAje5Ck5TJxot2yI1R1jN9b8J/t7z5/1YFmW7lI+TECyvPlzMsoG58P+VNc=
X-Received: by 2002:a05:6871:713:b0:21e:6670:b84a with SMTP id
 f19-20020a056871071300b0021e6670b84amr12333544oap.5.1708447497954; Tue, 20
 Feb 2024 08:44:57 -0800 (PST)
MIME-Version: 1.0
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com> <1708419281-26047-18-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1708419281-26047-18-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2024 08:44:31 -0800
Message-ID: <CAMKF1soKPqH-sMA7ryLJM0scqmNOwNs4QCurXxC-5KaCSrFsgA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 18/26] python3-sentry-sdk: upgrade
 1.40.0 -> 1.40.4
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 16:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108950

please rebase this patch on current master-next branch and resend.

On Tue, Feb 20, 2024 at 12:55=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Only start metrics flusher thread on demand
> -Bump checkouts/data-schemas from aa7058c to 6121fd3
> -Turn off metrics for uWSGI
> -Minor improvements
> -test: Fix pytest error (#2712)
> -build(deps): bump types-protobuf from 4.24.0.4 to 4.24.0.20240129
> -Fix uWSGI workers hanging
> -Make metrics work with gevent
> -Guard against engine.url being None
> -Fix performance regression in sentry_sdk.utils._generate_installed_modul=
es
> -Guard against Sentry initialization mid SQLAlchemy cursor
> -Fix yaml generation script
> -Fix AWS Lambda workflow
> -Bump codecov/codecov-action from 3 to 4
> -Bump actions/cache from 3 to 4
> -Bump actions/checkout from 3.1.0 to 4.1.1
> -Bump github/codeql-action from 2 to 3
> -Bump actions/setup-python from 4 to 5
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ython3-sentry-sdk_1.40.0.bb =3D> python3-sentry-sdk_1.40.4.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.40.0.bb=
 =3D> python3-sentry-sdk_1.40.4.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.=
0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0=
.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.b=
b
> index ec59c712b..cc27b6fd6 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
> @@ -15,7 +15,7 @@ RDEPENDS:${PN} +=3D "\
>         ${PYTHON_PN}-datetime \
>  "
>
> -SRC_URI[sha256sum] =3D "34ad8cfc9b877aaa2a8eb86bfe5296a467fffe0619b931a0=
5b181c45f6da59bf"
> +SRC_URI[sha256sum] =3D "657abae98b0050a0316f0873d7149f951574ae6212f71d2e=
3a1c4c88f62d6456"
>
>  PYPI_PACKAGE =3D "sentry-sdk"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108936): https://lists.openembedded.org/g/openembedde=
d-devel/message/108936
> Mute This Topic: https://lists.openembedded.org/mt/104464225/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

