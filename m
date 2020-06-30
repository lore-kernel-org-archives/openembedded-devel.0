Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.17323.1593529266081784736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 08:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nLQE9CUu;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id e13so18858881qkg.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P3LuRauZNS1XhjZbI06wravgGi81tnwVFa5FOsp7uYU=;
        b=nLQE9CUupl/ofRh7Vw3WVo7IohDuTR9200ooQOmm5Kt67YHBCT1r3EK1N6QoMAMRhp
         8JH/Q7NqNnP+9CZbkmkhTKm97x6B3xed0AvMGt3b8uGAgFlr71fjjcvUjUH2fkdbF8Xc
         7OpYDVh3CU1xSlw7Ezmj152x7D/opgoroDBOfd7tQTntpxG1O7RvUhg7PUh2Ec/ctp63
         f2+v90tvRsBt6wxAmkJUUGxzkcifm7aVPi9AdO2mbrHNmnP4FmCawfKos26IeYowJS5+
         WWbofPd6tavaYQXYlmRNclB8tixe0lcDqn5DogEPBpbaVR+Pnknfvcl6uhCTZ2wYEkkU
         5GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P3LuRauZNS1XhjZbI06wravgGi81tnwVFa5FOsp7uYU=;
        b=dgoYqtoy9Lbbc4kMe7W6HU2Cd+qRK4ByUvcZYBtgzEgeQif3YbV1vezo94bn4oEwiV
         8biyd2o80EWDaWHSkP05fmspvwFYxIfI8sNyE9IwskQ9f4Hb52e96k6z1lBhMhrS2b0+
         akvzxbmppoHHq2GvH5lQRlSUy/phns3+UcCgzF3aCJpe7mU85o8Vv8/XXNKy4/sUKvVF
         ySfHJpKElMYBp2w39Bn7GvCk++twG0dI0K8ECGsn5w4YZfmOOE2AHQbVYwy8x2/F63cA
         5DGRxj7iiABjoOXz+8MgSH3JlmyfVfZkzBo7cm3c9c87bCHM9Y2m6CWeWf1LOWHFVLki
         /zRw==
X-Gm-Message-State: AOAM531PVj4+9MtIhVv+9Bv3pBOqw9Nt2z8RcpXC/jqxj65V1qRl8WOS
	knT/d4MFjdmvCA5OiLmjjlxaNDz4mRcq6lknB/c=
X-Google-Smtp-Source: ABdhPJwiGua6K1m2on+Z0EnjB3rhB4N5YaDYXLN+QN5PsPKEbvs4JvD/f4+ntAMhtc9W66TzMZ4PU/yk+KNmQ9dw/L8=
X-Received: by 2002:a05:620a:148d:: with SMTP id w13mr9636950qkj.215.1593529263835;
 Tue, 30 Jun 2020 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <1593479853-4475-1-git-send-email-zangrc.fnst@cn.fujitsu.com> <1593479853-4475-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1593479853-4475-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 30 Jun 2020 08:00:37 -0700
Message-ID: <CAMKF1sr++fJpuMxPLWaBdgvvvhQoSGJtVSs-0q9yv4cXZGdOGw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-wcwidth: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase it on top of the master and resend.

On Mon, Jun 29, 2020 at 6:18 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python3-wcwidth/run-ptest              |  3 +++
>  .../python/python3-wcwidth_0.2.4.bb               | 15 ++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/=
run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-pte=
st b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//=
g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $=
NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}=
}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.b=
b b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> index 48ff37654..d10f5e69c 100644
> --- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
> @@ -7,6 +7,19 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15979c39a25=
43892fca8cd86b4b52cb"
>  SRC_URI[md5sum] =3D "5e6cd8cd008a7ad2c2578ac49a9d87a1"
>  SRC_URI[sha256sum] =3D "8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f4=
6b235ef2bc650e48f"
>
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI +=3D " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest +=3D " \
> +       ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +      install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>
>
>
>=20
