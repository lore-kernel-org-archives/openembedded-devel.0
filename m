Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC94EEAA52
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 15:42:21 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.15585.1694706139595131492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 08:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id BC1F6B9AB
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 17:42:17 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.167.3]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qgoTw-1RWF970; Thu, 14 Sep 2023 17:42:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libdca: add recipe
Date: Thu, 14 Sep 2023 17:42:06 +0200
Message-ID: <20230914154206.2143189-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694706136-1FFF716C-A65D14E6/0/0 CLEAN NORMAL
X-TOI-MSGID: ecd5b079-26f4-4a4c-908a-1620007bd54d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104874

This adds a recipe for videolans libdca.
It is needed to add dts support for gstreamer/ffmpeg

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...am-dont-create-symlinks-for-static-l.patch | 32 +++++++++++++++++++
 .../recipes-multimedia/libdca/libdca_0.0.7.bb | 16 ++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libdca/libdca/0001=
-libdca-Makefile.am-dont-create-symlinks-for-static-l.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libdca/libdca_0.0.=
7.bb

diff --git a/meta-multimedia/recipes-multimedia/libdca/libdca/0001-libdca=
-Makefile.am-dont-create-symlinks-for-static-l.patch b/meta-multimedia/re=
cipes-multimedia/libdca/libdca/0001-libdca-Makefile.am-dont-create-symlin=
ks-for-static-l.patch
new file mode 100644
index 000000000..06cd4092e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdca/libdca/0001-libdca-Makefi=
le.am-dont-create-symlinks-for-static-l.patch
@@ -0,0 +1,32 @@
+From 0a78f5679267ccf801931925b2754bad5ec572f0 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 12 Sep 2023 16:15:46 +0200
+Subject: [PATCH] libdca/Makefile.am: dont create symlinks for static lib
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+fixes:
+ERROR: libdca-0.0.7-r0 do_populate_sysroot: sstate found an absolute pat=
h symlink /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libdca/0.0.7=
/sysroot-destdir/usr/lib/libdts.a pointing at /home/flk/poky/build/tmp/wo=
rk/corei7-64-poky-linux/libdca/0.0.7/image/usr/lib/libdca.a. Please repla=
ce this with a relative link.
+
+Upstream-Status: Inappropriate [OE Specific]
+---
+ libdca/Makefile.am | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/libdca/Makefile.am b/libdca/Makefile.am
+index 05bdaca..97d6f15 100644
+--- a/libdca/Makefile.am
++++ b/libdca/Makefile.am
+@@ -10,9 +10,3 @@ libdca_la_LIBADD =3D $(LIBDCA_LIBS)
+=20
+ pkgconfigdir =3D $(libdir)/pkgconfig
+ pkgconfig_DATA =3D libdca.pc libdts.pc
+-
+-install-exec-hook:
+-	$(LN_S)f "$(DESTDIR)$(libdir)/libdca.a" "$(DESTDIR)$(libdir)/libdts.a"
+-
+-uninstall-hook:
+-	unlink "$(DESTDIR)$(libdir)/libdts.a"
+--=20
+2.41.0
+
diff --git a/meta-multimedia/recipes-multimedia/libdca/libdca_0.0.7.bb b/=
meta-multimedia/recipes-multimedia/libdca/libdca_0.0.7.bb
new file mode 100644
index 000000000..eacab0bfa
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdca/libdca_0.0.7.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "decoding library for DTS Coherent Acoustics streams"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "glib-2.0"
+
+SRC_URI =3D " \
+	git://code.videolan.org/videolan/libdca.git;protocol=3Dhttps;branch=3Dm=
aster \
+	file://0001-libdca-Makefile.am-dont-create-symlinks-for-static-l.patch =
\
+"
+
+SRCREV =3D "d00468139d3e9e03a93b1cef7c3f4e396f5b6871"
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
--=20
2.41.0


