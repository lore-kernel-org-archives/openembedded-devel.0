Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXvGx-0005AL-O3
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 11:27:51 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXvFZ-000JY7-Uk
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 13:26:26 +0300
From: Roman I Khimov <roman@khimov.ru>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 13 Feb 2009 13:26:15 +0300
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200902131326.19376.roman@khimov.ru>
Subject: [PATCH] glibc 2.7 fails to build
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
X-List-Received-Date: Fri, 13 Feb 2009 10:27:51 -0000
X-Groupsio-MsgNum: 7690
Content-Type: multipart/signed; boundary="nextPart1715390.gdq0SJs9M0";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1715390.gdq0SJs9M0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello.

As I've mentioned some days ago, I'd submitted several bugs via bugzilla and
as there is zero reaction on it and in general direction to completely stop
using it, I'm reposting that patches here.

This one is bug 5000 (http://bugs.openembedded.net/show_bug.cgi?id=3D5000):

glibc 2.7 fails to build with
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
In file included from ../include/limits.h:125,
                 from ../nptl/sysdeps/pthread/allocalim.h:21,
                 from ../include/alloca.h:20,
                 from ../stdlib/stdlib.h:497,
                 from ../include/stdlib.h:8,
                 from ../nptl/sysdeps/i386/i686/../tls.h:28,
                 from ../nptl/sysdeps/i386/i686/tls.h:34,
                 from ../include/tls.h:6,
                 from ../sysdeps/unix/sysv/linux/i386/sysdep.h:30,
                 from <stdin>:1:
/home/rik/work/altell/distro/oe/tmp/staging/i686-linux/usr/include/limits.h=
:125:26:
error: no include path in which to search for limits.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Configuration tried was for x86-32-nocona.

=46ixed easily by applying same glibc-use-isystem-include-fixed.patch as us=
ed
with 2.6.1, like in patch attached

diff --git a/packages/glibc/glibc_2.7.bb b/packages/glibc/glibc_2.7.bb
index 3349ce5..2bd4fa4 100644
=2D-- a/packages/glibc/glibc_2.7.bb
+++ b/packages/glibc/glibc_2.7.bb
@@ -65,7 +65,8 @@ SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.=
tar.bz2 \
 	   file://generic-bits_typesizes.h \
 	   file://generic-bits_time.h \
            file://etc/ld.so.conf \
=2D           file://generate-supported.mk"
+           file://generate-supported.mk \
+           file://glibc-use-isystem-include-fixed.patch;patch=3D1"
=20
=20
 # Build fails on sh3 and sh4 without additional patches

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1715390.gdq0SJs9M0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmVSsgACgkQXJ70z+XgVcNj4gCdEKBjK8kdfiSLTS4v2TdQv04M
UF8AnigMOU1jnh+X3iZRFn7ZEcW8znth
=VcSB
-----END PGP SIGNATURE-----

--nextPart1715390.gdq0SJs9M0--
