Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6ntx-0007QC-Lp
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 20:58:25 +0100
Received: by mail-ea0-f174.google.com with SMTP id 1so1770358eaa.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2013 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=F1u6/we3TkTeq8t/gM68zWva4yycPzOe3NWVIL9j1c4=;
	b=yVAzUTnHsTKibGMH00BuaKwTxmVLFALFETExA85VGXpC2OOxw2ae/jpVsHXbW9Nnhg
	W6uUaL3BKQbK/0zcb9SB2Pg0epVudDON22TjD0Kl2wZsQxSrzfduXFrKMVSet51EWKM8
	HExPgiX6H4X1i/hjeDfahsI55bOx65asWzHdXvpR+/AUTu5QLuZjiQPm8HOkRR/VVUmu
	oXX9ClZlbM5y5o+D9BPa8dT8s+nHH4Gen0rAfXjXOum51VrMZi959WNpJD03EdmcDSv5
	Nc2lYfFVzCxaX3ydCdUz0Rw+h2GAEmTaUmutWFTw0HJqC+Si9OZmO5XbDym5DPAy5qvM
	rjKA==
X-Received: by 10.14.183.198 with SMTP id q46mr24147553eem.1.1361043740457;
	Sat, 16 Feb 2013 11:42:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm20692728eea.3.2013.02.16.11.42.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 11:42:19 -0800 (PST)
Date: Sat, 16 Feb 2013 20:42:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216194227.GC3300@jama>
References: <20130216161007.6DE51502C2@opal>
MIME-Version: 1.0
In-Reply-To: <20130216161007.6DE51502C2@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Paul Eggleton : python-lxml: update to 3.0.2 and tweak
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
X-List-Received-Date: Sat, 16 Feb 2013 19:58:47 -0000
X-Groupsio-MsgNum: 43205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cX4WM3qIY/fHWHDu"
Content-Disposition: inline

--cX4WM3qIY/fHWHDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please delete that branch, that was probably meant for
meta-openembedded-contrib


On Sat, Feb 16, 2013 at 04:10:07PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: paule/python-bits
> Commit: 478ee32b3b6fe6e98d80737ac8ed37d3e4f04178
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D478ee32b3b6fe6e98d80737ac8ed37d3e4f04178
>=20
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Fri Feb  8 15:02:59 2013 +0000
>=20
> python-lxml: update to 3.0.2 and tweak
>=20
> * Update to version 3.0.2
> * Update LIC_FILES_CHKSUM - substance of the license did not change, but
>   some copyright/origin notes for specific parts were added.
> * Add SUMMARY
> * Move packaging definitions to the end
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> ---
>=20
>  .../{python-lxml_2.2.8.bb =3D> python-lxml_3.0.2.bb} |   13 ++++++-------
>  1 files changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-=
oe/recipes-devtools/python/python-lxml_3.0.2.bb
> similarity index 76%
> rename from meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> rename to meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
> index a175609..5ab7b4a 100644
> --- a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> +++ b/meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
> @@ -1,17 +1,16 @@
> +SUMMARY =3D "Python XML bindings for libxml2 and libxslt"
>  DESCRIPTION =3D "Powerful and Pythonic XML processing library combining \
>  libxml2/libxslt with the ElementTree API."
>  HOMEPAGE =3D "http://codespeak.net/lxml"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3D7de92baeb3b7bfaebe724041=
55fdb346"
> +LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3Df9f1dc24f720c143c2240df4=
1fe5073b"
>  SRCNAME =3D "lxml"
> -PR =3D "r2"
> =20
>  DEPENDS =3D "libxml2 libxslt"
> -RDEPENDS_${PN} +=3D "libxml2 libxslt python-compression"
> =20
>  SRC_URI =3D "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNA=
ME}-${PV}.tar.gz;name=3Dlxml"
> -SRC_URI[lxml.md5sum] =3D "d6c612d63a84d79440912a1b29d3b981"
> -SRC_URI[lxml.sha256sum] =3D "89b73925b5e3295dcf4675cb948007a20eb029fe35c=
9a162ae19ec11f1abafe5"
> +SRC_URI[lxml.md5sum] =3D "38b15b0dd5e9292cf98be800e84a3ce4"
> +SRC_URI[lxml.sha256sum] =3D "cadba4cf0e235127795f76a6f7092cb035da23a6e9e=
c4c93f8af43a6784cd101"
> =20
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> =20
> @@ -28,7 +27,7 @@ DISTUTILS_INSTALL_ARGS +=3D " \
>  "
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> -RDEPENDS_${PN}_virtclass-native =3D "libxml2-native libxslt-native"
> -
> =20
> +RDEPENDS_${PN} +=3D "libxml2 libxslt python-compression"
> +RDEPENDS_${PN}_virtclass-native =3D "libxml2-native libxslt-native"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cX4WM3qIY/fHWHDu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEf4SMACgkQN1Ujt2V2gBwL6ACdHqXqV+9JAS8grHDIqR9zpxPp
Gl8An1hSBFLOfAm2T0Oeix/VrJCB8rBI
=z5UV
-----END PGP SIGNATURE-----

--cX4WM3qIY/fHWHDu--
