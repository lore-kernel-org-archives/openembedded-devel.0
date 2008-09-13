Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KeVY4-0005FJ-FZ
	for openembedded-devel@openembedded.org; Sat, 13 Sep 2008 15:52:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KeVVI-0000wf-HY
	for openembedded-devel@openembedded.org; Sat, 13 Sep 2008 13:49:36 +0000
Received: from 83.97.10.177 ([83.97.10.177])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 13 Sep 2008 13:49:36 +0000
Received: from k.kooi by 83.97.10.177 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 13 Sep 2008 13:49:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 13 Sep 2008 15:49:24 +0200
Message-ID: <gaggd6$86a$1@ger.gmane.org>
References: <20080911195243.GA16359@denix.org>	<20080912000208.GA12469@gmail.com>	<20080912015320.GB17523@denix.org>
	<20080912021136.GA20033@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 83.97.10.177
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080901030016 Shredder/3.0b1pre
In-Reply-To: <20080912021136.GA20033@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: SDK/external-toolchain fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Sep 2008 13:52:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (11/09/08 21:53), Denys Dmytriyenko wrote:
>> First of all, thanks for your review.
>>
>> On Thu, Sep 11, 2008 at 05:02:08PM -0700, Khem Raj wrote:
>>> On (11/09/08 15:52), Denys Dmytriyenko wrote:
>>>> #1 gcc-cross-sdk 4.3.1 missing include-fixed
>>>> http://bugs.openembedded.net/show_bug.cgi?id=4536
>>>>
>>>> gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
>>>> which are missing in the gcc-cross-sdk version, rendering external toolchain
>>>> unusable.
>>> I do not like this fix. IMO Instead of copying them into include directory
>>> they should be let alone in include-fixed directory and packaged. You should
>>> add knowledge of this new directory to the failing package instead. What
>>> packages are broken because of this.
>> I agree that this is not a proper fix, but rather a hack. glibc has its own
>> limits.h, which wants to include gcc's limits.h like this:
>>
>>   /* Get the compiler's limits.h, which defines almost all the ISO constants.
>>      We put this #include_next outside the double inclusion check because
>>      it should be possible to include this file more than once and still get
>>      the definitions from gcc's header.  */
>> #if defined __GNUC__&&  !defined _GCC_LIMITS_H_
>> /* `_GCC_LIMITS_H_' is what GCC's file defines.  */
>> # include_next<limits.h>
>> #endif
>>
>> This issue was brought up before, but as far as I can tell, it wasn't fixed
>> properly.
>> This is initial Koen's post about the issue:
>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005108.html
>> And here is your own reply with one of the possible solutions:
>> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-April/005111.html
>>
>
> right. So can you try this patch and see if this fixes the problem ?
>
>> Here is how it's "solved" (i.e. worked around) in gcc-cross_4.3.1.bb (4.3.2):
>>
>> # Hack till we fix *libc properly
>> do_stage_append() {
>>          ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
>> }
>>
>> I'd love to see it fixed properly, but for now I'm trying to bring
>> gcc-cross-sdk on par with gcc-cross.
>>
>>>> Provided patch copies them in the include directory as a temporary solution.
>>>> A similar temporary solution is present in gcc-cross_4.3.1, see
>>>> do_stage_append()
>>>>
>>>>
>>>> #2 external-toolchain misses providing runtime libgcc
>>>> http://bugs.openembedded.net/show_bug.cgi?id=4542
>>>>
>>>> Since external-toolchain misses specifying libgcc as provided runtime library,
>>>> dependency tree picks up either gcc-cross or even gcc-noemu...
>>> This one seems ok to me.
>> Thanks! Whom should I ping to get it commited?
>
> I can do it.

gcc_4.3.x.bb also needs a fix since I get all kinds of limits.h related 
errors when trying to do native compilation on the beagle.

regards,

Koen



