Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L8JlR-0004hR-AW
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 20:21:30 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081204191751.NQJA131.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 4 Dec 2008 14:17:51 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id n7Hp1a0011E665w037Hpfe; Thu, 04 Dec 2008 14:17:51 -0500
X-Authority-Analysis: v=1.0 c=1 a=uScoJcWiD1UA:10 a=XXFRhCI6BIMA:10
	a=22pK5S-mAAAA:8 a=RqRF_szQrBV2jwSrkwwA:9 a=O_fS6AT5lV3JtOzk_QIA:7
	a=E2QEflxJOPVYpdIjwRZTsuDad44A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 4 Dec 2008 12:17:58 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081204191758.GW16628@smtp.west.cox.net>
References: <gh8v57$5nk$1@ger.gmane.org>
	<20081204161543.GT16628@smtp.west.cox.net>
	<gh94cf$p59$2@ger.gmane.org>
	<20081204184937.GU16628@smtp.west.cox.net>
	<gh99gk$dcv$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gh99gk$dcv$1@ger.gmane.org>
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
X-List-Received-Date: Thu, 04 Dec 2008 19:21:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 04, 2008 at 08:02:44PM +0100, Koen Kooi wrote:
> On 04-12-08 19:49, Tom Rini wrote:
[snip]
>> Right.  I was thinking about this more.  That's why internally we do
>> this differently.  First, what you want cached is only the stuff that
>> will be cold-plugged (ie whats built into the kernel only, not the
>> modules to be loaded up after we start udev).  The easy way out is what
>> we do, provide the full cache as part of the image (and it's OK if you
>> have fb[012]), and the board guy says "OK, this is ready, here's the
>> udev cache".
>
> That also makes it pretty much machines specific, which is something I'd  
> like to avoid. But you're right, it would make things slightly better,  
> but it doesn't scale with kernel versions, bootargs variations, board  
> variations and general appearances of Murphy.
> And the boards I'm working with now have a lot of usb drivers builtin,  
> and I will need to spend a lot of time on google to work out all the  
> devnodes.

I'm not sure it won't scale, but honestly I do have a much more
controlled environment.  But, I see it being a generic hook (if it
exists, use it) that's machine specific (so it's always machine correct)
being a feature, not a bug.  bootargs and board variations don't matter
here, your machine-specific cache should have every cold-plug device
present (again, wasting space on a few extra dev nodes saves sanity and
prevents non-working situations later).

Also, USB is exactly what you don't want to have cached.  When I was
investigating this a while back, it was ptys and other very common stuff
that was 95% of the nodes being created.  The rest was framebuffer, UBI
control and so on.  But even with USB, it comes down to what's going to
get a coldplug faked hotplug, not what will be plugged in later.
External devices that stay plugged in through a reset can be re-created
in the background and will exist before the user can really do anything,
I'm willing to be (as that's what I saw on our boards).

>
> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


