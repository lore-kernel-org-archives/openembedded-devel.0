Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZujQ-0004HC-DV for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 00:22:04 +0100
Received: from g225142131.adsl.alicedsl.de ([92.225.142.131]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZuhB-0003nT-0h for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 23:19:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d66caabb1001261452n7b43aaa4tdcf049e4b575d64d@mail.gmail.com>
References: <d66caabb1001261452n7b43aaa4tdcf049e4b575d64d@mail.gmail.com>
Date: Wed, 27 Jan 2010 00:19:39 +0100
Message-ID: <1264547979.26996.20.camel@mattotaupa>
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
X-List-Received-Date: Tue, 26 Jan 2010 23:22:04 -0000
X-Groupsio-MsgNum: 16246
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-EPRvc+L697X4Xhg3YB5G"

--=-EPRvc+L697X4Xhg3YB5G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Graeme,


Am Mittwoch, den 27.01.2010, 09:52 +1100 schrieb Graeme Russ:

[=E2=80=A6]

> To date, I have been doing a lot of work getting a functionaly stable
> boot loader up and running. I ended up choosing U-Boot because it
> appeared to be the most open of all mature boot loaders.

coreboot also seems to support some boards with the AMD SC520 [1].

> U-Boot had a
> very old and incomplete x86 / sc520 port which I have put a lot of
> work into maturing and stabalising. Nearly all of this work to date
> has been fed back into the U-Boot source (you can track my progress on
> their mailing list). I am now at the point where I feel confident that
> U-Boot can launch a Linux kernel.
>=20
> The problem is - I don't know how to proceed. It looks like PPC and
> ARM have very strong embedded followings and there is a lot of
> information out there for people that want to get an embedded kernel
> running on these platforms. x86 seems to be a very poor cousin.
>=20
> So far, I have cloned the 2.6.33 linux kernel Git repository and
> configured and compiled the kernel.

Where does Linux stop if you try to boot it?

> I think my first question is about how to get hardware information
> (RAM layout etc) to the Kernel. It looks like the initial U-Boot
> implementation setup a very basic BIOS which emulated part of the
> traditional PC BIOS. Surely there is a better way to do this. Is the
> Simple Firmware Interface an option?
>=20
> Any help would be greatly appreciated.

Sorry I cannot help further. Should not the guys on the U-Boot list know
more about how to get U-Boot and Linux running on a x86 system?


Thanks,

Paul


[1] http://www.coreboot.org/Supported_Motherboards

--=-EPRvc+L697X4Xhg3YB5G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktfeIsACgkQPX1aK2wOHVhvBQCff6ls92QXqRRvD9LLcl6WtgnW
j1oAoI2YGKEEWUWDLiODvsxf2USV7yly
=AmiV
-----END PGP SIGNATURE-----

--=-EPRvc+L697X4Xhg3YB5G--
