Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pemhx-00017P-Vm for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 11:53:10 +0100
Received: from f053038247.adsl.alicedsl.de ([78.53.38.247]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PemhM-0007CY-9C for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 10:52:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 11:52:30 +0100
Message-ID: <1295261550.4844.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: glibc_2.9: task `package` fails with `"WORKDIR not defined, unable to package"`
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
X-List-Received-Date: Mon, 17 Jan 2011 10:53:10 -0000
X-Groupsio-MsgNum: 28090
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BwgIniqvWcfC4sAXuXqU"

--=-BwgIniqvWcfC4sAXuXqU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task `package` failed with the following error running `bitbake -k
glibc` with `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.

        Packaged contents of glibc-charmap-ibm868 into /oe/build/angstrom-d=
ev/deploy/glibc/ipk/armv7a/glibc-charmap-ibm868_2.9-r37.4.6_armv7a.ipk
        ERROR: Error in executing python function in: /oe/openembedded/reci=
pes/glibc/glibc_2.9.bb
        ERROR: Exception:<type 'exceptions.ValueError'> Message:need more t=
han 1 value to unpack
        ERROR: Printing the environment of the function
        ERROR:  0001:def do_package_ipk(d):
        ERROR:  0002:   import re, copy
        ERROR:  0003:
        ERROR:  0004:   workdir =3D bb.data.getVar('WORKDIR', d, 1)
        ERROR:  0005:   if not workdir:
        ERROR:  0006:           bb.error("WORKDIR not defined, unable to pa=
ckage")
        ERROR: Function do_package_ipk failed

I recently activated

        PARALLEL_MAKE =3D "-j4"

in `conf/local.conf`.

I could not reproduce this problem running `bitbake -k glibc` a second
time.


Thanks,

Paul

--=-BwgIniqvWcfC4sAXuXqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk00H2cACgkQPX1aK2wOHVjOxQCggHEUYS2VKo3Cc1dzt7O55aVO
lhQAnRVr9L5gIW/T3zBSE8ZVrsivZndN
=UXnA
-----END PGP SIGNATURE-----

--=-BwgIniqvWcfC4sAXuXqU--
