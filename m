Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A000D6C4BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:16:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c126so3188586wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 09:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=f2a7ETGppJKDk0yzsT2HeXUag/6RIapAMV+93sV24xE=;
	b=YSEUBAslC3VjSihrWucvIlrOOf4f9P7WsUiuNmwWCpYVGV07C1tgTbpCUxqX7v3sCj
	J1r0NSf1J6Aqh+33XMHdLR7hdrIgqq5ejff3zkQ5no9MgUE3o4gnD9RNae+kJ3L8sK9M
	Cjo0dmrPrdRWBJEUtklEOOo73zKOL4Em3xch4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=f2a7ETGppJKDk0yzsT2HeXUag/6RIapAMV+93sV24xE=;
	b=Gu30xaFGz6GvNHEhyhpeKu8uxaf8UMtxCUf/QoA1zz4HXyMpBCnXHdAJBL9Soy/mgn
	iDvT2F5+GOD0ikBDIVywHr/RJknn2tP0jW+42/cqrDjYaqe1qeQTjdDUGx4H/y18W9Am
	2L1VhFq6j+o/LjobpKC0Bht+xsYfESTZNbJCibKzmBgUtkyNoo0kWUlypFZy0WlfhxiO
	4EB81wOKcPI2NDtKWcO45G8mUiQrN7V0xAt7tFRl815q8kae3cXrNbetasMil/vhpEtL
	sfIDkcCW0yLaixq+AiOh0xZTAS+OUzFXkeb5X1L6ZQ1CwKJLyGWGyt0u/6YE88DBQFHc
	wK7g==
X-Gm-Message-State: AA+aEWbh3Jl+ImE6hV2LdslAcqhyqB9DLKDVAs4/KA/C1hpuyJD/IQLP
	xRfItNPusb3RN19fP0HBN/YnOQ==
X-Google-Smtp-Source: AFSGD/XMrNh7dw5yDL2+KuiOVbPOs5sViu/9CQozM5wBRISc0iwa7MSnYeaGfoIN3ncY8jNhE+J2SA==
X-Received: by 2002:a1c:9e4a:: with SMTP id h71mr221042wme.82.1544721384148;
	Thu, 13 Dec 2018 09:16:24 -0800 (PST)
Received: from [192.168.0.101] (146-241-196-218.dyn.eolo.it. [146.241.196.218])
	by smtp.gmail.com with ESMTPSA id
	b18sm2900071wrr.43.2018.12.13.09.16.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 09:16:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
Date: Thu, 13 Dec 2018 18:16:22 +0100
Message-Id: <47F5AE94-3A9F-4C6E-86C4-F56E4E7ADA18@linaro.org>
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
	<6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
	<CAMKF1sqpeovnSSpswY4s2ZzZfE15tQoVhdu4m6rjuDkgP7ODfw@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Dec 2018 17:16:24 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Il giorno 13 dic 2018, alle ore 18:11, Khem Raj <raj.khem@gmail.com> =
ha scritto:
>=20
> On Thu, Dec 13, 2018 at 7:33 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>=20
>>=20
>>=20
>>> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj <raj.khem@gmail.com> =
ha scritto:
>>>=20
>>> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>>>=20
>>>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
>>>> ---
>>>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> index 77d172814..166f3000a 100644
>>>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> @@ -2,7 +2,7 @@ SUMMARY =3D "Small collection of benchmarks for =
storage I/O"
>>>> LICENSE =3D "GPLv2"
>>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>>>=20
>>>> -SRCREV =3D "79698f645bfb28d0d966484ddad3a1efb562246d"
>>>> +SRCREV =3D "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
>>>> PV =3D "0.0+git${SRCPV}"
>>>> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>>>>=20
>>>> @@ -21,7 +21,8 @@ do_install() {
>>>>    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>>>> }
>>>>=20
>>>> -RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat"
>>>> +RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat \
>>>> +                 psmisc git"
>>>=20
>>> why these new rdeps
>>=20
>> psmisc is for killall, git is for ... git :)
>=20
> I think busybox provides killall too.

Ok, I'll remove this dep.

>>=20
>> Some weeks ago, I bumped into this missing dependencies that made the
>> automatic execution of a test fail on a system without either killall
>> or git.
>=20
> OK. so I wonder if we dont have killall enabled in oe-core by default =
in
> busybox ? or does it need ps-misc one specifically ?
>=20
> git is interesting, does it clone some sources during executing tests =
?
>=20
In kernel-task benchmarks a mainline Linux is cloned.  But maybe such
benchmarks do not make sense in oe.  Let me know, and I'll remove this
dep too.


Thanks,
Paolo

>>=20
>> If these dependencies are certainly useless for oe, then I'll remove =
them.
>>=20
>> Thanks,
>> Paolo
>>=20
>>>>=20
>>>> FILES_${PN} =3D "/opt/S-suite/"
>>>>=20
>>>> --
>>>> 2.16.1
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20


