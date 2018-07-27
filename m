Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 532EE78CCF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:58:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R8wnKx022129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Jul 2018 01:58:49 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 27 Jul 2018 01:58:49 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
	<20180713140616.15664-2-hongzhi.song@windriver.com>
	<CAJTo0LbXD42g6wJ4z3Kgg+TXSRaAueLgWzYjkkdq13YO3aVb+Q@mail.gmail.com>
	<37cf1c1d-c607-6ba3-20f0-8fe9e46706f1@windriver.com>
	<CAMKF1soQMbp7urcfEd0ri3XCQ=oyP_BwqJkoEDi8zDS1O4KqJg@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <729ad129-04ef-77b7-a70e-775e63a4b7d7@windriver.com>
Date: Fri, 27 Jul 2018 17:00:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soQMbp7urcfEd0ri3XCQ=oyP_BwqJkoEDi8zDS1O4KqJg@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Fri, 27 Jul 2018 08:58:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Raj,

Could you help to confirm that if the libelf exists in your recipe-sysroot?

Because I can't reproduce your error.


--Hongzhi


On 2018年07月27日 16:40, Khem Raj wrote:
> this fails on rpi
>
> ERROR: Logfile of failure stored in:
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/temp/log.do_compile.22198
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 CROSS_COMPILE=arm-bec-linux-gnueabi- ARCH=arm
> CC=arm-bec-linux-gnueabi-gcc  -march=armv7ve -mthumb -mfpu=neon-vfpv4
> -mfloat-abi=hard -mcpu=cortex-a7 -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security
> --sysroot=/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/recipe-sysroot
> AR=arm-bec-linux-gnueabi-ar LD=arm-bec-linux-gnueabi-ld
> --sysroot=/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/recipe-sysroot
>   DESTDIR=/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/image
> -C /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf
> | make: Entering directory
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
> | make -C ../../../lib/bpf
> OUTPUT=/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/
> | make[1]: Entering directory
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/lib/bpf'
> |
> | Auto-detecting system features:
> | ...                        libelf: [ ^[[31mOFF^[[m ]
> | ...                           bpf: [ ^[[31mOFF^[[m ]
> |
> | BPF API too old
> | make[1]: *** [Makefile:219: bpfdep] Error 255
> | make[1]: *** Waiting for unfinished jobs....
> | No libelf found
> | make[1]: *** [Makefile:216: elfdep] Error 255
> |   HOSTCC   /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/fixdep.o
> |   HOSTLD   /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/fixdep-in.o
> |   LINK     /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/fixdep
> | make[1]: Leaving directory
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/lib/bpf'
> | make: *** [Makefile:33:
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/libbpf.a]
> Error 2
> | make: Leaving directory
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf'
> | ERROR: oe_runmake failed
> | WARNING: /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/temp/run.do_compile.22198:1
> exit 1 from 'exit 1'
> | ERROR: Function failed: do_compile (log file is located at
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/kernel-selftest/1.0-r0/temp/log.do_compile.22198)
>
> On Mon, Jul 16, 2018 at 2:51 AM Hongzhi, Song
> <hongzhi.song@windriver.com> wrote:
>>
>>
>> On 2018年07月14日 00:23, Burton, Ross wrote:
>>> On 13 July 2018 at 15:06, Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \
>>> Why are you shipping your own copy of the kernel's COPYING file even
>>> though you copy another in that prefunc?
>>>
>>> Isn't it possible to just depend on kernel-source and build directly
>>> from the kernel source tree?
>>>
>>>> +# for bpf and vm
>>>> +DEPENDS = " \
>>>> +    elfutils \
>>>> +    libcap \
>>>> +    libcap-ng \
>>>> +    fuse \
>>>> +    util-linux \
>>>> +    rsync-native \
>>>> +"
>>> Really not convinced these dependencies are accurate.
>>>
>>>> +TEST_LIST = "bpf \
>>>> +             vm \
>>>> +"
>>> You're not listing memfd in here, but that is the only place which
>>> uses fuse as far as I can tell.
>>>
>>> My suggestion is to trim the DEPENDS back to the core minimum and use
>>> PACKAGECONIG to select what directories get built. This means you can
>>> have optional test suites where the dependencies are not in oe-core
>>> (fuse for memfd, for example), and get the right RDEPENDS too.
>>>
>>>> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/opt/kselftest/${i} install
>>> FHS says /opt is for sysadmin-installed tools that are not package
>>> managed.  You're building a package.  You're also building a package
>>> which is essentially ptest.  I'd say inherit ptest, write a runner,
>>> and put all the binaries in $PTESTDIR.
>> Hi Burton,
>>
>> kernel-selftest is designed to be shared by ptest and oe-self, and thus is
>> not supposed to inherit ptest.
>>
>> The suggestions you mentioned above will be modified soon.
>>
>> --Hongzhi
>>
>>> Ross
>>>


