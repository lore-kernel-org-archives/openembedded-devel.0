Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PLKHg-000475-N7
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 19:41:37 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PLKGU-0000XK-Aw from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 10:40:22 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 24 Nov 2010 10:40:21 -0800
Received: from [172.30.80.10] ([172.30.80.10]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 24 Nov 2010 11:40:21 -0700
Message-ID: <4CED5C10.2060402@mentor.com>
Date: Wed, 24 Nov 2010 11:40:16 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>	<4CED53C2.7070109@mentor.com>
	<AANLkTikzCOZqUGuuuG=a97PV9cxXLXEcTkqWu3Jqxwby@mail.gmail.com>
In-Reply-To: <AANLkTikzCOZqUGuuuG=a97PV9cxXLXEcTkqWu3Jqxwby@mail.gmail.com>
X-OriginalArrivalTime: 24 Nov 2010 18:40:21.0558 (UTC)
	FILETIME=[0CADFD60:01CB8C07]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails sanity check
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
X-List-Received-Date: Wed, 24 Nov 2010 18:41:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2010 11:23 AM, Zach Frey wrote:
> On Wed, Nov 24, 2010 at 1:04 PM, Tom Rini<tom_rini@mentor.com>  wrote:
>
>>
>> Yes, look at the config.log file to see why it failed.  I hate to be rude
>> but it's right there in what you sent.
>
>
> No worries; I realize I am capable of staring at the obvious and not
> noticing it at times... still learning my way around the tmp/work directory
> structure.  I think I was confusing config.log and log.do_configure.
>
> So:  what is needed is
> tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r0/system-tools-backends-2.10.1/config.log
>
> I've attached it.  This seems to be the snippet of interest?
>
> configure:6899: checking how to run the C preprocessor
> configure:6969: result: arm-angstrom-linux-gnueabi-gcc -E
> configure:6989: arm-angstrom-linux-gnueabi-gcc -E
> -isystem/home/PHOENIX/frey/OE/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> conftest.c
> configure:6989: $? = 0
> configure:7003: arm-angstrom-linux-gnueabi-gcc -E
> -isystem/home/PHOENIX/frey/OE/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> conftest.c
> conftest.c:11:28: fatal error: ac_nonexistent.h: No such file or directory
> compilation terminated.
> configure:7003: $? = 1
> configure: failed program was:
> | /* confdefs.h */
> ...

This particular config.log says at the end that it exited with status 0 
(which is the desired one..).  Perhaps a different config.log?

-- 
Tom Rini
Mentor Graphics Corporation


