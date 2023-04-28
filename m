Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9A0C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 16:32:10 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.24799.1682699526833975334
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 28 Apr 2023 09:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=o2e2i19s;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33SGW3fp107033;
	Fri, 28 Apr 2023 11:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682699523;
	bh=nfhPQ0Cb46XmAK0NF1vkOkhKysYacO8csvMDqzGcFig=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=o2e2i19sWQG10kgr5xT3MBxos294dreEEUKr1o85zlPX8MNjrLwDOn69RGbwxSLQj
	 IVGWz/n+Gyl0OGBBzTI4gnVxZQPxmqXr49n0pbTEoHcib/2HtqDaOIn228zL2sbN9a
	 dhFadpn4GBwnKofWO0pVwnJXAkd+ARDIiOJNocwE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33SGW3Bp025588
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Apr 2023 11:32:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Apr 2023 11:32:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Apr 2023 11:32:03 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33SGW2HL088891;
	Fri, 28 Apr 2023 11:32:02 -0500
Message-ID: <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com>
Date: Fri, 28 Apr 2023 11:32:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [meta-oe][kirkstone][PATCHv2] glfw: add
 packageconfig and wayland dependencies
Content-Language: en-US, en-US-large
To: akuster808 <akuster808@gmail.com>, <raj.khem@gmail.com>, <afd@ti.com>,
        <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <Openembedded-devel@lists.openembedded.org>
References: <20230427164723.863197-1-rs@ti.com>
 <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 33SGW3fp107033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Apr 2023 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102225

On 4/28/23 06:16, akuster808 wrote:
> Doesn't this need to land it Master first? Kirkstone is in the subject
>=20
> - armin
>=20

Perhaps, but I've only had a chance to test it against kirkstone so I=20
flagged it as such. At this point I'm still vetting solutions to this=20
dependency chain though. Looking for something this layer would actually=20
like to carry.

> On 4/27/23 12:47 PM, rs@ti.com wrote:
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
>> =C2=A0 meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
>> =C2=A0 1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb=20
>> b/meta-oe/recipes-core/glfw/glfw_3.3.bb
>> index b31bba6b6b..5b0d61241e 100644
>> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
>> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
>> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON=20
>> -DGLFW_BUILD_DOCS=3DOFF"
>> =C2=A0 CFLAGS +=3D "-fPIC"
>> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcurso=
r"
>> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>> +DEPENDS =3D "libpng libglu zlib"
>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>> +
>> +# upstream considers x11 and wayland backends mutually exclusive and=20
>> will
>> +# prioritize wayland if it is enabled, but wayland has dependencies=20
>> that cannot
>> +# be satisfied by this layer so it is disabled by default
>> +
>> +PACKAGECONFIG ??=3D "x11"
>> +
>> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland=20
>> wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
>> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
>> =C2=A0 COMPATIBLE_HOST:libc-musl =3D "null"
>=20


