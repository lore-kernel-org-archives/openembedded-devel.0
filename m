Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRlDp-0006yM-Vs for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 15:12:30 +0200
Received: from f053043077.adsl.alicedsl.de ([78.53.43.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRlBL-0001qC-T3; Wed, 01 Jun 2011 13:09:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 01 Jun 2011 15:09:19 +0200
Message-ID: <1306933759.5710.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: gammu: task compile fails with `/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib/libcurl.so: could not read symbols: File in wrong format`
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
X-List-Received-Date: Wed, 01 Jun 2011 13:12:30 -0000
X-Groupsio-MsgNum: 32447
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gSyAo0XiQe5YtlUHHZPY"

--=-gSyAo0XiQe5YtlUHHZPY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Stanislav,


task compile of `gammu` fails with the following error message using
`angstrom-2010.x` or `minimal-uclibc` for `MACHINE =3D "beagleboard"`.

        [=E2=80=A6]
        [ 99%] Building C object python/gammu/CMakeFiles/python_gammu.dir/s=
rc/convertors/todo.o
        [ 99%] [ 99%] Building C object gammu/CMakeFiles/gammu.dir/gammu.o
        Building C object python/gammu/CMakeFiles/python_gammu.dir/src/conv=
ertors/wap.o
        [ 99%] Building C object gammu/CMakeFiles/gammu.dir/backup.o
        Linking C shared module _gammu.so
        make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/gammu-1.29.0-r0/gammu-1.29.0/build-configu=
re'
        [ 99%] Built target python_gammu
        [100%] Building C object gammu/CMakeFiles/gammu.dir/backupsms.o
        Linking C executable gammu
        /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib/li=
bcurl.so: could not read symbols: File in wrong format
        collect2: ld returned 1 exit status
        make[3]: *** [gammu/gammu] Error 1
        make[3]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/gammu-1.29.0-r0/gammu-1.29.0/build-configu=
re'
        make[2]: *** [gammu/CMakeFiles/gammu.dir/all] Error 2
        make[2]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/gammu-1.29.0-r0/gammu-1.29.0/build-configu=
re'
        make[1]: *** [all] Error 2
        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/gammu-1.29.0-r0/gammu-1.29.0/build-configu=
re'
        make: *** [all] Error 2

It would be great if you could fix that.


Thanks,

Paul

--=-gSyAo0XiQe5YtlUHHZPY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3mOfkACgkQPX1aK2wOHVh6jwCfaSnfMyVe49T7mlPcOgTFAsfD
NgwAnj+2jzwr/sAvXJNUZ70eqYeiBDME
=Nvm1
-----END PGP SIGNATURE-----

--=-gSyAo0XiQe5YtlUHHZPY--
