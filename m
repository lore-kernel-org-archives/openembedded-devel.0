Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <challinan@gmail.com>) id 1OQKnN-0000SE-3I
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 15:42:49 +0200
Received: by pvh1 with SMTP id 1so618515pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 06:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=O3+M+Y1wDrKxh1uBdvtkMdS0ppfJ5ssJVlnEAZaU3e0=;
	b=XEAhuHB5YUIoL7KgKOEQ2wgCDf+pDr/qOyxzmV+rYgAh7pyt8/dKcpUejkxLM/Jiz9
	SdPIz5gCUZLLB/zGgXH8jongHMdzq6lwOcZaPJwg22UvwpvD8Tr65kgmV3ojXK34hpD3
	XkJWa8u+/X9Q4R4EhaipI7dif9y8cbjqWZQfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jZm0LQodZ5XbpaL47tA8FzInpZqnXHtHd89qVnQ4NGs0OhqHxXPGgL62v7lWmTko9t
	5FHiQMauzY1xiqdLQ7kkYdjOjd1j2kRqO5FB3I0uI0Ghla8n9bHde/PrCvzbQA98Drf7
	y/4JoO2cGdb0EGeijkPfx1n2yWWTkpNqnearE=
MIME-Version: 1.0
Received: by 10.143.24.29 with SMTP id b29mr2476617wfj.348.1277041090513; Sun, 
	20 Jun 2010 06:38:10 -0700 (PDT)
Received: by 10.142.229.18 with HTTP; Sun, 20 Jun 2010 06:38:10 -0700 (PDT)
In-Reply-To: <4D3F1A81-1C1A-4A1A-AD8C-C2EB865A7CAD@keylevel.com>
References: <4D3F1A81-1C1A-4A1A-AD8C-C2EB865A7CAD@keylevel.com>
Date: Sun, 20 Jun 2010 09:38:10 -0400
Message-ID: <AANLkTikzD0maKiGuE2bK5-I7dWpcm1W-UvC1uV9ei29H@mail.gmail.com>
From: Chris Hallinan <challinan@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: challinan@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Network card not detected
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
X-List-Received-Date: Sun, 20 Jun 2010 13:42:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jun 19, 2010 at 5:42 PM, Chris Tapp <dokuwiki@keylevel.com> wrote:
> I've built a 'minimal-image' and can get my target (an ALIX board) to boot.
> However, the network interface is not detected - only local loopback is
> available.
>
> I built using 'bitbake minimal-image' - is there something else I need to
> add in to the build to get the kernel to detect and configure the ethernet
> card?

Well it depends on what you mean by "detect".  I'm not familiar with
your platform (ALIX board) so I can only offer generic advice.  There
are a few requirements to get your Ethernet card "detected."  First,
you need to make sure your kernel has support for the drivers required
for your board/Ethernet interface.  Let's assume that you do have the
proper support in your kernel.

Next you need a way to configure the interface.  There are several
options here.  You can pass in static config parameters via the kernel
command line.  Or, you can use some type of automatic configuration
such as dhcp.  Pass ip=dhcp on your kernel command line for this
option.

Alternatively, you can use ifconfig to manually configure the
interface once booted, but your minimal-image probably doesn't contain
ifconfig.  I built minimal-image for angstrom-2008.1/beagleboard and
ifconfig is not there.  You didn't mention what distro you're
building, but it's probably not in your minimal-image.

If you really want automatic detection (by which I'm assuming you mean
automatic configuration) then you want some type of device manager, of
which there are two: udev and busybox mdev.  Take a look at some other
image recipes and you'll see examples of DISTRO_DEV_MANAGER, set by
your distribution.

So you can add net-tools (and it's dependencies) to your
minimal-image, or to make life a little easier on yourself, use a more
complete image, something like console-image which should contain
everything you need to light up your Ethernet  port.

Also, this discussion might be more appropriate on the openembedded-users@ list.

-Chris
-- 
Life is like Linux - it never stands still.


