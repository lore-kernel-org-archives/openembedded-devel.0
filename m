Return-Path: <perceval.arenou@ptxtrimble.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4356C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 17:21:03 +0000 (UTC)
Received: from us-smtp-delivery-109.mimecast.com (us-smtp-delivery-109.mimecast.com [170.10.129.109])
 by mx.groups.io with SMTP id smtpd.web11.27130.1713547259145180341
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 10:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ptxtrimble.com header.s=mimecast20240319 header.b=IrStqA0D;
 spf=pass (domain: ptxtrimble.com, ip: 170.10.129.109, mailfrom: perceval.arenou@ptxtrimble.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ptxtrimble.com;
	s=mimecast20240319; t=1713547258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S2QLU2wFAXjXrleEACXmJkg4YO2wtj9CEZPrF7OWryg=;
	b=IrStqA0DXFHK7mxXlFZ3xcIlo6RFZ6han9jIq9imvr7JqvrqYsGxq3FdUrvch11mHm5ppU
	Rq9KrAASk6ig8uVSjZ4buBbv8ArMyIy3vZBXZ3ZhdEfsv1kzxUUljFWvPAoxMr3E5u/6t1
	zt3zvlJ68Lb8I7stu87l9khDQ8WZCmw=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-RUrwJodsP-WFQEl3FEvivw-3; Fri, 19 Apr 2024 13:20:55 -0400
X-MC-Unique: RUrwJodsP-WFQEl3FEvivw-3
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-22ed3aaf340so2540674fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 10:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713547255; x=1714152055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHVooI8ifeoDGcnefVRzcTtB5vNKV1GbThbpILO11g8=;
        b=A2JcA+G7lLKbYgELqbcq8p65yKqnm8MybVy6nZ/kFJ1OrhJfAuAAgEDGOX/iQ0/Tiq
         Evw1cBfOiYkFT9saVaKc4ra1Wsnf/qJn1t/YYxD8I4lDrgBDPDCSC8L0rTJbIG8Z4fzd
         lB84M+Z8Ix7tv+hVjYfCdmK3cinQ6Id13j5PpkH/rY42dEf+GiLd/bzaU9ELizbuJcwz
         t8f49lea8x+mx6/9j4UXIZS7FfCOjlq0HhTI1mSlM8lKxcNbE9mzbj9hkLxZULAeUjbC
         9aei5uCtIvtU5jHVmuVhBo4VxPeLhslgn5AlfHpmK7ybzvX3BUi4VeVMm0MAi3r25oF1
         AIig==
X-Gm-Message-State: AOJu0YyTcctUXqH7oLfUvKp1R2fuauDknNy32HEmeQBJq+uzJJB+rHZ7
	e15nErqGtYDrn2ksM8gXzte+M9sPVRnGxx0UAYfDk+nzqcSlyhjLPGljn48kgZ09MJ/OuLEhlWl
	r2grc5zJ3xhtIAgRkZNlHrAW+3sdfuf3zt4TCQp5yPbv5HE2ZRc+fbj9Obz3yeJg3BRx8Bdr3iH
	WXCV3E5oSDMm7JsYNNxEkWA5/NUjW6DB2oa/azjT9jA2ugPwhf7PYcxIqSBQlREfDwJWWr0PbZy
	C8HPn0hgCi+itwbWoQ=
X-Received: by 2002:a05:6871:64c5:b0:22e:ace7:81b9 with SMTP id rk5-20020a05687164c500b0022eace781b9mr3272388oab.2.1713547255307;
        Fri, 19 Apr 2024 10:20:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpm2T23euyFcRQA5YobGyYmgz3lXkTzsKTD8BIYPJB5noJBlne5BdSiDHQCFUNT9NnLP0gAoRRYdH/bYwBacA=
X-Received: by 2002:a05:6871:64c5:b0:22e:ace7:81b9 with SMTP id
 rk5-20020a05687164c500b0022eace781b9mr3272359oab.2.1713547254900; Fri, 19 Apr
 2024 10:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <17C71645B7063D93.20815@lists.openembedded.org>
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com> <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com>
In-Reply-To: <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com>
From: Perceval Arenou <perceval.arenou@ptxtrimble.com>
Date: Fri, 19 Apr 2024 19:20:43 +0200
Message-ID: <CAC=Bj8iMNBDdUVuZZWYd_JT-BgwuLHt2iGEDcrHjTe59_fH8AA@mail.gmail.com>
Subject: Re: [External] Re: [oe] [meta-multimedia][PATCH] aravis: new recipe
 aravis is a vision library for genicam based cameras. aravis project allows
 to stream from genicam and GigE cameras
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Cc: Perceval Arenou <perceval.arenou@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ptxtrimble.com
Content-Type: multipart/alternative; boundary="0000000000006f43e30616764f1c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 17:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110064

--0000000000006f43e30616764f1c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Perceval Arenou <perceval.arenou@gmail.com>


---
 .../aravis/aravis_0.8.31.bb                   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/aravis/
aravis_0.8.31.bb

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
new file mode 100644
index 000000000..52e276c7b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "A vision library for genicam based cameras"
+DESCRIPTION =3D "\
+    Aravis is a glib/gobject based library for video acquisition using
Genicam cameras.\
+    It currently implements the gigabit ethernet and USB3 protocols used
by industrial cameras.\
+    It also provides a basic ethernet camera simulator and a simple video
viewer.\
+"
+AUTHOR =3D "Emmanuel Pacaud"
+HOMEPAGE =3D "https://github.com/AravisProject/aravis"
+LICENSE =3D "LGPL-2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
+
+DEPENDS +=3D "\
+    glib-2.0 \
+    glib-2.0-native \
+    libxml2 \
+    zlib \
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
+PACKAGECONFIG ?=3D "gstreamer usb viewer"
+PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisab=
led,
gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
+PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3
gstreamer1.0-plugins-base,"
+
+FILES:${PN} +=3D "\
+    ${datadir} \
+    ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
+"
--=20
2.43.0


On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 19 Apr 2024, at 15:58, Perceval via lists.openembedded.org
> <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
> > +# These options are found in AravisProject/aravis meson_options.txt
>
> No need to comment where they came from, this is the only place they can
> be defined.
>
> > +EXTRA_OEMESON +=3D "\
> > +    -Ddocumentation=3Ddisabled \
>
> If would be good to use the gi-docgen class and respect the
> api-documentation DISTRO_FEATURE instead of just turning this off.
>
> > +    -Dfast-heartbeat=3Dfalse \
>
> Default value, remove.
>
> > +    -Dpacket-socket=3Denabled \
>
> Can=E2=80=99t you leave this as the default and let Meson detect?
>
> > +inherit_defer meson pkgconfig ${@bb.utils.contains('PACKAGECONFIG',
> 'introspection', 'gobject-introspection', '', d)}
>
> Only defer gobject-introspection, not the others.
>
> > +PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,
> -Dintrospection=3Ddisabled, gobject-introspection,=E2=80=9D
>
> The gobject-introspection class will do this for you, remove this line.
>
> Ross



--=20

*Perceval ARENOU*
Embedded Operating System Engineer
*PTxTrimble* formerly Bilberry



--0000000000006f43e30616764f1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body><div dir=3D"ltr"><div class=3D"gmail_default" style=
=3D"color:#000000">From: Perceval Arenou &lt;<a href=3D"mailto:perceval.are=
nou@gmail.com">perceval.arenou@gmail.com</a>&gt;<br><br><br>---<br>=C2=A0..=
./aravis/<a href=3D"http://aravis_0.8.31.bb">aravis_0.8.31.bb</a> =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 ++++++++++++++=
+++++<br>=C2=A01 file changed, 40 insertions(+)<br>=C2=A0create mode 100644=
 meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.=
bb">aravis_0.8.31.bb</a><br><br>diff --git a/meta-multimedia/recipes-multim=
edia/aravis/<a href=3D"http://aravis_0.8.31.bb">aravis_0.8.31.bb</a> b/meta=
-multimedia/recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb">a=
ravis_0.8.31.bb</a><br>new file mode 100644<br>index 000000000..52e276c7b<b=
r>--- /dev/null<br>+++ b/meta-multimedia/recipes-multimedia/aravis/<a href=
=3D"http://aravis_0.8.31.bb">aravis_0.8.31.bb</a><br>@@ -0,0 +1,40 @@<br>+S=
UMMARY =3D &quot;A vision library for genicam based cameras&quot;<br>+DESCR=
IPTION =3D &quot;\<br>+ =C2=A0 =C2=A0Aravis is a glib/gobject based library=
 for video acquisition using Genicam cameras.\<br>+ =C2=A0 =C2=A0It current=
ly implements the gigabit ethernet and USB3 protocols used by industrial ca=
meras.\<br>+ =C2=A0 =C2=A0It also provides a basic ethernet camera simulato=
r and a simple video viewer.\<br>+&quot;<br>+AUTHOR =3D &quot;Emmanuel Paca=
ud&quot;<br>+HOMEPAGE =3D &quot;<a href=3D"https://github.com/AravisProject=
/aravis">https://github.com/AravisProject/aravis</a>&quot;<br>+LICENSE =3D =
&quot;LGPL-2.1&quot;<br>+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4f=
bd65380cdd255951079008b364516c&quot;<br>+<br>+DEPENDS +=3D &quot;\<br>+ =C2=
=A0 =C2=A0glib-2.0 \<br>+ =C2=A0 =C2=A0glib-2.0-native \<br>+ =C2=A0 =C2=A0=
libxml2 \<br>+ =C2=A0 =C2=A0zlib \<br>+&quot;<br>+<br>+SRC_URI =3D &quot;<a=
 href=3D"https://github.com/AravisProject/aravis/releases/download/${PV}/${=
BPN}-${PV}.tar.xz">https://github.com/AravisProject/aravis/releases/downloa=
d/${PV}/${BPN}-${PV}.tar.xz</a>&quot;<br>+SRC_URI[sha256sum] =3D &quot;9c4e=
be6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0212c4311a084da&quot;<br>+<br>=
+EXTRA_OEMESON +=3D &quot;-Dtests=3Dfalse&quot;<br>+<br>+GIR_MESON_ENABLE_F=
LAG =3D &#39;enabled&#39;<br>+GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;=
<br>+GIDOCGEN_MESON_OPTION =3D &quot;documentation&quot;<br>+GIDOCGEN_MESON=
_ENABLE_FLAG =3D &quot;enabled&quot;<br>+GIDOCGEN_MESON_DISABLE_FLAG =3D &q=
uot;disabled&quot;<br>+<br>+inherit meson pkgconfig gi-docgen gobject-intro=
spection<br>+<br>+PACKAGECONFIG ?=3D &quot;gstreamer usb viewer&quot;<br>+P=
ACKAGECONFIG[gstreamer] =3D &quot;-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddi=
sabled, gstreamer1.0 gstreamer1.0-plugins-base,&quot;<br>+PACKAGECONFIG[usb=
] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,&quot;<br>+PACKAGECO=
NFIG[viewer] =3D &quot;-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3 gstre=
amer1.0-plugins-base,&quot;<br>+<br>+FILES:${PN} +=3D &quot;\<br>+ =C2=A0 =
=C2=A0${datadir} \<br>+ =C2=A0 =C2=A0${libdir}/gstreamer-1.0/<a href=3D"htt=
p://libgstaravis.0.8.so">libgstaravis.0.8.so</a> \<br>+&quot;<br>-- <br>2.4=
3.0<br><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton &lt;<a=
 href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 19 Apr 2024, at =
