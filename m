Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F53C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 21:53:11 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.111.1745617987681840398
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 14:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egFl9bCj;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6063462098eso1760445eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745617987; x=1746222787; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCiXwt6M/+28cCOx95m0queZFahXq5gnIexEjIdlHSk=;
        b=egFl9bCj732DLRG1rAGQfuKN0nJHkecMHHGlUUKq22BVUF7fl5NG/6i1+Jepz5cJwW
         FJqZGSuBdIquWl2WDea2tEVEaCWHq/Qe05Fe+QJff9tp1vSsT0sdJ0ub89bmKdsjO/1G
         G53EwFecl4lU0LeKKhIf4mBJW2rdPjl5Vn3cOwxQZmx/3gA01IsmvdpRbI4HmcvC56Oo
         bUSJQinefFplWsdbPJjcaT5dUF8gQqxyiYHS3gZdxifOf/eEwhrea5NJfLqUmtlmL1zm
         qjmFRzyyRphvX9/F9ZhiwxqeCcwaZI/KO9nfDFCVd6qwfBhaMgFJ84KBj3sM4Pglpf1t
         905A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745617987; x=1746222787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCiXwt6M/+28cCOx95m0queZFahXq5gnIexEjIdlHSk=;
        b=a9ev/27VjzehJRWC6h/OnZ6E+iaBX/06656gw3uXzGCILAcy9oDb4T7z15nFqAG3lF
         zyJn1ZwwdjDTpgvcyEFUB+xrwuU5c8adAmow5HfOev86eqEbp1FEtPGRYMxAPbDuPHtP
         3D1LfyGUuccVNHMuGYdIvvWnVaftZkBDeZZCpqGOLy3dv6fSW5f7JaqH532C7PUWEo/x
         BJQdtffqA0a5HSEVg3Wi2SryN66fXKfEqSOUVTsh5SDhR82YwKH13T1gGmG4RMtTiK4Q
         kB82dqqoHstY1lCDscvYatOPbU08iCXzy5/+aUywy4NmpIth8bSfqgZvWgJyNQRkvonX
         nTFQ==
X-Gm-Message-State: AOJu0Yy7yB2r8a6x1GFqtLyKyWKpcVRZr3jy6Ex2IBa6h0rAvp0AieCX
	QBWn2aFRh6fYX4uYiNBIdLuZjE2Xvpzk7U7GlxJgSqEw0f8PRDJdWJUSm7719xVqw4l4jvhMxkF
	voQwBraLsah8QHzmrOvBdIKIKK7KafF4KIiM=
X-Gm-Gg: ASbGncvpiU7VcWQYOBbr/UYJfBxvsMXgfgT6YvJcIXJo8C+PEfZHlInG86JhU/MXqGg
	O9Z94RCsykM0opv1nYwnfWS2dvsJtRs9BKjOBLSWJ4rKTOv5+oReejzWPN4g7BVBEfmsZv3nkBQ
	JnU+Z49QABULzocCsOPMRPQw==
X-Google-Smtp-Source: AGHT+IHdmm2wRGcPiR7KAQ8ixb0NThZ5O+0M+8MFZ4Ccw/9Pzr7G6seJ5NSVVv4YH+Yle+hVcjwGNXhdpQScJPskgbc=
X-Received: by 2002:a05:6870:2045:b0:2a7:d856:94a with SMTP id
 586e51a60fabf-2d99d86712cmr2219215fac.22.1745617598926; Fri, 25 Apr 2025
 14:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <87f53b1d-2646-4bf9-87db-34a4d0bc275a@gmail.com> <6525.1745594031172178467@lists.openembedded.org>
In-Reply-To: <6525.1745594031172178467@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 14:46:13 -0700
X-Gm-Features: ATxdqUFplPjMqAcWfd2vcK4PhyE_oSpIdCF4D2qzD_xODnmJ-ENRpDfZjIP_n1I
Message-ID: <CAMKF1sr_MwfC=dgu5MObrB1S=Xm_kZbWVvO2YooKCNd5qzu+-Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi: add FastAPI (0.115.2)
To: fleuryhugo7@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 21:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117137

On Fri, Apr 25, 2025 at 8:13=E2=80=AFAM Hugo via lists.openembedded.org
<fleuryhugo7=3Dgmail.com@lists.openembedded.org> wrote:
>
> Added tests and fixed the issue related to ${PYTHON_PN}.
>
> Signed-off-by: Hugo FLEURY <fleuryhugo7@gmail.com>
> ---
>  .../python/python3-uvicorn/run-ptest          |  6 +++
>  .../python/python3-uvicorn_0.34.2.bb          | 37 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn/r=
un-ptest
>  create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0=
.34.2.bb
> diff --git a/meta-python/recipes-devtools/python/python3-uvicorn/run-ptes=
t b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
> new file mode 100644
> index 0000000000..d75b4cd4c9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uvicorn/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +# based on the gunicorn ptest
> +echo "nameserver 8.8.8.8" >> /etc/resolv.conf
> +
> +pytest
> diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.b=
b b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb
> new file mode 100644
> index 0000000000..cd2691a5ee
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.34.2.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "Lightning-fast ASGI server implementation."
> +HOMEPAGE =3D "https://www.uvicorn.org/"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D5c778842f66a649636561c423c=
0eec2e"
> +
> +SRC_URI[sha256sum] =3D "0e929828f6186353a80b58ea719861d2629d766293b6d19b=
af086ba31d4f3328"
> +
> +inherit pypi python_hatchling python_setuptools_build_meta ptest
> +
> +SRC_URI +=3D "file://run-ptest"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    python3-pytest \
> +    python3-httptools \
> +    python3-dotenv \


I am seeing

ERROR: Nothing RPROVIDES 'python3-dotenv' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-uvicorn_0.34.2.bb
RDEPENDS on or otherwise requires it)

dotenv module is built via meta-virtualization, so perhaps its better
to bring it to meta-python perhaps since meta-python does not depend
on meta-virtualization.


> +    python3-httpx \
> +    python3-pyyaml \
> +    python3-websockets \
> +    python3-a2wsgi \
> +    python3-pytest-mock \
> +"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +PYPI_PACKAGE =3D "uvicorn"
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-typing-extensions \
> +    python3-click \
> +    python3-h11 \
> +    python3-anyio \
> +"
> +
> +S =3D "${WORKDIR}/uvicorn-${PV}"
> --
> 2.43.0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117129): https://lists.openembedded.org/g/openembedde=
d-devel/message/117129
> Mute This Topic: https://lists.openembedded.org/mt/112415221/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

