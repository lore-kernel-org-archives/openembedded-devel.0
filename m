Return-Path: <perceval.arenou@ptxtrimble.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB53BC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 07:58:48 +0000 (UTC)
Received: from us-smtp-delivery-109.mimecast.com (us-smtp-delivery-109.mimecast.com [170.10.133.109])
 by mx.groups.io with SMTP id smtpd.web11.11785.1714031919074532483
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 00:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ptxtrimble.com header.s=mimecast20240319 header.b=MP/KhsvY;
 spf=pass (domain: ptxtrimble.com, ip: 170.10.133.109, mailfrom: perceval.arenou@ptxtrimble.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ptxtrimble.com;
	s=mimecast20240319; t=1714031918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nc9qPb1zzH0dqrA9lJvmQQCNiaJaZCOz8rs4olnqNwQ=;
	b=MP/KhsvY08AaBHFUx083XZdSZYlgAbRkHg2K5mqbfbZyC/4gcCUKRD4R8lE3cCeBnIvKCc
	T5t1A52c5fOPvCGGdiF+NGY0FeMXtowrgwuY5uCCiVB7xfMHDJbxnkez6cHJiR64f31MWu
	e69JUTwnUVTzOuLQMcARNywuqKYH/Yk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-sxPDBI8wOMqH7XXGd_3bIg-1; Thu, 25 Apr 2024 03:58:34 -0400
X-MC-Unique: sxPDBI8wOMqH7XXGd_3bIg-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5aa1fe6ec61so1665661eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 00:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714031913; x=1714636713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0KwWS+nQ7rPsg+SY8AHNLZ3HHynH97kQudmIO0OqE0=;
        b=eBqbXRhKpg5QY1UOkqA8wjFz3Q/fsuqvKUnPTs1yLnIGTOeS0JkaaLw53IA6EoRL8H
         1sCng/KTShffBeiAWFfcc2nnVJ/242q2UK5KHbtmY6SlayNUOJNwLmbE7x9vPbAnRIBZ
         g/EnCzlc6zbs4pCXCfItErXeqaZUrs+L+iQNFhO4SQi345ZWVPL+3scyMuBP3bbW4lIk
         3khzPgq9h8pcdau8QQVXirbpgwIqtTcsmTbMwSXQr5VtL+2hlCGTIsMec4rZ9l91csw+
         HQhJX56p+q7bq2OAWXBERi28Kc3dg0tJy8fy80XLKDI7Qco9X6AC92rBC9nFDF3twEOb
         hwEw==
X-Gm-Message-State: AOJu0YyBcoZzpVE95RAy5XiU3xde83wXHOq/U0mVzYaERhYIucGcwNfh
	syASSiJGsWf0F+wkYTM7hn2K+OWZoRT9KlU2hks8WUmgPwI+9dSGzIAlifdU6XE8xgQzhh4gnPq
	ROlFQXjKlRE4DRjitUvSuo4qoUqVgZURrNIfLW9lzqvt2xf8ib+UWYHGvisqw87qKZXdEmhHx0I
	D8XoEcUkipzIprscc/TwPJPMf7gL67GBdlTcBLvnDRk0J76LgZ3vYj4ffh2WXuGmL36sEXXAs8D
	QUtLGHWlFGLWR7rutk=
X-Received: by 2002:a05:6871:4143:b0:239:436c:e38f with SMTP id lb3-20020a056871414300b00239436ce38fmr1031765oab.17.1714031913357;
        Thu, 25 Apr 2024 00:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcQ5LuBNEdnzQKdcj7D9TtnqfFoFVfZg2CHw5ObNGrBEdRV0QkW2o4SZRe63qx3ji25GTxOdxkClGWhjpzwQE=
X-Received: by 2002:a05:6871:4143:b0:239:436c:e38f with SMTP id
 lb3-20020a056871414300b00239436ce38fmr1031758oab.17.1714031912975; Thu, 25
 Apr 2024 00:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <17C71645B7063D93.20815@lists.openembedded.org>
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
 <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com> <CAC=Bj8iMNBDdUVuZZWYd_JT-BgwuLHt2iGEDcrHjTe59_fH8AA@mail.gmail.com>
 <17C885AD767F090E.10861@lists.openembedded.org> <CA+chaQcSCyv_Yh8z7zQLMjB+AHL5CLzi5L5yviLddoYTkjBbcg@mail.gmail.com>
In-Reply-To: <CA+chaQcSCyv_Yh8z7zQLMjB+AHL5CLzi5L5yviLddoYTkjBbcg@mail.gmail.com>
From: Perceval Arenou <perceval.arenou@ptxtrimble.com>
Date: Thu, 25 Apr 2024 09:58:22 +0200
Message-ID: <CAC=Bj8gk=AZFkzMggy39cKJhziqsJe6b1P0bafpqWUSxF7NuqQ@mail.gmail.com>
Subject: Re: [External] Re: [oe] [meta-multimedia][PATCH] aravis: new recipe
 aravis is a vision library for genicam based cameras. aravis project allows
 to stream from genicam and GigE cameras
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Cc: Perceval Arenou <perceval.arenou@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ptxtrimble.com
Content-Type: multipart/alternative; boundary="0000000000004ea1380616e727cf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 07:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110148

--0000000000004ea1380616e727cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From ef4194a2f128439eaeba731080dd13e934e5ec01 Mon Sep 17 00:00:00 2001
From: Perceval Arenou <perceval.arenou@gmail.com>
Date: Wed, 17 Apr 2024 15:06:14 +0200
Subject: [PATCH] aravis: new recipe aravis is a vision library for genicam
based cameras. aravis project allows to stream from genicam and GigE camera=
s

---
.../aravis/aravis_0.8.31.bb | 44 +++++++++++++++++++
1 file changed, 44 insertions(+)
create mode 100644 meta-multimedia/recipes-multimedia/aravis/
aravis_0.8.31.bb

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
new file mode 100644
index 000000000..38f10e6d1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
@@ -0,0 +1,44 @@
+SUMMARY =3D "A vision library for genicam based cameras"
+DESCRIPTION =3D "\
+ Aravis is a glib/gobject based library for video acquisition using
Genicam cameras.\
+ It currently implements the gigabit ethernet and USB3 protocols used by
industrial cameras.\
+ It also provides a basic ethernet camera simulator and a simple video
viewer.\
+"
+AUTHOR =3D "Emmanuel Pacaud"
+HOMEPAGE =3D "https://github.com/AravisProject/aravis"
+LICENSE =3D "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
+
+DEPENDS +=3D "\
+ glib-2.0 \
+ glib-2.0-native \
+ libxml2 \
+ zlib \
+"
+
+SRC_URI =3D "
https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV=
}.tar.xz
"
+SRC_URI[sha256sum] =3D
"9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0212c4311a084da"
+
+EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GIDOCGEN_MESON_OPTION =3D "documentation"
+GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
+GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
+
+inherit meson pkgconfig gi-docgen gobject-introspection
+
+PACKAGECONFIG ?=3D "\
+ gstreamer \
+ usb \
+ ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',
'viewer', '', d)} \
+"
+PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisab=
led,
gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
+PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3
gstreamer1.0-plugins-base,"
+
+FILES:${PN} +=3D "\
+ ${datadir} \
+ ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
+"
--=20
2.39.2



