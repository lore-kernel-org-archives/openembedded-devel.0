Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6jH1-0006vJ-AP
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 16:29:39 +0200
Received: by pbcwy7 with SMTP id wy7so1369639pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=BOmW72bdDvynhDqgnGcD5GNjMaeD9NOctLYW7qCY1P0=;
	b=QG6CwjxdIt/KxzhfMEGYy4ZFv7vvV7v8t9KA4XV8lLC9STsex/6SD0i1UpO3bQNWLc
	ulY/96ergcIJlknHIUVG4lg2PTCufiTThxTf7T5Pdq/ff3gJ+Kn/B9g5NfDiMEWDGIVL
	4XXPe7o4fVVOz7/6QZButuYhmaukT2NMdiHl+g9SO1epFthgQxvnpQxTpBvg6W2aKcG+
	MJZVH9wiAZm4L92j7PlGMgA4pWmwVUF+WL7oRaJvjsYTB8yllW5fK58mjJWWpga0L4Ok
	Qv7hkbP0ejIB+Cn/sdvACCQCy9lMIWOzAK2hYKsOeoa7lcT0QCLOGYyesp7av81s1l5J
	PNew==
Received: by 10.68.227.165 with SMTP id sb5mr5214086pbc.82.1346249844392;
	Wed, 29 Aug 2012 07:17:24 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id qb6sm19442696pbb.18.2012.08.29.07.17.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 07:17:22 -0700 (PDT)
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Aug 2012 07:17:21 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 14:29:39 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

A bit explanation as to why it's done will be nice.=20
Why comment out instead delete =20
Is this window menu patch needed somewhere else
If not it must go as well=20

On Aug 29, 2012, at 6:32 AM, Ross Burton <ross.burton@intel.com> wrote:

> ---
> meta-gnome/recipes-gnome/pimlico/contacts.inc |    4 +---
> meta-gnome/recipes-gnome/pimlico/dates.inc    |    4 +---
> meta-gnome/recipes-gnome/pimlico/tasks.inc    |    2 --
> 3 files changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/pimlico/contacts.inc b/meta-gnome/re=
cipes-gnome/pimlico/contacts.inc
> index 9798985..04de63c 100644
> --- a/meta-gnome/recipes-gnome/pimlico/contacts.inc
> +++ b/meta-gnome/recipes-gnome/pimlico/contacts.inc
> @@ -5,13 +5,11 @@ BUGTRACKER =3D "https://bugzilla.gnome.org/"
> LICENSE =3D "GPLv2 & GPLv2+ & GPLv3+ "
> SECTION =3D "x11"
> DEPENDS =3D "glib-2.0 gtk+ evolution-data-server"
> -DEPENDS_append_poky =3D " libowl"
> RDEPENDS_${PN} =3D "libedata-book"
>=20
> inherit autotools pkgconfig
>=20
> OWL =3D "--disable-owl"
> -OWL_poky =3D "--enable-owl"
>=20
> EXTRA_OECONF +=3D "--disable-gnome-vfs ${OWL}"
> EXTRA_OEMAKE +=3D "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=3D1"
> @@ -31,4 +29,4 @@ SRC_URI =3D "file://stock_contact.png \
>            file://contacts-conditionally-install-schema.patch \
>           "
>=20
> -SRC_URI_append_poky =3D " file://contacts-owl-window-menu.patch;apply=3Dy=
es "
> +#SRC_URI_append_poky =3D " file://contacts-owl-window-menu.patch;apply=3D=
yes "
> diff --git a/meta-gnome/recipes-gnome/pimlico/dates.inc b/meta-gnome/recip=
es-gnome/pimlico/dates.inc
> index 9b338fd..3c4a048 100644
> --- a/meta-gnome/recipes-gnome/pimlico/dates.inc
> +++ b/meta-gnome/recipes-gnome/pimlico/dates.inc
> @@ -12,9 +12,7 @@ inherit autotools gettext pkgconfig gtk-icon-cache
>=20
> # Poky/Sato specific enhancements
> OWL =3D "--disable-owl"
> -OWL_poky =3D "--enable-owl --disable-dnd"
>=20
> EXTRA_OECONF +=3D "${OWL}"
> -DEPENDS_append_poky =3D " libowl"
> -SRC_URI_append_poky =3D " file://dates-owl-window-menu.patch;apply=3Dyes "=

> +#SRC_URI_append_poky =3D " file://dates-owl-window-menu.patch;apply=3Dyes=
 "
>=20
> diff --git a/meta-gnome/recipes-gnome/pimlico/tasks.inc b/meta-gnome/recip=
es-gnome/pimlico/tasks.inc
> index 9cd5259..a952153 100644
> --- a/meta-gnome/recipes-gnome/pimlico/tasks.inc
> +++ b/meta-gnome/recipes-gnome/pimlico/tasks.inc
> @@ -6,11 +6,9 @@ LICENSE =3D "GPLv2 & GPLv2+"
>=20
> SECTION =3D "x11"
> DEPENDS =3D "glib-2.0 gtk+ evolution-data-server"
> -DEPENDS_append_poky =3D " libowl"
>=20
> inherit autotools pkgconfig gtk-icon-cache
>=20
> OWL ?=3D "--disable-owl"
> -OWL_poky ?=3D "--enable-owl"
>=20
> EXTRA_OECONF +=3D "${OWL}"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


