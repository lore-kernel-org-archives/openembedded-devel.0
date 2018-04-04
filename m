Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0254B72EE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:05:53 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s24-v6so15876997plq.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 14:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9E0oyS+jKH+RwF3rGczPXrG/CHJL9khxkVXFyaW0F/I=;
	b=e3oHx5532g4GIA7MvxWWe0ZJzDlHNoM7pf9JAEuNtWYjeT/SjbfBzmDMmwoFxVYAsg
	siYYJyVZ+gH5k4yYWcVxFZQ7iLK4y71+dyM0koxnfQRzmjTmkbtBnE1Op8Wsjy5g0G1D
	aNgKZC0ma+pgrLDicgvVGFRxo7p/+uh5V5MXwB9JoEGq7ZR7L/kWFHIDPTUjc3BAKBLS
	vTLIumvLA9V3/bUHet1PvoNwbAdR+8O9P2hoa9KUcrCSQjwrE3unvs1fxZ6SPLaKcVhE
	1Z//WTiLmRJjO6NNK2DUiZmapYw2OQlCgYxt7q/9WQUHfnP9/8a0nAH8ZPVUqCRq/w2d
	vPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9E0oyS+jKH+RwF3rGczPXrG/CHJL9khxkVXFyaW0F/I=;
	b=rlIu2U90eQJvjvMjdm5xgCGJSpAQ4I8/NW86rYwnK0p20BN2cybphI1hGs1L3SqmvV
	OKu6r7gcnnVt3GuKUaODsXGWK5sYiVx20zo3U7//V0usrDxXU7vhTbct5ZkpXdHiqJpp
	DIZ8Fsc5yg+6MMg1WWWY0uFUyX19DcmMFTOJuWFaMsa+N9GwBV7ByRNOO02OAIouDeWK
	lP7hyuPTXk096M7ypJfMamlARJqI2IDc4ckYgnMC01WeTTwrc8271EJspOTVpm6f36U8
	ossC8aOD7LS/0m1+GrAXEoXTfFGMzwJazOZA2N6IdWW5T79ANKpSrR9L5Pa0KrEPH2dy
	4ksw==
X-Gm-Message-State: AElRT7Ep7aNWqvZAhoUswzXsMQwYbBXKFJVLqHrJaP6UFDeuLyr9JDNi
	ow0QVOUfKLJdSalC/FMwU/QmcIGIp0zco5kZnzM=
X-Google-Smtp-Source: AIpwx4+YtNHCQl7NCWq5DdmgMYqyBLRkCra3xtwLg5SDXBXF0dCrYmzv3GWvUdYPE7+J1h46LMtDiXedCcXx7ethtXo=
X-Received: by 2002:a17:902:244:: with SMTP id
	62-v6mr11323518plc.125.1522875954539; 
	Wed, 04 Apr 2018 14:05:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.165.21 with HTTP; Wed, 4 Apr 2018 14:05:24 -0700 (PDT)
In-Reply-To: <CALbNGRTnVNgT0By0afjm09z72zD0wJcH=uGrxTkY1gtjgDBC4Q@mail.gmail.com>
References: <20180404191013.38136-1-raj.khem@gmail.com>
	<20180404191013.38136-2-raj.khem@gmail.com>
	<CALbNGRQ+hFGBqvt0VNLLHeVBjFk7M3sZgiybiVwQBr3kqduviw@mail.gmail.com>
	<CALbNGRTnVNgT0By0afjm09z72zD0wJcH=uGrxTkY1gtjgDBC4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Apr 2018 14:05:24 -0700
Message-ID: <CAMKF1sovNddJc9-mbbfjTryenq2W3NUgNumtj56EKyxDSXKzKg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Wed, 04 Apr 2018 21:05:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 1:45 PM, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> On Wed, Apr 4, 2018 at 10:25 PM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>> On Wed, Apr 4, 2018 at 9:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> v1 -> v2:
>>> - Drop disabling GI
>>>
>>>  recipes-qt/qt5/qtwebkit_git.bb | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_g=
it.bb
>>> index e8c0868..c8e8328 100644
>>> --- a/recipes-qt/qt5/qtwebkit_git.bb
>>> +++ b/recipes-qt/qt5/qtwebkit_git.bb
>>> @@ -18,6 +18,14 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-native s=
qlite3 glib-2.0 libxslt gperf-
>>>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>>>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
>>>
>>> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
>>> +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
>>> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
>>> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mth=
umb).
>>> +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
>>> +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
>>> +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
>>> +
>>>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
>>>  # 5.10.meta-qt5.1
>>>  SRC_URI +=3D "\
>>> --
>>> 2.16.3
>>>
>> I've checked the links you are referring: Both
>>
>> * are related to webkit and from 2016
>> * deal with runtime errors not build errors as referred in patch descrip=
tion.
>>
>> So what do you want to fix exactly?
>>
> I have looked into this further and found that I stumbled for same
>
> commit 511a3764506ce6bbdc5e9441a8f4e9d862ea1102
> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Date:   Mon Jan 4 11:04:16 2016 +0100
>
>     qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix
> segfault on armv7
>
> Curently recipe has
>
> ARM_INSTRUCTION_SET_armv4 =3D "arm"
> ARM_INSTRUCTION_SET_armv5 =3D "arm"
>
> Isn't thumb default any more?
>

Thumb-1 doesn't really work since it shows up with register allocation
errors with gcc.
thumb2 is fine for armv6+

> Andreas

