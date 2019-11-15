Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 34B0A7CF9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 15:35:43 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z23so8381559qkj.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AeExFEdz3B0TULwBFOdPe3iRwih0IYbA/Q7lXU7Rc+M=;
	b=XSg0KTWOOy3eY9uTz2cDu/H34MH2WY2ryRKyj9jOGYbTACZ8xwbLqAbhruH/09CYIr
	NOLotarsR2sxB9UPQe39IWjI81OPH9GKz2lfAwEfkUzkNh0krwAiImCEOlO6Bd0UPEU+
	bHBoXgyOb7jeZDv3BCYcnV9gmZ0FSsiJfUeZF2KPRnXMYj4ebrvEPhZ/BV51C/dADui/
	DC+RD3QvwZdKzXA0e343qXaVBisJ96sauArSIAsyD35XUkH/n8Aj5zwnNmC9Oq8FyNzQ
	3mhp6lFY4rUcST2yD6BsLN1S71/PabxUuJVo3fGyev9LcF7AxsHIOPSs20kViFh2BpgH
	OpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AeExFEdz3B0TULwBFOdPe3iRwih0IYbA/Q7lXU7Rc+M=;
	b=jD8KYGL5EtA5xKMXOyC0ffRQoRF1NEVLf8so+sPun3lVmreGcUFocr9D2Li87gmLP+
	rhVhnlpYojNnL0SMcf4fiVNZIryqSYeUqpGaVoEs/5/6U6tdWd6lJu+XMY4xvuQO/nQK
	vOLU4e2NRFqpQpkRHTN67x191rb8HKxpYj6OfrenyWhfTrxvHRywlXjTSAGHhV1ovnLT
	HL4TZo9JTbBWY1oC1a4FMhhghmcQMQ+dDHI9NGN7+kx2ubFpmtx/cA3TgkQrU1nbXNn4
	YSAbSSGBfWxY+zb74JmvGxHwlTE05hTQC5YjE4WUycp3B0ltGXIvqNAYisuj2ZvONvba
	h9Qw==
X-Gm-Message-State: APjAAAX7x9YaEqmDZeDdO5lXrFxCEXcNRkM0KHOKF9sEOlb/vJnzSTtj
	hegp4Z2+PliOLSIfoAm7vBQd4Fn9GLLZL9tXNJM=
X-Google-Smtp-Source: APXvYqy9wSxWiaTFnFlJQjI/vy+Ho73LVmLXAvcbnxZEEhzLobdsXWJ37u5pq9qM0wFgJDBQrQ/gpn9Fe5yCX2rw8Wo=
X-Received: by 2002:a37:8805:: with SMTP id k5mr6504387qkd.212.1573832143486; 
	Fri, 15 Nov 2019 07:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-8-schnitzeltony@gmail.com>
