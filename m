Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52BDC433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 04:41:45 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.5507.1634618504352971287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SEycHo9N;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id d125so18894411iof.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fF2/O6OTgKQd7EiMREeiXMvBGQbKvdkHxr6nglwjqZ4=;
        b=SEycHo9NpmgKqbkBinsmlV6ZLQGDy6yfnWykqYU4cq9l8ifT9uNEBeOdDjb8m664xk
         TxfRfGGlQ9U8XsBHSyyAvIwshdIVyn0wijNMMtxeqhMXUrCCu/B4ieeR/s0yCburZ30U
         tfjNiJOdJYFXpJKI02Wo1VpjVdZGVz/qIE9PhKhLa/LS3PlgEEh54p4OBrIF2KFkWXmU
         Dj1Q0TeV1ZjnZBck32AHGB0S2khuBRFnNDSg9vGrEMMX9Lejsd8pDrVqAQd9QN4P5PDH
         lypvBo9/JizY28sp+FeKPQmgMJCbhBlotf380fs+Em6unmWu1bS5u/HXWZlLBdxhA0uN
         T01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fF2/O6OTgKQd7EiMREeiXMvBGQbKvdkHxr6nglwjqZ4=;
        b=cYjgmSJ+OsXRQBKEFBJWFSz7PNxPOUwuo6DwFO3duNWOjRq3eGbk8e9lTUP2rO9jS6
         PWOwMlpEQZ+R6w/xuKmJyXl2hiCIL0cG3gEV02buuY82P1KW4A6wvgINT4XAkR3rP9+k
         b3UFjzwafBT+j31pFjpqtMhiy4Gmz1D30qjYRHdpXCp0VFBvoA21B8NG4p1a3giyW05E
         wwvN0tlXm/kmQc9fG8vefvQZa1I7eF+H3h9ckEhTuIuYttmbWalsqv+5C4ptqckZT1rQ
         kH/sbaoFPv3+Rvq1+S/kP4s8SxDIxxADuf8th8iV2awoq6kN6wKC2ZDkHI3j4xqvMHx0
         uTcQ==
X-Gm-Message-State: AOAM530Mwe/TpCZnwbtz9DYh2dokfeAtoMriOUKe71sfJ+d9b9YiJa8V
	/pkbm9Y4qL58VFYfcxvZMtUAIsdb7WMUUR0D7io=
X-Google-Smtp-Source: 
 ABdhPJyFdyd3arbOSWndd5mW3D3JAixxY2jnoYxIwCI/9Ns0Uz8N8L5M6edTM7E+7lZJL1VbyZksNnbENyEObuXEOpY=
X-Received: by 2002:a05:6602:1651:: with SMTP id
 y17mr17382601iow.114.1634618503506;
 Mon, 18 Oct 2021 21:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <16AF2CA329793B3C.24927@lists.openembedded.org>
 <CANx9H-DD_XYqMosG1zY0G5e4m1JDQGdBs0qeH4Dhn_=m=p8Yxg@mail.gmail.com>
 <b3369c48-065c-03ab-100a-da594d72f722@gmail.com>
In-Reply-To: <b3369c48-065c-03ab-100a-da594d72f722@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 18 Oct 2021 21:41:32 -0700
Message-ID: 
 <CANx9H-Aq34_yh6HTAPBMmocrQ6nX6gVjLEndiUc13Ve81DjSCg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gfbgraph: patch to build with latest
 rest
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003eac8805cead47d6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 04:41:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93454

--0000000000003eac8805cead47d6
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 9:06 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 10/18/21 10:59, Tim Orling wrote:
> >
> >
> > On Mon, Oct 18, 2021 at 9:24 AM Tim Orling via lists.openembedded.org
> > <http://lists.openembedded.org>
> > <ticotimo=gmail.com@lists.openembedded.org
> > <mailto:gmail.com@lists.openembedded.org>> wrote:
> >
> >     librest 0.8.1 declares rest-1.0 and was released four years ago.
> >
> >
> > This turns out to be incorrect, the rest-1.0 declaration is in the
> > master branch, which we picked up with
> > https://lists.openembedded.org/g/openembedded-devel/message/93412
> > <https://lists.openembedded.org/g/openembedded-devel/message/93412
>
> yeah I was a bit torn on it since there is no 0.9 release for librest
> which is ABI breaking release but then to support libsoup3 that is what
> is needed and also the webkitgtk 2.34 upgrade has API change  from 4.0
> to 4.1, so all sort of pieces moving around.
>

