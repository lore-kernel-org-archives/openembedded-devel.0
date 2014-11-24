Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E006B7226F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:07:36 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so8292302wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 03:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WPDL6E25zFiZlbJDyTvdEeyMz+fUtoS1oL6VZ1vUnPI=;
	b=UbBdNUd5pbwpieILysmOln4mnt9eOEQQxpYdg8dFHHk7TYMxXyqmJ85eFZ4QFlVf4A
	39v8hpHtGdvzxmQjBcsgXEo8fH0BJivhqXWSjQjOXdGRbO3ap/ztzRqQuI09z5jOxl41
	p16KSeuvbEScHew0BmO+dZmeX2/r0BRvX5K51DZXncGsjvxw/zJriOds5AINfgwnTn5E
	4eu1VXMYI8lbaHo/4ExtjFZYUgLHgyCPBRWODr8i+D/nsbPhknUPwuNC1TB/jnVl9DtU
	fv1tHM0gVPDH+hWkCwm8atyXgqcsPS5TN7SfGqrdnoMcWmrRzNxm4fFZh2xD5ZPS4uyG
	uR7A==
X-Received: by 10.180.91.36 with SMTP id cb4mr11628828wib.30.1416827256293;
	Mon, 24 Nov 2014 03:07:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mu4sm11565237wib.2.2014.11.24.03.07.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 03:07:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Nov 2014 12:07:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141124110744.GA2456@jama>
References: <1416439433-4328-1-git-send-email-alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1416439433-4328-1-git-send-email-alejandro.hernandez@linux.intel.com>
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
X-List-Received-Date: Mon, 24 Nov 2014 11:07:39 -0000
X-Groupsio-MsgNum: 53005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 05:23:53PM -0600, Alejandro Hernandez wrote:
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  .../gsettings-desktop-schemas_3.14.1.bb                  | 16 ++++++++++=
++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gsettings-desktop-schemas/gs=
ettings-desktop-schemas_3.14.1.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings=
-desktop-schemas_3.14.1.bb b/meta-gnome/recipes-gnome/gsettings-desktop-sch=
emas/gsettings-desktop-schemas_3.14.1.bb
> new file mode 100644
> index 0000000..844d0cd
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_3.14.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "GNOME desktop-wide GSettings schemas"
> +HOMEPAGE =3D "http://live.gnome.org/gsettings-desktop-schemas"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +PR =3D "r1"

Drop PR

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

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRzEYAACgkQN1Ujt2V2gBzZlgCdGRxvBpg/oA4golSXaZ88T/C5
ZlQAoJJQgolitMjEhRp0eZDqztlN59rg
=yEjT
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
