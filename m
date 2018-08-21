Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFB679017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:27:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7L7RDrc025465
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 00:27:13 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 21 Aug 2018 00:27:12 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1534758107-254391-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sowGqeZ5CwiYFPBibooHjwWMuiPWRg=-FKrAjGi6yaiCA@mail.gmail.com>
	<5B7BBD04.20204@windriver.com>
	<CAMKF1so-+gSYZJGEJnaY9b_CT0fqDAWdAKMHtQxp+=OtJYESVA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B7BBE55.3000107@windriver.com>
Date: Tue, 21 Aug 2018 15:25:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so-+gSYZJGEJnaY9b_CT0fqDAWdAKMHtQxp+=OtJYESVA@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fio: disable compiler optimizations
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
X-List-Received-Date: Tue, 21 Aug 2018 07:27:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年08月21日 15:24, Khem Raj wrote:
> On Tue, Aug 21, 2018 at 12:21 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>>
>> On 2018年08月21日 15:19, Khem Raj wrote:
>>> On Mon, Aug 20, 2018 at 2:42 AM <mingli.yu@windriver.com> wrote:
>>>>
>>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>>
>>>> Add parameter "--disable-optimizations" to
>>>> configure script to disable compiler optimizations
>>>> to fix below issue:
>>>> $ gdb /usr/bin/fio
>>>> (gdb) r -h
>>>> Starting program: /usr/bin/fio -h
>>>> [Thread debugging using libthread_db enabled]
>>>> Using host libthread_db library "/lib64/libthread_db.so.1".
>>>>
>>>> Program received signal SIGILL, Illegal instruction.
>>>> 0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
>>>> 61      index_bits_to_maxindex[i] = (1UL << (i + 1)) - 1;
>>>> (gdb) bt
>>>>    #0 0x0000000000407220 in prio_tree_init () at lib/prio_tree.c:61
>>>>    #1 0x0000000000482208 in __libc_csu_init (argc=argc@entry=2,
>>>>       argv=argv@entry=0x7fffffffecc8, envp=0x7fffffffece0)
>>>>       at /usr/src/debug/glibc/2.26-r0/git/csu/elf-init.c:88
>>>>    #2 0x00000031c742095e in __libc_start_main (main=0x407700 <main>, argc=2,
>>>>       argv=0x7fffffffecc8, init=0x4821b6 <__libc_csu_init>,
>>>>       fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7fffffffecb8)
>>>>       at /usr/src/debug/glibc/2.26-r0/git/csu/libc-start.c:264
>>>>    #3 0x00000000004077ea in _start () at ../sysdeps/x86_64/start.S:120
>>>>
>>>
>>> Please check if you see this issue on master branch
>>> secondly, while you are here please upgrade to 3.8 release and see
>>> if this fixes the issue you are seeing.
>>
>> Yes, this issue exists in master, and even upgrade to 3.8, the issue
>> still exist.
>>
>
> OK. lets update regardless.

Okay, I will send v2 to include the upgrade patch.

Thanks,

>
>> Thanks,
>>
>>>
>>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>>> ---
>>>>    meta-oe/recipes-benchmark/fio/fio_3.7.bb | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.7.bb b/meta-oe/recipes-benchmark/fio/fio_3.7.bb
>>>> index 410e27b..9bec2df 100644
>>>> --- a/meta-oe/recipes-benchmark/fio/fio_3.7.bb
>>>> +++ b/meta-oe/recipes-benchmark/fio/fio_3.7.bb
>>>> @@ -32,6 +32,7 @@ S = "${WORKDIR}/git"
>>>>    DISABLE_STATIC = ""
>>>>
>>>>    EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
>>>> +EXTRA_OECONF = "--disable-optimizations"
>>>>
>>>>    do_configure() {
>>>>        ./configure ${EXTRA_OECONF}
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>

