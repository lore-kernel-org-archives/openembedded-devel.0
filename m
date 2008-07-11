Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KHQ3J-0005GM-BK
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2008 23:21:19 +0200
Received: (qmail invoked by alias); 11 Jul 2008 21:20:55 -0000
Received: from e178115197.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.115.197]
	by mail.gmx.net (mp053) with SMTP; 11 Jul 2008 23:20:55 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/inoRIQrPiTt4P5e2RzRwFonPJLlyJYsKt2S9LCR
	pnnT4eQ88oq74I
Message-ID: <4877CEC3.4080407@gmx.net>
Date: Fri, 11 Jul 2008 23:21:07 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.00
Subject: RFC: space between -isystem and parameter
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 11 Jul 2008 21:21:19 -0000
X-Groupsio-MsgNum: 5490
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig2D115BD6FC4575247989198E"

--------------enig2D115BD6FC4575247989198E
Content-Type: multipart/mixed;
 boundary="------------010207070601000601090109"

--------------010207070601000601090109
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
the gcc man page says that there should be a space between the -isystem
option and the parameter. Is there a specific reason why we are not
doing this in OpenEmbedded?

If it is not causing any problems I would like to change this (see
patch, is there more to change?) since I people pointed this out when I
posted a OE-made make output to the libtool mailing list.

Regards
Robert

--------------010207070601000601090109
Content-Type: text/x-patch;
 name="isystem_space.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="isystem_space.diff"

#
# old_revision [c3c2fc52f60e174bdf9d1f52c795dc0bdcfb0958]
#
# patch "conf/bitbake.conf"
#  from [d8122151bbc194ee830cb666879ae90585f1b985]
#    to [e113fc3577094afd81f647bfe6068c6dc26b38c9]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- conf/bitbake.conf	d8122151bbc194ee830cb666879ae90585f1b985
+++ conf/bitbake.conf	e113fc3577094afd81f647bfe6068c6dc26b38c9
@@ -355,9 +355,9 @@ PATCHRESOLVE =3D 'noop'
 # Build flags and options.
 ##################################################################
=20
-export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
+export BUILD_CPPFLAGS =3D "-isystem ${STAGING_INCDIR_NATIVE}"
 export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
-export TARGET_CPPFLAGS =3D "-isystem${STAGING_DIR_TARGET}${layout_includ=
edir}"
+export TARGET_CPPFLAGS =3D "-isystem ${STAGING_DIR_TARGET}${layout_inclu=
dedir}"
=20
 export BUILD_CFLAGS =3D "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 export CFLAGS =3D "${TARGET_CFLAGS}"

--------------010207070601000601090109--

--------------enig2D115BD6FC4575247989198E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFId87DG9cfwmwwEtoRCI5rAJ9TolzaUdgTNBIpVADiBvO1Yp5bHACeMiRA
bYwblmcH23rUUm8EiivYmlI=
=N9V8
-----END PGP SIGNATURE-----

--------------enig2D115BD6FC4575247989198E--
