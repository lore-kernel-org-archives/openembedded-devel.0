Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 93E8D72AA9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 20:51:21 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y24WA-0003pD-6c from Joe_MacDonald@mentor.com ;
	Fri, 19 Dec 2014 12:51:22 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6;
	Fri, 19 Dec 2014 12:51:21 -0800
Received: by burninator (Postfix, from userid 1000)	id 29E5C581405; Fri, 19
	Dec 2014 15:51:17 -0500 (EST)
Date: Fri, 19 Dec 2014 15:51:17 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: LC Mac <lchristina26@hotmail.com>
Message-ID: <20141219205116.GV26911@mentor.com>
References: <BLU436-SMTP19311B478F533B1CE52EB1BD66A0@phx.gbl>
	<20141219191538.GB2461@jama>
	<BAY168-W86B0FE2F269A2A25D84C5FD66B0@phx.gbl>
	<BAY168-W55F4DA0A3698FD6B08B449D66B0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BAY168-W55F4DA0A3698FD6B08B449D66B0@phx.gbl>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] cyassl: updated to version 3.3.0, removed 3.2.0
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
X-List-Received-Date: Fri, 19 Dec 2014 20:51:28 -0000
X-Groupsio-MsgNum: 53409
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i6WX/W6h5xa4jqsd"
Content-Disposition: inline

--i6WX/W6h5xa4jqsd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] cyassl: updated to version 3.3.0, remove=
d 3.2.0] On 14.12.19 (Fri 13:43) LC Mac wrote:

> If you could explain exactly what I need to do to get just 3.3.0 added, n=
ot the previous version (3.2.0) which was never officially added, that woul=
d be great.=20

It's no big deal, it's just that your patch is an iteration on top of
your 3.2.0 recipe, which never got merged and has been flushed from all
of our queues.  So your incremental patch won't apply.  Submit a new
recipe and then we've got something to talk about.  :-)

-J.

>=20
> From: lchristina26@hotmail.com
> To: openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [meta-networking][PATCH] cyassl: updated to version 3.3=
=2E0, removed 3.2.0
> Date: Fri, 19 Dec 2014 13:39:36 -0700
>=20
>=20
>=20
>=20
> I'm a bit confused, why can't the version I submitted be added? I version=
 3.2.0 which was never officially submitted to meta-networking but switched=
 it to 3.3.0 so that 3.3.0 is added instead. I no longer want version 3.2.0=
 to be added, just 3.3.0.=20
>=20
> From: martin.jansa@gmail.com
> Date: Fri, 19 Dec 2014 20:15:38 +0100
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] cyassl: updated to version 3.3=
=2E0, removed 3.2.0
>=20
> On Thu, Dec 18, 2014 at 01:20:33PM -0700, lchristina26 wrote:
> > Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> =20
> There isn't 3.2.0 version in meta-networking, so this doesn't apply
> again.
> =20
> http://patchwork.openembedded.org/patch/81639/ wasn't applied because
> updated patch wasn't sent (or was missed in patchwork).
> =20
> > ---
> >  .../recipes-connectivity/cyassl/{cyassl_3.2.0.bb =3D> cyassl_3.3.0.bb}=
  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.2.0.bb =
=3D> cyassl_3.3.0.bb} (81%)
> >=20
> > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.b=
b b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > similarity index 81%
> > rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> > rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > index 508bab4..b6f852d 100644
> > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263"
> > =20
> >  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> > =20
> > -SRC_URI[md5sum] =3D "9f076e82d32bea986651ada34c49f6c0"
> > -SRC_URI[sha256sum] =3D "c9e97cd3fa4697e55328c2016965ac4b304fcef45a1055=
9caf540c42f1d5e93a"
> > +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> > +SRC_URI[sha256sum] =3D "e51583ea1e4d64537553922d67a96360312811dffef58d=
4c05506aa98a296fe3"
> > =20
> >  inherit autotools
> > =20
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> =20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
--=20
-Joe MacDonald.
:wq

--i6WX/W6h5xa4jqsd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUlI/EAAoJEEn8ffcsOfaW27IIALLuqZXc/3YMTDl8Vsq8drOD
8dSYsc+10zjYIK0CkDWf8192lMikt9UhqVcjstpjgkH0h6PBsG1vE+0oTz6oP8Kw
8ICsSnRFzV3TDNfDgc7pfQBChBzY4YDVs9teMML1ATbayedNK20TnUu09God2xau
GHp52n9UA9/VSXrHsN5BXjHh7el88WnHpmOp8nZI1rNPk1oT94lcKdkDpU/6UiRd
n3lAfPqk0U0tf/Vv8kvquCZ+tFt+cjDQ/0H4PzqeR5UEAAtJB7cADj/UhosewyKx
LAeKIDheICwWvg1BSH0wIzPGojoivSKQv00AsiQPlwcwi2+LJ5kMoAr/D4IchFU=
=q4Hi
-----END PGP SIGNATURE-----

--i6WX/W6h5xa4jqsd--
