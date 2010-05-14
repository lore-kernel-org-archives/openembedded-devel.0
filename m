Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1OCri0-0000yb-RM
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 12:01:35 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 9092A491282
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 11:57:37 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 14 May 2010 11:59:04 +0200
Message-ID: <4BED1EFC.7010905@dresearch.de>
Date: Fri, 14 May 2010 11:59:24 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de>
	<4BE81DE7.90609@dresearch.de>	<1273518881.22943.378.camel@trini-m4400>	<4BE90A56.3090605@dresearch.de>	<1273588024.22943.391.camel@trini-m4400>	<4BEA448D.5060008@dresearch.de>
	<1273750831.18119.498.camel@mill.internal.reciva.com>
In-Reply-To: <1273750831.18119.498.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 14 May 2010 09:59:04.0167 (UTC)
	FILETIME=[15C35F70:01CAF34C]
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
X-List-Received-Date: Fri, 14 May 2010 10:01:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello *.*,

> It sounds like we have, perhaps, been talking at slight cross purposes.
> 
> It is true that you can build glibc against a different version of
> linux-libc-headers than the version of the kernel that will be used at
> runtime.  So long as the runtime kernel version is newer than the
> minimum kernel version that glibc was configured for (either via
> --enable-kernel=XXX, or via an architecture-specific static definition)
> then everything should still work fine, and glibc will use internal
> fallbacks if it discovers that certain system calls are not available at
> runtime.
> 
> Similarly, glibc will make some efforts to provide a backwards
> compatible emulation for user-visible interfaces which might not be
> available in all kernel versions.  However, what it doesn't attempt to
> do is provide a completely virtualised ABI which would insulate the
> application entirely from the details of the running kernel.  There are
> some kernel features which simply aren't feasible to emulate in user
> space.

In the openembedded world glibc will present the kernel headers provided 
to it at compile time to any application being compiled. So every 
application on our system thinks it's running on 2.6.31 (version of 
linux-libc-headers) while it runs on 2.6.24.

> 
> In the specific case of epoll_create1() and inotify_init1(), it would be
> reasonable for glibc to do something similar to the way that, say,
> mmap64() is handled.  That is, if the kernel doesn't have
> epoll_create1() but does have epoll_create(), and the behaviour that the
> user has requested is something that epoll_create() can do (i.e. none of
> the flag bits are set) then use epoll_create().  But if the user has
> asked for EPOLL_CLOEXEC then epoll_create() is not a suitable
> replacement and you are going to get ENOSYS: it's then up to the
> application to take some suitable recovery action.

It is a compile time matter: when an application is configured for 
compilation, then glibc system headers (2.6.31) will claim that certain 
interfaces (like e.g. inotify_init1) are there while they really are not 
at runtime (2.6.24).

Let's see how an application could handle this situation:

If my application includes <sys/inotify.h> and it is using 
inotify_init1() I expect the compilation to fail if the interface will 
not be available at runtime. I can, however, provide compatibility to 
older kernels at application level by providing different 
implementations based on configure.h and HAVE_INOTIFY_INIT1 (or 
similar). Configure figures out runtime availability of all non-portable 
interfaces, so based on the results of a configure run I can decide 
about which interfaces to use. Trying this at runtime is next to impossible.

I have no means of detecting a level of compatibility at runtime. How 
could that work, anyway? I get ENOSYS when calling inotify_init1(), so, 
well I *think* this interface is missing (although configure reported it 
being available). Then I would have to dynamically fall back to 
inotify_init() + fcntl(). What if that returns ENOSYS? Fall back to 
dnotify? And repeat this dance every time I need to call 
inotify_init1()? Basically, I'm blind at runtime concerning kernel 
feature availability when my system header files lied to me at compile 
time. Compatibility code would have to fumble for the interfaces 
*really* available at runtime by using trial-and-error. I would not 
expect anyone to provide this kind of compatibility.

Regards,
Thilo

-- 
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Amtsgericht: Berlin Charlottenburg, HRB:54412
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77 http://www.dresearch.de


