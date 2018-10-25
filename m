Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4908878F72
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 18:17:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9PIGsFV026176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Oct 2018 11:17:15 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 25 Oct 2018 11:17:04 -0700
To: Paolo Valente <paolo.valente@linaro.org>, Anders Roxell
	<anders.roxell@linaro.org>
References: <20181019145416.8021-1-anders.roxell@linaro.org>
	<407614ae-de48-8832-e3ad-1ab130f8c826@windriver.com>
	<CAMKF1spNk9udbn+_jr2GBA7r0cmZU2Yjny1zPdds8v5QxcwGtQ@mail.gmail.com>
	<CADYN=9+7AwJAPhr-59fU5nKTySat=auW6_ab-1WkAjpn4qYksQ@mail.gmail.com>
	<EC41D389-8D01-4486-A739-E2B838B05692@linaro.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f5c6f7be-c0c6-e06a-e16f-d7bc94df14cd@windriver.com>
Date: Thu, 25 Oct 2018 14:17:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <EC41D389-8D01-4486-A739-E2B838B05692@linaro.org>
X-Originating-IP: [172.25.44.4]
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
X-List-Received-Date: Thu, 25 Oct 2018 18:17:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/25/18 1:46 PM, Paolo Valente wrote:
> [RESENDING: FIRST ATTEMPT REJECTED BECAUSE I WAS NOT SUBSCRIBED TO THE LIST]
> 
>> Il giorno 23 ott 2018, alle ore 15:33, Anders Roxell <anders.roxell@linaro.org> ha scritto:
>>
>> CCing in the package maintainer.
>>
> 
> Thanks Anders, hi everybody,
> 
>> On Sun, 21 Oct 2018 at 17:10, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Sun, Oct 21, 2018 at 12:29 AM Randy MacLeod
>>> <randy.macleod@windriver.com> wrote:
>>>>
>>>> On 10/19/18 10:54 AM, Anders Roxell wrote:
>>>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>>>>> ---
>>>>> .../recipes-benchmark/s-suite/s-suite_git.bb  | 30 +++++++++++++++++++
>>>>> 1 file changed, 30 insertions(+)
>>>>> create mode 100644 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>>
>>>>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>> new file mode 100644
>>>>> index 000000000000..77d172814065
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>>>>> @@ -0,0 +1,30 @@
>>>>> +SUMMARY = "Small collection of benchmarks for storage I/O"
>>>>> +LICENSE = "GPLv2"
>>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
>>>>> +
>>>>> +SRCREV = "79698f645bfb28d0d966484ddad3a1efb562246d"
>>>>> +PV = "0.0+git${SRCPV}"
>>>>> +SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
>>>>> +
>>>>> +S = "${WORKDIR}/git"
>>>>> +
>>>>> +# installing in /opt/S-suite since the package has
>>>>> +# dependencies to the directory structure.
>>>>> +do_install() {
>>>>> +    install -d ${D}/opt/S-suite
>>>>> +    for i in $(find ${S}/* -type d); do
>>>>> +        install -d ${D}/opt/S-suite/$(basename $i)
>>>>> +        install -m0755 -p ${S}/$(basename $i)/* ${D}/opt/S-suite/$(basename $i)
>>>>> +    done
>>>>> +
>>>>> +    install -m0755 ${S}/config_params.sh ${D}/opt/S-suite
>>>>> +    install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>>>>> +}
>>>>> +
>>>>> +RDEPENDS_${PN} = "bash bc coreutils gawk g++ gcc fio libaio libaio-dev sysstat"
>>>>> +
>>>>> +FILES_${PN} = "/opt/S-suite/"
>>>>> +
>>>>> +# added to INSANE_SKIP since s-suite have an runtime
>>>>> +# dependency (RDEPENDS) on libaio-dev.
>>>>> +INSANE_SKIP_${PN} += "dev-deps"
>>>>>
>>>>
>>>> Thanks for the submission but from:
>>>>
>>>>    https://github.com/Algodev-github/S
>>>>
>>>>    "These benchmarks have been written just for internal use,
>>>>     and are more a yard than a well-finished work."
>>>>
>>>>
>>>> That doesn't lead to a lot of confidence that these suite will
>>>> be maintained for years.
> 
> Gosh.  I put that disclaimer in the README when I first wrote it more
> than 10 years ago.  After then, thousands of changes have been made by
> me and many other contributors.  Unfortunately, I put the suite on
> GitHub only recently.  But as you can see from the log, there have
> been 448 commits in (less than) the last five months.
> 
> In addition, the S suite is now used in a new Phoronix benchmark and
> in a new mmtests benchmark.

Ah, good to know.

> 
> So, believe me, the S suite ATM is definitely in good shape, and seems
> to be here to stay.
> 
> I'll remove that line, right after finishing a non-trivial new commit
> I'm working on.
> 
>>>> What's the value to meta-oe users to add
>>>> this recipe compared to something that has been around for years
>>>> if not decades such as Bonnie++:
>>>>    https://layers.openembedded.org/layerindex/recipe/864/
>>>>
>>>
> 
> The added value is that bonnie++ does not perform *any* of the benchmarks in the S suite, apart from that on throughput. I have made the S suite, many years ago, because I needed to run benchmarks that no suite provided. Here are some examples:
> - start-up times of real applications under real background workloads
> - playback quality (drop rate) of video and audio under real background workloads
> - speed of code-development tasks (make, git checkout, git merge, git
>   grep) under real background workloads, plus measurement of system
>   responsiveness while one of these dev tasks is executed
> - minimum per-client bandwidth guaranteed to a set of clients doing
>   any possible type of I/O
> - maximum per-client latency guaranteed to a set of clients doing any
>   possible type of I/O
> 
> For any doubt, here I am.

Thanks for the background Paolo.

Perhaps when you get to the clean-up work, you will simplify the
README based on your list above, move the details to another file
and mention it at the end of the README.

I withdraw my objection; this looks like a very useful
set of benchmarks. Long live Algodev-github/S. ;-)

../Randy

> 
> Thanks,
> Paolo
> 
>>> how I read this is that they have not made proper installation
>>> targets and its dependencies or letting user know of the dependencies
>>> which actually is not a problem with OE since both
>>> of these would be taken care of in the recipe with
>>> do_install and DEPENDS
>>
>> Do you mean DEPENDS or RDEPENDS?
>>
>> Cheers,
>> Anders
> 


-- 
# Randy MacLeod
# Wind River Linux

