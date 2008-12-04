Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8JWv-0006bu-3C
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 20:06:30 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L8JTP-0000x5-Il
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 19:02:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 19:02:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 19:02:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 20:02:44 +0100
Message-ID: <gh99gk$dcv$1@ger.gmane.org>
References: <gh8v57$5nk$1@ger.gmane.org>	<20081204161543.GT16628@smtp.west.cox.net>	<gh94cf$p59$2@ger.gmane.org>
	<20081204184937.GU16628@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <20081204184937.GU16628@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: invalidating udev cache, how?
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
X-List-Received-Date: Thu, 04 Dec 2008 19:06:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 19:49, Tom Rini wrote:
> On Thu, Dec 04, 2008 at 06:35:10PM +0100, Koen Kooi wrote:
>> On 04-12-08 17:15, Tom Rini wrote:
>>> On Thu, Dec 04, 2008 at 05:05:58PM +0100, Koen Kooi wrote:
>>>> Hi,
>>>>
>>>> The udev 124 has cache (/etc/dev.tar) to avoid doing the coldplug udev
>>>> dance that can take a few seconds to a minute depending on machine speed
>>>> and kernel options. It is working a bit too well at the moment:
>>>>
>>>> * user boots image with 2.6.26 kernel on an omap board
>>>> * user gets /dev/fb0
>>>> * user fixes the bootargs in uboot to enable the overlay
>>>> * user doesn't get /dev/fb1
>>>>
>>>> so remove /etc/dev.tar and reboot: /dev/fb1 appears.
>>>>
>>>> I also encountered a case where the permissions on /dev/null where wrong
>>>> during first boot (it's a mystery why that happened) and udev cached
>>>> those making ssh daemons fail on boot.
>>>>
>>>> My current ideas:
>>>>
>>>> 1) remove /etc/dev.tar if its>   x weeks old
>>>> 2) recreate it on shutdown
>>>> 3) remove it after x times
>>>>
>>>> option 1) breaks on systems without an RTC and/or no /etc/timestamp
>>>> option 2) moves the slowness to shutdown
>>>> option 3) requires extra logic and filesystem access
>>>>
>>>> and all options don't fix the first case I mentioned, they all take a
>>>> while to make /dev/fb1 appear.
>>>>
>>>> The key is that it should be transparent to users, so adding a check for
>>>> .e.g 'ignore_dev.tar=1' in bootargs wouldn't work, since that implies
>>>> that users are aware of the problem and know how to 'fix' it.
>>>>
>>>> Does anyone have other ways to invalidate the cache, and if not, which
>>>> option would get your vote?
>>> 2 is a different (and perhaps not as) slow.  Also, prepopulate the cache
>>> with fb1?  Or is this all done on the live system with nothing done
>>> during image creation?
>> It's done during first boot, since as the problem points out everything
>> is highly dependant on bootloader/kernel/moonphase.
>
> Right.  I was thinking about this more.  That's why internally we do
> this differently.  First, what you want cached is only the stuff that
> will be cold-plugged (ie whats built into the kernel only, not the
> modules to be loaded up after we start udev).  The easy way out is what
> we do, provide the full cache as part of the image (and it's OK if you
> have fb[012]), and the board guy says "OK, this is ready, here's the
> udev cache".

That also makes it pretty much machines specific, which is something I'd 
like to avoid. But you're right, it would make things slightly better, 
but it doesn't scale with kernel versions, bootargs variations, board 
variations and general appearances of Murphy.
And the boards I'm working with now have a lot of usb drivers builtin, 
and I will need to spend a lot of time on google to work out all the 
devnodes.

regards,

Koen




