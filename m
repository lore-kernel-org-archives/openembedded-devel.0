Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L1jUH-0000FU-6I
	for openembedded-devel@openembedded.org; Sun, 16 Nov 2008 16:24:34 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L1jS3-00065w-8s
	for openembedded-devel@openembedded.org; Sun, 16 Nov 2008 15:22:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 16 Nov 2008 15:22:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 16 Nov 2008 15:22:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 16 Nov 2008 16:22:07 +0100
Message-ID: <gfpdr0$6vm$1@ger.gmane.org>
References: <gfnf5u$r3j$1@ger.gmane.org>
	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081116145911.GB14299@dodger.lab.datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Sun, 16 Nov 2008 15:24:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-08 15:59, Stefan Schmidt wrote:
> Hello.
>
> Sorry for the delay. Having a cold I decided to have a releaxed weekend. Will
> take a deeper look next days if the stuff below does not help.
>
> On Sat, 2008-11-15 at 22:32, Koen Kooi wrote:
>> I just built and installed the updated e-wm and it refuses to start:
>
> Installed means from the updated angstrom feed I guess?

Yes, I did 'bitbake e-wm', synced the new packages to the feeds and did 
'opkg update ; opkg upgrade' on the device (an omap3evm board).
On the omap3evm board I'd like to test illume to see if it is fit to 
replace mb-wm in angstrom pda images, on the beagleboard I'd like to run 
a 'regular' e-wm. The omap3evm was running the 'regular' e-wm at the 
time of the upgrade.

> As a sidenote. This was not rushed in without testing or review. I spent some
> good hours on reviewing it together with mickey, in his role as E maintainer in
> OE. We also decided to keep some more patches out until there is more time for
> review.
>
> And I of course tested it before pushing. Building and actually using it. No
> breakage here. But as I only tested with a complete new image and not with
> updating from a feed I may have messed up here. Should not happen though :(

It seems that almost no OE developer is tracking upgrade paths for such 
intrusive changes, which is a pity. You'd be suprised how much bugs 
there are when you try to build an image from the feeds[1] instead of 
from a pristine deploy/. Anyway, mistakes happen :)

> If eina is installed in a matching version I would need the following to track
> this down as I don't have the problem here:

libeina0 - 2:0.0.1+svnr37324-r0.1 -

> - Full x.log

http://dominion.thruhere.net/koen/OE/e17/e-log.txt

It has scary messages about missing vars, but it *does* find the evas 
engines. However:

root@omap3evm:~# cat /usr/bin/enlightenment_start.oe
#!/bin/sh

E_PROFILE=""
if [ -r /etc/enlightenment/default_profile ]; then
   . /etc/enlightenment/default_profile
fi

renice -10 -p $$
exec enlightenment_start $E_PROFILE

root@omap3evm:~# ls /etc/enlightenment/
sysactions.conf
root@omap3evm:~#

Do I need an extra package to get the default_profile?

> - Full strace

http://dominion.thruhere.net/koen/OE/e17/e-strace.txt

> - Full list of installed packages

http://dominion.thruhere.net/koen/OE/e17/e-installed-packages.txt

Thanks for looking into this, let me know if you need more info.

regards,

Koen

[1] modulo bugs due to not running image_post_process commands



