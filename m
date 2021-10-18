Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD03C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 17:59:28 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.40070.1634579967397572949
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=emw0CXHH;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id z69so14172679iof.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhFtNDVdAeDKnSYFJb5OgDyWwZJTvBEVMxJIbBcUa/c=;
        b=emw0CXHHzLEctZ2ARnNQY+fIjyGNYD3kO+MRIYCjVNFgZ7VZ0PqYwKLXCOFEgaQy52
         tumF7ElhwiqLeX7ZmD9MDZgel4OBa44EX4wyXPxOG+aJrgD2kEx71j6xzF8zzgSXuiJ7
         T8i38OqvIoB4N80rohujR499P36KPNHuO7oKGZCbEmAEidtqt48pFInbWY9XyYkzzAwB
         7RAbmPzCEP8/GxNPboWAP96KKeY+hJXM4PEn7aEb2g6wU0GWpKNt+tfATBL3TDP2YyEz
         dsSeMK+GOAuFF7t/SgFTvO54SEflw/Fa3p+WQU/Opqjpct1ewpn73K0fZEmGOiddX+73
         Fc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhFtNDVdAeDKnSYFJb5OgDyWwZJTvBEVMxJIbBcUa/c=;
        b=x7kBcljn/0fl6FGQvzSsSqDlOD98f+KDz0jHc8B5BGu4ojWqVCr+yAQES6u7/xaA/L
         kFOIlTQvgbTTpH7cbdMH7xuIqHlPNUFr9VwhykHYrtotxe6QRSbfbRoSc5k/69HKixb6
         9Qcajdb5kvfayElnEZ1nDXujeWXozC6YE9kybT3ZlHawxdkpUXnMiC/YzkWV3wYpP4U5
         jBVu+HjYldyq8S7EscTpVCDaZi8zOST/dYe6J5xEcaplz3RIj8u4q4QrfSO9JZeIbv35
         9S2rx7w+8/3Zp7V7Z+PCMo8KtpEFByyAB6bnuKNPLHQxe3DFscfDMKla7vX4g8C6Z/ED
         LAhA==
X-Gm-Message-State: AOAM5312FEzIwR+MFhp5cNuGs2AhQYRSpsh3Y5xwXhAt9lqWYXQWFc6h
	6xIPGMYNzsTQPxvvulZSopT+OXRWQO7/JYvFC/fLovRi/i0=
X-Google-Smtp-Source: 
 ABdhPJxr4/NqDNfLPJmDKOOr3jH2ydD1Fwl7OsutUMDbfe4L1l0xq70T3kpHqIbSChon+eH7y7rflUY80+PdlGyooZA=
X-Received: by 2002:a5d:968b:: with SMTP id m11mr14848405ion.83.1634579966603;
 Mon, 18 Oct 2021 10:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <16AF2CA329793B3C.24927@lists.openembedded.org>
In-Reply-To: <16AF2CA329793B3C.24927@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 18 Oct 2021 10:59:14 -0700
Message-ID: 
 <CANx9H-DD_XYqMosG1zY0G5e4m1JDQGdBs0qeH4Dhn_=m=p8Yxg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gfbgraph: patch to build with latest
 rest
To: Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000044354205cea44ea9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 17:59:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93441

--00000000000044354205cea44ea9
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 9:24 AM Tim Orling via lists.openembedded.org
<ticotimo=gmail.com@lists.openembedded.org> wrote:

> librest 0.8.1 declares rest-1.0 and was released four years ago.
>
>
This turns out to be incorrect, the rest-1.0 declaration is in the master
branch, which we picked up with
https://lists.openembedded.org/g/openembedded-devel/message/93412


