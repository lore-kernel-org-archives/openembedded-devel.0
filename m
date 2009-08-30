Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mhh52-0006TD-QO for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 11:52:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MhgnB-0007N1-Hr
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 11:33:45 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 11:33:45 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 11:33:45 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 30 Aug 2009 11:33:24 +0200
Message-ID: <h7dh14$47o$1@ger.gmane.org>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>	<20090829020254.GC6785@smtp.west.cox.net>	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>	<20090830012244.GA5033@gmail.com>	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 09:52:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-08-09 10:29, Phil Blundell wrote:
> On Sun, 2009-08-30 at 09:10 +0100, Phil Blundell wrote:
>> On Sat, 2009-08-29 at 18:22 -0700, Khem Raj wrote:
>>> We can override only for powerpc second time around. So changing it
>> to
>>>
>>> TARGET_OS_powerpc =
>>> "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc',
>>> 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari',
>> 'tqm8540']]}"
>>>
>>> will that be ok ?
>>
>> That's better, but it still doesn't seem terribly elegant.  I also
>> remain slightly unconvinced that the eglibc-specific file is,
>> conceptually, the right place for this logic.
>
> Actually, there is still a bigger problem with this change: it will
> cause the ABI to change in a semi-random way depending on the selected
> MACHINE and this will screw up people who are trying to do multimachine
> builds.
>
> For example, if I set MACHINE=calamari and then bitbake micro-image, it
> will select linux-gnuspe and I will presumably get the SPE ABI.  But
> then, if I set MACHINE=efika, say, and build another package in the same
> tree, it'll now select regular linux and the ABI will change, although
> this won't be reflected in the naming of the output packages: they'll
> all just be named "powerpc".

The efika ones are named 'ppc603e' fwiw.

regards,

Koen



