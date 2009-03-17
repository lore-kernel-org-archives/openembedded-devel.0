Received: from [63.139.215.211] (helo=maxie.russound.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jims@russound.com>) id 1LjggR-0006wf-Ch
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 22:18:56 +0100
Received: from kmfms (unknown [10.0.3.67])
	by maxie.russound.com (Postfix) with ESMTP id 030E6C98619
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 17:14:51 -0400 (EDT)
Date: Tue, 17 Mar 2009 17:17:05 -0400
From: Jim Sheldon <jims@russound.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20090317171705.208a7d31@kmfms>
In-Reply-To: <49BFADB1.3090207@bolloretelecom.eu>
References: <49BFA406.6030802@bolloretelecom.eu>
	<20090317143526.3e79150c@vanille.zapto.org>
	<49BFADB1.3090207@bolloretelecom.eu>
X-Mailer: Claws Mail 3.5.0 (GTK+ 2.12.11; i486-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 63.139.215.211
X-SA-Exim-Mail-From: jims@russound.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Tue, 17 Mar 2009 21:18:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Greetings!  I had a couple of Qt recipes that used "inherit
qtopia4core" and worked just fine.

Now if I "inherit qt4e" they fail with something like this:

| NOTE: using qmake spec
in /home/jim/Projects/gumstix/oe/tmp/cross/armv7a/share/qt4/mkspecs/linux-g=
nueabi-oe-g++,
using profiles ''
| NOTE: qmake prevar substitution:   QT_LIBINFIX=3DE |
Failure to read QMAKESPEC conf
file /home/jim/Projects/gumstix/oe/tmp/cross/armv7a/share/qt4/mkspecs/linux=
-gnueabi-oe-g++/qmake.conf.
| Error processing project file: flickcharm.pro
| FATAL: Error
calling /home/jim/Projects/gumstix/oe/tmp/staging/i686-linux/usr/bin/qmake2
on flickcharm.pro

Is tmp/cross/armv7a/share/qt4/mkspecs/linux-gnueabi-oe-g++ the correct
path?  I have a tmp/cross/i686/share/qt4/mkspecs/linux-gnueabi-oe-g++
area, but not tmp/cross/armv7a/share/qt4/mkspecs/linux-gnueabi-oe-g++.

I'm assuming I just need to do something more than just "inherit qt4e"
in my recipe?  Perhaps I'm seeing a bug specific to the gumstix branch?

I grepped around but couldn't find another recipe that inherits qt4e to
use as an example.

Thanks!

Jim

On Tue, 17 Mar 2009 10:03:29 -0400
Jeremy Lain=C3=A9 <jeremy.laine@bolloretelecom.eu> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Michael 'Mickey' Lauer wrote:
> > Sounds good to me, feel free to go ahead.
> OK, done.
>=20
> - --
> Jeremy LAINE
> Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>=20
> iEYEARECAAYFAkm/rbEACgkQCL1n3lVB9EYlCQCeNiXedgURRFihAWGTfzEUrVoG
> SGQAoL6/0LcGFYJ2j9cOW5o/F9Qj8/sA
> =3Dq/W8
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