> Also inherit pkgconfig so that dependencies can be found by pkg-config
>
> References:
> https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  ...-Update-rest-requirement-to-rest-1.0.patch | 72 +++++++++++++++++++
>  .../recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb  |  3 +-
>  2 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
>
> diff --git
> a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
> b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
> new file mode 100644
> index 0000000000..c24a9e569f
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
> @@ -0,0 +1,72 @@
> +From d058e6eb6c9ebf5f4fff89ec0ac93323fc64c1ba Mon Sep 17 00:00:00 2001
> +From: Tim Orling <ticotimo@gmail.com>
> +Date: Mon, 18 Oct 2021 08:42:35 -0700
> +Subject: [PATCH] Update rest requirement to rest-1.0
> +
> +librest 0.8.1 declares rest-1.0 and was released four years ago.
> +
> +
> https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b92701f70fc368ad64bd25cefaea043f87
> +
> +Upstream-Status: Submitted
> +[https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6]
> +
> +Signed-off-by: Tim Orling <ticotimo@gmail.com>
> +
> +---
> + .dir-locals.el       | 2 +-
> + configure.ac         | 2 +-
> + gfbgraph/Makefile.am | 2 +-
> + libgfbgraph.pc.in    | 2 +-
> + 4 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/.dir-locals.el b/.dir-locals.el
> +index 77abbf0..d39cdf2 100644
> +--- a/.dir-locals.el
> ++++ b/.dir-locals.el
> +@@ -3,7 +3,7 @@
> +                                "/usr/include/json-glib-1.0"
> +                                "/usr/include/goa-1.0"
> +                                "/usr/lib64/goa-1.0/include"
> +-                               "/usr/include/rest-0.7"
> ++                               "/usr/include/rest-1.0"
> +                                "/usr/include/dbus-1.0"
> +                                "/usr/lib64/dbus-1.0/include"
> +                                "/usr/include/gio-unix-2.0/"
> +diff --git a/configure.ac b/configure.ac
> +index fd1231f..9b49f3f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -40,7 +40,7 @@ AM_CONDITIONAL([ENABLE_GTK_DOC], false)
> +
> + GOBJECT_INTROSPECTION_CHECK([1.30.0])
> +
> +-PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-0.7
> json-glib-1.0])
> ++PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-1.0
> json-glib-1.0])
> +
> + PKG_CHECK_MODULES(SOUP, [libsoup-2.4])
> + SOUP_UNSTABLE_CPPFLAGS=-DLIBSOUP_USE_UNSTABLE_REQUEST_API
> +diff --git a/gfbgraph/Makefile.am b/gfbgraph/Makefile.am
> +index d07b90d..b993ab7 100644
> +--- a/gfbgraph/Makefile.am
> ++++ b/gfbgraph/Makefile.am
> +@@ -60,7 +60,7 @@ GFBGraph_@API_MAJOR@_@API_MINOR@_gir_INCLUDES = \
> +       GLib-2.0        \
> +       Gio-2.0         \
> +       GObject-2.0     \
> +-      Rest-0.7        \
> ++      Rest-1.0        \
> +       Json-1.0        \
> +       Soup-2.4
> +
> +diff --git a/libgfbgraph.pc.in b/libgfbgraph.pc.in
> +index f87073e..d4f4e3a 100644
> +--- a/libgfbgraph.pc.in
> ++++ b/libgfbgraph.pc.in
> +@@ -9,6 +9,6 @@ apiversion=@API_VERSION@
> + Name: libgfbgraph
> + Description: GObject library for Facebook Graph API
> + Version: @VERSION@
> +-Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-0.7
> ++Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-1.0
> + Libs: -L${libdir} -lgfbgraph-${apiversion}
> + Cflags: -I${includedir}/gfbgraph-@API_VERSION@
> diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> index 1c5d90f6c7..23b3bf63a5 100644
> --- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> +++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> @@ -10,8 +10,9 @@ DEPENDS = " \
>      gnome-online-accounts \
>  "
>
> -inherit gnomebase gtk-doc gobject-introspection
> +inherit gnomebase gtk-doc gobject-introspection pkgconfig
>
> +SRC_URI += " file://0001-Update-rest-requirement-to-rest-1.0.patch"
>  SRC_URI[archive.md5sum] = "c38af63e49f8fe8baad99537956b69ba"
>  SRC_URI[archive.sha256sum] =
> "6065391f35e7335588cc6b0cc4c1abbce7341488573a654551264cb9793b9379"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93431):
> https://lists.openembedded.org/g/openembedded-devel/message/93431
> Mute This Topic: https://lists.openembedded.org/mt/86418475/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000044354205cea44ea9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 18, 2021 at 9:24 AM Tim O=
rling via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmai=
l.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">librest 0.8.1 declares rest-1.0 and was release=
d four years ago.<br>
<br></blockquote><div><br></div><div>This turns out to be incorrect, the re=
st-1.0 declaration is in the master branch, which we picked up with</div><d=
iv><a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/9=
3412">https://lists.openembedded.org/g/openembedded-devel/message/93412</a>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Also inherit pkgconfig so that dependencies can be found by pkg-config<br>
<br>
References:<br>
<a href=3D"https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/libgfbgr=
aph/-/merge_requests/6</a><br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-Update-rest-requirement-to-rest-1.0.patch | 72 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-gnome/gfbgraph/<a href=3D"http://gfbgraph_0.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">gfbgraph_0.2.4.bb</a>=C2=A0 |=C2=A0 3 +-<=
br>
=C2=A02 files changed, 74 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Up=
date-rest-requirement-to-rest-1.0.patch<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-re=
quirement-to-rest-1.0.patch b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/00=
01-Update-rest-requirement-to-rest-1.0.patch<br>
new file mode 100644<br>
index 0000000000..c24a9e569f<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requireme=
nt-to-rest-1.0.patch<br>
@@ -0,0 +1,72 @@<br>
+From d058e6eb6c9ebf5f4fff89ec0ac93323fc64c1ba Mon Sep 17 00:00:00 2001<br>
+From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blan=
k">ticotimo@gmail.com</a>&gt;<br>
+Date: Mon, 18 Oct 2021 08:42:35 -0700<br>
+Subject: [PATCH] Update rest requirement to rest-1.0<br>
+<br>
+librest 0.8.1 declares rest-1.0 and was released four years ago.<br>
+<br>
+<a href=3D"https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b92701f70=
fc368ad64bd25cefaea043f87" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.gnome.org/GNOME/librest/-/commit/2971b3b92701f70fc368ad64bd25cefaea043f=
87</a><br>
+<br>
+Upstream-Status: Submitted<br>
+[<a href=3D"https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/libgfb=
graph/-/merge_requests/6</a>]<br>
+<br>
+Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
+<br>
+---<br>
+ .dir-locals.el=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ gfbgraph/Makefile.am | 2 +-<br>
+ <a href=3D"http://libgfbgraph.pc.in" rel=3D"noreferrer" target=3D"_blank"=
>libgfbgraph.pc.in</a>=C2=A0 =C2=A0 | 2 +-<br>
+ 4 files changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/.dir-locals.el b/.dir-locals.el<br>
+index 77abbf0..d39cdf2 100644<br>
+--- a/.dir-locals.el<br>
++++ b/.dir-locals.el<br>
+@@ -3,7 +3,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/include/json-glib-1.0&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/include/goa-1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/lib64/goa-1.0/include&quo=
t;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/usr/include/rest-0.7&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/usr/include/rest-1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/include/dbus-1.0&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/lib64/dbus-1.0/include&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/include/gio-unix-2.0/&quo=
t;<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index fd1231f..9b49f3f 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -40,7 +40,7 @@ AM_CONDITIONAL([ENABLE_GTK_DOC], false)<br>
+ <br>
+ GOBJECT_INTROSPECTION_CHECK([1.30.0])<br>
+ <br>
+-PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-0.7 jso=
n-glib-1.0])<br>
++PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0 rest-1.0 jso=
n-glib-1.0])<br>
+ <br>
+ PKG_CHECK_MODULES(SOUP, [libsoup-2.4])<br>
+ SOUP_UNSTABLE_CPPFLAGS=3D-DLIBSOUP_USE_UNSTABLE_REQUEST_API<br>
+diff --git a/gfbgraph/Makefile.am b/gfbgraph/Makefile.am<br>
+index d07b90d..b993ab7 100644<br>
+--- a/gfbgraph/Makefile.am<br>
++++ b/gfbgraph/Makefile.am<br>
+@@ -60,7 +60,7 @@ GFBGraph_@API_MAJOR@_@API_MINOR@_gir_INCLUDES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GLib-2.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Gio-2.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GObject-2.0=C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 Rest-0.7=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 Rest-1.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Json-1.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Soup-2.4<br>
+ <br>
+diff --git a/<a href=3D"http://libgfbgraph.pc.in" rel=3D"noreferrer" targe=
t=3D"_blank">libgfbgraph.pc.in</a> b/<a href=3D"http://libgfbgraph.pc.in" r=
el=3D"noreferrer" target=3D"_blank">libgfbgraph.pc.in</a><br>
+index f87073e..d4f4e3a 100644<br>
+--- a/<a href=3D"http://libgfbgraph.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">libgfbgraph.pc.in</a><br>
++++ b/<a href=3D"http://libgfbgraph.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">libgfbgraph.pc.in</a><br>
+@@ -9,6 +9,6 @@ apiversion=3D@API_VERSION@<br>
+ Name: libgfbgraph<br>
+ Description: GObject library for Facebook Graph API<br>
+ Version: @VERSION@<br>
+-Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-0.7<br>
++Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4 rest-1.0<br>
+ Libs: -L${libdir} -lgfbgraph-${apiversion}<br>
+ Cflags: -I${includedir}/gfbgraph-@API_VERSION@<br>
diff --git a/meta-gnome/recipes-gnome/gfbgraph/<a href=3D"http://gfbgraph_0=
.2.4.bb" rel=3D"noreferrer" target=3D"_blank">gfbgraph_0.2.4.bb</a> b/meta-=
gnome/recipes-gnome/gfbgraph/<a href=3D"http://gfbgraph_0.2.4.bb" rel=3D"no=
referrer" target=3D"_blank">gfbgraph_0.2.4.bb</a><br>
index 1c5d90f6c7..23b3bf63a5 100644<br>
--- a/meta-gnome/recipes-gnome/gfbgraph/<a href=3D"http://gfbgraph_0.2.4.bb=
" rel=3D"noreferrer" target=3D"_blank">gfbgraph_0.2.4.bb</a><br>
+++ b/meta-gnome/recipes-gnome/gfbgraph/<a href=3D"http://gfbgraph_0.2.4.bb=
" rel=3D"noreferrer" target=3D"_blank">gfbgraph_0.2.4.bb</a><br>
@@ -10,8 +10,9 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gnome-online-accounts \<br>
=C2=A0&quot;<br>
<br>
-inherit gnomebase gtk-doc gobject-introspection<br>
+inherit gnomebase gtk-doc gobject-introspection pkgconfig<br>
<br>
+SRC_URI +=3D &quot; file://0001-Update-rest-requirement-to-rest-1.0.patch&=
quot;<br>
=C2=A0SRC_URI[archive.md5sum] =3D &quot;c38af63e49f8fe8baad99537956b69ba&qu=
ot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;6065391f35e7335588cc6b0cc4c1abbc=
e7341488573a654551264cb9793b9379&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93431): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93431" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93431</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86418475/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
86418475/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000044354205cea44ea9--

