Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1SqY22-0003oe-4d
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 01:15:18 +0200
Received: from [192.168.1.127] (79.1.162.254) by smtp203.alice.it (8.6.023.02)
	(authenticated as editempo@alice.it)
	id 4FFCD57200336ADF; Mon, 16 Jul 2012 00:58:35 +0200
Message-ID: <1342393099.27834.14.camel@gnutoo-desktop>
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 16 Jul 2012 00:58:19 +0200
In-Reply-To: <50033305.5090906@linaro.org>
References: <50033305.5090906@linaro.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Some spare developer boards and other devices
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
X-List-Received-Date: Sun, 15 Jul 2012 23:15:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-15 at 23:15 +0200, Marcin Juszkiewicz wrote:
> Hello
> 
> Few days ago I was unbricking my SheevaPlug and decided to do something
> with developer boards (and other devices) which I own but do not use
> anymore.
> 
> So idea is to give them for free (you cover DHL/UPS/FedEx posting costs)
> for OpenEmbedded developers or Szluug users. I will not send outside of
> European Union due to amount of papers to fill.
> 
> Prefer people with some contributions to open source projects and with
> ideas what to do with this hardware (to not send it for staying in other
> drawer).

> 4. Openmoko GTA01bv3
> 
> One of 36 devices from Phase0 - so very low serial number. But also
> serious battery problems. Device with 128MB microSD card. Should be
> bootable.
The advantage over the freerunner is that there is no glamo, so the
microsd and framebuffer support are way better right?

Because of that it may be way easier to add support for it in the
mainline kernel, however it has downsides too:
 * no wifi.
 * non-free GPS.
 * only one bootloader.
 * currently it has no board support for it, and the support for it has
been removed from the gta02 alsa driver in mainline. I think its machine
number has also been removed...because of the lack of support for it in
mainline(no board file has ever been merged in all theses years).

Is there a limit on the capacity of the microSD card that you can put
inside the GTA01?
I also heard that the framebuffer was faster...so I wonder if that makes
the GUI faster or not.

> http://marcin.juszkiewicz.com.pl/2007/03/05/my-neo1973-has-been-sent/
> 
> 5. Sharp Zaurus c760
> 
> My favourite model of Zaurus family. Also my first donation from user.
> But I do not remember when last time I had it powered on so it only
> takes space in a drawer. Will add original Sharp serial cable and maybe
> bottom case for big and small battery (if find it somewhere). Also
> 802.11b prism2 card and other CF non-memory cards which will find.
Some time ago I looked at the status of the zauruses, it seems that the
mainline kernel support for them is quite complete. The userspace
support too(opie is still alive and there is a meta-opie...).
The only problem is that they lost their mplayer acceleration for videos
right?

Denis.



