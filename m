Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GxX7w-0002Nq-LC
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Dec 2006 00:15:04 +0100
Received: by nf-out-0910.google.com with SMTP id l24so2986596nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2006 15:12:35 -0800 (PST)
Received: by 10.49.107.8 with SMTP id j8mr2030590nfm.1166742755201;
	Thu, 21 Dec 2006 15:12:35 -0800 (PST)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id n23sm42158433nfc.2006.12.21.15.12.34;
	Thu, 21 Dec 2006 15:12:35 -0800 (PST)
Date: Fri, 22 Dec 2006 01:12:34 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <161362296.20061222011234@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <458AD0BE.2090100@dominion.kabel.utwente.nl>
References: <458AC366.3030405@dominion.kabel.utwente.nl>
	<1151969252.20061221194402@gmail.com>
	<458AD0BE.2090100@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] Enable tune-thumb.inc for all armv5t and armv6t machines
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Dec 2006 23:15:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, December 21, 2006, 8:21:50 PM, you wrote:

[]

>>> Today I seperated the thumb bits from
>>> conf/machine/include/ipx4xx.conf into
>>> conf/machine/include/. I'd like to enable for all >=v5t machines, but I'm unsure about
>>> using positive or negative logic.
>> 
>>   What about armv4t?

> The codesourcery people are telling horror stories to everyone about armv4t, but I don't
> believe them anymore after
> http://www.openembedded.org/repo/org.openembedded.dev/packages/gcc/gcc-4.1.1/unbreak-armv4t.patch
> 'fixed' EABI on armv4t. I get the distinct feeling csl is trying to strongarm people into
> using armv5 and armv6.

>>  plus, thumb has known drawback of reduced performance.

> I know the 'bx' insn causes a pipeline flush on xscales, any other drawbacks? And more
> importantly, any numbers?

  Well common Thumb intros usually have something like "Using Thumb
can usually reduce code size 1.5 times, while reducing performance by
20% because of longer instruction sequences for some operations.".
Or at least so I think. Because it turned out surprisingly hard to
find a link for that ;-). I finally found a pretty good academic
report: http://www.cs.arizona.edu/~gupta/research/Publications/Comp/L14-krishnaswamy.pdf

"""
While the use of Thumb instructions generally gives smaller code
size and lower instruction cache energy, there are certain problems
with using the Thumb mode. In many cases the reductions in code
size are obtained at the expense of a significant increase in the number
of instructions executed by the program. In our experiments
this increase ranged from 9% to 41%.
"""

  As each thumb instr maps to one ARM, those percentages are exactly
performance loss. So, we don't really want Thumb for gstreamer,
mpalyer, and glibc (sic!, way to reduce libc's footprint is obviously
to use uclibc ;-)).

  Two other common benefits of Thumb quoted are reduced memory
bandwidth requirements (like, can use 16bit memory), and cache
efficiency (including power) - but before we start optimize cache
usage, there'er few more significant things to do, like supporting
CPU idle modes, using dynticks, etc.


  So, two criteria above doesn't apply to us much, and indeed, it
appears that Thumb vs ARM instr. set is code size vs code
performance dichotomy in our case.


>> In ideal case, thumb usage would be set per-package

> Yes, that's where ARM_INSTRUCTION_SET comes in :), although enabling it is messier as
> disabling it.
> I wasn't impressed by the numbers[1], but samba lost 0.5MB, so that's a candidate

  Ok, good plan.

> regards,

> Koen

> [1] Angstrom already uses -Os, so the binaries are already pretty small

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



