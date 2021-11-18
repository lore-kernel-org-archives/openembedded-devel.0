Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C66C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 19:11:25 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.610.1637262683488792049
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 11:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=MTOCzhCn;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0033B82F95;
	Thu, 18 Nov 2021 20:11:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637262680;
	bh=P8rVzQbVmDsZCxClEQUcNFduh/2NKoZoxR6E/mu1Ys8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=MTOCzhCnfGz4FsQrL4HWOkyMw69ZciPqvxpOZmv6zlg8VJC4A70lq8qcq18TL9UC1
	 87xEm0Xl1JO09fXu21eMNuBrxARo7IJgpnAZCvxs+YnN3e3y1nGm3dK+5uvgKvDh+6
	 XYhOSS81FWLgs5BnKI73WOi38EybBWWcKeISP0Yh1ZiqzY+FhOZXVboIMtoFuJPpNl
	 Cl7TXdriDJDGZuZKmvvjUhshHN13c7RL0EU0KP5/y6PEn+NubzLwQP9AmAVNQJYO/V
	 UGOsqsNIwN0/dyCbjFs6SFL7Cq2OqjlrbkE+GhnEJ9qev02+vZsupUVD8of0EJOH4R
	 OyUhwbD05PCKw==
Subject: Re: [meta-oe][PATCH 4/4] freerdp: Enable NEON SIMD on armv7a and
 armv7ve
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211118175144.1708578-1-marex@denx.de>
 <20211118175144.1708578-4-marex@denx.de>
 <8c1e98e0-d9be-ac5a-4168-c5102f9c3a5e@gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <c353274b-65a0-a15c-cb72-05d16f0db969@denx.de>
Date: Thu, 18 Nov 2021 20:11:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8c1e98e0-d9be-ac5a-4168-c5102f9c3a5e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 19:11:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94052

On 11/18/21 8:03 PM, Khem Raj wrote:

[...]

>> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb=20
>> b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
>> index aba77e20f..571ba5fcb 100644
>> --- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
>> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
>> @@ -30,6 +30,10 @@ EXTRA_OECMAKE +=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_MANPAGES=3DOFF \
>> =C2=A0 "
>> +EXTRA_OECMAKE:append:armv7a =3D " -DWITH_NEON=3DON"
>> +EXTRA_OECMAKE:append:armv7ve =3D " -DWITH_NEON=3DON"
>=20
>=20
> its better to check for neon feature
>=20
> EXTRA_OECMAKE:append =3D ${@bb.utils.contains('TUNE_FEATURES', 'neon', =
'=20
> -DWITH_NEON=3DON', '', d)}

Doesn't that enable it for ARMv8a too ?

Feel free to pick the first three of these patches if they are OK and=20
I'll respin this one a bit later.

