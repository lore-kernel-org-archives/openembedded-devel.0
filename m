Received: from ironport2-out.teksavvy.com ([206.248.154.183]
	helo=ironport2-out.pppoe.ca) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@slashdev.ca>) id 1NkLSR-0004wC-AH
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 18:55:38 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApEBAA/2hEtFpaLh/2dsb2JhbAAH2FKEcgSDFoJ/hHA
X-IronPort-AV: E=Sophos;i="4.49,533,1262581200"; d="scan'208";a="56675716"
Received: from 69-165-162-225.dsl.teksavvy.com (HELO [192.168.1.10])
	([69.165.162.225])
	by ironport2-out.pppoe.ca with ESMTP; 24 Feb 2010 12:52:48 -0500
Message-ID: <4B856948.6070704@slashdev.ca>
Date: Wed, 24 Feb 2010 13:00:40 -0500
From: Josh Kropf <josh@slashdev.ca>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Shredder/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B5B51BD.3020006@slashdev.ca>	<4FB2ADE2-A098-464D-9022-E1844CDDB2DF@vanille-media.de>
	<4B5B5A49.3090902@slashdev.ca>
In-Reply-To: <4B5B5A49.3090902@slashdev.ca>
X-SA-Exim-Connect-IP: 206.248.154.183
X-SA-Exim-Mail-From: josh@slashdev.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: python-lang causing Alignment trap and Segfault
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
X-List-Received-Date: Wed, 24 Feb 2010 17:55:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Just wanted to update the list on this issue.

I have no idea why, but after removing the readline.so file (from 
/usr/lib/python2.6/lib-dynload/) python no longer segfaults on startup.

On 01/23/2010 03:21 PM, Josh Kropf wrote:
> Looks like the atexit module
>
> root@mini2440:~# python -v
> [snip]
> # /usr/lib/python2.6/atexit.pyo matches /usr/lib/python2.6/atexit.py
> import atexit # precompiled from /usr/lib/python2.6/atexit.pAlignment 
> trap: python (2329) PC=0x403f007c Instr=0x28001c05 Address=0xffffffff 
> FSR 0x813
> yo
>
>
>
> On 01/23/2010 03:09 PM, Dr. Michael Lauer wrote:
>> Try running python -v to find out exactly which module is triggering 
>> that.
>>
>> Cheers,
>>
>> :M:
>>
>> Am 23.01.2010 um 20:45 schrieb Josh Kropf <josh@slashdev.ca>:
>>
>>> I've compiled an image for my mini2440 board (armv4t) from the 
>>> stable/2009 branch in git using angstrom distribution.
>>>
>>> One of the python packages I need depends on python-lang but I'm 
>>> finding that python segfaults when python-lang is installed.  The 
>>> kernel logs the following before the segfault:
>>>
>>> Alignment trap: python (2303) PC=0x403f007c Instr=0x28001c05 
>>> Address=0xffffffff FSR 0x813
>>>
>>> Removing python-lang package makes python work again.
>>>
>>> Just wondering if anyone has run into this problem or has some 
>>> pointers on debugging this.
>>>
>>> Thanks,
>>> - Josh
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


