Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NA220-0007xZ-KN
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 14:54:15 +0100
Received: (qmail 15667 invoked by uid 813007); 16 Nov 2009 13:52:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Nov 2009 13:52:49 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Nov 2009 14:52:52 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc5-00402-gb6727b1; KDE/4.3.2; x86_64; ;
	)
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
	<992df8520911160511s4e641b28ya68dd6bd14f1101@mail.gmail.com>
In-Reply-To: <992df8520911160511s4e641b28ya68dd6bd14f1101@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911161453.01127.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Mon, 16 Nov 2009 13:54:17 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 16 listopada 2009 o 14:11:29 Alex Ferguson napisa=
=C5=82(a):
> However, I am having some problems with the Marvell firmware. The driver
> expects firmware images with names like "gspi8686.bin" and
> "gspi8686_hlp.bin". The marvell-gspi-fw package contains firmware files
>  with non-compatible names. Even with compatible names, the driver fails =
to
>  find the firmware under /lib/firmware, though this probably hasn't
>  anything to do with OE.
>=20
> There exists a git repository on git.kernel.org with the required firmware
> files, though I believe it's better I fix the marvell-gspi-fw package for
> future use, as I found no packages depending on it and thus risking
> breakage.

BUG from BugLabs uses Marvell SPI and SDIO firmwares for 8686 wifi chipset.=
=20
Present version of hardware (r1.3) comes with SDIO connected wifi and uses =
=20
firmwares/marvell-sdio-fw_9.70.3-p37.bb recipe for it.=20

Older firmwares/marvell-gspi-fw_9.70.3-p37.bb recipe is used for BugWifi=20
module support which adds SPI connected Wifi/BT for older hardware revision=
s.

And this device is supported in OpenEmbedded - we use stable/2009 for it pl=
us=20
own overlay.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




