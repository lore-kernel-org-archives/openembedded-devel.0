Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Ljca6-0005Hl-Rb
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 17:56:49 +0100
Received: from aeglos (194.111.81.229) by pne-smtpout2-sn2.hy.skanova.net
	(7.3.129) (authenticated as u82406564)
	id 4873CA9503C8B49A for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 17:55:12 +0100
Message-ID: <9B414415A7024345895304717D1B3CCF@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <20090313145610.GA26373@denix.org><018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring><20090313160732.GA26615@denix.org>
	<000001c9a60e$28fd4650$753018ac@GLAMDRING>
Date: Tue, 17 Mar 2009 17:28:27 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-SA-Exim-Connect-IP: 81.228.8.164
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 17 Mar 2009 16:56:57 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit



>>> The Core i7 has 4 cores and each core has two virtual CPUs so the system
>>> sees 8 CPUs.
>>> I saw some commone from someone claiming that if
>>> you have n CPUs, then Buildroot should use make -j`2*n`.
>>>
>>> I thought about this, and came up with the following explanation.
>>> If you have one job per CPU, then  whenever you have to wait for the
>>> harddisk, you stall this CPU.
>>> If you have several jobs per CPU, then you can gain some time
>>> by running the second job while the first job was waiting for the hard
>>> disk.
>>>
>>> Whether this works in practice, I cannot say, but it would be 
>>> interesting
>>> to have some real proof.
>>
>> First of all, I believe -j`2*n` is very agressive. I've seen other 
>> suggestions
>> of using -j`n+1` or -j`n+2`.
>> Second, your Core i7 still has 4 real cores. Even though HyperThreading
>> presents each core as 2 virtual ones, those are not real 8 cores. And
>> according to [1], sometimes using HyperThreading may degrade the overall
>> performance...
>>
>> So, you should experiment with your settings and find a sweet spot, which
>> maybe somewhere between 4 and 16 threads :)
>>
>
> Yes, I know,
> Maybe it is a good idea if the result of a build is published somewhere,
> so that others do not have to go through this process.
>
> Right now, openembedded does not even build for me,
> since the native perl build fails :-(
>
>> [1] http://en.wikipedia.org/wiki/Hyper-threading
>>
>


I now managed to build the Angstrom image for the AT91SAM9263 by applying
a few fixes present in the ulf/linux branch.
(Did not load on H/W yet though)

perl-native was "fixed" by not building the library which crashed.
libtheora was fixd, not to use docs/examples.
busybox updated to 1.13.3
u-boot, gpsd was set to PARALLEL_MAKE = ""
u-boot updated to 2009.01
linux-2.6.28
at91bootstrap-2.10

Building with PARALLEL_MAKE & Multiple threads was not smooth.
The build crashed several times, due to erros
caused by parallellism. "gettext", "gpsd" and "u-boot" were culprits.

u-boot is NOT built cleanly, even after PARALLEL_MAKE was set to "".
The actual compile completes and generates an u-boot.bin
but this is not deployed to the result directory.
There are logs for different stages, but after the compile, they exist, but 
are empty.

If I remove all the stamps and "bitbake -b <u-boot>" afterwards
then the build completes correctly, and there is an u-boot-at91sam9263ek.bin
in the result directory.

Can it be so, that a stage is started, before the previous stage has been 
completed???



---------------------
BTW: The total buildtime was around 2 hours. There is some overhead
since the build was restarted 3-4 times, and local.conf was changed once.
I started the build with PARALLEL_MAKE = "-j2" and BB_NUMBER_THREADS=8.

I noticed that having a lot of threads helps most of the time,
since the CPUs were executing at max frequency.

When the cross compiler, was built,it was different,
most of the cores were not used with this configuration.
2-3 max while compiling gcc.

Maybe the best approach is to build the Angstrom in several stages
with different settings for parallelism.



Best Regards
Ulf Samuelsson 