15:58, Perceval via <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> &lt;perceval.arenou=3D<a=
 href=3D"mailto:ptxtrimble.com@lists.openembedded.org" target=3D"_blank">pt=
xtrimble.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; +# These options are found in AravisProject/aravis meson_options.txt<b=
r>
<br>
No need to comment where they came from, this is the only place they can be=
 defined.<br>
<br>
&gt; +EXTRA_OEMESON +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 -Ddocumentation=3Ddisabled \<br>
<br>
If would be good to use the gi-docgen class and respect the api-documentati=
on DISTRO_FEATURE instead of just turning this off.<br>
<br>
&gt; +=C2=A0 =C2=A0 -Dfast-heartbeat=3Dfalse \<br>
<br>
Default value, remove.<br>
<br>
&gt; +=C2=A0 =C2=A0 -Dpacket-socket=3Denabled \<br>
<br>
Can=E2=80=99t you leave this as the default and let Meson detect?<br>
<br>
&gt; +inherit_defer meson pkgconfig ${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;introspection&#39;, &#39;gobject-introspection&#39;, &#39;&#39;=
, d)}<br>
<br>
Only defer gobject-introspection, not the others.<br>
<br>
&gt; +PACKAGECONFIG[introspection] =3D &quot;-Dintrospection=3Denabled, -Di=
ntrospection=3Ddisabled, gobject-introspection,=E2=80=9D<br>
<br>
The gobject-introspection class will do this for you, remove this line.<br>
<br>
Ross</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmai=
l_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><font color=3D"#444444" face=3D"arial, sans-serif"><b>Pe=
rceval ARENOU<br></b></font><div><font color=3D"#444444" face=3D"arial, san=
s-serif">Embedded Operating System Engineer</font></div><div><span style=3D=
"color:rgb(68,68,68)"><font face=3D"arial, sans-serif"><b>PTxTrimble</b> fo=
rmerly Bilberry</font></span><br></div></div></div>
<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>   </b></p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666=
;"><br><br> </p></body></html>

--0000000000006f43e30616764f1c--


