Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108E8C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 15:51:30 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9706.1707753081448016192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 07:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oF1ZhRve;
 spf=pass (domain: linaro.org, ip: 209.85.218.48, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3cc8f0c97fso84196866b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 07:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707753080; x=1708357880; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxFEb5LMN18Ay7NyT290yo3kXqX0j+4tHQphPTF13cU=;
        b=oF1ZhRve2s7ie3vAHnnbHTsFsgpsJJI1A7u+bfd2gAu6QlQFSSlRxenOniub20WRdP
         1frCwN2vW7AZct6SBySZZ1A4QraWJf+x+KBFMeJmrQXa9744AaBusyQLMP0x8gIr86Eu
         vGLnkYa4r7c1lC2XxSkRy0oP1eKK4avSCy3QD8H/hMNSm4j0U0WMcIYmePkWROwgID1V
         fmKlsB65GehsDlLa3/wVDMEAxSKpqgoUp7vbRF/hH+IdGUA82zynaeK5Aqqlgk1GRkrB
         i+rDHtWK5YMT7GwcFllxxomYRpnjmMna/YM3xH+4RRZPpacKsPNcJBBC0ZT9cu1Q3+8R
         +NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753080; x=1708357880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxFEb5LMN18Ay7NyT290yo3kXqX0j+4tHQphPTF13cU=;
        b=XhA/S3XTR6EW7O8RRR2eohUj7iBu6z1eVsedc+uxugY/Biz7IDRm1gpab7xduyom/C
         X48Y5e1N8AQjLiW2i50LbWkAu9sS4JhpZgdhd30io3pLJCpgF/+GVX+psxQXGr1OSLrD
         btYNSLqcEemXaQPI64gkpSnDXS0uwNTkwV8LDWtG5blJCxzqsFmMMZOvrgIugPvqHO7C
         iwctrdF8VtS++sArHRVDRR+naayJ6vrcm6F+OHgQk3jRd8+nt2NofFlCa8somnVvj4js
         1RRV0yE5gxUcsOLvGyLfgNeM31x4Y+Pd18dqXKgZzCDQlvnj1No5Ohq49Htz9uGPlXbW
         6d7w==
X-Gm-Message-State: AOJu0YzmoCsvrD1CO33IE+xTMdr3GWLdCgOC0aQVqhVWnI5TxU7kMahn
	/lBjvX6hRI/M8wJ3cr0ZzudFQNGT6B2e64bIFkwVwZpPQaFWGXRMiyx2z7xjSLscXGdOw1rpPJf
	52Ein7Th8WU4P2NL/dnxB+HxkiNWeFPipHMkWxg==
X-Google-Smtp-Source: AGHT+IE8Y0U+KT2xfbDF6mBAOa9p30cKYuLwvKvKm8x/l++pg2airXH4Hk3T60NOo8CcWH2h7VORYQYC6xPvHOyqf38=
X-Received: by 2002:a17:906:b204:b0:a3c:ea61:9359 with SMTP id
 p4-20020a170906b20400b00a3cea619359mr54006ejz.77.1707753079828; Mon, 12 Feb
 2024 07:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20240212104855.29980-1-fathi.boudra@linaro.org> <CANx9H-BmFtth_m5DHpGEsncjxMayzMuWi9NYX-d42Ohd7X845g@mail.gmail.com>
In-Reply-To: <CANx9H-BmFtth_m5DHpGEsncjxMayzMuWi9NYX-d42Ohd7X845g@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 12 Feb 2024 16:51:08 +0100
Message-ID: <CAGNsrLC7sv12RVwA6Ez3Ke5tJ_jZt9yVHwLyayph4ddvxu=NFg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] whitenoise: add a new recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 15:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108712

Thanks Tim. v2 on its way.

On Mon, 12 Feb 2024 at 16:14, Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Mon, Feb 12, 2024 at 2:49=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro=
.org> wrote:
>>
>> Radically simplified static file serving for Python web apps
>>
>> With a couple of lines of config WhiteNoise allows your web app
>> to serve its own static files, making it a self-contained unit
>> that can be deployed anywhere without relying on nginx, Amazon S3
>> or any other external service.
>>
>> https://whitenoise.readthedocs.io/en/latest/
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  .../0001-add-setup.py.patch                   | 25 +++++++++++++++++++
>>  .../python/python3-whitenoise_6.6.0.bb        | 21 ++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-whitenoi=
se/0001-add-setup.py.patch
>>  create mode 100644 meta-python/recipes-devtools/python/python3-whitenoi=
se_6.6.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-whitenoise/0001=
-add-setup.py.patch b/meta-python/recipes-devtools/python/python3-whitenois=
e/0001-add-setup.py.patch
>
>
> Rather than carry a patch to add deprecated setup.py,
> you can inherit python_setuptools_build_meta according to
> https://github.com/evansd/whitenoise/blob/dbfd5f262f3390bd2304113a1b4eefa=
521056ef4/pyproject.toml#L2
>>
>>
>> new file mode 100644
>> index 0000000000..48a861496e
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-se=
tup.py.patch
>> @@ -0,0 +1,25 @@
>> +From ded40864cd0d74e0881040ed580917128a83f40f Mon Sep 17 00:00:00 2001
>> +From: Sahaj Sarup <sahaj.sarup@linaro.org>
>> +Date: Thu, 16 Mar 2023 05:20:49 +0530
>> +Subject: [PATCH] add setup.py
>> +
>> +Signed-off-by: Sahaj Sarup <sahaj.sarup@linaro.org>
>> +
>> +Upstream-Status: Pending
>> +---
>> + setup.py | 3 +++
>> + 1 file changed, 3 insertions(+)
>> + create mode 100644 setup.py
>> +
>> +diff --git a/setup.py b/setup.py
>> +new file mode 100644
>> +index 0000000..f13cf21
>> +--- /dev/null
>> ++++ b/setup.py
>> +@@ -0,0 +1,3 @@
>> ++from setuptools import setup
>> ++if __name__ =3D=3D '__main__':
>> ++    setup()
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.6.=
0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
>> new file mode 100644
>> index 0000000000..4948977448
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY =3D "Radically simplified static file serving for WSGI applicat=
ions"
>> +AUTHOR =3D "David Evans <d@evans.io>"
>> +HOMEPAGE =3D "https://whitenoise.evans.io"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daba4901cc64e401cea5a267eac2a=
2e1e"
>> +
>> +PYPI_PACKAGE =3D "whitenoise"
>> +
>> +SRC_URI +=3D "file://0001-add-setup.py.patch"
>> +
>> +SRC_URI[sha256sum] =3D "8998f7370973447fac1e8ef6e8ded2c5209a7b1f67c1012=
866dbcd09681c3251"
>> +
>> +inherit pypi setuptools3
>> +
>> +RDEPENDS:${PN}:append =3D " \
>> +    python3-brotli \
>> +    python3-coverage \
>> +    python3-django \
>> +    python3-pytest \
>> +    python3-requests \
>> +"
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#108706): https://lists.openembedded.org/g/openembedd=
ed-devel/message/108706
>> Mute This Topic: https://lists.openembedded.org/mt/104309104/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Fathi Boudra
Principal Engineer | System Technologies Group
Linaro.org | Open source software for ARM SoCs

