Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQv6a-0006rP-OV
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 07:33:32 +0200
Received: by fxm19 with SMTP id 19so2660124fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 22:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1ABnBSn4QRHDOxhulDXPgfsRUaEMhXZ7ZGWBqJe9msE=;
	b=XBzdUl5cYN+NGw6QUEXY++2x1+22JQBWJ36wJQGNO3CZUT0M1Iv28PjCu+9+AAtKvL
	sh4lOJWRofiuUlPgWcTSZa1YXr9IAQZNst1HEPs2vOIXCjnYwCis8n157onsbXQKjCUX
	wmzgA/K9gZT2aHQ8+j2nDEEVkbtzFVnqgTYVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ius6cSN8qhXJz7bEPWPxZEbGm+tFT2//ZomaE+Tu9lfRWwq+vb/zJ4UYjOKg30uy2S
	DahPs/syjutNSCNJEwJdkTFwEFRODx4yQWBMaNbq0W/1qb8SvyOWPNsz6EQfsgC3LSv+
	bkDOiv9Cpko519YU8hZyamTNUlYeDmQ8iRJog=
Received: by 10.223.17.142 with SMTP id s14mr5029812faa.145.1306733424083;
	Sun, 29 May 2011 22:30:24 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b26sm592986fak.24.2011.05.29.22.30.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 22:30:23 -0700 (PDT)
Date: Mon, 30 May 2011 07:30:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110530053016.GE18119@jama.jama.net>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
	<c424bae29966b789e50eb4112a9d95a2b7833942.1306706130.git.Martin.Jansa@gmail.com>
	<1306720135.5979.1.camel@perseus>
MIME-Version: 1.0
In-Reply-To: <1306720135.5979.1.camel@perseus>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 07/14] libelf: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Mon, 30 May 2011 05:33:32 -0000
X-Groupsio-MsgNum: 32366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline

--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2011 at 06:48:55PM -0700, Khem Raj wrote:
> On Sun, 2011-05-29 at 23:56 +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> You do not need to import libelf recipe. oe-core provides libelf via
> elfutils change the depending recipes to depend on elfutils instead.

OK, thanks! Will test and update patch.
koen: should I update patch in same branch or send new patch removing
libelf and changing deps?

>=20
> > ---
> >  meta-oe/recipes-support/libelf/libelf_0.8.13.bb |   38 +++++++++++++++=
++++++++
> >  1 files changed, 38 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/libelf/libelf_0.8.13.bb
> >=20
> > diff --git a/meta-oe/recipes-support/libelf/libelf_0.8.13.bb b/meta-oe/=
recipes-support/libelf/libelf_0.8.13.bb
> > new file mode 100644
> > index 0000000..2ca562f
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libelf/libelf_0.8.13.bb
> > @@ -0,0 +1,38 @@
> > +DESCRIPTION =3D "libelf is an ELF object file access library. \
> > +The elf library provides routines to access, and manipulate, Elf objec=
t files."
> > +LICENSE =3D "LGPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D6e29c688d912da12b66b73e=
32b03d812"
> > +SECTION =3D "libs"
> > +PR =3D "r1"
> > +
> > +SRC_URI =3D "http://www.mr511.de/software/libelf-${PV}.tar.gz"
> > +SRC_URI[md5sum] =3D "4136d7b4c04df68b686570afa26988ac"
> > +SRC_URI[sha256sum] =3D "591a9b4ec81c1f2042a97aa60564e0cb79d041c52faa74=
16acb38bc95bd2c76d"
> > +
> > +inherit autotools
> > +
> > +PARALLEL_MAKE =3D ""
> > +
> > +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > +
> > +EXTRA_OECONF_append_virtclass-native =3D " --enable-static"
> > +
> > +do_configure_prepend () {
> > +	if test ! -e acinclude.m4; then
> > +		cp aclocal.m4 acinclude.m4
> > +	fi
> > +}
> > +
> > +do_install () {
> > +	oe_runmake 'prefix=3D${D}${prefix}' 'exec_prefix=3D${D}${exec_prefix}=
' \
> > +		   'libdir=3D${D}${libdir}' 'includedir=3D${D}${includedir}' \
> > +		   install
> > +	install -d ${STAGING_INCDIR}/libelf
> > +        for i in libelf.h nlist.h gelf.h sys_elf.h; do
> > +                install -m 0644 lib/$i ${STAGING_INCDIR}/libelf/
> > +        done
> > +        make includedir=3D${STAGING_INCDIR} install-compat
> > +}
> > +
> > +BBCLASSEXTEND =3D "native"
> > +
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3jK2gACgkQN1Ujt2V2gBzZQwCfWvIVLBkXDc/Vg6GP6j59pwM2
kysAn1wGT+Qv8k2MKymCP+/94lL2RrWo
=OuZo
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
