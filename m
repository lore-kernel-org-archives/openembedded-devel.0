Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RF0AE-0005NW-Th
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 11:04:18 +0200
Received: (qmail invoked by alias); 15 Oct 2011 08:58:32 -0000
Received: from p5B0A217F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.33.127]
	by mail.gmx.net (mp060) with SMTP; 15 Oct 2011 10:58:32 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/7rgUYd3b7hvgE//KYcn4k1hjXgOLlY46KSVHHKO
	pc3+9boFmf4Bem
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Oct 2011 11:03:02 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1318585385-18541-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1318585385-18541-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201110151103.02690.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] xfwm4: update to 4.8.2
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
X-List-Received-Date: Sat, 15 Oct 2011 09:04:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, October 14, 2011 11:43:05 AM Koen Kooi wrote:

Acked-by: Andreas M=FCller <schnitzeltony@gmx.de>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../xfwm4/xfwm4/relative-symlinks-docs.patch       |    5 +++++
>  .../xfwm4/{xfwm4_4.8.1.bb =3D> xfwm4_4.8.2.bb}       |    8 +++-----
>  2 files changed, 8 insertions(+), 5 deletions(-)
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.8.1.bb =3D> xfwm4_4.8.2.bb}=
 (87%)
>=20
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.pa=
tch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
> index 4e855e4..67433ee 100644
> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
> @@ -7,6 +7,11 @@ Subject: [PATCH] docs: On installation create relative p=
aths in symlinks to
> =20
>  Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
>  ---
> +
> +Upstream-Status: accepted
> +
> +http://git.xfce.org/xfce/xfwm4/commit/?h=3Dxfce-4.8&id=3D08b6d60056d7ca9=
884a46d6b92e77c9fc68ce8c5
> +
>   doc/manual/Makefile.am |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
> =20
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb b/meta-xfce/reci=
pes-xfce/xfwm4/xfwm4_4.8.2.bb
> similarity index 87%
> rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb
> rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
> index e31471d..c1ad221 100644
> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
> @@ -3,9 +3,6 @@ SECTION =3D "x11/wm"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7599=
855"
>  DEPENDS =3D "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf l=
ibwnck dbus-glib startup-notification"
> -RDEPENDS_${PN} =3D "xfwm4-theme-default"
> -
> -PR =3D "r0"
> =20
>  inherit xfce update-alternatives
> =20
> @@ -13,6 +10,8 @@ inherit xfce update-alternatives
>  SRC_URI +=3D " \
>      file://relative-symlinks-docs.patch \
>  "
> +SRC_URI[md5sum] =3D "41b730d5abf39a69fc3b221728ddaa75"
> +SRC_URI[sha256sum] =3D "6db2a6148d63d45699dbf6403fb227f8cbd529dcec7ee082=
7342940c442b0747"
> =20
>  EXTRA_OECONF +=3D " --enable-startup-notification"
> =20
> @@ -28,10 +27,9 @@ ALTERNATIVE_LINK =3D "${bindir}/x-window-manager"
>  ALTERNATIVE_PATH =3D "${bindir}/xfce4-session"
>  ALTERNATIVE_PRIORITY =3D "30"
> =20
> +RDEPENDS_${PN} =3D "xfwm4-theme-default"
>  FILES_${PN} +=3D "${libdir}/xfce4/xfwm4/helper-dialog \
>                  ${datadir}/xfwm4/defaults \
>                 "
>  FILES_${PN}-dbg +=3D "${libexecdir}/xfce4/xfwm4/.debug/*"
> =20
> -SRC_URI[md5sum] =3D "447433dca613180ebd6cfed4beb1c1c9"
> -SRC_URI[sha256sum] =3D "6a3cbf6c92a0cc3bcaf7cf2565c35beae6354768ec26b4d6=
16a3c2544a8f8499"
>=20


