Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A514DEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 18:29:05 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15153.1687199342559435910
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 11:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=y+YyKJTk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35JISwoD012982;
	Mon, 19 Jun 2023 13:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687199338;
	bh=zAn9HiSZl6Khtt8NwDMrHJyok1Fe3rpAQDuDTUaddzs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y+YyKJTkM11U9xYUT+9+u8yNzrAbhc+ArhpcIH+DdyTfxaQiY3JVv2SrrmDMTzEh5
	 uHe1sB+6Hzu1jfDPv6nljXN5hr0xJu0uKpjw7ib8w6PKBKXPE/VMuA2rLs3aM2m1PT
	 9Vr/odMMQmto2fDBGeIr+LzNtHGRg6kwn4pA91rs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35JISwPC087873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Jun 2023 13:28:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Jun 2023 13:28:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Jun 2023 13:28:58 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35JISvsw059484;
	Mon, 19 Jun 2023 13:28:57 -0500
Message-ID: <116e4ca5-ec94-5569-3282-20b20dcdc9e3@ti.com>
Date: Mon, 19 Jun 2023 13:28:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCH 0/6] Backport
 everything relevant to using cts with Weston >= 10
To: akuster808 <akuster808@gmail.com>, <raj.khem@gmail.com>, <afd@ti.com>,
        <denis@denix.org>
CC: <Openembedded-devel@lists.openembedded.org>
References: <20230615205637.724348-1-rs@ti.com>
 <dddc3e26-aa69-2b49-819a-a461581aed15@gmail.com>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <dddc3e26-aa69-2b49-819a-a461581aed15@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 35JISwoD012982
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 18:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103442

On 6/17/23 13:07, akuster808 wrote:
> On 6/15/23 4:56 PM, Randolph Sapp via lists.openembedded.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>> Backport everything relevant to getting opengl-es-cts up and running o=
n
>> newer versions of wayland protocols and subsequently Weston 10.
> Weston 10 was released months before Kirkstone released so IMHO there=20
> was ample of time to get needed packages updated prior to release.=C2=A0=
 This=20
> does not sound like bug fixes.
>=20
> Nacking series.
>=20
> - armin
>=20

Sounds like an awful lot of speculation, have you tried running the=20
current version of opengles-cts on Weston 10? :)

Anyways, here's the exact upstream commit required for Weston 10+=20
support [1]:
745d68215ebcfaf7fdb2a460447a0b6da3fda85a

Here's the list of tags that has it currently:
opengl-cts-4.6.3.0
opengl-cts-4.6.3.1
opengl-cts-4.6.3.2
opengl-cts-4.6.3.3
opengl-es-cts-3.2.9.0
opengl-es-cts-3.2.9.1
opengl-es-cts-3.2.9.2
opengl-es-cts-3.2.9.3
vulkan-cts-1.3.3.1
vulkan-cts-1.3.4.0
vulkan-cts-1.3.4.1
vulkan-cts-1.3.5.0
vulkan-cts-1.3.5.1
vulkan-cts-1.3.5.2
vulkan-cts-1.3.6.0

Hence the version bump.

[1]=20
https://github.com/KhronosGroup/VK-GL-CTS/commit/745d68215ebcfaf7fdb2a460=
447a0b6da3fda85a

Randolph

> [snip]


