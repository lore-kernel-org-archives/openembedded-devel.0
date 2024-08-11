Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADB0C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 17:25:38 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.28260.1723397136426252659
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 10:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fg1SbZWG;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5d5cbe88f70so2191089eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723397135; x=1724001935; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgJX6Oov49MsLnI3lAwrEBA4MzsdxvBZP9uqTkhLcxI=;
        b=fg1SbZWGzbQ41AFj/7m29nzLQpOT12C34MPKk1UgNDhBk4iJGkCST/Eb46ew7fGVyZ
         Q/a1cmCr+MxlGt7wp3o9g+LN1bUmPVYWLkG3nx2gMUpqf78uYegx2OSQ8ixYGsu0ZNwL
         Df+oo/heMV704LLCiOgjWptLGh8SAsxWbgpMDnCJchujArgucyFuD1m69FwJSnTD2Yto
         TEcg3kSIevzzGIqFpZT5rbtYbeCQFTAi6AzpbaNVb/O0T2MaDt04uq9mDFhvKauvi1aY
         Y1gHDiMBaWlnOLCqILMj7tbdN66pVuvjiKmobZJGwGGT293N9f8Wd5wXDJlOrklz6j/G
         xr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723397135; x=1724001935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgJX6Oov49MsLnI3lAwrEBA4MzsdxvBZP9uqTkhLcxI=;
        b=w1AgC0bzX6OwOTwVnzTOxqHHlnZ86ZHmkRVleYFq0BLNiZXp/AJWrzrEwBKHoeMfJz
         vrphi96IwiO2xU0ZJXmSbC6Tk8LqLpH5xb19e9lqzxdo/WKjFQWeqDv/n8JHJsRrxSYt
         vBL4IceOpxlEPFFO+WJlmfbF2krXxi8o3qq3kD7GL+2PrrwFWznGPObiSu/pj37Rpfu/
         SdHFnCX8SbQRBDv0z6erCVCxQ6q4pGjYxQRn9KE9GdRNkhwnZO9lIcZFPeAchBHUjt8T
         VHgTUqiyy0yPl8+LJ3QgtEKm7XVxczZZxP1xo10JOgcjc/fhhSo5wQULZchugQAz91VC
         VgEw==
X-Gm-Message-State: AOJu0YwzcbGuW3rDOdas2Xdk+Dg/diLAyAAV44CXTxNb/9cEWCQrnonV
	I0YmlFgGJhoKkhh21kq7oVrt4gSDL2fKc8qO3q3mTdGqzvTRIhctWT9XUWfJgy1I8cBI6zcBCeW
	0Atg2GTHavFlfqdyKKoAcz6HADcM=
X-Google-Smtp-Source: AGHT+IHU45HW89tKssSRP0s9YSeGtHV6UAjQ6U9KvVu9wKdkEGhQpGPc0LPjDmU7e6B/63RCAc1ey+NF230ZlNoJmxw=
X-Received: by 2002:a05:6820:54e:b0:5d5:a343:d135 with SMTP id
 006d021491bc7-5d867c72b1cmr8084443eaf.1.1723397135523; Sun, 11 Aug 2024
 10:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240811060530.34509-1-raj.khem@gmail.com> <CANx9H-BFu9BZ+X1h65ZT0ftRKxt50zCbztzip3KwBq3sQwT-tw@mail.gmail.com>
In-Reply-To: <CANx9H-BFu9BZ+X1h65ZT0ftRKxt50zCbztzip3KwBq3sQwT-tw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2024 10:25:09 -0700
Message-ID: <CAMKF1spC-V1ACgjce72uTZGe0r46UxjwHRZBhb1-Y75NBgnF5g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-daemon: Fix build with PEP-575
 build backend
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 17:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111756

yeah typo

On Sun, Aug 11, 2024 at 10:23=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wr=
ote:
>
> I think you meant PEP-517
>
> https://peps.python.org/pep-0517/
>
> Not PEP-575
> https://peps.python.org/pep-0575/
>
>
>
> On Sat, Aug 10, 2024 at 11:05=E2=80=AFPM Khem Raj via lists.openembedded.=
org <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Apply required backports
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...-packaging-module-instead-of-setupto.patch | 44 +++++++++++++++++++
>>  .../python/python3-daemon_3.0.1.bb            |  3 +-
>>  2 files changed, 46 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-daemon/0=
001-Use-version-from-packaging-module-instead-of-setupto.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-daemon/0001-Use=
-version-from-packaging-module-instead-of-setupto.patch b/meta-python/recip=
es-devtools/python/python3-daemon/0001-Use-version-from-packaging-module-in=
stead-of-setupto.patch
>> new file mode 100644
>> index 0000000000..316f7d9618
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-daemon/0001-Use-versio=
n-from-packaging-module-instead-of-setupto.patch
>> @@ -0,0 +1,44 @@
>> +From b7418ab4a3232431373bf0680c6b74fef06910de Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 10 Aug 2024 22:44:08 -0700
>> +Subject: [PATCH] Use version from packaging module instead of setuptool=
s extern
>> +
>> +Fixes build problems when using PEP-575 build backend
>> +
>> +
>> +Drop the patch on upgrading to >=3D 3.0.2
>> +
>> +Upstream-Status: Backport [https://pagure.io/fork/khemraj/python-daemon=
/c/3bbc46967d35cd7e05677018bdc9d552efaeea3e?branch=3Dmain]
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + test_version.py | 2 +-
>> + version.py      | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/test_version.py b/test_version.py
>> +index c43cd36..d0a124d 100644
>> +--- a/test_version.py
>> ++++ b/test_version.py
>> +@@ -23,7 +23,7 @@ import docutils.writers
>> + import setuptools
>> + import setuptools.command
>> + import setuptools.dist
>> +-from setuptools.extern.packaging.version import InvalidVersion
>> ++from packaging.version import InvalidVersion
>> + import testscenarios
>> + import testtools
>> +
>> +diff --git a/version.py b/version.py
>> +index 20d3ef3..fbdc462 100644
>> +--- a/version.py
>> ++++ b/version.py
>> +@@ -36,7 +36,7 @@ import setuptools.command.build
>> + import setuptools.command.build_py
>> + import setuptools.command.egg_info
>> + import setuptools.dist
>> +-import setuptools.extern.packaging.version
>> ++import packaging.version
>> +
>> +
>> + def ensure_class_bases_begin_with(namespace, class_name, base_class):
>> diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb=
 b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
>> index 715d3bf120..cb85262b41 100644
>> --- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
>> @@ -11,8 +11,9 @@ RDEPENDS:${PN} =3D "python3-docutils \
>>  LICENSE =3D "Apache-2.0 & GPL-3.0-only"
>>  LIC_FILES_CHKSUM =3D "file://README;md5=3Da3a94c615dc969a70525f1eebbacf=
235"
>>
>> -inherit pypi setuptools3
>> +inherit pypi python_setuptools_build_meta
>>
>> +SRC_URI +=3D "file://0001-Use-version-from-packaging-module-instead-of-=
setupto.patch"
>>  SRC_URI[sha256sum] =3D "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fe=
f49131e6464b4dae5"
>>
>>  PYPI_PACKAGE =3D "python-daemon"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111753): https://lists.openembedded.org/g/openembedd=
ed-devel/message/111753
>> Mute This Topic: https://lists.openembedded.org/mt/107836692/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

