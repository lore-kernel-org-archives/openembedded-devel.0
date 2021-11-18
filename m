Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9B8C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 19:47:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.1154.1637264852713284739
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 11:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=JDekF/cw;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5FDDA80A30;
	Thu, 18 Nov 2021 20:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637264849;
	bh=gkKJlcjho1VMyn43rKRWit4EhEYKJGE5lYM/kwmWdJc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=JDekF/cwtoycFbtrAIxqHbgb73lysOaUn9d4C4ZQ6B5wDLxMRZ4bdzDgu5asbY23o
	 7ABlGmGbZp6Mzk2OIYOXYMCkRdA6d3p0pnJS7Wwe8gwyhDdoSw5WVIOyrmTkWSDu/p
	 8md/BVcQNaVgckZV2vlpAH/qeKnMjXtyNvFoEGWPx6fK7PPY+YJL/tN4HyBwWgWwnO
	 6XkIrv29Jki3s3AiYnGuZeo9sNkgsL1JiWF46iRIDg7OUDDzh6pZ8En2+IxYn07jF7
	 n/LbWzYy5UjzsvxAWRhb1wjn6t67H54d4PfXC1fh6kLfM4VflpsbpAQ+jsnkz97IFY
	 vwusfipRGYU7Q==
Subject: Re: [meta-oe][PATCH 4/4] freerdp: Enable NEON SIMD on armv7a and
 armv7ve
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211118175144.1708578-1-marex@denx.de>
 <20211118175144.1708578-4-marex@denx.de>
 <8c1e98e0-d9be-ac5a-4168-c5102f9c3a5e@gmail.com>
 <c353274b-65a0-a15c-cb72-05d16f0db969@denx.de>
 <13bb7bbe-c9d3-d6b8-82e1-b45a9c181938@gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <cf177e69-96e7-4c5e-7c3d-e37e3bc28896@denx.de>
Date: Thu, 18 Nov 2021 20:47:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <13bb7bbe-c9d3-d6b8-82e1-b45a9c181938@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 19:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94054

On 11/18/21 8:15 PM, Khem Raj wrote:
>=20
>=20
> On 11/18/21 11:11 AM, Marek Vasut wrote:
>> On 11/18/21 8:03 PM, Khem Raj wrote:
>>
>> [...]
>>
>>>> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb=20
>>>> b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
>>>> index aba77e20f..571ba5fcb 100644
>>>> --- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
>>>> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
>>>> @@ -30,6 +30,10 @@ EXTRA_OECMAKE +=3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_MANPAGES=3DOFF \
>>>> =C2=A0 "
>>>> +EXTRA_OECMAKE:append:armv7a =3D " -DWITH_NEON=3DON"
>>>> +EXTRA_OECMAKE:append:armv7ve =3D " -DWITH_NEON=3DON"
>>>
>>>
>>> its better to check for neon feature
>>>
>>> EXTRA_OECMAKE:append =3D ${@bb.utils.contains('TUNE_FEATURES', 'neon'=
,=20
>>> ' -DWITH_NEON=3DON', '', d)}
>>
>> Doesn't that enable it for ARMv8a too ?
>>
>=20
> for cortexa32 only.

The neon build is broken on armv8a until freerdp 3.0.0 is out, then we=20
can enable it for armv8a too.

