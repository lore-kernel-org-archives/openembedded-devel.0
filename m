Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1ObsqL-0006uR-Qa
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 12:17:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 857C340007785
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 12:17:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 7D55940055340
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 12:17:21 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5TBpxJIE5YZ
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 12:17:21 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 5019440007785
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 12:17:21 +0200 (CEST)
Message-ID: <4C481AE8.3090702@gmx.net>
Date: Thu, 22 Jul 2010 12:18:16 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100528 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RFC: make all angstrom java related setting overridable from local.conf
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
X-List-Received-Date: Thu, 22 Jul 2010 10:17:35 -0000
X-Groupsio-MsgNum: 21289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig4968B645334CC686FFDBE18D"

--------------enig4968B645334CC686FFDBE18D
Content-Type: multipart/mixed;
 boundary="------------070304060604030408030100"

--------------070304060604030408030100
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
atm angstrom does not allow me to override versions for the Java recipes
in local.conf. With the attached that is being made possible.

Ok, for .dev?

Regards,
Robert

--------------070304060604030408030100
Content-Type: text/x-patch;
 name="oe-angstrom-jalimo.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="oe-angstrom-jalimo.patch"

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include=
/angstrom-jalimo.conf
index 2aed63b..06698c0 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -1,32 +1,32 @@
 # Put a 'require conf/distro/include/angstrom-jalimo.conf' in your local.c=
onf if you want to build from the jalimo overlay
=20
 # initial stuff
-PREFERRED_VERSION_jamvm-initial =3D "1.4.5"
-PREFERRED_VERSION_classpath-initial =3D "0.93"
+PREFERRED_VERSION_jamvm-initial ?=3D "1.4.5"
+PREFERRED_VERSION_classpath-initial ?=3D "0.93"
=20
 # Native VM
-PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
-PREFERRED_VERSION_jamvm-native =3D "1.5.3"
-#PREFERRED_VERSION_cacao-native =3D "0.99.3"
-PREFERRED_VERSION_classpath-native =3D "0.98"
+PREFERRED_PROVIDER_virtual/java-native ?=3D "jamvm-native"
+PREFERRED_VERSION_jamvm-native ?=3D "1.5.3"
+#PREFERRED_VERSION_cacao-native ?=3D "0.99.3"
+PREFERRED_VERSION_classpath-native ?=3D "0.98"
=20
 # Native compiler settings
-PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
-PREFERRED_VERSION_libecj-bootstrap =3D "3.6"
+PREFERRED_PROVIDER_virtual/javac-native ?=3D "ecj-bootstrap-native"
+PREFERRED_VERSION_libecj-bootstrap ?=3D "3.6"
=20
 # Target VM
-PREFERRED_VERSION_cacao =3D "0.99.3"
-PREFERRED_VERSION_cacaoh-native =3D "0.99.3"
+PREFERRED_VERSION_cacao ?=3D "0.99.3"
+PREFERRED_VERSION_cacaoh-native ?=3D "0.99.3"
=20
-PREFERRED_VERSION_jamvm =3D "1.5.2"
-PREFERRED_PROVIDER_swt3.4-gtk =3D "swt3.4-gtk"
-PREFERRED_PROVIDER_classpath =3D "classpath"
+PREFERRED_VERSION_jamvm ?=3D "1.5.2"
+PREFERRED_PROVIDER_swt3.4-gtk ?=3D "swt3.4-gtk"
+PREFERRED_PROVIDER_classpath ?=3D "classpath"
=20
-PREFERRED_VERSION_openjdk-6-jre =3D "6b18-1.8"
-PREFERRED_VERSION_icedtea6-native =3D "1.7.3"
+PREFERRED_VERSION_openjdk-6-jre ?=3D "6b18-1.8"
+PREFERRED_VERSION_icedtea6-native ?=3D "1.7.3"
=20
 # Stage JAR files not into ARCH related dirs
-STAGING_DIR_JAVA =3D "${STAGING_DIR}/java"
+STAGING_DIR_JAVA ?=3D "${STAGING_DIR}/java"
 STAGING_DATADIR_JAVA ?=3D "${STAGING_DIR_JAVA}"
=20
=20

--------------070304060604030408030100--

--------------enig4968B645334CC686FFDBE18D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkxIGusACgkQG9cfwmwwEtqsxwCfVnu0wiXVkQOa6rC8fqXW6k+S
ab8An3aj08QlS8mqpEfUVhcBbexIOG3a
=lP9C
-----END PGP SIGNATURE-----

--------------enig4968B645334CC686FFDBE18D--
