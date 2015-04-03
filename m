Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 42F48724DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 08:07:20 +0000 (UTC)
Received: by wizk4 with SMTP id k4so37777541wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2015 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=G6TQ0KxQWiseVKG732xa3cog9PdxanUJFeDy+++jhAo=;
	b=EFm5JaPL3jt01TpjX4Ib/fm5JPfRQZPEMpKJd9ERnaYuuxvZGlpKvoIZhKfnMfNSZx
	w5zxE4EFKH2BxkCwq/UFsy+iZkDRSo5OGNYIUIdYg4aWLK0F/NRaNM58uqYTegkTiFWr
	1RVz0yBZ6dEG/DH49gh0AS8GUVYGxGz9Wt3/KDRxf4jXfhm49ferDlj0Mi9vsbxXf6ww
	+3TT1Aejb/LuYDQXE4suInPRoJJ/DlNAJ1I+IYRYa6Q89RcaSZvO2iOLp0M1EpzXVR/d
	cw6tTrjwvgVNP945wK6SqRSRXDnIg2fqmCZOY3sbvv2jMmQec0Ychej8ASEDA48Pqi2g
	QUIA==
X-Received: by 10.180.86.234 with SMTP id s10mr3113855wiz.49.1428048440854;
	Fri, 03 Apr 2015 01:07:20 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id md2sm1666258wic.19.2015.04.03.01.07.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Apr 2015 01:07:20 -0700 (PDT)
Message-ID: <551E4A44.7050708@gmail.com>
Date: Fri, 03 Apr 2015 10:07:32 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>	<551C4F35.7020001@gmail.com>	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
In-Reply-To: <CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Apr 2015 08:07:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Otavio,

Am 03.04.2015 um 03:56 schrieb Otavio Salvador:
> Hello Sven,
> 
> On Thu, Apr 2, 2015 at 5:25 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
>> I've managed to build and run OpenJDK-7-75b13 on an armv7 target but now
>> I run into an issue reported all around in the net:
>> http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1851
>>
>> I'm adressing the same issue with the quartz library on my target as in
>> the last comment. For this specific case it looks like the segfault is
>> thrown on a call to Object.clone() within the quartz library.
>> Unfortunately I don't find any bugfix or other hint for fixing that
>> issue. Other sites state, that "-XX:+PrintCommandLineFlags" works around
>> that issue. This is right but it makes the VM painfully slow. So it
>> looks like either the ThumbEE or the whole ASM optimizations won't be
>> used with that option.
>> http://blog.timmattison.com/archives/2014/08/29/deal-with-os-linux-zero-dot-cpp-related-jvm-crashes-without-using-the-oracle-jvm/
>>
>> I've looked for solutions a lot but didn't find anything helpful, yet.
>> Any ideas?
>>
>> If anyone wants to play around with my current work. Please have a look
>> at my fork on github https://github.com/esven/meta-java/tree/jdk_update
> 
> It would be good to hook a gdb on this before the failure and try to
> see if something can be identified which might help fixing the root
> cause of the issue?
> 

Running with gdb gives the following output. I can't install debug
symbols for java atm. I will do this next week. But at least gdb tells
us which address it wants to access.

08:01:07.529 [main] INFO  org.quartz.impl.StdSchedulerFactory - Quartz
scheduler 'BoxClient Scheduler' initialized from default file in current
working dir: 'quartz.properties'
08:01:07.531 [main] INFO  org.quartz.impl.StdSchedulerFactory - Quartz
scheduler version: 2.2.1
08:01:07.539 [main] INFO  org.quartz.core.QuartzScheduler - JobFactory
set to: com.in2soft.remote.client.scheduler.SchedulerJobFactory@1b487e4
Cannot access memory at address 0x28

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0xb6064460 (LWP 1801)]
Cannot access memory at address 0x28
0xb6af138c in ?? ()
   from /usr/lib/jvm/java-7-openjdk/jre/lib/arm/server/libjvm.so
(gdb) bt
#0  0xb6af138c in ?? ()
   from /usr/lib/jvm/java-7-openjdk/jre/lib/arm/server/libjvm.so
#1  0x00000000 in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb)


Any clues?

