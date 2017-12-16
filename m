Return-Path: <ticotimo@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DAF0978761
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 03:33:12 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id m26so7445499pfj.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 19:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=uYz0643H7ZVzE2eVsOK4psgnPN1NNuv0NTufrNvE3TA=;
	b=b/4AOCrh+Es/Yrr7Q42XMUTMBNX3NOxkHRNdrbvt8k1TX0Y2CRuLP/UDwZCkIvWzoz
	LWn62Xw/LQ0yGWtKhiDLPfXUuuJQ0Oy7zcLm1Ja+TxckORGPnVVPF7WxcRrHt8qtTXTq
	NTh7AE9mnR3+53mA/i3tnpjmP+6iMs8GINOMuFoaipoVd2cuNJrKarf/PH2jdRB6fO8o
	o7cHta1/1alJQXPbTKIk7GsaNc5IYljY2cG+9klUAeVOtcyA14TXkrJZu0I1L3GFEg0v
	nySe7+gbHuU+M9Cr3pvNEFX+Els5KQBwftW71OqheJO6bztHG5zr54K5UCuL5cZRjtLF
	54Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=uYz0643H7ZVzE2eVsOK4psgnPN1NNuv0NTufrNvE3TA=;
	b=mjsdDZm69nXVAFk8/t01NU/QCOHpy9qBF5bT7P0j816aaR/pRaB0PFyO5kWMLVorv1
	7y1/Tjc5DFhB8yo6y3td0b2TrG3eu09hbBTA1x23kcsOi9gQVSQ3uEp1EgbLaREJfWwe
	zUwVdXcNtNnTwKbtNkrOUX0rTgaCgbi6x7GveV45xL+edhzpJmI3+eKyj/cDuhN/+57w
	d0O15r2HA+yCXqK/ezEHTWApwz38/MOlcIUpwC8UFzmfb7U71blZYn08FE7ha41halUO
	rHg4i2Pw09PiHxjkMvi1tOFb4b0Y1cyUpfE9sX1hugkcXiQr8Go84at7pJHWZvtKDsz6
	Y2nA==
X-Gm-Message-State: AKGB3mIxYTgC62IqcMCwOOxDw10vSt5kGerLp50u8uLUouHRjAzCmFKI
	/8lxz+ruz8OFbgytYEiOnoo=
X-Google-Smtp-Source: ACJfBovU6ei8DTGR04bXCVG/whMSoiXxMGFRjgeV+LIB5ylAkGN2uaDbcSFU5ZwTr32eEKGFItFx5Q==
X-Received: by 10.101.67.1 with SMTP id j1mr13774369pgq.367.1513395193005;
	Fri, 15 Dec 2017 19:33:13 -0800 (PST)
Received: from [192.168.1.90] (c-71-237-235-51.hsd1.or.comcast.net.
	[71.237.235.51]) by smtp.gmail.com with ESMTPSA id
	d75sm12886096pga.39.2017.12.15.19.33.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Dec 2017 19:33:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
Mime-Version: 1.0 (1.0)
X-Mailer: iPhone Mail (15B202)
In-Reply-To: <CADNbA1qS8U_+PraE2zBc7T28XhADftoo+7ffmbQhT2Jg674bbg@mail.gmail.com>
Date: Fri, 15 Dec 2017 19:33:10 -0800
Message-Id: <1712771F-CFE1-4566-BC40-FD3D8D72F729@gmail.com>
References: <1513359926-17087-1-git-send-email-mark.asselstine@windriver.com>
	<1513359926-17087-3-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
	<CAPuovEJCQwFBiFsG5_7miubOgteakgkSzXL5H+3qLYcWqPeo+w@mail.gmail.com>
	<CADNbA1oB3Mmq5B9SNX5OCG8uzmTdTx2kQ8EChZu1_JpntweSNQ@mail.gmail.com>
	<CAPuovEK9x73CjzFPPXYm1iP5Utf=q_4tESK7Krsug79CN+pz=Q@mail.gmail.com>
	<CADNbA1rAdMXYjbxFOO3=sK9GOiSDiYLeXx0eXgc4K_1Ep30_jg@mail.gmail.com>
	<CAPuovEKswWyLr5cQCsak4xM88AXgP+1ZyEjthoRGFmRdGyueMg@mail.gmail.com>
	<CADNbA1qS8U_+PraE2zBc7T28XhADftoo+7ffmbQhT2Jg674bbg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: mark.asselstine@windriver.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][rocko][PATCH 2/2] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Sat, 16 Dec 2017 03:33:13 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Dec 15, 2017, at 12:01 PM, Derek Straka <derek@asterius.io> wrote:
