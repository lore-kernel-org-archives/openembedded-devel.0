Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1OBjnG-0001Ss-0R
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 09:22:21 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 333B9491282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 09:18:27 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 11 May 2010 09:19:44 +0200
Message-ID: <4BE9050B.6010103@dresearch.de>
Date: Tue, 11 May 2010 09:19:39 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273510550.22943.298.camel@trini-m4400>
In-Reply-To: <1273510550.22943.298.camel@trini-m4400>
X-OriginalArrivalTime: 11 May 2010 07:19:44.0402 (UTC)
	FILETIME=[5475BF20:01CAF0DA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel Headers Quality Issue
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
X-List-Received-Date: Tue, 11 May 2010 07:22:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello, Tom,

>> this is a somewhat cumulated response - I'd like to address some of the 
>> things mentioned at different points in the discussion in one place. 
>> Please forgive me should I misquote things.
 >>
>> Graeme Gregory in <20100505094242.GF2444@xora-desktop.xora.org.uk>:
>>
>> [Steffen Sledz]
>>  > > It seem's not to be possible to use DEFAULT_PREFERENCE_hipox in the
>>  > > linux-libc-headers recipes. So what's the right way to handle this?
>>  > > Something like PREFERRED_VERSION_linux-libc-headers_hipox = "2.6.24"
>>  > > in angstrom-2008.1.conf?
>>  >
>> [Graeme Gregory]
>>  > I thought glibc was supposed to gracefully fall back on missing
>>  > syscalls?
>>
>> Glibc is compiled against 2.6.31 headers, which is one of our main 
>> issues here. It only ever *runs* with a 2.6.24 kernel on the target 
>> system, though. So it cannot know about missing syscalls until runtime.
> 
> So, I think some of the confusion here stems from confusion about (and I
> don't know the right answer off-hand) how glibc handles the
> --with-kernel=VERSION stuff.

What is "--with-kernel"? Glibc offers a compile time configuration 
parameter "--enable-kernel", which enables/disables *backwards support* 
library compatibility support for *legacy kernel interfaces*. E.g. if 
you --enable-kernel=2.2.14, you should be able to compile ancient user 
space applications which make use of obsolete kernel 2.2.14 
functionality against the resulting glibc. This makes systems running 
*very recent kernels* provide legacy interfaces of much older kernels 
via the C library. Which is the exact opposite of our situation.

The release notes on glibc 2.2.4, which introduced this option, are 
quite educating (it's Ulrich Drepper writing, so be prepared): 
<http://sourceware.org/ml/libc-announce/2001/msg00000.html> (about 
halfway through the page).

But maybe there is a "--with-kernel" around which does the opposite to 
"--enable-kernel"?

Regards,
Thilo

-- 
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Amtsgericht: Berlin Charlottenburg, HRB:54412
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77 http://www.dresearch.de


