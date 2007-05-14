Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HnanI-0002Dw-0c
	for openembedded-devel@openembedded.org; Mon, 14 May 2007 15:40:58 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4EDejox013424 for <openembedded-devel@openembedded.org>;
	Mon, 14 May 2007 15:40:45 +0200
Message-ID: <464866DC.6060502@dominion.kabel.utwente.nl>
Date: Mon, 14 May 2007 15:40:44 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <07a101c7962b$e0db5860$0200a8c0@atmel.com>
In-Reply-To: <07a101c7962b$e0db5860$0200a8c0@atmel.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l4EDejox013424
Subject: Re: qemu-native failure on Angstrom
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
X-List-Received-Date: Mon, 14 May 2007 13:41:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ulf Samuelsson schreef:
> Tried building OpenEmbedded for the first time, DISTRO=3D=C3=85ngstr=C3=
=B6m,=20
> with an at91sam9263 target (made my own file) but it seems that
> qemu.native is not compilable on my OpenSuSE 10.1 system using gcc-4.1.=
2.
> The error message says that qemu has only been tested on gcc-4.x.x for =
arm
> and that other architectures need gcc-3.x
>=20
> Tried to update the bb files to allow gcc-4.1.2 but that resulted in
> qemu-arm not beeing built, causing the build to terminate later.
>=20
> Is there any way to have open embedded build a gcc-3.4.4 cross compiler
> as part of the normal build.

You want a native gcc3 on your host, since qemu-native will be compiled w=
ith that, on
debian that can be done with 'apt-get install gcc-3.4'.

Alternatively you can set ENABLE_BINARY_LOCALE_GENERATION =3D "0" in your=
 local.conf.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGSGbcMkyGM64RGpERAlXOAJ9HlfnJ5CbfVrHd3lOIBsDfyqbDqgCgmzv5
4tDq+oZskVRAfnxs7rWNlVA=3D
=3DOQ93
-----END PGP SIGNATURE-----


