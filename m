Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CB0EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:29:09 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.1246.1692808147061564600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hLhd1P7U;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a5ad44dc5aso4173004b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692808146; x=1693412946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA/D2RRysqSC5MS0F9u7SxTgIVhYcJTsw94XyMhHkbo=;
        b=hLhd1P7UpPEmOD7SirOb1aL2SoSNf6YesBZkXsFKk1DxT1U4z4ukvBmksYsePayjJe
         373rfIhBeYmeJJkxI9h+MSTzlmbA6XrBTfgbGwIysGNDw0SsapkbR69xr/raS/J9rh+1
         SlJC2FMQg2NfrAKqMA37DUvkawtN+QW/vZ56cF870crqOrwSfwzz55emMSPRWx2aK4Ev
         G3tgg9SfEhr6de71t1sUkYmXzhyBnh9IvDf43gjde08OHx8d7yolbPCiKCWUgiEBtbp+
         QUIgyrJ8OSjAxQmPEA6Au5fpBbM6eeslJvH7svQQHP6S/XheaQ4jHkVDu90ueO5rjnUI
         zs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692808146; x=1693412946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rA/D2RRysqSC5MS0F9u7SxTgIVhYcJTsw94XyMhHkbo=;
        b=Z5qeWCl2OtGk4XTUOWKZLnTBQre1iIAxlfaj1sWjfDkB0aJBxOST2cTVW4y13sLwuA
         imMx926qrjrkr0yKhjUlvdcWPmBwbEg9H/WEitW7fStRv4QkzXBTlkWKnUoJF89Sgwh3
         iqGFCCAeSAxFjqZCBsRwlAjijO+bITMC0YJl96E71BL0pmZoT4RfNtsReGag4SlItu3p
         EJNDdjjYD9r6eBUOecbwmc2KvVwbRl/HaCmJYgL0kWqhesJJPKQVlvnUDCTb0JcBs5YA
         d+z2ciJiiSNMQ9sBRueOBn9N0JX2TpLHO8FNYVXeBbyHKACgMqVAKts4XEobeiHbIjyZ
         eHTQ==
X-Gm-Message-State: AOJu0Yz34w2c+H9ewzSFSI0GZN9QlXALGEuwGX9gpH65M8N2E/E7AoR9
	fWNwxGv46br0DPI8uVGqvCkCfGit7SERZRPjX5I=
X-Google-Smtp-Source: AGHT+IHVTAqaUy4vS+GrM1vCknV6deVGNACb7RaR0MB2+4i2TiXN6lTLl5ipB+RPiLvHNPeUbX7D/hSUYHcjmAXSpTs=
X-Received: by 2002:a54:4014:0:b0:3a8:74bc:5853 with SMTP id
 x20-20020a544014000000b003a874bc5853mr2552020oie.52.1692808145921; Wed, 23
 Aug 2023 09:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230823121957.5626-1-f_l_k@t-online.de> <20230823121957.5626-3-f_l_k@t-online.de>
In-Reply-To: <20230823121957.5626-3-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Aug 2023 09:28:39 -0700
Message-ID: <CAMKF1so8xeZqi_O1Pxt95csnBtYoi5MknvHxQCDeN6djNUWAEw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/5] spice: upgrade 0.14.2 -> 0.15.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 16:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104552

have you built it for musl targets ? If we drop the thread_id patch
this would be affected unless it has been made portable in different
way

