Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZvQh-0001HM-0M for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 01:06:46 +0100
Received: from g225142131.adsl.alicedsl.de ([92.225.142.131]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZvOR-0008Iq-TU for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 00:04:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d66caabb1001261547m781b97c2re570281be80ca2eb@mail.gmail.com>
References: <d66caabb1001261452n7b43aaa4tdcf049e4b575d64d@mail.gmail.com>
	<1264547979.26996.20.camel@mattotaupa>
	<d66caabb1001261547m781b97c2re570281be80ca2eb@mail.gmail.com>
Date: Wed, 27 Jan 2010 01:04:21 +0100
Message-ID: <1264550661.26996.30.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Request for Help : Porting linux to custom x86 (AMD SC520) board
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
X-List-Received-Date: Wed, 27 Jan 2010 00:06:46 -0000
X-Groupsio-MsgNum: 16248
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fBoXjXvwtkkBScIQasDh"

--=-fBoXjXvwtkkBScIQasDh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 27.01.2010, 10:47 +1100 schrieb Graeme Russ:
> On Wed, Jan 27, 2010 at 10:19 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > Am Mittwoch, den 27.01.2010, 09:52 +1100 schrieb Graeme Russ:
> >
> > [=E2=80=A6]
> >
> >> To date, I have been doing a lot of work getting a functionaly stable
> >> boot loader up and running. I ended up choosing U-Boot because it
> >> appeared to be the most open of all mature boot loaders.
> >
> > coreboot also seems to support some boards with the AMD SC520 [1].
>=20
> Thanks, I will have a look but I think Coreboot is geared more towards
> a BIOS replacement for mainstream PC motherboards? I am working an a
> real embedded (custom) board.

As far as I know that does not matter since it has to be ported to every
chipset and board nonetheless. Coreboot just initializes the hardware
and then gives control to a so cold payload. That can be the Linux
kernel, Filo (a bootloader based on GRUB), SeaBIOS (which implements
traditional BIOS calls(?)/interrupts), Memtest86+ and so on.

Maybe you can just try to build coreboot with some payload using Kconfig
(just introduced) for a board with this chipset or which is similar to
yours and try to flash it using Flashrom [2] for example. (Only if you
are able to recover.) Start it and see how far it goes.

If you have question just ask on the mailing list or join the IRC
channel where the developers hang around.

> >> U-Boot had a
> >> very old and incomplete x86 / sc520 port which I have put a lot of
> >> work into maturing and stabalising. Nearly all of this work to date
> >> has been fed back into the U-Boot source (you can track my progress on
> >> their mailing list). I am now at the point where I feel confident that
> >> U-Boot can launch a Linux kernel.
> >>
> >> The problem is - I don't know how to proceed. It looks like PPC and
> >> ARM have very strong embedded followings and there is a lot of
> >> information out there for people that want to get an embedded kernel
> >> running on these platforms. x86 seems to be a very poor cousin.
> >>
> >> So far, I have cloned the 2.6.33 linux kernel Git repository and
> >> configured and compiled the kernel.
> >
> > Where does Linux stop if you try to boot it?
>=20
> I haven't actually attempted to boot the kernel yet - mostly because
> I don't really know how. I have confirmed in U-Boot the ability to
> execute a stand-alone application loaded at a given address in
> memory (U-Boot has a 'Hello World' example that I have managed to
> get running). The problem is, U-Boot runs in x86 protected mode, so
> I would assume U-Boot needs to drop out of protected mode before
> starting up the kernel in order to allow the kernel to setup the
> descriptor tables as required.
>=20
> >
> >> I think my first question is about how to get hardware information
> >> (RAM layout etc) to the Kernel. It looks like the initial U-Boot
> >> implementation setup a very basic BIOS which emulated part of the
> >> traditional PC BIOS. Surely there is a better way to do this. Is the
> >> Simple Firmware Interface an option?
> >>
> >> Any help would be greatly appreciated.
> >
> > Sorry I cannot help further. Should not the guys on the U-Boot list kno=
w
> > more about how to get U-Boot and Linux running on a x86 system?
>=20
> I have asked this same question on the U-Boot mailing list. Unfortunately=
,
> U-Boot has more traditionally been geared towards PPC and ARM. The only
> person I know of that ever got U-Boot to boot an x86 kernel has not been
> active on the U-Boot mailing list for a number of years.

Thank you for your detailed response. Unfortunately I do not know
anything about this stuff and now I know a little more.


Thanks,

Paul


> > [1] http://www.coreboot.org/Supported_Motherboards
[2] http://www.flashrom.org/Flashrom

--=-fBoXjXvwtkkBScIQasDh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktfgwUACgkQPX1aK2wOHViR4gCggSEtZfWqApkVsdWcoHBNPpNw
9GYAn3Hi40rVCZoETabf1/vUR7ReUjk+
=3i6p
-----END PGP SIGNATURE-----

--=-fBoXjXvwtkkBScIQasDh--
