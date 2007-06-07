Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HwIjb-00052P-Fz
	for openembedded-devel@openembedded.org; Thu, 07 Jun 2007 16:13:12 +0200
Received: (qmail 12498 invoked by uid 813007); 7 Jun 2007 14:10:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Jun 2007 14:10:40 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jun 2007 16:10:29 +0200
User-Agent: KMail/1.9.7
References: <200706071519.54448.valentin.longchamp@epfl.ch>
In-Reply-To: <200706071519.54448.valentin.longchamp@epfl.ch>
MIME-Version: 1.0
Message-Id: <200706071610.31324.openembedded@hrw.one.pl>
Subject: Re: JFFS2 trouble
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2007 14:13:21 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 7 czerwca 2007, Valentin Longchamp napisa=B3:

> I can boot on the jffs2 images loading them into flash, which is nice.
> However I have noticed that these jffs2 images have several problems:
>
> 1) Running the nfsroot on the dev board, when I want to mount the jffs2
> filesystem from the corresponding mtd device, I have to use the
> corresponding mtdblock and not directly the mtd device. But I have no
> error in dmesg.
>
> > root@mx31ads:/$ mount -t jffs2 /dev/mtd2 /media/flash
> > mount: wrong fs type, bad option, bad superblock on /dev/mtd2,

Use "mtdX" instead of "/dev/mtdX". This method was mentioned on this=20
mailing list before:

Subject: RFC: stop mounting /dev/mtdblockX but mount mtdX (without /dev)
=46rom: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: 21/02/2007 21:20

Working example:

root@c7x0:~# mount mtd3 /home/ -t jffs2
root@c7x0:~# uname -a
Linux c7x0 2.6.21 #2 PREEMPT Wed Jun 6 16:33:32 CEST 2007 armv5tel unknown

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          Warning: Dates in calendar are closer than they appear.