>=20
> That would be useful.  I'm working through automated tests that build ever=
y
> package into a minimal rootfs and then attempt to perform all of imports t=
o
> make sure everything is available for use.  I'm hoping to roll that out in=

> the next couple of weeks.  Thanks for catching this regression.
>=20

The same type of testing is needed in OE-core. One would hope not, but then t=
here is reality.

> On Dec 15, 2017 2:35 PM, "Mark Asselstine" <mark.asselstine@windriver.com>=

> wrote:
>=20
>> I work with a lot of python recipes in meta-cloud-services and
>> especially the openstack packages have a large number of dependencies.
>> Find attached a basic script I have written to help parse
>> requirements.txt files. It might help you out with this work.
>>=20
>> Anyway, I will send out a V2 with the additional cherrypicks.
>>=20
>>> On Fri, Dec 15, 2017 at 2:30 PM, Derek Straka <derek@asterius.io> wrote:=

>>> Yeah.  Agreed.  These commits are me cleaning up the RDEPENDS to work
>> with
>>> minimal python installs.  Meta-python has been pretty bad about setting
>> the
>>> dependencies.  I just missed the news package.  Thanks.
>>>=20
>>> On Dec 15, 2017 2:22 PM, "Mark Asselstine" <
>> mark.asselstine@windriver.com>
>>> wrote:
>>>=20
>>>> No problem. Unfortunately your commit log was thin on information so I
>>>> had to make some assumptions as to what you were doing in the commit.
>>>> I could have easily misinterpreted.
>>>>=20
>>>> On Fri, Dec 15, 2017 at 2:19 PM, Derek Straka <derek@asterius.io>
>> wrote:
>>>>> Sure.  I wasn't clear and even then I misread the 1/2 patch and
>> thought I
>>>>> removed news from core and not the base package RDEPENDS.
>>>>>=20
>>>>> On Dec 15, 2017 2:08 PM, "Mark Asselstine" <
>>>> mark.asselstine@windriver.com>
>>>>> wrote:
>>>>>=20
>>>>> The RDEPENDS are not for core, these are RDEPENDS_${PN}, ie. if you
>>>>> don't know what parts you want you install ${PN} and get everything.
>>>>> We can straighten this up though if my thoughts are incorrect. I have
>>>>> to send a V2 anyway as I was hasty and missed the cherrypick of a
>>>>> bunch of dependencies you added for automat and others.
>>>>>=20
>>>>> Mark
>>>>>=20
>>>>> On Fri, Dec 15, 2017 at 1:32 PM, Derek Straka <derek@asterius.io>
>> wrote:
>>>>>> Is it actually required for core?  I thought I went through and
>> verified
>>>>>> that news was a stand alone module.
>>>>>>=20
>>>>>> On Dec 15, 2017 12:46 PM, "Mark Asselstine" <
>>>> mark.asselstine@windriver.com
>>>>>>=20
>>>>>> wrote:
>>>>>>=20
>>>>>>> Although this plugin has not yet been ported to py3 it is available
>> in
>>>>>>> py2. The previous commit isn't clear about what is being addressed
>> but
>>>>>>> I assume it is:
>>>>>>>=20
>>>>>>> nothing provides python3-twisted-news needed by
>>>>> python3-twisted-17.9.0-r0.
>>>>>>> corei7_64
>>>>>>>=20
>>>>>>> For py2 this package is valid and so we should maintain the
>> RDEPENDS,
>>>>>>> restore this RDEPENDS for py2.
>>>>>>>=20
>>>>>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>>>>>>> ---
>>>>>>> meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6
>>>> ++++++
>>>>>>> 1 file changed, 6 insertions(+)
>>>>>>>=20
>>>>>>> diff --git a/meta-python/recipes-devtools/python/python-
>>>> twisted_17.9.0.bb
>>>>>>> b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>>>>>>> index 2be1709..7fc8c65 100644
>>>>>>> --- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>>>>>>> +++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>>>>>>> @@ -2,3 +2,9 @@ inherit pypi setuptools
>>>>>>> require python-twisted.inc
>>>>>>>=20
>>>>>>> RDEPENDS_${PN}-core +=3D "${PYTHON_PN}-contextlib"
>>>>>>> +
>>>>>>> +# Not yet ported to py3 yet available in py2
>>>>>>> +# See src/twisted/python/_setup.py -- notPortedModules
>>>>>>> +RDEPENDS_${PN} +=3D "\
>>>>>>> +    ${PN}-news \
>>>>>>> +    "
>>>>>>> --
>>>>>>> 2.7.4
>>>>>>>=20
>>>>>>> --
>>>>>>> _______________________________________________
>>>>>>> Openembedded-devel mailing list
>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>=20
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

