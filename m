Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pbwhu-0007Av-C3 for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 15:57:22 +0100
Received: from f053039058.adsl.alicedsl.de ([78.53.39.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PbwhU-0000cU-0c for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 14:56:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 09 Jan 2011 15:56:54 +0100
Message-ID: <1294585014.4036.47.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: libcap_1.10: ERROR: QA Issue with libcap: non -dev package contains symlink .so
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
X-List-Received-Date: Sun, 09 Jan 2011 14:57:23 -0000
X-Groupsio-MsgNum: 27839
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-O+DU/WcNJgdaWziQzRFZ"

--=-O+DU/WcNJgdaWziQzRFZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


doing `bitbake -k libcap` with latest master (3d030f) with
`minimal-uclibc` for `MACHINE =3D "beagleboard"`

        NOTE: package libcap-1.10-r2: task do_qa_staging: Succeeded
        ERROR: QA Issue with libcap: non -dev package contains symlink .so:=
 libcap path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages-spli=
t/libcap/usr/lib/libcap.so'
        ERROR: QA Issue with libcap: non -dev package contains symlink .so:=
 libcap path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages-spli=
t/libcap/usr/lib/libcap.so'
        NOTE: package libcap-1.10-r2: task do_package: Succeeded

Is that error reasonable or are library packages not allowed to have
symlinks [1]?

        FILES_${PN} =3D "${libdir}"
        FILES_${PN}-dev =3D "${includedir}"


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/libcap/=
libcap_1.10.bb?id=3D3d030ffa57af27275fbb42eaa0fcd611f4925348

--=-O+DU/WcNJgdaWziQzRFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0pzLYACgkQPX1aK2wOHVgCWACfe8BILw8EXOO7ktrD2375X32A
Q3gAnjnkpJ9kKeSkTUEt/VI7Ezul+3Gx
=AKo8
-----END PGP SIGNATURE-----

--=-O+DU/WcNJgdaWziQzRFZ--
