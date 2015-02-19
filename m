Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8500560556
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 17:21:37 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id y19so8514541wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 09:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WRD89aYPfsEQToPo9mPQkzYuDKijqjkBa2o9S2bpNb0=;
	b=MA7XlS/YpIp62BE74DIYMYA0EAgvNmeT2XEnE7vGBBT6TGcojvHSUNxqJCniCYFQDu
	/Z98L4KT9IWIHvpYMjssrkvWfRPrOWy1Z13mlRSAfIN1IAlAh8KCKB+NE2VQneGzi0/a
	4JAi14icxblN1nZjJQXndoQJa72R5crkw0q2LrrxfKw3uOrrDJ7fc8rURwiwzp9yI26L
	3EYrhdsuOCCAkQFGh3eoor/SSBGvGI/WZ7mOxGZ90HcoUxRmkcGqiKymLoNzrsk6DinP
	KeQLCeozS18nCDPwDCN9qaR6kFmhg8tet03iiYtwNGt9m10KElCr89pOeyTaEhqYnZAg
	Ramg==
X-Received: by 10.180.10.71 with SMTP id g7mr8303620wib.26.1424366498863;
	Thu, 19 Feb 2015 09:21:38 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hm6sm38278782wjb.32.2015.02.19.09.21.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 09:21:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 18:21:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150219172141.GF2311@jama>
References: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
	<1424300622-28832-3-git-send-email-ben.shelton@ni.com>
	<CADkTA4Mi8UaK=fKfG17AC353sBxmfkr8aF4edA1btsStVbB98A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mi8UaK=fKfG17AC353sBxmfkr8aF4edA1btsStVbB98A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python][PATCH 3/4] python-msgpack: add recipe
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
X-List-Received-Date: Thu, 19 Feb 2015 17:21:39 -0000
X-Groupsio-MsgNum: 54410
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b8GWCKCLzrXbuNet"
Content-Disposition: inline

--b8GWCKCLzrXbuNet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2015 at 12:09:09PM -0500, Bruce Ashfield wrote:
> On Wed, Feb 18, 2015 at 6:03 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> > python-msgpack implements the MessagePack binary serialization format
> > for Python.
> >
> > Copied from commit 91ed2353847d4121e3dd8ad10ca0c24194ac9765 in
> > meta-cloud-services/meta-openstack and updated to version 0.4.5.
>=20
> Can you elaborate on what is the use case for these recipes being cherry
> picked ?

It was discussed on IRC yesterday, the use case is simple. Some project
needs couple python-* recipes and they happen to be available in
meta-openstack now.. so instead of adding dependency on whole
meta-openstack which has unwanted side-effects and a lot of stuff they
don't care about they move 4 recipes to meta-python.

> If they are simply being moved "because they are python' .. that is annoy=
ing,
> and causes pain for dependent layers that have specific version dependenc=
ies.

They are moved before different projects need them and meta-python is
best project-agnostic layer for python recipes.

> I'm going to have to pin nearly all versions in the openstack layers and =
keep
> duplicate recipes around, so since I'm suffering that overhead, it would =
be nice
> if we could elaborate on the technical gain from doing this.

You don't need to pin it if your layer has higher priority.

> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> > ---
> >  .../recipes-devtools/python/python-msgpack_0.4.5.bb     | 17 +++++++++=
++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python-msgpack_=
0.4.5.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.b=
b b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
> > new file mode 100644
> > index 0000000..206b03d
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION =3D "MessagePack (de)serializer"
> > +HOMEPAGE =3D "https://pypi.python.org/pypi/msgpack-python/"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcd9523181d9d4fbf7ffca52eaa2=
a5751"
> > +
> > +PR =3D "r0"
> > +SRCNAME =3D "msgpack-python"
> > +
> > +SRC_URI =3D "https://pypi.python.org/packages/source/m/${SRCNAME}/${SR=
CNAME}-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "3b82bc542d5599896695512e7c32f42d"
> > +SRC_URI[sha256sum] =3D "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971ef3=
e475c3d33308014cbb"
> > +
> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit setuptools
> > --
> > 2.3.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b8GWCKCLzrXbuNet
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTmG6UACgkQN1Ujt2V2gBy1ZwCdFri1j0EfhbL2Q6V7Xdu1bfdM
mswAoJuydZVdIswpEBKLh+uF3277ILMo
=TTyH
-----END PGP SIGNATURE-----

--b8GWCKCLzrXbuNet--
