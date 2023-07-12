Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B159EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 07:44:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.2252.1689147873115940981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 00:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=BI+evaIU;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 63456868F9;
	Wed, 12 Jul 2023 09:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1689147869;
	bh=bIYImpVzg2izsGLCmoK8qmMcUDiYj3oEVuS2wv6lYC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BI+evaIU2P6o25GRm+6UXlxcp1yPC8hITpfgqo6cV3D5Z1qy3mSKrKq3q8kUmaign
	 oOQmjE9CyppPqcWwTmY/+iVi8UIWT0hzXBBW6DSnzDw//UZPi0MopATPXE0ft0ciZ6
	 r/1twm7pHqk3rkC/DQt/AW+bX4MwlUQPAEZYJBsU+XomsFuftgvLra+uEMJT/EoY9g
	 Ou1tF5JPDXolxnUexJZAZAB5RlGTTW9w70o8ZqTuZnCMfyZ6JWCI01WKuoWnsnhgPc
	 OdKGO9yEgLbs7UYzvzRVyLr+Mz2tN/d+7POif0CpWyN/J54Wwo5H3kjtQex7PFiWng
	 os09FpvUs1g3w==
Message-ID: <9f17d6d2-66fb-aae8-f982-cf3d517fdfc5@denx.de>
Date: Wed, 12 Jul 2023 09:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-oe][PATCH 1/2] libiio: update to version 0.25
To: Paul Cercueil <paul@crapouillou.net>,
 Martin Siegumfeldt <mns@gomspace.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 Christian Eggers <ceggers@arri.de>
References: <20230712011122.105264-1-marex@denx.de>
 <CAMKF1soi0_gwwkqV26a6HJ3oEo__=5LdugShV_MkQMVeZmWRCQ@mail.gmail.com>
 <AM0PR09MB3988DFDE6AFBFBF4A7DF5078AF36A@AM0PR09MB3988.eurprd09.prod.outlook.com>
 <581dd812-873e-eb56-50cc-7b03de57799a@denx.de>
 <179dcdfa3b51fc0b7b7426f041fd23bb17ebfa17.camel@crapouillou.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <179dcdfa3b51fc0b7b7426f041fd23bb17ebfa17.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103835

On 7/12/23 09:35, Paul Cercueil wrote:
> Hi,
>=20
> Le mercredi 12 juillet 2023 =C3=A0 09:25 +0200, Marek Vasut a =C3=A9cri=
t=C2=A0:
>> On 7/12/23 08:40, Martin Siegumfeldt wrote:
>>> On Tue, Jul 11, 2023 at 6:11=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
>>>>
>>>> The version 0.25 has been released, it has not been tagged
>>>> however.
>>>> Update the this version anyway.
>>>
>>> hmm how do we know where to peg SRCREV ? I wonder if we should wait
>>> for tag to appear.
>>
>> The 0.24 appeared on matching commit
>> "CMake: Bump version to v0.24"
>> Same for 0.23, 0.22, 0.21. 0.20 was not tagged like this 0.25. 0.19
>> was
>> tagged again etc.
>>
>> I think it is safe to assume the tag was just missed or not pushed,
>> but
>> I planned to ping Paul about it. Might as well add Paul to CC help
>> and
>> ask that way.
>>
>> Paul, is the libiio 0.25 tag just missing ?
>>
>>> I agree in waiting for tag to be published.
>=20
> Yes, please wait for the tag. The commit that bumps the version number
> in the CMake script is not necesarily the top commit at each release.

Then we wait, thanks!

