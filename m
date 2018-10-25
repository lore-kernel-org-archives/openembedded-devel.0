Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9B583606D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 17:46:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y140-v6so2447964wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 10:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lB5wYB0HOxSxkoBc6oJ4TMDbR07Zgm4U3tFqoh6/oOc=;
	b=DgDk8FMXPUpXygJmX6RZKad8dFVqcUaMIk/R++8hl8XLUjhQ6R5xZAe1cAMTKmgrtR
	d4nqLIAhVVCXOwuojdzP0TEpjPbgaqa73PEYf6rzpCgzTYBvVEC8/T6RR1d9FhP1T8Xl
	EYAtT0llpi63Co+DVvekbb/zeb6WADilhGXBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lB5wYB0HOxSxkoBc6oJ4TMDbR07Zgm4U3tFqoh6/oOc=;
	b=HoxegviqcF1VG8970coBGOqHsXdASzEoaxtUIgsfdAKP1wphneS2pI/jjth+VqN+hx
	K9QnAXYV71bvcPEuY4K1LhMCRK4s8qtfl2hhrKNkVnX30UuNN5+ZyVtOE8MvZ8/iip3v
	2bpRwMr6k1tjZeiWAQcUkq66KLvMm/QZgI7VMnzel716aexEuW19oGJ8N+lyHsNFbqir
	pynPQh6LpAhZEtyiZHHauToh51Lnt8x0TS5tt9HKUO/grhMQz1nHXv4VO8fqOJMiQd8S
	lkJRrt7ENpQJaA/jAdPcOeCXfjnZgZ1nMNi0twFKts11LgfXA7UAwioNtr01ErPiq2JQ
	R7GA==
X-Gm-Message-State: AGRZ1gJoSLzG+cK90s195Ikw+mKZyjsFkjn25Rbtsqe9xefEf+SvieCd
	4Bcw72z03hFd/UIH/zpNQBuaSg==
X-Google-Smtp-Source: AJdET5cGOUiIj/OXHXUsffBvEJzgxHv3Frtxm0XoqhtVgaGIimsLx8cUONC2TE/Us3z5Zc1y6MWWHA==
X-Received: by 2002:a1c:ce8a:: with SMTP id
	e132-v6mr2807286wmg.26.1540489577173; 
	Thu, 25 Oct 2018 10:46:17 -0700 (PDT)
Received: from [192.168.0.101] (146-241-43-227.dyn.eolo.it. [146.241.43.227])
	by smtp.gmail.com with ESMTPSA id
	e142-v6sm4191345wmf.20.2018.10.25.10.46.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Oct 2018 10:46:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <CADYN=9+7AwJAPhr-59fU5nKTySat=auW6_ab-1WkAjpn4qYksQ@mail.gmail.com>
Date: Thu, 25 Oct 2018 19:46:15 +0200
Message-Id: <EC41D389-8D01-4486-A739-E2B838B05692@linaro.org>
References: <20181019145416.8021-1-anders.roxell@linaro.org>
	<407614ae-de48-8832-e3ad-1ab130f8c826@windriver.com>
	<CAMKF1spNk9udbn+_jr2GBA7r0cmZU2Yjny1zPdds8v5QxcwGtQ@mail.gmail.com>
	<CADYN=9+7AwJAPhr-59fU5nKTySat=auW6_ab-1WkAjpn4qYksQ@mail.gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>
X-Mailer: Apple Mail (2.3445.100.39)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] add a storage I/O benchmark test suite
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
X-List-Received-Date: Thu, 25 Oct 2018 17:46:17 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

[RESENDING: FIRST ATTEMPT REJECTED BECAUSE I WAS NOT SUBSCRIBED TO THE =
LIST]

> Il giorno 23 ott 2018, alle ore 15:33, Anders Roxell =
<anders.roxell@linaro.org> ha scritto:
>=20
> CCing in the package maintainer.
>=20

Thanks Anders, hi everybody,

