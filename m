Return-Path: <dl9pf@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2DD615D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1582113417;
	bh=3G1q2gLIv9zsC6/soPZUSf+d13ZwNzWL/oiuMXBAgME=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=BPfJ8rCa3btR48QvDUmVj3Bokl2Lh8uRwEl9E+iV8EWZldjut59W8xgxVCIAYI5cD
	rO5KddVaVi1GbBbiG7p9pkLgzSsdva1c4JrcmO9WHqZL0LoN6J8Lpn9QMnwpkRvSbt
	qVjo5xJwEhJy/U9/RS+3mrq6TeIqz0LCWqYosc3k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([95.216.96.43]) by mail.gmx.com
	(mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
	1N2mFi-1jRfWf1joa-0137Sh; Wed, 19 Feb 2020 12:56:57 +0100
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2020 12:56:54 +0100
Message-Id: <20200219115654.25186-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:foe6VcxqpusFUaOBz2iwZeH3JDE4jiha+MMVBGlBbntDjs2GNt2
	suxGoe/vA9RS1Q5rQSLkuh6ys/QvoBm9F/d429rE+6E59JapyVM2bJuc8WYDwp0SlJSwX8X
	E8IULeSTB/omXqL2XcAhH9c3GulJJeLoVgJi9dswbvh+2k7qAjQOipM8RrqUbzj/OwjNd2m
	PHtc7ej5WXFk2bZ/6uHEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zSxdnySTLjA=:b/eu1hxpoOzgD0RwtuAe3a
	XkozYIp1gcKIJAa50KMuC3DShMqJZMdhUjRLNACYHnTF6XAJc+U5luVP+lyPM1RjBSspIbsGB
	mMsdRFqqZ5ShlD9ZrtNlRXckUD/3vvIPtxZhXRZ/p+WA4n32cIZwagdAuTL2AJjdXYtza0RaX
	vmd5uPJlBj0zyBP0+un4q5/yph2uStLCkkRoq1sYx+oKoMwIh9XY7dLwcOduzlkjICpunENm0
	WkD8lagdvUg6DGg0a3voDvzUcWFJt7Ed8yMarcxQCjT6YHWvZfc3BPxezlIeunpoA1AXtaR7Y
	ykxvg/SyH5xqrdYn2jV0i4hb03rjgrTLBmQWbPP/vbiT4cq0/97JDmXc2p3SZt3ZAaPvHgr0z
	tnjkF3BX8pk/fIZQ0i6LUyRmeh93DIsuswosejOBpc//HqsIo+Qz+SpFRx5iL/7xZx9+HrEud
	MQnyGzkkZrazBz4jszn88DdI7rndwNO0dOiC5T78LxnMVojqyi3aoo42Ou+tt8bSb2JDLFN/v
	Wldglb59F3wquMrmqwuYOnITfscZnoEI1NOXivl3mL8iFEp4taCkWy6/3LrCe4sVxrmepBPZQ
	vlOSpYX5wAiDCunExRC9DTKsbNGrRx//bPcystSYCBsG3AXaMOtFNhFNtrKAd1pAtipfyDdDR
	JsMefPth5rZhkkxEHIMllSXXQHsOO4pKRJvOE1sx3lNclTA8h1RtyRPrSltUr8I6PBW8mP/jj
	mvN8Ba4vKpeXC/Ma8uk70OkDadePN9DcSsNJswszPKHj22z+Nn4Bhcq3Jf7XSOTdyIAT4dR17
	qdIfy9L4ycuDJkjQFl8lw3nBTob8f4TnA8BxWoefPgZSsZ3zAaHOEJ1KJMtnLr4hIuQALkz5E
	CxBDB+xUFWOBUiAAluQWIy6bbnQ0104eM8USiRYKKBTlRLEpGiNF55mJL2d2DNxRYy3qlx61l
	zo9fiWpV1cNgSG7j+8k4Yzfp1eN09T7+tybFjASpju9pVVaN7Ua3nyJjdHLgPUrgXXruBs1On
	bnJRLZZ54jxqJLGOH0uMaVfzNZigk0o4wYhU3vHzeertuglXC2yPejHl4Uls/HOCkvL8kqsZ3
	G+/xUZgsQ/Z8eJoq50cuPA9/Lwr/wwiyJ1lrH1iz+T26hyM6IxhnIGrsneUL/F5HEmPJTR2Ce
	LRfASZXfVVPqKsaYUAx/DI4i95+dgY7Xif8gqGeEPRJxs0rdyjkzBV6HP9st+irPoCI/DM+KO
	U5eb5WgHPX0Dq3D/y
Subject: [meta-oe][PATCH] meta-oe: master: remmina - use PACKAGECONFIG for spice
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
X-List-Received-Date: Wed, 19 Feb 2020 11:56:57 -0000
Content-Transfer-Encoding: quoted-printable

remmina depends on spice and spice-protocol but they are in meta-networkin=
g.
Use the PACKAGECONFIG flag to avoid hardcoding the dependency.

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
=2D--
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/re=
cipes-support/remmina/remmina_1.3.6.bb
index f9963ff65..f9860a11f 100644
=2D-- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -5,8 +5,6 @@ LICENSE =3D "GPLv2 & openssl"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddab7215512044d49037272ce1ac4ea=
8f file://LICENSE.OpenSSL;md5=3Dc1eb3cee0a4dea27503c531267a69769"
 DEPENDS +=3D "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui lib=
sodium libssh vte json-glib libsoup-2.4 libvncserver libsecret"

-DEPENDS_append_x86 =3D " spice spice-protocol"
-DEPENDS_append_x86-64 =3D " spice spice-protocol"

 DEPENDS_append_libc-musl =3D " libexecinfo"
 LDFLAGS_append_libc-musl =3D " -lexecinfo"
@@ -23,11 +21,7 @@ inherit cmake features_check mime-xdg
 # depends on avahi-ui with this restriction
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"

-EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWITH=
_TRANSLATIONS=3DOFF -DWITH_SPICE=3DOFF"
-
-EXTRA_OECMAKE_append_x86 =3D " -DWITH_SPICE=3DON"
-EXTRA_OECMAKE_append_x86-64 =3D " -DWITH_SPICE=3DON"
-
+EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWITH=
_TRANSLATIONS=3DOFF"

 do_install_append(){
     # We dont need the extra stuff form other desktop environments
@@ -36,6 +30,8 @@ do_install_append(){
     rm -rf ${D}/${datadir}/gnome-session
 }

+PACKAGECONFIG[spice] =3D "-DWITH_SPICE=3DON, -DWITH_SPICE=3DOFF, spice sp=
ice-protocol"
+
 RDEPENDS_${PN} =3D "bash"

 FILES_${PN}_append =3D " ${datadir}/icons/hicolor/*"
=2D-
2.11.0


