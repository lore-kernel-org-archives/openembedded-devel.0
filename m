Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34A7160879
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2019 23:42:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9LNglTH006476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Oct 2019 16:42:47 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 21 Oct 2019 16:42:46 -0700
To: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost> <20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
	<83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
	<20191021113018.3c684d51@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <0411e8da-91a7-f586-2d65-490e8c327c2d@windriver.com>
Date: Mon, 21 Oct 2019 19:42:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021113018.3c684d51@gmail.com>
X-Originating-IP: [172.25.44.5]
Cc: Adrian Bunk <bunk@stusta.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCHv3] lmbench: Fix/clean-up the build for lmbench
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
X-List-Received-Date: Mon, 21 Oct 2019 23:42:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 10/21/19 5:30 AM, marek.bykowski@gmail.com wrote:
>> What's the "!" for ? It doesn't seem to be essential.
> It is a logical negation making warn_unused_result happy (one uses the result in the end) followed by a cast to void discarding the result. With only casting to void the compiler remains to warn.
Ah, right. I guess that's admirably terse even if it is visually and 
idiomatically ugly!
>> so did you consider just making a compiler specific fix/hack
>> for gcc/clang such as:
>>      #define __wur /* Ignore */
>> You could do that in each file that needs it.
>> While that's still ugly, it is at least more localized.
> In your hack/fix #define __wur /* Ignore */ should be preceded with #undef __wur, isn't it?
>
Yes.

> Yes, this should indeed be neater than "(void) !foo()" but my concern would be it may impact all the routines using __wur discarding they attributes and not only the ones of our interest (somehow a short list of the routines using __wur from glibc below). Not sure if this is a worry though, haven't inspected lmbench if uses any functions with __wur except the write/read being "fixed" by this "(void)!".
>
> $ grep -Irn extern.*__wur ./stdlib/stdlib.h
> 97:extern size_t __ctype_get_mb_cur_max (void) __THROW __wur;
> 385:extern char *l64a (long int __n) __THROW __wur;
> 634:extern char *getenv (const char *__name) __THROW __nonnull ((1)) __wur;
> 688:extern int mkstemp (char *__template) __nonnull ((1)) __wur;
> 698:extern int mkstemp64 (char *__template) __nonnull ((1)) __wur;
> 710:extern int mkstemps (char *__template, int __suffixlen) __nonnull ((1)) __wur;
> 731:extern char *mkdtemp (char *__template) __THROW __nonnull ((1)) __wur;
> 742:extern int mkostemp (char *__template, int __flags) __nonnull ((1)) __wur;
> 752:extern int mkostemp64 (char *__template, int __flags) __nonnull ((1)) __wur;
> 784:extern int system (const char *__command) __wur;
> 840:extern int abs (int __x) __THROW __attribute__ ((__const__)) __wur;
> 841:extern long int labs (long int __x) __THROW __attribute__ ((__const__)) __wur;
> 946:extern int rpmatch (const char *__response) __THROW __nonnull ((1)) __wur;
> 968:extern int posix_openpt (int __oflag) __wur;
> 985:extern char *ptsname (int __fd) __THROW __wur;


Yes, I  thought of that after sending my email.

Your fix is less intrusive and therefore lower risk.

>> Also, did you confirm that this change doesn't affect the
>> resulting binary code? I expect that it won't but it's a
>> benchmark so it's worth confirming.
> I think it will, as the write/read are parts of latency path but I feel this should be negligent eating up a tens/hundreds?! of CPU cycles (say with CPU 1G, 100 cycles is 10ns)
>
I may have a look at the assembly and do some testing but you're correct 
that a few instructions
on a read/write path is likely to be in the noise even in the ago of 
high speed storage devices.

>> Finally, lmbench hasn't released a new tarball on sf.net in 5 years:
>>      https://sourceforge.net/projects/lmbench/
>> There's a new somewhat active version of lmbench:
>>      https://github.com/intel/lmbench
>> Should we use that version?
> I'm not sure what is better, the original (sf.net) but not maintained in a quite few years or one taken over by one of the companies (intel), looked after by them, that is just making a use of it. Such company's project may go to an end of the life cycle leaving openembedded without the sources. Besides you never know who is committing and if you can rely on their changes. I think all together the biggest problem is that lmbench is being officially discontinued in a few years to date and to have reliable in openembedded I would be inclined somebody from openembedded takes the original over and maintains it (as intel did).


If you see the developer S-O-B line, the commit is on github without 
license changes,
and the code has been or can be reviewed then it should outlast even 
Intel! It would be
good if the original authors reviewed commits but they don't seen to be 
interested.
We have had Intel employees working on oe-core / meta-openembedded for years
so I hope that you will send the commit to that repo on github and 
indicate the
upstream-status in the patch what we integrate into meta-oe.

../Randy


>   
>> Sorry to leave this until v3 but the:
>>      (void) !foo()
>> syntax triggered me! ;-)
> Suppressing the warning I may refer to as to "better than nothing" but the golden solution would be to fix it properly and probably use the return as suggested by the authors of this routine/s.


-- 
# Randy MacLeod
# Wind River Linux


