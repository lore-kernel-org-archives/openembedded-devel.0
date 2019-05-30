Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF437E413
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 13:21:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so1157270wrs.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=wW2gLUdvZnQgVrTZpY3wQk+DzP6m37GKDp4xIarfCUM=;
	b=rPRQ1B7Up6aIg04gLjpqNOHPdkHvk20xknEIryTwXvvDWADyl89dB8DLxsrkfi8YbN
	96B9PwEXaFhtFBxcGjDHgRrN4hiCzid/MsCHYYPCyiV6LYur2i2NczWdukamk6FAAtvy
	E+gUPqA3CrLX0qtvkY+ZoJwJxYkWettGlfINepAs7S9MJdqFrrFX2p4iAj2cQyC0DtBz
	BSmfsK6Gi0HPEjOpCdxC0Wjy60RFiB09dl59vxhWFRu/AxkbnqpdpzvvnDAVyII2RQer
	1TsNCdXajb6PxhmB5/vscCiaxKLn6YYE1Dl3Tv/s3yRKT5KbVFrbfoz2KhJnPHr2C3Js
	FDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=wW2gLUdvZnQgVrTZpY3wQk+DzP6m37GKDp4xIarfCUM=;
	b=bB2UN+LRQP+6vQUhf82EvETDZNuABMH2IebF7dQvoU/ffg0j5mkbSbr3aTu2HktsBe
	uL0ObheZ/HxhYc4dmLELOjv3cQvysY5NEWAqlBg0yxKfZoh6pEYcPgPxSVC0ci572jcS
	8P4el+WmUheh0CsqUNutUwn2SsmBH8E7nr1PLSuOPpFGvFgZtMt/7eqgXeSu65HJiCVR
	yhZ8QWMh9cE+z0mv0pgZIK+Oe3ZpDw8eES3UiNiseOVtF7zopCwrv2RLUqS9AeDKhzap
	kVczMAYDMh/218ToaMIy7A08bPJbOH7hjcMOIDkpe4xH5hNGoBnNtXqownN7wwjsK3gn
	QuxQ==
X-Gm-Message-State: APjAAAXMO04DjfMbZN35BeIyiI8jNapxy8y5anj68kffjWB9zCivvc+t
	AKFrMieUWaniXVXEDoGwAJERbQ==
X-Google-Smtp-Source: APXvYqxw7KSa3xZsbHGTqQEwOfTjMetvjn7EryZjhicLMugZ6aW7TruJpIdo94S0XBDief1K7rIBmA==
X-Received: by 2002:adf:e544:: with SMTP id z4mr2703133wrm.295.1559222476673; 
	Thu, 30 May 2019 06:21:16 -0700 (PDT)
Received: from [192.168.0.101] (84-33-71-35.dyn.eolo.it. [84.33.71.35])
	by smtp.gmail.com with ESMTPSA id t6sm6006450wmt.34.2019.05.30.06.21.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 06:21:16 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
Message-Id: <D13360D8-EDFE-446C-AA23-6D8D578E9022@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Date: Thu, 30 May 2019 15:21:14 +0200
In-Reply-To: <20190530122056.GE20599@localhost>
To: Adrian Bunk <bunk@stusta.de>
References: <20190530102539.65935-1-paolo.valente@linaro.org>
	<20190530111457.GA20599@localhost>
	<F1150B1F-B591-4579-A7BC-AA5ED008C07C@linaro.org>
	<20190530122056.GE20599@localhost>
