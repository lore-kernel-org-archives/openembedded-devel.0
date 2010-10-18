Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7z25-00053g-0z for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 01:22:21 +0200
Received: from f053035105.adsl.alicedsl.de ([78.53.35.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7z1Z-0008JC-K3 for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 23:21:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 01:21:48 +0200
Message-ID: <1287444108.3927.82.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: openldap_2.4.23: `do_configure` fails with `cp: cannot stat `/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No such file or directory`
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
X-List-Received-Date: Mon, 18 Oct 2010 23:22:21 -0000
X-Groupsio-MsgNum: 25090
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-z5yC/3OZRrmWg9vS/xIy"

--=-z5yC/3OZRrmWg9vS/xIy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


trying to build OpenLDAP to test 980a1e [1], task `do_configure` of
`opldap_2.4.23.bb` [2] fails with the following error with `minimal`
(eglibc) and `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.

        [=E2=80=A6]
        Log data follows:
        | cp: cannot stat `/oe/build-minimal-eglibc/minimal-dev/sysroots/ar=
mv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No such file or directo=
ry
        | ERROR: Function do_configure failed
        NOTE: package openldap-2.4.23-r2: task do_configure: Failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/openldap/openldap_2.4.23.b=
b do_configure failed
        ERROR: Task 11 (/oe/openembedded/recipes/openldap/openldap_2.4.23.b=
b, do_configure) failed with 256


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D980a1ea=
8d5bbe2c0c6e4b8f79883b0f294de979b
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/openlda=
p/openldap_2.4.23.bb?id=3D980a1ea8d5bbe2c0c6e4b8f79883b0f294de979b

--=-z5yC/3OZRrmWg9vS/xIy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky81owACgkQPX1aK2wOHVjAmwCfTZsAh7cskm1l/M9FogZpVp8q
3AkAn0T0plkp48Z0HJAdF34nFp66Pcvg
=QMgj
-----END PGP SIGNATURE-----

--=-z5yC/3OZRrmWg9vS/xIy--
