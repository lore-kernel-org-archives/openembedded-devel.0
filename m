Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAF27054E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:25:57 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id e4so525899wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N0KJpdkmEn+jRA68pFwUrM1tEexfePVZlqnvyb4ZK+Y=;
	b=l5G/afvAW/mDyPDSd+Fc/VcMP3S1RxYU9HVkgOqqKeCrIoXI+CRhRtxsXoqyeu+t0e
	uIjywF5+Nk4B1Se39hDAMiHzIbv7bKIRIcOXFgo10y6th/95vevB49pBFIiwxCvCKtp0
	KUbgZbxedovezbZMP6FkHds51uHV0BBCmg6457rg/vDHjpTNJULkVy4jtGs3lmdCZTMc
	g5qskCymQlqinBjaUOz1+X6QoayCSrUvQXC0+S3YeHKnd8qEb9knH44Lqp5x/1FPWYh8
	4hX4OuqrnzOiP6NfPbSu8JA8utt48kyWwRn+6ue1SOZ79J7zVVDDnlZhjhd9+bQuU/Qt
	jxKA==
X-Received: by 10.180.230.197 with SMTP id ta5mr35318485wic.10.1409217957937; 
	Thu, 28 Aug 2014 02:25:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ys5sm8371247wjc.25.2014.08.28.02.25.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 02:25:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 11:26:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828092605.GA16066@jama>
References: <1408909187-29642-1-git-send-email-otavio@ossystems.com.br>
	<53FE9607.3000203@gmail.com>
MIME-Version: 1.0
In-Reply-To: <53FE9607.3000203@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] php: Fix native build due mistakenly linking against host's iconv
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
X-List-Received-Date: Thu, 28 Aug 2014 09:26:00 -0000
X-Groupsio-MsgNum: 51886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2014 at 07:37:59PM -0700, akuster808 wrote:
>=20
> Acked-by: Armin Kuster <akuster808@gmail.com>

Is this for "for-daisy" one?

> On 08/24/2014 12:39 PM, Otavio Salvador wrote:
> > The configure script has mistakenly choose to enable iconv support,
> > due host to provide it, adding '/usr/lib' to the linking flags and
> > failing as:
> >
> > ,----[ Linking error while testing 'fork' support ]
> > | conftest.c:268: warning: conflicting types for built-in function 'for=
k'
> > | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
> > |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
> > | collect2: ld returned 1 exit status
> > `----
> >
> > This patch disables iconv support for native builds fixing the error.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >   meta-oe/recipes-devtools/php/php.inc |    1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-dev=
tools/php/php.inc
> > index 030c090..6bdae78 100644
> > --- a/meta-oe/recipes-devtools/php/php.inc
> > +++ b/meta-oe/recipes-devtools/php/php.inc
> > @@ -35,6 +35,7 @@ EXTRA_OECONF =3D "--enable-mbstring \
> >   "
> >   EXTRA_OECONF_virtclass-native =3D " \
> >                   --with-zlib=3D${STAGING_LIBDIR_NATIVE}/.. \
> > +                --without-iconv \
> >                   ${COMMON_EXTRA_OECONF} \
> >   "
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP+9a0ACgkQN1Ujt2V2gBztogCfVF3GBdzAyCXpafp4jqMCCZRL
BMEAnisZ/QUp7SMbvNGBdn/OQwl6o9FY
=wtBL
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
