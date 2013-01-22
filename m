Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxdJh-0004LJ-EU
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:51:08 +0100
Received: by mail-pb0-f46.google.com with SMTP id wy7so3934193pbc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DFe1frQ5sWZKuMjSPAJlU3tw/+DvUyYUzpu+iHmqGUA=;
	b=qkEscYd9ZYYvlQRz8mgXKmIP4LKbpJfSgDfsyhquoSPpehPbSOeHlxF7uFWIcNHUqy
	X27el9a54t+m+QDuhZDawbOUCbUCLnutb/WO2R31q0Di2ZZEEDXFz/LrCFHy/9qCLurh
	7eld+RXg3DfxqiwDdiBb9cpfrZ9GHb8VzK6drPxEnKgMpSl98OWBI1JHwc2RqrwYs+gU
	SaUQ5b7eVD93WwJTqxuM08Tk+PAWSyIalx3Tl3e1BXQZXnGiXNgiiY2USAfGBHieeuCN
	nxarvXKmTaqqzGsd3Eu85+u8ei3SuXB+qsC+1YTLCe0wxl6btDutDvK1BSSCwOXmjG5u
	sJdw==
X-Received: by 10.68.238.106 with SMTP id vj10mr39479575pbc.40.1358858134665; 
	Tue, 22 Jan 2013 04:35:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id uh9sm10676979pbc.65.2013.01.22.04.35.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:35:33 -0800 (PST)
Date: Tue, 22 Jan 2013 13:35:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130122123533.GU29386@jama.palm1.palmone.com>
References: <1358533891-4828-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1358533891-4828-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] lua5.1: Fix multilib install
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
X-List-Received-Date: Tue, 22 Jan 2013 12:51:09 -0000
X-Groupsio-MsgNum: 42800
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udzYTtuEmHLUHegf"
Content-Disposition: inline

--udzYTtuEmHLUHegf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Jan 18, 2013 at 10:31:31AM -0800, Khem Raj wrote:
> when we have multilib enabled then there are some hardcoded
> assumptions in lua code which needs to be fixed some can
> be fixed by simply passing right variable on cmdline for
> the one's in sourcecode needs to be edited in place.
>=20

Both lua patches merged, thanks

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb b/meta-oe/recip=
es-devtools/lua/lua5.1_5.1.5.bb
> index 9da9e95..f303d87 100644
> --- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
> +++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
> @@ -4,6 +4,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D59bdd99bb82238f238cf5c65c21=
604fd"
>  HOMEPAGE =3D "http://www.lua.org/"
> =20
> +PR =3D "r1"
> +
>  DEPENDS +=3D "readline"
>  SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz \
>             file://bitwise_operators.patch \
> @@ -21,6 +23,7 @@ EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLA=
GS} -DLUA_USE_LINUX -fPIC' MYLD
> =20
>  do_configure_prepend() {
>  	sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
> +	sed -i -e s:lib/lua/5.1/:${base_libdir}/lua/5.1/:g src/luaconf.h
>  }
> =20
>  do_compile () {
> @@ -34,6 +37,8 @@ do_install () {
>  		'INSTALL_INC=3D${D}${includedir}/' \
>  		'INSTALL_MAN=3D${D}${mandir}/man1' \
>  		'INSTALL_SHARE=3D${D}${datadir}/lua' \
> +		'INSTALL_LIB=3D${D}${libdir}' \
> +		'INSTALL_CMOD=3D${D}${libdir}/lua/5.1' \
>  		install
>  	install -d ${D}${libdir}/pkgconfig
>  	install -m 0644 ${WORKDIR}/lua5.1.pc ${D}${libdir}/pkgconfig/lua5.1.pc
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--udzYTtuEmHLUHegf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+h5UACgkQN1Ujt2V2gBykZQCeIcKlMEjxvOWLss6SHO7FLKEu
W4gAoLamTkJSYPHQakSacGSCMZWfmWyW
=Tn4C
-----END PGP SIGNATURE-----

--udzYTtuEmHLUHegf--
