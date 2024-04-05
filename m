Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E791AC3A59D
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 22:46:34 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.699.1712357184738378932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 15:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hjW7Jp5h;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-22ecd83f1f2so742251fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 15:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712357184; x=1712961984; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONQ7ELkwCqX+0l+0LX09VKwnIlQuXA4v3DY2TSpZYUI=;
        b=hjW7Jp5hHpHhIpUkwsy6Y0qVuyGQGgJ5Spc0JDJI1HschBfc/RydLVGpf0O0GsqAh0
         ltC5u4T59N4hOMYK9mbVp8Tf5moe0iowWtD+jnJ/+o20kgTm0jm/lu38bW5SHmPtRkCk
         KIZjr2MD0MuAoszQ6UFikmgd+U6F3GLshjiYpa9UVWj6QMEkFUXX77dzU80bWQ1/6tAH
         Yw/DWUx/JjEElRD6gPYZm7GjG6uBm2u8mkkSZr6vHfslwuLcSA0u4lJRY0Jcl7HNmoQx
         dSPbHv0AX8irFpHAxaJGTrz/YJPNHpIvvU0xOxa+spJSgq7lnFcipnfoM5I+JM/+yvFv
         YrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712357184; x=1712961984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONQ7ELkwCqX+0l+0LX09VKwnIlQuXA4v3DY2TSpZYUI=;
        b=C8GBddE0zi3GRdilKPw/PLFOQSGwyd7aKaELTveM288/FVm9ERvUQ2mHeHzAy+HZeY
         CleArtDswZyRl98cIhRTcmtZqUDkqLKO6FWxKNp19oubEGRcLuCybwYVvBjXffRkwnXQ
         Dml8bCa1HhbBeruKP8aHG6shMCAUWqHo+poNUurXFyFpI7LwrDakf67BatesfJsoYN+a
         pqZEi0qloDHk/bjcLMZD3LcBARTN78rmURQlHszvGMIOuJX9+oq1EDbtbVc9SJJurytx
         VxzuX+ak2lkSopocdIh0Gos7Q8mLwyLzziF5E6eH0SJrTpiISgZupVIWqRwZlxWt1P08
         AEIg==
X-Gm-Message-State: AOJu0YzVvzwrY3Aj//kgKaNnDUUAsx5qj5UF6SmxGjeCacKdQ5tqRkUc
	e3JJHgtZ0B/mFm4VrMJEb3SNnEL5Tbfieyfc/OR8nUWn1liYop8rLoMwt+cim0QjMpkNLiGzutq
	Sar9QzKeasC6Hik6CBDVrIUfCxBw=
X-Google-Smtp-Source: AGHT+IGON7tM0/D5tCyEpnYZU7Y6si6qBouGmpwQL1j+p360VCZKEpxGOaY71eEe7WtpQfFVRnOmHU+bAJgZEfiZdUE=
X-Received: by 2002:a05:6871:5889:b0:222:a91e:cc1d with SMTP id
 ok9-20020a056871588900b00222a91ecc1dmr2561034oac.4.1712357183938; Fri, 05 Apr
 2024 15:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240405215254.1338168-1-alperyasinak1@gmail.com>
In-Reply-To: <20240405215254.1338168-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2024 15:45:57 -0700
Message-ID: <CAMKF1sp0N4cVm=qmz=Gh6MOQQXgMMtWB-9TAPMd8x-F0O+zjPw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: enable ptest and add
 missing runtime dependency
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 22:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109829

On Fri, Apr 5, 2024 at 2:53=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> w=
rote:
>
> * Ptest tested on qemux86-64 and qemuarm64
>
> * Add ptest into PTESTS_FAST_META_PYTHON
>
> qemux86-64:
>
> Testsuite summary
> TOTAL: 14
> PASS: 14
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 9
> END: /usr/lib/python3-bleak/ptest
> 2024-04-05T18:44
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> qemuarm64:
>
> Testsuite summary
> TOTAL: 14
> PASS: 14
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 8
> END: /usr/lib/python3-bleak/ptest
> 2024-04-05T21:15
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../python/python3-bleak/run-ptest            |  3 ++
>  .../python/python3-bleak_0.21.1.bb            | 29 +++++++++++++++----
>  3 files changed, 27 insertions(+), 6 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-bleak/run=
-ptest
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 2f7babe48..63f312b45 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-ansicolors \
>      python3-asgiref \
>      python3-aspectlib \
> +    python3-bleak \
>      python3-blinker \
>      python3-cachetools \
>      python3-cbor2 \
> diff --git a/meta-python/recipes-devtools/python/python3-bleak/run-ptest =
b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
> new file mode 100644
> index 000000000..8d2017d39
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb =
b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> index 4a1fafb5d..96f3fcbcf 100644
> --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> @@ -3,14 +3,31 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f66=
ed7"
>
> -SRC_URI[sha256sum] =3D "ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727=
035f443a1af5c18f"
> +SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
> +PYPI_SRC_URI =3D "git://github.com/hbldh/bleak.git;protocol=3Dhttps;bran=
ch=3Ddevelop"

why do we need this change if we are not bumping versions ?

>
> -PYPI_PACKAGE =3D "bleak"
> +inherit pypi python_poetry_core ptest
>
> -inherit pypi python_poetry_core
> +S =3D "${WORKDIR}/git"
> +
> +SRC_URI +=3D " \
> +       file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +       python3-pytest \
> +       python3-pytest-asyncio \
> +       python3-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
>  RDEPENDS:${PN} +=3D " \
> -    python3-core (>3.7) \
> -    python3-async-timeout \
> -    python3-dbus-fast \
> +       python3-core (>3.7) \
> +       python3-async-timeout \
> +       python3-dbus-fast \
> +       python3-xml \
>  "
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109828): https://lists.openembedded.org/g/openembedde=
d-devel/message/109828
> Mute This Topic: https://lists.openembedded.org/mt/105358066/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

