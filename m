Return-Path: <perceval.arenou@ptxtrimble.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73280C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 14:04:33 +0000 (UTC)
Received: from us-smtp-delivery-109.mimecast.com (us-smtp-delivery-109.mimecast.com [170.10.129.109])
 by mx.groups.io with SMTP id smtpd.web10.13758.1713362671657288254
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 07:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ptxtrimble.com header.s=mimecast20240319 header.b=mTElbQAh;
 spf=pass (domain: ptxtrimble.com, ip: 170.10.129.109, mailfrom: perceval.arenou@ptxtrimble.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ptxtrimble.com;
	s=mimecast20240319; t=1713362670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=n9Es4eXQSRuAAlqFTTgzY43LQSVRZisOPA4AzX8NPeo=;
	b=mTElbQAhyyRw9JMOQDjD7MqGrTWrjzJ6FQ4UkVlW81hH5SY4fvN4Wq5Qa4GPIr7VA1Q4PN
	YlUCeLFbzMeDR7iW02JeeqZlh9EhAPFf/iNOzrp6Nb+3ZU3m22cdpQgaCUS7KZUSpMMWeI
	kmUwrSue9/LfaIwa+WNBqkl/o+qxQnA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-gvs7_9SqNcG_61sMy1qDhg-1; Wed, 17 Apr 2024 10:04:28 -0400
X-MC-Unique: gvs7_9SqNcG_61sMy1qDhg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4165339d3a5so23069325e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 07:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713362667; x=1713967467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+D3qChfyOyaCi3JaFZ0g6OCDAW86r6Vwp67e+9XU0o=;
        b=HAqhk1uG+HcO7jgOf4Al4MLZkr2EjbTBLSz1fKyqMF97kKK0gk0DH3C4oOxCB8e6Eu
         q2wdl4ukBA3RPs8nMYZ04BsAhMd34u0EJT0kr6A8f70vOZFupSy6xzfZ7BdAUV7YoN1M
         fC8InJqI2Ws4021C5VnJSFkCURo1mLHyXQQ9OoUZ3MTF1aw1/WxWuI8rJj288yQ+R4r6
         eVABgfBxOh6AeEybEWHTe+6CO0inRgdxO8EastmRVvo2KAXKYiAOlaHZJj/5P8S23vGv
         2fyzI1CmNbtpp8GJXWLIsHDycYA5ArcOMZbfgHiM38688CP/vqrN1HngJ7r0UfFMdfwt
         OwFw==
X-Gm-Message-State: AOJu0YyKN9/5jO0k5avQACUNF4BnIxj7HKYjyrndPBJtYifj+lrckz3u
	Htr89dPHcwdUw8CdF99VCuxNdoyaxaQtF1cC16KvdtCk1TcPs4hAZrbjfDJEwWLjT8zGAwtIUBK
	0E1LgU5gPI96iZyZdQpIVo35VBgpDskIMrMKAeDXKkFEPy3fhQXiU1NxLBanvXlBV0JZRr6Eadl
	1Rf0D90ipJUf2TJfhmL2yCny+ptREpMurKLhY57g7HlbxLtoJdCw07V+kdTm0ZMv+iGJ2Jo7jAT
	c3cYO6k/LDMfWSK6j+mJR/dXw0Qkx4G7F8=
X-Received: by 2002:a05:600c:4446:b0:416:9836:c33a with SMTP id v6-20020a05600c444600b004169836c33amr12846013wmn.29.1713362667347;
        Wed, 17 Apr 2024 07:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH15KHCsH7VjhwaXR5NeXPxsJeGcE16z+udpC7Z60nPtOwD4qjc+/yroXwoKRM6LDAwEa+t5A==
X-Received: by 2002:a05:600c:4446:b0:416:9836:c33a with SMTP id v6-20020a05600c444600b004169836c33amr12845995wmn.29.1713362666987;
        Wed, 17 Apr 2024 07:04:26 -0700 (PDT)
Received: from serenity.eu.trimblecorp.net (lputeaux-658-1-190-18.w80-11.abo.wanadoo.fr. [80.11.239.18])
        by smtp.gmail.com with ESMTPSA id z11-20020a5d44cb000000b00345920fcb45sm17614356wrr.13.2024.04.17.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 07:04:26 -0700 (PDT)
From: perceval.arenou@ptxtrimble.com
To: openembedded-devel@lists.openembedded.org
Cc: Perceval Arenou <perceval.arenou@gmail.com>
Subject: [meta-multimedia][PATCH] aravis: new recipe aravis is a vision library for genicam based cameras. aravis project allows to stream from genicam and GigE cameras
Date: Wed, 17 Apr 2024 16:04:12 +0200
Message-ID: <20240417140412.87875-1-perceval.arenou@ptxtrimble.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ptxtrimble.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404171004293811"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 14:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110043

--MCBoundary=_12404171004293811
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

From: Perceval Arenou <perceval.arenou@gmail.com>

---
 .../aravis/aravis_0.8.31.bb                   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31=
.bb

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb b/m=
eta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
new file mode 100644
index 000000000..f2bbad674
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
@@ -0,0 +1,45 @@
+SUMMARY =3D "A vision library for genicam based cameras"
+DESCRIPTION =3D "\
+    Aravis is a glib/gobject based library for video acquisition using Gen=
icam cameras.\
+    It currently implements the gigabit ethernet and USB3 protocols used b=
y industrial cameras.\
+    It also provides a basic ethernet camera simulator and a simple video =
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
+    intltool-native \
+    libxml2 \
+    zlib \
+"
+
+SRC_URI =3D "https://github.com/AravisProject/aravis/releases/download/${P=
V}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0=
212c4311a084da"
+
+S =3D "${WORKDIR}/${BPN}-${PV}"
+
+# These options are found in AravisProject/aravis meson_options.txt
+EXTRA_OEMESON +=3D "\
+    -Ddocumentation=3Ddisabled \
+    -Dfast-heartbeat=3Dfalse \
+    -Dpacket-socket=3Denabled \
+    -Dtests=3Dfalse \
+"
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisab=
led, gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled, -Dintrospecti=
on=3Ddisabled, gobject-introspection,"
+PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
+PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3 =
gstreamer1.0-plugins-base,"
+
+# needs to be after PACKAGECONFIG to make sure it is defined
+inherit meson pkgconfig ${@bb.utils.contains('PACKAGECONFIG', 'introspecti=
on', 'gobject-introspection', '', d)}
+
+FILES:${PN} +=3D "\
+    ${datadir} \
+    ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
+"
--=20
2.43.0



--MCBoundary=_12404171004293811
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>From: Perceval Arenou &lt;perceval.arenou@gmail.com=
&gt;<BR>
<BR>
---<BR>
 .../aravis/aravis_0.8.31.bb                   | 45 +++++++++++++++++++<BR>
 1 file changed, 45 insertions(+)<BR>
 create mode 100644 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31=
.bb<BR>
<BR>
diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb b/m=
eta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb<BR>
new file mode 100644<BR>
index 000000000..f2bbad674<BR>
--- /dev/null<BR>
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb<BR>
@@ -0,0 +1,45 @@<BR>
+SUMMARY =3D &quot;A vision library for genicam based cameras&quot;<BR>
+DESCRIPTION =3D &quot;\<BR>
+    Aravis is a glib/gobject based library for video acquisition using Gen=
icam cameras.\<BR>
+    It currently implements the gigabit ethernet and USB3 protocols used b=
y industrial cameras.\<BR>
+    It also provides a basic ethernet camera simulator and a simple video =
viewer.\<BR>
+&quot;<BR>
+AUTHOR =3D &quot;Emmanuel Pacaud&quot;<BR>
+HOMEPAGE =3D &quot;https://github.com/AravisProject/aravis&quot;<BR>
+LICENSE =3D &quot;LGPL-2.1&quot;<BR>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<BR>
+<BR>
+DEPENDS +=3D &quot;\<BR>
+    glib-2.0 \<BR>
+    glib-2.0-native \<BR>
+    intltool-native \<BR>
+    libxml2 \<BR>
+    zlib \<BR>
+&quot;<BR>
+<BR>
+SRC_URI =3D &quot;https://github.com/AravisProject/aravis/releases/downloa=
d/${PV}/${BPN}-${PV}.tar.xz&quot;<BR>
+SRC_URI[sha256sum] =3D &quot;9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca=
43fa0212c4311a084da&quot;<BR>
+<BR>
+S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<BR>
+<BR>
+# These options are found in AravisProject/aravis meson_options.txt<BR>
+EXTRA_OEMESON +=3D &quot;\<BR>
+    -Ddocumentation=3Ddisabled \<BR>
+    -Dfast-heartbeat=3Dfalse \<BR>
+    -Dpacket-socket=3Denabled \<BR>
+    -Dtests=3Dfalse \<BR>
+&quot;<BR>
+<BR>
+PACKAGECONFIG ?=3D &quot;&quot;<BR>
+PACKAGECONFIG[gstreamer] =3D &quot;-Dgst-plugin=3Denabled, -Dgst-plugin=3D=
disabled, gstreamer1.0 gstreamer1.0-plugins-base,&quot;<BR>
+PACKAGECONFIG[introspection] =3D &quot;-Dintrospection=3Denabled, -Dintros=
pection=3Ddisabled, gobject-introspection,&quot;<BR>
+PACKAGECONFIG[usb] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,&q=
uot;<BR>
+PACKAGECONFIG[viewer] =3D &quot;-Dviewer=3Denabled, -Dviewer=3Ddisabled, g=
tk+3 gstreamer1.0-plugins-base,&quot;<BR>
+<BR>
+# needs to be after PACKAGECONFIG to make sure it is defined<BR>
+inherit meson pkgconfig ${@bb.utils.contains('PACKAGECONFIG', 'introspecti=
on', 'gobject-introspection', '', d)}<BR>
+<BR>
+FILES:${PN} +=3D &quot;\<BR>
+    ${datadir} \<BR>
+    ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \<BR>
+&quot;<BR>
-- <BR>
2.43.0<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>   </b></p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666=
;"><br><br> </p></body></html>

--MCBoundary=_12404171004293811--


