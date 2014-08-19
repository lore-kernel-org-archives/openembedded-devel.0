Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id A51E260030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:36:11 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so5431271wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 06:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IlKRd8eG0HFgFOtqYFgO46Wv1a5mPnc6wtFE1JaV4MA=;
	b=iE35ASv0Mo/PN4C7GLAowxqZZAAEWC0XdLdqcdkhqIAZxNZsLuVddNTqtV6y9uycYs
	Rw0fIZ5WZjxuqdZN1l1UpOn0xGqExodMtDd1JHL4zWW/xnTh9CodOCE6Hvz7HQ24qQNa
	RM1tUBVZ2/WrgiIXK1ioy/9H+m7uQ+jtUaN97CuDw8ghlIAugoftEKoJ0VKwo9umBUpD
	uAFoCqpuwAH2QOKnK22kvjcBWp/x4fDnN4i/PmVOCDU53QVqeZCjD7Jhlfc6z2bbF1xc
	xeD7uXdaBawlDik8kk1jSEa8XttouLb39fkuIwbzGmC3/gh5T3tLEjK4EE5rm72bXSu1
	9RRA==
X-Received: by 10.180.10.166 with SMTP id j6mr6843955wib.73.1408455372258;
	Tue, 19 Aug 2014 06:36:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r20sm48852172wik.0.2014.08.19.06.36.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 06:36:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 15:36:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819133612.GS3660@jama>
References: <CAHQecY4aMx0ytkLRf_0wjwO2uGvt6H8=sCaebzCAWL5FDR4-AQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHQecY4aMx0ytkLRf_0wjwO2uGvt6H8=sCaebzCAWL5FDR4-AQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][Patch 1/1 v2] gypsy: fix QA issue by removing EXTRA_OECONF
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Aug 2014 13:36:14 -0000
X-Groupsio-MsgNum: 51777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X9hp/qFlD/MyfJCu"
Content-Disposition: inline

--X9hp/qFlD/MyfJCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 01:26:45PM -0700, Tom King wrote:
> Addresses QA issue in:
>=20
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095=
778.html
>=20
> "4 gypsy-0.9: gypsy: configure was passed unrecognised options:
> --with-distro [unknown-configure-option]"

For some reason patchwork changes author to "root root"
http://patchwork.openembedded.org/patch/78537/

Fixed when cherry-picking to master-next

>=20
> Patch:
>=20
> Signed-off-by: Tom King <ka6sox@gmail.com>
> Signed-off-by: Ron Lockwood-Childs <rchilds@vctlabs.com>
> ---
>  meta-oe/recipes-navigation/gypsy/gypsy.inc |    2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc
> b/meta-oe/recipes-navigation/gypsy/gypsy.inc
> index 747b61d..7c93d0a 100644
> --- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
> +++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
> @@ -11,8 +11,6 @@ DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib libxslt-nat=
ive
> libxslt"
>  inherit autotools pkgconfig gtk-doc
>  PACKAGES +=3D "libgypsy"
>=20
> -EXTRA_OECONF +=3D "--with-distro=3Ddebian"
> -
>  FILES_${PN} =3D " \
>    ${sysconfdir}/gypsy.conf \
>    ${sysconfdir}/dbus-1 \
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X9hp/qFlD/MyfJCu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzUswACgkQN1Ujt2V2gByPMgCfZaMPkW1JvOuhoJCQyuuDZEA7
bhcAni7jC3vdG88hnDZGh0ppzAER19fC
=ymKy
-----END PGP SIGNATURE-----

--X9hp/qFlD/MyfJCu--
