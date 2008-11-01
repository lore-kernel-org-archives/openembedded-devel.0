Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KwBmG-0001jL-HY
	for openembedded-devel@openembedded.org; Sat, 01 Nov 2008 09:24:12 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KwBl9-0005zo-PC
	for openembedded-devel@openembedded.org; Sat, 01 Nov 2008 08:23:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 01 Nov 2008 08:23:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 01 Nov 2008 08:23:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 01 Nov 2008 09:22:52 +0100
Message-ID: <geh3kt$bp7$1@ger.gmane.org>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>	<20081031233753.43f5f09d.raster@rasterman.com>	<gef9q7$o65$1@ger.gmane.org>
	<20081101085334.8afcd730.raster@rasterman.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081025 Shredder/3.0b1pre
In-Reply-To: <20081101085334.8afcd730.raster@rasterman.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig on boot when ld.so. conf is present
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
X-List-Received-Date: Sat, 01 Nov 2008 08:24:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-10-2008 22:53, Carsten Haitzler (The Rasterman) wrote:
> On Fri, 31 Oct 2008 16:55:50 +0100 Koen Kooi<k.kooi@student.utwente.nl>
> babbled:
>
>> On 31-10-2008 13:37, Carsten Haitzler (The Rasterman) wrote:
>>> On Fri, 31 Oct 2008 12:00:45 +0100 (CET) git@amethyst.openembedded.net (GIT
>>> User account) babbled:
>>>
>>> is there any reason to run ldconfig on boot? this should be handled by opkg
>>> on package install/upgrade or by the flash image creation (this slows boot
>>> significantly and i've patched out/disabled ldconfig run in bootmisc.sh
>>> with no ill effects).
>> Not all images have a package management tool inside, so depending on
>> that is a no-go. Recently OE stopped shipping ld.so.conf so the ldconfig
>> on boot won't get run. Doing it this way seemed to me the safest way to
>> get a nice speedup and keep things working for the funky people needing
>> ld.so.conf without a package manager :)
>
> no package manager? gads. well - i'd lean to the "then you're on your own
> buddy" line there - u install libs, you remember to run ldconfig, or suffer :)
> maybe i'm just too harsh :) though your way is clean. why don't we make it
>
> if [ ! -e /etc/ld.handled ]; then
>    /sbin/ldconfig
> fi
>
> and opkg adds a /etc/ld.handled to its package?
>
> similar effect to what you did butbasically if someone knows they will handle
> ldconfig then they just need to throw in that file into their system one way or
> another?

I don't have a strong opinion on that :) People more knowledgable about 
ldconfig should chip in on this topic.

regards,

Koen




