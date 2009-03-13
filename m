Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Lj7rB-0007xm-S6
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Mar 2009 09:07:36 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n2G81eLN018810
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 01:01:40 -0700 (PDT)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 Mar 2009 09:06:55 +0100
Received: from GLAMDRING ([172.24.48.117]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 16 Mar 2009 09:06:54 +0100
Message-ID: <000001c9a60e$28fd4650$753018ac@GLAMDRING>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <20090313145610.GA26373@denix.org><018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
	<20090313160732.GA26615@denix.org>
Date: Fri, 13 Mar 2009 18:48:17 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3350
X-OriginalArrivalTime: 16 Mar 2009 08:06:54.0797 (UTC)
	FILETIME=[2B98FFD0:01C9A60E]
X-SA-Exim-Connect-IP: 195.65.72.27
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	STOX_REPLY_TYPE autolearn=no version=3.2.5
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
X-List-Received-Date: Mon, 16 Mar 2009 08:07:36 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

>> The Core i7 has 4 cores and each core has two virtual CPUs so the system
>> sees 8 CPUs.
>> I saw some commone from someone claiming that if
>> you have n CPUs, then Buildroot should use make -j`2*n`.
>>
>> I thought about this, and came up with the following explanation.
>> If you have one job per CPU, then  whenever you have to wait for the
>> harddisk, you stall this CPU.
>> If you have several jobs per CPU, then you can gain some time
>> by running the second job while the first job was waiting for the hard
>> disk.
>>
>> Whether this works in practice, I cannot say, but it would be interesting
>> to have some real proof.
>
> First of all, I believe -j`2*n` is very agressive. I've seen other 
> suggestions
> of using -j`n+1` or -j`n+2`.
> Second, your Core i7 still has 4 real cores. Even though HyperThreading
> presents each core as 2 virtual ones, those are not real 8 cores. And
> according to [1], sometimes using HyperThreading may degrade the overall
> performance...
>
> So, you should experiment with your settings and find a sweet spot, which
> maybe somewhere between 4 and 16 threads :)
>

Yes, I know,
Maybe it is a good idea if the result of a build is published somewhere,
so that others do not have to go through this process.

Right now, openembedded does not even build for me,
since the native perl build fails :-(

> [1] http://en.wikipedia.org/wiki/Hyper-threading
>


Best Regards
Ulf Samuelsson 




