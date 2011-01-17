Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PevUs-0007hz-1V
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 21:16:14 +0100
Received: by iwn8 with SMTP id 8so5082239iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 12:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=GF/KrZlRRwNUVdoPMyZTzqVP9NOmJHMQZbbk9lVi7es=;
	b=HY7DLskNC6LEZNaYZbfGdp0/xmlU08wwu8xDyX/aL8G0Gm0MxcWoVLM+8fqYlFGbZh
	elkvcP1vXmd1iQsAzekOM4tGrghjVQ16ghVuoPT5AF0y/W+cgywynzpy8hVSB0lhzeml
	BNnba/BzcJGihdgg/S/DcTHlgU5LHbT8XfX5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=t3VCS8pydL5EoXybzio0pFapkaX7R78I8zq7Wgn6GUmR4HwJAaSHbSJ8qpup2MOOYJ
	rNh1YROEpGXjpQu7dwpVAk4Q5e5PGrl3P/kXXU7yE2nklk1DQSFKXLAuPEjcnFDjW9lT
	PtZ43CqYqlc2QZ5BdKZyyCkM9B+SB+2gzKXWA=
Received: by 10.42.164.9 with SMTP id e9mr90136icy.5.1295295337485; Mon, 17
	Jan 2011 12:15:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Mon, 17 Jan 2011 12:15:17 -0800 (PST)
In-Reply-To: <1295283968-2540-1-git-send-email-schnitzeltony@gmx.de>
References: <1295283968-2540-1-git-send-email-schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jan 2011 12:15:17 -0800
Message-ID: <AANLkTi=5rSdha0uH7QwETJaGo2TF_yY6GZL-iBgw4vZ4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] clutter: configure all libs with "--disable-introspection"
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
X-List-Received-Date: Mon, 17 Jan 2011 20:16:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

why do we need to disable it you did not explain

On Mon, Jan 17, 2011 at 9:06 AM, Andreas Mueller <schnitzeltony@gmx.de> wro=
te:
>why
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
> =C2=A0recipes/clutter/clutter-box2d.inc | =C2=A0 =C2=A04 +++-
> =C2=A0recipes/clutter/clutter-gst.inc =C2=A0 | =C2=A0 =C2=A04 +++-
> =C2=A0recipes/clutter/clutter-gtk.inc =C2=A0 | =C2=A0 =C2=A04 +++-
> =C2=A0recipes/clutter/clutter.inc =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 +=
+--
> =C2=A04 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/clutter/clutter-box2d.inc b/recipes/clutter/clutter-=
box2d.inc
> index 7541335..395109e 100644
> --- a/recipes/clutter/clutter-box2d.inc
> +++ b/recipes/clutter/clutter-box2d.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "LGPLv2.1"
>
> =C2=A0DEPENDS =3D "clutter"
>
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>
> =C2=A0# The main clutter lib is machine specific so we need to be too
> =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> @@ -13,6 +13,8 @@ inherit autotools pkgconfig gtk-doc
>
> =C2=A0require clutter-common.inc
>
> +EXTRA_OECONF =3D "--disable-introspection"
> +
> =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make_all_execs_installable
> =C2=A0}
> diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gs=
t.inc
> index b25f31e..814f493 100644
> --- a/recipes/clutter/clutter-gst.inc
> +++ b/recipes/clutter/clutter-gst.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Clutter GStreamer integration library"
> =C2=A0HOMEPAGE =3D "http://www.clutter-project.org/"
> =C2=A0LICENSE =3D "LGPLv2.1"
>
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>
> =C2=A0DEPENDS =3D "clutter gstreamer gst-plugins-base"
>
> @@ -10,6 +10,8 @@ require clutter-common.inc
>
> =C2=A0inherit autotools pkgconfig
>
> +EXTRA_OECONF =3D "--disable-introspection"
> +
> =C2=A0align_examples_data_location() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for full_name in $(find ${S}/examples -name *.=
png) ; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data_name=3D${full=
_name##*/}
> diff --git a/recipes/clutter/clutter-gtk.inc b/recipes/clutter/clutter-gt=
k.inc
> index 6e624c5..a4ada7f 100644
> --- a/recipes/clutter/clutter-gtk.inc
> +++ b/recipes/clutter/clutter-gtk.inc
> @@ -2,13 +2,15 @@ DESCRIPTION =3D "Clutter GTK+ integration library"
> =C2=A0HOMEPAGE =3D "http://www.clutter-project.org/"
> =C2=A0LICENSE =3D "LGPLv2.1"
>
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>
> =C2=A0DEPENDS =3D "gtk+ clutter"
> =C2=A0require clutter-common.inc
>
> =C2=A0inherit autotools pkgconfig gtk-doc
>
> +EXTRA_OECONF =3D "--disable-introspection"
> +
> =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make_all_execs_installable
>
> diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
> index 84a7af9..2a061af 100644
> --- a/recipes/clutter/clutter.inc
> +++ b/recipes/clutter/clutter.inc
> @@ -9,7 +9,7 @@ INC_SRC_URI =3D "file://sample.desktop \
> =C2=A0PARALLEL_MAKE =3D ""
>
> =C2=A0STDDEPENDS =3D "virtual/libx11 gtk-doc-native pango glib-2.0 libxfi=
xes gtk+"
> -BASE_CONF =3D "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --en=
able-conformance "
> +BASE_CONF =3D "--disable-introspection --disable-gtk-doc ${@get_clutter_=
fpu_setting(bb, d)} --enable-conformance "
>
> =C2=A0DEPENDS =3D "${STDDEPENDS} virtual/libgl"
> =C2=A0EXTRA_OECONF =3D "${BASE_CONF} --with-flavour=3Dglx"
> @@ -41,7 +41,7 @@ EXTRA_OECONF_mx31ads =3D "${BASE_CONF} --with-flavour=
=3Deglnative"
> =C2=A0PACKAGE_ARCH_mx31ads =3D "${MACHINE_ARCH}"
> =C2=A0LDFLAGS_append_mx31ads =3D " -lpvrNULLWSEGL -lstdc++ "
>
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>
> =C2=A0inherit autotools pkgconfig gtk-doc
>
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


