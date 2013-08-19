Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 749226010E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 06:33:57 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1922163eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZgsCC3Yl1dmB7vXi+SVyZwWIJnggdz5WAurTImS+ryI=;
	b=c73ctkdxEmEIbkad0eABnu/VHhQOwJX6f3j8DIFyykUuKZ4WS62Kmv4X5fMi5k0P7w
	+EhUrS0+jt3Fe+HMokwT7JcLFfCAAMfe+cJp2q42syxHnMm2sLL6Z9fuII1CyzrBbshI
	6NYIf4SH7rThYlEsxUIkRffpMZdBSI4f1ln4QtY1PawTLrbt7NV9EGJtdgJGL0axJJlI
	vY9gwW4VkyKjY9gPpQOPTmU6M5ShUYOl99O/x0Tf6CxNYYF9ogK5AD5voIt3ZOcZO3GA
	p52aKIFb4wM2D5bJ6fceOo/D2CI01nd2X7our2vnCUZEOTaE3ayVydQ5XDDrDkztiIYe
	v6NQ==
X-Received: by 10.14.29.67 with SMTP id h43mr20245576eea.7.1376894037032;
	Sun, 18 Aug 2013 23:33:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm15052034eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 18 Aug 2013 23:33:56 -0700 (PDT)
Date: Mon, 19 Aug 2013 08:35:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130819063500.GC3573@jama>
References: <1375853946-4583-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1sqEn0EOz7f-Vu4+W=PNHdZ60d8Dz_g5YUVgz=Qf4wj=2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqEn0EOz7f-Vu4+W=PNHdZ60d8Dz_g5YUVgz=Qf4wj=2Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] proxy-libintl: rprovide the gettext packages
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
X-List-Received-Date: Mon, 19 Aug 2013 06:33:57 -0000
X-Groupsio-MsgNum: 45774
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline

--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 06:43:22PM -0700, Khem Raj wrote:
> ignore this one please. I have a different one that fixes the problem
> coming out shortly.

I'm sorry, I was a bit blind when checking patches to merge last week
and somehow I've missed this reply, should I revert it or can you send
follow-up quickly?
=20
> On Tue, Aug 6, 2013 at 10:39 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > This helps in stubbing out gettext when proxy-libintl is chosen
> > usually on small/uclibc based images
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../proxy-libintl/proxy-libintl_20100902.bb        |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.=
bbb/meta-oe/recipes-core/proxy-libintl/
> > proxy-libintl_20100902.bb
> > index e1531dd..0c652b6 100644
> > --- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> > +++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> > @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
> > "file://src/proxy-libintl/COPYING.LIB.txt;md5=3Dbc400bc21422f9a
> >
> >  PR =3D "r1"
> >  PROVIDES =3D "virtual/libintl virtual/gettext"
> > +RPROVIDES_${PN} +=3D "gettext"
> > +RPROVIDES_${PN}-dev +=3D "gettext-dev"
> >
> >  SRC_URI =3D " \
> >
> > http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-dev_${=
PV}_win32.zip\
> > --
> > 1.7.9.5
> >
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIRvJQACgkQN1Ujt2V2gBw2NwCdFO7yzeDZo/fVNmpnmUlgYq5y
MhYAoJnsAMC+875vmxkkiM0e3tH60d7Y
=HETW
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
