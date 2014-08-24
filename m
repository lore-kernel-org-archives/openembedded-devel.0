Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id C2A6265E94
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 09:24:43 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so12133240wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s4Df2ggxT8Gm1xRLOAlmDNrzI04UoAD4PF2b2ifXl/A=;
	b=j6Mx2yqhPmdL4Mc27UhVuoW5sKNlj85PiI26MkZeXN9nypg2rWfQ1UgYvxMOG6grcN
	aTIok7SpDrR59EkJYRIVpwbQbtP8W1JqBmkpmZC5C/vPafzJNazHAhzrhXwNon1q7pwR
	yaVkx0J2iBojHYMK+SKKNkzp3F9gRoE0k1SCgHtJuV0sudofL03bwkfdcY07Za31sSd2
	B/g+dC5Wz94EzjvULNUVwHxmGMoeoJDiC+3OkY+kn8kOdnLF9y1tWeA0WCMDj4doMO3a
	O+Xb47Mr4L+L8Vcy4pqG6vNcs+iEhBdQlzeFfOXEvDwOgd0g3+jZ+r+hegJre5tvktIN
	ZEAQ==
X-Received: by 10.180.184.99 with SMTP id et3mr8270763wic.31.1408872284360;
	Sun, 24 Aug 2014 02:24:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fr2sm18551734wib.7.2014.08.24.02.24.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 02:24:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Aug 2014 11:24:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140824092449.GI20524@jama>
References: <1408795335-10619-1-git-send-email-Martin.Jansa@gmail.com>
	<CANx9H-Ar4bYGkmWQaJZpnkRS8idBOXxtOTrEBfN1-o4jdLDSUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-Ar4bYGkmWQaJZpnkRS8idBOXxtOTrEBfN1-o4jdLDSUw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] python-cython: Fix missing deps for native
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
X-List-Received-Date: Sun, 24 Aug 2014 09:24:49 -0000
X-Groupsio-MsgNum: 51830
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Content-Disposition: inline

--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2014 at 06:03:01PM -0700, Tim Orling wrote:
> On Sat, Aug 23, 2014 at 5:02 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > * ERROR: Nothing RPROVIDES 'python-netserver-native' (but
> > virtual:native:/OE/build/shr-core/meta-openembedded/meta-python/recipes=
-devtools/python/
> > python-cython_0.20.2.bb RDEPENDS on or otherwise requires it)

FYI: I'll squash this into the master-next commit which added the
RDEPENDS_${PN}

> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> Acked-by: Tim Orling <TicoTimo@gmail.com>
>=20
> > ---
> >  meta-python/recipes-devtools/python/python-cython_0.20.2.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> > b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> > index 8578a14..3966e0b 100644
> > --- a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> > +++ b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
> > @@ -21,3 +21,4 @@ RDEPENDS_${PN} +=3D "\
> >      python-subprocess \
> >      python-shell \
> >  "
> > +RDEPENDS_${PN}_class-native =3D ""
> > --
> > 2.0.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP5r2EACgkQN1Ujt2V2gBy15gCfXZREOfVadBH+OUNBi4nxpMUi
bpoAnAoGxgyeGKtNRjhZnbddPp0cRL7T
=O2L5
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--
