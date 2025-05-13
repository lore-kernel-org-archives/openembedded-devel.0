Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E950C3ABD9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:52:22 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.75190.1747140740661681780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 05:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 7D747F07
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 14:52:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uEp7J-3FhvG70; Tue, 13 May 2025 14:52:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] xserver-xorg-cvt: remove recipe
Date: Tue, 13 May 2025 14:52:09 +0200
Message-ID: <20250513125209.1088462-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513125209.1088462-1-f_l_k@t-online.de>
References: <20250513125209.1088462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747140737-B97F85CE-B9FB9DF4/0/0 CLEAN NORMAL
X-TOI-MSGID: 908e0386-cb14-4fc7-a1bc-904b8e4cc9ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 12:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117398

xserver-xorg-cvt is deprecated and can be replaced by libxcvt, which is i=
n oe-core

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xserver-xorg-cvt-native_1.20.10.bb        | 40 -------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg=
-cvt-native_1.20.10.bb

diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-na=
tive_1.20.10.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-c=
vt-native_1.20.10.bb
deleted file mode 100644
index e672701ae0..0000000000
--- a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.=
20.10.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY =3D "X.Org X cvt"
-HOMEPAGE =3D "https://linux.die.net/man/1/cvt"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5df87950af51ac2c5822094553ea1=
880"
-
-DEPENDS +=3D "pixman-native xorgproto-native libxrandr-native"
-
-XORG_PN =3D "xorg-server"
-
-SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] =3D "977420c082450dc808de301ef56af4856d653eea71519a97=
3c3490a780cb7c99"
-
-S =3D "${WORKDIR}/${XORG_PN}-${PV}"
-B =3D "${WORKDIR}/build"
-
-inherit pkgconfig native
-
-do_configure[noexec] =3D "1"
-
-do_compile() {
-    cd ${S}
-    for header in `find -name '*.h'`; do
-        path=3D`dirname $header`
-        if ! echo "$incpaths" | grep -q "$path" ; then
-            incpaths=3D"$incpaths -I$path"
-        fi
-    done
-    CFLAGS=3D"${CFLAGS} -DXORG_VERSION_CURRENT=3D1 $incpaths `pkg-config=
 --cflags pixman-1`"
-    LDFLAGS=3D"${LDFLAGS} -lm `pkg-config --libs pixman-1`"
-    ${CC} $CFLAGS -o ${B}/cvt \
-        ${S}/hw/xfree86/utils/cvt/cvt.c \
-        ${S}/hw/xfree86/modes/xf86cvt.c \
-        ${S}/os/xprintf.c \
-        $LDFLAGS
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 ${B}/cvt ${D}${bindir}
-}
--=20
2.49.0


