Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 484C76073A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2923; q=dns/txt; s=axis-central1;
	t=1582203128; x=1613739128;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=NQN49sLWky2mfBMtwD/IbvIs6VJJv0v2YWXI2BGK49o=;
	b=Eg1yX8QgLqIZVhhsPCOgDNEhMb9+pwiG7FSuzmz3BNUyHX/zOEtFK/L2
	sWpqgTBHnN4OeBc50pPZ/V8XuA87scJGYOSX94FkB/saWfiQqmRB5JEFH
	XygKr6xtTLzLGeaxTMMmKH19i/OdaO/FQGxBEwQlPE9r42JZhms2+EfpJ
	x1LBNwJOhAfUQwJ8tNa+XB3K3iYhSrl9eYmPYVBESPm/D8EcTNIKhGaMm
	c1v5yatmfos71M2JUQnEW1Vk2dP7RjlFXjo4DSmHs/1e4Jvoyupyf6OBi
	sFt3Nt+AbBw6gEn23zBUJK2kM/qtrqAXs9gQl+MnHqa9cM3Kcl2FrFIL6 A==;
IronPort-SDR: 1fWhKGTE1QfVlF18iupwsmyXjsWIX3H6ul1R5ykyPl/ZotfM6XnsBECZv57wWwGOjj8DYJ9p5P
	zIO16M2+jX1CIZ+LGKdlOTMyNRUVaqwWi9qvqwyLDVlDOlkK+0j/ghnMenQvV+eIgqyMHF2YHD
	S/TMc9eHCkVHP4/yBqHERtFhVeV3cfbfh+OyCZfdUV/KnCI8kf5Uvyoa68G3trPIOnouf0TKHc
	np02Nkz8kLbvyMBrKuWkkEWzsKsndiU3mMycgfJyEM2VbbjQDUz28PdLyWiznNszW4cQm6afwr
	A6o=
X-IronPort-AV: E=Sophos;i="5.70,464,1574118000"; 
   d="scan'208";a="5638273"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jan-Simon Moeller <dl9pf@gmx.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] meta-oe: master: remmina - use
	PACKAGECONFIG	for spice
Thread-Index: AQHV5xvEMB+4z6PEc0CswJcFrigY6qgjzzTg
Date: Thu, 20 Feb 2020 12:52:06 +0000
Message-ID: <2d5076caff4846e4b8df0e5f3edc5f75@XBOX03.axis.com>
References: <20200219115654.25186-1-dl9pf@gmx.de>
In-Reply-To: <20200219115654.25186-1-dl9pf@gmx.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] meta-oe: master: remmina - use PACKAGECONFIG	for spice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 12:52:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Jan-Simon Moeller
> Sent: den 19 februari 2020 12:57
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] meta-oe: master: remmina - use PACKAGECONF=
IG for spice

Change the subject to:

  [meta-oe][PATCH] remmina: use PACKAGECONFIG for spice

The target layer and branch should be specified within [] as they are only=
=20
there for the review process. Typically you only prefix the Git commit=20
subject with "<recipe name>: " and then use, e.g., `git format-patch=20
--subject-prefix=3D'meta-oe][master][PATCH' ...` to create the patch with t=
he=20
appropriate prefixes.

> remmina depends on spice and spice-protocol but they are in meta-networki=
ng.
> Use the PACKAGECONFIG flag to avoid hardcoding the dependency.
>=20
> Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
> ---
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/r=
ecipes-support/remmina/remmina_1.3.6.bb
> index f9963ff65..f9860a11f 100644
> --- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> @@ -5,8 +5,6 @@ LICENSE =3D "GPLv2 & openssl"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddab7215512044d49037272ce1ac4e=
a8f file://LICENSE.OpenSSL;md5=3Dc1eb3cee0a4dea27503c531267a69769"
>  DEPENDS +=3D "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui li=
bsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret"
>=20
> -DEPENDS_append_x86 =3D " spice spice-protocol"
> -DEPENDS_append_x86-64 =3D " spice spice-protocol"
>=20
>  DEPENDS_append_libc-musl =3D " libexecinfo"
>  LDFLAGS_append_libc-musl =3D " -lexecinfo"
> @@ -23,11 +21,7 @@ inherit cmake features_check mime-xdg
>  # depends on avahi-ui with this restriction
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>=20
> -EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWIT=
H_TRANSLATIONS=3DOFF -DWITH_SPICE=3DOFF"
> -
> -EXTRA_OECMAKE_append_x86 =3D " -DWITH_SPICE=3DON"
> -EXTRA_OECMAKE_append_x86-64 =3D " -DWITH_SPICE=3DON"
> -
> +EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWIT=
H_TRANSLATIONS=3DOFF"
>=20
>  do_install_append(){
>      # We dont need the extra stuff form other desktop environments
> @@ -36,6 +30,8 @@ do_install_append(){
>      rm -rf ${D}/${datadir}/gnome-session
>  }
>=20
> +PACKAGECONFIG[spice] =3D "-DWITH_SPICE=3DON, -DWITH_SPICE=3DOFF, spice s=
pice-protocol"
> +

PACKAGECONFIGs are typically placed before inherit in the recipes.

>  RDEPENDS_${PN} =3D "bash"
>=20
>  FILES_${PN}_append =3D " ${datadir}/icons/hicolor/*"
> --
> 2.11.0

//Peter