X-Mailer: Apple Mail (2.3445.104.8)
Cc: ulf.hansson@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 13:21:16 -0000
X-Groupsio-MsgNum: 77876
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AA61B9B1-2101-4BBC-B4A7-E276129A775F";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_AA61B9B1-2101-4BBC-B4A7-E276129A775F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Il giorno 30 mag 2019, alle ore 14:20, Adrian Bunk <bunk@stusta.de> ha =
scritto:
>=20
> On Thu, May 30, 2019 at 02:15:21PM +0200, Paolo Valente wrote:
>>=20
>>=20
>>> Il giorno 30 mag 2019, alle ore 13:14, Adrian Bunk <bunk@stusta.de> =
ha scritto:
>>>=20
>>> On Thu, May 30, 2019 at 12:25:39PM +0200, Paolo Valente wrote:
>>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
>>>> ---
>>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> index 706a55e11..db1945dd0 100644
>>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> @@ -2,8 +2,8 @@ SUMMARY =3D "Small collection of benchmarks for =
storage I/O"
>>>> LICENSE =3D "GPLv2"
>>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>>>=20
>>>> -SRCREV =3D "262227ec9de4be1ab41d9918d32ceb773089f1dd"
>>>> -PV =3D "3.2+git${SRCPV}"
>>>> +SRCREV =3D "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
>>>> +PV =3D "3.4+git${SRCPV}"
>>>> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>>>> ...
>>>=20
>>> The problem was already there before, but the upgrade gives the
>>> opportunity to get rid of the +git${SRCPV}, which is incorrect
>>> when exactly the release is packaged.
>>>=20
>>=20
>> Sorry,
>> you pointed this out already, but then I thought I had solved it.  =
Now
>> I also understand why the previous push-up to 3.3 was not it.
>>=20
>> And now, I'm sorry, but I think I'd better to ask for your help
>> explicitly: how should I fix this exactly?
>=20
> Just remove the +git${SRCPV} from the PV line:
>=20
> -SRCREV =3D "262227ec9de4be1ab41d9918d32ceb773089f1dd"
> -PV =3D "3.2+git${SRCPV}"
> +SRCREV =3D "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
> +PV =3D "3.4"
>=20

Ok, making and sending a V2.

Thank you,
Paolo

>> Thanks for your patience,
>> Paolo
>=20
>=20
> cu
> Adrian
>=20
> --
>=20
>       "Is there not promise of rain?" Ling Tan asked suddenly out
>        of the darkness. There had been need of rain for many days.
>       "Only a promise," Lao Er said.
>                                       Pearl S. Buck - Dragon Seed


--Apple-Mail=_AA61B9B1-2101-4BBC-B4A7-E276129A775F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEpYoduex+OneZyvO8OAkCLQGo9oMFAlzv2MoACgkQOAkCLQGo
9oP8LA/8CAN2bKZXdqb1AvcW16pFVOiBTle+o4qmTQ2ZukvqRUJhGL5Um0AfFiwB
iFcbai8VcE9MQL+wsIp0tNLSgY6niz0BCxYVZP8nHZQ/e4ubGvg4pQADwDf6s2Ub
1BroOOY4yxCs77UcToqrNl4XMD6CA+O/GeDCz7c/WrgASIzMPAsBXcIoK6aGhQZv
OB0syM6/QhbImPuGuTE5nFy7OkQpIUjj6YQKN9X9rSuLIE+rF1plbB8uF0KqiTq+
NnO5P5nQirrbU7cFmytx4odfBothteh1uiMSqCLYXKGXkrcUx33nJ0lTYYj24LN0
ZsiBpF4RcrNK3evGpyu613Eln2u+wGhz+OdWP2kwmOX77DlB3zsyb8bywX8q/1Ke
YGvc+6Q01/NwCr9FqCAU5s9sZuinunp+GONo7HO/+0og+fnKXyUuNQ+w2tnA6Hx/
uoQ8o6f266dGpo6548yEjKRN/0R08vvRJxX+7eVm/XU4/6nH/OWqNiAf/RM8kwTe
WOigoQRRqYSqck0Cxrs1XkY4zAd7ltGI22yzoQ4C4dn99XBFIbj/frhwnTNF4glI
y7fMVASb05DBsE8AYG5UGmWXK8PPRqMJZoCZ5v6/Gm6N0O2S0vjua9vB5EnJRcuT
GZ9ACtqZFcDV8mi6T9rmIl/nkzoKZN6F6/Tcr8c9Ox6pdhdVoCk=
=fTXA
-----END PGP SIGNATURE-----

--Apple-Mail=_AA61B9B1-2101-4BBC-B4A7-E276129A775F--
