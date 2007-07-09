Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1I7uXV-0006nZ-S6
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 16:48:37 +0200
Received: (qmail 5634 invoked by uid 813007); 9 Jul 2007 14:43:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 9 Jul 2007 14:43:02 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 9 Jul 2007 16:42:59 +0200
User-Agent: KMail/1.9.7
References: <468C7B11.8050809@openhardware.net>
In-Reply-To: <468C7B11.8050809@openhardware.net>
MIME-Version: 1.0
Message-Id: <200707091643.00611.openembedded@hrw.one.pl>
Subject: Re: howto? Build something but not deploy in root image
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
X-List-Received-Date: Mon, 09 Jul 2007 14:48:38 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 5 lipca 2007, Tom Walsh napisa=B3:

> I have several parts to this project that must be built during the
> bitbake process (bootstrap-image), but are not part of the target
> filesystem image.  The total system parts are:
>
> * bootloader - ARM - resides in Flash.
> * kernel - ARM - resides in Flash.
> * target rootfs image - ARM - resides on MMC card.
> * Flash Utility - native (x86) - runs on host computer.

In machine config add:

IMAGEDEPENDS =3D "bootloader flash-utility-native"

Basically it should be MACHINE_EXTRA_DEPENDS but we do not support it yet=20
properly.

> The only thing that I need in the root filesystem (tmp/rootfs/) is the
> packages I named from the local conf files.=20

Create own image recipe and add those packages to RDEPENDS and=20
PACKAGE_INSTALL.

> As to the bootloader, it comes in two sections (files), these are
> programmed by the Flash Utility into the target system.  The bootloader
> is not needed in the root filesystem.

> The problem is not getting these things built, but preventing them from
> being installed in the tmp/rootfs/ filesystem or tarball.  They should
> only go into tmp/deploy/image/, which  I currently have them going
> into... =20

Look at uboot/u-boot* recipes and their do_deploy() tasks which copy=20
bootloader into tmp/deploy/images/ dir.

> However, the bitbake system assumes that anything that is=20
> packaged, must be deployed into the root filesystem!?

No. Image is built from packages, but from selected ones only.

> How do you build a bootloader that resides in Flash and doesn't get
> stuck into the filesystem image?  The same would hold true for the
> native (linux PC) app which flashes the target memory.

In their recipes add do_deploy() task which copies them to=20
tmp/deploy/images/ dir.


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

     Free speech includes the right not to listen, if not interested=20
                                                [Robert A. Heinlein]




