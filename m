Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWSvl-0004ND-Er for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 14:41:17 +0200
Received: from f053042077.adsl.alicedsl.de ([78.53.42.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWStW-0000kR-4l for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 12:38:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1308037783-31218-1-git-send-email-james@digitalmatter.com.au>
References: <1308037783-31218-1-git-send-email-james@digitalmatter.com.au>
Date: Tue, 14 Jun 2011 14:37:53 +0200
Message-ID: <1308055073.4220.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] prelink: Added prelink-20100106, which works on ARM.
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
X-List-Received-Date: Tue, 14 Jun 2011 12:41:17 -0000
X-Groupsio-MsgNum: 32655
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JDWoaImx6xw8I9zwlajM"

--=-JDWoaImx6xw8I9zwlajM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 14.06.2011, 15:49 +0800 schrieb James Limbouris:
> This version of prelink, together with a patch by
> Carsten Munk <carsten@maemo.org>, taken from MeeGo,
> fixes an ARM incompatibility with 20090925.
>=20
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>

What build configuration do you use for testing? Using `angstrom-2010.x`
or `minimal{,-uclibc}` for `MACHINE =3D "beagleboard"` `elfutils_0.143.bb`
does not even compile.

With =C8=A6ngstr=C3=B6m the error is the following.

| strip.c: In function 'process_file':
| strip.c:301:7: error: implicit declaration of function 'stat64'
| strip.c:335:3: error: implicit declaration of function 'fstat64'
| strip.c:356:63: error: 'ACCESSPERMS' undeclared (first use in this functi=
on)
| strip.c:356:63: note: each undeclared identifier is reported only once fo=
r each function it appears in
| strip.c: In function 'handle_elf':
| strip.c:1641:4: error: implicit declaration of function 'fchmod'
| make[2]: *** [strip.o] Error 1


Thanks,

Paul

--=-JDWoaImx6xw8I9zwlajM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk33ViEACgkQPX1aK2wOHViSlgCfTG9tQ9ydkPrviAZn5NxBvrSO
l6IAoIBgAr8NIaRacthu+GsPzqVLpdFD
=3VuD
-----END PGP SIGNATURE-----

--=-JDWoaImx6xw8I9zwlajM--
