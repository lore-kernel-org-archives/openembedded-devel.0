Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URgat-00014S-KZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 12:25:07 +0200
Received: by mail-ea0-f173.google.com with SMTP id k11so2062791eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qq5vRO22diHfYVyC81YAawK/8RMubW6sn/eYB1RU1WY=;
	b=IlhBfrJuiob9RcBWVyLxGu903Z8ZNg/dSLH0V5jSps8qHJNGcphlxYHJ38+L9hOfGn
	iOHwXyLecsFwrHnEOdmOFBWLLlEWFYEgSkiT6vco2oLIIJIqmaTMydTab3oUVCSPizYL
	6qTLYP3jOJXr+RspEn06qW/2AIYbENdElvVPx44qJzEdafgYQueb4ysTg/LORoBFPBpX
	TBZ9TnJw754hknsLYf92G7bn3jIUFL0/+RVdVUjruvQeidUEPC7n8Sgm5sSTYqYPYJva
	1PusDzCpo6Ay5mo9MHE7Q3twORdgx15t1DvjvVeuTzQ3+Uu5hoVCse6OpZ5YXgng/+U0
	TFyg==
X-Received: by 10.15.41.2 with SMTP id r2mr60433907eev.20.1366020455257;
	Mon, 15 Apr 2013 03:07:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 8sm9300036eeg.15.2013.04.15.03.07.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:07:34 -0700 (PDT)
Date: Mon, 15 Apr 2013 12:07:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130415100740.GN2475@jama>
References: <1366016435-10751-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1366016435-10751-1-git-send-email-b28495@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v4] tclap: initial add 1.2.1
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
X-List-Received-Date: Mon, 15 Apr 2013 10:25:10 -0000
X-Groupsio-MsgNum: 44191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PZYVFYZbFYjzBslI"
Content-Disposition: inline

--PZYVFYZbFYjzBslI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 05:00:35PM +0800, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> TCLAP (Templatized C++ Command Line Parser Library ) is a small, flexible
> library that provides a simple interface for defining and accessing comma=
nd
> line arguments.
>=20
> Use the commit of tag tclap-1-2-1-release-final.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  .../tclap/files/Makefile.am-disable-docs.patch     |   31 ++++++++++++++=
++++++
>  meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb      |   14 +++++++++
>  2 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/tclap/files/Makefile.am-disa=
ble-docs.patch
>  create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
>=20
> diff --git a/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-doc=
s.patch b/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.pat=
ch
> new file mode 100644
> index 0000000..358cbef
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch

why not in meta-oe/recipes-devtools/tclap/tclap? Lookup would be few
milliseconds faster :)

> @@ -0,0 +1,31 @@
> +From c209ed0e7ffca32fe3714bad9cc54bdb00c286bb Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Mon, 15 Apr 2013 16:28:37 +0800
> +Subject: [PATCH] Makefile.am: disable docs
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +docs need some generating tool (for example, doxygen) from host which may
> +be not available. Disable it to avoid build issue.
> +
> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + Makefile.am |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 0a6ebc9..6b42f41 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,7 +1,7 @@
> +=20
> + ACLOCAL_AMFLAGS =3D -I config
> +=20
> +-SUBDIRS =3D include examples docs tests msc config
> ++SUBDIRS =3D include examples tests msc config
> +=20
> + pkgconfigdir =3D $(libdir)/pkgconfig
> + pkgconfig_DATA =3D $(PACKAGE).pc
> +--=20
> +1.7.5
> +
> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/reci=
pes-devtools/tclap/tclap_1.2.1.bb
> new file mode 100644
> index 0000000..c9fab52
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "Templatized C++ Command Line Parser"=20
> +HOMEPAGE =3D "http://tclap.sourceforge.net/"=20
> +LICENSE =3D "MIT"=20
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f8732=
453"
> +
> +SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> +SRC_URI =3D "git://tclap.git.sourceforge.net/gitroot/tclap/tclap \
> +          file://Makefile.am-disable-docs.patch \

Please use 4 spaces if you send v5 with .patch file moved.

> +"=20
> +
> +S =3D "${WORKDIR}/git"
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.5
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PZYVFYZbFYjzBslI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFr0WwACgkQN1Ujt2V2gBxcUQCeNrIPgkH83FKzAgpmXmTNTXUM
cpYAn3ANel3hX7KdTV245a4fbbDLvClO
=IFcv
-----END PGP SIGNATURE-----

--PZYVFYZbFYjzBslI--