> On Sun, 21 Oct 2018 at 17:10, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> On Sun, Oct 21, 2018 at 12:29 AM Randy MacLeod
>> <randy.macleod@windriver.com> wrote:
>>>=20
>>> On 10/19/18 10:54 AM, Anders Roxell wrote:
>>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>>> ---
>>>> .../recipes-benchmark/s-suite/s-suite_git.bb  | 30 =
+++++++++++++++++++
>>>> 1 file changed, 30 insertions(+)
>>>> create mode 100644 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>=20
>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> new file mode 100644
>>>> index 000000000000..77d172814065
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>> @@ -0,0 +1,30 @@
>>>> +SUMMARY =3D "Small collection of benchmarks for storage I/O"
>>>> +LICENSE =3D "GPLv2"
>>>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>>> +
>>>> +SRCREV =3D "79698f645bfb28d0d966484ddad3a1efb562246d"
>>>> +PV =3D "0.0+git${SRCPV}"
>>>> +SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +# installing in /opt/S-suite since the package has
>>>> +# dependencies to the directory structure.
>>>> +do_install() {
>>>> +    install -d ${D}/opt/S-suite
>>>> +    for i in $(find ${S}/* -type d); do
>>>> +        install -d ${D}/opt/S-suite/$(basename $i)
>>>> +        install -m0755 -p ${S}/$(basename $i)/* =
${D}/opt/S-suite/$(basename $i)
>>>> +    done
>>>> +
>>>> +    install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
>>>> +    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>>>> +}
>>>> +
>>>> +RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat"
>>>> +
>>>> +FILES_${PN} =3D "/opt/S-suite/"
>>>> +
>>>> +# added to INSANE_SKIP since s-suite have an runtime
>>>> +# dependency (RDEPENDS) on libaio-dev.
>>>> +INSANE_SKIP_${PN} +=3D "dev-deps"
>>>>=20
>>>=20
>>> Thanks for the submission but from:
>>>=20
>>>   https://github.com/Algodev-github/S
>>>=20
>>>   "These benchmarks have been written just for internal use,
>>>    and are more a yard than a well-finished work."
>>>=20
>>>=20
>>> That doesn't lead to a lot of confidence that these suite will
>>> be maintained for years.

Gosh.  I put that disclaimer in the README when I first wrote it more
than 10 years ago.  After then, thousands of changes have been made by
me and many other contributors.  Unfortunately, I put the suite on
GitHub only recently.  But as you can see from the log, there have
been 448 commits in (less than) the last five months.

In addition, the S suite is now used in a new Phoronix benchmark and
in a new mmtests benchmark.

So, believe me, the S suite ATM is definitely in good shape, and seems
to be here to stay.

I'll remove that line, right after finishing a non-trivial new commit
I'm working on.

>>> What's the value to meta-oe users to add
>>> this recipe compared to something that has been around for years
>>> if not decades such as Bonnie++:
>>>   https://layers.openembedded.org/layerindex/recipe/864/
>>>=20
>>=20

The added value is that bonnie++ does not perform *any* of the =
benchmarks in the S suite, apart from that on throughput. I have made =
the S suite, many years ago, because I needed to run benchmarks that no =
suite provided. Here are some examples:
- start-up times of real applications under real background workloads
- playback quality (drop rate) of video and audio under real background =
workloads
- speed of code-development tasks (make, git checkout, git merge, git
 grep) under real background workloads, plus measurement of system
 responsiveness while one of these dev tasks is executed
- minimum per-client bandwidth guaranteed to a set of clients doing
 any possible type of I/O
- maximum per-client latency guaranteed to a set of clients doing any
 possible type of I/O

For any doubt, here I am.

Thanks,
Paolo

>> how I read this is that they have not made proper installation
>> targets and its dependencies or letting user know of the dependencies
>> which actually is not a problem with OE since both
>> of these would be taken care of in the recipe with
>> do_install and DEPENDS
>=20
> Do you mean DEPENDS or RDEPENDS?
>=20
> Cheers,
> Anders