It was the right thing to do. The GNOME ecosystem is a bit in flux and
frustrating right now. I was merely fessing up to making invalid implicit
statements about upstream gfbgraph.


> >
> >
> >     Also inherit pkgconfig so that dependencies can be found by
> pkg-config
> >
> >     References:
> >     https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6
> >     <https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6>
> >
> >     Signed-off-by: Tim Orling <ticotimo@gmail.com
> >     <mailto:ticotimo@gmail.com>>
> >     ---
> >       ...-Update-rest-requirement-to-rest-1.0.patch | 72
> +++++++++++++++++++
> >       .../recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> >     <http://gfbgraph_0.2.4.bb>  |  3 +-
> >       2 files changed, 74 insertions(+), 1 deletion(-)
> >       create mode 100644
> >
>  meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
> >
> >     diff --git
> >
>  a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
> >
>  b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
> >     new file mode 100644
> >     index 0000000000..c24a9e569f
> >     --- /dev/null
> >     +++
> >
>  b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Update-rest-requirement-to-rest-1.0.patch
> >     @@ -0,0 +1,72 @@
> >     +From d058e6eb6c9ebf5f4fff89ec0ac93323fc64c1ba Mon Sep 17 00:00:00
> 2001
> >     +From: Tim Orling <ticotimo@gmail.com <mailto:ticotimo@gmail.com>>
> >     +Date: Mon, 18 Oct 2021 08:42:35 -0700
> >     +Subject: [PATCH] Update rest requirement to rest-1.0
> >     +
> >     +librest 0.8.1 declares rest-1.0 and was released four years ago.
> >     +
> >     +
> https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b92701f70fc368ad64bd25cefaea043f87
> >     <
> https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b92701f70fc368ad64bd25cefaea043f87
> >
> >     +
> >     +Upstream-Status: Submitted
> >     +[https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6
> >     <https://gitlab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6>]
> >     +
> >     +Signed-off-by: Tim Orling <ticotimo@gmail.com
> >     <mailto:ticotimo@gmail.com>>
> >     +
> >     +---
> >     + .dir-locals.el       | 2 +-
> >     + configure.ac <http://configure.ac>         | 2 +-
> >     + gfbgraph/Makefile.am | 2 +-
> >     + libgfbgraph.pc.in <http://libgfbgraph.pc.in>    | 2 +-
> >     + 4 files changed, 4 insertions(+), 4 deletions(-)
> >     +
> >     +diff --git a/.dir-locals.el b/.dir-locals.el
> >     +index 77abbf0..d39cdf2 100644
> >     +--- a/.dir-locals.el
> >     ++++ b/.dir-locals.el
> >     +@@ -3,7 +3,7 @@
> >     +                                "/usr/include/json-glib-1.0"
> >     +                                "/usr/include/goa-1.0"
> >     +                                "/usr/lib64/goa-1.0/include"
> >     +-                               "/usr/include/rest-0.7"
> >     ++                               "/usr/include/rest-1.0"
> >     +                                "/usr/include/dbus-1.0"
> >     +                                "/usr/lib64/dbus-1.0/include"
> >     +                                "/usr/include/gio-unix-2.0/"
> >     +diff --git a/configure.ac <http://configure.ac> b/configure.ac
> >     <http://configure.ac>
> >     +index fd1231f..9b49f3f 100644
> >     +--- a/configure.ac <http://configure.ac>
> >     ++++ b/configure.ac <http://configure.ac>
> >     +@@ -40,7 +40,7 @@ AM_CONDITIONAL([ENABLE_GTK_DOC], false)
> >     +
> >     + GOBJECT_INTROSPECTION_CHECK([1.30.0])
> >     +
> >     +-PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0
> >     rest-0.7 json-glib-1.0])
> >     ++PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 gobject-2.0
> >     rest-1.0 json-glib-1.0])
> >     +
> >     + PKG_CHECK_MODULES(SOUP, [libsoup-2.4])
> >     + SOUP_UNSTABLE_CPPFLAGS=-DLIBSOUP_USE_UNSTABLE_REQUEST_API
> >     +diff --git a/gfbgraph/Makefile.am b/gfbgraph/Makefile.am
> >     +index d07b90d..b993ab7 100644
> >     +--- a/gfbgraph/Makefile.am
> >     ++++ b/gfbgraph/Makefile.am
> >     +@@ -60,7 +60,7 @@ GFBGraph_@API_MAJOR@_@API_MINOR@_gir_INCLUDES = \
> >     +       GLib-2.0        \
> >     +       Gio-2.0         \
> >     +       GObject-2.0     \
> >     +-      Rest-0.7        \
> >     ++      Rest-1.0        \
> >     +       Json-1.0        \
> >     +       Soup-2.4
> >     +
> >     +diff --git a/libgfbgraph.pc.in <http://libgfbgraph.pc.in>
> >     b/libgfbgraph.pc.in <http://libgfbgraph.pc.in>
> >     +index f87073e..d4f4e3a 100644
> >     +--- a/libgfbgraph.pc.in <http://libgfbgraph.pc.in>
> >     ++++ b/libgfbgraph.pc.in <http://libgfbgraph.pc.in>
> >     +@@ -9,6 +9,6 @@ apiversion=@API_VERSION@
> >     + Name: libgfbgraph
> >     + Description: GObject library for Facebook Graph API
> >     + Version: @VERSION@
> >     +-Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4
> rest-0.7
> >     ++Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 libsoup-2.4
> rest-1.0
> >     + Libs: -L${libdir} -lgfbgraph-${apiversion}
> >     + Cflags: -I${includedir}/gfbgraph-@API_VERSION@
> >     diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> >     <http://gfbgraph_0.2.4.bb>
> >     b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> >     <http://gfbgraph_0.2.4.bb>
> >     index 1c5d90f6c7..23b3bf63a5 100644
> >     --- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> >     <http://gfbgraph_0.2.4.bb>
> >     +++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
> >     <http://gfbgraph_0.2.4.bb>
> >     @@ -10,8 +10,9 @@ DEPENDS = " \
> >           gnome-online-accounts \
> >       "
> >
> >     -inherit gnomebase gtk-doc gobject-introspection
> >     +inherit gnomebase gtk-doc gobject-introspection pkgconfig
> >
> >     +SRC_URI += " file://0001-Update-rest-requirement-to-rest-1.0.patch"
> >       SRC_URI[archive.md5sum] = "c38af63e49f8fe8baad99537956b69ba"
> >       SRC_URI[archive.sha256sum] =
> >     "6065391f35e7335588cc6b0cc4c1abbce7341488573a654551264cb9793b9379"
> >
> >     --
> >     2.30.2
> >
> >
> >
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#93441):
> https://lists.openembedded.org/g/openembedded-devel/message/93441
> > Mute This Topic: https://lists.openembedded.org/mt/86418475/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000003eac8805cead47d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 18, 2021 at 9:06 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
<br>
On 10/18/21 10:59, Tim Orling wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Oct 18, 2021 at 9:24 AM Tim Orling via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> <br>
&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://lists.openembedded.org</a>&gt; <br>
&gt; &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0librest 0.8.1 declares rest-1.0 and was released fo=
ur years ago.<br>
&gt; <br>
&gt; <br>
&gt; This turns out to be incorrect, the rest-1.0 declaration is in the <br=
>
&gt; master branch, which we picked up with<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/93412" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/message/93412</a> <br>
&gt; &lt;<a href=3D"https://lists.openembedded.org/g/openembedded-devel/mes=
sage/93412" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-devel/message/93412</a><br>
<br>
yeah I was a bit torn on it since there is no 0.9 release for librest <br>
which is ABI breaking release but then to support libsoup3 that is what <br=
>
is needed and also the webkitgtk 2.34 upgrade has API change=C2=A0 from 4.0=
 <br>
