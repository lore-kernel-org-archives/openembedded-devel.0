Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O68i9-000435-WE
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 22:45:54 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O68ec-0001Tg-SX
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 00:42:15 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Apr 2010 00:42:11 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1272217739.3865.546.camel@trini-m4400>
In-Reply-To: <1272217739.3865.546.camel@trini-m4400>
MIME-Version: 1.0
Message-Id: <201004260042.14155.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The coreutils-native race...
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
X-List-Received-Date: Sun, 25 Apr 2010 20:45:55 -0000
X-Groupsio-MsgNum: 18796
Content-Type: multipart/signed; boundary="nextPart17677882.eL4l529qyG";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart17677882.eL4l529qyG
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 25 =D0=
=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2010 21:48:59 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Tom Rini =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Right now, with a big enough BB_NUM_THREADS we can get into a race where
> coreutils-native is installing programs and elsewhere we are in a
> do_fetch and either trying to use 'cp' or 'md5sum', and blam, we try and
> invoke the program while it's being installed (and see things like
> sh: /path/to/staging/i686-linux/usr/bin/cp: Textfile is busy).
>=20
> There's a few ways out of this:
> 1) Don't rely on 'cp' and 'md5sum' anymore but use python for it.

I guess it couldn't really be done, since those could be invoked from any=20
shell script, right? Although it only is a concern for things before=20
do_configure, so there shouldn't be many scripts there.

> 2) Make an oe_cp and oe_md5sum to go with oe_sha256sum
> 3) IIRC, the big part of coreutils-native was a fully functional,
> always, 'install'.  We could just copy the install we build or provide
> an install wrapper (oe_install) or so

We've had install-native, but that was some broken dusty script that act li=
ke=20
a detonator - you build some package having it in DEPENDS (not many had, bu=
t I=20
was lucky enough) and boom! random packages brake randomly in do_install=20
because of disfunctional install.

I've proposed back then to just drop it. But there've been a concern that f=
or=20
reliable builds it's better to be sure that we have known proper install an=
d=20
that is provided by coreutils along with many other things, which are also=
=20
good to have in some known good state for an OS-independent build system.

This is the way we've got to the point of having coreutils-native in all of=
=20
our builds.

Although, as I'm personally building my things on sane GNU hosts with sane=
=20
coreutils with known nice install, I've always had coreutils-native in=20
ASSUME_PROVIDED. Thus, not seeing any failures with usual 4 bb threads.

I guess, if we can solve it with python, it's the best option. If not, then=
 we=20
can try to remove coreutils-native from base dependencies and see how much=
=20
breakage it introduces. Shouldn't be a problem for most of Linux distros, b=
ut=20
for other platforms it may be.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart17677882.eL4l529qyG
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvUqSYACgkQXJ70z+XgVcNcQwCgz2TAjdjAN3c4ynGeJ3IOTh3o
eCUAnjhPxd3cgfylSWR7yJrTsAJlueU2
=t5Nh
-----END PGP SIGNATURE-----

--nextPart17677882.eL4l529qyG--
