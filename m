Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeA2C-0002SP-D6
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 22:17:05 +0200
Received: by mail-ie0-f178.google.com with SMTP id b11so12125555iee.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tu2Eoo+N8Oysi6hg219NcwtzwBvunK/NFNSt4wcC31k=;
	b=g5plhriom9j28T3lneErceZ4Ttk37iyekuwWax8IYgyTeSbwRKizGHqVgtBKi7TJvu
	bbIgoM0xBmeizJOA33v+qh/0yzCcewnNcanEHXFPHD9pdcUpHRk6N5SakWPTLl6HUV+2
	Vs+5GNd0WBI2n3GexYd1+xbIaKUbSYmRu8l7lov4FJrJ9pMVQoLKOZa0xn3CkDzn2ToI
	/Eus3bRhN6IwuODUAWB+8yTagHHlVeKjxCKOue2RxpBsX4aIVOAh3/SJfbnqvgU3FxBj
	uSeOOxAycmIlulq2j78r7+TC2vcqykvuIV2UcKklA5cUtuv2A+RvwMPGVlDUHgJ66xD5
	CZng==
MIME-Version: 1.0
X-Received: by 10.50.87.10 with SMTP id t10mr3578289igz.108.1368993508741;
	Sun, 19 May 2013 12:58:28 -0700 (PDT)
Received: by 10.50.109.133 with HTTP; Sun, 19 May 2013 12:58:28 -0700 (PDT)
In-Reply-To: <1368959233-28288-4-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
	<1368959233-28288-4-git-send-email-schnitzeltony@googlemail.com>
Date: Sun, 19 May 2013 12:58:28 -0700
Message-ID: <CAMKF1soZP1zxrEtopAdi6dTPuRcb5CMnSapgfOE8KCD5t6a-Ow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe++/master 03/11] glibmm: merge glibmm.inc into recipe - and stylize a bit
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
X-List-Received-Date: Sun, 19 May 2013 20:17:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Why merge inc ? Generally its helpful in writing recipes in other layers we
can share common code

On Sunday, May 19, 2013, Andreas M=C3=BCller <schnitzeltony@googlemail.com>
wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-core/glib-2.0/glibmm.inc       |   28
-----------------------
>  meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb |   29
+++++++++++++++++++++--
>  2 files changed, 26 insertions(+), 31 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/glib-2.0/glibmm.inc
>
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm.inc
b/meta-oe/recipes-core/glib-2.0/glibmm.inc
> deleted file mode 100644
> index bdb6ff8..0000000
> --- a/meta-oe/recipes-core/glib-2.0/glibmm.inc
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -DESCRIPTION =3D "C++ bindings for the glib library."
> -HOMEPAGE =3D "http://www.gtkmm.org/"
> -SECTION =3D "libs"
> -
> -LICENSE =3D "LGPLv2.1 & GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499 \
> -
 file://COPYING.tools;md5=3D751419260aa954499f7abaabaa882bbe"
> -
> -DEPENDS =3D "mm-common glib-2.0 libsigc++-2.0"
> -SHRT_VER =3D
"${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
> -
> -SRC_URI =3D "
ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.b=
z2;name=3Darchive
"
> -
> -inherit autotools pkgconfig
> -
> -do_install_append() {
> -    install -d ${D}${datadir}/glibmm-2.4
> -    install -d ${D}${datadir}/aclocal
> -
> -    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
> -    install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/
|| true
> -}
> -
> -FILES_${PN} =3D "${libdir}/lib*.so.*"
> -FILES_${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/
${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
> -
> -LIBV =3D "2.4.0"
> -
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bbb/meta-oe/reci=
pes-core/glib-2.0/
glibmm_2.28.2.bb
> index c864153..0bdaa80 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.28.2.bb
> @@ -1,9 +1,32 @@
> -require glibmm.inc
> +DESCRIPTION =3D "C++ bindings for the glib library."
> +HOMEPAGE =3D "http://www.gtkmm.org/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499 \
> +
 file://COPYING.tools;md5=3D751419260aa954499f7abaabaa882bbe"
> +
> +DEPENDS =3D "mm-common glib-2.0 libsigc++-2.0"
> +inherit autotools pkgconfig
>
>  PR =3D "r3"
>
> +SHRT_VER =3D
"${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
> +
> +SRC_URI =3D " \
> +
ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.b=
z2\
> +    file://remove-examples.patch \
> +    file://glib-2.32.patch \
> +"
>  SRC_URI[archive.md5sum] =3D "cf33d1861d09fb2952a6a1d69e0502e3"
>  SRC_URI[archive.sha256sum] =3D
"7b67178363f8494c94f8b3dd704a4c8db7ad75a253fc84a4ad229e5e179ec192"
>
> -SRC_URI +=3D " file://remove-examples.patch \
> -             file://glib-2.32.patch"
> +do_install_append() {
> +    install -d ${D}${datadir}/glibmm-2.4
> +    install -d ${D}${datadir}/aclocal
> +
> +    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
> +    install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/
|| true
> +}
> +
> +FILES_${PN} =3D "${libdir}/lib*.so.*"
> +FILES_${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/
${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

