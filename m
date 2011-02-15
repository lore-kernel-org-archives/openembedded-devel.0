Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpOuA-0004KE-Dq
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 18:41:38 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PpOt0-00004K-Pi from Tom_Rini@mentor.com ;
	Tue, 15 Feb 2011 09:40:26 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 09:40:26 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 10:40:25 -0700
Message-ID: <4D5ABA87.1090208@mentor.com>
Date: Tue, 15 Feb 2011 10:40:23 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>
References: <4D59BBC3.3080806@mlbassoc.com> <4D5AAF85.3000409@mentor.com>
	<4D5AB6FD.2030104@mlbassoc.com>
In-Reply-To: <4D5AB6FD.2030104@mlbassoc.com>
X-OriginalArrivalTime: 15 Feb 2011 17:40:25.0784 (UTC)
	FILETIME=[6DB7AB80:01CBCD37]
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: testing release-2011.03 failure
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
X-List-Received-Date: Tue, 15 Feb 2011 17:41:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2011 10:25 AM, Gary Thomas wrote:
> On 02/15/2011 09:53 AM, Tom Rini wrote:
>> On 02/14/2011 04:33 PM, Gary Thomas wrote:
>>> MACHINE = beagleboard
>>> DISTRO = angstrom-2010.x
>>> PARALLEL_MAKE ?= "-j4"
>>> BB_NUMBER_THREADS ?= "4"
>>> target = angstrom-gnome-image
>>> bitbake = 1.11.0
>>> host = Fedora 13/x86
>>>
>>> openembedded/recipes/gnome/system-tools-backends_2.10.1.bb failed
>>>
>>> Log at http://pastebin.com/rL0BnD8w
>>
>> Can you try adding PARALLEL_MAKE = "" to the offending recipe?
>
> Still errors, but maybe more readable:
>
> | Making all in services
> | make[2]: Entering directory
> `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/services'
>
> | cd .. && \
> | /bin/sh
> /work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/missing
> --run automake-1.7 --gnu services/Makefile
> | configure.in:8: version mismatch. This is Automake 1.7.9,
> | configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
> | configure.in:8: comes from Automake 1.11.1. You should recreate
> | configure.in:8: aclocal.m4 with aclocal and run automake again.
> | make[2]: *** [Makefile.in] Error 1
> | make[2]: Leaving directory
> `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/services'
>
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1'
>
> | make: *** [all] Error 2

OK, digging into the history on this recipe, it looks like 
29dc4e1f8452bba3af0ff91811d93bdb9f4f4f23 is when we switched from 
"pre-mangle configure.in, etc, then normal autotools.bbclass 
do_configure" to "less mangle, call out gnu-config, oe_runconf, etc by 
hand".  Koen, do you recall why?  And what heart burn we would run into 
if we wanted to both not re-break policykit support and fix this build 
issue by getting a more complete autotools.bbclass:do_configure type 
do_configure run here?

-- 
Tom Rini
Mentor Graphics Corporation