On Wed, Aug 23, 2023 at 5:20=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> -switch to meson buildsystem
> -remove patches
> -update dependencies
> -fetch spice-common as a submodule
>
> Major Changes in 0.15.2:
> Really minor fix release, mainly to fix a distribution issue
>
> Add missing file to distribution
> Fix sound recording fix in case of buffer wrapping
>
> Major Changes in 0.15.1:
>
> Fix some compatibility issues with FreeBSD
> Fix some minor issue with build
> Improve packaging with Meson
> Lot of C++ improves (clang-tidy)
> Fix some compatibility with no-Glibc libraries (like Musl)
> Fix minor leaks shutting down library
> Add Doxygen file to distribution
> Fix a longstanding issue related to surface updates where wrong surfaces =
were possibly used
> Fix compatibility with OpenSSL 3
> Updates and fixes for CI
> Use more random connection IDs to fix possible issues with proxies
>
> Major Changes in 0.15:
> This is the first release in the new 0.15.x stable series. This release s=
hould
> be ready for production use.
>
> Minor updates to CI
> Some compatibility with OpenSSL
> Change the behavior of handle_dev_start ignoring multiple start requests
> Ignore multiple calls to handle_dev_stop
> Pick up newer spice-common to fix a buffer overflow issue
>
> Major Changes in 0.14.91:
> IMPORTANT
> 0.14.91 is the first release candidate for the stable 0.15.x series. Whil=
e some
> bugs might still be present, it should be reasonably stable. If you are l=
ooking
> for stability for daily use, please keep using the latest 0.14.x release.
>
> Support UNIX abstract sockets
> Fix some potential thread race condition in RedClient
> Many cleanups in the code
> Improve migration test script
> Update in protocol documentation
> Improve Meson build
> Removed CELT support
> Update CI
> Removed QXLWorker definition, it was deprecated 6 years ago
> Fix some compatibility with MacOS
> Fix some compatibility with Windows
> Move the project to C++
> Some fixes for SASL dealing with WebDAV
> Fix minor Coverity reports
> Add Doxygen support, manually built with "make doxy"
> Support more mouse buttons (up to 16 buttons)
> CVE-2020-14355 multiple buffer overflow vulnerabilities in QUIC decoding
> code
>
> Major Changes in 0.14.3:
> Main changes are WebSocket and support for Windows.
>
> Add support for WebSocket, this will allow to use spice-html5 without pro=
xy
> Support Windows, now Qemu Windows can be build enabling Spice
> Fix some alignment problem
> Converted some documentation to Asciidoc format to make easier to update,
> updated some
> Minor compatibility fix for PPC64EL and ARMHF
> Minor fixes for big endian machines like MIPS
> Avoid some crashes with some buggy guest drivers, simply ignore the inval=
id
> request
> Fix for old OpenSSL versions
> Minor fix for Windows clients and brushes, fixed an issue with Photoshop
> under Windows 7
> Add ability to query video-codecs
> Small use-after-free fix
> Fix for debugging recording/replaying using QUIC images
> Fix a regression where spice reported no monitors to the client
> Fix DoS in spicevmc if WebDAV used
> Updated and improved test migration script
> Some minor fixes to smartcard support
> Avoid possible disconnection using proxies using a in-flow keepalive
> mechanism
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...0001-Convert-pthread_t-to-be-numeric.patch | 59 ------------
>  ...compile-errors-on-Linux-32bit-system.patch | 96 -------------------
>  ...igure.ac-explicitly-link-to-jpeg-lib.patch | 48 ----------
>  .../recipes-support/spice/spice_git.bb        | 37 ++-----
>  4 files changed, 10 insertions(+), 230 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/spice/spice/0001-Conv=
ert-pthread_t-to-be-numeric.patch
>  delete mode 100644 meta-networking/recipes-support/spice/spice/0001-Fix-=
compile-errors-on-Linux-32bit-system.patch
>  delete mode 100644 meta-networking/recipes-support/spice/spice/0001-conf=
igure.ac-explicitly-link-to-jpeg-lib.patch
>
> diff --git a/meta-networking/recipes-support/spice/spice/0001-Convert-pth=
read_t-to-be-numeric.patch b/meta-networking/recipes-support/spice/spice/00=
01-Convert-pthread_t-to-be-numeric.patch
> deleted file mode 100644
> index e63cbe3b72..0000000000
> --- a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-=
to-be-numeric.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 0726ce6d6f52e135e28f15ca8392568c84909b1d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 16 Jun 2018 16:21:39 -0700
> -Subject: [PATCH] Convert pthread_t to be numeric
> -
> -typecast pthread_t to unsigned long
> -pthread_t is implemented as a struct point in musl and its as per standa=
rd
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - server/red-channel.c | 5 +++--
> - server/red-client.c  | 6 +++---
> - 2 files changed, 6 insertions(+), 5 deletions(-)
> -
> ---- a/server/red-channel.c
> -+++ b/server/red-channel.c
> -@@ -204,7 +204,7 @@ red_channel_constructed(GObject *object)
> - {
> -     RedChannel *self =3D RED_CHANNEL(object);
> -
> --    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", self-=
>priv->thread_id);
> -+    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", (unsi=
gned long)self->priv->thread_id);
> -
> -     RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self);
> -
> -@@ -479,7 +479,8 @@ void red_channel_remove_client(RedChanne
> -                             "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -                             "If one of the threads is !=3D io-thread &&=
 !=3D vcpu-thread, "
> -                             "this might be a BUG",
> --                            channel->priv->thread_id, pthread_self());
> -+                            (unsigned long)channel->priv->thread_id,
> -+                            (unsigned long)pthread_self());
> -     }
> -     spice_return_if_fail(channel);
> -     link =3D g_list_find(channel->priv->clients, rcc);
> ---- a/server/red-client.c
> -+++ b/server/red-client.c
> -@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *clien
> -                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
> -                       " this might be a BUG",
> --                      client->thread_id, pthread_self());
> -+                      (unsigned long)client->thread_id, (unsigned long)=
pthread_self());
> -     }
> -     FOREACH_CHANNEL_CLIENT(client, rcc) {
> -         if (red_channel_client_is_connected(rcc)) {
> -@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *clien
> -                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
> -                       " this might be a BUG",
> --                      client->thread_id,
> --                      pthread_self());
> -+                      (unsigned long)client->thread_id,
> -+                      (unsigned long)pthread_self());
> -     }
> -     red_client_set_disconnecting(client);
> -     FOREACH_CHANNEL_CLIENT(client, rcc) {
> diff --git a/meta-networking/recipes-support/spice/spice/0001-Fix-compile=
-errors-on-Linux-32bit-system.patch b/meta-networking/recipes-support/spice=
/spice/0001-Fix-compile-errors-on-Linux-32bit-system.patch
> deleted file mode 100644
> index d04bee95fa..0000000000
> --- a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors=
-on-Linux-32bit-system.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From a2af005b5d4a62839e56f42a43df793356e78f58 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Tue, 4 Jun 2019 03:58:17 -0400
> -Subject: [PATCH] Fix compile errors on Linux 32bit system
> -
> -There are folowing compile errors on Linux 32bit system:
> -
> -red-channel.c:207:73: error: format '%x' expects argument of type
> -'unsigned int', but argument 7 has type 'long unsigned int' [-Werror=3Df=
ormat=3D]
> -|207| red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
> -                                ~~~~~~~~~~~~~~~~~~~~~^
> -                        self->priv->thread_id);
> -                ~~~~~~~~~~~~~~~~~~~~~^
> -
> -On 32bit system, #define G_GSIZE_MODIFIER "". But the type of
> -'self->priv->thread_id' is 'unsigned long int' which should match '%lx'
> -not '%x'.
> -
> -So we should recovery the <0x%" G_GSIZE_MODIFIER "x"> to <0x%lx">.
> -And others files modification are similar to G_GSIZE_MODIFIER.
> -
> -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ----
> -Upstream-Status: Submitted [https://lists.freedesktop.org/archives/spice=
-devel/2019-June/049285.html]
> -
> - server/red-channel.c    | 6 +++---
> - server/red-client.c     | 8 ++++----
> - server/red-replay-qxl.c | 2 +-
> - 3 files changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/server/red-channel.c b/server/red-channel.c
> -index f81142d..6a03ec2 100644
> ---- a/server/red-channel.c
> -+++ b/server/red-channel.c
> -@@ -202,7 +202,7 @@ red_channel_constructed(GObject *object)
> - {
> -     RedChannel *self =3D RED_CHANNEL(object);
> -
> --    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x", (unsi=
gned long)self->priv->thread_id);
> -+    red_channel_debug(self, "thread_id 0x%lx", (unsigned long)self->pri=
v->thread_id);
> -
> -     RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self);
> -
> -@@ -473,8 +473,8 @@ void red_channel_remove_client(RedChannel *channel, =
RedChannelClient *rcc)
> -
> -     if (!pthread_equal(pthread_self(), channel->priv->thread_id)) {
> -         red_channel_warning(channel,
> --                            "channel->thread_id (0x%" G_GSIZE_MODIFIER =
"x) !=3D "
> --                            "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -+                            "channel->thread_id (0x%lx) !=3D "
> -+                            "pthread_self (0x%lx)."
> -                             "If one of the threads is !=3D io-thread &&=
 !=3D vcpu-thread, "
> -                             "this might be a BUG",
> -                             (unsigned long)channel->priv->thread_id,
> -diff --git a/server/red-client.c b/server/red-client.c
> -index 2b859cb..ff4da2a 100644
> ---- a/server/red-client.c
> -+++ b/server/red-client.c
> -@@ -174,8 +174,8 @@ void red_client_migrate(RedClient *client)
> -     RedChannel *channel;
> -
> -     if (!pthread_equal(pthread_self(), client->thread_id)) {
> --        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) !=
=3D "
> --                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -+        spice_warning("client->thread_id (0x%lx) !=3D "
> -+                      "pthread_self (0x%lx)."
> -                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
> -                       " this might be a BUG",
> -                       (unsigned long)client->thread_id, (unsigned long)=
pthread_self());
> -@@ -193,8 +193,8 @@ void red_client_destroy(RedClient *client)
> -     RedChannelClient *rcc;
> -
> -     if (!pthread_equal(pthread_self(), client->thread_id)) {
> --        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) !=
=3D "
> --                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -+        spice_warning("client->thread_id (0x%lx) !=3D "
> -+                      "pthread_self (0x%lx)."
> -                       "If one of the threads is !=3D io-thread && !=3D =
vcpu-thread,"
> -                       " this might be a BUG",
> -                       (unsigned long)client->thread_id,
> -diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
> -index 6d34818..0deb406 100644
> ---- a/server/red-replay-qxl.c
> -+++ b/server/red-replay-qxl.c
> -@@ -264,7 +264,7 @@ static replay_t read_binary(SpiceReplay *replay, con=
st char *prefix, size_t *siz
> -             exit(1);
> -         }
> -         if ((ret =3D inflate(&strm, Z_NO_FLUSH)) !=3D Z_STREAM_END) {
> --            spice_error("inflate error %d (disc: %" G_GSSIZE_FORMAT ")"=
,
> -+            spice_error("inflate error %d (disc: %li)",
> -                         ret, *size - strm.total_out);
> -             if (ret =3D=3D Z_DATA_ERROR) {
> -                 /* last operation may be wrong. since we do the recordi=
ng
> ---
> -2.8.1
> -
> diff --git a/meta-networking/recipes-support/spice/spice/0001-configure.a=
c-explicitly-link-to-jpeg-lib.patch b/meta-networking/recipes-support/spice=
/spice/0001-configure.ac-explicitly-link-to-jpeg-lib.patch
> deleted file mode 100644
> index 2d05143dbf..0000000000
> --- a/meta-networking/recipes-support/spice/spice/0001-configure.ac-expli=
citly-link-to-jpeg-lib.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 6ffd9db8e02e411bda2f421abf7951dab6cf0e38 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Fri, 5 Feb 2021 01:43:44 -0800
> -Subject: [PATCH] configure.ac: explicitly link to jpeg lib
> -
> -Since oe has added lib jpeg to the depends, explicitly link to jpeg lib
> -to workaround build failure with autoconf 2.7
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - configure.ac | 14 +-------------
> - 1 file changed, 1 insertion(+), 13 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 1ce81f91..8bbb50de 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -191,24 +191,12 @@ AC_SUBST(SSL_CFLAGS)
> - AC_SUBST(SSL_LIBS)
> - AS_VAR_APPEND([SPICE_REQUIRES], [" openssl"])
> -
> --AC_CHECK_LIB(jpeg, jpeg_destroy_decompress,
> --    AC_MSG_CHECKING([for jpeglib.h])
> --    AC_TRY_CPP(
> --[#include <stdio.h>
> --#undef PACKAGE
> --#undef VERSION
> --#undef HAVE_STDLIB_H
> --#include <jpeglib.h>],
> --        JPEG_LIBS=3D'-ljpeg'
> --        AC_MSG_RESULT($jpeg_ok),
> --      AC_MSG_ERROR([jpeglib.h not found])),
> --    AC_MSG_ERROR([libjpeg not found]))
> -+JPEG_LIBS=3D'-ljpeg'
> - AC_SUBST(JPEG_LIBS)
> -
> - AC_CHECK_LIB(z, deflate, Z_LIBS=3D'-lz', AC_MSG_ERROR([zlib not found])=
)
> - AC_SUBST(Z_LIBS)
> -
> --
> - AC_ARG_ENABLE([manual],
> -                AS_HELP_STRING([--enable-manual=3D@<:@auto/yes/no@:>@],
> -                               [Build SPICE manual]),
> ---
> -2.29.2
> -
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
> index 5732f509b1..78e3b0d88d 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -13,49 +13,32 @@ architectures."
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
>
> -PV =3D "0.14.2+git${SRCPV}"
> +PV =3D "0.15.2"
>
> -SRCREV_spice =3D "7cbd70b931db76c69c89c2d9d5d704f67381a81b"
> -SRCREV_spice-common =3D "4fc4c2db36c7f07b906e9a326a9d3dc0ae6a2671"
> +SRCREV =3D "0c2c1413a8b387ea597a95b6c867470a7c56c8ab"
>
> -SRCREV_FORMAT =3D "spice_spice-common"
> -
> -SRC_URI =3D " \
> -    git://anongit.freedesktop.org/spice/spice;name=3Dspice;branch=3Dmast=
er \
> -    git://anongit.freedesktop.org/spice/spice-common;destsuffix=3Dgit/su=
bprojects/spice-common;name=3Dspice-common;branch=3Dmaster \
> -    file://0001-Convert-pthread_t-to-be-numeric.patch \
> -    file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
> -    file://0001-configure.ac-explicitly-link-to-jpeg-lib.patch \
> -"
> +SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps"
>
>  S =3D "${WORKDIR}/git"
>
>  CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched already, caused b=
y inaccurate CPE in the NVD database."
>
> -inherit autotools gettext python3native python3-dir pkgconfig
> +inherit meson gettext python3native python3-dir pkgconfig
>
> -DEPENDS +=3D "spice-protocol jpeg pixman alsa-lib glib-2.0 python3-pypar=
sing-native python3-six-native glib-2.0-native"
> +DEPENDS =3D "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4=
 python3-pyparsing-native python3-six-native glib-2.0-native zlib"
>  DEPENDS:append:class-nativesdk =3D " nativesdk-openssl"
>
>  export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/python3"
>
> -CFLAGS:append =3D " -Wno-error"
> -
>  PACKAGECONFIG:class-native =3D ""
>  PACKAGECONFIG:class-nativesdk =3D ""
> -PACKAGECONFIG ?=3D "sasl"
> +PACKAGECONFIG ?=3D "sasl opus smartcard gstreamer"
>
> -PACKAGECONFIG[celt051] =3D "--enable-celt051,--disable-celt051,celt051"
> -PACKAGECONFIG[smartcard] =3D "--enable-smartcard,--disable-smartcard,lib=
cacard,"
> -PACKAGECONFIG[sasl] =3D "--with-sasl,--without-sasl,cyrus-sasl,"
> -PACKAGECONFIG[client] =3D "--enable-client,--disable-client,,"
> -PACKAGECONFIG[gui] =3D "--enable-gui,--disable-gui,,"
> -PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,libopus,"
> -PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,,"
> -PACKAGECONFIG[xinerama] =3D "--enable-xinerama,--disable-xinerama,libxin=
erama,"
> +PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3D1.0,-Dgstreamer=3Dno,gstream=
er1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard,libcacard"
> +PACKAGECONFIG[sasl] =3D "-Dsasl=3Dtrue,-Dsasl=3Dfalse,cyrus-sasl,"
> +PACKAGECONFIG[opus] =3D "-Dopus=3Denabled,-Dopus=3Ddisabled,libopus,"
>
>  COMPATIBLE_HOST =3D '(x86_64|i.86|aarch64).*-linux'
>
>  BBCLASSEXTEND =3D "native nativesdk"
> -
> -EXTRA_OECONF:append:toolchain-clang =3D " --disable-werror"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104544): https://lists.openembedded.org/g/openembedde=
d-devel/message/104544
> Mute This Topic: https://lists.openembedded.org/mt/100913321/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