In-Reply-To: <20191114194930.2786-8-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Nov 2019 07:35:17 -0800
Message-ID: <CAMKF1soigXEGGg=hn6hm5a7qXDzk=K9dy=bv_ZE9X=f4uc3v4w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 07/16] evince: upgrade 3.28.2 -> 3.34.1
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
X-List-Received-Date: Fri, 15 Nov 2019 15:35:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 11:50 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * remove unnecessary or upstreamed patches
> * add upstream-version-is-even to inherit
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...-format-attribute-to-_synctex_malloc.patch | 12 ++--
>  .../evince/0001-help-remove-YELP-macro.patch  | 24 -------
>  ...vDocumentModel-get-type-function-dec.patch | 33 ----------
>  ...02-add-a-formatting-attribute-check.patch} |  0
>  .../recipes-gnome/evince/evince_3.28.2.bb     | 65 -------------------
>  .../recipes-gnome/evince/evince_3.34.1.bb     | 52 +++++++++++++++
>  6 files changed, 58 insertions(+), 128 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remo=
ve-YELP-macro.patch
>  delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-R=
emove-EvDocumentModel-get-type-function-dec.patch
>  rename meta-gnome/recipes-gnome/evince/evince/{0001-add-a-formatting-att=
ribute-check.patch =3D> 0002-add-a-formatting-attribute-check.patch} (100%)
>  delete mode 100644 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
>  create mode 100644 meta-gnome/recipes-gnome/evince/evince_3.34.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attri=
bute-to-_synctex_malloc.patch b/meta-gnome/recipes-gnome/evince/evince/0001=
-Add-format-attribute-to-_synctex_malloc.patch
> index de739c5b3..32ca073f9 100644
> --- a/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to=
-_synctex_malloc.patch
> +++ b/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to=
-_synctex_malloc.patch
> @@ -11,17 +11,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/cut-n-paste/synctex/synctex_parser_utils.c b/cut-n-paste/sy=
nctex/synctex_parser_utils.c
> -index f8a9f6f..9459b2d 100644
> +index 08053f0..0519b38 100644
>  --- a/cut-n-paste/synctex/synctex_parser_utils.c
>  +++ b/cut-n-paste/synctex/synctex_parser_utils.c
> -@@ -78,6 +78,7 @@ void *_synctex_malloc(size_t size) {
> -       return (void *)ptr;
> +@@ -136,6 +136,7 @@ int _synctex_log(int level, const char * prompt, con=
st char * reason,va_list arg
> +       return result;
>   }

this patch needs enahncements since clang build is failing like this

https://errors.yoctoproject.org/Errors/Details/275798/

_synctex_log also needs format attribute like below


I will see if I can fix it here


>
>  +__attribute__((__format__ (__printf__, 1, 0)))
>   int _synctex_error(const char * reason,...) {
> -       va_list arg;
> -       int result;
> +     va_list arg;
> +     int result;
>  --
> -2.12.2
> +2.20.1
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP=
-macro.patch b/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP=
-macro.patch
> deleted file mode 100644
> index 592f46606..000000000
> --- a/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.=
patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 40921037d8e7205a3889d529fb4e06f79e1e88b0 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 19 Feb 2016 16:52:18 +0200
> -Subject: [PATCH] help: remove YELP macro
> -
> -Upstream-Status: Inappropriate [embedded-specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - help/Makefile.am | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/help/Makefile.am b/help/Makefile.am
> -index 7835810..37c88ce 100644
> ---- a/help/Makefile.am
> -+++ b/help/Makefile.am
> -@@ -1,5 +1,3 @@
> --@YELP_HELP_RULES@
> --
> - SUBDIRS =3D reference
> -
> - HELP_ID =3D evince
> ---
> -2.7.0
> -
> diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-E=
vDocumentModel-get-type-function-dec.patch b/meta-gnome/recipes-gnome/evinc=
e/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
> deleted file mode 100644
> index dcc4a4e9c..000000000
> --- a/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocume=
ntModel-get-type-function-dec.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 0cdce687d3edfa5ac0fd19539ba1815d039026d5 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?I=3DC3=3DB1igo=3D20Mart=3DC3=3DADnez?=3D <inigomartine=
z@gmail.com>
> -Date: Fri, 7 Sep 2018 22:34:29 +0200
> -Subject: [PATCH] libview: Remove EvDocumentModel get type function decla=
ration
> -
> -The EvDocumentModel class declares the `ev_document_model_get_type`
> -function as part of the `GObject` boilerplate code.
> -
> -However, this declaration is not necessary and also causes a warning
> -when introspection data file, `EvinceView-3.0.gir`, is generated.
> -
> -Upstream-Status: Applied [1]
> -
> -
> ----
> - libview/ev-document-model.h | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/libview/ev-document-model.h b/libview/ev-document-model.h
> -index 784e27d6..6a99e43a 100644
> ---- a/libview/ev-document-model.h
> -+++ b/libview/ev-document-model.h
> -@@ -54,7 +54,6 @@ typedef enum {
> -       EV_PAGE_LAYOUT_AUTOMATIC
> - } EvPageLayout;
> -
> --GType            ev_document_model_get_type          (void) G_GNUC_CONS=
T;
> - EvDocumentModel *ev_document_model_new               (void);
> - EvDocumentModel *ev_document_model_new_with_document (EvDocument      *=
document);
> -
> ---
> -2.20.1
> -
> diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting=
-attribute-check.patch b/meta-gnome/recipes-gnome/evince/evince/0002-add-a-=
formatting-attribute-check.patch
> similarity index 100%
> rename from meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting-=
attribute-check.patch
> rename to meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-at=
tribute-check.patch
> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnom=
e/recipes-gnome/evince/evince_3.28.2.bb
> deleted file mode 100644
> index f45180e79..000000000
> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -SUMMARY =3D "Evince is a document viewer for document formats like pdf, =
ps, djvu"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96f2f8d5ee576a2163977938ea36f=
a7b"
> -SECTION =3D "x11/office"
> -DEPENDS =3D "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11=
','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-ico=
n-theme intltool-native gnome-common-native"
> -
> -inherit gnomebase pkgconfig gtk-icon-cache gsettings gobject-introspecti=
on distro_features_check systemd
> -
> -SRC_URI =3D " \
> -    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV=
}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
> -    file://0001-help-remove-YELP-macro.patch \
> -    file://0001-Add-format-attribute-to-_synctex_malloc.patch \
> -    file://0001-add-a-formatting-attribute-check.patch \
> -    file://0001-libview-Remove-EvDocumentModel-get-type-function-dec.pat=
ch \
> -"
> -SRC_URI[archive.md5sum] =3D "66aa1766eaaa37536e48def11a0e67a3"
> -SRC_URI[archive.sha256sum] =3D "0955d22d85c9f6d322b6cbb464f1cc4c352db619=
017ec95dad4cc5c3440f73e1"
> -
> -EXTRA_OECONF =3D "--enable-thumbnailer"
> -
> -do_compile_prepend() {
> -    export GIR_EXTRA_LIBS_PATH=3D"${B}/libdocument/.libs"
> -}
> -
> -
> -do_install_append() {
> -    install -d ${D}${datadir}/pixmaps
> -    install -m 0755 ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}=
/pixmaps/
> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}
> -    then
> -        install -d ${D}${systemd_unitdir}/system
> -        mv ${D}${systemd_user_unitdir}/evince.service ${D}${systemd_syst=
em_unitdir}/evince.service
> -    else
> -        rm -rf ${D}${libdir}/systemd/user/evince.service
> -    fi
> -    rmdir --ignore-fail-on-non-empty ${D}${systemd_user_unitdir}
> -    rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd
> -    rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}
> -}
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[nautilus] =3D "--enable-nautilus,--disable-nautilus,nautil=
us"
> -PACKAGECONFIG[browser-plugin] =3D "--enable-browser-plugin,--disable-bro=
wser-plugin,"
> -
> -SYSTEMD_SERVICE_${PN} =3D "evince.service"
> -
> -RDEPENDS_${PN} +=3D "glib-2.0-utils"
> -RRECOMMMENDS_${PN} =3D "adwaita-icon-theme"
> -
> -PACKAGES =3D+ "${PN}-nautilus-extension"
> -PACKAGES =3D+ "${PN}-browser-plugin"
> -
> -FILES_${PN} +=3D "${datadir}/dbus-1 \
> -                ${datadir}/metainfo \
> -                ${datadir}/thumbnailers \
> -                ${systemd_unitdir}/systemd/user/evince.service \
> -               "
> -FILES_${PN}-dbg +=3D "${libdir}/*/*/.debug \
> -                    ${libdir}/*/*/*/.debug"
> -FILES_${PN}-dev +=3D "${libdir}/nautilus/extensions-2.0/*.la \
> -                    ${libdir}/evince/*/backends/*.la"
> -FILES_${PN}-staticdev +=3D "${libdir}/nautilus/extensions-2.0/*.a \
> -                          ${libdir}/evince/*/backends/*.a"
> -FILES_${PN}-nautilus-extension =3D "${libdir}/nautilus/*/*so"
> -FILES_${PN}-browser-plugin =3D "${libdir}/mozilla/*/*so"
> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.34.1.bb b/meta-gnom=
e/recipes-gnome/evince/evince_3.34.1.bb
> new file mode 100644
> index 000000000..6f0392d27
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evince/evince_3.34.1.bb
> @@ -0,0 +1,52 @@
> +SUMMARY =3D "Evince is a document viewer for document formats like pdf, =
ps, djvu"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96f2f8d5ee576a2163977938ea36f=
a7b"
> +SECTION =3D "x11/office"
> +DEPENDS =3D " \
> +    gnome-common-native \
> +    yelp-tools-native \
> +    appstream-glib \
> +    gtk+3 \
> +    gspell \
> +    libsecret \
> +    poppler \
> +    gstreamer1.0-plugins-base \
> +    orc \
> +    adwaita-icon-theme \
> +    ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)}=
 \
