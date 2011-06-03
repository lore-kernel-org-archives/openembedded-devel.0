Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QSLSb-0003ML-Ow
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jun 2011 05:54:09 +0200
Received: by bwz5 with SMTP id 5so1741547bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 20:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CSdP64cJ51ES8RJxQYMsMfgCyITwmO9Ofi6AeeBed/0=;
	b=N1FelBwQ3QP4lV2eNtR/OZpLyM2bgvXC9XWrlV3dmdgwgDc9vpRHPVLEr1T7fSuOsF
	XTj4S0gi61ZM6nSaaFWIT+ckkOsGSIRuLAKpxkfAjql8+BW0YsKH64yDjCM56btw+Oy2
	fqyoVV6fwRrjqxB05tvO8Dfv5pl2uYYrhj/7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=esZML0HZE2kPwrxAaWfFfmhA70YIuMe9lDrzMKMn3IKD0+oQBv/X6SiUo+9LhsU6Z8
	7r4ccpfqZEtlCw/5QGl13qlvXewYQ7etwHeLVVRffCuESdGlOmQzkKrovPhZ+9IZGLHl
	ugjMsTgYFg9yU4p9WUga8cDGMQ8pAnpWO6MBk=
Received: by 10.204.140.18 with SMTP id g18mr1403352bku.59.1307073045767;
	Thu, 02 Jun 2011 20:50:45 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 16sm939125bkm.14.2011.06.02.20.50.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 20:50:44 -0700 (PDT)
Date: Fri, 3 Jun 2011 05:50:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110603035037.GJ3281@jama.jama.net>
References: <cover.1307040582.git.Martin.Jansa@gmail.com>
	<1eefebc5e34260c875302a181cb80724bad4303d.1307040582.git.Martin.Jansa@gmail.com>
	<201106021452.38054.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <201106021452.38054.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] gobject-introspection: add newer git version compatible with glib-2.0_git
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
X-List-Received-Date: Fri, 03 Jun 2011 03:54:09 -0000
X-Groupsio-MsgNum: 32494
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GU3/x65mZ6MFE8p3"
Content-Disposition: inline

--GU3/x65mZ6MFE8p3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2011 at 02:52:37PM -0700, Khem Raj wrote:
> On Thursday, June 02, 2011 11:51:34 AM Martin Jansa=20
> wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../gobject-introspection_git.bb                   |  =20
> 33
> > ++++++++++++++++++++ 1 files changed, 33=20
> insertions(+), 0 deletions(-)
> >  create mode 100644
> > meta-oe/recipes-devtools/gobject-
> introspection/gobject-introspection_git.b
> > b
> >=20
> > diff --git
> > a/meta-oe/recipes-devtools/gobject-
> introspection/gobject-introspection_git
> > .bb
> > b/meta-oe/recipes-devtools/gobject-
> introspection/gobject-introspection_git
> > .bb new file mode 100644
> > index 0000000..2a7f30c
> > --- /dev/null
> > +++
> > b/meta-oe/recipes-devtools/gobject-
> introspection/gobject-introspection_git
> > .bb @@ -0,0 +1,33 @@
> > +# NOTE: WIP! This recipe does not cross-compile=20
> atm., only -native
> > +DEPENDS =3D "glib-2.0 libffi python-native gobject-
> introspection-native"
> > +DEPENDS_virtclass-native =3D "libffi-native python-
> native bison-native
> > flex-native" +BBCLASSEXTEND =3D "native"
> > +
> > +SRC_URI =3D "git://git.gnome.org/gobject-
> introspection;protocol=3Dgit \
> > +  file://use-usr-bin-env-for-python.patch \
> > +"
> > +
> > +LICENSE =3D "GPLv2+ & LGPLv2+"
> > +LIC_FILES_CHKSUM =3D
> >=20
> "file://COPYING.tools;md5=3D94d55d512a9ba36caa9b7df079bae19f=20
> \ +		  =20
> >=20
> file://COPYING.lib;md5=3D3bf50002aefd002f49e7bb854063f7e7"
> > +
> > +SRCREV =3D "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
> > +PV =3D "1.29.0+gitr${SRCPV}"
> > +DEFAULT_PREFERENCE =3D "-1"
>=20
> why DP -1

because it's for glib-2.0_git with DP -1 and both are development
snapshots. glib-2.0_git was added mostly for it's gdbus-codegen
integration (before we had this in separate recipe gdbus-binding-tool,
because it was also separate repo). And it needs also changed code and
command line arguments to call gdbus-codegen were changed... so we've
updated SHR code for it but I wanted to give other people more time
before making it new default version.
=20
Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GU3/x65mZ6MFE8p3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3oWg0ACgkQN1Ujt2V2gBwVzACfd6PLxuZMtVonIivD0pVUdpAM
+voAnRhb7/YbxDU9Vj8a3G26+t6u7vJY
=TK1D
-----END PGP SIGNATURE-----

--GU3/x65mZ6MFE8p3--
