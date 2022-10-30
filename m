Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F365FFA373D
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 06:36:42 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.5908.1667111790465591149
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 23:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout07.t-online.de (Postfix) with SMTP id 24359763F
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 07:36:28 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.64]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1op1vm-3863Kj0; Sun, 30 Oct 2022 07:36:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCHv2] spice: upgrade 0.14.2 -> 0.15.1
Date: Sun, 30 Oct 2022 07:36:17 +0100
Message-Id: <20221030063617.72097-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667111786-717F581F-11379963/0/0 CLEAN NORMAL
X-TOI-MSGID: 44814814-c9ca-4e25-ad95-bfca777496b7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 06:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99348

 - switch buildsystem to meson
 - cleanup dependencies

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...0001-Convert-pthread_t-to-be-numeric.patch | 59 ------------
 ...compile-errors-on-Linux-32bit-system.patch | 96 -------------------
 ...igure.ac-explicitly-link-to-jpeg-lib.patch | 48 ----------
 .../recipes-support/spice/spice_0.15.1.bb     | 40 ++++++++
 .../recipes-support/spice/spice_git.bb        | 65 -------------
 5 files changed, 40 insertions(+), 268 deletions(-)
 delete mode 100644 meta-networking/recipes-support/spice/spice/0001-Conv=
ert-pthread_t-to-be-numeric.patch
 delete mode 100644 meta-networking/recipes-support/spice/spice/0001-Fix-=
compile-errors-on-Linux-32bit-system.patch
 delete mode 100644 meta-networking/recipes-support/spice/spice/0001-conf=
igure.ac-explicitly-link-to-jpeg-lib.patch
 create mode 100644 meta-networking/recipes-support/spice/spice_0.15.1.bb
 delete mode 100644 meta-networking/recipes-support/spice/spice_git.bb

