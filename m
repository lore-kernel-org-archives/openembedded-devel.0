Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UcJ0c-0001nl-Ux
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 19:27:40 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz17so599724pbc.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 10:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tnOyM0ACj8pbggtkiiKIJSPh/fdKd/DcBt6uX57vx+c=;
	b=CavqxqGd50Oe301NG5dYuN43LDwzoxsPS/y2bLM33IlI8NIqhAIJ3dh/ZD/icOOt4a
	DfEXal9ZkX8k+DXMBRtALrMiqDsyZ6gPrKnwuSVosex86gw1Xs9ESwwxjn9G6z5Af6Ud
	rsgxB9y52GprD/L9Mt1NgOMFE5EZcsRbOhTzddHdOTI6uf9sPTbMZ4F6oNanBBrcv+Bs
	ummxEf/0gmpnj4CfPAyK8iwsWSqy7p1Ud/wU8a2Dzn75Eh36prgvYjFSJdVz9pEaMn02
	zTCk5CbCQ0vS78aBCjaX37Wl9D8QNfNq4dP69QWHpbzGYl9XApZd6KX/av9eiuqrwYAC
	f0Dw==
X-Received: by 10.66.159.6 with SMTP id wy6mr35380928pab.206.1368551358845;
	Tue, 14 May 2013 10:09:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	gi2sm18972880pbb.2.2013.05.14.10.09.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 14 May 2013 10:09:17 -0700 (PDT)
Date: Tue, 14 May 2013 19:09:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130514170917.GM3187@jama>
References: <1368524249-8219-1-git-send-email-hong-hua.yin@freescale.com>
	<20130514120008.GH3187@jama>
MIME-Version: 1.0
In-Reply-To: <20130514120008.GH3187@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core master] yajl: pass the cmake variable LIB_SUFFIX to handle installation on 64-bit systems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 17:27:45 -0000
X-Groupsio-MsgNum: 44715
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2+jOUFLb7N+7fooZ"
Content-Disposition: inline

--2+jOUFLb7N+7fooZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2013 at 02:00:08PM +0200, Martin Jansa wrote:
> On Tue, May 14, 2013 at 05:37:29PM +0800, Olivia Yin wrote:
> > WARNING: QA Issue: yajl: Files/directories were installed but not shipp=
ed
> >   /usr/lib
> >   /usr/lib/libyajl.so.2
> >   /usr/lib/libyajl.so
> >   /usr/lib/libyajl_s.a
> >   /usr/lib/libyajl.so.2.0.4
> >   /usr/lib/.debug
> >   /usr/lib/.debug/libyajl.so.2.0.4
> >=20
> > NOTE: for 64-bit systems where lib64 is used you can pass the cmake
> >       variable LIB_SUFFIX to cause installation into the system's 'lib6=
4'
> >       directory.
>=20
> Subject incorrectly says oe-core.
And it was already applied few days ago:
http://git.openembedded.org/meta-openembedded/commit/?id=3Deb040205f38eb0e2=
c28ccc7b4f64e9541cc82cc0

>=20
> > Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
> > ---
> >  meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb b/meta-oe/reci=
pes-devtools/yajl/yajl_2.0.4.bb
> > index 7359520..9d67e2d 100644
> > --- a/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
> > +++ b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
> > @@ -1,6 +1,7 @@
> >  DESCRIPTION =3D "Yet Another JSON Library - A Portable JSON parsing an=
d serialization library in ANSI C"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74f541bd9a2b6c8e5d0714bcdc3=
27f32"
> > +PR =3D "r1"
> > =20
> >  SRCREV =3D "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
> >  SRC_URI =3D "git://github.com/lloyd/yajl.git"
> > @@ -8,3 +9,5 @@ SRC_URI =3D "git://github.com/lloyd/yajl.git"
> >  S =3D "${WORKDIR}/git"
> > =20
> >  inherit cmake lib_package
> > +
> > +EXTRA_OECMAKE =3D "-DLIB_SUFFIX=3D${@d.getVar('baselib', True).replace=
('lib', '')}"
> > --=20
> > 1.7.0.4
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2+jOUFLb7N+7fooZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGSb70ACgkQN1Ujt2V2gBwFPACbBbUdNC1Cp44yU4b6WEskWixv
h2EAoIzx6AwSh3EasOqnOc0lq+4Q4o79
=ixz6
-----END PGP SIGNATURE-----

--2+jOUFLb7N+7fooZ--
