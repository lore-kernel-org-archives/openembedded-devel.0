Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id BF66174DC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:26:49 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id e5-v6so6857695ybq.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 14:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9MR7k6ild46RC8AlNryGVzGYB/PlNl0gyBGdlWlvbp8=;
	b=hWs+78Nj7qyH41FvGkX5XAEIQ5wyrVL2hMbgbqIdSNNGZR4Mrug/DT2n8IlPLL6P4r
	Pu9NakqGkKCinsdm4zxF53MIMOAemQXEbgonG5YZD3fgQGej2COEeqcMF9Vx2VxDCjd8
	mQd5wE2OB+noJPR5TRoKK2xP7+YqjXov8oZE6xghefwYE1ql51ZIvpjY3RwmzKXFh7cL
	Ptk+690+FMFhQqKDQiumHRKiH+5CTGz87x5nB0U68v62aaMXWNYUPabanIG9pPk7A3Wv
	WUyOxeU4FmmNhVNe2l8Sw8PGOXsXBQ30C3+d/YcZIJ3kfM2VGGoVil2okIP5pt9TQNFu
	bmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9MR7k6ild46RC8AlNryGVzGYB/PlNl0gyBGdlWlvbp8=;
	b=ZIgRlzBAmU1wuXMiUifocaMBw70Azrgzl4ZlJgA94vIZIRAnRhi+oHNHyNBi2FG16K
	uxuGeSEv0XJ7s0wN3YNmvRnDnDB8Twx8G04rPncZQNky9qRv74AVzsklQVscKBtIhAcs
	vANEjz4tUnhnLVC2xumnjJexCxR9mCOBGbyvWcgd5kch6Ru4n5JZaqzpBFxp8mzzWUIj
	ZR3Num5738I/tVQwdx5oOnB9vaiEOBMiz/oNk6v4PAzEEngB2U0eudk+GWWQpMaeU+gc
	m5natheUyYEIA4kWpryxjbNTgodQ0aHHjIv2/5da31ex5J/oLJ8Mej++SdumNeiALL+U
	eCzg==
X-Gm-Message-State: ALQs6tBr9cRL/tPfhn2fPocbXqvsuzMaUoEMDZPDm+M6uIS44WJ13KnT
	7SCfmk7aSO8asjqbi7m1jLTshcKOoOcKVi0/PgI=
X-Google-Smtp-Source: AIpwx48GxUAZXQCh9hHZX+IzwVvP0s56yeQHW/VFklqE9JZ5BAdUAYDEpfGKKiirxPmLoqNr1DaqoQO+j+RTSl1uEhI=
X-Received: by 2002:a5b:bd0:: with SMTP id
	c16-v6mr4468018ybr.224.1522877210031; 
	Wed, 04 Apr 2018 14:26:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 14:26:49 -0700 (PDT)
In-Reply-To: <CAMKF1sovNddJc9-mbbfjTryenq2W3NUgNumtj56EKyxDSXKzKg@mail.gmail.com>
References: <20180404191013.38136-1-raj.khem@gmail.com>
	<20180404191013.38136-2-raj.khem@gmail.com>
	<CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
	<CALbNGRTnVNgT0By0afjm09z72zD0wJcH=uGrxTkY1gtjgDBC4Q@mail.gmail.com>
	<CAMKF1sovNddJc9-mbbfjTryenq2W3NUgNumtj56EKyxDSXKzKg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Apr 2018 23:26:49 +0200
Message-ID: <CALbNGRRu2DXsWQXntne6OzT3otujYa+WGb0j++au0R_kXJNktA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH V2 2/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Wed, 04 Apr 2018 21:26:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 11:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Apr 4, 2018 at 1:45 PM, Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>> On Wed, Apr 4, 2018 at 10:25 PM, Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
>>> On Wed, Apr 4, 2018 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> v1 -> v2:
>>>> - Drop disabling GI
>>>>
>>>>  recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_=
git.bb
>>>> index e8c0868..c8e8328 100644
>>>> --- a/recipes-qt/qt5/qtwebkit_git.bb
>>>> +++ b/recipes-qt/qt5/qtwebkit_git.bb
>>>> @@ -18,6 +18,14 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-native =
sqlite3 glib-2.0 libxslt gperf-
>>>>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>>>>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
>>>>
>>>> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
>>>> +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
>>>> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
>>>> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mt=
humb).
>>>> +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
>>>> +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
>>>> +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
>>>> +
>>>>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
>>>>  # 5.10.meta-qt5.1
>>>>  SRC_URI +=3D "\
>>>> --
>>>> 2.16.3
>>>>
>>> I've checked the links you are referring: Both
>>>
>>> * are related to webkit and from 2016
>>> * deal with runtime errors not build errors as referred in patch descri=
ption.
>>>
>>> So what do you want to fix exactly?
>>>
>> I have looked into this further and found that I stumbled for same
>>
>> commit 511a3764506ce6bbdc5e9441a8f4e9d862ea1102
>> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> Date:   Mon Jan 4 11:04:16 2016 +0100
>>
>>     qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix
>> segfault on armv7
>>
>> Curently recipe has
>>
>> ARM_INSTRUCTION_SET_armv4 =3D "arm"
>> ARM_INSTRUCTION_SET_armv5 =3D "arm"
>>
>> Isn't thumb default any more?
>>
>
> Thumb-1 doesn't really work since it shows up with register allocation
> errors with gcc.
> thumb2 is fine for armv6+
>
Sorry for causing confusion - what I meant: Isn't thumb2 default for
armv7 anymore (particularly RasPI > 1).  If thumb2 is still default
for armv7 there is no need to add it explicitly here. It does not do
any harm but it is not necessary.

Andreas