On Mon, Apr 22, 2024 at 9:06=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> There is also:
>
> ERROR: Nothing PROVIDES 'gtk+3' (but
> meta-oe/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> DEPENDS on or otherwise requires it)
> gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES
>
> so this recipe should have REQUIRED_DISTRO_FEATURES matching gtk+3 or
> enable viewer PACKAGECONFIG only when wayland or x11 is in
> DISTRO_FEATURES.
>
> On Mon, Apr 22, 2024 at 8:17=E2=80=AFAM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > This is now triggering:
> > ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1
> > [obsolete-license]
> >
> > Looks like it should be LGPL-2.1-only, please send follow-up fix.
> >
> > On Fri, Apr 19, 2024 at 7:21=E2=80=AFPM Perceval via lists.openembedded=
.org
> > <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
> > >
> > > From: Perceval Arenou <perceval.arenou@gmail.com>
> > >
> > >
> > > ---
> > > .../aravis/aravis_0.8.31.bb | 40 +++++++++++++++++++
> > > 1 file changed, 40 insertions(+)
> > > create mode 100644 meta-multimedia/recipes-multimedia/aravis/
> aravis_0.8.31.bb
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/aravis/
> aravis_0.8.31.bb b/meta-multimedia/recipes-multimedia/aravis/
> aravis_0.8.31.bb
> > > new file mode 100644
> > > index 000000000..52e276c7b
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> > > @@ -0,0 +1,40 @@
> > > +SUMMARY =3D "A vision library for genicam based cameras"
> > > +DESCRIPTION =3D "\
> > > + Aravis is a glib/gobject based library for video acquisition using
> Genicam cameras.\
> > > + It currently implements the gigabit ethernet and USB3 protocols use=
d
> by industrial cameras.\
> > > + It also provides a basic ethernet camera simulator and a simple
> video viewer.\
> > > +"
> > > +AUTHOR =3D "Emmanuel Pacaud"
> > > +HOMEPAGE =3D "https://github.com/AravisProject/aravis
> <https://github.com/AravisProject/aravis>
> "
> > > +LICENSE =3D "LGPL-2.1"
> > > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"
> > > +
> > > +DEPENDS +=3D "\
> > > + glib-2.0 \
> > > + glib-2.0-native \
> > > + libxml2 \
> > > + zlib \
> > > +"
> > > +
> > > +SRC_URI =3D "
> https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${=
PV}.tar.xz
> <https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-$=
{PV}.tar.xz>
> "
> > > +SRC_URI[sha256sum] =3D
> "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0212c4311a084da"
> > > +
> > > +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
> > > +
> > > +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> > > +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> > > +GIDOCGEN_MESON_OPTION =3D "documentation"
> > > +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
> > > +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
> > > +
> > > +inherit meson pkgconfig gi-docgen gobject-introspection
> > > +
> > > +PACKAGECONFIG ?=3D "gstreamer usb viewer"
> > > +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled,
> -Dgst-plugin=3Ddisabled, gstreamer1.0 gstreamer1.0-plugins-base,"
> > > +PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
> > > +PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, =
gtk+3
> gstreamer1.0-plugins-base,"
> > > +
> > > +FILES:${PN} +=3D "\
> > > + ${datadir} \
> > > + ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
> > > +"
> > > --
> > > 2.43.0
> > >
> > >
> > > On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton <Ross.Burton@arm.=
com>
> wrote:
> > >>
> > >> On 19 Apr 2024, at 15:58, Perceval via lists.openembedded.org
> <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
> > >> > +# These options are found in AravisProject/aravis meson_options.t=
xt
> > >>
> > >> No need to comment where they came from, this is the only place they
> can be defined.
> > >>
> > >> > +EXTRA_OEMESON +=3D "\
> > >> > + -Ddocumentation=3Ddisabled \
> > >>
> > >> If would be good to use the gi-docgen class and respect the
> api-documentation DISTRO_FEATURE instead of just turning this off.
> > >>
> > >> > + -Dfast-heartbeat=3Dfalse \
> > >>
> > >> Default value, remove.
> > >>
> > >> > + -Dpacket-socket=3Denabled \
> > >>
> > >> Can=E2=80=99t you leave this as the default and let Meson detect?
> > >>
> > >> > +inherit_defer meson pkgconfig
> ${@bb.utils.contains('PACKAGECONFIG', 'introspection',
> 'gobject-introspection', '', d)}
> > >>
> > >> Only defer gobject-introspection, not the others.
> > >>
> > >> > +PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,
> -Dintrospection=3Ddisabled, gobject-introspection,=E2=80=9D
> > >>
> > >> The gobject-introspection class will do this for you, remove this
> line.
> > >>
> > >> Ross
> > >
> > >
> > >
> > > --
> > > Perceval ARENOU
> > > Embedded Operating System Engineer
> > > PTxTrimble formerly Bilberry
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110080):
> https://lists.openembedded.org/g/openembedded-devel/message/110080
> <https://lists.openembedded.org/g/openembedded-devel/message/110080>
> > Mute This Topic: https://lists.openembedded.org/mt/105577746/3617156
> <https://lists.openembedded.org/mt/105577746/3617156>
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> <https://lists.openembedded.org/g/openembedded-devel/unsub>
> [martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20

*Perceval ARENOU*
Embedded Operating System Engineer
*PTxTrimble* formerly Bilberry



--0000000000004ea1380616e727cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body><div dir=3D"ltr"><div class=3D"gmail_default" style=
=3D"color:#000000"><div style=3D"color:rgb(59,59,59);font-family:&quot;Droi=
d Sans Mono&quot;,&quot;monospace&quot;,monospace;font-size:14px;line-heigh=
t:19px;white-space:pre"><div>From ef4194a2f128439eaeba731080dd13e934e5ec01 =
Mon Sep 17 00:00:00 2001<br></div><div>From: Perceval Arenou &lt;<a href=3D=
"mailto:perceval.arenou@gmail.com">perceval.arenou@gmail.com</a>&gt;</div><=
div>Date: Wed, 17 Apr 2024 15:06:14 +0200</div><div>Subject: [PATCH] aravis=
: new recipe aravis is a vision library for genicam</div><div> based camera=
s. aravis project allows to stream from genicam and GigE cameras</div><br><=
div>---</div><div> .../aravis/<a href=3D"http://aravis_0.8.31.bb">aravis_0.=
8.31.bb</a>                   | 44 +++++++++++++++++++</div><div> 1 file ch=
anged, 44 insertions(+)</div><div> create mode 100644 meta-multimedia/recip=
es-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb">aravis_0.8.31.bb</=
a></div><br><div><span style=3D"color:rgb(0,0,128)">diff --git a/meta-multi=
media/recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb">aravis_=
0.8.31.bb</a> b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http:/=
/aravis_0.8.31.bb">aravis_0.8.31.bb</a></span></div><div>new file mode 1006=
44</div><div>index 000000000..38f10e6d1</div><div><span style=3D"color:rgb(=
0,0,128)">--- /dev/null</span></div><div><span style=3D"color:rgb(0,0,128)"=
>+++ b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://aravis_0=
.8.31.bb">aravis_0.8.31.bb</a></span></div><div>@@ -0,0 +1,44 @@</div><div>=
<span style=3D"color:rgb(9,134,88)">+SUMMARY =3D &quot;A vision library for=
 genicam based cameras&quot;</span></div><div><span style=3D"color:rgb(9,13=
