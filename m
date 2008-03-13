Received: from [212.227.126.179] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1JZj1S-0003Ti-Ba
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 09:42:53 +0100
Received: from [10.0.0.200] (M8dc3.m.pppool.de [89.49.141.195])
	by mrelayeu.kundenserver.de (node=mrelayeu2) with ESMTP (Nemesis)
	id 0MKwtQ-1JZizL1mFU-0003zd; Thu, 13 Mar 2008 09:40:36 +0100
Message-ID: <47D8E882.1030106@linuxdevelopment.de>
Date: Thu, 13 Mar 2008 09:40:34 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.9 (X11/20070801)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803121450.09688.geoffrey@pager.net>	<47D83769.5020405@linuxdevelopment.de>
	<19c1b8a90803121833o48bf80dfhe27516bd2cba4d04@mail.gmail.com>
In-Reply-To: <19c1b8a90803121833o48bf80dfhe27516bd2cba4d04@mail.gmail.com>
X-Enigmail-Version: 0.95.5
X-Provags-ID: V01U2FsdGVkX197XjRJUaT13wwy3TtdPH7l6JPJC9d/x50mKtl
	S85Yyv4tMo7lGCKt5U9ZDHROgo/vqRiV0DST/qbxNm9QLlXt7W
	3cJ9LYYD9WWn4ISsXFOVLRsw7zo+SImhK3PYUGvifw=
X-SA-Exim-Connect-IP: 212.227.126.179
X-SA-Exim-Mail-From: robert@linuxdevelopment.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2008 08:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Dear Geoffrey , Dear all

I dont get it.
My chain stops at this stage below trying to find external-toolchain
under /usr/local/angstrom/

Can you hint me over this


NOTE: package gcc-cross-initial-4.1.2-r14: task do_populate_staging:
completed
NOTE: package gcc-cross-initial-4.1.2: completed
NOTE: Running task 184 of 591 (ID: 81,
/srv/home/bob/oe/org.openembedded.dev/packages/meta/external-toolchain.bb,
do_populate_staging)
NOTE: package external-toolchain-1.0: started
NOTE: package external-toolchain-1.0-r1: task do_populate_staging: started
NOTE: exceptions.AttributeError:'module' object has no attribute
'get_srcrev' while evaluating:
${@bb.fetch.get_srcrev(d)}
ERROR: function do_stage failed
ERROR: log data follows
(/srv/home/bob/oe/avr32/tmp/work/x86_64-avr32-sdk-angstrom-linux-uclibc/external-toolchain-1.0-r1/temp/log.do_stage.7411)
| The external toolchain could not be found in /usr/local/angstrom/avr32!
NOTE: Task failed:
/srv/home/bob/oe/avr32/tmp/work/x86_64-avr32-sdk-angstrom-linux-uclibc/external-toolchain-1.0-r1/temp/log.do_stage.7411
NOTE: package external-toolchain-1.0-r1: task do_populate_staging: failed
ERROR: TaskFailed event exception, aborting
NOTE: package external-toolchain-1.0: failed
ERROR: Build of
/srv/home/bob/oe/org.openembedded.dev/packages/meta/external-toolchain.bb
do_populate_staging failed
ERROR: Task 81
(/srv/home/bob/oe/org.openembedded.dev/packages/meta/external-toolchain.bb,
do_populate_staging) failed
NOTE: Tasks Summary: Attempted 183 tasks of which 122 didn't need to be
rerun and 1 failed.
ERROR:
'/srv/home/bob/oe/org.openembedded.dev/packages/meta/external-toolchain.bb'
failed


Khem Raj schrieb:
> Geoffrey,
> 
> Try to build uclibc with V=1 on commandline and check what extra flags
> are passed due to this option. I think these flags might be incorrect
> for AVR32
> 
> Thanks
> 
> -Khem
> 
> 
> On Wed, Mar 12, 2008 at 1:04 PM, Robert Wörle
> <robert@linuxdevelopment.de> wrote:
>>
>>
>>  > So I now have a working OE based AVR32 build system, using binutils
>>  > 2.17.atmel.0.0.99 20060623, gcc 4.2.1-atmel.1.0.3, and uClibc 0.9.29-atmel.1.
>>  > This is essentially the same as Atmel's buildroot-avr32-v2.1.0.  As soon as I
>>  > clean stuff up a little, I'll submit patches for this via bugzilla.  Minus
>>  > this uclibc.inc diff.  I need more expert opinion on this.
>>  >
>>  > Thanks to all those who helped!
>>  > ---
>>
>>
>>  excellent job, can you supply any patches you have already, i would be
>>  more then happy to bring this up ( again !)
>>
>>  rob_w
>>
>>
>>
>>  _______________________________________________
>>  Openembedded-devel mailing list
>>  Openembedded-devel@lists.openembedded.org
>>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 

*Robert Woerle
**Linux Development *

phone: 	+49 (0)821 4442253
mobile: 	+49 179 4744527
email: 	robert@linuxdevelopment.de <mailto:robert@linuxdevelopment.de>
web: 	http://www.linuxdevelopment.de
UStNr. 	102/289/51264









This e-mail message and any files transmitted with it are confidential
property  and are intended only for the person(s) to whom this e-mail is
addressed.  If you have received this e-mail message in error, please
notify the sender immediately by telephone or e-mail and destroy the
original message without making a copy. Thank you.






