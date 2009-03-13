Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Li8Ha-0006HF-Ps
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 15:22:42 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n2DEH9mS001750;
	Fri, 13 Mar 2009 07:17:09 -0700 (PDT)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Mar 2009 15:22:21 +0100
Received: from Glamdring ([172.24.48.94]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 13 Mar 2009 15:22:20 +0100
Message-ID: <013b01c9a3e7$1b44b3f0$5e3018ac@Glamdring>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-devel@openembedded.org>
References: <1236900736.26901.8.camel@grond.atmel.com><200903121838.58470.raj.khem@gmail.com><20090313034930.GA23252@denix.org>
	<20090313060546.GF26343@smtp.west.cox.net>
Date: Fri, 13 Mar 2009 15:19:37 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3350
X-OriginalArrivalTime: 13 Mar 2009 14:22:21.0358 (UTC)
	FILETIME=[1F3C2CE0:01C9A3E7]
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
X-List-Received-Date: Fri, 13 Mar 2009 14:22:43 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit


> On Thu, Mar 12, 2009 at 11:49:30PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Mar 12, 2009 at 06:38:54PM -0700, Khem Raj wrote:
>> > On Thursday 12 March 2009 16:32:16 Ulf Samuelsson wrote:
>> > > Is there any activity to make this more useful?
>> > > Just managed to install a Core i7 machine, which speeded
>> > > up my Buildroot build from about 4 hours to less than 1 hour.
>> > > (There was an error in the build right at the end,
>> > > so it could have been downto 40 minutes or so)
>> > > Building the cross compiler took 10 minutes with "make -j 16"
>> > > compared to 1-2 hours on a P4 @ 3GHz.
>> > >
>> > > Openembedded does not seem to use PARALLEL_MAKE extensively.
>> > > I have the frequency meter activated for all 8 CPUs in the Core i7,
>> > > and most of the time the CPUs seems to idle at 1.6 GHz,
>> > > with one CPU (or rarely 2) are running at the full 2.67 GHz.
>> > >
>> > > Last time I built OE on a P4@ 3 GHz it took ~40 hours
>> > > for the SAM9263, so some speedup would be nice.
>> > > Maybe we should make an effort?
>> >
>> > I use
>> >
>> > PARALLEL_MAKE = "-j4"
>> > BB_NUMBER_THREADS = "2"
>> >
>> > in my local.conf. I see my core 2 duo machine spawning parallel tasks.
>>
>> I'm setting 4/4 to the above two variables on my Quad Core and it loads 
>> all 4
>> cores at 100% almost all the time. Sometimes it slows down due to the
>> bottleneck in the harddrive access...
>
> On the dual dual-core (4 total) boxes I have, I do -j6/4 threads.  On my
> new quad-core box I haven't yet had a chance to figure out what's best.
> I also use -j6/4 threads on an older dual-core amd64 box we've got
> around and that seems best for my tasks at least (I tried a few
> combinations of more jobs/threads and less and both were slower).
>

I looked at a few recipies which by a stanrge coincidence had 
PARALLEL_MAKE="",

When, I rechecked, I had
PARALLEL_MAKE ="-j 16"
as well and this should be
PARALLEL_MAKE ="-j16"

Changed to
PARALLEL_MAKE ="-j8"
BB_NUMBER_THREADS = "2"

I see some more cores beeing used.
The initial setup after you changed local.conf seems to run on a single core 
though.

Thanks for the help.
Ulf Samuelsson


> -- 
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




