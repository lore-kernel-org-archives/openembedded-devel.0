Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NWab3-0004On-MC
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 20:15:41 +0100
Received: (qmail 11562 invoked by uid 813007); 17 Jan 2010 19:13:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Jan 2010 19:13:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 20:13:05 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc2-00268-g45d28b0; KDE/4.3.4; x86_64; ;
	)
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
In-Reply-To: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201001172013.06010.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and 	tosa
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
X-List-Received-Date: Sun, 17 Jan 2010 19:15:41 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 17 stycznia 2010 o 15:06:19 Andrea Adami napisa=C5=82(a):
> Reading the post about gnu-tar I remember we talked about a new way to
> install 2.6 kernels and images on Zaurus.

Any way is good but I hope that there still be a way to install OE build=20
results on SharpROM based Zaurus.
=20
> Well, there are very good reasons to make this now obsolete:
> - we can flash from console (2.6 userspace)
> - we have a different image-layout (kernel in /boot), thus we can boot
> from every hd partition
> - we can create jffs2 images (see Narcissus) and flash these from
> console, without striping the legacy headers. We can even have 2
> images in nand
=20
> My idea would be:
>=20
> -refactor updater.sh and flash only kernels
> -provide an updater script

What about this (note that I do not track kexecboot work):

=2D make updater.sh which will flash kexecboot kernel and reboot
=2D let kexecboot initramfs checks for CARD/sysupdate.sh
=2D CARD/sysupdate.sh will update rootfs/kernel etc and reboot

sysupdate.sh name is chosen to allow updater.sh (for crappy bootloader) and=
=20
real update script to be on same card. This way you can update any Zaurus=20
nevermind what kind of OS it had before. And as kexecboot kernel will have =
our=20
nand split table inside anything can be done in sysupdate.sh script (format=
ing=20
/ and /home for example or installing them from card images etc).
=20
Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




