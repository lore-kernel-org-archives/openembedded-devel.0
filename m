Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5118879BB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 15:25:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q12-v6so9024721wmq.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=GrQOxJE5CHMq+EYK2BoQDeU+r3ocDqfz+mRW3WPf6+c=;
	b=gybKzP+ulj/0m9qYDJfjKbsatpBU4Ua0k2mZ4hVLeje8G/cw2fu7+KESqtInwkW8TC
	gGgstryIABAqW/7d7p17iaCq+l0LUq4ILUlmFu6/ooiPA36JqcufJC/Q5HMxgmBFtf98
	JesaPT8B+NPw2RWB32iqgK3DscKTS2ARaSu3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=GrQOxJE5CHMq+EYK2BoQDeU+r3ocDqfz+mRW3WPf6+c=;
	b=L7tKboEj78KF7/uatqxHelBG0nxAxv+cJ9CwMdVMfwKPTC0NxOZcO3cMDnkkUx8gAb
	Jfkt9cD7+KGerMVxfD6GSfR/a8MrxdgfRZbnXvBlG5fjIG7cz0EDVtyfPTjV5hY+ErlU
	3pw91kY7XWJKh50fDZaFkj3AVj/Dm548EW5Pa+/tempvjN5ihWOWCQLovJRbhdiXUHMD
	Yy9oGConfGiciFj5WxYCCusnwylWsaxotsGEAbVhrqndV1ui1Dn54isK14qKtWg6iUBR
	WLG31mx+QyeMn5UdBarDKeQgBICG73mWeHhY9GFhiME6LcmMYYi1L1N5WEGNxiRcbc7E
	lzeg==
X-Gm-Message-State: AGRZ1gIH7osa1u7kgP2H4SoTSLM5mGYIf5730q8tp8J7r1Kd1XVes9Iy
	KRywjibxZjqKI0UlZnposfRiUw==
X-Google-Smtp-Source: AJdET5e/eWs5slaO324M8E077a8iY8sUjFcVETd0NioB4LSNkXJlUis/8x/MRYvTmaY+U583QYLo5A==
X-Received: by 2002:a1c:9cc9:: with SMTP id
	f192-v6mr2248542wme.135.1540913130674; 
	Tue, 30 Oct 2018 08:25:30 -0700 (PDT)
Received: from nbvalente.mat.unimo.it (nbvalente.mat.unimo.it. [155.185.5.181])
	by smtp.gmail.com with ESMTPSA id
	126-v6sm11498652wme.48.2018.10.30.08.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 08:25:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <f5c6f7be-c0c6-e06a-e16f-d7bc94df14cd@windriver.com>
