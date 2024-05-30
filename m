Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147E4C25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:13:33 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.262.1717096412676942950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SbQZHPD4;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a2424ecdaso12785967b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717096412; x=1717701212; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eslX9/iE2zzKDf12Qj6HjWypvvk2U9dpVuiZsqsnUM=;
        b=SbQZHPD4l9aDR+RJDM+o//wwWQsnv6NOOKCLHerrMJXBJFYwdQfJL5mFDRTHj/9+cS
         35d/f4b+NrIs0rGznT+JiV9oG5ZL0gtFQpOsAMtwlWhOUMFvnVyrESyO+IoMAWfdXZHy
         tXd+ifvbqL2q3LBJuuZFHn8FBSDO75zi9iuFuA4Is3zTlPaeLPPprC7oO71c9seEuaNb
         xuvylpW7QZlP0QLDbP19WRXOiiJScJW+eS85IV/NSyPWZ/dJnri4q5MnMCA/OcolW0tf
         fOWwBlubJF+Bu6/LpDUR1y74WvB6TlxhC7Jwl+hD4KcduYpvK3VFd6eeLPl4yFkY5LFQ
         aKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717096412; x=1717701212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eslX9/iE2zzKDf12Qj6HjWypvvk2U9dpVuiZsqsnUM=;
        b=M3NhiFimO8dnxqo1orxeIY0iRPv7ey+NKG3ykwMto0ZnYmPzycYJj0EjPv8o98G4Ii
         6jiNBLSd2tNe93VqcWwLqmaWyKsESlf8M0136s54ynxLXmCy9EO+/xBKIkUOUIdIxCSN
         mqce/gVIRzfiJY0qjyZIxKZcm/JIuMGYfkOFp+ivl4Hp1fJVdg1PCHYbEKcoBZ3j+3Ha
         HMvTXlyYvYTCsVtxfMjT4/wWadN9vThw3kVELKSrK3+9YnRK904vLppVjt1rGaMBOT+c
         RzFEY9oyX63YYrPH75prtIBTSlDwKnLX4GprnJOxhcHW3F2t5PZRXdAVc5fzt9iBnnIg
         4HJw==
X-Gm-Message-State: AOJu0YxDOorw8PeMcjs8VcD8ELDyJMtnsuouRJ4ljcxS2kizSatzDSAU
	FErvmFti4s9aJZQK88pHBkBcsH+aSXzPWvCWRWRR/IhNgxyRSu/rl4fmlZ1OIsGTdqfk5ELysgs
	fzxfP/YKH3H6YbFEcsk6jUnqRmhk=
X-Google-Smtp-Source: AGHT+IFOIXcYazmVJSNEVhYc11CymhcxHpUjZ1fIHcP9M0nlTS+85+uL7CtnEOeiQNRuAp4iMA4uBku3oOML/H61jSU=
X-Received: by 2002:a0d:eb42:0:b0:61b:2b7:27d8 with SMTP id
 00721157ae682-62c6bc1495dmr32912087b3.23.1717096411506; Thu, 30 May 2024
 12:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <17D459C574195D27.22027@lists.openembedded.org>
In-Reply-To: <17D459C574195D27.22027@lists.openembedded.org>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Thu, 30 May 2024 21:13:20 +0200
Message-ID: <CABF_=yh3jq-qrS_Z+SrQfxfQzZxTskpEM9D--YKhaKvGD+HK6Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-flask: add ptest
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110642

Question: should I add to the list in
conf/include/ptest-packagelists-meta-python.inc?  Or will the
maintainer do this?
It took about 60sec in qemu on a slow machine.

On Thu, May 30, 2024 at 9:07=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../recipes-devtools/python/python3-flask/run-ptest   |  3 +++
>  .../recipes-devtools/python/python3-flask_3.0.2.bb    | 11 ++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-flask/run=
-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask/run-ptest =
b/meta-python/recipes-devtools/python/python3-flask/run-ptest
> new file mode 100644
> index 000000000..8d2017d39
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flask/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb b=
/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
> index 300ca99dd..99524b437 100644
> --- a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
> @@ -8,10 +8,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dffeffa59=
c90c9c4a033c7574f8f3fb75"
>
>  SRC_URI[sha256sum] =3D "822c03f4b799204250a7ee84b1eddc40665395333973dfb9=
deebfe425fefcb7d"
>
> +SRC_URI +=3D " \
> +        file://run-ptest \
> +"
> +
>  UPSTREAM_CHECK_URI =3D "https://pypi.python.org/pypi/Flask"
>  UPSTREAM_CHECK_REGEX =3D "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
>
> -inherit pypi python_setuptools_build_meta
> +inherit pypi python_setuptools_build_meta ptest
>
>  CLEANBROKEN =3D "1"
>
> @@ -23,3 +27,8 @@ RDEPENDS:${PN} =3D " \
>      python3-profile \
>      python3-werkzeug \
>  "
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110641): https://lists.openembedded.org/g/openembedde=
d-devel/message/110641
> Mute This Topic: https://lists.openembedded.org/mt/106394805/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
an.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

