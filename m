Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id A116361883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 14:07:51 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1040559eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Aug 2013 07:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k8hGWCxOJMenL9pIYmTLeR8ld9iqVN4MJxKGan706M4=;
	b=UaHC99R5w81DltswsZOad7E+GzspVkaturx8OPk6Qy/tGNLRwAnmA7FYAY+tsJ2jZa
	7cOfXoGt4mGZAEQo0yZAkjsNnCwEwJbHEP9H0zB2MplQBP0C8PmKIz7KpaLw+vxakod+
	/m4DIOnfnCaCuPSz48FitJuhzwaez/JfHrfs1HvDtYcpIYeXVB99BmhTyEFPJXXvKcfQ
	9pSraKDmx805HS6HNbitg8hEfHWR6R52KB2xrKxEbEBB69zNBadxbJ2nJde6roFYJY8R
	B3/euf4KfAu/B+pTIS/tHHztU9R5kMaNU1TJJyzzDTbuZkzte+qDEsHEIIy5+iefP0Bg
	hjBQ==
X-Received: by 10.14.213.136 with SMTP id a8mr1616958eep.62.1375366071825;
	Thu, 01 Aug 2013 07:07:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm4566426een.16.2013.08.01.07.07.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 07:07:51 -0700 (PDT)
Date: Thu, 1 Aug 2013 16:08:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Message-ID: <20130801140827.GQ3280@jama>
References: <1375364341-35086-1-git-send-email-javier.viguera@digi.com>
	<20130801134749.GP3280@jama> <51FA6846.1070006@digi.com>
MIME-Version: 1.0
In-Reply-To: <51FA6846.1070006@digi.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][dylan][PATCH] vsftpd: fix compile-time dependence
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
X-List-Received-Date: Thu, 01 Aug 2013 14:07:52 -0000
X-Groupsio-MsgNum: 45549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s3R87C3fwYeCSZ0b"
Content-Disposition: inline

--s3R87C3fwYeCSZ0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2013 at 03:53:10PM +0200, Javier Viguera wrote:
> Hi Martin,
>=20
> I just subscribed to the list so I didn't know it was already fixed.
>=20
> Anyway:
>=20
> # git branch -a --contains 46354a697c18a64c5836159adf8dbd92e6547e85
>=20
> shows that it's only fixed on *master*.
>=20
> I was bitten by this using stable dylan branches, that's why my patch=20
> was sent to apply on dylan.

Backports for dylan need to be marked as such (see README in root of
meta-oe).
=20
> Could this fix be backported to dylan?

It's already in my branch with fixes for backport to dylan
http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/dylan-=
backports

>=20
> -
> Regards,
>=20
> Javier Viguera
>=20
>=20
> On 01/08/13 15:47, Martin Jansa wrote:
> > On Thu, Aug 01, 2013 at 03:39:01PM +0200, Javier Viguera wrote:
> >> vsftpd links with openssl libraries (libssl and libcrypto) so there is=
 a
> >> compile-time dependence on openssl package.
> >>
> >> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> >> ---
> >>   meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/=
meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> >> index c02ee9c..f146910 100644
> >> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> >> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> >> @@ -4,7 +4,7 @@ SECTION =3D "network"
> >>   LICENSE =3D "GPLv2"
> >>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd=
47b1271"
> >>
> >> -DEPENDS =3D "libcap"
> >> +DEPENDS =3D "libcap openssl"
> >>
> >
> > It was fixed a month ago:
> >
> > commit 46354a697c18a64c5836159adf8dbd92e6547e85
> > Author: Martin Jansa <martin.jansa@gmail.com>
> > Date:   Tue Jul 2 20:31:56 2013 +0200
> >
> >      vsftpd: add missing dependency on openssl
> >
> > And current vsftpd is 3.0.0:
> >
> > commit 441502b68d03a4ce7796436a53c5e95399724ad2
> > Author: Roy.Li <rongqing.li@windriver.com>
> > Date:   Fri Jul 19 10:19:25 2013 +0800
> >
> >      Upgrade vsftpd to 3.0.0
> >
> >
> >>   SRC_URI =3D "https://security.appspot.com/downloads/vsftpd-${PV}.tar=
=2Egz \
> >>              file://makefile-destdir.patch \
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s3R87C3fwYeCSZ0b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH6a9sACgkQN1Ujt2V2gBwb5ACfUFyElEjb/IOjYfJ9ERROOoog
fe0An2x1P7xa3s1JHLEZcO1sJaL9OwKa
=/w29
-----END PGP SIGNATURE-----

--s3R87C3fwYeCSZ0b--
