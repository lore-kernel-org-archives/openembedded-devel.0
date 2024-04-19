Return-Path: <perceval.arenou@ptxtrimble.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22420C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 14:58:53 +0000 (UTC)
Received: from us-smtp-delivery-109.mimecast.com (us-smtp-delivery-109.mimecast.com [170.10.129.109])
 by mx.groups.io with SMTP id smtpd.web11.23394.1713538732365489086
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 07:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ptxtrimble.com header.s=mimecast20240319 header.b=kW/4spIE;
 spf=pass (domain: ptxtrimble.com, ip: 170.10.129.109, mailfrom: perceval.arenou@ptxtrimble.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ptxtrimble.com;
	s=mimecast20240319; t=1713538731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wVDW/aYx06dOP2fBs/7/GfJ0ABVQNTIDdpyNLyOB8AI=;
	b=kW/4spIEjFwHX42f9TQXx17UynDfTdhgSf5qGsAQDK0QQvgB1Qu2OoUOhsoX8KxCvRVZ1H
	RdxqJABpZYvo+xoRi5PgZEQSwJqGmh/goAJg/xsLZkYxEC4kfgxhXAMDm0V8BRNMlZDISq
	xYAGzfVXA5G4PN/QN85P2U4+CYXyYME=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-9VRVj3OGMmOrH0TXuZ-ytw-1; Fri, 19 Apr 2024 10:58:49 -0400
X-MC-Unique: 9VRVj3OGMmOrH0TXuZ-ytw-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-22f264ea760so2359191fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 07:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538728; x=1714143528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lj1BDYV0QNUdxBZRLSvuKEi4/GWUxZ+MTC1qHiEGbZ0=;
        b=dk6v6kfwJKEO9ZdlXCbdTJ+tqkBixM4pPYD1ExQyqfWD8nlrD740nn4w/r25n2dxea
         I0s3X1pF00ZhYD3btURME/jkng0OBvg7B+qkZmWhzXnK2NZHDJRxCpAF+rRZnPiQV/S4
         zspg6ErMTOOMK/iGHl7c/ihuWl3RfJ+7PEKhdJLdCS9kvkqh2tYr0AWZeO3M2nVtviTH
         /vM/V6/oZTckwMg1xbyvLF8VSxL20Dt40zojHnWqO4K/aO0BINt5ZntfRnKgQVTntcYV
         uBE3TO/Y0mSuKO9hqFxo5Dlm+XMlb0+pjJmRB0vByWXHV1xG2nuzkfqCcWStJtm2Zs7J
         Dvuw==
X-Gm-Message-State: AOJu0Ywhon9nIE9bZOBiTwGvkfcSIEcHhtPVUjH3G82h1w/hQok1ePNK
	xRzjvcqtcNqvUmbr7mjTPeZJkGhklcoB28tIfTAW5OPU5k53kRjcQ3CLPqaLOxfPC2Wx+Y3y5tT
	YlSsk//ZVSq+nUjN8ZsEYkEitqNj1N8pMMG+1tq+9TAVqqKXZJ8WZmVNC0Tyw5ZP6WNHJ6E4llz
	gBor0380dsyIXXM0BB5Wid6r7uPAsik7dVPWYPGlD/RFuGb8OtwYfZlN3wg5zP8Az5FBPgBKQNw
	cLk1sKp0xbT1dH16NA=
X-Received: by 2002:a05:6870:b487:b0:221:8e01:4c6f with SMTP id y7-20020a056870b48700b002218e014c6fmr3029290oap.36.1713538727872;
        Fri, 19 Apr 2024 07:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2R93i7lucmtAOeVwLs5xCYfRWkq5Ax2j7BdgWnNDrAXxCCx9ToKLG4e8lpFySnZg1sWX5cwP0z9QuNxiCDbY=
X-Received: by 2002:a05:6870:b487:b0:221:8e01:4c6f with SMTP id
 y7-20020a056870b48700b002218e014c6fmr3029199oap.36.1713538726339; Fri, 19 Apr
 2024 07:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <17C71645B7063D93.20815@lists.openembedded.org>
In-Reply-To: <17C71645B7063D93.20815@lists.openembedded.org>
From: Perceval Arenou <perceval.arenou@ptxtrimble.com>
Date: Fri, 19 Apr 2024 16:58:35 +0200
Message-ID: <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
Subject: Re: [External] [oe] [meta-multimedia][PATCH] aravis: new recipe
 aravis is a vision library for genicam based cameras. aravis project allows
 to stream from genicam and GigE cameras
To: openembedded-devel@lists.openembedded.org
Cc: Perceval Arenou <perceval.arenou@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ptxtrimble.com
Content-Type: multipart/alternative; boundary="000000000000181f06061674539a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 14:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110062

--000000000000181f06061674539a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Perceval Arenou <perceval.arenou@gmail.com>

---
 .../aravis/aravis_0.8.31.bb                   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/aravis/
aravis_0.8.31.bb

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
new file mode 100644
index 000000000..2cfe3fdfa
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
@@ -0,0 +1,41 @@
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
+# These options are found in AravisProject/aravis meson_options.txt
+EXTRA_OEMESON +=3D "\
+    -Ddocumentation=3Ddisabled \
+    -Dfast-heartbeat=3Dfalse \
+    -Dpacket-socket=3Denabled \
+    -Dtests=3Dfalse \
+"
+
+inherit_defer meson pkgconfig ${@bb.utils.contains('PACKAGECONFIG',
'introspection', 'gobject-introspection', '', d)}
+
+PACKAGECONFIG ?=3D "gstreamer usb viewer"
+PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisab=
led,
gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,
-Dintrospection=3Ddisabled, gobject-introspection,"
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



--000000000000181f06061674539a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gma=
il_default" style=3D"color:rgb(0,0,0)">From: Perceval Arenou &lt;<a href=3D=
"mailto:perceval.arenou@gmail.com">perceval.arenou@gmail.com</a>&gt;<br></d=
iv><div class=3D"gmail_default" style=3D"color:rgb(0,0,0)"><br></div><div c=
lass=3D"gmail_default" style=3D"color:rgb(0,0,0)">---<br>=C2=A0.../aravis/<=
a href=3D"http://aravis_0.8.31.bb">aravis_0.8.31.bb</a> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 41 +++++++++++++++++++<br>=
=C2=A01 file changed, 41 insertions(+)<br>=C2=A0create mode 100644 meta-mul=
timedia/recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb">aravi=
s_0.8.31.bb</a><br><br>diff --git a/meta-multimedia/recipes-multimedia/arav=
is/<a href=3D"http://aravis_0.8.31.bb">aravis_0.8.31.bb</a> b/meta-multimed=
ia/recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb">aravis_0.8=
.31.bb</a><br>new file mode 100644<br>index 000000000..2cfe3fdfa<br>--- /de=
v/null<br>+++ b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http:/=
/aravis_0.8.31.bb">aravis_0.8.31.bb</a><br>@@ -0,0 +1,41 @@<br>+SUMMARY =3D=
 &quot;A vision library for genicam based cameras&quot;<br>+DESCRIPTION =3D=
 &quot;\<br>+ =C2=A0 =C2=A0Aravis is a glib/gobject based library for video=
 acquisition using Genicam cameras.\<br>+ =C2=A0 =C2=A0It currently impleme=
nts the gigabit ethernet and USB3 protocols used by industrial cameras.\<br=
>+ =C2=A0 =C2=A0It also provides a basic ethernet camera simulator and a si=
mple video viewer.\<br>+&quot;<br>+AUTHOR =3D &quot;Emmanuel Pacaud&quot;<b=
r>+HOMEPAGE =3D &quot;<a href=3D"https://github.com/AravisProject/aravis">h=
ttps://github.com/AravisProject/aravis</a>&quot;<br>+LICENSE =3D &quot;LGPL=
-2.1&quot;<br>+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c&quot;<br>+<br>+DEPENDS +=3D &quot;\<br>+ =C2=A0 =C2=A0=
glib-2.0 \<br>+ =C2=A0 =C2=A0glib-2.0-native \<br>+ =C2=A0 =C2=A0libxml2 \<=
br>+ =C2=A0 =C2=A0zlib \<br>+&quot;<br>+<br>+SRC_URI =3D &quot;<a href=3D"h=
ttps://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}=
.tar.xz">https://github.com/AravisProject/aravis/releases/download/${PV}/${=
BPN}-${PV}.tar.xz</a>&quot;<br>+SRC_URI[sha256sum] =3D &quot;9c4ebe6273ed3a=
be466cb6ed8fa5c132bdd7e9a9298ca43fa0212c4311a084da&quot;<br>+<br>+# These o=
ptions are found in AravisProject/aravis meson_options.txt<br>+EXTRA_OEMESO=
N +=3D &quot;\<br>+ =C2=A0 =C2=A0-Ddocumentation=3Ddisabled \<br>+ =C2=A0 =
=C2=A0-Dfast-heartbeat=3Dfalse \<br>+ =C2=A0 =C2=A0-Dpacket-socket=3Denable=
d \<br>+ =C2=A0 =C2=A0-Dtests=3Dfalse \<br>+&quot;<br>+<br>+inherit_defer m=
eson pkgconfig ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;introspec=
tion&#39;, &#39;gobject-introspection&#39;, &#39;&#39;, d)}<br>+<br>+PACKAG=
ECONFIG ?=3D &quot;gstreamer usb viewer&quot;<br>+PACKAGECONFIG[gstreamer] =
=3D &quot;-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisabled, gstreamer1.0 gst=
reamer1.0-plugins-base,&quot;<br>+PACKAGECONFIG[introspection] =3D &quot;-D=
introspection=3Denabled, -Dintrospection=3Ddisabled, gobject-introspection,=
&quot;<br>+PACKAGECONFIG[usb] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisabled, =
libusb1,&quot;<br>+PACKAGECONFIG[viewer] =3D &quot;-Dviewer=3Denabled, -Dvi=
ewer=3Ddisabled, gtk+3 gstreamer1.0-plugins-base,&quot;<br>+<br>+FILES:${PN=
} +=3D &quot;\<br>+ =C2=A0 =C2=A0${datadir} \<br>+ =C2=A0 =C2=A0${libdir}/g=
streamer-1.0/<a href=3D"http://libgstaravis.0.8.so">libgstaravis.0.8.so</a>=
 \<br>+&quot;<br>-- <br>2.43.0<br><br></div></div></div>
<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>   </b></p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666=
;"><br><br> </p></body></html>

--000000000000181f06061674539a--


