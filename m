Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8Hf9-0001Yl-W8
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 18:06:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L8Hbc-0004lw-N8
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 17:03:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 17:03:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 17:03:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 18:03:02 +0100
Message-ID: <gh92g8$ip9$1@ger.gmane.org>
References: <gh8v57$5nk$1@ger.gmane.org> <493806CD.5080808@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <493806CD.5080808@gmx.de>
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
X-List-Received-Date: Thu, 04 Dec 2008 17:06:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 17:35, Thomas Kunze wrote:
> Koen Kooi schrieb:
>> Hi,
>>
>> The udev 124 has cache (/etc/dev.tar) to avoid doing the coldplug udev
>> dance that can take a few seconds to a minute depending on machine
>> speed and kernel options. It is working a bit too well at the moment:
>>
>> * user boots image with 2.6.26 kernel on an omap board
>> * user gets /dev/fb0
>> * user fixes the bootargs in uboot to enable the overlay
>> * user doesn't get /dev/fb1
>>
>> so remove /etc/dev.tar and reboot: /dev/fb1 appears.
>>
>> I also encountered a case where the permissions on /dev/null where
>> wrong during first boot (it's a mystery why that happened) and udev
>> cached those making ssh daemons fail on boot.
>>
>> My current ideas:
>>
>> 1) remove /etc/dev.tar if its > x weeks old
>> 2) recreate it on shutdown
>> 3) remove it after x times
>>
>> option 1) breaks on systems without an RTC and/or no /etc/timestamp
>> option 2) moves the slowness to shutdown
>> option 3) requires extra logic and filesystem access
>>
>> and all options don't fix the first case I mentioned, they all take a
>> while to make /dev/fb1 appear.
>>
>> The key is that it should be transparent to users, so adding a check
>> for .e.g 'ignore_dev.tar=1' in bootargs wouldn't work, since that
>> implies that users are aware of the problem and know how to 'fix' it.
>>
>> Does anyone have other ways to invalidate the cache, and if not, which
>> option would get your vote?
> I don't think it should be invalidated automagically. Problems only
> happen if some bootloader args are changed, don't they? In this case its
> ok to let the user unvalidate the cache. (A user who changes bootloader
> arguments should be able to do this. )
> But maybe we should add a message to udev script like:
> udev: no coldplugging, using /etc/udev.tar as cache
> to make it more obvious that udev uses a cache.

Bootloader args, kernel updates and even changing a powersupply or usb 
hub can change the dev nodes, so putting the burden on the (usually 
unsuspecting) user is not an option. Or imagine things like the BUG 
where coldplugging your modules won't work, only hot-plugging.

regards,

Koen







