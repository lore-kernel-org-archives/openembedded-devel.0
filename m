Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2722DC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 17:34:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.27548.1682616865680435856
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 10:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=SF/Ngw+V;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RHYKQn115919;
	Thu, 27 Apr 2023 12:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682616860;
	bh=yCBFIHjclzVachePia6wSK/8AGCT8r+puOXzWBqGjuk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SF/Ngw+Vo4hkNossnSFR5Itf1PpOBFBf2X3sdGYgURwqlb/mdB69GtOnsLiEfD9UZ
	 8diPqp2VnzJXjffapdtdawWO7zVj3fAq8meJ2YONrDM/5ZfdAMRDRWC6od44BPZ1S7
	 uyt1F7Xg4sY7D0RYxrXCeQ91ofQ1ZeWi0XhB3ODM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RHYKfI064516
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 12:34:20 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 12:34:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 12:34:20 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RHYKev068376;
	Thu, 27 Apr 2023 12:34:20 -0500
Message-ID: <5edc6746-3944-f358-1a49-06e67ff616ad@ti.com>
Date: Thu, 27 Apr 2023 12:34:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [meta-oe][kirkstone][PATCHv2] glfw: add
 packageconfig and wayland dependencies
Content-Language: en-US, en-US-large
To: Khem Raj <raj.khem@gmail.com>
CC: <afd@ti.com>, <akuster808@gmail.com>, <detheridge@ti.com>,
        <reatmon@ti.com>, <denis@denix.org>,
        <Openembedded-devel@lists.openembedded.org>
References: <20230427164723.863197-1-rs@ti.com>
 <CAMKF1so-36v9=sJqy+-AN1Y-qSVCgLNTeueci9=Hyy3RSWM9Fw@mail.gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CAMKF1so-36v9=sJqy+-AN1Y-qSVCgLNTeueci9=Hyy3RSWM9Fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 33RHYKQn115919
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 17:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102218

On 4/27/23 11:53, Khem Raj wrote:
> On Thu, Apr 27, 2023 at 9:47=E2=80=AFAM <rs@ti.com> wrote:
>>
>> From: Randolph Sapp <rs@ti.com>
>>
>> GLFW has the ability to use a wayland backend. This patch adds a confi=
g
>> for it, but does not enable it by default because it has a dependency =
on
>> extra-cmake-modules which is provided (most commonly) by meta-qt5-extr=
a.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-c=
ore/glfw/glfw_3.3.bb
>> index b31bba6b6b..5b0d61241e 100644
>> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
>> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
>> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLFW=
_BUILD_DOCS=3DOFF"
>>
>>   CFLAGS +=3D "-fPIC"
>>
>> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcurso=
r"
>> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>> +DEPENDS =3D "libpng libglu zlib"
>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>> +
>> +# upstream considers x11 and wayland backends mutually exclusive and =
will
>> +# prioritize wayland if it is enabled, but wayland has dependencies t=
hat cannot
>> +# be satisfied by this layer so it is disabled by default
>> +
>> +PACKAGECONFIG ??=3D "x11"
>> +
>> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland wayland-=
native wayland-protocols extra-cmake-modules libxkbcommon"
>=20
> I wonder if extra-cmake-modules recipe is common enough to live in meta=
-oe

I'd be happy to offer up a recipe loosely based on what we've got in=20
meta-arago if you think it's worth it, but it seems to be mostly KDE=20
specific excluding this weird instance and a handful of desktop=20
applications that aren't packaged by oe-core or meta-oe.

>> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
>>
>>   COMPATIBLE_HOST:libc-musl =3D "null"
>> --
>> 2.40.0
>>


