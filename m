Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXvK0-0005G3-38
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 11:31:00 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXvIc-000MBN-1M
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 13:29:34 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@openembedded.org
Date: Fri, 13 Feb 2009 13:29:27 +0300
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200902131329.27698.roman@khimov.ru>
Subject: [PATCH] bison-native-2.3 missing data
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
X-List-Received-Date: Fri, 13 Feb 2009 10:31:00 -0000
X-Groupsio-MsgNum: 7692
Content-Type: multipart/signed; boundary="nextPart2514716.0qjexdUpET";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2514716.0qjexdUpET
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello again.

Third one is bug 5012 (http://bugs.openembedded.net/show_bug.cgi?id=3D5012):

Current bison-native installation script misses several data files.
This might break packages requiring them.

=2D-- a/packages/bison/bison-native_2.3.bb	2009-02-03 12:27:57.808843341 +0=
300
+++ b/packages/bison/bison-native_2.3.bb	2009-02-03 16:22:50.611053189 +0300
@@ -15,6 +15,6 @@ exec ${STAGING_BINDIR}/bison -y "\$@"
 EOF
 	chmod a+rx ${STAGING_BINDIR}/yacc
 	install -d ${STAGING_DATADIR}/bison/m4sugar
=2D	install -m 0755 data/c.m4 data/glr.c data/lalr1.cc data/yacc.c ${STAGIN=
G_DATADIR}/bison/
+	install -m 0755 data/c.m4 data/c++.m4 data/glr.c data/glr.cc data/lalr1.c=
c data/location.cc data/yacc.c ${STAGING_DATADIR}/bison/
 	install -m 0755 data/m4sugar/m4sugar.m4 ${STAGING_DATADIR}/bison/m4sugar/
 }


=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2514716.0qjexdUpET
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmVS4cACgkQXJ70z+XgVcPg1ACfbmF3ZLsBbl8C4zjll9l1Q3FU
B3EAoLublAw0qDTNhEHgwfrCHJc88BYf
=p/6D
-----END PGP SIGNATURE-----

--nextPart2514716.0qjexdUpET--
