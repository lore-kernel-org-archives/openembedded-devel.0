Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12429EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 07:26:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.2059.1689146760244580940
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 00:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=s+/3MrCJ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1C59B868F9;
	Wed, 12 Jul 2023 09:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1689146757;
	bh=eGrtRUiHh6ZfiKOu/P4hzidAvqTC9fWOOHVBym0Mw38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s+/3MrCJu+c68L/KQFuUOpzMezZoESevBGh3GnCrRG4drM5esL3W5Eih1ZJi57qD5
	 iEcsVwu/ETF7QExsQu3kR59kaA5BTyA/F7iyWnsFT8UNB1oiT7ea6BRZxOkC2Us2b0
	 MkoBpCjJ3MEip3IJEhFzFoUq0XabLWEjYR1wiPUFHJFuLfpVvEhSaJnBJbu4l2nWnk
	 d8eHtrIbvREB1rgYhOyM2qkB/drhZg4lNn6CYFqEu3juyD2NuB/+rXeKhOgTpGospJ
	 rGlIL5cCSmesiLgzJJy5cdYND6oFIC1F/wCaueSDsowym2TFC+G4+6cbk/QrcrUxP9
	 uwtGJjYoNaiHQ==
Message-ID: <581dd812-873e-eb56-50cc-7b03de57799a@denx.de>
Date: Wed, 12 Jul 2023 09:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-oe][PATCH 1/2] libiio: update to version 0.25
Content-Language: en-US
To: Martin Siegumfeldt <mns@gomspace.com>, Khem Raj <raj.khem@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 Christian Eggers <ceggers@arri.de>
References: <20230712011122.105264-1-marex@denx.de>
 <CAMKF1soi0_gwwkqV26a6HJ3oEo__=5LdugShV_MkQMVeZmWRCQ@mail.gmail.com>
 <AM0PR09MB3988DFDE6AFBFBF4A7DF5078AF36A@AM0PR09MB3988.eurprd09.prod.outlook.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM0PR09MB3988DFDE6AFBFBF4A7DF5078AF36A@AM0PR09MB3988.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103828

On 7/12/23 08:40, Martin Siegumfeldt wrote:
> On Tue, Jul 11, 2023 at 6:11=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
>>
>> The version 0.25 has been released, it has not been tagged however.
>> Update the this version anyway.
>=20
> hmm how do we know where to peg SRCREV ? I wonder if we should wait
> for tag to appear.

The 0.24 appeared on matching commit
"CMake: Bump version to v0.24"
Same for 0.23, 0.22, 0.21. 0.20 was not tagged like this 0.25. 0.19 was=20
tagged again etc.

I think it is safe to assume the tag was just missed or not pushed, but=20
I planned to ping Paul about it. Might as well add Paul to CC help and=20
ask that way.

Paul, is the libiio 0.25 tag just missing ?

> I agree in waiting for tag to be published.

See above.

> Also, would it make sense to rename the recipe file according to the ac=
tual version rather than 'git'? In the past I think the recipe referred a=
rbitrary git commits, however we have moved to referring actual release c=
ommits now.

Yes, good point, but that's a separate patch. I made a local commit so=20
it isn't forgotten.

