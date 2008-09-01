Received: from [130.89.2.13] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ka784-0007kQ-1R
	for openembedded-devel@openembedded.org; Mon, 01 Sep 2008 12:59:28 +0200
Received: from [172.20.1.5] (vpn006048.vpn.utwente.nl [130.89.6.48])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id m81AvD1X029463; 
	Mon, 1 Sep 2008 12:57:13 +0200
Message-Id: <6051830F-D75C-4B5F-8509-1C06F23450FF@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: beagleboard <beagleboard@googlegroups.com>
In-Reply-To: <1219364965.7212.319.camel@dfarning.desktop.org>
Mime-Version: 1.0 (Apple Message framework v926)
Date: Mon, 1 Sep 2008 12:57:10 +0200
References: <1219364965.7212.319.camel@dfarning.desktop.org>
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.926)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	Jason Kridner <jdk@ti.com>, Sugar List <sugar@laptop.org>
Subject: Re: Sugar on the BeagleBoard using the OpenEmbedded toolkit.
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
X-List-Received-Date: Mon, 01 Sep 2008 10:59:28 -0000
X-Groupsio-MsgNum: 5816
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-2--706221232"
Content-Transfer-Encoding: 7bit

--Apple-Mail-2--706221232
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable


Op 22 aug 2008, om 02:29 heeft David Farning het volgende geschreven:

> Welcome to the Sugar on the BeagleBoard project.  It seems that we =20
> have
> all of the pieces in place to do a port.
>
> First, some background.
>
> The initial port will be getting Sugar[1] to run on the Beagleboard[2]
> using the Open Embedded[3] toolkit.

The basics (sugar, sugar-base, sugar-toolkit, sugar-presence-services =20=

and sugar-artwork) are now running on the beagleboard:

http://www.angstrom-distribution.org/sugar-running-=E5ngstr=F6m

To build it using OE: 'bitbake sugar'
To install it in angstrom*: 'opkg install sugar'

The Glucose pack is missing sugar-datastore (needs a lot of python =20
modules that aren't in OE yet), etoys (haven't looked at that yet) and =20=

journal (haven't looked at that either).
The Fructose pack is completely missing in OE.

The remaining tasks for people wanting to work on this are:

1) add OE recipes for needed python-modules
2) add OE recipes for remaining Glucose items
3) add OE recipes for Fructose items
4) build it
5) install resulting packages and run them, see them crash due to =20
missing python modules, goto 1
6) make screenshots :)

regards,

Koen

* only has armv7a packages at the moment=

--Apple-Mail-2--706221232
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFIu8qIMkyGM64RGpERAmdhAKCnNzoPOqCVmIoocHYhfaoKv49HkACgoDxr
sIMSlAuZCbFSevOPVZB/g9o=
=aPkA
-----END PGP SIGNATURE-----

--Apple-Mail-2--706221232--
