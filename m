Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0687E7391D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 20:24:08 +0000 (UTC)
Received: by igcau2 with SMTP id au2so106795426igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2015 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=N5pIeFeQz9vPyC3lqQf4n/GS7gSjr4MgmetAHamz1K0=;
	b=buPeNlZ0nLAqT44U5S3l4yoCl8m15d7VXhfMe23d05yAbWbRAWzYKawzJtuXBj3Njq
	M8wYmE8WrY8DzTQm3CC+YBAYaYabrSTNSS5AAtP1dYDiiF216Kl6JvpXbPTxTpN9RtR/
	ueekuf/WWQwsi4BePWVxmTU/PgL9A1eh3OYBgNflqzrrOuTy38qfMwK/jPcjc+WNecth
	MQFB99kYcI4/MytYqC4ESlY693CLk0Gp7N4zipwf57j2qH2+SVr4WQbi48m2QooIQwQj
	dy9YECbKn3+cDQofzj/rRtgizEyfdSk/zmbWdtnGlwUZLUmg/HQ9VKV90hXcpx+txAoI
	bc2Q==
MIME-Version: 1.0
X-Received: by 10.107.18.170 with SMTP id 42mr6520221ios.38.1428092649782;
	Fri, 03 Apr 2015 13:24:09 -0700 (PDT)
Received: by 10.107.158.133 with HTTP; Fri, 3 Apr 2015 13:24:09 -0700 (PDT)
Received: by 10.107.158.133 with HTTP; Fri, 3 Apr 2015 13:24:09 -0700 (PDT)
In-Reply-To: <CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
	<CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
Date: Fri, 3 Apr 2015 22:24:09 +0200
Message-ID: <CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 03 Apr 2015 20:24:09 -0000
Content-Type: text/plain; charset=UTF-8

Okay, thanks for the reply! I'm going to run it with debug symbols within
the next days.
But I have one more question. Icedtea7-native needs xsltproc native. Do you
know the recipe which is providing it?
Am 03.04.2015 20:18 schrieb "Otavio Salvador" <otavio@ossystems.com.br>:

> On Fri, Apr 3, 2015 at 5:07 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com>
> wrote:
> > Hi Otavio,
> >
> > Am 03.04.2015 um 03:56 schrieb Otavio Salvador:
> >> Hello Sven,
> >>
> >> On Thu, Apr 2, 2015 at 5:25 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com>
> wrote:
> >>> I've managed to build and run OpenJDK-7-75b13 on an armv7 target but
> now
> >>> I run into an issue reported all around in the net:
> >>> http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1851
> >>>
> >>> I'm adressing the same issue with the quartz library on my target as in
> >>> the last comment. For this specific case it looks like the segfault is
> >>> thrown on a call to Object.clone() within the quartz library.
> >>> Unfortunately I don't find any bugfix or other hint for fixing that
> >>> issue. Other sites state, that "-XX:+PrintCommandLineFlags" works
> around
> >>> that issue. This is right but it makes the VM painfully slow. So it
> >>> looks like either the ThumbEE or the whole ASM optimizations won't be
> >>> used with that option.
> >>>
> http://blog.timmattison.com/archives/2014/08/29/deal-with-os-linux-zero-dot-cpp-related-jvm-crashes-without-using-the-oracle-jvm/
> >>>
> >>> I've looked for solutions a lot but didn't find anything helpful, yet.
> >>> Any ideas?
> >>>
> >>> If anyone wants to play around with my current work. Please have a look
> >>> at my fork on github
> https://github.com/esven/meta-java/tree/jdk_update
> >>
> >> It would be good to hook a gdb on this before the failure and try to
> >> see if something can be identified which might help fixing the root
> >> cause of the issue?
> >>
> >
> > Running with gdb gives the following output. I can't install debug
> > symbols for java atm. I will do this next week. But at least gdb tells
> > us which address it wants to access.
> >
> > 08:01:07.529 [main] INFO  org.quartz.impl.StdSchedulerFactory - Quartz
> > scheduler 'BoxClient Scheduler' initialized from default file in current
> > working dir: 'quartz.properties'
> > 08:01:07.531 [main] INFO  org.quartz.impl.StdSchedulerFactory - Quartz
> > scheduler version: 2.2.1
> > 08:01:07.539 [main] INFO  org.quartz.core.QuartzScheduler - JobFactory
> > set to: com.in2soft.remote.client.scheduler.SchedulerJobFactory@1b487e4
> > Cannot access memory at address 0x28
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > [Switching to Thread 0xb6064460 (LWP 1801)]
> > Cannot access memory at address 0x28
> > 0xb6af138c in ?? ()
> >    from /usr/lib/jvm/java-7-openjdk/jre/lib/arm/server/libjvm.so
> > (gdb) bt
> > #0  0xb6af138c in ?? ()
> >    from /usr/lib/jvm/java-7-openjdk/jre/lib/arm/server/libjvm.so
> > #1  0x00000000 in ?? ()
> > Backtrace stopped: previous frame identical to this frame (corrupt
> stack?)
> > (gdb)
> >
> >
> > Any clues?
>
> Unfortunately, not.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

