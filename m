Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDMQ0-0006t8-R3 for openembedded-devel@lists.openembedded.org;
	Fri, 22 Apr 2011 21:53:32 +0200
Received: from f053043081.adsl.alicedsl.de ([78.53.43.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDMOI-0006j0-FR; Fri, 22 Apr 2011 19:51:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104201007.04378.sgh@sgh.dk>
References: <201104201007.04378.sgh@sgh.dk>
Date: Fri, 22 Apr 2011 21:51:07 +0200
Message-ID: <1303501867.4155.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: =?ISO-8859-1?Q?S=F8ren?= Holm <soeren.holm@mikrofyn.com>
Subject: [PATCH] wvstreams: add patch to add missing header includes
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
X-List-Received-Date: Fri, 22 Apr 2011 19:53:32 -0000
X-Groupsio-MsgNum: 31403
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-V/OEHfZcVADAMbb4gn/j"

--=-V/OEHfZcVADAMbb4gn/j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: S=C3=B8ren Holm <soeren.holm@mikrofyn.com>
Date: Wed, 20 Apr 2011 09:48:43 +0200

Building fails with the following error.

| ./CXX -c ipstreams/wvunixdgsocket
| In file included from ./include/wvunixdgsocket.h:13:0,
|                  from ipstreams/wvunixdgsocket.cc:1:
| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const':
| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wil=
l break strict-aliasing rules
| ipstreams/wvunixdgsocket.cc: In constructor 'WvUnixDGSocket::WvUnixDGSock=
et(const WvFastString&, bool, int)':
| ipstreams/wvunixdgsocket.cc:50:32: error: 'chmod' was not declared in thi=
s scope
| make: *** [ipstreams/wvunixdgsocket.o] Error 1

This patch is build tested using `angstrom-2010.x` and `minimal` for `MACHI=
NE =3D "beagleboard"`. The build still fails when uClibc is used.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: S=C3=B8ren Holm <soeren.holm@mikrofyn.com>
CC: Khem Raj <raj.khem@gmail.com>
---
1. S=C3=B8ren, please add your Signed-off-by line in front of mine. This is=
 a demanded by the commit policy [1].
2. I am adding Khem, since he seems to be the original author of this patch=
. It would be great to get his Acked-by too.
3. S=C3=B8ren, please send your patch upstream.
4. S=C3=B8ren, when you have a little time it would be great if you could u=
pdate WvStreams to 4.6.1 and test it.
5. S=C3=B8ren, I removed `apply=3Dyes` since that is the default.

[1] http://openembedded.org/index.php/Commit_Policy
---
 .../files/0001-Fixed-missing-header-includes.patch |   37 ++++++++++++++++=
++++
 recipes/wvstreams/wvstreams_4.6.bb                 |    1 +
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 recipes/wvstreams/files/0001-Fixed-missing-header-inclu=
des.patch

diff --git a/recipes/wvstreams/files/0001-Fixed-missing-header-includes.pat=
ch b/recipes/wvstreams/files/0001-Fixed-missing-header-includes.patch
new file mode 100644
index 0000000..f6d99f0
--- /dev/null
+++ b/recipes/wvstreams/files/0001-Fixed-missing-header-includes.patch
@@ -0,0 +1,37 @@
+From d76ec92a9e09fefa3083250f4aa588d0e94fe20c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?S=3DC3=3DB8ren=3D20Holm?=3D <sh@mikrofyn.com>
+Date: Wed, 20 Apr 2011 09:41:22 +0200
+Subject: [PATCH] Fixed missing header includes.
+
+---
+ ipstreams/wvunixdgsocket.cc |    2 +-
+ streams/wvatomicfile.cc     |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ipstreams/wvunixdgsocket.cc b/ipstreams/wvunixdgsocket.cc
+index 41d2911..6dc12fc 100644
+--- a/ipstreams/wvunixdgsocket.cc
++++ b/ipstreams/wvunixdgsocket.cc
+@@ -1,5 +1,5 @@
+ #include "wvunixdgsocket.h"
+-#ifdef MACOS
++#if defined(MACOS) || defined(__GNUC__)
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #endif
+diff --git a/streams/wvatomicfile.cc b/streams/wvatomicfile.cc
+index 65ae202..0a58069 100644
+--- a/streams/wvatomicfile.cc
++++ b/streams/wvatomicfile.cc
+@@ -11,7 +11,7 @@
+ #include "wvfileutils.h"
+ #include "wvstrutils.h"
+=20
+-#ifdef MACOS
++#if defined(MACOS) || defined(__GNUC__)
+ #include <sys/stat.h>
+ #endif
+=20
+--=20
+1.7.4.1
+
diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstrea=
ms_4.6.bb
index 1c11268..0eb0198 100644
--- a/recipes/wvstreams/wvstreams_4.6.bb
+++ b/recipes/wvstreams/wvstreams_4.6.bb
@@ -6,6 +6,7 @@ DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
 PR =3D "r1"
=20
 SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
+	file://0001-Fixed-missing-header-includes.patch \
 	"
=20
 inherit autotools pkgconfig
--=20
1.7.4.4

--=-V/OEHfZcVADAMbb4gn/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2x3CYACgkQPX1aK2wOHVjVMQCeIXQ9S1c2Qg5F8la3WgFu/Das
E9kAniE52Vylyu+lKnuSe4cpuNbis/hW
=jWqP
-----END PGP SIGNATURE-----

--=-V/OEHfZcVADAMbb4gn/j--
