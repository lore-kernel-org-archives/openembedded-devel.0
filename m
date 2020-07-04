Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.20699.1593876621808317912
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2020 08:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RqMwQHgX;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b185so20668656qkg.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2020 08:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vLT552wP6JOcUxjqkCrKrJ+N3vQwubMiXu/LFHussCU=;
        b=RqMwQHgXeXYglKTgMGIGer4f4PEuXJC7lxz6W5HVnEU/IXCy++P4SQXN9vI0akAOcW
         mfryet1KgXiWjSS6I5pCBl1i7GEsPmDp+fj7AoEAYkExeaCQofoAR4c/YHSsEs12+uYh
         30j1R2jvZrxVJH2iN4IahfdZtIlj4H8X7W5fqw8zEV33QJ1hnZDZU2/jNv51EBLJd1lH
         aUeOnOeAysaxUaYGJX9Dt1/0qhyZ+inWGOKikyU50epPNO6pVbIXTSgvi7oNekj0Sl+U
         eSWLy+pT3HVZo7LiJ40Wj0xpHDfXnbK9N0TU6kokjSz88DYWvUAAnxuiB7nTVTbN3+EI
         LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vLT552wP6JOcUxjqkCrKrJ+N3vQwubMiXu/LFHussCU=;
        b=rOO4RIys9ou3M+WcRTXfHt3szgnvm6NDlwinFfsIjOYV515DurVbGO9ptFfkFmkPXZ
         WFlJ+iMIz1Wo4I1wnRfcxfpD3HLMErtHubQ+wVKd76O5ABdhjsExHfYvm8p8w0LH3qOs
         ijzjwqCx4tpduYxcTWg7Wn/coS8LIAKd9MkChhW4qVPE61FGfPo4lA+LDWSDNpCEc4KV
         wpbGTQMdlw8vucvcZEUJnRjgbh3FHFEHqTpi22KWKbr7POTuQph+LhSotgmqzlO7tFDz
         DeUYhUGyMxyGU6Zy1KAO7P4ZgQoiFb65kICBv2O6yZxCVZHrfFP0ycDrciXD8hVtlcvW
         2Gig==
X-Gm-Message-State: AOAM531PRfi6qu8hf310PwcppuEwHqguMduj93jiVIhzjKBYE0FK9bOy
	a58szezUyncYZUDJ3ADznwMV81j4kGpe7/h3lMk=
X-Google-Smtp-Source: ABdhPJzuibGNJ8qnWIcbeBdKVxqC/Nk/zwUS/fFeaXl99FgzR0M8pSnQgv3mQAMuvi9Nh2GGEvHFeNuGrjql5DEHXUQ=
X-Received: by 2002:a05:620a:148d:: with SMTP id w13mr30444602qkj.215.1593876620786;
 Sat, 04 Jul 2020 08:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200703155514.39291-1-sakib.sajal@windriver.com>
In-Reply-To: <20200703155514.39291-1-sakib.sajal@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Jul 2020 08:29:54 -0700
Message-ID: <CAMKF1soK06SB3+6LDEM-fGZB9=cbGk0RFErbkwvg_CN15-3UbA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-requests-toolbelt: add ptest
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing this error

ERROR: Nothing RPROVIDES 'python3-mock' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/r=
ecipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python3-requests-toolbelt' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/r=
ecipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
RDEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'python3-requests-toolbelt-dev' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/r=
ecipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
RDEPENDS on or otherwise requires it)

On Fri, Jul 3, 2020 at 8:55 AM Sakib Sajal <sakib.sajal@windriver.com> wro=
te:
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../python/python3-requests-toolbelt/run-ptest  |  3 +++
>  .../python/python3-requests-toolbelt_0.9.1.bb   | 17 +++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-requests=
-toolbelt/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbe=
lt/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbel=
t/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-=
ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//=
g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $=
NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}=
}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbe=
lt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt=
_0.9.1.bb
> index 3beb39718..e075c019d 100644
> --- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.=
1.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.=
1.bb
> @@ -5,12 +5,25 @@ AUTHOR =3D "Ian Cordasco, Cory Benfield"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246ca=
f571"
>
> +SRC_URI =3D "file://run-ptest \
> +          "
> +
>  SRC_URI[md5sum] =3D "b1509735c4b4cf95df2619facbc3672e"
>  SRC_URI[sha256sum] =3D "968089d4584ad4ad7c171454f0a5c6dac23971e9472521e=
a3b6d49d610aa6fc0"
>
> -inherit setuptools3
> -inherit pypi
> +inherit pypi setuptools3 ptest
>
>  RDEPENDS_${PN} +=3D " \
>      ${PYTHON_PN}-requests (>=3D2.0.1) \
>  "
> +
> +RDEPENDS_${PN}-ptest +=3D " \
> +       ${PYTHON_PN}-pytest \
> +       ${PYTHON_PN}-betamax \
> +       ${PYTHON_PN}-mock \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.27.0
>
>=20
