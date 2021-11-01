Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160E3C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:51:45 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.42672.1635767503951087845
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PyPHT1pR;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id d128so7311040vkf.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVL15wTAOFeOpfr3jjlCQ5rvTVoXcSjAd6tdSoP5ylc=;
        b=PyPHT1pRG2WHKetjmx4bMQuyiWBRx02QSK7DIjy57iJgDKCMToL1fO2BbKH0PNg4Ei
         fvSKWf3J1XGKcC+8rV7x7m/TVmDwSv3bM7T8rzcxRIFWZU904r+nKeG4qNj7vIRQGZG+
         HuqaWQciFXryoRsI+EP4FyFybnlE4e4Wxuf2qnhEoxPPmp2ckSNL9V8upM4oxr+lRd8+
         bbbQRG5KUNU9HEmfVkUoNgTiddVfN1rGrK6kWCxpnTHbzqutIV/VJLhpt1xy3jr+EcQp
         UKVoa8C2wTdaKFXS0ToIkWQON+tXWbyDCskpwv0V5sYf3/D7z7zHXCd22ChDzj5Gq7s/
         xQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVL15wTAOFeOpfr3jjlCQ5rvTVoXcSjAd6tdSoP5ylc=;
        b=2rxT6FSyZMhi0RHnNB9aN6nsea1FBeh5KDGz7Wmnuq5nHTthZAB5LdWup1Eb8lBsuF
         HLuGjfskgsSiJTAgbjF8ks9fYFKp1U3IQzPbOcrNVqfinfcpKsPPz9c3g9Mi/ODDBorR
         3Y7OdnuOq1OHw6UjzbXmKXCr/wLMynEq6La7FJaj/DeKWq+u0Ri0Prt8TFtaDGHN9/ve
         X9+H4fcjfRw68YVzavav17HwK2HEwe0M020k2CjpdIAz3ePLNw425BGWPUI63U1Yn31c
         V1q8EM3MREdKhjL9a+sNmKh3nB0wBVzXCyISJSVJw/eG+19ViL5t8oZDeflMVLVZbUev
         DKmw==
X-Gm-Message-State: AOAM5328srzfnM5s+NttdhYssxZpKF/HQyIbg3WP3Y5vTp9/UWo5vS6L
	Bq5/oKjGkP1Js19AX9X3Fd1imh6xOJztdmaGcxg=
X-Google-Smtp-Source: 
 ABdhPJwjtrSAoyqNnABcV/hj/lyQmi6W4PkZYY4kyCLFHcF9i6ebJrExGZUlEfGaGz7eWAAw1BYlGFA1S2WmMH3sSnE=
X-Received: by 2002:a05:6122:1828:: with SMTP id
 ay40mr24994159vkb.12.1635767503110;
 Mon, 01 Nov 2021 04:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211101114934.3646836-1-schnitzeltony@gmail.com>
 <20211101114934.3646836-12-schnitzeltony@gmail.com>
In-Reply-To: <20211101114934.3646836-12-schnitzeltony@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Nov 2021 12:51:31 +0100
Message-ID: 
 <CANNYZj940v8Kruz72p2oM64A8aqwZGmZ=WBKj9Df6M_i0opG8g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome++][PATCH 11/31] gtk4: initial add 4.4.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f544cb05cfb8cc11"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:51:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93734

--000000000000f544cb05cfb8cc11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you please name this one simply 'gtk'? There's no reason to append 4 in
there.

Alex

On Mon, 1 Nov 2021 at 12:49, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:

> * It is a hard dependency for gnome-shell 41
> * Final destination for this recipe should be oe-core but start it here
> first:
>   * Some dependencies (graphene / sassc-native) are not in oe-core yet
>   * In meta-gnome gtk4 recipe can mature: The initial recipe focuses on
> target
>     build and make consumers of gtk4 happy
>   * The native gtk4-update-icon-cache wrapper dance is missing
>   * Missing nativesdk (added a comment why)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb | 139 ++++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
> b/meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
> new file mode 100644
> index 000000000..f15e2d58e
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.4.0.bb
> @@ -0,0 +1,139 @@
> +SUMMARY =3D "Multi-platform toolkit for creating GUIs"
> +DESCRIPTION =3D "GTK is a multi-platform toolkit for creating graphical
> user interfaces. Offering a complete \
> +set of widgets, GTK is suitable for projects ranging from small one-off
> projects to complete application suites."
> +HOMEPAGE =3D "http://www.gtk.org"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +SECTION =3D "libs"
> +
> +DEPENDS =3D " \
> +    sassc-native \
> +    glib-2.0 \
> +    libepoxy \
> +    graphene \
> +    cairo \
> +    pango \
> +    atk \
> +    jpeg \
> +    libpng \
> +    gdk-pixbuf-native gdk-pixbuf \
> +"
> +
> +LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \
> +    file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88af737=
 \
