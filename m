Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id EDF2D735BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 18:10:06 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so49999485wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 10:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AlNW93I5plOxYOUSHlhYoCgO7LK3EMsdotNdAO+xy6U=;
	b=cEa1Yp4DQHNOKYtb7TCAsFv4B92QimXmyMPSuF3NONkzqNnNuwQvUIK3zcIjBfeDhr
	X76apG0WfIk5Z1pKEZxzWJDgh4CceOn6OXXRRtJV0dS88ucyifYx4wJFphO+u9si3iY+
	4/sBwXiebrhFTVthYGwY3Bvv8EDYDODWRBdgp0VE50Qp8ZSsXherhELbprC/NFbA7bVK
	7DUFwIQXgTGhIWs5YvIsCuqD49r1qqpLM9QrZbs8SexMyirn+UF0QeeofKd5aUMwuYzH
	FzvBTt6CsiJ0N+Bqb2UwN1F6KGuE891qGvVWJAQhVRaUplvDnHndqBZMpD+aM09skXDk
	FIAw==
X-Received: by 10.194.82.136 with SMTP id i8mr10878214wjy.99.1424369407378;
	Thu, 19 Feb 2015 10:10:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v5sm22504888wiw.24.2015.02.19.10.10.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 10:10:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 19:10:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150219181010.GH2311@jama>
References: <1424300622-28832-1-git-send-email-ben.shelton@ni.com>
	<1424300622-28832-3-git-send-email-ben.shelton@ni.com>
	<CADkTA4Mi8UaK=fKfG17AC353sBxmfkr8aF4edA1btsStVbB98A@mail.gmail.com>
	<20150219172141.GF2311@jama>
	<CADkTA4P9T5gW4b6QoBmieJpTSHn6ShBTtwjvEcOj_UbpVrnXqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4P9T5gW4b6QoBmieJpTSHn6ShBTtwjvEcOj_UbpVrnXqw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Feb 2015 18:10:09 -0000
X-Groupsio-MsgNum: 54412
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDnEQgWzhgf+8aPe"
Content-Disposition: inline

--dDnEQgWzhgf+8aPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2015 at 12:42:49PM -0500, Bruce Ashfield wrote:
> On Thu, Feb 19, 2015 at 12:21 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Feb 19, 2015 at 12:09:09PM -0500, Bruce Ashfield wrote:
> >> On Wed, Feb 18, 2015 at 6:03 PM, Ben Shelton <ben.shelton@ni.com> wrot=
e:
> >> > python-msgpack implements the MessagePack binary serialization format
> >> > for Python.
> >> >
> >> > Copied from commit 91ed2353847d4121e3dd8ad10ca0c24194ac9765 in
> >> > meta-cloud-services/meta-openstack and updated to version 0.4.5.
> >>
> >> Can you elaborate on what is the use case for these recipes being cher=
ry
> >> picked ?
> >
> > It was discussed on IRC yesterday, the use case is simple. Some project
> > needs couple python-* recipes and they happen to be available in
> > meta-openstack now.. so instead of adding dependency on whole
> > meta-openstack which has unwanted side-effects and a lot of stuff they
> > don't care about they move 4 recipes to meta-python.
>=20
> Is there an IRC log someone can point me at ? IRC is an incredibly bad
> medium for looking up an old discussion. Sorry for not seeing it!

http://infobot.rikers.org/%23oe/20150218.html.gz

> Can someone also elaborate on 'unwanted side effects' ? Sounds like
> a bug, and something that can be fixed. Yanking recipes, not emailing
> the originators and citing bugs/issues without details .. really isn't a
> great way to foster collaboration and generally improve the ecosystem.
>=20
> Again .. that's all that I'm saying. There's no harm in taking the extra
> time to document things a little bit, and offer explanations.
>=20
> That's a valid reason for a move, but what I'm really asking for is
> that to be in
> the commit messages, and a description of the user. Having the floating
> set of recipes without a way to know how they are used and tested is
> going to cause a giant mess.
>=20
> >
> >> If they are simply being moved "because they are python' .. that is an=
noying,
> >> and causes pain for dependent layers that have specific version depend=
encies.
> >
> > They are moved before different projects need them and meta-python is
> > best project-agnostic layer for python recipes.
>=20
> No debate there. But again, we should simply log the reason in the origin=
al
> commit. There's no reason to lose that information to IRC and everyone's
> fading memory.
>=20
> >
> >> I'm going to have to pin nearly all versions in the openstack layers a=
nd keep
> >> duplicate recipes around, so since I'm suffering that overhead, it wou=
ld be nice
> >> if we could elaborate on the technical gain from doing this.
> >
> > You don't need to pin it if your layer has higher priority.
>=20
> Yah. Paul mentioned that. I'll do that for now, since there will be
> times that the
> openstack variants are newer than the ones in meta-python, and that will
> handle both use cases.
>=20
> Cheers,
>=20
> Bruce
>=20
> >
> >> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> >> > ---
> >> >  .../recipes-devtools/python/python-msgpack_0.4.5.bb     | 17 ++++++=
+++++++++++
> >> >  1 file changed, 17 insertions(+)
> >> >  create mode 100644 meta-python/recipes-devtools/python/python-msgpa=
ck_0.4.5.bb
> >> >
> >> > diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.=
5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
> >> > new file mode 100644
> >> > index 0000000..206b03d
> >> > --- /dev/null
> >> > +++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
> >> > @@ -0,0 +1,17 @@
> >> > +DESCRIPTION =3D "MessagePack (de)serializer"
> >> > +HOMEPAGE =3D "https://pypi.python.org/pypi/msgpack-python/"
> >> > +SECTION =3D "devel/python"
> >> > +LICENSE =3D "Apache-2.0"
> >> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcd9523181d9d4fbf7ffca52e=
aa2a5751"
> >> > +
> >> > +PR =3D "r0"
> >> > +SRCNAME =3D "msgpack-python"
> >> > +
> >> > +SRC_URI =3D "https://pypi.python.org/packages/source/m/${SRCNAME}/$=
{SRCNAME}-${PV}.tar.gz"
> >> > +
> >> > +SRC_URI[md5sum] =3D "3b82bc542d5599896695512e7c32f42d"
> >> > +SRC_URI[sha256sum] =3D "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971=
ef3e475c3d33308014cbb"
> >> > +
> >> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> >> > +
> >> > +inherit setuptools
> >> > --
> >> > 2.3.0
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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

--dDnEQgWzhgf+8aPe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTmJwIACgkQN1Ujt2V2gBwspwCfcbOff95AkZXk6ucMQODWWgak
V0MAnia2++aaHKe6QJMn2qKfQyv6Gjz5
=5KqI
-----END PGP SIGNATURE-----

--dDnEQgWzhgf+8aPe--