4,88)">+DESCRIPTION =3D &quot;\</span></div><div><span style=3D"color:rgb(9=
,134,88)">+    Aravis is a glib/gobject based library for video acquisition=
 using Genicam cameras.\</span></div><div><span style=3D"color:rgb(9,134,88=
)">+    It currently implements the gigabit ethernet and USB3 protocols use=
d by industrial cameras.\</span></div><div><span style=3D"color:rgb(9,134,8=
8)">+    It also provides a basic ethernet camera simulator and a simple vi=
deo viewer.\</span></div><div><span style=3D"color:rgb(9,134,88)">+&quot;</=
span></div><div><span style=3D"color:rgb(9,134,88)">+AUTHOR =3D &quot;Emman=
uel Pacaud&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+HOME=
PAGE =3D &quot;<a href=3D"https://github.com/AravisProject/aravis">https://=
github.com/AravisProject/aravis</a>&quot;</span></div><div><span style=3D"c=
olor:rgb(9,134,88)">+LICENSE =3D &quot;LGPL-2.0-or-later&quot;</span></div>=
<div><span style=3D"color:rgb(9,134,88)">+LIC_FILES_CHKSUM =3D &quot;file:/=
/COPYING;md5=3D4fbd65380cdd255951079008b364516c&quot;</span></div><div><spa=
n style=3D"color:rgb(9,134,88)">+</span></div><div><span style=3D"color:rgb=
(9,134,88)">+DEPENDS +=3D &quot;\</span></div><div><span style=3D"color:rgb=
(9,134,88)">+    glib-2.0 \</span></div><div><span style=3D"color:rgb(9,134=
,88)">+    glib-2.0-native \</span></div><div><span style=3D"color:rgb(9,13=
4,88)">+    libxml2 \</span></div><div><span style=3D"color:rgb(9,134,88)">=
+    zlib \</span></div><div><span style=3D"color:rgb(9,134,88)">+&quot;</s=
pan></div><div><span style=3D"color:rgb(9,134,88)">+</span></div><div><span=
 style=3D"color:rgb(9,134,88)">+SRC_URI =3D &quot;<a href=3D"https://github=
