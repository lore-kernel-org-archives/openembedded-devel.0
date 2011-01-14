Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pdt73-0002DV-PC for openembedded-devel@lists.openembedded.org;
	Sat, 15 Jan 2011 00:31:21 +0100
Received: from g229063146.adsl.alicedsl.de ([92.229.63.146]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pdt6W-0002Kg-I8 for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 23:30:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jan 2011 00:30:47 +0100
Message-ID: <1295047847.3996.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: python: minimal-uclibc: task `configure` fails with `checking mach/cthreads.h presence...`
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
X-List-Received-Date: Fri, 14 Jan 2011 23:31:21 -0000
X-Groupsio-MsgNum: 28060
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-jo8MHGJyLPAwFgZFOAHt"

--=-jo8MHGJyLPAwFgZFOAHt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


after

        bitbake -k console-image x11-image

with `minimal-uclibc` for `MACHINE =3D "beagleboard"` I updated to
c6daf0c9 [1] with disabling IPv6 for Python patch applied [2] (I think
if was before too) and executed

        bitbake -k ccrtp libzrtpcpp dbus-cxx mm-common

and got the following error. Unfortunately I do not know the revision
when I build the images (first command).

        checking for socket in -lsocket... no
        checking for --with-libs... no
        checking for --with-system-ffi...=20
        checking for --with-signal-module... yes
        checking for --with-dec-threads... no
        checking for --with-threads... yes
        checking for _POSIX_THREADS in unistd.h... yes
        checking cthreads.h usability... no
        checking cthreads.h presence... no
        checking for cthreads.h... no
        checking mach/cthreads.h usability... no
        checking mach/cthreads.h presence... ERROR: Function do_configure f=
ailed

I will do a new build from scratch and will report back.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc6daf0c=
9c3f5050bd31daf30e7eb2d9eecc8cf50
[2] http://patches.openembedded.org/patch/281/

--=-jo8MHGJyLPAwFgZFOAHt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0w3KAACgkQPX1aK2wOHViMGACfczi4Vip1QzCeV1hMwRPTOYpa
81gAn069Kf+45Z/g2g0D62mpJFpLNaV7
=ipOI
-----END PGP SIGNATURE-----

--=-jo8MHGJyLPAwFgZFOAHt--