to 4.1, so all sort of pieces moving around.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It was the right=
 thing to do. The GNOME ecosystem is a bit in flux and frustrating right no=
w. I was merely fessing up to making invalid implicit statements about upst=
ream gfbgraph.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also inherit pkgconfig so that dependencies can be =
found by pkg-config<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0References:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.gnome.org/GNOME/libgfbgra=
ph/-/merge_requests/6" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
gnome.org/GNOME/libgfbgraph/-/merge_requests/6</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.gnome.org/GNOME/libgf=
bgraph/-/merge_requests/6" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tic=
otimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-Update-rest-requirement-to-rest-1.0.patc=
h | 72 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.../recipes-gnome/gfbgraph/<a href=3D"http:/=
/gfbgraph_0.2.4.bb" rel=3D"noreferrer" target=3D"_blank">gfbgraph_0.2.4.bb<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gfbgraph_0.2.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://gfbgraph_0.2.4.bb</a>&gt;=C2=A0 |=C2=A0 3=
 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02 files changed, 74 insertions(+), 1 deletio=
n(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-Upd=
ate-rest-requirement-to-rest-1.0.patch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-U=
pdate-rest-requirement-to-rest-1.0.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-U=
pdate-rest-requirement-to-rest-1.0.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..c24a9e569f<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph/0001-U=
pdate-rest-requirement-to-rest-1.0.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,72 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From d058e6eb6c9ebf5f4fff89ec0ac93323fc64c1ba Mon =
Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gm=
ail.com" target=3D"_blank">ticotimo@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt;&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Mon, 18 Oct 2021 08:42:35 -0700<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] Update rest requirement to rest-1=
.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+librest 0.8.1 declares rest-1.0 and was released f=
our years ago.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<a href=3D"https://gitlab.gnome.org/GNOME/librest/=
-/commit/2971b3b92701f70fc368ad64bd25cefaea043f87" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b92701f7=
0fc368ad64bd25cefaea043f87</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.gnome.org/GNOME/libre=
st/-/commit/2971b3b92701f70fc368ad64bd25cefaea043f87" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.gnome.org/GNOME/librest/-/commit/2971b3b9270=
1f70fc368ad64bd25cefaea043f87</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0+[<a href=3D"https://gitlab.gnome.org/GNOME/libgfbg=
raph/-/merge_requests/6" rel=3D"noreferrer" target=3D"_blank">https://gitla=
b.gnome.org/GNOME/libgfbgraph/-/merge_requests/6</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.gnome.org/GNOME/libgf=
bgraph/-/merge_requests/6" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.gnome.org/GNOME/libgfbgraph/-/merge_requests/6</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ti=
cotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ .dir-locals.el=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+ <a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ gfbgraph/Makefile.am | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ <a href=3D"http://libgfbgraph.pc.in" rel=3D"noref=
errer" target=3D"_blank">libgfbgraph.pc.in</a> &lt;<a href=3D"http://libgfb=
graph.pc.in" rel=3D"noreferrer" target=3D"_blank">http://libgfbgraph.pc.in<=
/a>&gt;=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 4 files changed, 4 insertions(+), 4 deletions(-)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/.dir-locals.el b/.dir-locals.el<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 77abbf0..d39cdf2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/.dir-locals.el<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/.dir-locals.el<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -3,7 +3,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/i=
nclude/json-glib-1.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/i=
nclude/goa-1.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/l=
ib64/goa-1.0/include&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/usr/in=
clude/rest-0.7&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/usr/in=
clude/rest-1.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/i=
nclude/dbus-1.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/l=
ib64/dbus-1.0/include&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/usr/i=
nclude/gio-unix-2.0/&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://co=
nfigure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt=
; b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">co=
nfigure.ac</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">http://configure.ac</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index fd1231f..9b49f3f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -40,7 +40,7 @@ AM_CONDITIONAL([ENABLE_GTK_DOC],=
 false)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ GOBJECT_INTROSPECTION_CHECK([1.30.0])<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 =
gobject-2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0rest-0.7 json-glib-1.0])<br>
&gt;=C2=A0 =C2=A0 =C2=A0++PKG_CHECK_MODULES(LIBGFBGRAPH, [glib-2.0 gio-2.0 =
gobject-2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0rest-1.0 json-glib-1.0])<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ PKG_CHECK_MODULES(SOUP, [libsoup-2.4])<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ SOUP_UNSTABLE_CPPFLAGS=3D-DLIBSOUP_USE_UNSTABLE_R=
EQUEST_API<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gfbgraph/Makefile.am b/gfbgraph/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index d07b90d..b993ab7 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gfbgraph/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gfbgraph/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -60,7 +60,7 @@ GFBGraph_@API_MAJOR@_@API_MINOR@=
_gir_INCLUDES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0GLib-2.0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0Gio-2.0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0GObject-2.0=C2=A0 =C2=
=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 Rest-0.7=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 Rest-1.0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0Json-1.0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0Soup-2.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/<a href=3D"http://libgfbgraph.pc.in" =
rel=3D"noreferrer" target=3D"_blank">libgfbgraph.pc.in</a> &lt;<a href=3D"h=
ttp://libgfbgraph.pc.in" rel=3D"noreferrer" target=3D"_blank">http://libgfb=
graph.pc.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/<a href=3D"http://libgfbgraph.pc.in" rel=3D"noref=
errer" target=3D"_blank">libgfbgraph.pc.in</a> &lt;<a href=3D"http://libgfb=
graph.pc.in" rel=3D"noreferrer" target=3D"_blank">http://libgfbgraph.pc.in<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index f87073e..d4f4e3a 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/<a href=3D"http://libgfbgraph.pc.in" rel=3D"=
noreferrer" target=3D"_blank">libgfbgraph.pc.in</a> &lt;<a href=3D"http://l=
ibgfbgraph.pc.in" rel=3D"noreferrer" target=3D"_blank">http://libgfbgraph.p=
c.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/<a href=3D"http://libgfbgraph.pc.in" rel=3D"=
noreferrer" target=3D"_blank">libgfbgraph.pc.in</a> &lt;<a href=3D"http://l=
ibgfbgraph.pc.in" rel=3D"noreferrer" target=3D"_blank">http://libgfbgraph.p=
c.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -9,6 +9,6 @@ apiversion=3D@API_VERSION@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Name: libgfbgraph<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Description: GObject library for Facebook Graph A=
PI<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Version: @VERSION@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 =
libsoup-2.4 rest-0.7<br>
&gt;=C2=A0 =C2=A0 =C2=A0++Requires: gio-2.0 glib-2.0 goa-1.0 json-glib-1.0 =
libsoup-2.4 rest-1.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Libs: -L${libdir} -lgfbgraph-${apiversion}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Cflags: -I${includedir}/gfbgraph-@API_VERSION@<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-gnome/recipes-gnome/gfbgraph/<a h=
ref=3D"http://gfbgraph_0.2.4.bb" rel=3D"noreferrer" target=3D"_blank">gfbgr=
aph_0.2.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gfbgraph_0.2.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://gfbgraph_0.2.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-gnome/recipes-gnome/gfbgraph/<a href=3D"http=
://gfbgraph_0.2.4.bb" rel=3D"noreferrer" target=3D"_blank">gfbgraph_0.2.4.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gfbgraph_0.2.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://gfbgraph_0.2.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 1c5d90f6c7..23b3bf63a5 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-gnome/recipes-gnome/gfbgraph/<a href=3D"=
http://gfbgraph_0.2.4.bb" rel=3D"noreferrer" target=3D"_blank">gfbgraph_0.2=
.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gfbgraph_0.2.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://gfbgraph_0.2.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-gnome/recipes-gnome/gfbgraph/<a href=3D"=
http://gfbgraph_0.2.4.bb" rel=3D"noreferrer" target=3D"_blank">gfbgraph_0.2=
.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gfbgraph_0.2.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">http://gfbgraph_0.2.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -10,8 +10,9 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnome-online-accounts \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-inherit gnomebase gtk-doc gobject-introspection<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+inherit gnomebase gtk-doc gobject-introspection pk=
gconfig<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI +=3D &quot; file://0001-Update-rest-requir=
ement-to-rest-1.0.patch&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI[archive.md5sum] =3D &quot;c38af63e49=
f8fe8baad99537956b69ba&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI[archive.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;6065391f35e7335588cc6b0cc4c1abbce7341488573a6=
54551264cb9793b9379&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.30.2<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#93441): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/93441" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/93441</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86418475=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86418475/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000003eac8805cead47d6--