> +"
> +
> +inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introsp=
ection upstream-version-is-even gettext distro_features_check
> +
> +SRC_URI[archive.md5sum] =3D "77b38b625008f5940e9bd4b3d38e8cf8"
> +SRC_URI[archive.sha256sum] =3D "85e407cde396147b249120d816c7715fb6df191c=
a561cf65ff3554a5d67626df"
> +SRC_URI +=3D " \
> +    file://0001-Add-format-attribute-to-_synctex_malloc.patch \
> +    file://0002-add-a-formatting-attribute-check.patch \
> +"
> +
> +EXTRA_OECONF =3D " \
> +    --enable-thumbnailer \
> +    --without-systemduserunitdir \
> +"
> +
> +do_compile_prepend() {
> +    export GIR_EXTRA_LIBS_PATH=3D"${B}/libdocument/.libs"
> +}
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[nautilus] =3D "--enable-nautilus,--disable-nautilus,nautil=
us"
> +PACKAGECONFIG[browser-plugin] =3D "--enable-browser-plugin,--disable-bro=
wser-plugin,"
> +
> +RDEPENDS_${PN} +=3D "glib-2.0-utils"
> +RRECOMMMENDS_${PN} =3D "adwaita-icon-theme"
> +
> +PACKAGES =3D+ "${PN}-nautilus-extension"
> +PACKAGES =3D+ "${PN}-browser-plugin"
> +
> +FILES_${PN} +=3D "${datadir}/dbus-1 \
> +                ${datadir}/metainfo \
> +                ${datadir}/thumbnailers \
> +"
> +FILES_${PN}-nautilus-extension =3D "${libdir}/nautilus/*/*so"
> +FILES_${PN}-browser-plugin =3D "${libdir}/mozilla/*/*so"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

