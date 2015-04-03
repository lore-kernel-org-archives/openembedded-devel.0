Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7CB60034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 18:18:50 +0000 (UTC)
Received: by iebmp1 with SMTP id mp1so88850900ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2015 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=v1qXScjS4ohQEAalrQIx+zNNCAGpxzIcLBA0o4zgauw=;
	b=Cnxfe9Elw6vD6ZElNpZqOxRzaTXGj/FmNac742Q3Haheu0w1qhS8IdldsUguCEOrqQ
	3UB13sBJBmDfbQyntjrz2gdxGFtH0omtwMpAKcgR16d54Bu1udWFcb9Kg6eWFwfnIRvl
	Zzljsg606VNIMzrz84XAs4y0PRWCu0+LVw9tlxyZ54v8s58MIwbt3uLLOji/AIKzKZRL
	OtYK/GnAxj+utj3kuaZdVAWUScNBjlsrGkRr4VKmNBFYPM7ah7nKJKUK7MSeF/xtm19k
	5aknugTgjzmtLcdjr0s4P3D9kf8QPz0xrVVYZzpiziFrMqspnmBBhIH2x5h0JrKmt5QN
	8MBQ==
MIME-Version: 1.0
X-Received: by 10.43.93.135 with SMTP id bu7mr5251442icc.1.1428085131249; Fri,
	03 Apr 2015 11:18:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Fri, 3 Apr 2015 11:18:51 -0700 (PDT)
In-Reply-To: <551E4A44.7050708@gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
Date: Fri, 3 Apr 2015 15:18:51 -0300
X-Google-Sender-Auth: zzi4_gH_iC0hObYeJQQqM2YB-ZE
Message-ID: <CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Apr 2015 18:18:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 3, 2015 at 5:07 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> Hi Otavio,
>
> Am 03.04.2015 um 03:56 schrieb Otavio Salvador:
>> Hello Sven,
>>
>> On Thu, Apr 2, 2015 at 5:25 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
>>> I've managed to build and run OpenJDK-7-75b13 on an armv7 target but now
>>> I run into an issue reported all around in the net:
>>> http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1851
>>>
>>> I'm adressing the same issue with the quartz library on my target as in
>>> the last comment. For this specific case it looks like the segfault is
>>> thrown on a call to Object.clone() within the quartz library.
>>> Unfortunately I don't find any bugfix or other hint for fixing that
>>> issue. Other sites state, that "-XX:+PrintCommandLineFlags" works around
>>> that issue. This is right but it makes the VM painfully slow. So it
>>> looks like either the ThumbEE or the whole ASM optimizations won't be
>>> used with that option.
>>> http://blog.timmattison.com/archives/2014/08/29/deal-with-os-linux-zero-dot-cpp-related-jvm-crashes-without-using-the-oracle-jvm/
>>>
>>> I've looked for solutions a lot but didn't find anything helpful, yet.
>>> Any ideas?
>>>
>>> If anyone wants to play around with my current work. Please have a look
>>> at my fork on github https://github.com/esven/meta-java/tree/jdk_update
>>
>> It would be good to hook a gdb on this before the failure and try to
>> see if something can be identified which might help fixing the root
>> cause of the issue?
>>
>
> Running with gdb gives the following output. I can't install debug
> symbols for java atm. I will do this next week. But at least gdb tells
> us which address it wants to access.
>
> 08:01:07.529 [main] INFO  org.quartz.impl.StdSchedulerFactory - Quartz
> scheduler 'BoxClient Scheduler' initialized from default file in current
> working dir: 'quartz.properties'
> 08:01:07.531 [main] INFO  org.quartz.impl.StdSchedulerFactory - Quartz
> scheduler version: 2.2.1
> 08:01:07.539 [main] INFO  org.quartz.core.QuartzScheduler - JobFactory
> set to: com.in2soft.remote.client.scheduler.SchedulerJobFactory@1b487e4
> Cannot access memory at address 0x28
>
> Program received signal SIGSEGV, Segmentation fault.
> [Switching to Thread 0xb6064460 (LWP 1801)]
> Cannot access memory at address 0x28
> 0xb6af138c in ?? ()
>    from /usr/lib/jvm/java-7-openjdk/jre/lib/arm/server/libjvm.so
> (gdb) bt
> #0  0xb6af138c in ?? ()
>    from /usr/lib/jvm/java-7-openjdk/jre/lib/arm/server/libjvm.so
> #1  0x00000000 in ?? ()
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> (gdb)
>
>
> Any clues?

Unfortunately, not.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

