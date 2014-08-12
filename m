Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6423265DB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 16:29:15 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so6144432wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nCGEpgNnUIQsUHWHsYV/2DqTzVRmcCFwupJF5YBm2bI=;
	b=yAtihGXS+gsvOLU/Dm4c2ZNzzf7/EcHplEALxJdoqiseVVggtWTIFyq4acLyDuOgPL
	YWH4OsP7mFK5ICjny4U9js9rwOd2T6A5Elkk5wa4ZMMtQDyI5Bsnr0UG++TUWMOo61EP
	0UK3xHEqDcmb8y6nXXEew9B+JR98Oc0BrZqsaor1iutZVe/8BMyZjW0S9ooqwL597FAJ
	ossTwGxVoI1/U7WnqLghhMIvY4fZDHUGmCYzku76fn2Kfpc3po6kaMuXrS0ngRlNdOlF
	IWe33h8HQFl2EVvlnpsWbuxuRzv36gookYf5Xa0zRR/bAR1vfnwaMghP6cOhsI5Lmhzm
	CKJA==
X-Received: by 10.180.211.233 with SMTP id nf9mr32996393wic.33.1407860956772; 
	Tue, 12 Aug 2014 09:29:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wr6sm10301587wjc.24.2014.08.12.09.29.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 09:29:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 18:29:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140812162952.GS14848@jama>
References: <BLU436-SMTP782D203C1A9AF2454095C9D6ED0@phx.gbl>
	<20140812111432.GC14848@jama>
	<CAL0pqZ0MCfiH4wHuCDsVTab9vVJa2fQ0DFb2PB06s40YW7aevQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL0pqZ0MCfiH4wHuCDsVTab9vVJa2fQ0DFb2PB06s40YW7aevQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] 'Update cyassl bb file'
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
X-List-Received-Date: Tue, 12 Aug 2014 16:29:23 -0000
X-Groupsio-MsgNum: 51637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q45K03DPxJwyRovM"
Content-Disposition: inline

--Q45K03DPxJwyRovM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 10:03:31AM -0600, Leah wrote:
> I submitted a recipe to be considered for adding to meta-oe and was told =
to
> make changes. I made the changes and resubmitted and was told "you cannot
> break upgrade path (make version going backwards) just to remove 2
> comments." I am not sure how else to go about getting my recipe added. Any
> assistance would be greatly appreciated.
>=20
> ~Leah

Resubmit whole patch (cyassl addition squashed together with this
change) with v2 added to subject line.

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

=46rom this patch alone it's not clear that cyassl wasn't merged (and it's
not even in master-next queue to be merged).

> On Tue, Aug 12, 2014 at 5:14 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Mon, Aug 11, 2014 at 11:32:36AM -0600, lchristina26 wrote:
> > > Signed-off-by: lchristina26 <lchristina26@hotmail.com>
> > > ---
> > >  meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb | 5 -----
> > >  1 file changed, 5 deletions(-)
> > >
> > > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0=
=2Ebb
> > b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > > index accc144..441d321 100644
> > > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > > @@ -9,8 +9,6 @@ SECTION =3D "libs/network"
> > >  LICENSE =3D "GPLv2"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> > >
> > > -PR =3D "r1"
> > > -
> >
> > NAK ^ you cannot break upgrade path (make version going backwards) just=
 to
> > remove 2 comments.
> >
> > >  SRC_URI =3D "http://www.yassl.com/cyassl-${PV}.zip"
> > >
> > >
> > > @@ -21,6 +19,3 @@ S =3D "${WORKDIR}/${PN}-${PV}"
> > >
> > >  inherit autotools
> > >
> > > -# Detect and build with correct endianness
> > > -# CFLAGS +=3D "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '',
> > '-DBIG_ENDIAN_ORDER', d)}"
> > > -
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>=20
>=20
> --=20
>=20
> Leah Thompson
> www.wolfssl.com
> leah@wolfssl.com
> 406-570-1389
> Skype: lchristina26
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q45K03DPxJwyRovM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPqQQAACgkQN1Ujt2V2gBzRjgCbB+GVP/nntZLRnJyScomf8Y8P
HFoAoJ3ImhMjK2ensciWvKFGKAUOg2dU
=UFNr
-----END PGP SIGNATURE-----

--Q45K03DPxJwyRovM--
