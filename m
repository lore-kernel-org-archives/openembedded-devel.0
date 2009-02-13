Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXvIV-0005Bl-Di
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 11:29:27 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXvH7-000KcA-Hf
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 13:28:01 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@openembedded.org
Date: Fri, 13 Feb 2009 13:28:00 +0300
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200902131328.01161.roman@khimov.ru>
Subject: [PATCH] glibc-initial 2.7 missing
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
X-List-Received-Date: Fri, 13 Feb 2009 10:29:27 -0000
X-Groupsio-MsgNum: 7691
Content-Type: multipart/signed; boundary="nextPart14879273.1zKLVlAEhv";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart14879273.1zKLVlAEhv
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello again.

Second one is bug 5007 (http://bugs.openembedded.net/show_bug.cgi?id=3D5007=
):

I think it's good to have same glibc versions used for glibc-initial and=20
glibc
itself, which works with most of the versions provided by OE, but the latest
available, 2.7.

So, here is a trivial patch to add glibc-initial-2.7.

=2D-- a/packages/glibc/glibc-initial.inc	2008-12-26 23:41:39.767581663 +0300
+++ b/packages/glibc/glibc-initial.inc	2009-02-02 18:12:13.524061983 +0300
@@ -1,7 +1,7 @@
 SECTION =3D "libs"
 DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
 PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
=2DFILESPATH=20
=3D "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/=
glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ],=20
d)}"
+FILESPATH=20
=3D "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/=
glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIR=
NAME}' ],=20
d)}"
=20
 PACKAGES =3D ""
 PACKAGES_DYNAMIC =3D ""
=2D-- /dev/null	2009-02-02 21:32:34.874002007 +0300
+++ b/packages/glibc/glibc-initial_2.7.bb	2009-02-02 17:31:29.413062961=20
+0300
@@ -0,0 +1,6 @@
+require glibc_${PV}.bb
+require glibc-initial.inc
+
+do_configure_prepend () {
+	unset CFLAGS
+}


=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart14879273.1zKLVlAEhv
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmVSzEACgkQXJ70z+XgVcNAngCfXnaB4dXhZ9fHn/YYStgWmUHK
IpMAoNMYv0yHReyvG4Ty6TJ/SGOldbi8
=U1C6
-----END PGP SIGNATURE-----

--nextPart14879273.1zKLVlAEhv--
