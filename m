Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D70CD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 04:58:21 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29737.1779339495283744561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 21:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=zJ0X/da1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 15917C2C64D
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:59:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0BD460718;
	Thu, 21 May 2026 04:58:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3F3A107EA6B3;
	Thu, 21 May 2026 06:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779339492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bYc5QMh0pgHtuNuu19GBvZiJojyT4eunkHsJhVodKr4=;
	b=zJ0X/da1Ux1m1VOlFeMWjELdD3DSt4ziS3GuUOhDi46T9/ebL5D091dxxpw5x3749bG2X0
	Yp+eC1o8C1aaQ+MGxmhHXYb6nbyowOjBmuJ5vviqrjQzZpjsDoOLLow8x0KmvViRO9kHr7
	8/NInmkPMmG5G6PBnFXWI6Fuas9nYdpyidwxf2yVO6SQHiv42ochMdE1b1XKFeDA/BZNYO
	CKhaXVgAVQGeC98/+EaZOq1AeItsXOys5sbpXE5AL6V7DXCCochcjUy6GzGJqOUPRMS8eA
	i+/UZwV6dCFSxRjyHX9axdjaqt3RfWK5aU0kJjhqy3KWkzspMRRK3E2t4aswvw==
Message-ID: <63211b50-dda2-4a12-8053-48248a1087db@bootlin.com>
Date: Thu, 21 May 2026 06:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-python][scarthgap][PATCH] python3-backports-zstd: add
 recipe
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20260519-add-backports-zstd-v1-1-b417d7d9c0eb@bootlin.com>
 <CA+s=J=z4Dpaak7_X7VaP8SnJVSbNG0i9FMndQoY+uxAKFn8Nbw@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>
Organization: Bootlin
In-Reply-To: <CA+s=J=z4Dpaak7_X7VaP8SnJVSbNG0i9FMndQoY+uxAKFn8Nbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127131

On 5/21/26 06:12, Anuj Mittal wrote:
> On Tue, May 19, 2026 at 10:49=E2=80=AFPM J=C3=A9r=C3=A9mie Dautheribes =
via
> lists.openembedded.org
> <jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
>>
>> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jer=
emie.dautheribes@bootlin.com>
>> ---
>> Hello,
>>
>> This patch adds support for the backports-zstd Python module in the
>> Scarthgap branch. The recipe was previously part of the master branch =
but
>> was removed [1] because the module was integrated into the Python stan=
dard
>> library starting from Python 3.14.
>>
>> However, since Scarthgap uses Python 3.12, I believe it is reasonable =
to
>> include this backport for users on this branch.
>>
>> [1]: https://git.openembedded.org/meta-openembedded/commit/meta-python=
?id=3Dd2539548d0c0e0a42a54fd35bb0e039e23396725
>=20
> Please include relevant parts in the commit message so we know why we
> added a new recipe in scarthgap.

Sure, will do in v2, thanks for the review!

>=20
>> ---
>>   ...oml-make-license-entries-compatible-with-.patch | 38 ++++++++++++=
++++++++++
>>   ...ojects.toml-lower-setuptools-requirements.patch | 31 ++++++++++++=
++++++
>>   .../python/python3-backports-zstd_1.5.0.bb         | 21 ++++++++++++
>>   3 files changed, 90 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-backports-zst=
d/0001-pyproject.toml-make-license-entries-compatible-with-.patch b/meta-=
python/recipes-devtools/python/python3-backports-zstd/0001-pyproject.toml=
-make-license-entries-compatible-with-.patch
>> new file mode 100644
>> index 0000000000..3e20085071
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-backports-zstd/0001-=
pyproject.toml-make-license-entries-compatible-with-.patch
>> @@ -0,0 +1,38 @@
>> +From 1114b0d2b60056a3690be1f7629c112cf28ce367 Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9mie=3D20Dautheribes=3D20=3D28=
Schneider=3D20Electric?=3D
>> + =3D?UTF-8?q?=3D29?=3D <jeremie.dautheribes@bootlin.com>
>> +Date: Fri, 15 May 2026 13:39:15 +0000
>> +Subject: [PATCH] pyproject.toml: make license entries compatible with
>> + setputools v69
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The pypropject.toml uses license and license-files entries that are o=
nly
>> +compatible with seuptools >=3D v77, while Yocto Scarthgap only provid=
es
>> +setuptools v69.
>> +
>> +This is the only detected impact, otherwise the do_compile/do_package=
 work
