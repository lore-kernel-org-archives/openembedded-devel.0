Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L8Hpt-0002NB-0N
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 18:17:57 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081204161534.LHYE12838.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 4 Dec 2008 11:15:34 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id n4Fa1a0031E665w044Fa2M; Thu, 04 Dec 2008 11:15:34 -0500
X-Authority-Analysis: v=1.0 c=1 a=uScoJcWiD1UA:10 a=XXFRhCI6BIMA:10
	a=vYCkHXpbDyDZeeFclBEA:9 a=FtsjZI-BWPcZy86cAoIA:7
	a=eKv0368qwgw_0HcGfvw1Nf5KUZoA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 4 Dec 2008 09:15:43 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081204161543.GT16628@smtp.west.cox.net>
References: <gh8v57$5nk$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gh8v57$5nk$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Thu, 04 Dec 2008 17:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 04, 2008 at 05:05:58PM +0100, Koen Kooi wrote:
> Hi,
>
> The udev 124 has cache (/etc/dev.tar) to avoid doing the coldplug udev  
> dance that can take a few seconds to a minute depending on machine speed  
> and kernel options. It is working a bit too well at the moment:
>
> * user boots image with 2.6.26 kernel on an omap board
> * user gets /dev/fb0
> * user fixes the bootargs in uboot to enable the overlay
> * user doesn't get /dev/fb1
>
> so remove /etc/dev.tar and reboot: /dev/fb1 appears.
>
> I also encountered a case where the permissions on /dev/null where wrong  
> during first boot (it's a mystery why that happened) and udev cached  
> those making ssh daemons fail on boot.
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
> The key is that it should be transparent to users, so adding a check for  
> .e.g 'ignore_dev.tar=1' in bootargs wouldn't work, since that implies  
> that users are aware of the problem and know how to 'fix' it.
>
> Does anyone have other ways to invalidate the cache, and if not, which  
> option would get your vote?

2 is a different (and perhaps not as) slow.  Also, prepopulate the cache
with fb1?  Or is this all done on the live system with nothing done
during image creation?

-- 
Tom Rini


