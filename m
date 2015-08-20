Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6A065CCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:16:13 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so147520662wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=keuatizcznD/+5JQPQt6KjwTjVST2QxHbNgKVsrQykI=;
	b=Un16cf+bCRE4D5psip8ANp6YdxywlRh+c4PdEOM03eqQDQm6dghs9rJ2zfzglO09eE
	grQwTumF/zICXS+tXRvJY1/FOjAic9cozpzKKR0vhOieubl8hzqZnomN7NqV+oJ6YLA0
	LZzftwFLU3a0dJwpeZ+uzbdhs79B3IH5m6gozPSxUdRDeQjum+29KcXoNmSsDq9mlN8N
	NEI/wHU2+9q1TsN4uF+atbPppfdRrD1kUt9kol2vFCN0E7zMKoibOmIxPDWfplsVmSR8
	P2OK0nZj66DBCepJJJkMV1TQCedUQV0FAaHcpJfdJ+NCF3PuTtHci6xN7hbP4OcEgSTg
	KEdQ==
X-Received: by 10.194.179.103 with SMTP id df7mr6716502wjc.69.1440080173786;
	Thu, 20 Aug 2015 07:16:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cw8sm5738553wjb.49.2015.08.20.07.16.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 07:16:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 16:16:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820141639.GB2446@jama>
References: <1438690323-23783-1-git-send-email-philip@balister.org>
	<55D5DE52.7000400@balister.org>
MIME-Version: 1.0
In-Reply-To: <55D5DE52.7000400@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python][PATCH] python-pyro4: Add new recipe.
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
X-List-Received-Date: Thu, 20 Aug 2015 14:16:18 -0000
X-Groupsio-MsgNum: 56831
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 10:04:02AM -0400, Philip Balister wrote:
> Any news on this? I just updated my copy of meta-oe and didn't see it.

it's in master-next, but jenkins builds don't look good (not caused by
this one but hard for me to see which ones to take and which ones to
leave).

> Philip
>=20
> On 08/04/2015 08:12 AM, Philip Balister wrote:
> > Pyro4 allows remote execution of objects over the network.
> >=20
> > Signed-off-by: Philip Balister <philip@balister.org>
> > ---
> >  .../python-pyro4/python-pyro4_4.39.bb                    | 16 ++++++++=
++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta-python/recipes-connectivity/python-pyro4/pytho=
n-pyro4_4.39.bb
> >=20
> > diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4=
_4.39.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.=
bb
> > new file mode 100644
> > index 0000000..aed0c9c
> > --- /dev/null
> > +++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
> > @@ -0,0 +1,16 @@
> > +DESCRIPTION =3D "Python Remote Objects"
> > +HOMEPAGE =3D "https://pypi.python.org/pypi/Pyro4/"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db48b62dd270c4691fabaa85be32=
36030"
> > +
> > +SRCNAME =3D "Pyro4"
> > +
> > +SRC_URI =3D "https://pypi.python.org/packages/source/P/${SRCNAME}/${SR=
CNAME}-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "75ed5cd142803b0a8d587dc8b6bb51ed"
> > +SRC_URI[sha256sum] =3D "39c6ca7f86b0f0bebfeada687a5a8b99f66470a52b0f81=
5195ae63c683266f24"
> > +
> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit setuptools
> >=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV4UcACgkQN1Ujt2V2gBy5nwCfe9F0E981NLnwWsI6QML9uzgQ
EEMAmwdJbQz4d9nOVan4VX2ENRSonFc7
=mO+V
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
