Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1OCtHi-0005Ky-F1
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 13:42:31 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 92F96491282
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 13:38:36 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 14 May 2010 13:40:03 +0200
Message-ID: <4BED36A8.6070602@dresearch.de>
Date: Fri, 14 May 2010 13:40:24 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de>
	<4BE81DE7.90609@dresearch.de>	<1273518881.22943.378.camel@trini-m4400>	<4BE90A56.3090605@dresearch.de>	<1273588024.22943.391.camel@trini-m4400>	<4BEA448D.5060008@dresearch.de>	<1273750831.18119.498.camel@mill.internal.reciva.com>	<4BED1EFC.7010905@dresearch.de>
	<1273832754.18119.691.camel@mill.internal.reciva.com>
In-Reply-To: <1273832754.18119.691.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 14 May 2010 11:40:03.0230 (UTC)
	FILETIME=[313F03E0:01CAF35A]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Fri, 14 May 2010 11:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello *.*,

>> I have no means of detecting a level of compatibility at runtime. How 
>> could that work, anyway? I get ENOSYS when calling inotify_init1(), so, 
>> well I *think* this interface is missing (although configure reported it 
>> being available). Then I would have to dynamically fall back to 
>> inotify_init() + fcntl().
> 
> Yes, precisely.  ENOSYS is indeed diagnostic of an unimplemented system
> call, and what you have described is exactly what glibc does internally
> for this kind of situation.

That's not what I meant in the example. I was talking about an 
application which is using ./configure at compile time to figure out 
which features will be present at runtime.

>> What if that returns ENOSYS? Fall back to dnotify?
> 
> If you wish to support kernels that don't have inotify at all, yes.
> Obviously it's up to you how far back you want to go in terms of
> compatibility, and I suspect most people would just give up at this
> point.
> 
>> And repeat this dance every time I need to call inotify_init1()?
> 
> Yes.  Or, if this is performance critical code, you can cache the result
> (since the kernel is unlikely to suddenly gain support for a syscall
> that it didn't have last time) and go directly to the implementation
> that works.

This would mean that checking for kernel features (e.g. inotify_init1()) 
at compile time via an application's configure.ac is pointless, right? 
Because configure will report availability of this interface even though 
it won't be there when the application runs. In other words, everything 
configure is telling me about kernel features (native kernel thread 
availability, inotify, sysfs, ...) might be false anyway. Code like this

#ifdef HAVE_INOTIFY_INIT1
	fd = inotify_init1(O_NONBLOCK);
#else
	fd = inotify_init();
	flags = fcntl(fd, F_GETFL, 0);
	fcntl(ret, F_SETFL, flags | O_NONBLOCK);
#endif

will break at runtime even though everything was OK at compile time, and 
you are proposing that I should expect it to break.

>> Compatibility code would have to fumble for the interfaces 
>> *really* available at runtime by using trial-and-error. I would not 
>> expect anyone to provide this kind of compatibility.
> 
> Clearly you don't like the idea very much but yes, this is basically how
> backwards compatibility code is done, and it is more or less an
> inescapable consequence of the rather fluid nature of the Linux syscall
> ABI.

I don't like your proposal... but not from an application programmer's 
POV, but from the perspective of a system integrator (i.e. a 
distribution maintainer). I think just assuming that your proposal is 
true for every application I need to integrate would be a mistake and 
devastating to a distribution's overall quality.

> Of course, you always have the option of simply writing to the lowest
> common denominator and using inotify_init() directly rather than
> inotify_init1().  Or, in the case of inotify, you have the option of
> using a library which will hide this complexity for you and provide an
> abstract userspace API which remains the same no matter what the
> underlying implementation is doing.

Well, what to do _if_ a feature is not present is a whole different 
story. But for figuring out _whether_ it is present or not you propose 
(blind) runtime probing while I would like to rely on configure output, 
at least for the applications I did not write. As at least some of the 
applications integrated by openembedded do not share your views, so 
they'll do weird things at runtime. This is a severe quality issue. And 
we have only a small chance of noticing any application runtime 
misbehaviour. The syscall in question might only rarely be used, it 
might be some corner-case of an application that is executed e.g. only 
once in a month.

To be sure we'd have to have 100% code coverage of every application / 
library which might contain any syscalls.

Regards,
Thilo

-- 
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Amtsgericht: Berlin Charlottenburg, HRB:54412
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77 http://www.dresearch.de