.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}.tar.xz">http=
s://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}.ta=
r.xz</a>&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+SRC_UR=
I[sha256sum] =3D &quot;9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa021=
2c4311a084da&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+</=
span></div><div><span style=3D"color:rgb(9,134,88)">+EXTRA_OEMESON +=3D &qu=
ot;-Dtests=3Dfalse&quot;</span></div><div><span style=3D"color:rgb(9,134,88=
)">+</span></div><div><span style=3D"color:rgb(9,134,88)">+GIR_MESON_ENABLE=
_FLAG =3D &#39;enabled&#39;</span></div><div><span style=3D"color:rgb(9,134=
,88)">+GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;</span></div><div><span=
 style=3D"color:rgb(9,134,88)">+GIDOCGEN_MESON_OPTION =3D &quot;documentati=
on&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+GIDOCGEN_MES=
ON_ENABLE_FLAG =3D &quot;enabled&quot;</span></div><div><span style=3D"colo=
r:rgb(9,134,88)">+GIDOCGEN_MESON_DISABLE_FLAG =3D &quot;disabled&quot;</spa=
n></div><div><span style=3D"color:rgb(9,134,88)">+</span></div><div><span s=
tyle=3D"color:rgb(9,134,88)">+inherit meson pkgconfig gi-docgen gobject-int=
rospection</span></div><div><span style=3D"color:rgb(9,134,88)">+</span></d=
iv><div><span style=3D"color:rgb(9,134,88)">+PACKAGECONFIG ?=3D &quot;\</sp=
an></div><div><span style=3D"color:rgb(9,134,88)">+    gstreamer \</span></=
div><div><span style=3D"color:rgb(9,134,88)">+    usb \</span></div><div><s=
pan style=3D"color:rgb(9,134,88)">+    ${@bb.utils.contains_any(&#39;DISTRO=
_FEATURES&#39;, &#39;${GTK3DISTROFEATURES}&#39;, &#39;viewer&#39;, &#39;&#3=
9;, d)} \</span></div><div><span style=3D"color:rgb(9,134,88)">+&quot;</spa=
n></div><div><span style=3D"color:rgb(9,134,88)">+PACKAGECONFIG[gstreamer] =
=3D &quot;-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisabled, gstreamer1.0 gst=
reamer1.0-plugins-base,&quot;</span></div><div><span style=3D"color:rgb(9,1=
34,88)">+PACKAGECONFIG[usb] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisabled, li=
busb1,&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+PACKAGEC=
ONFIG[viewer] =3D &quot;-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3 gstr=
eamer1.0-plugins-base,&quot;</span></div><div><span style=3D"color:rgb(9,13=
4,88)">+</span></div><div><span style=3D"color:rgb(9,134,88)">+FILES:${PN} =
+=3D &quot;\</span></div><div><span style=3D"color:rgb(9,134,88)">+    ${da=
tadir} \</span></div><div><span style=3D"color:rgb(9,134,88)">+    ${libdir=
}/gstreamer-1.0/<a href=3D"http://libgstaravis.0.8.so">libgstaravis.0.8.so<=
/a> \</span></div><div><span style=3D"color:rgb(9,134,88)">+&quot;</span></=
div><div><span style=3D"color:rgb(163,21,21)">-- </span></div><div>2.39.2</=
div><br><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 22, 2024 at 9:06=E2=80=AFAM Martin Jans=
a &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
There is also:<br>
<br>
ERROR: Nothing PROVIDES &#39;gtk+3&#39; (but<br>
meta-oe/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://aravis_=
0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a><br>
DEPENDS on or otherwise requires it)<br>
gtk+3 was skipped: one of &#39;wayland x11&#39; needs to be in DISTRO_FEATU=
RES<br>
<br>
so this recipe should have REQUIRED_DISTRO_FEATURES matching gtk+3 or<br>
enable viewer PACKAGECONFIG only when wayland or x11 is in<br>
DISTRO_FEATURES.<br>
<br>
On Mon, Apr 22, 2024 at 8:17=E2=80=AFAM Martin Jansa via<br>
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; This is now triggering:<br>
&gt; ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1<br=
>
&gt; [obsolete-license]<br>
&gt;<br>
&gt; Looks like it should be LGPL-2.1-only, please send follow-up fix.<br>
&gt;<br>
&gt; On Fri, Apr 19, 2024 at 7:21=E2=80=AFPM Perceval via <a href=3D"http:/=
/lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;perceval.arenou=3D<a href=3D"mailto:ptxtrimble.com@lists.openembed=
ded.org" target=3D"_blank">ptxtrimble.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; From: Perceval Arenou &lt;<a href=3D"mailto:perceval.arenou@gmail=
.com" target=3D"_blank">perceval.arenou@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;  .../aravis/<a href=3D"http://aravis_0.8.31.bb" target=3D"_blank"=
>aravis_0.8.31.bb</a>                   | 40 +++++++++++++++++++<br>
&gt; &gt;  1 file changed, 40 insertions(+)<br>
&gt; &gt;  create mode 100644 meta-multimedia/recipes-multimedia/aravis/<a =
href=3D"http://aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-multimedia/recipes-multimedia/aravis/<a href=3D=
"http://aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a> b/meta-mul=
timedia/recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb" targe=
t=3D"_blank">aravis_0.8.31.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..52e276c7b<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http:/=
/aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a><br>
&gt; &gt; @@ -0,0 +1,40 @@<br>
&gt; &gt; +SUMMARY =3D &quot;A vision library for genicam based cameras&quo=
t;<br>
&gt; &gt; +DESCRIPTION =3D &quot;\<br>
&gt; &gt; +    Aravis is a glib/gobject based library for video acquisition=
 using Genicam cameras.\<br>
