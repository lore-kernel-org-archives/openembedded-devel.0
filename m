Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKRb7-00089B-QJ for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:50:17 +0200
Received: from f053044015.adsl.alicedsl.de ([78.53.44.15]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QKRZl-0007FM-L2; Thu, 12 May 2011 08:48:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 10:47:30 +0200
Message-ID: <1305190050.4254.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: libshr-glib: task configure fails with `/bin/sh: gdbus-codegen: command not found`
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
X-List-Received-Date: Thu, 12 May 2011 08:50:17 -0000
X-Groupsio-MsgNum: 31933
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WT9ALqy8K13G3zuA5Lgn"

--=-WT9ALqy8K13G3zuA5Lgn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


as a result of I think commit 82f8341d [1]

	commit 82f8341d6282d6ae29e80eb3cdf312b6deda9b4c
	Author: Martin Jansa <Martin.Jansa@gmail.com>
	Date:   Sun May 8 07:08:16 2011 +0200

		  glib-2.0_git: include gdbus-codegen files in -dev
		 =20
		  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I am seeing the following error message in task configure of
`libshr-glib` using `minimal` for `MACHINE =3D "beagleboard"`.

	[=E2=80=A6]
	for f in /oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnu=
eabi//usr/share/shr-specs/xml/*.xml; do OUT=3D`echo $f | sed 's/.*\///g; s/=
^org\.shr\./shr-/g; s/.xml//g; s/\.//g;' | awk  '{ printf tolower($1)}'`; g=
dbus-codegen  --interface-prefix org.shr --generate-c-code $OUT $f; echo "#=
include <$OUT.h>" >> shr-bindings.h; done
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	/bin/sh: gdbus-codegen: command not found
	touch shr-bindings.h
	[=E2=80=A6]

Is that related?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D82f8341=
d6282d6ae29e80eb3cdf312b6deda9b4c

--=-WT9ALqy8K13G3zuA5Lgn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3LnqIACgkQPX1aK2wOHVjEyQCfTSfITcNCcqVI7P1ZOKL1KOk4
QhIAn1ZtH0n/tbCV5vTrf5cWWJj5P8/W
=4sU6
-----END PGP SIGNATURE-----

--=-WT9ALqy8K13G3zuA5Lgn--
