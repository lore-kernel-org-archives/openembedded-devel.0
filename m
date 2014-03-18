Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id A7142605F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 19:17:08 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so5727526eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=it1gkNvep59lR6GmA5mKjVclx9MuhVeeTzftREzsh88=;
	b=ixgLIeFPUAawQHWcS9LjSf3JhkOYrf4teOnRK2fffl1wrJQXLVNJpWDJjd8CrHEch8
	QeFChzXIog5UpF4PRdpcSQYf704IBMbZkJYiByNo+2BcgkpWTP3oDUjkkNXu2YgzEVsp
	1Et41qUWxT2eHKvV+i+SOa1k02KIpOTq7++WIo+nr2HS8lw5f1e8rQa+Im4fO970ftJR
	b35DzuZk05WEpqBnBOTsAvyS7T81vrh8eqjaJQ6g6sDZEymRT250IsmqMF4glffYk9iB
	Ae3VmpO8x/Hh+6vyOim50Jj0dvHY1ekCQRfWD8cJC632/IiEEfNY0W8eINJjGIF6SNxa
	P7gQ==
X-Received: by 10.14.6.195 with SMTP id 43mr4475832een.101.1395170229629;
	Tue, 18 Mar 2014 12:17:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cb5sm49281566eeb.18.2014.03.18.12.17.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Mar 2014 12:17:08 -0700 (PDT)
Date: Tue, 18 Mar 2014 20:17:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140318191708.GD3725@jama>
References: <1395160103-15730-1-git-send-email-otavio@ossystems.com.br>
	<1395160103-15730-2-git-send-email-otavio@ossystems.com.br>
	<20140318190602.GB3725@jama>
MIME-Version: 1.0
In-Reply-To: <20140318190602.GB3725@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 2/2] libmicrohttpd: Update to 0.9.34
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
X-List-Received-Date: Tue, 18 Mar 2014 19:17:11 -0000
X-Groupsio-MsgNum: 48750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline

--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 08:06:02PM +0100, Martin Jansa wrote:
> On Tue, Mar 18, 2014 at 01:28:23PM -0300, Otavio Salvador wrote:
> > This update fixes the following build error:
> >=20
> > ,----[ Build error ]
> > | ...
> > | .../libmicrospdy.so: undefined reference to `SSL_get_error'
> > | .../libmicrospdy.so: undefined reference to `SSL_write'
> > | .../libmicrospdy.so: undefined reference to `SSL_free'
> > | ...
> > `----
>=20
> Is this v2 or the same as previous update?

Hmm it's identical, please don't resend identical changes and if you do
it by accident, then please update status on patchwork.

> > Reported-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  .../{libmicrohttpd_0.9.33.bb =3D> libmicrohttpd_0.9.34.bb}            =
  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.33.bb =
=3D> libmicrohttpd_0.9.34.bb} (85%)
> >=20
> > diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33=
=2Ebb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> > similarity index 85%
> > rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.=
bb
> > rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> > index 523b8dd..5de9390 100644
> > --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
> > +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> > @@ -6,8 +6,8 @@ SECTION =3D "net"
> >  DEPENDS =3D "libgcrypt gnutls"
> > =20
> >  SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "013b10f9de1cda5448b29c81305354a3"
> > -SRC_URI[sha256sum] =3D "d9587e8497548f820650cd607daf3615ea327243577937=
8983032c570f1cd559"
> > +SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
> > +SRC_URI[sha256sum] =3D "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843=
be421a040be1b25a88"
> > =20
> >  inherit autotools lib_package
> > =20
> > --=20
> > 1.9.0
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMom7QACgkQN1Ujt2V2gByw1wCgmYD5NpRDBRn9QGRAry+TGd7x
Tn8AmwVitN74eEZhowWjh5r5HITnMdQ6
=kLp2
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
