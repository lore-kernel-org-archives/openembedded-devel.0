Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1LMjGe-0003l1-6r
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 14:25:16 +0100
Received: (qmail invoked by alias); 13 Jan 2009 13:18:43 -0000
Received: from p579E16DE.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.22.222]
	by mail.gmx.net (mp063) with SMTP; 13 Jan 2009 14:18:43 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19jechfbr5jaVGXSwblOHOfGQuR3jwOWKiSO/QnSi
	qKFMplIM53hjQJ
Message-ID: <496C9495.40003@gmx.net>
Date: Tue, 13 Jan 2009 14:18:13 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.00
Subject: RFC: allow subdir for SRC_URI entries
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
X-List-Received-Date: Tue, 13 Jan 2009 13:25:16 -0000
X-Groupsio-MsgNum: 7194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigC256E80512250087B8B33033"

--------------enigC256E80512250087B8B33033
Content-Type: multipart/mixed;
 boundary="------------020609050505050109030009"

--------------020609050505050109030009
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi folks,
I desperately need this patch. ;)

It allows one to specify ";subdir=3D<DIR>" in SRC_URI entries. Having the=

effect that the respective file is either unpacked or copied into that
very directory which is treated as:

${WORKDIR}/<DIR>

It is not really ${WORKDIR} but the cwd when do_unpack is run. In most
cases this is ${WORKDIR}. If it is something else the recipe writer will
have a reason for that.

With this patch we can finally deal easily with tarbombs.

Regards
Robert

--------------020609050505050109030009
Content-Type: text/x-patch;
 name="oe-subdir.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="oe-subdir.patch"

diff --git a/classes/base.bbclass b/classes/base.bbclass
index b2b6085..fca0edd 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -725,9 +725,20 @@ def oe_unpack_file(file, data, url =3D None):
 		if os.path.samefile(file, dest):
 			return True
=20
+	# Change to subdir before executing command
+	save_cwd =3D os.getcwd();
+	parm =3D bb.decodeurl(url)[5]
+	if 'subdir' in parm:
+		newdir =3D ("%s/%s" % (os.getcwd(), parm['subdir']))
+		bb.mkdirhier(newdir)
+		os.chdir(newdir)
+
 	cmd =3D "PATH=3D\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
 	bb.note("Unpacking %s to %s/" % (file, os.getcwd()))
 	ret =3D os.system(cmd)
+
+	os.chdir(save_cwd)
+
 	return ret =3D=3D 0
=20
 addtask unpack after do_fetch
diff --git a/conf/distro/chinook-compat.conf b/conf/distro/chinook-compat=
=2Econf
index ff6aa1f..3a086d8 100644
--- a/conf/distro/chinook-compat.conf
+++ b/conf/distro/chinook-compat.conf
@@ -172,12 +172,14 @@ PREFERRED_VERSION_hildon-thumbnail =3D "0.14"
 PREFERRED_VERSION_osso-gwconnect =3D "1.0.12"
 PREFERRED_VERSION_osso-gnome-vfs2 =3D "2.16.3"
=20
+PREFERRED_VERSION_shared-mime-info =3D "0.22"
+
 # Java stuff=20
 PREFERRED_PROVIDER_midpath =3D "midpath-maemo"
 PREFERRED_PROVIDER_midpath-backend-gtk =3D "midpath-backend-gtk-hildon"
=20
 # Need jamvm-initial since cacao 0.98 seems to get miscompiled with newe=
r GCCs.
-PREFERRED_PROVIDER_virtual/java-initial =3D "jamvm-initial"
+#PREFERRED_PROVIDER_virtual/java-initial =3D "jamvm-initial"
=20
 PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
=20
diff --git a/packages/dpkg/dpkg.inc b/packages/dpkg/dpkg.inc
index eb5778f..c677fe0 100644
--- a/packages/dpkg/dpkg.inc
+++ b/packages/dpkg/dpkg.inc
@@ -2,7 +2,8 @@ DESCRIPTION =3D "Package maintenance system for Debian."
 LICENSE =3D "GPL"
 SECTION =3D "base"
=20
-SRC_URI =3D "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.gz \
+#SRC_URI =3D "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.gz \
+SRC_URI =3D "http://mirrors.ludost.net/gentoo/distfiles/dpkg_${PV}.tar.g=
z \
            file://ignore_extra_fields.patch;patch=3D1 \
            file://noupdalt.patch;patch=3D1"
=20
diff --git a/packages/update-alternatives/update-alternatives-dpkg-native=
_1.13.22.bb b/packages/update-alternatives/update-alternatives-dpkg-nativ=
e_1.13.22.bb
index 70b5cb7..6e09c0d 100644
--- a/packages/update-alternatives/update-alternatives-dpkg-native_1.13.2=
2.bb
+++ b/packages/update-alternatives/update-alternatives-dpkg-native_1.13.2=
2.bb
@@ -1,8 +1,13 @@
 require update-alternatives-dpkg.inc
 inherit native
=20
+SRC_URI =3D "\
+    http://www.scratchbox.org/download/files/sbox-files/dpkg_${PV}.tar.g=
z \
+    file://paths.patch;patch=3D1 \
+    "
+
 PROVIDES +=3D "virtual/update-alternatives-native"
-DEPENDS =3D "perl-native dpkg-native"
+DEPENDS =3D "perl-native"
 DEFAULT_PREFERENCE =3D "-1"
=20
 do_stage () {
diff --git a/packages/update-alternatives/update-alternatives-dpkg_1.13.2=
2.bb b/packages/update-alternatives/update-alternatives-dpkg_1.13.22.bb
index a07d5e3..826b088 100644
--- a/packages/update-alternatives/update-alternatives-dpkg_1.13.22.bb
+++ b/packages/update-alternatives/update-alternatives-dpkg_1.13.22.bb
@@ -1,5 +1,10 @@
 require update-alternatives-dpkg.inc
=20
+SRC_URI =3D "\
+	http://www.scratchbox.org/download/files/sbox-files/dpkg_${PV}.tar.gz \=

+	file://paths.patch;patch=3D1 \
+	"
+
 RPROVIDES_${PN} =3D "update-alternatives"
 RDEPENDS_${PN} =3D "perl dpkg"
=20

--------------020609050505050109030009--

--------------enigC256E80512250087B8B33033
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAklslJYACgkQG9cfwmwwEtoRFgCbBDhQw4CgAsVeHNb601G6EeG6
lS8An2/pbRRCbFOGK6PrLxMqW0ZQAe3K
=JMCa
-----END PGP SIGNATURE-----

--------------enigC256E80512250087B8B33033--
