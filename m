Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PKyZ3-0004b8-M0
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 20:30:06 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PKyXr-0006Pq-O1 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 11:28:51 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 23 Nov 2010 11:28:51 -0800
Received: from [172.30.80.10] ([172.30.80.10]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Nov 2010 12:28:50 -0700
Message-ID: <4CEC15EF.3090906@mentor.com>
Date: Tue, 23 Nov 2010 12:28:47 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20101123113706.GA3533@lit.local.igalia.com>	<4CEBD252.7000502@mentor.com>	<20101123145713.GA3032@lit.local.igalia.com>	<4CEBDABB.1060607@mentor.com>	<6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>	<20101123160525.GB3032@lit.local.igalia.com>
	<ich14q$f5b$2@dough.gmane.org>
In-Reply-To: <ich14q$f5b$2@dough.gmane.org>
X-OriginalArrivalTime: 23 Nov 2010 19:28:50.0478 (UTC)
	FILETIME=[A81E34E0:01CB8B44]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Tue, 23 Nov 2010 19:30:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/2010 11:28 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-11-10 17:05, Víctor M. Jáquez L. wrote:
>> On Tue, Nov 23, 2010 at 04:58:54PM +0100, Koen Kooi wrote:
>>>
>>> Op 23 nov 2010, om 16:16 heeft Tom Rini het volgende geschreven:
>>>
>>>> On 11/23/2010 07:57 AM, Víctor M. Jáquez L. wrote:
>>>>> On Tue, Nov 23, 2010 at 07:40:18AM -0700, Tom Rini wrote:
>>>>>> On 11/23/2010 04:37 AM, Víctor M. Jáquez L. wrote:
>>>>>>> I'm trying to build minimal-image with CSL toolchain, but I got this error:
>>>>>>>
>>>>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Started
>>>>>>> ERROR: TaskFailed event exception, aborting
>>>>>>> ERROR: Build of /media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb do_install failed
>>>>>>> ERROR: Task 187 (/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb, do_install) failed with 256
>>>>>>> ERROR: '/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb' failed
>>>>>>> ERROR: Function do_install failed
>>>>>>> NOTE: Task failed: ('function do_install failed', '/media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227')
>>>>>>> ERROR: Logfile of failure stored in: /media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227
>>>>>>> Log data follows:
>>>>>>> | cp: cannot stat `/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-gnueabi/libc/lib/*': No such file or directory
>>>>>>> | ERROR: Function do_install failed
>>>>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Failed
>>>>>>> ERROR: TaskFailed event exception, aborting
>>>>>>>
>>>>>>> For some reason the variable ${TARGET_SYS} is evaluated as
>>>>>>> arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which is the
>>>>>>> correct value.
>>>>>>
>>>>>> Please post your local.conf settings as well as what version of
>>>>>> openembedded (and what branch) you are using.
>>>>>
>>>>> I'm using the openembedded's branch org.openembedded.dev (HEAD)
>>>> [snip]
>>>>>
>>>>> If I apply this patch[1] the problem seems to be solved.
>>>>>
>>>>> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg11415.html
>>>>
>>>> I thought the patch had been applied.  Koen, do you still object after it was explained that currently angstrom is always going to win setting that variable unless it's made a ?= ?  Thanks!
>>>
>>> I still object to that patch, since a different solution has been applied
>>> already.
>>
>> But they not seem to work (at least for me).
>>
>>> And I still don't see why people want to use known broken
>>> toolchains...
>>
>> If you make the statement that angstrom distribution _cannot_ be built using any
>> external toolchain,
>
> It builds fine using external angstrom toolchains :)

So to be clear, there is, or is not, another solution for using a 
non-angstrom toolchain to build angstrom?

-- 
Tom Rini
Mentor Graphics Corporation


