Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968BDC54E66
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 01:56:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1659.1710381411509513799
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 18:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=U6s8v0I5;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F2D5887B77;
	Thu, 14 Mar 2024 02:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710381409;
	bh=oXC1ZEso6Y7wiocIh//C5fxG3Bd2f3xbJJ0z8fgt2Ks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U6s8v0I5BsUZLGfd9w/+V/6tCM0v1mB5mC+UoBOHFD1T3l6HMsbbJEMx7xZwAlt3i
	 gQI/gsr/edPiNHwmTJu1MP2+mk7DWRQYcWYrBpSG4uCl64nbIofNyUMkwTfsprB95a
	 imF4+vXDUW6dNXXE5hMYgQeLctDGsp5Vh0erzZS/yzZUqR5bFjmlm2xE4V84N3mgZ7
	 EykCJcF99ej0a8GLfQsI+NnIsYrIfrB8mx4wlvdGl+D89ZQyBZd7mgSQLA3MAzSaOH
	 3KBpT2Zo+LfQqBCvSLEs7+nPsZ+OIfugX6QX2e4tyPILYcBxhTuaJhMdMeedOZV53Q
	 zti92W2+jKWkw==
Message-ID: <f2274cb9-6cd6-46cb-83f3-9f75946eaabf@denx.de>
Date: Thu, 14 Mar 2024 02:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] lvgl: Upgrade to LVGL 9 series
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20240313045038.90500-1-marex@denx.de>
 <20240313045038.90500-3-marex@denx.de>
 <CAMKF1soot4YOaXGQeQJ5xnbwN-TApuALfFyDBLGQ6C=axZAfPA@mail.gmail.com>
 <9351a334-dd37-47d0-bdb4-01e574ba5104@denx.de>
 <CAMKF1sqMtezd5C4RaEFvPpR2mpBSmj2nobTxZSaFYpxsYgCg0g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMKF1sqMtezd5C4RaEFvPpR2mpBSmj2nobTxZSaFYpxsYgCg0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 01:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109309

On 3/14/24 1:53 AM, Khem Raj wrote:
> On Wed, Mar 13, 2024 at 5:43=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
>=20
>> On 3/13/24 6:00 PM, Khem Raj wrote:
>>> Thanks, seeing this QA issue
>>>
>>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3707=
/steps/14/logs/errors
>>
>> Ah, sorry. I see a fix from you already too, thank you !
>>
>> Do you still want a V2 of this series ?
>=20
>=20
> If that=E2=80=99s the only change then no

All right.

