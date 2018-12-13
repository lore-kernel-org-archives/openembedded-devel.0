Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 127CA6C4C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 19:13:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so3178218wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 11:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=b/eP9ViIzkMBL/p7J68uo2w7H5unEYCngIgtRygd9tA=;
	b=JpgQuF6W8GPecZbhMkytYDC4xkKyZiYqzDdUkIwtxu5V8kYhzjDGC72Vg1iYIOXFRJ
	0sDMQpvV3r1ZGvxSPXNqhTnoPVjzdYvowwodB9LuQScYq2TAtFI0lPGFdMAfsHmMxh9c
	6MNcOWItg7cpHlE8bhmdebsAEXppcBhKsCn7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=b/eP9ViIzkMBL/p7J68uo2w7H5unEYCngIgtRygd9tA=;
	b=cpKyd5/IAqpZPgbPrTgHvNscR6lnja9pBFYla4gdeSxpw4WkoUEZGFTHeagOfeJz82
	iWrr4rkdzjwirHXPidnOM6G8roIAp7qtBmqemuTg3sSWoz8mRe7RVdkJ5TzurCTtVjUg
	2fj3D9lHc5qc2cVfWcWpA/L7CdCTjRF1MX+uMOkjLm+GzYkhWfiHxhb2eOEgQmDakzkU
	GFNRxeGLN2JgfADX5RUVczkZJNQSJZr4pvc8xsWveF+E3jKClTAht74Y1g38xhc+N6kP
	j5oPJ8Mu8V11YPritksmMqNIHgCp0fw5HrjjkBBlBHhxNJGJxOfRtgWmG4sakYhic1nU
	QY5A==
X-Gm-Message-State: AA+aEWbF5FxDaK+al/G7n36oORszmzPkRFR6pqa+yZgl9D3lKd68Vne0
	ZJQr5E0HMpn9DpYED3G+lolQ6Q==
X-Google-Smtp-Source: AFSGD/Vdsz2h1A+fDEN3jVH0vI+y0OHCEnljtLzxJpamurkUjuLcOKEJh1ru/Srp42aZssl6UD3Fdw==
X-Received: by 2002:adf:83e7:: with SMTP id 94mr8748wre.278.1544728385522;
	Thu, 13 Dec 2018 11:13:05 -0800 (PST)
Received: from [192.168.0.101] (146-241-196-218.dyn.eolo.it. [146.241.196.218])
	by smtp.gmail.com with ESMTPSA id r3sm3316634wrs.78.2018.12.13.11.13.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 11:13:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <CAMKF1srVtW2Utpj1PBsYRo6xMuUuiXVTzN+9t_nxcVHg-=PXFg@mail.gmail.com>
Date: Thu, 13 Dec 2018 20:13:03 +0100
Message-Id: <57748E3B-3B23-4BEC-9673-EB348494EAD5@linaro.org>
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
	<6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
	<CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
	<47F5AE94-3A9F-4C6E-86C4-F56E4E7ADA18@linaro.org>
	<CAMKF1spYyDAxBCHrcA6jTYYT7v8tprHWF6ZOxBkQJc+n1_eQ6w@mail.gmail.com>
	<3B9426AF-6E9F-45D7-9D6C-AA0B83188CEF@linaro.org>
	<CAMKF1srVtW2Utpj1PBsYRo6xMuUuiXVTzN+9t_nxcVHg-=PXFg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3445.101.1)
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mark Brown <broonie@linaro.org>
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.0
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
X-List-Received-Date: Thu, 13 Dec 2018 19:13:05 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Il giorno 13 dic 2018, alle ore 18:24, Khem Raj <raj.khem@gmail.com> =
ha scritto:
>=20
> On Thu, Dec 13, 2018 at 9:20 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>=20
>>=20
>>=20
>>> Il giorno 13 dic 2018, alle ore 18:18, Khem Raj <raj.khem@gmail.com> =
ha scritto:
>>>=20
>>> On Thu, Dec 13, 2018 at 9:16 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> Il giorno 13 dic 2018, alle ore 18:11, Khem Raj =
<raj.khem@gmail.com> ha scritto:
>>>>>=20
>>>>> On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>>> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj =
<raj.khem@gmail.com> ha scritto:
>>>>>>>=20
>>>>>>> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>>>>>=20
>>>>>>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
>>>>>>>> ---
>>>>>>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
>>>>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>=20
>>>>>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>>>> index 77d172814..166f3000a 100644
>>>>>>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>>>> @@ -2,7 +2,7 @@ SUMMARY =3D "Small collection of benchmarks for =
storage I/O"
>>>>>>>> LICENSE =3D "GPLv2"
>>>>>>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>>>>>>>=20
>>>>>>>> -SRCREV =3D "79698f645bfb28d0d966484ddad3a1efb562246d"
>>>>>>>> +SRCREV =3D "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
>>>>>>>> PV =3D "0.0+git${SRCPV}"
>>>>>>>> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>>>>>>>>=20
>>>>>>>> @@ -21,7 +21,8 @@ do_install() {
>>>>>>>>  install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>>>>>>>> }
>>>>>>>>=20
>>>>>>>> -RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat"
>>>>>>>> +RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat \
>>>>>>>> +                 psmisc git"
>>>>>>>=20
>>>>>>> why these new rdeps
>>>>>>=20
>>>>>> psmisc is for killall, git is for ... git :)
>>>>>=20
>>>>> I think busybox provides killall too.
>>>>=20
>>>> Ok, I'll remove this dep.
>>>>=20
>>>>>>=20
>>>>>> Some weeks ago, I bumped into this missing dependencies that made =
the
>>>>>> automatic execution of a test fail on a system without either =
killall
>>>>>> or git.
>>>>>=20
>>>>> OK. so I wonder if we dont have killall enabled in oe-core by =
default in
>>>>> busybox ? or does it need ps-misc one specifically ?
>>>>>=20
>>>>> git is interesting, does it clone some sources during executing =
tests ?
>>>>>=20
>>>> In kernel-task benchmarks a mainline Linux is cloned.  But maybe =
such
>>>> benchmarks do not make sense in oe.  Let me know, and I'll remove =
this
>>>> dep too.
>>>=20
>>> they are fine. We just need to understand that they are well meaning =
changes.
>>>=20
>>=20
>> So, is the patch ok, or shall I remove the psmisc dep?
>=20
> I think it will be good to understand why killall went missing without
> ps-misc package. As such patch is ok. Since I think killall should =
always
> be there, either from ps-misc or a backfill from busybox.
>=20

Sorry, I created a lot of confusion.

1) killall *was not* missing in any of the oe rootfs that I tested
(rootfs made by Anders, in CC).  killall was missing on a non-oe
remote machine, made available for my tests by a company.  So, I added
that dependency (in my S suite) to make it work on that machine.  For
this reason, I thought of adding this dependency to this recipe.  But,
if it is not needed, I'll remove it.

2) git is needed only if you want to run kernel-development tests.

That said, just tell me whether the patch is ok, or tell me what
dependencies to remove, and I'll make a V2.

Thanks,
Paolo

>>=20
>> Thanks,
>> Paolo