>> +fine.
>> +
>> +Upstream-Status: Inappropriate [specific to OE LTS version]
>> +Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <je=
remie.dautheribes@bootlin.com>
>> +---
>> + pyproject.toml | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/pyproject.toml b/pyproject.toml
>> +index ec9a1ea..18e6816 100644
>> +--- a/pyproject.toml
>> ++++ b/pyproject.toml
>> +@@ -5,8 +5,8 @@ authors =3D [{ name =3D "Rogdham", email =3D "contact=
@rogdham.net" }]
>> + description =3D "Backport of compression.zstd"
>> + readme =3D { file =3D "README.md", content-type =3D "text/markdown" =
}
>> + keywords =3D ["backport", "backports", "pep-784", "zstd"]
>> +-license =3D "PSF-2.0"
>> +-license-files =3D ["LICENSE.txt", "LICENSE_zstd.txt"]
>> ++license =3D { text =3D "PSF-2.0" }
>> ++#license-files =3D ["LICENSE.txt"]
>> + classifiers =3D [
>> +     "Development Status :: 5 - Production/Stable",
>> +     "Intended Audience :: Developers",
>> diff --git a/meta-python/recipes-devtools/python/python3-backports-zst=
d/0002-pyprojects.toml-lower-setuptools-requirements.patch b/meta-python/=
recipes-devtools/python/python3-backports-zstd/0002-pyprojects.toml-lower=
-setuptools-requirements.patch
>> new file mode 100644
>> index 0000000000..7cbeeff61d
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-backports-zstd/0002-=
pyprojects.toml-lower-setuptools-requirements.patch
>> @@ -0,0 +1,31 @@
>> +From 2ab6ba1d48a3d0e13382e346ba0a638548a5513e Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9mie=3D20Dautheribes=3D20=3D28=
Schneider=3D20Electric?=3D
>> + =3D?UTF-8?q?=3D29?=3D <jeremie.dautheribes@bootlin.com>
>> +Date: Tue, 19 May 2026 14:06:43 +0000
>> +Subject: [PATCH] pyprojects.toml: lower setuptools requirements
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Scarthgap provides setuptools v69, so adjust the requirement
>> +accordingly.
>> +
>> +Upstream-Status: Inappropriate [specific to OE LTS version]
>> +Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <je=
remie.dautheribes@bootlin.com>
>> +---
>> + pyproject.toml | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/pyproject.toml b/pyproject.toml
>> +index 18e6816..b5953e2 100644
>> +--- a/pyproject.toml
>> ++++ b/pyproject.toml
>> +@@ -30,7 +30,7 @@ Source =3D "https://github.com/rogdham/backports.zs=
td"
>> + #
>> +
>> + [build-system]
>> +-requires =3D ["setuptools>=3D80"]
>> ++requires =3D ["setuptools>=3D69"]
>> + build-backend =3D "setuptools.build_meta"
>> +
>> + [tool.setuptools.packages.find]
>> diff --git a/meta-python/recipes-devtools/python/python3-backports-zst=
d_1.5.0.bb b/meta-python/recipes-devtools/python/python3-backports-zstd_1=
.5.0.bb
>> new file mode 100644
>> index 0000000000..0c83202b4a
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-backports-zstd_1.5.0=
.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY =3D "Backport of compression.zstd"
>> +DESCRIPTION =3D "Backport of PEP-784 'adding Zstandard to the standar=
d library'"
>> +HOMEPAGE =3D "https://github.com/Rogdham/backports.zstd/"
>> +LICENSE =3D "0BSD & PSF-2.0"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D224f30639105a6ab845e06=
8c2d0903ff \
>> +                    file://LICENSE_zstd.txt;md5=3D85fffd6822a26cd7d2a=
6eeb939ada0da \
>> +                    file://src/c/pythoncapi-compat/COPYING;md5=3Df74f=
54822fab8814a50330e4e4578b88 \
>> +                    file://src/c/zstd/LICENSE;md5=3D0822a32f7acdbe013=
606746641746ee8"
>> +
>> +inherit pypi python_setuptools_build_meta
>> +
>> +SRC_URI +=3D " \
>> +        file://0001-pyproject.toml-make-license-entries-compatible-wi=
th-.patch \
>> +        file://0002-pyprojects.toml-lower-setuptools-requirements.pat=
ch \
>> +"
>> +
>> +SRC_URI[sha256sum] =3D "a5e622a82eb183b4fbe18032755ce0a15fa9a82f2adb9=
b621620b91247aaedb7"
>> +
>> +PYPI_PACKAGE =3D "backports_zstd"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>>
>> ---
>> base-commit: ae7dfb12245c7f9b9a353499e2688015bd4e6413
>> change-id: 20260519-add-backports-zstd-0ccdda4bc156
>>
>> Best regards,
>> --
>> J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremie.dautheribe=
s@bootlin.com>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#127103): https://lists.openembedded.org/g/openembe=
dded-devel/message/127103
>> Mute This Topic: https://lists.openembedded.org/mt/119391866/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [anuj.mittal@oss.qualcomm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
J=C3=A9r=C3=A9mie Dautheribes, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


