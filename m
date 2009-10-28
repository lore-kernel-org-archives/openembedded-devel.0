Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1N3Hbf-00068W-Bb
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 00:07:11 +0100
Received: by pzk15 with SMTP id 15so991930pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 16:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=LrFMiPX8LPSbwpZONwnZp/5oABHZA08ZruRaOwBr+XQ=;
	b=JQVhmpJYaQnXW/7ToiQxS8H2gav38O3cRKap0gXoSkgnMnKGKmWOHc3ALCHy77m8dl
	nIGovCcqlC9ffD0QU2Li6ayKi4vbJ8WCGOdsfZNydwWdGOBfW2bT/FZ+ireoKK9zxi6/
	frCpOh3zwbkDB3Sn6LJC25hrDp2rMp6gHznsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TWiqYfZZXxBiBpzWAZH5YeQKZF73qLGLk7Kd7l8Ncdos045v7+SXsk4EWMLFTWrhRF
	DWe0JGeYN8cpPWX3E8ocv2/CUWHJRoHBGxU2pNXqBbmDdINadXh6Zg6n4qPuVZZqIHTc
	pnretWqQMyRjbJ7W+OEMhnCLTRp7pV2ML2HXM=
MIME-Version: 1.0
Received: by 10.140.208.15 with SMTP id f15mr2190528rvg.164.1256771159442; 
	Wed, 28 Oct 2009 16:05:59 -0700 (PDT)
In-Reply-To: <20091028214424.GA8053@elf.ucw.cz>
References: <d1b08f940910260052x411022ebh50281bbc10b51f49@mail.gmail.com>
	<200910271933.27453.jay4mail@gmail.com>
	<1256678515.7153.13.camel@utx.utx.cz>
	<20091028214424.GA8053@elf.ucw.cz>
Date: Thu, 29 Oct 2009 00:05:59 +0100
Message-ID: <d1b08f940910281605t16e7d86cgecd84fd2465cbcf0@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: 2.6.31 won't boot from nand (c7x0 and tosa)
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
X-List-Received-Date: Wed, 28 Oct 2009 23:07:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Forwarded conversation
Subject: 2.6.31 won't boot from nand (c7x0 and tosa)
------------------------

From: *Andrea Adami* <andrea.adami@gmail.com>
Date: Mon, Oct 26, 2009 at 8:52 AM
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Stanislav Brabec <
utx@penguin.cz>, pavel@ucw.cz, - Cortez - <omegamoon@gmail.com>, Yuri
Bushmelev <jay4mail@gmail.com>


Hello,

I spent some hours compiling various *vanilla* flavours of 2.6.31 for
c7x0, up to 2.6.31.3.
The kernel boots just fine from SD/CF using kexec(boot) but hangs
immediately if launched from nand.

I double-checked the .config and I'm sure I've had the same mtd
options as in 2.6, so it should just boot...
Last lines on console are from bootloader: *** Jumping to Linux ***
and then nothing...no leds activity nor reboot after flash.

What's interesting is that Tosa too doesn't boot from nand with this
kernel, so possibly is the same issue.
Any idea, any floating patch?

Regards

Andrea

----------
From: *Pavel Machek* <pavel@ucw.cz>
Date: Mon, Oct 26, 2009 at 8:58 AM
To: Andrea Adami <andrea.adami@gmail.com>


I'm using kexec, exclusively :-(.
                                                                       Pavel
--
(english) http://www.livejournal.com/~pavelmachek<http://www.livejournal.com/%7Epavelmachek>
(cesky, pictures)
http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html<http://atrey.karlin.mff.cuni.cz/%7Epavel/picture/horses/blog.html>

----------
From: *- Cortez -* <omegamoon@gmail.com>
Date: Mon, Oct 26, 2009 at 9:23 AM
To: Andrea Adami <andrea.adami@gmail.com>


Hi Andrea,

I had no time to look into this yesterday, but browsing through the mailing
list I find:

http://www.spinics.net/lists/arm-kernel/msg75900.html
http://www.spinics.net/lists/arm-kernel/msg75829.html

I hope one of these help ;-)

Cheers,
cortez



----------
From: *Stanislav Brabec* <utx@penguin.cz>
Date: 2009/10/26
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, pavel@ucw.cz, - Cortez -
<omegamoon@gmail.com>, Yuri Bushmelev <jay4mail@gmail.com>


Few days ago I sent a patch called "Zaurus: Fix NAND Flash OOB layout
for Borzoi". Maybe something similar affects Tosa. However quick look
into the code does not show any apparent problem.

Old implementation: Only driver in drivers/mtd/nand/sharpsl.c.

New implementation: Platform definition + drivers/mtd/nand/sharpsl.c.

In my case it attempted to boot, but I seen lots of NAND errors on the
beginning of the boot.

--
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus <http://www.penguin.cz/%7Eutx/zaurus>


----------
From: *Andrea Adami* <andrea.adami@gmail.com>
Date: Mon, Oct 26, 2009 at 3:09 PM
To: Stanislav Brabec <utx@penguin.cz>


Not here on c7x0, if I copy the kexecboot-kernel on SD/CF and boot
from there it seems to find and respect the mtd partitions...

I personally did not test on tosa: Yuri said tosa boots with 2.6.30
but not 2.6.31.
I'll have to try with 2.6.30 on c7x0 too.

Regards

Andrea

----------
From: *Yuri Bushmelev* <jay4mail@gmail.com>
Date: Tue, Oct 27, 2009 at 5:33 PM
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Stanislav Brabec <
utx@penguin.cz>, pavel@ucw.cz, - Cortez - <omegamoon@gmail.com>


I've tested .31 on tosa some time ago. Kernel booting just hangs in the
middle.

BTW, what about create some group on google or project on linuxtogo to
connect all active zaurus users and developers. We are still have some
unresolved troubles (power management for clamshells, wifi for tosa). IMHO,
it would be great thing for collaboration.

--
Yuri Bushmelev

----------
From: *Stanislav Brabec* <utx@penguin.cz>
Date: Tue, Oct 27, 2009 at 10:21 PM
To: Yuri Bushmelev <jay4mail@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>, Dmitry Eremin-Solenikov <
dbaryshkov@gmail.com>, pavel@ucw.cz, - Cortez - <omegamoon@gmail.com>


It may be an useful idea. Especially if there will be any way to contact
other people that may be able to test patch on other devices.

Do you think that it makes sense to create a git tree for Zaurus
(probably based on Eric's tree + Eric's fix tree) and then push tested
stuff? (Well, I am not yet so familiar with git.)

I am thinking about yet another project: Matchbox2. The original site is
dead, maintainers don't respond and I push each fix as a patch directly
to OE. It already works nicely on my Zaurus.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx <http://www.penguin.cz/%7Eutx>, ICQ 116020046,
xmpp:utx@jabber.cz <xmpp%3Autx@jabber.cz>


----------
From: *Pavel Machek* <pavel@ucw.cz>
Date: Wed, Oct 28, 2009 at 10:44 PM
To: Stanislav Brabec <utx@penguin.cz>
Cc: Yuri Bushmelev <jay4mail@gmail.com>, Andrea Adami <
andrea.adami@gmail.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, -
Cortez - <omegamoon@gmail.com>


Yes, something like that would be cool.
Well, if the ammount of outstanding patches gets big and if someone is
willing to maintain it, why not, but for now, I guess using Eric's
tree makes sense.

