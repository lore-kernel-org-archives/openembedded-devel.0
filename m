Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web09.1999.1614878278295506230
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 09:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=T9bR5sp3;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4DryHR5TcZzQlY2;
	Thu,  4 Mar 2021 18:17:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1614878268; bh=rptVwI9KnPXpLSCJGSVteBgCw9PGo2honIAKRfzEi+4=; b=T
	9bR5sp3bDM4UThFGlOKAjC67yXPaS2sVwMyhHuta00tDMtqYQQ6JbEYxuV5erXdh
	9dHw72VbDdAHhhiNb7JhVXPseIdiaeycVDySsrE5FNxkmL4eEL2wyMUhSKMu/jDb
	ojAgIBdk6vjaHGo2AOI4CivCVvzarR3GKIerSXMHENWWTciyQnbwOAEsostJUWRl
	60rss+0OnSdseSfiQwNqsA64J2rse7RWKMAlDUQIyc5g/mN0/zhmDWkeWcNjwfmP
	Tjo9r0VrIw6ormIIqlUNTAISyTBkAKOSHRf37TzHJ6EPQJeRVorwiuqCVJe4QvHe
	zwkUBfwQBdpYsvs6f3xig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1614878273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRjRh4AhY8v17gl4ctTq321bjxfMZMb1F6mMbLL+qcY=;
	b=WJnh23jrfwtx8LHR37Q4XUnXr5R6sKCwF6GqwHJINpPbN1KnaKp45Mb6MPaAIVYPBJi+ih
	gwtGMbE9AaklpzPD6UokFzYXlVUEcV8f5fzeGNwDuI6OYUgwYL57g4AA56rViNL1VMAhsI
	x6NJjGPERFLP+jgNe5sKoc9kfL/yQF+ddTzgLmpGt7qstvEy3n0wnGqSNuqBOtd+egWpD2
	LYmFbkDYJ73L2XQmI0BQzhf2+hl5vGBkw8Cx8BLp1VCPXmRisFXXAg9wilJmgVeBND9JrU
	5RZ2O0ntPEBb73ENOWvN6YOzIsNNtJ8+zXE0zr/dorEl0ogXt5FXN29ra7QJZg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
	with ESMTP id ZU-0AYEf9r2b; Thu,  4 Mar 2021 18:17:48 +0100 (CET)
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: Move to meta-multimedia
To: Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 quentin.schulz@streamunlimited.com,
 George Kiagiadakis <george.kiagiadakis@collabora.com>
References: <20210303114130.2317817-1-crg7475@mailbox.org>
 <CALbNGRT-L+khTL5277KAjfqwCdQ66yH-o6tcw35=0cr_CKzttQ@mail.gmail.com>
 <74063b8d-88e6-6c98-e2d2-7a640f7ebea4@mailbox.org>
 <da6a5e66-997f-aff4-7e81-d166c7014bd2@gmail.com>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <9f1a880f-531a-3794-1e6f-058c5d43fe99@mailbox.org>
Date: Thu, 4 Mar 2021 18:17:45 +0100
MIME-Version: 1.0
In-Reply-To: <da6a5e66-997f-aff4-7e81-d166c7014bd2@gmail.com>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.49 / 15.00 / 15.00
X-Rspamd-Queue-Id: 45CD917BD
X-Rspamd-UID: af0eec
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I see three steps then:

1. Upgrade the recipe to 0.3.23 that was released today
2. Migrate it to oe-core
3. Establish a packagegroup feature to be able to easily replace PA with i=
t

I think steps 1 and 2 can be combined, but 3 should remain separate.=20
That is, once it is in oe-core, we can start thinking about establishing=
=20
that packagegroup feature.

On 04.03.21 18:02, Khem Raj wrote:
>
>
> On 3/4/21 5:12 AM, Carlos Rafael Giani via lists.openembedded.org wrote:
>> Well, fine by me, though I'd like to ask others as well what they=20
>> think about moving this to oe-core?
>
>
> I think its a good idea and perhaps if we can make it an easy=20
> replacement for PA via a packagegroup or feature ( like init systems )=
=20
> then it will be a good thing to have in core
>
>>
>> On 03.03.21 22:01, Andreas M=C3=BCller wrote:
>>> On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
>>> lists.openembedded.org <crg7475=3Dmailbox.org@lists.openembedded.org>
>>> wrote:
>>>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>>>> ---
>>>> .../recipes-multimedia/pipewire/pipewire-0.2_git.bb | 0
>>>> .../recipes-multimedia/pipewire/pipewire_git.bb | 0
>>>> =C2=A0 2 files changed, 0 insertions(+), 0 deletions(-)
>>>> =C2=A0 rename {meta-oe =3D>=20
>>>> meta-multimedia}/recipes-multimedia/pipewire/pipewire-0.2_git.bb=20
>>>> (100%)
>>>> =C2=A0 rename {meta-oe =3D>=20
>>>> meta-multimedia}/recipes-multimedia/pipewire/pipewire_git.bb (100%)
>>>>
>>>> diff --git=20
>>>> a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb=20
>>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>>> rename to=20
>>>> meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>>> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb=20
>>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
>>>> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>>>> --=20
>>>> 2.25.1
>>>>
>>> To be honest: I'd prefer the other way: Add it to oe-core (of course
>>> not this old version). Haven't found the time to check more on details
>>> but it is a drop in replacement for at least pulseaudio and jack.
>>>
>>> Andreas
>>
>>
>>=20
>>
