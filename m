Return-Path: <eric@eukrea.com>
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC9D6007B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:14:22 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id E378ED4807B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 10:14:19 +0200 (CEST)
Date: Mon, 23 Sep 2013 10:14:18 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130923101418.4afd4092@e6520eb>
In-Reply-To: <1379923935-28909-1-git-send-email-eric@eukrea.com>
References: <1379923935-28909-1-git-send-email-eric@eukrea.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] gnokii: add 0.6.31
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
X-List-Received-Date: Mon, 23 Sep 2013 08:14:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Mon, 23 Sep 2013 10:12:15 +0200,
Eric B=E9nard <eric@eukrea.com> a =E9crit :

> - was backported from oe-classic and upgraded to last version
> - X11 configuration is not tested
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../recipes-connectivity/gnokii/gnokii_0.6.31.bb   | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-=
oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
> new file mode 100644
> index 0000000..511eaa3
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Cellphone tools and driver software"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +SRC_URI =3D "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2"
> +
> +DEPENDS =3D "glib-2.0"
> +X11DEPENDS =3D " libxpm gtk+"
> +
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)}"
> +PACKAGECONFIG[x11] =3D "--with-x-toolkit=3Dgtk,--without-x,${X11DEPENDS}"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES +=3D "libgnokii libgnokii-dev"
> +
> +EXTRA_OECONF =3D "--without-x --disable-smsd"

forget this one I missed to commit the last fixes

Eric

