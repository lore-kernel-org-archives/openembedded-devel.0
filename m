Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PFTUY-0004iB-JR for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 16:18:44 +0100
Received: from f053033048.adsl.alicedsl.de ([78.53.33.48]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PFTTg-0004pN-7l for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 15:17:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201011080000.52045.roman@khimov.ru>
References: <1288774920.3980.29.camel@mattotaupa>
	<201011071932.02392.khimov@altell.ru>
	<1289158359.3878.22.camel@mattotaupa>
	<201011080000.52045.roman@khimov.ru>
Date: Mon, 08 Nov 2010 16:17:46 +0100
Message-ID: <1289229466.5165.56.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: perl_5.8.8: fails with `ld: cannot find -lnsl`
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
X-List-Received-Date: Mon, 08 Nov 2010 15:18:44 -0000
X-Groupsio-MsgNum: 26015
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-q53PjIbP1SdI7huOIoDg"

--=-q53PjIbP1SdI7huOIoDg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 08.11.2010, 00:00 +0300 schrieb Roman I Khimov:=20
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 07 =
=D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2010 22:32:39 =D0=B0=D0=B2=D1=82=D0=BE=
=D1=80 Paul Menzel =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:

The error is the following.

        /oe-angstrom-beagleboard/tmp/sysroots/x86_64-linux/usr/armv7a/lib/g=
cc/arm-oe-linux-uclibceabi/4.5.2/../../../../arm-oe-linux-uclibceabi/bin/ld=
: cannot find -lnsl

Reading this line, do you use `minimal-uclibc` as the distribution?
There might be a difference in the uClibc or Perl versions used.

I forgot to mention that I have the following in my `local.conf`.

        PREFERRED_UCLIBC_VERSION        =3D "git"

What does the following command return on your system?

        $ find /oe/build-minimal-uclibc/ -name *libnsl*
        /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linu=
x-uclibceabi/lib/libnsl.so.0
        /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linu=
x-uclibceabi/lib/libnsl-0.9.32-git.so
        /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linu=
x-uclibceabi/usr/lib/libnsl.so
        /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linu=
x-uclibceabi/usr/lib/libnsl.a

> > What is `-lnsl`?
> >=20
> > `perl` builds just fine for me. I tried it again with a clean temporary
> > directory. My build host runs Debian Squeeze.
>=20
> Lenny here, and although in theory it shouldn't matter, it's 100% reprodu=
cible=20
> for me.

Searching the WWW I found the following section in the document listing
differences between Glibc and uClibc [1].=20

        8) libnsl provides support for Network Information Service (NIS) wh=
ich was
        originally called "Yellow Pages" or "YP", which is an extension of =
RPC invented
        by Sun to share Unix password files over the network.  I personally=
 think NIS
        is an evil abomination and should not be used.  These days, using l=
dap is much
        more effective mechanism for doing the same thing.  uClibc provides=
 a stub
        libnsl, but has no actual support for Network Information Service (=
NIS).
        We therefore, also do not provide any of the headers files provided=
 by glibc
        under /usr/include/rpcsvc.

So `libnsl` should be somewhere.

> I'd recommend you at least to try newer perl.

Well let us see whether a newer uClibc helps too. ;-)


Thanks and sorry for leaving out that piece of information,

Paul


[1] http://www.uclibc.org/downloads/Glibc_vs_uClibc_Differences.txt=20

--=-q53PjIbP1SdI7huOIoDg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzYFJoACgkQPX1aK2wOHVhvFgCffSFtjv97zTJHEtMxMrUvCLIt
oEAAn1vO3ox2C97OmpZahLIFFF0ypJxo
=ALCo
-----END PGP SIGNATURE-----

--=-q53PjIbP1SdI7huOIoDg--
