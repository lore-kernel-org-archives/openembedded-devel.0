Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZSer-0005t2-Ga for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 19:55:41 +0200
Received: from f053040153.adsl.alicedsl.de ([78.53.40.153]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZSep-000767-36 for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 17:55:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 19:55:36 +0200
Message-ID: <1279216536.3741.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: angstrom-2008.1, uclibc: git-native: sysroot-destdir 6, 4 GB big, since some executables are 100 MB each
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
X-List-Received-Date: Thu, 15 Jul 2010 17:55:42 -0000
X-Groupsio-MsgNum: 21011
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JbOW0x2kqySxWgMsqgC5"

--=-JbOW0x2kqySxWgMsqgC5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I ran out of space and noticed

    /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4

is 8,1G big.

Some of the executable files in

    /angstrom-dev/work/i686-linux/git-native-1.7.0.2-r4/sysroot-destdir/ang=
strom-dev/sysroots/i686-linux/usr/libexec/git-core/

are 101 MB big.

This regression must have been introduced between this morning 6 a.m.
UTC and now.

I could not reproduce this using the distributions minimal-uclibc or
angstrom-2008.1 with glibc.

If you need more information I could try to downgrade the uclibc
revision.


Thanks,

Paul=20

--=-JbOW0x2kqySxWgMsqgC5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw/S5gACgkQPX1aK2wOHVijzgCfQupd2j0TsyI5YuYrqy3PVUvu
xqwAoIBF2HDVQ8Kc7kX/GVyJLeNnc+MA
=oflE
-----END PGP SIGNATURE-----

--=-JbOW0x2kqySxWgMsqgC5--