&gt; &gt; +    It currently implements the gigabit ethernet and USB3 protoc=
ols used by industrial cameras.\<br>
&gt; &gt; +    It also provides a basic ethernet camera simulator and a sim=
ple video viewer.\<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +AUTHOR =3D &quot;Emmanuel Pacaud&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/AravisProject/a=
ravis" target=3D"_blank">https://github.com/AravisProject/aravis</a>&quot;<=
br>
&gt; &gt; +LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd2559=
51079008b364516c&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot;\<br>
&gt; &gt; +    glib-2.0 \<br>
&gt; &gt; +    glib-2.0-native \<br>
&gt; &gt; +    libxml2 \<br>
&gt; &gt; +    zlib \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/AravisProject/ar=
avis/releases/download/${PV}/${BPN}-${PV}.tar.xz" target=3D"_blank">https:/=
/github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}.tar.x=
z</a>&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;9c4ebe6273ed3abe466cb6ed8fa5c132bdd=
7e9a9298ca43fa0212c4311a084da&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_OEMESON +=3D &quot;-Dtests=3Dfalse&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
&gt; &gt; +GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
&gt; &gt; +GIDOCGEN_MESON_OPTION =3D &quot;documentation&quot;<br>
&gt; &gt; +GIDOCGEN_MESON_ENABLE_FLAG =3D &quot;enabled&quot;<br>
&gt; &gt; +GIDOCGEN_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit meson pkgconfig gi-docgen gobject-introspection<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGECONFIG ?=3D &quot;gstreamer usb viewer&quot;<br>
&gt; &gt; +PACKAGECONFIG[gstreamer] =3D &quot;-Dgst-plugin=3Denabled, -Dgst=
-plugin=3Ddisabled, gstreamer1.0 gstreamer1.0-plugins-base,&quot;<br>
&gt; &gt; +PACKAGECONFIG[usb] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisabled, =
libusb1,&quot;<br>
&gt; &gt; +PACKAGECONFIG[viewer] =3D &quot;-Dviewer=3Denabled, -Dviewer=3Dd=
isabled, gtk+3 gstreamer1.0-plugins-base,&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +FILES:${PN} +=3D &quot;\<br>
&gt; &gt; +    ${datadir} \<br>
&gt; &gt; +    ${libdir}/gstreamer-1.0/<a href=3D"http://libgstaravis.0.8.s=
o" target=3D"_blank">libgstaravis.0.8.so</a> \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton &lt;<a href=
=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&g=
t; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 19 Apr 2024, at 15:58, Perceval via <a href=3D"http://list=
s.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;percev=
al.arenou=3D<a href=3D"mailto:ptxtrimble.com@lists.openembedded.org" target=
=3D"_blank">ptxtrimble.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; +# These options are found in AravisProject/aravis meson=
_options.txt<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; No need to comment where they came from, this is the only pla=
ce they can be defined.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +EXTRA_OEMESON +=3D &quot;\<br>
&gt; &gt;&gt; &gt; +    -Ddocumentation=3Ddisabled \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If would be good to use the gi-docgen class and respect the a=
pi-documentation DISTRO_FEATURE instead of just turning this off.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +    -Dfast-heartbeat=3Dfalse \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Default value, remove.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +    -Dpacket-socket=3Denabled \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Can=E2=80=99t you leave this as the default and let Meson det=
ect?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +inherit_defer meson pkgconfig ${@bb.utils.contains(&#39=
;PACKAGECONFIG&#39;, &#39;introspection&#39;, &#39;gobject-introspection&#3=
9;, &#39;&#39;, d)}<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Only defer gobject-introspection, not the others.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +PACKAGECONFIG[introspection] =3D &quot;-Dintrospection=
=3Denabled, -Dintrospection=3Ddisabled, gobject-introspection,=E2=80=9D<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The gobject-introspection class will do this for you, remove =
this line.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Ross<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Perceval ARENOU<br>
&gt; &gt; Embedded Operating System Engineer<br>
&gt; &gt; PTxTrimble formerly Bilberry<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#110080): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/110080" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/message/110080</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10557774=
6/3617156" target=3D"_blank">https://lists.openembedded.org/mt/105577746/36=
17156</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedde=
d-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_bla=
nk">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font color=3D"#444444" face=3D"arial, sans-serif"><b>Percev=
al ARENOU<br></b></font><div><font color=3D"#444444" face=3D"arial, sans-se=
rif">Embedded Operating System Engineer</font></div><div><span style=3D"col=
or:rgb(68,68,68)"><font face=3D"arial, sans-serif"><b>PTxTrimble</b> former=
ly Bilberry</font></span><br></div></div></div>
<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>   </b></p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666=
;"><br><br> </p></body></html>

--0000000000004ea1380616e727cf--


