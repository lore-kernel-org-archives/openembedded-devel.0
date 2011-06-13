Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWGZI-000419-9C for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 01:29:16 +0200
Received: from f053040080.adsl.alicedsl.de ([78.53.40.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWGX2-00042Q-M1 for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 23:26:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:25:52 +0200
Message-ID: <1308007552.1831.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [RFC][PATCH] libyajl_git: Add Git dbcba50b7 version (initial recipe)
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
X-List-Received-Date: Mon, 13 Jun 2011 23:29:16 -0000
X-Groupsio-MsgNum: 32646
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NAcB45Ou8jJx+j8JxVHd"

--=-NAcB45Ou8jJx+j8JxVHd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 13 Jun 2011 19:24:12 +0200

XBMC Git requires on YAJL now [1].

[1] https://github.com/xbmc/xbmc/commit/3565ad579e9b80f4be57db901d3fe44d9bf=
ac87d

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I still have to problems.

1. Is the correct recipe name yajl =E2=80=93 as the project calls itself =
=E2=80=93 or libyajl since it is a library?
2. During the first BitBake run, task package_stage fails with the followin=
g error (please note that here the used recipe name was `yajl`).

	ERROR: Error executing a python function in /oe/openembedded/recipes/yajl/=
yajl_git.bb:
	ShellSyntaxError: Unexpected EOF

	ERROR: The stack trace of python calls that resulted in this exception/fai=
lure was:
	ERROR:   File "do_package_stage", line 87, in <module>
	ERROR:=20
	ERROR:   File "do_package_stage", line 81, in do_package_stage
	ERROR:=20
	ERROR:   File "/oe/bitbake/lib/bb/build.py", line 171, in exec_func
	ERROR:     exec_func_shell(func, d, runfile, cwd=3Dadir)
	ERROR:=20
	ERROR:   File "/oe/bitbake/lib/bb/build.py", line 224, in exec_func_shell
	ERROR:     data.emit_func(function, script, d)
	ERROR:=20
	ERROR:   File "/oe/bitbake/lib/bb/data.py", line 260, in emit_func
	ERROR:     newdeps =3D bb.codeparser.ShellParser().parse_shell(d.getVar(fu=
nc, True))
	ERROR:=20
	ERROR:   File "/oe/bitbake/lib/bb/codeparser.py", line 247, in parse_shell
	ERROR:     raise sherrors.ShellSyntaxError("Unexpected EOF")
	ERROR:=20
	ERROR: The code that was being executed was:
	ERROR:      0083:    bb.build.exec_func("staging_package_installer", d)
	ERROR:      0084:    bb.utils.unlockfile(lf)
	ERROR:      0085:
	ERROR:      0086:
	ERROR:  *** 0087:do_package_stage(d)
	ERROR:      0088:
	ERROR: (file: 'do_package_stage', lineno: 87, function: <module>)
	ERROR:      0077:    oe_run(d, "cp -PpR %s.do_* %s/" % (stampfn, destdir))
	ERROR:      0078:
	ERROR:      0079:    pstage_set_pkgmanager(d)
	ERROR:      0080:    bb.build.exec_func("staging_helper", d)
	ERROR:  *** 0081:    bb.build.exec_func("staging_packager", d)
	ERROR:      0082:    lf =3D bb.utils.lockfile(bb.data.expand("/oe/build-an=
gstrom-next/angstrom-dev/sysroots/staging.lock", d))
	ERROR:      0083:    bb.build.exec_func("staging_package_installer", d)
	ERROR:      0084:    bb.utils.unlockfile(lf)
	ERROR:      0085:
	ERROR: (file: 'do_package_stage', lineno: 81, function: do_package_stage)
	ERROR: Function 'do_package_stage' failed
	+ cd /oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnuea=
bi/yajl-git-r0/git
	+ staging_helper
	+ conffile=3D/oe/build-angstrom-next/angstrom-dev/pstage/opkg.conf
	+ mkdir -p /oe/build-angstrom-next/angstrom-dev/pstage/pstaging_lists
	+ arch=3Darmv7a-linux-gnueabi
	+ '[' '!' -e /oe/build-angstrom-next/angstrom-dev/pstage/opkg.conf ']'
	++ grep -c ' armv7a-linux-gnueabi ' /oe/build-angstrom-next/angstrom-dev/p=
stage/opkg.conf
	+ '[' 1 -eq 0 ']'
	+ '[' '!' -e /oe/build-angstrom-next/angstrom-dev/usr/lib/opkg/info/ ']'
	+ '[' '!' -e /oe/build-angstrom-next/angstrom-dev/usr/lib/ipkg/ ']'

Running `bitbake yajl` afterward works fine then.
---
 recipes/libyajl/libyajl_git.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libyajl/libyajl_git.bb

diff --git a/recipes/libyajl/libyajl_git.bb b/recipes/libyajl/libyajl_git.b=
b
new file mode 100644
index 0000000..eb3d821
--- /dev/null
+++ b/recipes/libyajl/libyajl_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION =3D "Yet Another JSON Library. YAJL is a small event-driven (S=
AX-style) JSON parser written in ANSI C, and a small validating JSON genera=
tor."
+AUTHOR =3D "Lloyd Hilaiel"
+HOMEPAGE =3D "http://lloyd.github.com/yajl/"
+SECTION =3D "libs
+PRIORITY =3D "optional"
+LICENSE =3D "ISC"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D74f541bd9a2b6c8e5d0714bcdc327f3=
2"
+
+DEPENDS =3D "ruby"
+
+inherit gitpkgv
+PKGV =3D "v${GITPKGVTAG}"
+
+# This gets reset to the proper version with PKGV above
+PV =3D "git"
+PR =3D "r0"
+
+inherit cmake pkgconfig
+
+SRCREV =3D "dbcba50b7785170d89bfeddaf2b41fe3f3ffacf4"
+
+SRC_URI =3D "git://github.com/lloyd/yajl;protocol=3Dgit \
+          "
+
+S =3D "${WORKDIR}/git"
--=20
1.7.5.4

--=-NAcB45Ou8jJx+j8JxVHd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk32nHQACgkQPX1aK2wOHViglgCeMvK44K6sOLVVN79fo0aTHhim
k1kAnjcUEEhQMLCcRqwwG2iOjIogav5j
=nV3i
-----END PGP SIGNATURE-----

--=-NAcB45Ou8jJx+j8JxVHd--
