Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZ6wM-0004l9-80 for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 20:44:29 +0200
Received: from f053035167.adsl.alicedsl.de ([78.53.35.167]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZ6wK-0007sj-OH for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 18:44:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Jul 2010 20:44:14 +0200
Message-ID: <1279133054.4939.16.camel@mattotaupa>
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
Subject: angstrom 2008.1, uclibc: libc.so not found, i. e. not in staging directory
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
X-List-Received-Date: Wed, 14 Jul 2010 18:44:29 -0000
X-Groupsio-MsgNum: 20973
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1kxBdc5Ei54mG+BrNoHW"

--=-1kxBdc5Ei54mG+BrNoHW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I am trying to compile vdr with uclibc. I got the following error.

    /oe/angstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-uclibceabi/4.3=
.3/../../../../arm-angstrom-linux-uclibceabi/bin/ld: warning: libc.so, need=
ed by /oe/angstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-uclibceabi/4=
.3.3/../../../../arm-angstrom-linux-uclibceabi/lib/libgcc_s.so, not found (=
try using -rpath or -rpath-link)

Creating a symlink seems to be a workaround.

        $ ls
        ld-uClibc-0.9.30.2.so  libgcc_s.so.1           libresolv.so.0
        ld-uClibc.so.0         libm-0.9.30.2.so        librt-0.9.30.2.so
        libcrypt-0.9.30.2.so   libm.so.0               librt.so.0
        libcrypt.so.0          libnsl-0.9.30.2.so      libthread_db-0.9.30.=
2.so
        libc.so.0              libnsl.so.0             libthread_db.so.1
        libdl-0.9.30.2.so      libpthread-0.9.30.2.so  libuClibc-0.9.30.2.s=
o
        libdl.so.0             libpthread.so.0         libutil-0.9.30.2.so
        libgcc_s.so            libresolv-0.9.30.2.so   libutil.so.0
        $ ln -s libc.so.0 libc.so

Any ideas how to fix this properly?


Thanks,

Paul

--=-1kxBdc5Ei54mG+BrNoHW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw+BX4ACgkQPX1aK2wOHVjoVwCcCkfPGgKysSmL64dGwGWu2x+I
1WkAn1NvpUnpZ9l05ZZb8vylJqqmBAjO
=1dR+
-----END PGP SIGNATURE-----

--=-1kxBdc5Ei54mG+BrNoHW--
