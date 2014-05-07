Return-Path: <joe@deserted.net>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id A5E076059B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 18:23:37 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id r5so1590568qcx.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 11:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=nEYo1JIXwV4zCgLeidsfKYEENSVCLdmLiFB3aF2vFfU=;
	b=YSCNd//WtB+EajOJm0jFJJNHj2qzsqok3WMr4bdJwKGedeqU8Y5Fzpg56T/QaW+ODp
	zvpgU3+w4zrwjxmiWaOgMkhAs+rlujx1x4grlHW+uCHyRQiDzGpVJ/bmXiUItucFjya8
	AJX40ULy4JGPiu4Jpp2L5338C50IgFLWaZJQKyxamxrTulns9pFJe0ADfEulniyIZX+Y
	WBaCUdMMFoGFhFPJKvMMkiaiDZVHkFlbW8IWzqtrXX1RzrjviNq605QTYsfcuqfQXbhd
	UPmOuTLzm2IlhcfJwy61Eu8MTuY00gvZ8nvGkB0kE8dGoDgQBegw+pNb+wpFVpLugj8I
	W0Yg==
X-Gm-Message-State: ALoCoQlAR9jED2xk698wDQMZbg/TQITJeRsvny8PlHLC93gHFsA8HAtqsaV8SASEJI/KkWGXonQj
X-Received: by 10.140.27.245 with SMTP id 108mr26293464qgx.18.1399487017738;
	Wed, 07 May 2014 11:23:37 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id t5sm30320938qaj.34.2014.05.07.11.23.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 07 May 2014 11:23:36 -0700 (PDT)
Date: Wed, 7 May 2014 14:23:34 -0400
From: Joe MacDonald <joe@deserted.net>
To: Amy Fong <amy.fong@windriver.com>
Message-ID: <20140507182329.GC8085@deserted.net>
References: <20140409173022.GA2661@windriver.com>
	<20140425013419.GM10115@deserted.net>
MIME-Version: 1.0
In-Reply-To: <20140425013419.GM10115@deserted.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] Uprev memcached from upstream
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
X-List-Received-Date: Wed, 07 May 2014 18:23:40 -0000
X-Groupsio-MsgNum: 49783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline

--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] Uprev memcached from upstream] On 14.04.24 (Thu=
 21:34) Joe MacDonald wrote:

> Hi Amy,
>=20
> Should I expect a v2 based on Martin and Khem's comments?  Also, if
> you're doing the uprev, it's probably worth removing the old one at the
> same time.

Finally coming up for air again, so ping?

-J.

>=20
> -J.
>=20
> [[oe] [meta-networking] Uprev memcached from upstream] On 14.04.09 (Wed 1=
3:30) Amy Fong wrote:
>=20
> > commit 3d0b80c5667a2c1d8634173948048567d0bc9c36
> > Author: Amy Fong <amy.fong@windriver.com>
> > Date:   Tue Apr 8 14:29:19 2014 -0400
> >=20
> >     Uprev memcached from upstream
> >    =20
> >     memcached 1.4.15 has some configuration errors:
> >     configure:5798: error: cannot run test program while cross compiling
> >    =20
> >     Uprev has the needed fix for the configuration error and some other=
 fixes.
> >    =20
> >     Signed-off-by: Amy Fong <amy.fong@windriver.com>
> >=20
> > diff --git a/recipes-support/memcached/memcached_1.4.17.bb b/recipes-su=
pport/memcached/memcached_1.4.17.bb
> > new file mode 100644
> > index 0000000..906896c
> > --- /dev/null
> > +++ b/recipes-support/memcached/memcached_1.4.17.bb
> > @@ -0,0 +1,50 @@
> > +SUMMARY =3D "A high-performance memory object caching system"
> > +DESCRIPTION =3D "\
> > + Danga Interactive developed memcached to enhance the speed of LiveJou=
rnal.com, \
> > + a site which was already doing 20 million+ dynamic page views per day=
 for 1 \
> > + million users with a bunch of webservers and a bunch of database serv=
ers. \
> > + memcached dropped the database load to almost nothing, yielding faste=
r page \
> > + load times for users, better resource utilization, and faster access =
to the \
> > + databases on a memcache miss. \
> > + . \
> > + memcached optimizes specific high-load serving applications that are =
designed \
> > + to take advantage of its versatile no-locking memory access system. C=
lients \
> > + are available in several different programming languages, to suit the=
 needs \
> > + of the specific application. Traditionally this has been used in mod_=
perl \
> > + apps to avoid storing large chunks of data in Apache memory, and to s=
hare \
> > + this burden across several machines."
> > +
> > +HOMEPAGE =3D "http://www.danga.com/memcached/"
> > +LICENSE =3D "BSD"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7e5ded7363d335e1bb18013ca08=
046ff"
> > +
> > +inherit autotools
> > +
> > +DEPENDS +=3D "libevent"
> > +RDEPENDS +=3D "perl perl-module-posix perl-module-autoloader perl-modu=
le-tie-hash"
> > +
> > +SRC_URI =3D "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "46402dfbd7faadf6182283dbbd18b1a6"
> > +SRC_URI[sha256sum] =3D "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9=
926a89999d8cdc0458"
> > +
> > +python __anonymous () {
> > +    endianness =3D d.getVar('SITEINFO_ENDIANNESS', True)
> > +    if endianness =3D=3D 'le':
> > +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dlittle")
> > +    else:
> > +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dbig")
> > +}
> > +
> > +inherit update-rc.d
> > +
> > +INITSCRIPT_NAME =3D "memcached"
> > +INITSCRIPT_PARAMS =3D "defaults"
> > +
> > +do_install_append() {
> > +	install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.=
d/memcached=20
> > +	mkdir -p ${D}/usr/share/memcached/scripts
> > +	install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcached/s=
cripts
> > +	install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcached/=
scripts
> > +}
--=20
-Joe MacDonald.
:wq

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNqeiEACgkQwFvcllog0XzdKgCcDAoKZPrrjJI9vnqSFXWbCYDw
VRkAoLba9IOGGw0KvWqFpzklxvuGy5Ip
=ug7j
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
