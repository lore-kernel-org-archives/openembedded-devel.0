Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGUM-0002Sb-Ps
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:40:03 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so204380dal.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2kLGvBauryNhok6GWwLC5QOslaCC0i+WIHPH5IUztnc=;
	b=gemnTsgzWJt64Bm5uChWM99ZxW8liZidf29JIjtArrB9nuv03srStL2G6J4LU76tnZ
	tOPD/luRrlzswsEsiwt5cB9NG8v+sHl3EKKE9ZENbfbXs7bfHuKTsCL58dhkqOrBkPi8
	V+JPBT8dHapddVQ9agfHOn/h8sma6mnZ4HWlH8mvZBjovCrJosALi2gU0tBX0orW0fU/
	3NIZO+YOLhqCJUXhTD+y2oz/Ek5d0F1WiPJcTRvScP9TaqP2Hq9CjzoTawj9VVU2UFxX
	1ID9Pu6D/pUyh8T1wvcgkWIZ6HeWDqqOHURC3yB3hL3i7WYUb+q2oVM605IDy812eSvK
	gQSA==
X-Received: by 10.68.242.225 with SMTP id wt1mr215356300pbc.65.1357817088880; 
	Thu, 10 Jan 2013 03:24:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d8sm886291pax.23.2013.01.10.03.24.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:24:47 -0800 (PST)
Date: Thu, 10 Jan 2013 12:24:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110112453.GA3722@jama.palm1.palmone.com>
References: <1357557759-25093-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357557759-25093-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] xmlto: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 10 Jan 2013 11:40:03 -0000
X-Groupsio-MsgNum: 42627
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iRomnA/8S0UoJbe2"
Content-Disposition: inline

--iRomnA/8S0UoJbe2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2013 at 01:22:39PM +0200, Marko Lindqvist wrote:
> Add obsolete_automake_macros.patch that replaces automake macros
> no longer supported by automake-1.13 with modern constructs.

Merged, thanks
>=20
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../xmlto/xmlto-0.0.25/obsolete_automake_macros.patch      |   12 ++++++=
++++++
>  meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb              |    6 +++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_a=
utomake_macros.patch
>=20
> diff --git a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake=
_macros.patch b/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automak=
e_macros.patch
> new file mode 100644
> index 0000000..faa8acc
> --- /dev/null
> +++ b/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros=
=2Epatch
> @@ -0,0 +1,12 @@
> +diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
> +--- xmlto-0.0.25/configure.in	2011-12-01 17:49:00.000000000 +0200
> ++++ xmlto-0.0.25/configure.in	2013-01-07 05:24:16.169953519 +0200
> +@@ -1,7 +1,7 @@
> + AC_INIT(xmlto, 0.0.25)
> + AC_CONFIG_SRCDIR(xmlto.spec.in)
> + AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
> +-AM_CONFIG_HEADER(config.h)
> ++AC_CONFIG_HEADERS(config.h)
> +
> + AC_PROG_CC
> + AM_PROG_CC_C_O
> diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/reci=
pes-support/xmlto/xmlto_0.0.25.bb
> index 806ea2e..447c791 100644
> --- a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
> +++ b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
> @@ -5,7 +5,11 @@ LICENSE =3D "GPLv2"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> =20
> -SRC_URI =3D "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar=
=2Egz"=20
> +PR =3D "r1"
> +
> +SRC_URI =3D "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar=
=2Egz \
> +           file://obsolete_automake_macros.patch \
> +"
>  SRC_URI[md5sum] =3D "a88cd3f08789b4825d1ac89fa065170d"
>  SRC_URI[sha256sum] =3D "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc=
352e843147e3e31a"
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iRomnA/8S0UoJbe2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDupQUACgkQN1Ujt2V2gBzVMACglwjoZGhJqvrSeT9dLHagSuqs
/6sAn2Xi3+cmNSJQD50mJJYT+wqD/h8+
=UE8Z
-----END PGP SIGNATURE-----

--iRomnA/8S0UoJbe2--
