Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5AAC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 21:47:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1167.1709675272201556133
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 13:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=V4BMczi6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425Llojk104069;
	Tue, 5 Mar 2024 15:47:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709675270;
	bh=PIvH7CVka6nR3JSz6mpcjI8dv0+cjWAsd3M6Pk4eqYk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V4BMczi6Ol1+yA0mozeSpPZ7hl2QDif1TWf8ZS5eHWOTmGIDdyVuQvy43GyaZIJEj
	 Y7DTqLphqiMTDedyiswwPU7Uwgv5zKmrbaaPd6+UsE1mE8LwGqpC2zQJHBlD5qZ4hy
	 nHJ6QlAaJGkGIf0FAka3GahGAoYMvU5av4sqBJHI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425Llo4A102371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 15:47:50 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 15:47:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 15:47:50 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425Lloo3042599;
	Tue, 5 Mar 2024 15:47:50 -0600
Message-ID: <aaa031a7-b2c5-4df5-9217-254bd68973ce@ti.com>
Date: Tue, 5 Mar 2024 15:47:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH 0/2] glmark2: fix an issue with eglconfig
 scoring
Content-Language: en-US, en-US-large
To: Martin Jansa <martin.jansa@gmail.com>
CC: <raj.khem@gmail.com>, <Openembedded-devel@lists.openembedded.org>,
        <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
References: <20240305212609.2054938-1-rs@ti.com>
 <CA+chaQdaNgrihtzBvoWvdkNTYq8QMhf4B9mcfX5UPyhFiuahiw@mail.gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CA+chaQdaNgrihtzBvoWvdkNTYq8QMhf4B9mcfX5UPyhFiuahiw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 425Llojk104069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 21:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109136

On 3/5/24 15:42, Martin Jansa wrote:
> Invalid format of Upstream-Status and please squash those 2 commits as
> they don't make sense separately.
>=20
> On Tue, Mar 5, 2024 at 10:26=E2=80=AFPM Randolph Sapp via
> lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>>
>> From: Randolph Sapp <rs@ti.com>
>>
>> Backport a patch from the upstream glmark2 package to fix 2 primary is=
sues:
>>
>> 1. Configs with stencil components were ranked unnecessarily low.
>> 2. If the target config was below 0 an optimal config may not be prope=
rly
>> selected.
>>
>> Randolph Sapp (2):
>>    glmark2: add upstream patch to not care about stencil config
>>    glmark2: add the stencil config patch to the package
>>
>>   ...y-default-don-t-care-about-the-stenc.patch | 103 ++++++++++++++++=
++
>>   .../recipes-benchmark/glmark2/glmark2_git.bb  |   1 +
>>   2 files changed, 104 insertions(+)
>>   create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-GLVi=
sualConfig-By-default-don-t-care-about-the-stenc.patch
>>
>> --
>> 2.44.0

Roger. Would the correct status be:

 > Upstream-Status: Backport [5f23d540342ba69e12afeb6a1ac4f6fd36747975]

(Reading the docs I was not aware the brackets were supposed to be=20
included...)

