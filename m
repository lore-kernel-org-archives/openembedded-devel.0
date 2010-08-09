Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiRai-00030b-1V for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 14:36:32 +0200
Received: from f053041140.adsl.alicedsl.de ([78.53.41.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiRaa-0004x7-OO for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 12:36:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C5FEF0B.2070600@dcombus.com>
References: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>
	<1281353772-30862-1-git-send-email-henri.bragge@dcombus.com>
	<1281354725.3767.25.camel@mattotaupa>  <4C5FEF0B.2070600@dcombus.com>
Date: Mon, 09 Aug 2010 14:36:22 +0200
Message-ID: <1281357382.3767.28.camel@mattotaupa>
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
Subject: Re: [PATCH 1/1] gsnmp-0.3.0: fix quoting in autoconf macros
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
X-List-Received-Date: Mon, 09 Aug 2010 12:36:33 -0000
X-Groupsio-MsgNum: 21997
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-P2Q+yYWxiSR9d+Ex08NT"

--=-P2Q+yYWxiSR9d+Ex08NT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 09.08.2010, 15:05 +0300 schrieb Henri Bragge:
> Paul Menzel wrote:
> > Is there an upstream bug for this? If not, it would be great if you
> > could sent it upstream.
>=20
> The bug is still present in upstream too, but I will send this patch to=
=20
> the gsnmp maintainer if it does the trick (or should it be the other way=
=20
> around?).

I have no idea [1]. But I guess it would not hurt if you send it
upstream anyway.

[1] http://wiki.openembedded.net/index.php/Push_patches_upstream

> > Am Montag, den 09.08.2010, 14:36 +0300 schrieb Henri Bragge:

[=E2=80=A6]

> >> +diff -Nurd gsnmp-0.3.0.orig/gsnmp.m4 gsnmp-0.3.0/gsnmp.m4
> >> +--- gsnmp-0.3.0.orig/gsnmp.m4	2010-02-19 10:35:29.000000000 +0200
> >> ++++ gsnmp-0.3.0/gsnmp.m4	2010-08-09 13:30:46.000000000 +0300
> >> +@@ -1,7 +1,7 @@
> >> + dnl AM_PATH_GSNMP()
> >> + dnl=20
> >> +=20
> >> +-AC_DEFUN(AM_PATH_GSNMP,
> >> ++AC_DEFUN([AM_PATH_GSNMP],
> >> + [
> >> +   PKG_CHECK_MODULES(GSNMP, glib-2.0 >=3D 2.0.1)
> >> + ])
> >
> > Why is this check needed? Maybe add a note to the commit message or
> > split the patch.
>=20
> About that I've no idea, notice that I just added the brackets there.

Sorry, the double patch got me confused.

> >> diff --git a/recipes/gsnmp/gsnmp_0.3.0.bb b/recipes/gsnmp/gsnmp_0.3.0.=
bb
> >> index b191762..6287010 100644
> >> --- a/recipes/gsnmp/gsnmp_0.3.0.bb
> >> +++ b/recipes/gsnmp/gsnmp_0.3.0.bb
> >> @@ -4,7 +4,8 @@ LICENSE =3D "GPLv2"
> >>  DEPENDS =3D "glib-2.0 gnet"
> >>  PR =3D "r0"
> >>    =20
> >
> > I guess you need to increase `PR`.
> >
> > [=E2=80=A6]
>=20
> Will do.


Thanks,

Paul

--=-P2Q+yYWxiSR9d+Ex08NT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxf9kUACgkQPX1aK2wOHVi5dQCfQNHoex626sNrm4yOYESrr8W+
vAAAn2FuzVKizsThpy5/1lJ5ZOmL1kZ7
=dRHa
-----END PGP SIGNATURE-----

--=-P2Q+yYWxiSR9d+Ex08NT--
