Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id C6A5470200
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 21:44:37 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so6752239wes.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2kCXWVtJZXRHM3/e+xQCir2sHSGN6UCtJ8xF+ZPIBVs=;
	b=IaM1lvU7uJyZiQGavIbR2ijUNLY8g42S6sX+BrPwEh+IgN+Psi8Wz5JSEoVFap1c6H
	Nh6ygFw6wT499U4Qu3JTgycOM1vNOHIqEvD9j68mPftcOWkPBBepOpHdVPy4INeQP4Np
	ZKApTmbjm/unirP0DHm/rwW6IXII81plCKSaqGgTDctQ+LRZhPVppAhKbzk3DLFq6Wd0
	3pszwfF4YJ8brXIORXnHB5dfoqtxhI9Dv+SgdlUqGPMKx1+jF/mIC/V65CykfVzX4+uI
	5jJ8E+/o3dxWI77xhs3x+O/4et8Fx3xaj/jHkojc2D3r5jX0MDifmE+LFdDWSdexY6YG
	KvCQ==
X-Received: by 10.180.105.68 with SMTP id gk4mr27356435wib.24.1405892678839;
	Sun, 20 Jul 2014 14:44:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w10sm34301397wie.22.2014.07.20.14.44.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 14:44:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 23:44:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140720214452.GF22875@jama>
References: <1405887685-12673-1-git-send-email-akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1405887685-12673-1-git-send-email-akuster@mvista.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] v2] wireshark: Add recipe 1.12.0-rc2
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
X-List-Received-Date: Sun, 20 Jul 2014 21:44:43 -0000
X-Groupsio-MsgNum: 51131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gTY1JhLGodeuSBqf"
Content-Disposition: inline

--gTY1JhLGodeuSBqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 01:21:25PM -0700, Armin Kuster wrote:
> Inital wireshark support on gtk+
> Added gtk3.
> Cleaned up PACKAGECONFIG options
> README with additional info

RP submitted few fixes for this change, can you please check wireshark
in master-next and send just follow-up patch or comment on fixes RP did?

Thanks

>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta-networking/recipes-support/wireshark/README   | 37 ++++++++++++++++=
+++
>  .../wireshark/wireshark_1.12.0-rc2.bb              | 42 ++++++++++++++++=
++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta-networking/recipes-support/wireshark/README
>  create mode 100644 meta-networking/recipes-support/wireshark/wireshark_1=
=2E12.0-rc2.bb
>=20
> diff --git a/meta-networking/recipes-support/wireshark/README b/meta-netw=
orking/recipes-support/wireshark/README
> new file mode 100644
> index 0000000..0e0c526
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/README
> @@ -0,0 +1,37 @@
> +#
> +Wireshark - Notes
> +
> +URL: http://www.wireshark.org/
> +User Guide: http://www.wireshark.org/docs/wsug_html_chunked/
> +Secruity advisories: http://www.wireshark.org/security/
> +
> +Wireshark is slowly moving away from gtk and towards QT as their graphic=
al stack.
> +Currently gtk is supported with this release and I plan on integrating Q=
T.=20
> +
> +
> +
> +Adding the wireshark to your build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +via local.conf
> +IMAGE_INSTALL_append =3D " wireshark"
> +
> +Adding the wireshark to your graphical build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +via local.conf
> +EXTRA_IMAGE_FEATURES +=3D "x11-base"
> +
> +or use the "core-image-x11"
> +
> +
> +Maintenance
> +-----------
> +
> +Send patches, comments or questions to openembedded-devel@lists.openembe=
dded.org
> +
> +When sending single patches, please using something like:
> +'git send-email -1 --to  openembedded-devel@lists.openembedded.org --cc =
akuster@mvista.com --subject-prefix=3Dmeta-security][PATCH'
> +
> +Maintainer:    Armin Kuster <akuster@mvista.com>
> +
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-r=
c2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> new file mode 100644
> index 0000000..6860419
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION =3D "wireshark - a popular network protocol analyzer"
> +HOMEPAGE =3D "http://www.wireshark.org"
> +SECTION =3D "network"
> +LICENSE =3D "GPL-2.0"
> +
> +DEPENDS =3D "perl-native libpcap pcre expat glib-2.0 libsmi"
> +
> +inherit autotools
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +# Works with either gtk+ or gtk3.
> +WHICH_GTK =3D "gtk3"
> +
> +PACKAGECONFIG ??=3D "gnutls gcrypt"
> +PACKAGECONFIG +=3D " ${@bb.utils.contains("IMAGE_FEATURES", "x11-base", =
"${WHICH_GTK}  graphics", "", d)}"
> +
> +PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ip=
v6", "", d)}"
> +
> +PACKAGECONFIG[gtk2] =3D "--with-gtk2=3Dyes, --with-gtk2=3Dno, gtk+"
> +PACKAGECONFIG[gtk3] =3D "--with-gtk3=3Dyes, --with-gtk3=3Dno, gtk+3"
> +PACKAGECONFIG[graphics] =3D "--enable-wireshark, --disable-wireshark,"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> +PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --with-gnutls=3Dno, gnut=
ls"
> +PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, libg=
crypt"
> +
> +EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dno -enable-tshark"
> +
> +LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
> +SRC_URI =3D "http://wiresharkdownloads.riverbed.com/wireshark/src/wiresh=
ark-1.12.0-rc2.tar.bz2 "
> +   =20
> +SRC_URI[md5sum] =3D "dc1149073066a29f91116c168558262e"
> +SRC_URI[sha256sum]=3D "31009bb450126e9b12808267419f31016d14e6fde7b5e39c8=
5ad37459908cffb"
> +
> +do_configure_prepend() {
> +    # force to use fallback=20
> +    sed -i -e '/^glib_prefix/s/=3D.*$/=3D""/' ${S}/aclocal-flags
> +}
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gTY1JhLGodeuSBqf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPMOFQACgkQN1Ujt2V2gBxytACfVGinLvxTGH2Pq8xORMFhhvLA
qY4AoIHzVDL3M0nXQZXFSehOr49xp+JV
=ub9A
-----END PGP SIGNATURE-----

--gTY1JhLGodeuSBqf--
