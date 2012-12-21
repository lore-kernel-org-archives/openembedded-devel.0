Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlzMo-0005Lf-Op
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 10:58:11 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so2004624dak.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 01:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=78NzDzGpNiYY/Zqg5jccyZh3cVAw1g2bW/Hmyr0bzcU=;
	b=nax2qfxXoyw1Y3USv7cPtkUxA2aRn9DfSieNnsjFNIEFlXCu7D+fTmBM+x+Uvz8dIC
	4mwARpBP9/IKGdhtPxH4zA3aL6tuSZjRW6FxsznTsvex2W5AxcIRZ3IR2fVm+YB0DhV5
	Rd8DubihLXGKH/x/g6Xg+IGX8llVaCHoj7vdvfn+SRpBBwVUDfK6skJFHbxE/dZ2SRNA
	Y+NIdq0CqUNIspSddyXW1PKvdHnd+ZrPKa5arC4bSZTkdhIx+oFDZdQpvtNtGkHFaANg
	vqIrGN6aLdbxF+9wTT+fkJdYAHRBfMymrNWj/gjNO6nOKoLNykHUoTGyK7HdPnq990Ub
	dnvw==
X-Received: by 10.68.241.136 with SMTP id wi8mr38280970pbc.95.1356083000729;
	Fri, 21 Dec 2012 01:43:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wf8sm6698696pbc.65.2012.12.21.01.43.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 01:43:19 -0800 (PST)
Date: Fri, 21 Dec 2012 10:43:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121221094318.GQ14543@jama.palm1.palmone.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
	<1356007963-12208-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1356007963-12208-2-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia PATCH 1/6] gssdp: add 0.12.2.1 and 0.13.2
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
X-List-Received-Date: Fri, 21 Dec 2012 09:58:11 -0000
X-Groupsio-MsgNum: 42288
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hSZb4FHl1C2xfsUy"
Content-Disposition: inline

--hSZb4FHl1C2xfsUy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 12:52:38PM +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-multimedia/recipes-connectivity/gupnp/gssdp.inc   |   16 ++++++++++=
++++++
>  .../recipes-connectivity/gupnp/gssdp_0.12.2.1.bb       |    5 +++++
>  .../recipes-connectivity/gupnp/gssdp_0.13.2.bb         |    8 ++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
>  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12=
=2E2.1.bb
>  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13=
=2E2.bb
>=20
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc b/meta-=
multimedia/recipes-connectivity/gupnp/gssdp.inc
> new file mode 100644
> index 0000000..51befd9
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Resource discovery and announcement over SSDP"
> +DESCRIPTION =3D "GSSDP implements resource discovery and announcement ov=
er SSDP (Simpe Service Discovery Protocol)."
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7"
> +DEPENDS =3D "glib-2.0 libsoup-2.4 gobject-introspection-stub vala-stub-n=
ative"

vala-stub-native does not exist afaik, why not use vala-native?

> +
> +inherit autotools pkgconfig
> +
> +PACKAGES =3D+ "gssdp-tools"
> +
> +FILES_gssdp-tools =3D "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
> +
> +EXTRA_OECONF =3D "--disable-introspection"
> +
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '=
', d)}"
> +PACKAGECONFIG[gtk] =3D "--with-gtk,--without-gtk,gtk+"
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb=
 b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
> new file mode 100644
> index 0000000..29cc721
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
> @@ -0,0 +1,5 @@
> +require gssdp.inc
> +
> +SRC_URI =3D "http://download.gnome.org/sources/${BPN}/0.12/${BPN}-${PV}.=
tar.xz"
> +SRC_URI[md5sum] =3D "8ac3a544ef0dcf8caaf7c249d2a50dc2"
> +SRC_URI[sha256sum] =3D "928aa257815d044fdbfc740f5799530d41897947b5d78541=
73f636b36d728414"
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb b=
/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
> new file mode 100644
> index 0000000..c308fa0
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
> @@ -0,0 +1,8 @@
> +require gssdp.inc
> +
> +SRC_URI =3D "http://download.gnome.org/sources/${BPN}/0.13/${BPN}-${PV}.=
tar.xz"
> +SRC_URI[md5sum] =3D "758ed423cdd258a9a22d59c321b535ed"
> +SRC_URI[sha256sum] =3D "8f663f8a72b66254f5c20a3610ff853ac8d00bf6f253828e=
37e51579caa34dce"
> +
> +# This is a development release so don't prefer it
> +DEFAULT_PREFERENCE =3D "-1"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hSZb4FHl1C2xfsUy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDULzYACgkQN1Ujt2V2gBz4NQCfRSv7GcjcvdXLiLa8YXzUdCM0
SaQAnRaKc4faNeFYfjGKtGN5gNCePS/R
=t2Ly
-----END PGP SIGNATURE-----

--hSZb4FHl1C2xfsUy--
