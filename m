Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1L8HEF-0000ck-T4
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 17:39:03 +0100
Received: (qmail invoked by alias); 04 Dec 2008 16:35:26 -0000
Received: from p57BB7505.dip.t-dialin.net (EHLO [192.168.2.2]) [87.187.117.5]
	by mail.gmx.net (mp045) with SMTP; 04 Dec 2008 17:35:26 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX182KxkEhT824ylrgNHhu4ncas+yBon3Bc9ebCQAGB
	JSZ3Mx07YdLwne
Message-ID: <493806CD.5080808@gmx.de>
Date: Thu, 04 Dec 2008 17:35:25 +0100
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 2.0.0.18 (Windows/20081105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gh8v57$5nk$1@ger.gmane.org>
In-Reply-To: <gh8v57$5nk$1@ger.gmane.org>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.64
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
X-List-Received-Date: Thu, 04 Dec 2008 16:39:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
> Hi,
>
> The udev 124 has cache (/etc/dev.tar) to avoid doing the coldplug udev 
> dance that can take a few seconds to a minute depending on machine 
> speed and kernel options. It is working a bit too well at the moment:
>
> * user boots image with 2.6.26 kernel on an omap board
> * user gets /dev/fb0
> * user fixes the bootargs in uboot to enable the overlay
> * user doesn't get /dev/fb1
>
> so remove /etc/dev.tar and reboot: /dev/fb1 appears.
>
> I also encountered a case where the permissions on /dev/null where 
> wrong during first boot (it's a mystery why that happened) and udev 
> cached those making ssh daemons fail on boot.
>
> My current ideas:
>
> 1) remove /etc/dev.tar if its > x weeks old
> 2) recreate it on shutdown
> 3) remove it after x times
>
> option 1) breaks on systems without an RTC and/or no /etc/timestamp
> option 2) moves the slowness to shutdown
> option 3) requires extra logic and filesystem access
>
> and all options don't fix the first case I mentioned, they all take a 
> while to make /dev/fb1 appear.
>
> The key is that it should be transparent to users, so adding a check 
> for .e.g 'ignore_dev.tar=1' in bootargs wouldn't work, since that 
> implies that users are aware of the problem and know how to 'fix' it.
>
> Does anyone have other ways to invalidate the cache, and if not, which 
> option would get your vote?
I don't think it should be invalidated automagically. Problems only 
happen if some bootloader args are changed, don't they? In this case its
ok to let the user unvalidate the cache. (A user who changes bootloader 
arguments should be able to do this. )
But maybe we should add a message to udev script like:
udev: no coldplugging, using /etc/udev.tar as cache
to make it more obvious that udev uses a cache.

Regards,
Thomas


