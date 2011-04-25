Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QENi8-0001OB-1f for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 17:28:28 +0200
Received: from f053045128.adsl.alicedsl.de ([78.53.45.128]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QENgT-0004jt-62 for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 15:26:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104251704.03324.sgh@sgh.dk>
References: <201104251704.03324.sgh@sgh.dk>
Date: Mon, 25 Apr 2011 17:26:00 +0200
Message-ID: <1303745160.15311.36.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] python-scons_1.3.0: add `python-native` to `DEPENDS_virtclass-native`
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
X-List-Received-Date: Mon, 25 Apr 2011 15:28:28 -0000
X-Groupsio-MsgNum: 31439
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GJxM2gq/NQAvJADuVzej"

--=-GJxM2gq/NQAvJADuVzej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 25 Apr 2011 17:18:07 +0200

A clean build fails with the following error [1].

ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc16/tm=
p/work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.26596 =
for further information)
ERROR: Logfile of failure stored in: /home/sgh/oe-new-oe/build-vmc16/tmp/wo=
rk/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.26596
Log data follows:
| ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc16/=
tmp/work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.2659=
6 for further information)
| + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons-n=
ative-1.3.0-r1/scons-1.3.0
| + do_compile
| + distutils_do_compile
| + STAGING_INCDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-li=
nux/usr/include
| + STAGING_LIBDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-li=
nux/usr/lib
| + BUILD_SYS=3Dx86_64-linux
| + HOST_SYS=3Dx86_64-linux
| + /home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-linux/usr/bin/pytho=
n setup.py build
| /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons-native=
-1.3.0-r1/temp/run.do_compile.26596: line 94: /home/sgh/oe-new-oe/build-vmc=
16/tmp/sysroots/x86_64-linux/usr/bin/python: No such file or directory
| + oefatal 'python setup.py build_ext execution failed.'
| + echo FATAL: 'python setup.py build_ext execution failed.'

Adding `python-native` to `DEPENDS_virtclass-native` as suggested in [1] an=
d done for `python-scons-native_1.2.0` fixes the issue.

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/0321=
80.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
S=C3=B8ren, please test this patch. By default 1.2.0 is not used for the na=
tive recipe.
---
 recipes/python/python-scons_1.3.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-scons_1.3.0.bb b/recipes/python/python-s=
cons_1.3.0.bb
index 82231f2..5a412cb 100644
--- a/recipes/python/python-scons_1.3.0.bb
+++ b/recipes/python/python-scons_1.3.0.bb
@@ -2,6 +2,7 @@ DESCRIPTION =3D "A Software Construction Tool"
 SECTION =3D "devel/python"
 PRIORITY =3D "optional"
 LICENSE =3D "MIT"
+DEPENDS_virtclass-native =3D "python-native"
 SRCNAME =3D "scons"
 PR =3D "r1"
=20
--=20
1.7.4.4

--=-GJxM2gq/NQAvJADuVzej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk21kogACgkQPX1aK2wOHViRhACbBW2+cutSk6umYXW1UI7WJn9x
KlIAoIhi6uB6dwJW97tUK9bO5NMMgoT7
=Os/A
-----END PGP SIGNATURE-----

--=-GJxM2gq/NQAvJADuVzej--
