Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E3EDD751D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2018 08:23:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s14so7716704wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2018 00:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=7q3OIHZq0L0rfyshgZAAIR992bsgPsnkYtzMk8NwG9k=;
	b=ChCYY+qa4Iaw5ugfjtZLPMkEcrkCSw61PW8yuncbTXibqjZplQecfXO5HFkURW0O96
	G37s203zvdY6X6mtvSX9o0yDGJVODsa/T/+CSbDoI5UFhNUVXDbGU6jEEztIISfbvxMA
	uRjk9YBmy8UjjMd90pDr72X0+EvRGxLb8tdgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=7q3OIHZq0L0rfyshgZAAIR992bsgPsnkYtzMk8NwG9k=;
	b=jh9J9ASIUE5JeVwQYGPlVHyU0B9/50C9P/L4p61PG5xxita+Ap+F256Y3yR6uqvzjZ
	VwGkyjuflwwsLWu5EOLBSmJLiGhEsvdhYSS9t/RV5P5+C0zJLUpJYiTjQ7r4kbYPImGR
	tTU2uj9Hp+9D8oHcDiuaPngADlX0egH4/zIgImgYLf8Q44aupf/FtZ/HwEQ2rMdudUEp
	k78fOEUyvaLXZht3lYruZwiY3CpZ3aa8BdANxYFDZCehgMyJ+7nPCrswYfNMDOHKZDqK
	S64ITa+qyjgGnJaQgqsG7xLTPCYJWUUGbsGZId7tsRevut9uferArZw+5GzA90BqhOqZ
	o9ig==
X-Gm-Message-State: AA+aEWbGNXZq8qHsrlxNuoKUl4167BCzm7KwyhISX1aMWKWWaNP+3ngQ
	HWi2gFSb9PyuVBeZqPq4G3VzIA==
X-Google-Smtp-Source: AFSGD/XB0mhn6aAXRmw2wYYQ/kA8dTKZRXwHOmN5IzPf0SklwG6gF2E9IbmCW/Dh3RU19A7Cj0A9jg==
X-Received: by 2002:a1c:90cb:: with SMTP id s194mr5429933wmd.57.1544862211255; 
	Sat, 15 Dec 2018 00:23:31 -0800 (PST)
Received: from [192.168.0.102] (146-241-179-194.dyn.eolo.it. [146.241.179.194])
	by smtp.gmail.com with ESMTPSA id
	o5sm12810756wmg.25.2018.12.15.00.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Dec 2018 00:23:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <CAMKF1srpE-9svv0bSzD1s-GZ1Z5qHjEmuOsU7hZWap8MZz9pSA@mail.gmail.com>
Date: Sat, 15 Dec 2018 09:23:29 +0100
Message-Id: <3A17F30D-06AE-46AA-A7FB-D35D60A47DE5@linaro.org>
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
	<6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
	<CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
	<47F5AE94-3A9F-4C6E-86C4-F56E4E7ADA18@linaro.org>
	<CAMKF1spYyDAxBCHrcA6jTYYT7v8tprHWF6ZOxBkQJc+n1_eQ6w@mail.gmail.com>
	<3B9426AF-6E9F-45D7-9D6C-AA0B83188CEF@linaro.org>
	<CAMKF1srVtW2Utpj1PBsYRo6xMuUuiXVTzN+9t_nxcVHg-=PXFg@mail.gmail.com>
	<57748E3B-3B23-4BEC-9673-EB348494EAD5@linaro.org>
	<CAMKF1sq93eTKUi-X9hK2co1SRTPf0UUbRZgOHzqbvfO=fq5+vA@mail.gmail.com>
	<CAMKF1srpE-9svv0bSzD1s-GZ1Z5qHjEmuOsU7hZWap8MZz9pSA@mail.gmail.com>
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
X-List-Received-Date: Sat, 15 Dec 2018 08:23:31 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Yep, sorry. I've just sent a V2 which should hopefully work.

Thanks for your patience,
Paolo

