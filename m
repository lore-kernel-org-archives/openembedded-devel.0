Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78023C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 04:34:40 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.26598.1655699672643098114
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jun 2022 21:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id AD03DC45;
	Mon, 20 Jun 2022 06:34:30 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.38.235]) by fwd89.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o397N-04i1wH0; Mon, 20 Jun 2022 06:34:29 +0200
Message-ID: <0d6d0ede-720b-176e-c82c-c313c2bceb35@t-online.de>
Date: Mon, 20 Jun 2022 06:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][PATCH] flatbuffers: update to 2.0.6
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20220618220236.2968-1-f_l_k@t-online.de>
 <5719d799-647d-8e67-9f5e-2e83045ae704@gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <5719d799-647d-8e67-9f5e-2e83045ae704@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1655699669-0143AB67-6DF5A11E/0/0 CLEAN NORMAL
X-TOI-MSGID: 71ffaaff-1ec5-4bad-9f94-0e7d4a3999c2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jun 2022 04:34:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97543

Yes, you're right. Python3 is used to call 'scripts/generate_code.py'=20
and is currently using hosts python for that. I guess the correct fix=20
would be to inherit python3native ?

Markus

Am 20.06.22 um 05:47 schrieb akuster808:
> Can you double check this change. I see=C2=A0 python3 package=C2=A0=C2=A0=
 being=20
> included.
>
> -armin
>
> On 6/18/22 15:02, Markus Volk wrote:
>> - fix flatc not found issue
>> - build the python3 module as a separate package to allow proper insta=
ll
>> - remove fpic CXXFLAG as it seems to be unneeded
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>> =C2=A0 ...tbuffers_2.0.0.bb =3D> flatbuffers_2.0.6.bb} | 20 +++++-----=
---------
>> =C2=A0 .../flatbuffers/python3-flatbuffers_2.0.6.bb=C2=A0 | 15 +++++++=
+++++++
>> =C2=A0 2 files changed, 20 insertions(+), 15 deletions(-)
>> =C2=A0 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_2.0.0.=
bb=20
>> =3D> flatbuffers_2.0.6.bb} (62%)
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
>>
>> diff --git=20
>> a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb=20
>> b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
>> similarity index 62%
>> rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
>> rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
>> index bf74f1229..76127000d 100644
>> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
>> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
>> @@ -3,41 +3,31 @@ HOMEPAGE =3D "https://github.com/google/flatbuffers"
>> =C2=A0 SECTION =3D "console/tools"
>> =C2=A0 LICENSE =3D "Apache-2.0"
>> =C2=A0 -inherit python3-dir
>> +PACKAGE_BEFORE_PN =3D "${PN}-compiler"
>> =C2=A0 -PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-${PYTHON_PN}"
>> +DEPENDS =3D "flatbuffers-native"
>> =C2=A0 =C2=A0 RDEPENDS:${PN}-compiler =3D "${PN}"
>> -RDEPENDS:${PN}-${PYTHON_PN} =3D "${PN}"
>> =C2=A0 RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>> =C2=A0 =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>> =C2=A0 -SRCREV =3D "a9a295fecf3fbd5a4f571f53b01f63202a3e2113"
>> +SRCREV =3D "615616cb5549a34bdf288c04bc1b94bd7a65c396"
>> =C2=A0 SRC_URI =3D=20
>> "git://github.com/google/flatbuffers.git;branch=3Dmaster;protocol=3Dht=
tps"
>> =C2=A0 S =3D "${WORKDIR}/git"
>> =C2=A0 =C2=A0 CVE_CHECK_IGNORE +=3D "CVE-2020-35864"
>> =C2=A0 -CXXFLAGS +=3D "-fPIC"
>> -BUILD_CXXFLAGS +=3D "-fPIC"
>> -
>> =C2=A0 # BUILD_TYPE=3DRelease is required, otherwise flatc is not inst=
alled
>> -EXTRA_OECMAKE +=3D "\
>> +EXTRA_OECMAKE +=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCMAKE_BUILD_TYPE=3DRelease \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFLATBUFFERS_BUILD_TESTS=3DOFF \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFLATBUFFERS_BUILD_SHAREDLIB=3DON \
>> =C2=A0 "
>> +EXTRA_OECMAKE:class-target +=3D=20
>> "-DFLATBUFFERS_FLATC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/flatc"
>> =C2=A0 =C2=A0 inherit cmake
>> =C2=A0 -do_install:append() {
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>> -=C2=A0=C2=A0=C2=A0 cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPA=
CKAGES_DIR}
>> -}
>> -
>> =C2=A0 FILES:${PN}-compiler =3D "${bindir}"
>> =C2=A0 -FILES:${PN}-${PYTHON_PN} =3D "${PYTHON_SITEPACKAGES_DIR}"
>> -
>> =C2=A0 BBCLASSEXTEND =3D "native nativesdk"
>> diff --git=20
>> a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb=20
>> b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
>> new file mode 100644
>> index 000000000..cc453da35
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.b=
b
>> @@ -0,0 +1,15 @@
>> +SUMMARY =3D "Memory Efficient Serialization Library - Python3 Modules=
"
>> +HOMEPAGE =3D "https://github.com/google/flatbuffers"
>> +SECTION =3D "console/tools"
>> +LICENSE =3D "Apache-2.0"
>> +
>> +LIC_FILES_CHKSUM =3D=20
>> "file://../LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>> +
>> +SRCREV =3D "615616cb5549a34bdf288c04bc1b94bd7a65c396"
>> +SRC_URI =3D=20
>> "git://github.com/google/flatbuffers.git;branch=3Dmaster;protocol=3Dht=
tps"
>> +S =3D "${WORKDIR}/git/python"
>> +
>> +RDEPENDS:${PN} =3D "flatbuffers"
>> +
>> +inherit setuptools3
>> +
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#97540):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/97540
>> Mute This Topic: https://lists.openembedded.org/mt/91848724/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

