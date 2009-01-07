Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LKZkJ-0000NV-Ar
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 15:50:59 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LKZeQ-0004bK-Ry
	for openembedded-devel@openembedded.org; Wed, 07 Jan 2009 14:44:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 07 Jan 2009 14:44:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 07 Jan 2009 14:44:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 07 Jan 2009 15:44:45 +0100
Message-ID: <gk2f4t$as6$1@ger.gmane.org>
References: <f96d234e0901070635q6c29b1d3xb3a00be2147e2c07@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <f96d234e0901070635q6c29b1d3xb3a00be2147e2c07@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: mono build error with swp instruction
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
X-List-Received-Date: Wed, 07 Jan 2009 14:50:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-01-09 15:35, Cliff Brake wrote:
> I ran into an interesting build error this morning that might be worth
> documenting ...

Already known:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=e9404d66bec8f92a9e05cda5251078460bdc9ed2

>
> When building mono with the latest toolchains built with OE, I get:
>
> /tmp/ccYsXwlg.s:3067: Error: selected processor does not support `swp
> r2,r0,[r4]'
> /tmp/ccYsXwlg.s:3161: Error: selected processor does not support `swp
> r2,r0,[r4]'
> /tmp/ccYsXwlg.s:3272: Error: selected processor does not support `swp
> r3,r4,[r5]'
>
> In the libgc code, there is the following:
>
> #    ifdef ARM32
>          inline static int GC_test_and_set(volatile unsigned int *addr) {
>            int oldval;
>            /* SWP on ARM is very similar to XCHG on x86.  Doesn't lock the
>             * bus because there are no SMP ARM machines.  If/when there are,
>             * this code will likely need to be updated. */
>            /* See linuxthreads/sysdeps/arm/pt-machine.h in glibc-2.1 */
>            __asm__ __volatile__("swp %0, %1, [%2]"
>        		  	     : "=&r"(oldval)
>        			     : "r"(1), "r"(addr)
> 			     : "memory");
>            return oldval;
>          }
>
> The solution was to set ARM_INSTRUCTION_SET = "arm" in the mono recipe.
>
> Thanks,
> Cliff
>




