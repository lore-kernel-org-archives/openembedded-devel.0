Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxdC9-0003dk-3e
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:43:35 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so3960770pbb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LuQYc4frqZIu277DqnCnQONWRnqPQv9QntHUodvvmQk=;
	b=xza7EGstpNrgEoQ+Z1pIe3E3zi2Dj9AIFrtt8qVzZ+mIsuMB/SCftcZ8CCgSOfX3W+
	ytheNILv4rWZ65TemdwkmrNpgF9pdEYYWmCRy6G0x5PF8SGxKrF5RB29KqpxMZPgOd2l
	dg9KlGqXpEAeJYCO8o2OAhDCrITQFwIhQaAADzgbkx6l+GHTq4GlT1KV8GFUaBMEy13T
	sA8YLUF0HgZqjmU0vPhSkPiPzGudPnJqXfXnuo71CK2/ZFEIBkzrUnNcUqHWw+HIJY24
	BTNTV5k278Ilk6SNsLQ4BlNoBqEwhIQIk/ysn5ZDh6wCaSzjtSqe+hjidJTWgpFML2H+
	uNsA==
X-Received: by 10.68.137.167 with SMTP id qj7mr56918759pbb.148.1358857666346; 
	Tue, 22 Jan 2013 04:27:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a4sm11335485pax.25.2013.01.22.04.27.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:27:45 -0800 (PST)
Date: Tue, 22 Jan 2013 13:27:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130122122745.GQ29386@jama.palm1.palmone.com>
References: <1358712214-21396-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1358712214-21396-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome][PATCH] metacity: add, from oe-core
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
X-List-Received-Date: Tue, 22 Jan 2013 12:43:39 -0000
X-Groupsio-MsgNum: 42796
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Ocr+Jy+jPJR1APa"
Content-Disposition: inline

--/Ocr+Jy+jPJR1APa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 20, 2013 at 08:03:34PM +0000, Ross Burton wrote:
> Metacity, the GNOME 2 window manager.  Moved from oe-core as it's never u=
sed nor
> tested there.

Merged, thanks

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../metacity/remove-yelp-help-rules-var.patch      |   28 ++++++++++++++=
++++
>  .../recipes-gnome/metacity/metacity_2.34.13.bb     |   30 ++++++++++++++=
++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yel=
p-help-rules-var.patch
>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
>=20
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-=
rules-var.patch b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-he=
lp-rules-var.patch
> new file mode 100644
> index 0000000..1970e9a
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-v=
ar.patch
> @@ -0,0 +1,28 @@
> +Remove unused variable (YELP_HELP_RULES)
> +
> +Upstream-Status: Pending
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Index: metacity-2.34.13/doc/creating_themes/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
> ++++ metacity-2.34.13/doc/creating_themes/Makefile.am
> +@@ -1,6 +1,5 @@
> + ### This part of Makefile.am can be customized by you.
> +=20
> +-@YELP_HELP_RULES@
> +=20
> + # The name of the directory in /usr/share/gnome/help/,=20
> + # and the name of the main .xml file:
> +Index: metacity-2.34.13/doc/creating_themes/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
> ++++ metacity-2.34.13/doc/creating_themes/Makefile.in
> +@@ -455,7 +455,6 @@ uninstall-am:
> + 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
> +=20
> +=20
> +-@YELP_HELP_RULES@
> +=20
> + # Tell versions [3.59,3.63) of GNU make to not export all variables.
> + # Otherwise a system limit (for SysV at least) may be exceeded.
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta=
-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> new file mode 100644
> index 0000000..3605201
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
> @@ -0,0 +1,30 @@
> +SECTION =3D "x11/wm"
> +DESCRIPTION =3D "Metacity is the boring window manager for the adult in =
you."
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> +                    file://src/include/main.h;endline=3D24;md5=3Dc2242df=
552c880280315989bab626b90"
> +
> +DEPENDS =3D "gsettings-desktop-schemas startup-notification gtk+ gconf g=
dk-pixbuf-native libcanberra gnome-doc-utils"
> +PR =3D "r0"
> +
> +inherit gnome update-alternatives
> +
> +GNOME_COMPRESS_TYPE =3D "xz"
> +
> +SRC_URI +=3D "file://remove-yelp-help-rules-var.patch"
> +SRC_URI[archive.md5sum] =3D "6d89b71672d4fa49fc87f83d610d0ef6"
> +SRC_URI[archive.sha256sum] =3D "8cf4dbf0da0a6f36357ce7db7f829ec685908a77=
92453c662fb8184572b91075"
> +
> +ALTERNATIVE_${PN} =3D "x-window-manager"
> +ALTERNATIVE_TARGET[x-window-manager] =3D "${bindir}/metacity"
> +ALTERNATIVE_PRIORITY =3D "10"
> +
> +EXTRA_OECONF +=3D "--disable-verbose \
> +	         --disable-xinerama"
> +
> +do_configure_prepend() {
> +	sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
> +}
> +
> +FILES_${PN} +=3D "${datadir}/themes ${datadir}/gnome-control-center ${da=
tadir}/gnome"
> +
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

--/Ocr+Jy+jPJR1APa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+hcEACgkQN1Ujt2V2gBw/IACfehcvRbV7jMYGIqJF8ZyTKySr
P1EAoLMUEYiIACkjYkJRoaDFnasi/IlK
=rsri
-----END PGP SIGNATURE-----

--/Ocr+Jy+jPJR1APa--
