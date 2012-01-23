Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RpEfL-0003UU-8z
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 08:50:11 +0100
Received: (qmail invoked by alias); 23 Jan 2012 07:42:27 -0000
Received: from p5B0A202F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.32.47]
	by mail.gmx.net (mp006) with SMTP; 23 Jan 2012 08:42:27 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18zuRI63rwz8aOhVBCNHBaVJ9KyFhlUxL1vk9HMVc
	z/1PQGSKvT4J/v
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 08:44:20 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1327303469-12803-1-git-send-email-schnitzeltony@gmx.de>
	<1327303469-12803-2-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1327303469-12803-2-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201201230844.20204.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe 2/3] gegl: initial add 0.1.8
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
X-List-Received-Date: Mon, 23 Jan 2012 07:50:11 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday, January 23, 2012 08:24:28 AM Andreas M=C3=BCller wrote:
> based on oe-classic [1]
>=20
> [1] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gegl_git.=
bb
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de>
> ---
>  meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb
>=20
> diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb
> b/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb new file mode 100644
> index 0000000..5ae2082
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gegl/gegl_0.1.8.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "GEGL (Generic Graphics Library) is a graph based image
> processing framework." +LICENSE =3D "LGPL-3.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +DEPENDS =3D "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jp=
eg
> virtual/libsdl" +
> +inherit gnome
> +
> +EXTRA_OECONF =3D "--disable-docs "
> +
> +SRC_URI =3D "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "c8279b86b3d584ee4f503839fc500425"
> +SRC_URI[sha256sum] =3D
> "106b9574b6d5fb282683794f7a7f090a1a3f4a388890e592b202827a4ca76f75" +
> +FILES_${PN} +=3D "${libdir}/gegl-*/*.so"
> +FILES_${PN}-dev +=3D "${libdir}/gegl-*/*.la"
> +FILES_${PN}-dbg +=3D "${libdir}/gegl-*/.debug"
Hm seems 1+3 got lost. Will resend..

Andreas


