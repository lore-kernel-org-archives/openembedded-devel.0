Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6BE71CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 19:32:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d140so44928227wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=XRsB1AHEg/JRpqjIps9M2cpiucJSW0LJNBScVzI2LKI=;
	b=WnKzAwFTir9y70Kvf/GDaTF8UXoRvxDG0E1yOi18pzbD5b5VttwBBgVfNuUtwkAEw2
	9TDWc54WOKy9DZiRIPXPi8jZlCbYX81q/aJKqgsX8q07JwAeMIBCzhaeH1Eld5pM1ex0
	+Sefz+E1Mwc1K5A8EvE79zdUe2hE3CIPXfv6/DJVwZnhV3QN0RDpZZ7xkhIM9+y5T6FK
	go9ueX/pkl5A7G7HgjvUgT9PkzaKfAGMHVtR7fjR6N9PVnzvaFsec0nfWqeKHBR/Ftmo
	77855QQhg0/cHaV0pXrykctT9PsHRswE+0jjWGCfnOUqSX+p8ZJpDOapAD6FziB++JXx
	+5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=XRsB1AHEg/JRpqjIps9M2cpiucJSW0LJNBScVzI2LKI=;
	b=mPSIrcgwkVSEzcyKEpLuufsVG9V4Plq/Qoce0lnqWnmGXshy6wEGTKqhj63x9e+5G9
	w1Q7nku/kRQ2MCcCGKxrAiK/PIRR/mVLg8IZYRDGMDEnyEujAg8CHK+tfDzNWd/lZ3Y3
	AyBi1umI0GsouNIW6jAbITjjOvkNEAlicMIU1CpJAyYWk3wnz9HFfyVVXelT+2fb9RFN
	8fiSzA7TTIyQCoCE3YyjXMJ7ptNY4Dtgz4uNU6s0q1X3qElpz2j/j5kr1tmc8DDB1bTM
	I35kKiEH9wHKmdW7UFIjwSg/4wj7oagwKDkVpMC/JAAwniP//4zDhkBbebU9Gp5pe4EL
	hxcw==
X-Gm-Message-State: AIkVDXLDQJwcPRue5AhuXc7cdfPhiaolpHGYd1bm/i6YgTV+VlmwaARZH2Dn/yuB8uA3S2lhK6ga9Cj8+GokOQ==
X-Received: by 10.28.157.201 with SMTP id g192mr22642123wme.29.1485372765827; 
	Wed, 25 Jan 2017 11:32:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Wed, 25 Jan 2017 11:32:45 -0800 (PST)
In-Reply-To: <CAJ86T=Xo3HsztJfJfzK2Qj5pv_yNMoRsHVbcwj589MgNsaYU2w@mail.gmail.com>
References: <1485285570-27494-1-git-send-email-armccurdy@gmail.com>
	<1485334713.6808.1.camel@andred.net>
	<CAJ86T=Xo3HsztJfJfzK2Qj5pv_yNMoRsHVbcwj589MgNsaYU2w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 25 Jan 2017 11:32:45 -0800
Message-ID: <CAJ86T=W1m0kNy-PwKznNDSOiJWoamHQROuOuN0Hzs8QcxC1YJw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: mips and mipsel are 32bit targets too
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
X-List-Received-Date: Wed, 25 Jan 2017 19:32:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 10:29 AM, Andre McCurdy <armccurdy@gmail.com> wrote=
:
> On Wed, Jan 25, 2017 at 12:58 AM, Andr=C3=A9 Draszik <git@andred.net> wro=
te:
>> On Tue, 2017-01-24 at 11:19 -0800, Andre McCurdy wrote:
>>> When cross compiling, the word size of the compiler set via HOST_CC
>>> must match the word size of the target. That's achieved by appending
>>> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
>>>
>>> Unfortunately the current list of over-rides (powerpc, x86 and arm)
>>> does not cover all cases. Add mips and mipsel to the list too (which
>>> is still not enough to cover all targets or corner cases such as x32,
>>> but better than before).
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-
>>> oe/recipes-devtools/luajit/luajit_2.0.4.bb
>>> index 964dc1d..2049846 100644
>>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>>> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>>> @@ -24,6 +24,8 @@ BBCLASSEXTEND =3D "native"
>>>  BUILD_CC_ARCH_append_powerpc =3D ' -m32'
>>>  BUILD_CC_ARCH_append_x86 =3D ' -m32'
>>>  BUILD_CC_ARCH_append_arm =3D ' -m32'
>>> +BUILD_CC_ARCH_append_mips =3D ' -m32'
>>> +BUILD_CC_ARCH_append_mipsel =3D ' -m32'
>>
>> I suspect this should be using:
>>
>> BUILD_CC_ARCH_append_mipsarchn32 =3D ' -m32'
>> BUILD_CC_ARCH_append_mipsarcho32 =3D ' -m32'
>
> That wouldn't work so well when backported to krogoth and morty (which
> is where I personally need the fix).
>
> But maybe there's a more generic way to answer the question "is the
> target 32bit?" from within a recipe without needing to keep a list of
> over-rides up to date?

SITEINFO_BITS seems to do that.

>>
>> Cheers,
>> Andre'
>>