Date: Tue, 30 Oct 2018 16:25:28 +0100
Message-Id: <ED25C675-C143-49AD-8A98-E235D05E3A8C@linaro.org>
References: <20181019145416.8021-1-anders.roxell@linaro.org>
	<407614ae-de48-8832-e3ad-1ab130f8c826@windriver.com>
	<CAMKF1spNk9udbn+_jr2GBA7r0cmZU2Yjny1zPdds8v5QxcwGtQ@mail.gmail.com>
	<CADYN=9+7AwJAPhr-59fU5nKTySat=auW6_ab-1WkAjpn4qYksQ@mail.gmail.com>
	<EC41D389-8D01-4486-A739-E2B838B05692@linaro.org>
	<f5c6f7be-c0c6-e06a-e16f-d7bc94df14cd@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
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
X-List-Received-Date: Tue, 30 Oct 2018 15:25:30 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Il giorno 25 ott 2018, alle ore 20:17, Randy MacLeod =
<randy.macleod@windriver.com> ha scritto:
>=20
> On 10/25/18 1:46 PM, Paolo Valente wrote:
>> [RESENDING: FIRST ATTEMPT REJECTED BECAUSE I WAS NOT SUBSCRIBED TO =
THE LIST]
>>> Il giorno 23 ott 2018, alle ore 15:33, Anders Roxell =
<anders.roxell@linaro.org> ha scritto:
>>>=20
>>> CCing in the package maintainer.
>>>=20
>> Thanks Anders, hi everybody,
>>> On Sun, 21 Oct 2018 at 17:10, Khem Raj <raj.khem@gmail.com> wrote:
>>>>=20
>>>> On Sun, Oct 21, 2018 at 12:29 AM Randy MacLeod
>>>> <randy.macleod@windriver.com> wrote:
>>>>>=20
>>>>> On 10/19/18 10:54 AM, Anders Roxell wrote:
>>>>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>>>>> ---
>>>>>> .../recipes-benchmark/s-suite/s-suite_git.bb  | 30 =
+++++++++++++++++++
>>>>>> 1 file changed, 30 insertions(+)
>>>>>> create mode 100644 =
meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>>=20
>>>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>> new file mode 100644
>>>>>> index 000000000000..77d172814065
>>>>>> --- /dev/null
>>>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>> @@ -0,0 +1,30 @@
>>>>>> +SUMMARY =3D "Small collection of benchmarks for storage I/O"
>>>>>> +LICENSE =3D "GPLv2"
>>>>>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>>>>> +
>>>>>> +SRCREV =3D "79698f645bfb28d0d966484ddad3a1efb562246d"
>>>>>> +PV =3D "0.0+git${SRCPV}"
>>>>>> +SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>>>>>> +
>>>>>> +S =3D "${WORKDIR}/git"
>>>>>> +
>>>>>> +# installing in /opt/S-suite since the package has
>>>>>> +# dependencies to the directory structure.
>>>>>> +do_install() {
>>>>>> +    install -d ${D}/opt/S-suite
>>>>>> +    for i in $(find ${S}/* -type d); do
>>>>>> +        install -d ${D}/opt/S-suite/$(basename $i)
>>>>>> +        install -m0755 -p ${S}/$(basename $i)/* =
${D}/opt/S-suite/$(basename $i)
>>>>>> +    done
>>>>>> +
>>>>>> +    install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
>>>>>> +    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>>>>>> +}
>>>>>> +
>>>>>> +RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat"
>>>>>> +
>>>>>> +FILES_${PN} =3D "/opt/S-suite/"
>>>>>> +
>>>>>> +# added to INSANE_SKIP since s-suite have an runtime
>>>>>> +# dependency (RDEPENDS) on libaio-dev.
>>>>>> +INSANE_SKIP_${PN} +=3D "dev-deps"
>>>>>>=20
>>>>>=20
>>>>> Thanks for the submission but from:
>>>>>=20
>>>>>   https://github.com/Algodev-github/S
>>>>>=20
>>>>>   "These benchmarks have been written just for internal use,
>>>>>    and are more a yard than a well-finished work."
>>>>>=20
>>>>>=20
>>>>> That doesn't lead to a lot of confidence that these suite will
>>>>> be maintained for years.
>> Gosh.  I put that disclaimer in the README when I first wrote it more
>> than 10 years ago.  After then, thousands of changes have been made =
by
>> me and many other contributors.  Unfortunately, I put the suite on
>> GitHub only recently.  But as you can see from the log, there have
>> been 448 commits in (less than) the last five months.
>> In addition, the S suite is now used in a new Phoronix benchmark and
>> in a new mmtests benchmark.
>=20
> Ah, good to know.
>=20
>> So, believe me, the S suite ATM is definitely in good shape, and =
seems
>> to be here to stay.
>> I'll remove that line, right after finishing a non-trivial new commit
>> I'm working on.
>>>>> What's the value to meta-oe users to add
>>>>> this recipe compared to something that has been around for years
>>>>> if not decades such as Bonnie++:
>>>>>   https://layers.openembedded.org/layerindex/recipe/864/
>>>>>=20
>>>>=20
>> The added value is that bonnie++ does not perform *any* of the =
benchmarks in the S suite, apart from that on throughput. I have made =
the S suite, many years ago, because I needed to run benchmarks that no =
suite provided. Here are some examples:
>> - start-up times of real applications under real background workloads
>> - playback quality (drop rate) of video and audio under real =
background workloads
>> - speed of code-development tasks (make, git checkout, git merge, git
>>  grep) under real background workloads, plus measurement of system
>>  responsiveness while one of these dev tasks is executed
>> - minimum per-client bandwidth guaranteed to a set of clients doing
>>  any possible type of I/O
>> - maximum per-client latency guaranteed to a set of clients doing any
>>  possible type of I/O
>> For any doubt, here I am.
>=20
> Thanks for the background Paolo.
>=20
> Perhaps when you get to the clean-up work, you will simplify the
> README based on your list above, move the details to another file
> and mention it at the end of the README.
>=20

Just done that too, thank you very much for this suggestion.

Paolo

> I withdraw my objection; this looks like a very useful
> set of benchmarks. Long live Algodev-github/S. ;-)
>=20
> ../Randy
>=20
>> Thanks,
>> Paolo
>>>> how I read this is that they have not made proper installation
>>>> targets and its dependencies or letting user know of the =
dependencies
>>>> which actually is not a problem with OE since both
>>>> of these would be taken care of in the recipe with
>>>> do_install and DEPENDS
>>>=20
>>> Do you mean DEPENDS or RDEPENDS?
>>>=20
>>> Cheers,
>>> Anders
>=20
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux


