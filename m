Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LtynC-00044F-BO
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 08:40:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LtyjY-0005wx-0Y
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 06:36:32 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 06:36:32 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 06:36:32 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Apr 2009 08:36:19 +0200
Message-ID: <gs3v93$7ac$1@ger.gmane.org>
References: <SNT105-W20AA5F2E8A600866EEDD6D907C0@phx.gbl>
	<20090414224141.GA6479@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <20090414224141.GA6479@rhein.zuhause.netz>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: uclibc build error
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
X-List-Received-Date: Wed, 15 Apr 2009 06:40:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-09 00:41, Henning Heinold wrote:
> On Tue, Apr 14, 2009 at 11:30:49PM +0300, Mauri Sandberg wrote:
>>
>> There are two peculiarities when I am trying to build uclibc for DNS-323 using angstrom stable/2009.
>>
>> For some reason OE chooses version 0.9.30 over 0.9.30.1. I had to specifically choose the latter.
>>
>> Anyhow, both of these fail miserably with something that does not really tell me much.
>>
>> <clip>
>> NOTE: make STRIPTOOL=true LD=arm-angstrom-linux-uclibcgnueabi-ld LOCALE_DATA_FILENAME=uClibc-locale-030818.arm.tgz CC=ccache arm-angstrom-linux-uclibcgnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mthumb HOSTCFLAGS=-I/home/maukka/oe/dns323/build/tmp-dns323/staging/i686-linux/usr/include
>>    GEN include/bits/sysnum.h
>>    GEN include/bits/uClibc_config.h
>>    LN include/pthread.h
>> ...
>>    CC ldso/ldso/ldso.oS
>> ldso/ldso/dl-elf.c: In function '_dl_dprintf':
>> ldso/ldso/dl-elf.c:913: error: unable to find a register to spill in class 'LO_REGS'
>> ldso/ldso/dl-elf.c:913: error: this is the insn:
>> (insn 121 120 122 6 (set (reg/f:SI 406)
>>          (plus:SI (reg/f:SI 25 sfp)
>>              (reg:SI 405))) 5 {*thumb_addsi3} (nil)
>>      (expr_list:REG_DEAD (reg:SI 405)
>>          (nil)))
>> ldso/ldso/dl-elf.c:913: confused by earlier errors, bailing out
>> make: *** [ldso/ldso/ldso.oS] Error 1
>> FATAL: oe_runmake failed
>> </clip>
>>
>> Full log at http://tinderbox.openembedded.net/builds/138258/
>>
>> -- Mauri
>
> This is the error comes from building uclibc with thumb support. Khem started to fix it, but
> it isnt fixed already yet. Try to use ARM_INSTRUCTION_SET = "arm" in the uclibc.inc for now.

hmm: 
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=8401adacb242edde485f1a57a35e650eb837e7d4



