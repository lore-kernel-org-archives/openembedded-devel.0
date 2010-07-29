Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OeNT7-00041a-7j for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 09:23:55 +0200
Received: from f053034107.adsl.alicedsl.de ([78.53.34.107]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OeNSq-0001yD-4I for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 07:23:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTintoXJZHPGxj1-sxHP31-VzOK3Washy+hZqbmgd@mail.gmail.com>
References: <AANLkTintoXJZHPGxj1-sxHP31-VzOK3Washy+hZqbmgd@mail.gmail.com>
Date: Thu, 29 Jul 2010 09:23:33 +0200
Message-ID: <1280388213.3873.3.camel@mattotaupa>
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
Subject: Re: [PATCH] Fix the compile failure of recode
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
X-List-Received-Date: Thu, 29 Jul 2010 07:23:55 -0000
X-Groupsio-MsgNum: 21577
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zOmWl3dTA2zugJEfj7t+"

--=-zOmWl3dTA2zugJEfj7t+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 28.07.2010, 17:40 +0100 schrieb Alex Bennee:
> The recode build fails because of CC/CXX environment variables being bang=
ed by:
>=20
> TARGET_CC_ARCH_append =3D "${LDFLAGS}"
>=20
> Adding a space fixes it:
>=20
> >From d792e217288ac56b1cc1f798c0ea67f749037f2a Mon Sep 17 00:00:00 2001
> From: Alex Bennee <ajb@cbnl.com> Date: Wed, 28 Jul 2010 17:38:39 +0100
> Subject: [PATCH] Add space to appended CC/CXX otherwise configure
> fails ---  recipes/recode/recode_3.6.bb |    2 +-  1 files changed, 1
> insertions(+), 1 deletions(-) diff --git
> a/recipes/recode/recode_3.6.bb b/recipes/recode/recode_3.6.bb index
> 3e7c6cd..0cdd43d 100644 --- a/recipes/recode/recode_3.6.bb +++
> b/recipes/recode/recode_3.6.bb @@ -8,7 +8,7 @@ SRC_URI =3D
> "${GNU_MIRROR}/recode/recode-${PV}.tar.gz \    inherit autotools
> -TARGET_CC_ARCH_append =3D "${LDFLAGS}" +TARGET_CC_ARCH_append =3D "
> ${LDFLAGS}"    do_configure() {  	gnu-configize --  1.7.2

It looks like your MUA mangled the patch. Could you please resend as v2.
GMail should also be compatible with `git send-email` [1].


Thanks,

Paul


[1] http://www.kernel.org/pub/software/scm/git/docs/git-send-email.html

--=-zOmWl3dTA2zugJEfj7t+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxRLGIACgkQPX1aK2wOHVjmegCeN3WWsDhTbV+3KhqzgCpGCHe8
HuQAnjZYK3YWCFpBgQnkCPestleToyME
=sWk7
-----END PGP SIGNATURE-----

--=-zOmWl3dTA2zugJEfj7t+--
