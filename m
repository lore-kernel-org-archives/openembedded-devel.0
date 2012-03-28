Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCttX-00082x-9u
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 16:30:39 +0200
Received: by wgbds1 with SMTP id ds1so4195492wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CkRgn7laNLfiDUT57JcZWH86z4zJldKpRwyucxZzHTs=;
	b=YWEm0F5gaP2ookn3y2S3b8tQFQx8ml2dvuL8Y/Zf6jKvry5EBvZ9gB8lVRTo8rb4Hi
	KW/7d1GUzFFxb3WgxMf9hy5QvPg85Zb1dvHOxESP6mKAkRQL+f9K4Kl5RHESLQP2ICTM
	hok2ZrzuTIRsLuYKkKhoH+BS/+fJcEZRNxYQTkewXyR1KxVgf+78sWcd/06JNgQZma++
	sNafYEXHpui6EDeZpssfrRvsWMy2rBds45TIpzkx/uw8xfov4YiKKs5HCSti6E6KX51L
	T/SXZHn40kzwBCWYKowGjXm5wY/02REgE8aUrLHU2jBF/U/POFiS3usLY7i43Ph9ACk8
	ZTTg==
Received: by 10.180.82.136 with SMTP id i8mr7469582wiy.19.1332944496997;
	Wed, 28 Mar 2012 07:21:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm58326246wib.2.2012.03.28.07.21.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 07:21:34 -0700 (PDT)
Date: Wed, 28 Mar 2012 16:21:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120328142134.GC4004@jama.jama.net>
References: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
	<1332360619-3060-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1332360619-3060-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 1/2] midori: remove midori.inc and oe-stylize
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
X-List-Received-Date: Wed, 28 Mar 2012 14:30:39 -0000
X-Groupsio-MsgNum: 38037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline

--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 09:10:18PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta-oe/recipes-connectivity/midori/midori.inc     |   39 --------------=
-----
>  .../recipes-connectivity/midori/midori_0.4.4.bb    |   41 ++++++++++++++=
++++-
>  2 files changed, 38 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/midori/midori.inc
>=20
> diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/rec=
ipes-connectivity/midori/midori.inc
> deleted file mode 100644
> index dccb3ee..0000000
> --- a/meta-oe/recipes-connectivity/midori/midori.inc
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -DESCRIPTION =3D "Midori is a lightweight web browser."
> -HOMEPAGE =3D "http://www.twotoasts.de/index.php?/pages/midori_summary.ht=
ml"
> -LICENSE =3D "LGPLv2.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> -
> -DEPENDS =3D "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-n=
ative python-docutils-native"
> -
> -inherit gtk-icon-cache pkgconfig
> -
> -do_configure() {
> -    sed -i -e 's:, shell=3DFalse::g' -e s:/usr/X11R6/include::g -e s:/us=
r/X11R6/lib::g wscript
> -    ./configure \
> -            --prefix=3D${prefix} \
> -            --bindir=3D${bindir} \
> -            --sbindir=3D${sbindir} \
> -            --libexecdir=3D${libexecdir} \
> -            --datadir=3D${datadir} \
> -            --sysconfdir=3D${sysconfdir} \
> -            --sharedstatedir=3D${sharedstatedir} \
> -            --localstatedir=3D${localstatedir} \
> -            --libdir=3D${libdir} \
> -            --includedir=3D${includedir} \
> -            --infodir=3D${infodir} \
> -            --mandir=3D${mandir} \
> -            --disable-hildon \
> -            --disable-gtk3 \
> -}
> -
> -LDFLAGS_append =3D " -ljavascriptcoregtk-1.0 "
> -
> -do_install() {
> -	oe_runmake DESTDIR=3D${D} install
> -}
> -
> -RRECOMMENDS_${PN} +=3D "glib-networking ca-certificates gnome-icon-theme"
> -
> -FILES_${PN}-dev +=3D "${datadir}/vala/vapi"
> -
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb b/meta-o=
e/recipes-connectivity/midori/midori_0.4.4.bb
> index 827eb19..87855b1 100644
> --- a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
> +++ b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
> @@ -1,8 +1,43 @@
> -require midori.inc
> -
> -PARALLEL_MAKE =3D ""
> +DESCRIPTION =3D "Midori is a lightweight web browser."
> +HOMEPAGE =3D "http://www.twotoasts.de/index.php?/pages/midori_summary.ht=
ml"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +DEPENDS =3D "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-n=
ative python-docutils-native"
> =20
>  SRC_URI =3D "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.ta=
r.bz2;name=3Dmidori \
>            "
>  SRC_URI[midori.md5sum] =3D "a6578ebfd237c0f22cce49113b95f70c"
>  SRC_URI[midori.sha256sum] =3D "fadd43f76c1c9f6a16483e60a804e58fb6817c6a5=
95b1acdd59bcbdd7b35bca2"
> +
> +inherit gtk-icon-cache pkgconfig
> +
> +do_configure() {
> +    sed -i -e 's:, shell=3DFalse::g' -e s:/usr/X11R6/include::g -e s:/us=
r/X11R6/lib::g wscript
> +    ./configure \
> +            --prefix=3D${prefix} \
> +            --bindir=3D${bindir} \
> +            --sbindir=3D${sbindir} \
> +            --libexecdir=3D${libexecdir} \
> +            --datadir=3D${datadir} \
> +            --sysconfdir=3D${sysconfdir} \
> +            --sharedstatedir=3D${sharedstatedir} \
> +            --localstatedir=3D${localstatedir} \
> +            --libdir=3D${libdir} \
> +            --includedir=3D${includedir} \
> +            --infodir=3D${infodir} \
> +            --mandir=3D${mandir} \
> +            --disable-hildon \
> +            --disable-gtk3 \
> +}
> +
> +PARALLEL_MAKE =3D ""
> +LDFLAGS_append =3D " -ljavascriptcoregtk-1.0 "
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +}
> +
> +RRECOMMENDS_${PN} +=3D "glib-networking ca-certificates gnome-icon-theme"
> +
> +FILES_${PN}-dev +=3D "${datadir}/vala/vapi"
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk9zHm4ACgkQN1Ujt2V2gBznrQCgrsYNtLoUSV5KXxu8UVWe+tX8
agYAnRN+NGliq3d6GyJ5qAWIijZ26h69
=px40
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