diff --git a/meta-networking/recipes-support/spice/spice/0001-Convert-pth=
read_t-to-be-numeric.patch b/meta-networking/recipes-support/spice/spice/=
0001-Convert-pthread_t-to-be-numeric.patch
deleted file mode 100644
index e63cbe3b7..000000000
--- a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-=
to-be-numeric.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 0726ce6d6f52e135e28f15ca8392568c84909b1d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 16 Jun 2018 16:21:39 -0700
-Subject: [PATCH] Convert pthread_t to be numeric
-
-typecast pthread_t to unsigned long
-pthread_t is implemented as a struct point in musl and its as per standa=
rd
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- server/red-channel.c | 5 +++--
- server/red-client.c  | 6 +++---
- 2 files changed, 6 insertions(+), 5 deletions(-)
-
---- a/server/red-channel.c
-+++ b/server/red-channel.c
-@@ -204,7 +204,7 @@ red_channel_constructed(GObject *object)
- {
-     RedChannel *self =3D RED_CHANNEL(object);
-=20
--    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", self-=
>priv->thread_id);
-+    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", (unsi=
gned long)self->priv->thread_id);
-=20
-     RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self);
-=20
-@@ -479,7 +479,8 @@ void red_channel_remove_client(RedChanne
-                             "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
-                             "If one of the threads is !=3D io-thread &&=
 !=3D vcpu-thread, "
-                             "this might be a BUG",
--                            channel->priv->thread_id, pthread_self());
-+                            (unsigned long)channel->priv->thread_id,
-+                            (unsigned long)pthread_self());
-     }
-     spice_return_if_fail(channel);
-     link =3D g_list_find(channel->priv->clients, rcc);
---- a/server/red-client.c
-+++ b/server/red-client.c
-@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *clien
-                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
-                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
-                       " this might be a BUG",
--                      client->thread_id, pthread_self());
-+                      (unsigned long)client->thread_id, (unsigned long)=
pthread_self());
-     }
-     FOREACH_CHANNEL_CLIENT(client, rcc) {
-         if (red_channel_client_is_connected(rcc)) {
-@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *clien
-                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
-                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
-                       " this might be a BUG",
--                      client->thread_id,
--                      pthread_self());
-+                      (unsigned long)client->thread_id,
-+                      (unsigned long)pthread_self());
-     }
-     red_client_set_disconnecting(client);
-     FOREACH_CHANNEL_CLIENT(client, rcc) {
diff --git a/meta-networking/recipes-support/spice/spice/0001-Fix-compile=
-errors-on-Linux-32bit-system.patch b/meta-networking/recipes-support/spi=
ce/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
deleted file mode 100644
index d04bee95f..000000000
--- a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors=
-on-Linux-32bit-system.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From a2af005b5d4a62839e56f42a43df793356e78f58 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Tue, 4 Jun 2019 03:58:17 -0400
-Subject: [PATCH] Fix compile errors on Linux 32bit system
-
-There are folowing compile errors on Linux 32bit system:
-
-red-channel.c:207:73: error: format '%x' expects argument of type
-'unsigned int', but argument 7 has type 'long unsigned int' [-Werror=3Df=
ormat=3D]
-|207| red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
-                                ~~~~~~~~~~~~~~~~~~~~~^
-                        self->priv->thread_id);
-                ~~~~~~~~~~~~~~~~~~~~~^
-
-On 32bit system, #define G_GSIZE_MODIFIER "". But the type of
-'self->priv->thread_id' is 'unsigned long int' which should match '%lx'
-not '%x'.
-
-So we should recovery the <0x%" G_GSIZE_MODIFIER "x"> to <0x%lx">.
-And others files modification are similar to G_GSIZE_MODIFIER.
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
-Upstream-Status: Submitted [https://lists.freedesktop.org/archives/spice=
-devel/2019-June/049285.html]
-
- server/red-channel.c    | 6 +++---
- server/red-client.c     | 8 ++++----
- server/red-replay-qxl.c | 2 +-
- 3 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/server/red-channel.c b/server/red-channel.c
-index f81142d..6a03ec2 100644
---- a/server/red-channel.c
-+++ b/server/red-channel.c
-@@ -202,7 +202,7 @@ red_channel_constructed(GObject *object)
- {
-     RedChannel *self =3D RED_CHANNEL(object);
-=20
--    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", (unsi=
gned long)self->priv->thread_id);
-+    red_channel_debug(self, "thread_id 0x%lx", (unsigned long)self->pri=
v->thread_id);
-=20
-     RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self);
-=20
-@@ -473,8 +473,8 @@ void red_channel_remove_client(RedChannel *channel, =
RedChannelClient *rcc)
-=20
-     if (!pthread_equal(pthread_self(), channel->priv->thread_id)) {
-         red_channel_warning(channel,
--                            "channel->thread_id (0x%" G_GSIZE_MODIFIER =
"x) !=3D "
--                            "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
-+                            "channel->thread_id (0x%lx) !=3D "
-+                            "pthread_self (0x%lx)."
-                             "If one of the threads is !=3D io-thread &&=
 !=3D vcpu-thread, "
-                             "this might be a BUG",
-                             (unsigned long)channel->priv->thread_id,
-diff --git a/server/red-client.c b/server/red-client.c
-index 2b859cb..ff4da2a 100644
---- a/server/red-client.c
-+++ b/server/red-client.c
-@@ -174,8 +174,8 @@ void red_client_migrate(RedClient *client)
-     RedChannel *channel;
-=20
-     if (!pthread_equal(pthread_self(), client->thread_id)) {
--        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) !=3D=
 "
--                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
-+        spice_warning("client->thread_id (0x%lx) !=3D "
-+                      "pthread_self (0x%lx)."
-                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
-                       " this might be a BUG",
-                       (unsigned long)client->thread_id, (unsigned long)=
pthread_self());
-@@ -193,8 +193,8 @@ void red_client_destroy(RedClient *client)
-     RedChannelClient *rcc;
-=20
-     if (!pthread_equal(pthread_self(), client->thread_id)) {
--        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) !=3D=
 "
--                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
-+        spice_warning("client->thread_id (0x%lx) !=3D "
-+                      "pthread_self (0x%lx)."
-                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
-                       " this might be a BUG",
-                       (unsigned long)client->thread_id,
-diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
-index 6d34818..0deb406 100644
---- a/server/red-replay-qxl.c
-+++ b/server/red-replay-qxl.c
-@@ -264,7 +264,7 @@ static replay_t read_binary(SpiceReplay *replay, con=
st char *prefix, size_t *siz
-             exit(1);
-         }
-         if ((ret =3D inflate(&strm, Z_NO_FLUSH)) !=3D Z_STREAM_END) {
--            spice_error("inflate error %d (disc: %" G_GSSIZE_FORMAT ")"=
,
-+            spice_error("inflate error %d (disc: %li)",
-                         ret, *size - strm.total_out);
-             if (ret =3D=3D Z_DATA_ERROR) {
-                 /* last operation may be wrong. since we do the recordi=
ng
---=20
-2.8.1
-
diff --git a/meta-networking/recipes-support/spice/spice/0001-configure.a=
c-explicitly-link-to-jpeg-lib.patch b/meta-networking/recipes-support/spi=
ce/spice/0001-configure.ac-explicitly-link-to-jpeg-lib.patch
deleted file mode 100644
index 2d05143db..000000000
--- a/meta-networking/recipes-support/spice/spice/0001-configure.ac-expli=
citly-link-to-jpeg-lib.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6ffd9db8e02e411bda2f421abf7951dab6cf0e38 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 5 Feb 2021 01:43:44 -0800
-Subject: [PATCH] configure.ac: explicitly link to jpeg lib
-
-Since oe has added lib jpeg to the depends, explicitly link to jpeg lib
-to workaround build failure with autoconf 2.7
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 14 +-------------
- 1 file changed, 1 insertion(+), 13 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1ce81f91..8bbb50de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -191,24 +191,12 @@ AC_SUBST(SSL_CFLAGS)
- AC_SUBST(SSL_LIBS)
- AS_VAR_APPEND([SPICE_REQUIRES], [" openssl"])
-=20
--AC_CHECK_LIB(jpeg, jpeg_destroy_decompress,
--    AC_MSG_CHECKING([for jpeglib.h])
--    AC_TRY_CPP(
--[#include <stdio.h>
--#undef PACKAGE
--#undef VERSION
--#undef HAVE_STDLIB_H
--#include <jpeglib.h>],
--        JPEG_LIBS=3D'-ljpeg'
--        AC_MSG_RESULT($jpeg_ok),
--	AC_MSG_ERROR([jpeglib.h not found])),
--    AC_MSG_ERROR([libjpeg not found]))
-+JPEG_LIBS=3D'-ljpeg'
- AC_SUBST(JPEG_LIBS)
-=20
- AC_CHECK_LIB(z, deflate, Z_LIBS=3D'-lz', AC_MSG_ERROR([zlib not found])=
)
- AC_SUBST(Z_LIBS)
-=20
--
- AC_ARG_ENABLE([manual],
-                AS_HELP_STRING([--enable-manual=3D@<:@auto/yes/no@:>@],
-                               [Build SPICE manual]),
---=20
-2.29.2
-
diff --git a/meta-networking/recipes-support/spice/spice_0.15.1.bb b/meta=
-networking/recipes-support/spice/spice_0.15.1.bb
new file mode 100644
index 000000000..e1509d063
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice_0.15.1.bb
@@ -0,0 +1,40 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+
+SUMMARY =3D "Simple Protocol for Independent Computing Environments"
+DESCRIPTION =3D "SPICE (the Simple Protocol for Independent Computing \
+Environments) is a remote-display system built for virtual \
+environments which allows users to view a computing 'desktop' \=20
+environment - not only on its computer-server machine, but also from \
+anywhere on the Internet and using a wide variety of machine \
+architectures."
+
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice.git;protocol=3Dh=
ttps;nobranch=3D1"
+SRCREV =3D "c7b313ba31ebf02d7173551ee8dd6710b7676441"
+S =3D "${WORKDIR}/git"
+
+CVE_CHECK_IGNORE +=3D "\
+    CVE-2016-0749 \
+    CVE-2016-2150 \
+    CVE-2018-10893 \
+"
+
+inherit meson gettext python3native pkgconfig
+
+DEPENDS +=3D "glib-2.0 jpeg openssl python3-pyparsing-native python3-six=
-native orc pixman spice-protocol"
+
+PACKAGECONFIG:class-native =3D ""
+PACKAGECONFIG:class-nativesdk =3D ""
+PACKAGECONFIG ?=3D "sasl gstreamer lz4 opus"
+
+PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3D1.0,-Dgstreamer=3Dno,gstream=
er1.0 gstreamer1.0-plugins-base gstreamer1.0-vaapi"
+PACKAGECONFIG[lz4] =3D "-Dlz4=3Dtrue,-Dlz4=3Dfalse,lz4"
+PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard"
+PACKAGECONFIG[sasl] =3D "-Dsasl=3Dtrue,.Dsasl=3Dfalse,cyrus-sasl"
+PACKAGECONFIG[opus] =3D "-Dopus=3Denabled,-Dopus=3Ddisabled,libopus"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
deleted file mode 100644
index b3e687476..000000000
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-#
-# Copyright (C) 2013 Wind River Systems, Inc.
-#
-
-SUMMARY =3D "Simple Protocol for Independent Computing Environments"
-DESCRIPTION =3D "SPICE (the Simple Protocol for Independent Computing \
-Environments) is a remote-display system built for virtual \
-environments which allows users to view a computing 'desktop' \=20
-environment - not only on its computer-server machine, but also from \
-anywhere on the Internet and using a wide variety of machine \
-architectures."
-
-LICENSE =3D "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
-
-PV =3D "0.14.2+git${SRCPV}"
-
-SRCREV_spice =3D "7cbd70b931db76c69c89c2d9d5d704f67381a81b"
-SRCREV_spice-common =3D "4fc4c2db36c7f07b906e9a326a9d3dc0ae6a2671"
-
-SRCREV_FORMAT =3D "spice_spice-common"
-
-SRC_URI =3D " \
-    git://anongit.freedesktop.org/spice/spice;name=3Dspice;branch=3Dmast=
er \
-    git://anongit.freedesktop.org/spice/spice-common;destsuffix=3Dgit/su=
bprojects/spice-common;name=3Dspice-common;branch=3Dmaster \
-    file://0001-Convert-pthread_t-to-be-numeric.patch \
-    file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
-    file://0001-configure.ac-explicitly-link-to-jpeg-lib.patch \
-"
-
-S =3D "${WORKDIR}/git"
-
-CVE_CHECK_IGNORE +=3D "\
-    CVE-2016-0749 \
-    CVE-2016-2150 \
-    CVE-2018-10893 \
-"
-
-inherit autotools gettext python3native python3-dir pkgconfig
-
-DEPENDS +=3D "spice-protocol jpeg pixman alsa-lib glib-2.0 python3-pypar=
sing-native python3-six-native glib-2.0-native"
-DEPENDS:append:class-nativesdk =3D " nativesdk-openssl"
-
-export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/python3"
-
-CFLAGS:append =3D " -Wno-error"
-
-PACKAGECONFIG:class-native =3D ""
-PACKAGECONFIG:class-nativesdk =3D ""
-PACKAGECONFIG ?=3D "sasl"
-
-PACKAGECONFIG[celt051] =3D "--enable-celt051,--disable-celt051,celt051"
-PACKAGECONFIG[smartcard] =3D "--enable-smartcard,--disable-smartcard,lib=
cacard,"
-PACKAGECONFIG[sasl] =3D "--with-sasl,--without-sasl,cyrus-sasl,"
-PACKAGECONFIG[client] =3D "--enable-client,--disable-client,,"
-PACKAGECONFIG[gui] =3D "--enable-gui,--disable-gui,,"
-PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,libopus,"
-PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,,"
-PACKAGECONFIG[xinerama] =3D "--enable-xinerama,--disable-xinerama,libxin=
erama,"
-
-COMPATIBLE_HOST =3D '(x86_64|i.86|aarch64).*-linux'
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-EXTRA_OECONF:append:toolchain-clang =3D " --disable-werror"
--=20
2.34.1


