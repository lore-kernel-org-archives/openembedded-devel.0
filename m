Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbeRj-0003ch-Sy
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 19:50:40 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD0056D02A for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 19:34:06 +0200
Message-ID: <4A844E8D.6000008@atmel.com>
Date: Thu, 13 Aug 2009 19:34:05 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A81BE84.6010607@atmel.com>	<200908121433.31479.marcin@juszkiewicz.com.pl>	<1250092579.12282.73.camel@mill.internal.reciva.com>
	<4A83BC6C.3090308@atmel.com>
In-Reply-To: <4A83BC6C.3090308@atmel.com>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Status update
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
X-List-Received-Date: Thu, 13 Aug 2009 17:50:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ulf Samuelsson skrev:


Have managed to build a number of things now using my private branch.

1) opie-image
2) x11-image
3) x11-gpe-image
4) console-image


dfc = boot from dataflashcard
df = boot from dataflash

Kernel builds for:
at91sam9263dfc
at91sam9261df
at91sam9260dfc
at91sam9g20dfc
at91sam9g45ek (boots from NAND flash)

u-boot and at91bootstrap also builds.

I added some audio stuff to the build,
resulting in a JFFS2 file systems size
for x11-gpe-image of > 60 MB.

This is unfortunate, since the size of the partition, where it is
supposed to fit is 60 MB.

The x11-image and x11-gpe-image was too big,
but opie-image is about 55 MB, so I loaded
this using SAM-BA.

----
I loaded a file system built for the SAM9261df
on a SAM9263EK using the correct kernel and boots.

1) No sound card found. "/dev/dsp"
   Have to look at kernel config.

2) I included mpd in the build, but this seems
   to lack a number of directories which are not installed

   "/var/lib/mpd" does not exist
   "/var/lib/mpd/mpd.log" cannot be opened
   "/media/content" does not exist
   "/var/lib/mpd/playlists" does not exist
   "var/lib/mpd/mpd.db does" not exist

3) Could not set time zone to Berlin, because some package was missing.

4) Using Opie on a VGA screen is not so nice,
   since characters are fuzzy.

5) ODevice() - Found Hardware : ATMEL AT91SAM9263EK
   ODevice() - unknown hardware - using default

   I guess, this could be because I use an AT91SAM9261EK

6) Psychedelic colours
   The AT91SAM9263 and earlier devices uses a BGR (Blue-Green-Red)
   orientation, while most S/W expect RGB (Red-Green-Blue).
   This can be fixed by swapping the connection from the chip
   to the display, otherwise, it will require fixing the S/W.

   Don't know if Opie does this, if the right H/W is detected.

   If QT 4.3.x or later is configured with "-depth generic"
   Then you need to export "QWS_DISPLAY=Linuxfb:genericcolors"
   but when I did this, the screen went black :-(

   When I removed this, and restarted,I again got a nice screen
   Pink and Yellow!!!
   Got to find those adapters, I have somewhere...

   The SAM9G45 should not have this problem.



Tried building beagleboard-demo-image failed:
ERROR: Task 4419
(/home/ulf/projects/OE_atmel/openembedded/recipes/gnome/libgnomeprint_2.18.5.bb,
do_compile) failed
Entering directory
`/home/ulf/projects/OE_atmel/boards/build-at91sam9261df/tmp/
work/armv5te-angstrom-linux-gnueabi/libgnomeprint-2.18.5-r0/
libgnomeprint-2.18.5/doc/reference'

Reason:  I/O error : Attempt to load network entity
http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd



-- 
Best Regards
Ulf Samuelsson



