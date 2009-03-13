Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Li9Kc-0005Bs-EO
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 16:29:54 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n2DFOKKv005329
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 08:24:20 -0700 (PDT)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Mar 2009 16:29:32 +0100
Received: from Glamdring ([172.24.48.94]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 13 Mar 2009 16:29:31 +0100
Message-ID: <018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <20090313060546.GF26343@smtp.west.cox.net><013b01c9a3e7$1b44b3f0$5e3018ac@Glamdring>
	<20090313145610.GA26373@denix.org>
Date: Fri, 13 Mar 2009 16:27:08 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3350
X-OriginalArrivalTime: 13 Mar 2009 15:29:32.0726 (UTC)
	FILETIME=[821E1D60:01C9A3F0]
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 15:29:54 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

>>> On the dual dual-core (4 total) boxes I have, I do -j6/4 threads.  On my
>>> new quad-core box I haven't yet had a chance to figure out what's best.
>>> I also use -j6/4 threads on an older dual-core amd64 box we've got
>>> around and that seems best for my tasks at least (I tried a few
>>> combinations of more jobs/threads and less and both were slower).
>>>
>>
>> I looked at a few recipies which by a stanrge coincidence had
>> PARALLEL_MAKE="",
>
> That's not a strange coincidence, that means a specific package has issues
> building in parallel - usually some dependencies go out of order.
>

The strange coincidence was that *ALL*  the packages I *looked* at
had PARALLEL_MAKE="".
I made the erroneous assumption that most packages were this way.

>> When, I rechecked, I had
>> PARALLEL_MAKE ="-j 16"
>> as well and this should be
>> PARALLEL_MAKE ="-j16"
>
> Having only 4 cores and setting number of parallel makes to 16 kills your
> performance, as system spends more time switching contexts instead of 
> actually
> doing something useful - i.e. compiling.

The Core i7 has 4 cores and each core has two virtual CPUs so the system 
sees 8 CPUs.
I saw some commone from someone claiming that if
you have n CPUs, then Buildroot should use make -j`2*n`.

I thought about this, and came up with the following explanation.
If you have one job per CPU, then  whenever you have to wait for the 
harddisk, you stall this CPU.
If you have several jobs per CPU, then you can gain some time
by running the second job while the first job was waiting for the hard disk.

Whether this works in practice, I cannot say, but it would be interesting
to have some real proof.

>
>> Changed to
>> PARALLEL_MAKE ="-j8"
>> BB_NUMBER_THREADS = "2"
>>
>> I see some more cores beeing used.
>> The initial setup after you changed local.conf seems to run on a single
>> core though.
>
> After you change your configuration, bitbake rebuilds the cache - that is 
> a
> single threaded operation, hence uses only one core.
>
> -- 
> Denys


Best Regards
Ulf Samuelsson




