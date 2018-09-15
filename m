Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6995795C0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 11:30:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8FBUZ6Z022650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 15 Sep 2018 04:30:35 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 04:30:23 -0700
To: Andrea Adami <andrea.adami@gmail.com>
References: <1536948135-11493-1-git-send-email-andrea.adami@gmail.com>
	<e7e25946-8c75-4cd6-9b1b-3aaa6fdd4a5b@windriver.com>
	<CAAQYJAutgBtf4bmNagBkAo4ATnbC_P_4B4R31mzM_5bRKyHAxQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <fae3f605-3c1a-e0cb-209f-5d2aca70e075@windriver.com>
Date: Sat, 15 Sep 2018 19:30:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAAQYJAutgBtf4bmNagBkAo4ATnbC_P_4B4R31mzM_5bRKyHAxQ@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH v2] klibc: fix build on i386 with GCC and security flags enabled
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
X-List-Received-Date: Sat, 15 Sep 2018 11:30:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月15日 18:58, Andrea Adami wrote:
> On Sat, Sep 15, 2018 at 10:15 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 2018年09月15日 02:02, Andrea Adami wrote:
>>> ld fails if distro's security-flags are enabled:
>>> Inject the SECURITY_XFLAGS if security_flags.inc was included.
>>>
>>> Fix on i386: ld: discarded output section: `.got.plt'
>>>
>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ---
>>>    meta-initramfs/recipes-devtools/klibc/klibc.inc | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>>> index 3d25e96..837b026 100644
>>> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
>>> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>>> @@ -47,7 +47,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>>>                    'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
>>>                     V=1 \
>>>                    "
>>> -EXTRA_OEMAKE += 'EXTRA_KLIBCAFLAGS="-Wa,--noexecstack" EXTRA_KLIBCLDFLAGS="-z noexecstack"'
>>> +EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=${SECURITY_CFLAGS} -Wa,--noexecstack' \
>>> +                 'EXTRA_KLIBCLDFLAGS=${SECURITY_LDFLAGS} -z noexecstack'"
>>>
>> Is it necessary to pass SECURITY_XFLAGS directly? While including
>> security_flags.inc,
>> CC will contain SECURITY_CFLAGS and LDFLAGS will contain SECURITY_LDFLAGS.
>> Maybe you should make sure  to pass LDFLAGS to EXTRA_KLIBCLDFLAGS to avoid
>> ldflags qa warning.
>>
>> [security_flags.inc]
>>    58 TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
>>    59 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
>> [security_flags.inc]
>>
>>>    export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
>>>    KLIBCTHUMB = "${@['CONFIG_KLIBC_THUMB=n', 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
>>> @@ -74,5 +75,4 @@ KLIBC_ARCH_powerpc = "ppc"
>>>    KLIBC_ARCH_powerpc64 = "ppc64"
>>>    THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
>>>
>>> -SECURITY_CFLAGS = "-fno-PIE -no-pie"
>>> -SECURITY_LDFLAGS = "-no-pie"
>>> +SECURITY_LDFLAGS = "${@'-z relro -z now -pie' if '${GCCPIE}' else ''}"
>> The same reason, it is not necessary to test GCCPIE,
>>
>> and it missed "-Wl,"?, how about directly set SECURITY_STACK_PROTECTOR = ""
>>
> Hi,
> thanks for reviewing.
>
> It is true the SECURITY_CFLAGS are passed to the compiler.
> The problem is, klibc has its own arch makefiles (MCONFIG) and the
> linker is called directly, so if you just append the LDFLAGS like
> this:
>
> EXTRA_OEMAKE += "'EXTRA_KLIBCAFLAGS=-Wa,--noexecstack' \
>                   'EXTRA_KLIBCLDFLAGS=${LDFLAGS} -z noexecstack'"
>
> you get:
>
>    i586-oe-linux-musl-ld.bfd -m elf_i386 -o usr/kinit/ipconfig/static/ipconfig -W
> l,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -z relro -z now -pie -z noexecstack u
> sr/klibc/arch/i386/crt0.o --start-group  usr/kinit/ipconfig/main.o usr/kinit/ipc
> onfig/netdev.o usr/kinit/ipconfig/packet.o usr/kinit/ipconfig/dhcp_proto.o usr/k
> init/ipconfig/bootp_proto.o  usr/klibc/libc.a /tmp/build/tmp-musl/work/i586-oe-l
> inux-musl/klibc/2.0.4-r0/recipe-sysroot/usr/lib/i586-oe-linux-musl/*/libgcc.a --
> end-group ; cp -f usr/kinit/ipconfig/static/ipconfig usr/kinit/ipconfig/static/i
> pconfig.g ; i586-oe-linux-musl-strip --strip-all -R .comment -R .note --strip-al
> l -R .comment -R .note --strip-all -R .comment -R .note usr/kinit/ipconfig/stati
> c/ipconfig
> i586-oe-linux-musl-ld.bfd: unrecognized option '-Wl,-O1'
>
> Thus I am expliciting the SECURITY_LDFLAGS.
>
> Note that this patch, injecting the -pie, does now break build for mips,
> because the MCONFIG foir mips disables pic.
> The immediate fix is to remove -pie for mips (standard behavior).

OK, thanks for the explain

//Hongxu

> Cheers
> Andrea
>
>
>> //Hongxu
>>


