Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1LhnBl-0004fI-Mr
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 16:51:19 +0100
Received: (qmail invoked by alias); 12 Mar 2009 15:51:01 -0000
Received: from p579E1786.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.23.134]
	by mail.gmx.net (mp033) with SMTP; 12 Mar 2009 16:51:01 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18R9oxWSNYRam9nbV9+WiFuankvcRynOG7HemdiCp
	W9OeS388GKiUE9
Message-ID: <49B92F20.3060701@gmx.net>
Date: Thu, 12 Mar 2009 16:49:52 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.78
Subject: RFC: CMAKE - support out of tree builds
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
X-List-Received-Date: Thu, 12 Mar 2009 15:51:27 -0000
X-Groupsio-MsgNum: 8369
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig47DFB988559973DD1210CE50"

--------------enig47DFB988559973DD1210CE50
Content-Type: multipart/mixed;
 boundary="------------070000000409000004030904"

--------------070000000409000004030904
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I am proposing the attached patch to make it possible to do out-of-tree
builds in OE. Out-of-tree builds should be preferred but I do not want
to look at every recipe if it still works.

OTOH I want to include llvm 2.5 with its new cmake-based build system
which incidentally does *not* permit in-tree builds.

Regards
Robert

--------------070000000409000004030904
Content-Type: text/x-patch;
 name="oe-cmake-outoftree.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="oe-cmake-outoftree.patch"

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 8fd25cd..7907f94 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -3,13 +3,25 @@ DEPENDS +=3D " cmake-native "
 # We want the staging and installing functions from autotools
 inherit autotools
=20
+# Use in-tree builds by default but allow this to be changed
+# since some packages do not support them (e.g. llvm 2.5).
 OECMAKE_SOURCEPATH ?=3D "."
=20
+# If declaring this, make sure you also set EXTRA_OEMAKE to
+# "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
+OECMAKE_BUILDPATH ?=3D ""
+
 cmake_do_configure() {
-     cmake ${OECMAKE_SOURCEPATH} \
-     -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} -Wno-dev \
-     -DCMAKE_FIND_ROOT_PATH=3D${STAGING_DIR_HOST} \
-     ${EXTRA_OECMAKE}
+  if [ ${OECMAKE_BUILDPATH} ]
+  then
+    mkdir ${OECMAKE_BUILDPATH}
+    cd ${OECMAKE_BUILDPATH}
+  fi
+
+  cmake ${OECMAKE_SOURCEPATH} \
+    -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} -Wno-dev \
+    -DCMAKE_FIND_ROOT_PATH=3D${STAGING_DIR_HOST} \
+    ${EXTRA_OECMAKE}
 }
=20
 EXPORT_FUNCTIONS do_configure

--------------070000000409000004030904--

--------------enig47DFB988559973DD1210CE50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkm5LyAACgkQG9cfwmwwEtpxEwCdH40OoggQYMMutvYFQZu5/Jzv
yy0AnjJGFIfBlDGyK0pOnvtC7Z923tyR
=e3nU
-----END PGP SIGNATURE-----

--------------enig47DFB988559973DD1210CE50--
