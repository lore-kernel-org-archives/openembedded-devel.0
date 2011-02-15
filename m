Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PpP0M-0004Vi-2Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 18:48:02 +0100
Received: by eya28 with SMTP id 28so256423eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 09:46:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr4709089wel.4.1297792011356; Tue,
	15 Feb 2011 09:46:51 -0800 (PST)
Received: by 10.216.246.69 with HTTP; Tue, 15 Feb 2011 09:46:51 -0800 (PST)
In-Reply-To: <4D5ABA87.1090208@mentor.com>
References: <4D59BBC3.3080806@mlbassoc.com> <4D5AAF85.3000409@mentor.com>
	<4D5AB6FD.2030104@mlbassoc.com> <4D5ABA87.1090208@mentor.com>
Date: Tue, 15 Feb 2011 18:46:51 +0100
Message-ID: <AANLkTikbO9AC3yMoeRbNBg8_zogXUyPvwtx027W2ZNe9@mail.gmail.com>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Tom Rini <tom_rini@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 15 Feb 2011 17:48:02 -0000
Content-Type: text/plain; charset=UTF-8

2011/2/15 Tom Rini <tom_rini@mentor.com>

> On 02/15/2011 10:25 AM, Gary Thomas wrote:
>
>> On 02/15/2011 09:53 AM, Tom Rini wrote:
>>
>>> On 02/14/2011 04:33 PM, Gary Thomas wrote:
>>>
>>>> MACHINE = beagleboard
>>>> DISTRO = angstrom-2010.x
>>>> PARALLEL_MAKE ?= "-j4"
>>>> BB_NUMBER_THREADS ?= "4"
>>>> target = angstrom-gnome-image
>>>> bitbake = 1.11.0
>>>> host = Fedora 13/x86
>>>>
>>>> openembedded/recipes/gnome/system-tools-backends_2.10.1.bb failed
>>>>
>>>> Log at http://pastebin.com/rL0BnD8w
>>>>
>>>
>>> Can you try adding PARALLEL_MAKE = "" to the offending recipe?
>>>
>>
>> Still errors, but maybe more readable:
>>
>> | Making all in services
>> | make[2]: Entering directory
>>
>> `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/services'
>>
>> | cd .. && \
>> | /bin/sh
>>
>> /work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/missing
>> --run automake-1.7 --gnu services/Makefile
>> | configure.in:8: version mismatch. This is Automake 1.7.9,
>> | configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
>> | configure.in:8: comes from Automake 1.11.1. You should recreate
>> | configure.in:8: aclocal.m4 with aclocal and run automake again.
>> | make[2]: *** [Makefile.in] Error 1
>> | make[2]: Leaving directory
>>
>> `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/services'
>>
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory
>>
>> `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1'
>>
>> | make: *** [all] Error 2
>>
>
> OK, digging into the history on this recipe, it looks like
> 29dc4e1f8452bba3af0ff91811d93bdb9f4f4f23 is when we switched from
> "pre-mangle configure.in, etc, then normal autotools.bbclass do_configure"
> to "less mangle, call out gnu-config, oe_runconf, etc by hand".  Koen, do
> you recall why?  And what heart burn we would run into if we wanted to both
> not re-break policykit support and fix this build issue by getting a more
> complete autotools.bbclass:do_configure type do_configure run here?
>

Save sysroot ipkg and target ipk, make change, rebuilt, compare ipks, easy
enought to do :) Any volunteers?