> +    file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e08086f2=
 \
> +
> file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d29fb=
2 \
> +"
> +
> +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +SRC_URI =3D "
> http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D
> "e0a1508f441686c3a20dfec48af533b19a4b2e017c18eaee31dccdb7d292505b"
> +
> +S =3D "${WORKDIR}/gtk-${PV}"
> +
> +inherit meson gettext pkgconfig gtk-doc update-alternatives gsettings
> features_check gobject-introspection
> +
> +# TBD: nativesdk
> +# gobject-introspection.bbclass pins introspection off for nativesk. As
> long as
> +# we do not remove this wisdom or hack gtk4, it is not possible to build
> +# nativesdk-gtk4
> +BBCLASSEXTEND =3D "native"
> +
> +GSETTINGS_PACKAGE:class-native =3D ""
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +GTKDOC_MESON_OPTION =3D 'gtk_doc'
> +
> +# ../gtk-4.4.0/testsuite/reftests/gtk-reftest.c:28:10: fatal error:
> execinfo.h: No such file or directory
> +EXTRA_OEMESON:append:libc-musl =3D " -Dbuild-tests=3Dfalse"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
,
> d)}"
> +PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> +PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> +
> +PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-sp=
i2-atk
> fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrende=
r
> libxcomposite libxfixes xinerama"
> +PACKAGECONFIG[wayland] =3D
> "-Dwayland-backend=3Dtrue,-Dwayland-backend=3Dfalse,wayland wayland-proto=
cols
> libxkbcommon virtual/egl virtual/libgles2 wayland-native"
> +PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups"
> +PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
> +# gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
> +PACKAGECONFIG[gstreamer] =3D
> "-Dmedia-gstreamer=3Denabled,-Dmedia-gstreamer=3Ddisabled,gstreamer1.0-pl=
ugins-bad"
> +PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker"
> +
> +
> +do_compile:prepend() {
> +    export GIR_EXTRA_LIBS_PATH=3D"${B}/gdk/.libs"
> +}
> +
> +
> +PACKAGES =3D+ "${PN}-demo"
> +LIBV =3D "4.0.0"
> +
> +FILES:${PN}-demo =3D " \
> +    ${datadir}/applications/org.gtk.Demo4.desktop \
> +    ${datadir}/applications/org.gtk.IconBrowser4.desktop \
> +    ${datadir}/applications/org.gtk.WidgetFactory4.desktop \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.Demo4*.* \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.IconBrowser4*.* \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.WidgetFactory4*.* \
> +    ${bindir}/gtk4-demo \
> +    ${bindir}/gtk4-demo-application \
> +    ${bindir}/gtk4-icon-browser \
> +    ${bindir}/gtk4-widget-factory \
> +"
> +
> +FILES:${PN}:append =3D " \
> +    ${datadir}/glib-2.0/schemas/ \
> +    ${datadir}/gtk-4.0/emoji/ \
> +    ${datadir}/metainfo/ \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
> +    ${libdir}/gtk-4.0/${LIBV}/printbackends \
> +    ${bindir}/gtk4-update-icon-cache \
> +    ${bindir}/gtk4-launch \
> +"
> +
> +FILES:${PN}-dev +=3D " \
> +    ${datadir}/gtk-4.0/gtk4builder.rng \
> +    ${datadir}/gtk-4.0/include \
> +    ${datadir}/gtk-4.0/valgrind \
> +    ${datadir}/gettext/its \
> +    ${bindir}/gtk4-builder-tool \
> +    ${bindir}/gtk4-encode-symbolic-svg \
> +    ${bindir}/gtk4-query-settings \
> +"
> +
> +GTKBASE_RRECOMMENDS ?=3D " \
> +    liberation-fonts \
> +    gdk-pixbuf-loader-png \
> +    gdk-pixbuf-loader-jpeg \
> +    gdk-pixbuf-loader-gif \
> +    gdk-pixbuf-loader-xpm \
> +    shared-mime-info \
> +    adwaita-icon-theme-symbolic \
> +"
> +
> +GTKBASE_RRECOMMENDS:class-native ?=3D ""
> +
> +GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
> +
> +RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
> +RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
> +RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland"=
,
> "wayland-protocols", "", d)}"
> +
> +PACKAGES_DYNAMIC +=3D "^gtk4-printbackend-.*"
> +python populate_packages:prepend () {
> +    import os.path
> +
> +    gtk_libdir =3D d.expand('${libdir}/gtk-3.0/${LIBV}')
> +    printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
> +
> +    do_split_packages(d, printmodules_root,
> r'^libprintbackend-(.*)\.so$', 'gtk4-printbackend-%s', 'GTK printbackend
> module for %s')
> +
> +    if (d.getVar('DEBIAN_NAMES')):
> +        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
> +}
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93711):
> https://lists.openembedded.org/g/openembedded-devel/message/93711
> Mute This Topic: https://lists.openembedded.org/mt/86737136/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f544cb05cfb8cc11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you please name this one simply &#39;gtk&#39;? Th=
ere&#39;s no reason to append 4 in there.</div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, 1 Nov 2021 at 12:49, Andreas M=C3=BCller &lt;<a href=3D"mailt=
o:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">* It is a hard dependency=
 for gnome-shell 41<br>
