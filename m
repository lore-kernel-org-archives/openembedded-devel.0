Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T0UT6-0008BG-9y
	for openembedded-devel@lists.linuxtogo.org;
	Sun, 12 Aug 2012 11:28:20 +0200
Received: by wibhq4 with SMTP id hq4so2271073wib.6
	for <openembedded-devel@lists.linuxtogo.org>;
	Sun, 12 Aug 2012 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v4bs7T/2U1sm0rav9aMrkjtYJ77Wz+VdG7l+RZtorcA=;
	b=u6bCZqFgs4sb9/19R2KBkvIrQaMpmYBt4RpDq/JuCSHm9xPxE3puNIkMSWcKZwHWg8
	b6wz8dTMP0jbs3U5/uAbhZY3BZClncif+EaCk4BZMM34+OH84avmBEF1R26WhK4juOH1
	XYLKF5X46STe+2CMu73x0qr9FkRVbv05XRjp42hOl5DqmdOo2yXnOLa9HihU2l1+zfEW
	n1IjJhT91DsuBDn4rxBEABlhlT5mqyxlkWl5DZfYkJ+j8UCzLuNjVHhEWhcsOKPssZhQ
	XPErSV4YvdhFRegBHbJPYH+b9WV1UTmX3vm+7p4Jh5j6QmAhC+O5z2YJoJsaN/L5DXz3
	H7KQ==
Received: by 10.180.104.197 with SMTP id gg5mr9447274wib.9.1344762988401;
	Sun, 12 Aug 2012 02:16:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm9095757wib.7.2012.08.12.02.16.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Aug 2012 02:16:27 -0700 (PDT)
Date: Sun, 12 Aug 2012 11:16:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120812091633.GC3290@jama.jama.net>
References: <1344761452-10965-1-git-send-email-marc@cpdesign.com.au>
MIME-Version: 1.0
In-Reply-To: <1344761452-10965-1-git-send-email-marc@cpdesign.com.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.linuxtogo.org
Subject: Re: [oe-core] qwt: fix link error when linking with ld-gold.
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
X-List-Received-Date: Sun, 12 Aug 2012 09:28:20 -0000
X-Groupsio-MsgNum: 40186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 12, 2012 at 06:50:52PM +1000, Marc Reilly wrote:
> ld-gold doesn't implicitly link with librt, this fixes an unresolved
> symbol error when compiling qwt examples.
>=20
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
> ---
>  .../recipes-qt/qwt/files/fix-ld-gold-linking.patch |   14 ++++++++++++++
>  meta-oe/recipes-qt/qwt/qwt.inc                     |    1 +
>  2 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
>=20
> diff --git a/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch b/met=
a-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
> new file mode 100644
> index 0000000..a00aba4
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qwt/files/fix-ld-gold-linking.patch
> @@ -0,0 +1,14 @@
> +- fix link of unresolved symbols: clock_getres and clock_gettime
> +---
> +diff --git a/src/src.pro b/src/src.pro
> +index beb7125..ebf8ea6 100644
> +--- a/src/src.pro
> ++++ b/src/src.pro
> +@@ -94,6 +102,7 @@ SOURCES +=3D \
> +     qwt_symbol.cpp \
> +     qwt_system_clock.cpp
> +=20
> ++linux*:LIBS +=3D -lrt
> + =20
> + contains(QWT_CONFIG, QwtPlot) {
> + =20
> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.=
inc
> index a299ac8..94231b4 100644
> --- a/meta-oe/recipes-qt/qwt/qwt.inc
> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b046=
2ff3cfb4af42051c88"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=3Dqwt \
>  	file://qwt6.patch \
> +        file://fix-ld-gold-linking.patch \
>  	"

Please don't mix tabs and spaces for indentation.

Spaces should be used for multiline variables, so your line is right,
please change 2nd and last (of SRC_URI). Thanks

> =20
>  S =3D "${WORKDIR}/qwt-${PV}"
> --=20
> 1.7.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAndHEACgkQN1Ujt2V2gByXegCfcj27wQreW/tW0gSNemJ4/jb8
MkYAni4PnWHnZtnp2iw5tka8mNdc4Sfl
=H1j+
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
