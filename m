Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LjoZc-00012U-4c
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 06:44:18 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n2I5c5rY027390;
	Tue, 17 Mar 2009 22:38:10 -0700 (PDT)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 18 Mar 2009 06:43:03 +0100
Received: from aeglos ([172.24.48.134]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 18 Mar 2009 06:43:02 +0100
Message-ID: <13377B3739C343E8AFC7A41F49F1F8E5@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-devel@openembedded.org>
References: <000001c9a60e$28fd4650$753018ac@GLAMDRING><9B414415A7024345895304717D1B3CCF@aeglos>
	<20090317211155.GN26343@smtp.west.cox.net>
Date: Wed, 18 Mar 2009 06:39:48 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-OriginalArrivalTime: 18 Mar 2009 05:43:03.0111 (UTC)
	FILETIME=[6789BD70:01C9A78C]
X-SA-Exim-Connect-IP: 195.65.72.27
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
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
X-List-Received-Date: Wed, 18 Mar 2009 05:44:18 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

> On Tue, Mar 17, 2009 at 05:28:27PM +0100, Ulf Samuelsson wrote:
> [snip]
>> BTW: The total buildtime was around 2 hours. There is some overhead
>> since the build was restarted 3-4 times, and local.conf was changed once.
>> I started the build with PARALLEL_MAKE = "-j2" and BB_NUMBER_THREADS=8.
>
> Hmm.  I wonder if the gettext problem was related to having so many
> threads.  For my builds I had been getting around 2 hours (once sources
> are fetched), but as I've said, I do -j8/4 threads.  I haven't yet
> expirimented with my new box, so I'll give a j2/8 threads one a shot and
> see where gettext is falling down.
>
>> I noticed that having a lot of threads helps most of the time,
>> since the CPUs were executing at max frequency.
>>
>> When the cross compiler, was built,it was different,
>> most of the cores were not used with this configuration.
>> 2-3 max while compiling gcc.
>
> Yeah.  I almost wonder if it's worth doing some python string magic to
> try and manually bump up PARALLEL_MAKE in recipes that we know are
> bottlenecks.
>
> -- 

I think that we should have a way to support parallelism
in a file OUTSIDE the recipes.

I think you would want to have a host configuration file
which can contains features to support parallelism.
It should also contain location of downloads
and other things which is host specific.

Maybe we should define the MAXIMUM number of make jobs
we will allow on top of the normal using PARALLEL_MAKE)
and then indicate in specific packages that we
want to use the MAX, rather than the "normal" number of jobs.

Best Regards
Ulf Samuelsson 




