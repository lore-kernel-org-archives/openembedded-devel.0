Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57C0FC6172
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 18:38:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.80697.1726252713659370933
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 11:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=mn0gOP03;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48DIcVnu061687;
	Fri, 13 Sep 2024 13:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726252711;
	bh=Q0IqQLENQa1d4ETYVS9dh6TGTtV4khpDqkrHmPVn8pA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mn0gOP03TZV35Cn3AD8Ldk6s/iwgpjMiXopgrL4sayhhGnJ5BhJV3oaWk3aohqhw6
	 oRKtloiBbHeg9f8WYQvZX1+GrREmObnY/50qwDXKq8v7avyn8nJfeRb9oGtBGUi+Tj
	 QpyT5yRRM1d1u6SL5akmY2QepJV0+IWsAdEVnouE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DIcVK5093813;
	Fri, 13 Sep 2024 13:38:31 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 13:38:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 13:38:31 -0500
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48DIcVde110350;
	Fri, 13 Sep 2024 13:38:31 -0500
Message-ID: <4bc2eb52-493b-40b8-bf74-617840fcb40c@ti.com>
Date: Fri, 13 Sep 2024 13:38:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] yavta: Update to kernel 6.8
To: Khem Raj <raj.khem@gmail.com>, <tolvupostur@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <20240910124936.21220-1-tolvupostur@gmail.com>
 <c501aa82-8069-48ce-abb2-6c6ab7a86bb1@ti.com>
 <CABhNV210+OW4qpTzP9N0fhStTEAOthxgjk4Mqq+MqikV3iYJ3A@mail.gmail.com>
 <CAMKF1sqWjSpC2dHmjibDy=hnkJk7-WUD5U0czpVDtp0gvr2rzw@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAMKF1sqWjSpC2dHmjibDy=hnkJk7-WUD5U0czpVDtp0gvr2rzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 48DIcVnu061687
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 18:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112280



On 9/13/2024 1:28 PM, Khem Raj wrote:
> On Fri, Sep 13, 2024 at 11:17=E2=80=AFAM Einar Gunnarsson via
> lists.openembedded.org <tolvupostur=3Dgmail.com@lists.openembedded.org>
> wrote:
>>
>> Ooops
>>
>> On Fri, 13 Sept 2024 at 15:25, Ryan Eatmon <reatmon@ti.com> wrote:
>>>
>>>
>>> I'm seeing build failures on 32bit platforms with this new version.  =
Can
>>> anyone verify?
>>
>>
>> I can confirm that this does not build on 32-bit.
>> The problem seems to be switching to meson build - both the current SR=
CREV
>> and the updated one fail on time_t size with meson, but build with the=
 old mess of a code.
>>
>=20
> My builds test 64 bit on AB, locally I test 32bit arm/x86 and its
> using clang compiler and it works fine there too.
> I do not have 32bit builds+musl combination, too many combos, not
> enough compute power.

I have a patch that I'm testing.  I've spoken to the upstream maintainer=20
and will send the patch in to them once it's complete.  Then we can bump=20
the SRCREV again once they accept it.



>> Sorry about that
>> Einar Jon
>>
>>>
>>>
>>> On 9/10/2024 7:49 AM, Einar Gunnarsson wrote:
>>>> Additional changes:
>>>> Use https protocol for git fetch
>>>> Build with meson
>>>>
>>>> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>>>> ---
>>>>    .../recipes-multimedia/v4l2apps/yavta_git.bb   | 18 +++----------=
-----
>>>>    1 file changed, 3 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta=
-oe/recipes-multimedia/v4l2apps/yavta_git.bb
>>>> index c4f31c033..db00c67b1 100644
>>>> --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
>>>> +++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
>>>> @@ -2,9 +2,9 @@ SUMMARY =3D "Yet Another V4L2 Test Application"
>>>>    LICENSE =3D "GPL-2.0-only"
>>>>    LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D751419260aa954499f=
7abaabaa882bbe"
>>>>
>>>> -SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster \
>>>> +SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster;p=
rotocol=3Dhttps \
>>>>              "
>>>> -SRCREV =3D "65f740aa1758531fd810339bc1b7d1d33666e28a"
>>>> +SRCREV =3D "323facd1d5bd6251eec70dd5c1484a12ce01202a"
>>>>
>>>>    PV =3D "0.0"
>>>>    S =3D "${WORKDIR}/git"
>>>> @@ -12,16 +12,4 @@ S =3D "${WORKDIR}/git"
>>>>    # Upstream repo does not tag
>>>>    UPSTREAM_CHECK_COMMITS =3D "1"
>>>>
>>>> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
>>>> -
>>>> -# The yavta sources include copies of the headers required to build=
 in the
>>>> -# include directory.  The Makefile uses CFLAGS to include these, bu=
t since
>>>> -# we override the CFLAGS then we need to add this include path back=
 in.
>>>> -CFLAGS +=3D "-I${S}/include"
>>>> -
>>>> -do_install() {
>>>> -    install -d ${D}${bindir}
>>>> -    install -m 0755 yavta ${D}${bindir}
>>>> -}
>>>> -
>>>> -
>>>> +inherit meson
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>> --
>>> Ryan Eatmon                reatmon@ti.com
>>> -----------------------------------------
>>> Texas Instruments, Inc.  -  LCPD  -  MGTS
>>
>>
>>
>> --
>> Regards
>> Einar J=C3=B3n
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112277): https://lists.openembedded.org/g/openembe=
dded-devel/message/112277
>> Mute This Topic: https://lists.openembedded.org/mt/108374819/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

