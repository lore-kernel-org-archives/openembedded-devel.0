Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kmvz6-0003Hj-EX
	for openembedded-devel@openembedded.org; Mon, 06 Oct 2008 21:43:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kmvue-0007LD-Sh
	for openembedded-devel@openembedded.org; Mon, 06 Oct 2008 19:38:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Oct 2008 19:38:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Oct 2008 19:38:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Oct 2008 21:38:27 +0200
Message-ID: <gcdpfj$hr0$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>	<c384c5ea0810061210l65b4178ay812a9681a4e86dda@mail.gmail.com>
	<gcdokp$evo$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <gcdokp$evo$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Mon, 06 Oct 2008 19:43:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-10-2008 21:24, Koen Kooi wrote:
> On 06-10-2008 21:10, Leon Woestenberg wrote:
>> Hello Koen,
>>
>> this change in that patch:
>>
>> +CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"
>>
>> makes my OE PATH look like this:
>>
>> <...>/build/tmp/cross/ppce300c3/bin
>>
>> but my cross toolchain did not end up there, instead it ended up in
>> the usual place:<...>/build/tmp/cross/bin/
>
> My cross looks like this:
>
> koen@dominion:/OE/angstrom-dev/cross$ ls
> arm-oabi/ armv4t/ armv5te/ armv6/ armv7a/ avr32/ ppc405/ ppc603e/
>
>  > so I am getting:
>>
>> NOTE: make -j5 -e MAKEFLAGS= include/linux/version.h CC=ccache
>> powerpc-angstrom-linux-gcc LD=powerpc-angstrom-linux-ld
>> powerpc-angstrom-linux-gcc: No such file or directory
>>
>> So obviously for me the CROSS_DIR is not respected somehow for the
>> toolchain.
>>
>> Any ideas where it could leak away?
>>
>> I did a scratch build against HEAD using the latest stable bitbake
>> tree checkout, for MACHINE=mpc8313erdb.
>>
>> Some other details might still exist at
>> http://tinderbox.openembedded.net/builders/likewise/
>
> I'm starting a build with that machine to see if I can reproduce it.

I now have:

koen@dominion:/OE/angstrom-dev/cross$ ls
arm-oabi/  armv4t/  armv5te/  armv6/  armv7a/  avr32/  ppc405/  ppc603e/ 
  ppce300c3/
koen@dominion:/OE/angstrom-dev/cross$ find ppce300c3/ | grep -- -gcc
ppce300c3/bin/powerpc-angstrom-linux-gcc
ppce300c3/bin/powerpc-angstrom-linux-gccbug
ppce300c3/bin/powerpc-angstrom-linux-gcc-4.2.4

I suspect packaged-staging is using the old staging packages (as can be 
seen from the do_setscene in the gcc tinderbox log). Could you try it 
without keeping pstage?

regards,

Koen



