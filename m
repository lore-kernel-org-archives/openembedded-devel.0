Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 45923725E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 12:44:40 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so11059654wiv.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RbQ/ip5VcZ7T3jJOOXGiR3b8GhCBAGONvKnlh88wVFU=;
	b=PrcRIgey/GGJFREAlSVCue4OuD94+vNpcTPktgTEI6re04OotVzvCfc3D9lpopoT5K
	HEK/89Uj6NuTkVMtc0wDs/owW5YQRwdfdITRWBESWYrNUvfojGfnCmNe7M0pSuTAOz5D
	iF0HufEbMJ5oZ7NoGK8Stf7JfXKIdWVT7TvZiArg2AaqbAO/a42CqTZRhLzwMwywhhId
	DYp9W0hoJkFTrKoGpy9vP+v/hBkkkGVsp2dfru3kbUJdp1cKHBz0maUUN+wLiHucW1yV
	S5VVroxeV5WxKWNrl72Ub4r+6rhCLgo7masIHfUpub2fJPNEfmmMJ1gdcN3drJO/OI3j
	O40w==
X-Received: by 10.180.104.197 with SMTP id gg5mr6135987wib.7.1418215481102;
	Wed, 10 Dec 2014 04:44:41 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l9sm17783462wic.21.2014.12.10.04.44.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 04:44:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Dec 2014 13:44:43 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141210124443.GD2473@jama>
References: <1417457354-6636-1-git-send-email-alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1417457354-6636-1-git-send-email-alejandro.hernandez@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-gnome][PATCH] gsettings-desktop-schemas: Moved from OE-Core
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
X-List-Received-Date: Wed, 10 Dec 2014 12:44:43 -0000
X-Groupsio-MsgNum: 53265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline

--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2014 at 12:09:14PM -0600, Alejandro Hernandez wrote:
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

Is there patch to remove it from oe-core?

> ---
>  .../gsettings-desktop-schemas_3.14.1.bb                   | 15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gsettings-desktop-schemas/gs=
ettings-desktop-schemas_3.14.1.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings=
-desktop-schemas_3.14.1.bb b/meta-gnome/recipes-gnome/gsettings-desktop-sch=
emas/gsettings-desktop-schemas_3.14.1.bb
> new file mode 100644
> index 0000000..e6d1d1a
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_3.14.1.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "GNOME desktop-wide GSettings schemas"
> +HOMEPAGE =3D "http://live.gnome.org/gsettings-desktop-schemas"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +DEPENDS =3D "glib-2.0 intltool-native gobject-introspection-stub-native"
> +
> +inherit gnomebase gsettings gettext
> +
> +GNOME_COMPRESS_TYPE =3D "xz"
> +
> +SRC_URI[archive.md5sum] =3D "92d41934212fc7da48648afa3927f4b0"
> +SRC_URI[archive.sha256sum] =3D "217eba09f0fb263dcb8ce6efa21c9afaf0504ac1=
d937732d1af1c6724c05f065"
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

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlSIQDsACgkQN1Ujt2V2gBw5DwCgmusJxlMfmRQd0CQ6tcHnmiBf
+vcAmLYkvuhGb+X0OjebZS06AfHwZaw=
=LUYF
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