* Final destination for this recipe should be oe-core but start it here fir=
st:<br>
=C2=A0 * Some dependencies (graphene / sassc-native) are not in oe-core yet=
<br>
=C2=A0 * In meta-gnome gtk4 recipe can mature: The initial recipe focuses o=
n target<br>
=C2=A0 =C2=A0 build and make consumers of gtk4 happy<br>
=C2=A0 * The native gtk4-update-icon-cache wrapper dance is missing<br>
=C2=A0 * Missing nativesdk (added a comment why)<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmai=
l.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-gnome/recipes-gnome/gtk4/<a href=3D"http://gtk4_4.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">gtk4_4.4.0.bb</a> | 139 ++++++++++++++++++++=
<br>
=C2=A01 file changed, 139 insertions(+)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gtk4/<a href=3D"http://gt=
k4_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">gtk4_4.4.0.bb</a><br>
<br>
diff --git a/meta-gnome/recipes-gnome/gtk4/<a href=3D"http://gtk4_4.4.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gtk4_4.4.0.bb</a> b/meta-gnome/recipe=
s-gnome/gtk4/<a href=3D"http://gtk4_4.4.0.bb" rel=3D"noreferrer" target=3D"=
_blank">gtk4_4.4.0.bb</a><br>
new file mode 100644<br>
index 000000000..f15e2d58e<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/gtk4/<a href=3D"http://gtk4_4.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">gtk4_4.4.0.bb</a><br>
@@ -0,0 +1,139 @@<br>
+SUMMARY =3D &quot;Multi-platform toolkit for creating GUIs&quot;<br>
+DESCRIPTION =3D &quot;GTK is a multi-platform toolkit for creating graphic=
al user interfaces. Offering a complete \<br>
+set of widgets, GTK is suitable for projects ranging from small one-off pr=
ojects to complete application suites.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.gtk.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://www.gtk.org</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://bugzilla.gnome.org/" rel=3D"norefe=
rrer" target=3D"_blank">https://bugzilla.gnome.org/</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+DEPENDS =3D &quot; \<br>
+=C2=A0 =C2=A0 sassc-native \<br>
+=C2=A0 =C2=A0 glib-2.0 \<br>
+=C2=A0 =C2=A0 libepoxy \<br>
+=C2=A0 =C2=A0 graphene \<br>
+=C2=A0 =C2=A0 cairo \<br>
+=C2=A0 =C2=A0 pango \<br>
+=C2=A0 =C2=A0 atk \<br>
+=C2=A0 =C2=A0 jpeg \<br>
+=C2=A0 =C2=A0 libpng \<br>
+=C2=A0 =C2=A0 gdk-pixbuf-native gdk-pixbuf \<br>
+&quot;<br>
+<br>
+LICENSE =3D &quot;LGPL-2.0-only &amp; LGPL-2.0-or-later &amp; LGPL-2.1-or-=
later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot; \<br>
+=C2=A0 =C2=A0 file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \<br>
+=C2=A0 =C2=A0 file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dc=
e88af737 \<br>
+=C2=A0 =C2=A0 file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50=
e08086f2 \<br>
+=C2=A0 =C2=A0 file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b832246=
6b52ed19d29fb2 \<br>
+&quot;<br>
+<br>
+MAJ_VER =3D &quot;${@oe.utils.trim_version(&quot;${PV}&quot;, 2)}&quot;<br=
>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk/$%=
7BMAJ_VER%7D/gtk-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">htt=
p://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz</a>&quo=
t;<br>
+SRC_URI[sha256sum] =3D &quot;e0a1508f441686c3a20dfec48af533b19a4b2e017c18e=
aee31dccdb7d292505b&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/gtk-${PV}&quot;<br>
+<br>
+inherit meson gettext pkgconfig gtk-doc update-alternatives gsettings feat=
ures_check gobject-introspection<br>
+<br>
+# TBD: nativesdk<br>
+# gobject-introspection.bbclass pins introspection off for nativesk. As lo=
ng as<br>
+# we do not remove this wisdom or hack gtk4, it is not possible to build<b=
r>
+# nativesdk-gtk4<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+GSETTINGS_PACKAGE:class-native =3D &quot;&quot;<br>
+<br>
+ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+<br>
+GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
+GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
+GTKDOC_MESON_OPTION =3D &#39;gtk_doc&#39;<br>
+<br>
+# ../gtk-4.4.0/testsuite/reftests/gtk-reftest.c:28:10: fatal error: execin=
fo.h: No such file or directory<br>
+EXTRA_OEMESON:append:libc-musl =3D &quot; -Dbuild-tests=3Dfalse&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;wayland x11&#39;, d)}&quot;<br>
+PACKAGECONFIG:class-native =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATUR=
ES&#39;, &#39;x11&#39;, d)}&quot;<br>
+PACKAGECONFIG:class-nativesdk =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEA=
TURES&#39;, &#39;x11&#39;, d)}&quot;<br>
+<br>
+PACKAGECONFIG[x11] =3D &quot;-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at=
-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr l=
ibxrender libxcomposite libxfixes xinerama&quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;-Dwayland-backend=3Dtrue,-Dwayland-backen=
d=3Dfalse,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgle=
s2 wayland-native&quot;<br>
+PACKAGECONFIG[cups] =3D &quot;-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabl=
ed,cups&quot;<br>
+PACKAGECONFIG[colord] =3D &quot;-Dcolord=3Denabled,-Dcolord=3Ddisabled,col=
ord&quot;<br>
+# gtk4 wants gstreamer-player-1.0 -&gt; gstreamer1.0-plugins-bad<br>
+PACKAGECONFIG[gstreamer] =3D &quot;-Dmedia-gstreamer=3Denabled,-Dmedia-gst=
reamer=3Ddisabled,gstreamer1.0-plugins-bad&quot;<br>
+PACKAGECONFIG[tracker] =3D &quot;-Dtracker=3Denabled,-Dtracker=3Ddisabled,=
tracker&quot;<br>
+<br>
+<br>
+do_compile:prepend() {<br>
+=C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/gdk/.libs&quot;<br>
+}<br>
+<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-demo&quot;<br>
+LIBV =3D &quot;4.0.0&quot;<br>
+<br>
+FILES:${PN}-demo =3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/applications/org.gtk.Demo4.desktop \<br>
+=C2=A0 =C2=A0 ${datadir}/applications/org.gtk.IconBrowser4.desktop \<br>
+=C2=A0 =C2=A0 ${datadir}/applications/org.gtk.WidgetFactory4.desktop \<br>
+=C2=A0 =C2=A0 ${datadir}/icons/hicolor/*/apps/org.gtk.Demo4*.* \<br>
+=C2=A0 =C2=A0 ${datadir}/icons/hicolor/*/apps/org.gtk.IconBrowser4*.* \<br=
>
+=C2=A0 =C2=A0 ${datadir}/icons/hicolor/*/apps/org.gtk.WidgetFactory4*.* \<=
br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-demo \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-demo-application \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-icon-browser \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-widget-factory \<br>
+&quot;<br>
+<br>
+FILES:${PN}:append =3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/glib-2.0/schemas/ \<br>
+=C2=A0 =C2=A0 ${datadir}/gtk-4.0/emoji/ \<br>
+=C2=A0 =C2=A0 ${datadir}/metainfo/ \<br>
+=C2=A0 =C2=A0 ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \<br=
>
+=C2=A0 =C2=A0 ${libdir}/gtk-4.0/${LIBV}/printbackends \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-update-icon-cache \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-launch \<br>
+&quot;<br>
+<br>
+FILES:${PN}-dev +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/gtk-4.0/gtk4builder.rng \<br>
+=C2=A0 =C2=A0 ${datadir}/gtk-4.0/include \<br>
+=C2=A0 =C2=A0 ${datadir}/gtk-4.0/valgrind \<br>
+=C2=A0 =C2=A0 ${datadir}/gettext/its \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-builder-tool \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-encode-symbolic-svg \<br>
+=C2=A0 =C2=A0 ${bindir}/gtk4-query-settings \<br>
+&quot;<br>
+<br>
+GTKBASE_RRECOMMENDS ?=3D &quot; \<br>
+=C2=A0 =C2=A0 liberation-fonts \<br>
+=C2=A0 =C2=A0 gdk-pixbuf-loader-png \<br>
+=C2=A0 =C2=A0 gdk-pixbuf-loader-jpeg \<br>
+=C2=A0 =C2=A0 gdk-pixbuf-loader-gif \<br>
+=C2=A0 =C2=A0 gdk-pixbuf-loader-xpm \<br>
+=C2=A0 =C2=A0 shared-mime-info \<br>
+=C2=A0 =C2=A0 adwaita-icon-theme-symbolic \<br>
+&quot;<br>
+<br>
+GTKBASE_RRECOMMENDS:class-native ?=3D &quot;&quot;<br>
+<br>
+GTKGLIBC_RRECOMMENDS ?=3D &quot;${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859=
-1&quot;<br>
+<br>
+RRECOMMENDS:${PN} =3D &quot;${GTKBASE_RRECOMMENDS}&quot;<br>
+RRECOMMENDS:${PN}:libc-glibc =3D &quot;${GTKGLIBC_RRECOMMENDS}&quot;<br>
+RDEPENDS:${PN}-dev +=3D &quot;${@bb.utils.contains(&quot;PACKAGECONFIG&quo=
t;, &quot;wayland&quot;, &quot;wayland-protocols&quot;, &quot;&quot;, d)}&q=
uot;<br>
+<br>
+PACKAGES_DYNAMIC +=3D &quot;^gtk4-printbackend-.*&quot;<br>
+python populate_packages:prepend () {<br>
+=C2=A0 =C2=A0 import os.path<br>
+<br>
+=C2=A0 =C2=A0 gtk_libdir =3D d.expand(&#39;${libdir}/gtk-3.0/${LIBV}&#39;)=
<br>
+=C2=A0 =C2=A0 printmodules_root =3D os.path.join(gtk_libdir, &#39;printbac=
kends&#39;);<br>
+<br>
+=C2=A0 =C2=A0 do_split_packages(d, printmodules_root, r&#39;^libprintbacke=
nd-(.*)\.so$&#39;, &#39;gtk4-printbackend-%s&#39;, &#39;GTK printbackend mo=
dule for %s&#39;)<br>
+<br>
+=C2=A0 =C2=A0 if (d.getVar(&#39;DEBIAN_NAMES&#39;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(d.expand(&#39;PKG:${PN}&#39;), &#39;$=
{MLPREFIX}libgtk-4.0&#39;)<br>
+}<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93711): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93711" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93711</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86737136/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86737136/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f544cb05cfb8cc11--