> Il giorno 13 dic 2018, alle ore 22:33, Khem Raj <raj.khem@gmail.com> =
ha scritto:
>=20
> btw. it fails on mips/musl
> http://errors.yoctoproject.org/Errors/Details/211648/
> On Thu, Dec 13, 2018 at 12:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> On Thu, Dec 13, 2018 at 11:13 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>=20
>>>=20
>>>=20
>>>> Il giorno 13 dic 2018, alle ore 18:24, Khem Raj =
<raj.khem@gmail.com> ha scritto:
>>>>=20
>>>> On Thu, Dec 13, 2018 at 9:20 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>> Il giorno 13 dic 2018, alle ore 18:18, Khem Raj =
<raj.khem@gmail.com> ha scritto:
>>>>>>=20
>>>>>> On Thu, Dec 13, 2018 at 9:16 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>>=20
>>>>>>>> Il giorno 13 dic 2018, alle ore 18:11, Khem Raj =
<raj.khem@gmail.com> ha scritto:
>>>>>>>>=20
>>>>>>>> On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>>> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj =
<raj.khem@gmail.com> ha scritto:
>>>>>>>>>>=20
>>>>>>>>>> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>>>>>>>>=20
>>>>>>>>>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
>>>>>>>>>>> ---
>>>>>>>>>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
>>>>>>>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>>>>=20
>>>>>>>>>>> diff --git =
a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>>>>>>> index 77d172814..166f3000a 100644
>>>>>>>>>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>>>>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>>>>>>> @@ -2,7 +2,7 @@ SUMMARY =3D "Small collection of benchmarks =
for storage I/O"
>>>>>>>>>>> LICENSE =3D "GPLv2"
>>>>>>>>>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>>>>>>>>>>=20
>>>>>>>>>>> -SRCREV =3D "79698f645bfb28d0d966484ddad3a1efb562246d"
>>>>>>>>>>> +SRCREV =3D "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
>>>>>>>>>>> PV =3D "0.0+git${SRCPV}"
>>>>>>>>>>> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>>>>>>>>>>>=20
>>>>>>>>>>> @@ -21,7 +21,8 @@ do_install() {
>>>>>>>>>>> install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>>>>>>>>>>> }
>>>>>>>>>>>=20
>>>>>>>>>>> -RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio =
libaio libaio-dev sysstat"
>>>>>>>>>>> +RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio =
libaio libaio-dev sysstat \
>>>>>>>>>>> +                 psmisc git"
>>>>>>>>>>=20
>>>>>>>>>> why these new rdeps
>>>>>>>>>=20
>>>>>>>>> psmisc is for killall, git is for ... git :)
>>>>>>>>=20
>>>>>>>> I think busybox provides killall too.
>>>>>>>=20
>>>>>>> Ok, I'll remove this dep.
>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> Some weeks ago, I bumped into this missing dependencies that =
made the
>>>>>>>>> automatic execution of a test fail on a system without either =
killall
>>>>>>>>> or git.
>>>>>>>>=20
>>>>>>>> OK. so I wonder if we dont have killall enabled in oe-core by =
default in
>>>>>>>> busybox ? or does it need ps-misc one specifically ?
>>>>>>>>=20
>>>>>>>> git is interesting, does it clone some sources during executing =
tests ?
>>>>>>>>=20
>>>>>>> In kernel-task benchmarks a mainline Linux is cloned.  But maybe =
such
>>>>>>> benchmarks do not make sense in oe.  Let me know, and I'll =
remove this
>>>>>>> dep too.
>>>>>>=20
>>>>>> they are fine. We just need to understand that they are well =
meaning changes.
>>>>>>=20
>>>>>=20
>>>>> So, is the patch ok, or shall I remove the psmisc dep?
>>>>=20
>>>> I think it will be good to understand why killall went missing =
without
>>>> ps-misc package. As such patch is ok. Since I think killall should =
always
>>>> be there, either from ps-misc or a backfill from busybox.
>>>>=20
>>>=20
>>> Sorry, I created a lot of confusion.
>>>=20
>>> 1) killall *was not* missing in any of the oe rootfs that I tested
>>> (rootfs made by Anders, in CC).  killall was missing on a non-oe
>>> remote machine, made available for my tests by a company.  So, I =
added
>>> that dependency (in my S suite) to make it work on that machine.  =
For
>>> this reason, I thought of adding this dependency to this recipe.  =
But,
>>> if it is not needed, I'll remove it.
>>=20
>> ok lets remove it
>>=20
>>>=20
>>> 2) git is needed only if you want to run kernel-development tests.
>>>=20
>>=20
>> lets keep it.
>>=20
>>> That said, just tell me whether the patch is ok, or tell me what
>>> dependencies to remove, and I'll make a V2.
>>=20
>> yes please.
>>=20
>>>=20
>>> Thanks,
>>> Paolo
>>>=20
>>>>>=20
>>>>> Thanks,
>>>>> Paolo
>>>=20


