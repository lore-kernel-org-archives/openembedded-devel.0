Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3FFC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:35:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.8851.1693380927459472482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cY0I27w2;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50078eba7afso8459471e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693380925; x=1693985725; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FoTh5c5tGcGqjhK+7gwtnPdoMpUTNsnZKMEzqYzejUY=;
        b=cY0I27w2mRdD20sQXV7MCnip9laZvyQLWwp0FLCOueL4oo8IFbIRuYjpVD6sfLsXeZ
         EzjfRDdM69LiE6hF58ub7VBod7+3dytzV6eIjvjTyQn2/h+ulMfujGmcrus6h9Ws20Yf
         Lk0sMZgdG4cvmNvRy85uFZ524iGK1D/otEPeua970dobNGRCYNO5K6oFLM98FhE7nBlQ
         bBAVszbNQ29/sEm/EO+h1HSzc968ybVweXo7D00M9svyIZ6DsdTFY7FZwLM5XolvUPOm
         yfYJdPbZch9HQgqVmPVuAuAfnm1BTt8ObEvvKytRAr8LjkkFYLEZAUnMkB3pu5VfZIgt
         s4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380925; x=1693985725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoTh5c5tGcGqjhK+7gwtnPdoMpUTNsnZKMEzqYzejUY=;
        b=DwAR7VaN4FU2tIbto07mpz5zCmMz8IgDvYCYV/FrnkFI1RjUEnOPrssf2X+D5O7KGT
         peq9pR2+meRtKeGnjTk9/NbjKr4/c0g5F9X1Efb2oDfoPb/s41goBCJ7IM9/FYEj14l7
         oiMMXCHTZZEwlHeVXZj5Wq0mcN2rFYO8/7xxfdS066soPAVsNvkKga09HWAYmzEGAmct
         sQwf8hTyVQ5b9pbKJtX0vbUxYM4is+4qwPxaBTuQ41bZGCuk1hx7yCWUsupyf/0OFeNz
         zZjUsh+U2J/fZGuWLdvwFGIheI1xQ5GIKyORm93fyDkj0Svfijjg0kxbcgV69BQMji4y
         vtdA==
X-Gm-Message-State: AOJu0YwSM5nEds58oR3nMPhDWoF6MUWFHVWnvLMh49ytrDDPupXHVP8B
	SKbKBd4bzkgokIBhc6GV0yoCHKdCAlQtmrmndAM=
X-Google-Smtp-Source: AGHT+IFd2SCHjHbZNIDpnICx/oN0nuUuLLfs0ZKDJaJJ4HIVR8LqK6iuQXJwytto2SaUz4WRIMHnMIOzc1VRDGUKh6k=
X-Received: by 2002:a19:3814:0:b0:500:a408:dbd with SMTP id
 f20-20020a193814000000b00500a4080dbdmr917643lfa.55.1693380924994; Wed, 30 Aug
 2023 00:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230823121957.5626-1-f_l_k@t-online.de> <20230823121957.5626-3-f_l_k@t-online.de>
In-Reply-To: <20230823121957.5626-3-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 09:35:01 +0200
Message-ID: <CA+chaQdTk14PWuefcNz9z41rfjzOEQou0puMY8L5npjTC0NnGg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/5] spice: upgrade 0.14.2 -> 0.15.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000080f93706041ef864"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104657

--00000000000080f93706041ef864
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like orc dependency is mandatory now (probably pulled into RSS by
something else in your builds, but not in builds without x11 in
DISTRO_FEATURES):

meson.build:139:23: ERROR: Dependency "orc-0.4" not found, tried pkgconfig

On Wed, Aug 23, 2023 at 2:20=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

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
> Fix a longstanding issue related to surface updates where wrong surfaces
> were possibly used
> Fix compatibility with OpenSSL 3
> Updates and fixes for CI
> Use more random connection IDs to fix possible issues with proxies
>
> Major Changes in 0.15:
> This is the first release in the new 0.15.x stable series. This release
> should
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
e
> some
> bugs might still be present, it should be reasonably stable. If you are
> looking
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
>  delete mode 100644
> meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-be-=
numeric.patch
>  delete mode 100644
> meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-Li=
nux-32bit-system.patch
>  delete mode 100644
> meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitly-=
link-to-jpeg-lib.patch
>
> diff --git
> a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-b=
e-numeric.patch
> b/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-b=
e-numeric.patch
> deleted file mode 100644
> index e63cbe3b72..0000000000
> ---
> a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to-b=
e-numeric.patch
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
> --    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
> self->priv->thread_id);
> -+    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
> (unsigned long)self->priv->thread_id);
> -
> -     RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self);
> -
> -@@ -479,7 +479,8 @@ void red_channel_remove_client(RedChanne
> -                             "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -                             "If one of the threads is !=3D io-thread &&=
 !=3D
> vcpu-thread, "
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
> -                       "If one of the threads is !=3D io-thread && !=3D
> vcpu-thread,"
> -                       " this might be a BUG",
> --                      client->thread_id, pthread_self());
> -+                      (unsigned long)client->thread_id, (unsigned
> long)pthread_self());
> -     }
> -     FOREACH_CHANNEL_CLIENT(client, rcc) {
> -         if (red_channel_client_is_connected(rcc)) {
> -@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *clien
> -                       "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -                       "If one of the threads is !=3D io-thread && !=3D
> vcpu-thread,"
> -                       " this might be a BUG",
> --                      client->thread_id,
> --                      pthread_self());
> -+                      (unsigned long)client->thread_id,
> -+                      (unsigned long)pthread_self());
> -     }
> -     red_client_set_disconnecting(client);
> -     FOREACH_CHANNEL_CLIENT(client, rcc) {
> diff --git
> a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-=
Linux-32bit-system.patch
> b/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-=
Linux-32bit-system.patch
> deleted file mode 100644
> index d04bee95fa..0000000000
> ---
> a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-on-=
Linux-32bit-system.patch
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
> -'unsigned int', but argument 7 has type 'long unsigned int'
> [-Werror=3Dformat=3D]
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
> -Upstream-Status: Submitted [
> https://lists.freedesktop.org/archives/spice-devel/2019-June/049285.html]
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
> --    red_channel_debug(self, "thread_id 0x%" G_GSIZE_MODIFIER "x",
> (unsigned long)self->priv->thread_id);
> -+    red_channel_debug(self, "thread_id 0x%lx", (unsigned
> long)self->priv->thread_id);
> -
> -     RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self);
> -
> -@@ -473,8 +473,8 @@ void red_channel_remove_client(RedChannel *channel,
> RedChannelClient *rcc)
> -
> -     if (!pthread_equal(pthread_self(), channel->priv->thread_id)) {
> -         red_channel_warning(channel,
> --                            "channel->thread_id (0x%" G_GSIZE_MODIFIER
> "x) !=3D "
> --                            "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -+                            "channel->thread_id (0x%lx) !=3D "
> -+                            "pthread_self (0x%lx)."
> -                             "If one of the threads is !=3D io-thread &&=
 !=3D
> vcpu-thread, "
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
> -                       "If one of the threads is !=3D io-thread && !=3D
> vcpu-thread,"
> -                       " this might be a BUG",
> -                       (unsigned long)client->thread_id, (unsigned
> long)pthread_self());
> -@@ -193,8 +193,8 @@ void red_client_destroy(RedClient *client)
> -     RedChannelClient *rcc;
> -
> -     if (!pthread_equal(pthread_self(), client->thread_id)) {
> --        spice_warning("client->thread_id (0x%" G_GSIZE_MODIFIER "x) !=
=3D "
> --                      "pthread_self (0x%" G_GSIZE_MODIFIER "x)."
> -+        spice_warning("client->thread_id (0x%lx) !=3D "
> -+                      "pthread_self (0x%lx)."
> -                       "If one of the threads is !=3D io-thread && !=3D
> vcpu-thread,"
> -                       " this might be a BUG",
> -                       (unsigned long)client->thread_id,
> -diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c
> -index 6d34818..0deb406 100644
> ---- a/server/red-replay-qxl.c
> -+++ b/server/red-replay-qxl.c
> -@@ -264,7 +264,7 @@ static replay_t read_binary(SpiceReplay *replay,
> const char *prefix, size_t *siz
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
> diff --git
> a/meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitl=
y-link-to-jpeg-lib.patch
> b/meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitl=
y-link-to-jpeg-lib.patch
> deleted file mode 100644
> index 2d05143dbf..0000000000
> ---
> a/meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitl=
y-link-to-jpeg-lib.patch
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
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> b/meta-networking/recipes-support/spice/spice_git.bb
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
> -    git://
> anongit.freedesktop.org/spice/spice-common;destsuffix=3Dgit/subprojects/s=
pice-common;name=3Dspice-common;branch=3Dmaster
> \
> -    file://0001-Convert-pthread_t-to-be-numeric.patch \
> -    file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
> -    file://0001-configure.ac-explicitly-link-to-jpeg-lib.patch \
> -"
> +SRC_URI =3D "gitsm://
> gitlab.freedesktop.org/spice/spice;branch=3Dmaster;protocol=3Dhttps"
>
>  S =3D "${WORKDIR}/git"
>
>  CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched already, caused b=
y
> inaccurate CPE in the NVD database."
>
> -inherit autotools gettext python3native python3-dir pkgconfig
> +inherit meson gettext python3native python3-dir pkgconfig
>
> -DEPENDS +=3D "spice-protocol jpeg pixman alsa-lib glib-2.0
> python3-pyparsing-native python3-six-native glib-2.0-native"
> +DEPENDS =3D "spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf lz4
> python3-pyparsing-native python3-six-native glib-2.0-native zlib"
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
> -PACKAGECONFIG[smartcard] =3D
> "--enable-smartcard,--disable-smartcard,libcacard,"
> -PACKAGECONFIG[sasl] =3D "--with-sasl,--without-sasl,cyrus-sasl,"
> -PACKAGECONFIG[client] =3D "--enable-client,--disable-client,,"
> -PACKAGECONFIG[gui] =3D "--enable-gui,--disable-gui,,"
> -PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,libopus,"
> -PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,,"
> -PACKAGECONFIG[xinerama] =3D
> "--enable-xinerama,--disable-xinerama,libxinerama,"
> +PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3D1.0,-Dgstreamer=3Dno,gstream=
er1.0
> gstreamer1.0-plugins-base"
> +PACKAGECONFIG[smartcard] =3D
> "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabled,libcacard,libcacard"
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
> View/Reply Online (#104544):
> https://lists.openembedded.org/g/openembedded-devel/message/104544
> Mute This Topic: https://lists.openembedded.org/mt/100913321/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000080f93706041ef864
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like orc dependency is mandatory now (probably pulle=
d into RSS by something else in your builds, but not in builds without x11 =
in DISTRO_FEATURES):<div><br><div>meson.build:139:23: ERROR: Dependency &qu=
ot;orc-0.4&quot; not found, tried pkgconfig<br></div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 23, =
2023 at 2:20=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de=
">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">-switch to meson buildsystem<br>
-remove patches<br>
-update dependencies<br>
-fetch spice-common as a submodule<br>
<br>
Major Changes in 0.15.2:<br>
Really minor fix release, mainly to fix a distribution issue<br>
<br>
Add missing file to distribution<br>
Fix sound recording fix in case of buffer wrapping<br>
<br>
Major Changes in 0.15.1:<br>
<br>
Fix some compatibility issues with FreeBSD<br>
Fix some minor issue with build<br>
Improve packaging with Meson<br>
Lot of C++ improves (clang-tidy)<br>
Fix some compatibility with no-Glibc libraries (like Musl)<br>
Fix minor leaks shutting down library<br>
Add Doxygen file to distribution<br>
Fix a longstanding issue related to surface updates where wrong surfaces we=
re possibly used<br>
Fix compatibility with OpenSSL 3<br>
Updates and fixes for CI<br>
Use more random connection IDs to fix possible issues with proxies<br>
<br>
Major Changes in 0.15:<br>
This is the first release in the new 0.15.x stable series. This release sho=
uld<br>
be ready for production use.<br>
<br>
Minor updates to CI<br>
Some compatibility with OpenSSL<br>
Change the behavior of handle_dev_start ignoring multiple start requests<br=
>
Ignore multiple calls to handle_dev_stop<br>
Pick up newer spice-common to fix a buffer overflow issue<br>
<br>
Major Changes in 0.14.91:<br>
IMPORTANT<br>
0.14.91 is the first release candidate for the stable 0.15.x series. While =
some<br>
bugs might still be present, it should be reasonably stable. If you are loo=
king<br>
for stability for daily use, please keep using the latest 0.14.x release.<b=
r>
<br>
Support UNIX abstract sockets<br>
Fix some potential thread race condition in RedClient<br>
Many cleanups in the code<br>
Improve migration test script<br>
Update in protocol documentation<br>
Improve Meson build<br>
Removed CELT support<br>
Update CI<br>
Removed QXLWorker definition, it was deprecated 6 years ago<br>
Fix some compatibility with MacOS<br>
Fix some compatibility with Windows<br>
Move the project to C++<br>
Some fixes for SASL dealing with WebDAV<br>
Fix minor Coverity reports<br>
Add Doxygen support, manually built with &quot;make doxy&quot;<br>
Support more mouse buttons (up to 16 buttons)<br>
CVE-2020-14355 multiple buffer overflow vulnerabilities in QUIC decoding<br=
>
code<br>
<br>
Major Changes in 0.14.3:<br>
Main changes are WebSocket and support for Windows.<br>
<br>
Add support for WebSocket, this will allow to use spice-html5 without proxy=
<br>
Support Windows, now Qemu Windows can be build enabling Spice<br>
Fix some alignment problem<br>
Converted some documentation to Asciidoc format to make easier to update,<b=
r>
updated some<br>
Minor compatibility fix for PPC64EL and ARMHF<br>
Minor fixes for big endian machines like MIPS<br>
Avoid some crashes with some buggy guest drivers, simply ignore the invalid=
<br>
request<br>
Fix for old OpenSSL versions<br>
Minor fix for Windows clients and brushes, fixed an issue with Photoshop<br=
>
under Windows 7<br>
Add ability to query video-codecs<br>
Small use-after-free fix<br>
Fix for debugging recording/replaying using QUIC images<br>
Fix a regression where spice reported no monitors to the client<br>
Fix DoS in spicevmc if WebDAV used<br>
Updated and improved test migration script<br>
Some minor fixes to smartcard support<br>
Avoid possible disconnection using proxies using a in-flow keepalive<br>
mechanism<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...0001-Convert-pthread_t-to-be-numeric.patch | 59 ------------<br>
=C2=A0...compile-errors-on-Linux-32bit-system.patch | 96 ------------------=
-<br>
=C2=A0...igure.ac-explicitly-link-to-jpeg-lib.patch | 48 ----------<br>
=C2=A0.../recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">spice_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 =
++-----<br>
=C2=A04 files changed, 10 insertions(+), 230 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/spice/spice/0001-C=
onvert-pthread_t-to-be-numeric.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/spice/spice/0001-F=
ix-compile-errors-on-Linux-32bit-system.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/spice/spice/0001-c=
onfigure.ac-explicitly-link-to-jpeg-lib.patch<br>
<br>
diff --git a/meta-networking/recipes-support/spice/spice/0001-Convert-pthre=
ad_t-to-be-numeric.patch b/meta-networking/recipes-support/spice/spice/0001=
-Convert-pthread_t-to-be-numeric.patch<br>
deleted file mode 100644<br>
index e63cbe3b72..0000000000<br>
--- a/meta-networking/recipes-support/spice/spice/0001-Convert-pthread_t-to=
-be-numeric.patch<br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-From 0726ce6d6f52e135e28f15ca8392568c84909b1d Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sat, 16 Jun 2018 16:21:39 -0700<br>
-Subject: [PATCH] Convert pthread_t to be numeric<br>
-<br>
-typecast pthread_t to unsigned long<br>
-pthread_t is implemented as a struct point in musl and its as per standard=
<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- server/red-channel.c | 5 +++--<br>
- server/red-client.c=C2=A0 | 6 +++---<br>
- 2 files changed, 6 insertions(+), 5 deletions(-)<br>
-<br>
---- a/server/red-channel.c<br>
-+++ b/server/red-channel.c<br>
-@@ -204,7 +204,7 @@ red_channel_constructed(GObject *object)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0RedChannel *self =3D RED_CHANNEL(object);<br>
- <br>
--=C2=A0 =C2=A0 red_channel_debug(self, &quot;thread_id 0x%&quot; G_GSIZE_M=
ODIFIER &quot;x&quot;, self-&gt;priv-&gt;thread_id);<br>
-+=C2=A0 =C2=A0 red_channel_debug(self, &quot;thread_id 0x%&quot; G_GSIZE_M=
ODIFIER &quot;x&quot;, (unsigned long)self-&gt;priv-&gt;thread_id);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self)=
;<br>
- <br>
-@@ -479,7 +479,8 @@ void red_channel_remove_client(RedChanne<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pthread_self (0x%&quot; G_GSIZE_MODIFI=
ER &quot;x).&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;If one of the threads is !=3D io-threa=
d &amp;&amp; !=3D vcpu-thread, &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;this might be a BUG&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 channel-&gt;priv-&gt;thread_id, pthread_self());<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long)channel-&gt;priv-&gt;thread_id,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long)pthread_self());<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0spice_return_if_fail(channel);<br>
-=C2=A0 =C2=A0 =C2=A0link =3D g_list_find(channel-&gt;priv-&gt;clients, rcc=
);<br>
---- a/server/red-client.c<br>
-+++ b/server/red-client.c<br>
-@@ -180,7 +180,7 @@ void red_client_migrate(RedClient *clien<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;pthread_self (0x%&quot; G_GSIZE_MODIFIER &quot;x).&quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;If one of the threads is !=3D io-thread &amp;&amp; !=3D vcp=
u-thread,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot; this might be a BUG&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;thread_id, pthread_self());<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long)client-&gt;thread_id, (unsigned long)pthread_self());<br=
>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0FOREACH_CHANNEL_CLIENT(client, rcc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (red_channel_client_is_connected(rcc)=
) {<br>
-@@ -199,8 +199,8 @@ void red_client_destroy(RedClient *clien<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;pthread_self (0x%&quot; G_GSIZE_MODIFIER &quot;x).&quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;If one of the threads is !=3D io-thread &amp;&amp; !=3D vcp=
u-thread,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot; this might be a BUG&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 client-&gt;thread_id,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pthread_self());<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long)client-&gt;thread_id,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long)pthread_self());<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0red_client_set_disconnecting(client);<br>
-=C2=A0 =C2=A0 =C2=A0FOREACH_CHANNEL_CLIENT(client, rcc) {<br>
diff --git a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-e=
rrors-on-Linux-32bit-system.patch b/meta-networking/recipes-support/spice/s=
pice/0001-Fix-compile-errors-on-Linux-32bit-system.patch<br>
deleted file mode 100644<br>
index d04bee95fa..0000000000<br>
--- a/meta-networking/recipes-support/spice/spice/0001-Fix-compile-errors-o=
n-Linux-32bit-system.patch<br>
+++ /dev/null<br>
@@ -1,96 +0,0 @@<br>
-From a2af005b5d4a62839e56f42a43df793356e78f58 Mon Sep 17 00:00:00 2001<br>
-From: &quot;Hongzhi.Song&quot; &lt;<a href=3D"mailto:hongzhi.song@windrive=
r.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
-Date: Tue, 4 Jun 2019 03:58:17 -0400<br>
-Subject: [PATCH] Fix compile errors on Linux 32bit system<br>
-<br>
-There are folowing compile errors on Linux 32bit system:<br>
-<br>
-red-channel.c:207:73: error: format &#39;%x&#39; expects argument of type<=
br>
-&#39;unsigned int&#39;, but argument 7 has type &#39;long unsigned int&#39=
; [-Werror=3Dformat=3D]<br>
-|207| red_channel_debug(self, &quot;thread_id 0x%&quot; G_GSIZE_MODIFIER &=
quot;x&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~~~^<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self-&gt;priv-&gt;thread_id);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~=
~~~^<br>
-<br>
-On 32bit system, #define G_GSIZE_MODIFIER &quot;&quot;. But the type of<br=
>
-&#39;self-&gt;priv-&gt;thread_id&#39; is &#39;unsigned long int&#39; which=
 should match &#39;%lx&#39;<br>
-not &#39;%x&#39;.<br>
-<br>
-So we should recovery the &lt;0x%&quot; G_GSIZE_MODIFIER &quot;x&quot;&gt;=
 to &lt;0x%lx&quot;&gt;.<br>
-And others files modification are similar to G_GSIZE_MODIFIER.<br>
-<br>
-Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.c=
om" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted [<a href=3D"https://lists.freedesktop.org/archi=
ves/spice-devel/2019-June/049285.html" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.freedesktop.org/archives/spice-devel/2019-June/049285.html</=
a>]<br>
-<br>
- server/red-channel.c=C2=A0 =C2=A0 | 6 +++---<br>
- server/red-client.c=C2=A0 =C2=A0 =C2=A0| 8 ++++----<br>
- server/red-replay-qxl.c | 2 +-<br>
- 3 files changed, 8 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/server/red-channel.c b/server/red-channel.c<br>
-index f81142d..6a03ec2 100644<br>
---- a/server/red-channel.c<br>
-+++ b/server/red-channel.c<br>
-@@ -202,7 +202,7 @@ red_channel_constructed(GObject *object)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0RedChannel *self =3D RED_CHANNEL(object);<br>
- <br>
--=C2=A0 =C2=A0 red_channel_debug(self, &quot;thread_id 0x%&quot; G_GSIZE_M=
ODIFIER &quot;x&quot;, (unsigned long)self-&gt;priv-&gt;thread_id);<br>
-+=C2=A0 =C2=A0 red_channel_debug(self, &quot;thread_id 0x%lx&quot;, (unsig=
ned long)self-&gt;priv-&gt;thread_id);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0RedChannelClass *klass =3D RED_CHANNEL_GET_CLASS(self)=
;<br>
- <br>
-@@ -473,8 +473,8 @@ void red_channel_remove_client(RedChannel *channel, Re=
dChannelClient *rcc)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (!pthread_equal(pthread_self(), channel-&gt;priv-&g=
t;thread_id)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0red_channel_warning(channel,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;channel-&gt;thread_id (0x%&quot; G_GSIZE_MOD=
IFIER &quot;x) !=3D &quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pthread_self (0x%&quot; G_GSIZE_MODIFIER &qu=
ot;x).&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;channel-&gt;thread_id (0x%lx) !=3D &quot;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pthread_self (0x%lx).&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;If one of the threads is !=3D io-threa=
d &amp;&amp; !=3D vcpu-thread, &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;this might be a BUG&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned long)channel-&gt;priv-&gt;thread_i=
d,<br>
-diff --git a/server/red-client.c b/server/red-client.c<br>
-index 2b859cb..ff4da2a 100644<br>
---- a/server/red-client.c<br>
-+++ b/server/red-client.c<br>
-@@ -174,8 +174,8 @@ void red_client_migrate(RedClient *client)<br>
-=C2=A0 =C2=A0 =C2=A0RedChannel *channel;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (!pthread_equal(pthread_self(), client-&gt;thread_i=
d)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_warning(&quot;client-&gt;thread_id (0x%=
&quot; G_GSIZE_MODIFIER &quot;x) !=3D &quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;pthread_self (0x%&quot; G_GSIZE_MODIFIER &quot;x).&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_warning(&quot;client-&gt;thread_id (0x%=
lx) !=3D &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;pthread_self (0x%lx).&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;If one of the threads is !=3D io-thread &amp;&amp; !=3D vcp=
u-thread,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot; this might be a BUG&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(unsigned long)client-&gt;thread_id, (unsigned long)pthread_self(=
));<br>
-@@ -193,8 +193,8 @@ void red_client_destroy(RedClient *client)<br>
-=C2=A0 =C2=A0 =C2=A0RedChannelClient *rcc;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (!pthread_equal(pthread_self(), client-&gt;thread_i=
d)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_warning(&quot;client-&gt;thread_id (0x%=
&quot; G_GSIZE_MODIFIER &quot;x) !=3D &quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;pthread_self (0x%&quot; G_GSIZE_MODIFIER &quot;x).&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_warning(&quot;client-&gt;thread_id (0x%=
lx) !=3D &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;pthread_self (0x%lx).&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;If one of the threads is !=3D io-thread &amp;&amp; !=3D vcp=
u-thread,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot; this might be a BUG&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(unsigned long)client-&gt;thread_id,<br>
-diff --git a/server/red-replay-qxl.c b/server/red-replay-qxl.c<br>
-index 6d34818..0deb406 100644<br>
---- a/server/red-replay-qxl.c<br>
-+++ b/server/red-replay-qxl.c<br>
-@@ -264,7 +264,7 @@ static replay_t read_binary(SpiceReplay *replay, const=
 char *prefix, size_t *siz<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((ret =3D inflate(&amp;strm, Z_NO_FLU=
SH)) !=3D Z_STREAM_END) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_error(&quot;inflate error=
 %d (disc: %&quot; G_GSSIZE_FORMAT &quot;)&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spice_error(&quot;inflate error=
 %d (disc: %li)&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret, *size - strm.total_out);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D Z_DATA_ERRO=
R) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* last oper=
ation may be wrong. since we do the recording<br>
--- <br>
-2.8.1<br>
-<br>
diff --git a/meta-networking/recipes-support/spice/spice/0001-configure.ac-=
explicitly-link-to-jpeg-lib.patch b/meta-networking/recipes-support/spice/s=
pice/0001-configure.ac-explicitly-link-to-jpeg-lib.patch<br>
deleted file mode 100644<br>
index 2d05143dbf..0000000000<br>
--- a/meta-networking/recipes-support/spice/spice/0001-configure.ac-explici=
tly-link-to-jpeg-lib.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From 6ffd9db8e02e411bda2f421abf7951dab6cf0e38 Mon Sep 17 00:00:00 2001<br>
-From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-Date: Fri, 5 Feb 2021 01:43:44 -0800<br>
-Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: explicitly link to jpeg lib<br>
-<br>
-Since oe has added lib jpeg to the depends, explicitly link to jpeg lib<br=
>
-to workaround build failure with autoconf 2.7<br>
-<br>
-Upstream-Status: Inappropriate [oe specific]<br>
-<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 14 +-------------<br>
- 1 file changed, 1 insertion(+), 13 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 1ce81f91..8bbb50de 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -191,24 +191,12 @@ AC_SUBST(SSL_CFLAGS)<br>
- AC_SUBST(SSL_LIBS)<br>
- AS_VAR_APPEND([SPICE_REQUIRES], [&quot; openssl&quot;])<br>
- <br>
--AC_CHECK_LIB(jpeg, jpeg_destroy_decompress,<br>
--=C2=A0 =C2=A0 AC_MSG_CHECKING([for jpeglib.h])<br>
--=C2=A0 =C2=A0 AC_TRY_CPP(<br>
--[#include &lt;stdio.h&gt;<br>
--#undef PACKAGE<br>
--#undef VERSION<br>
--#undef HAVE_STDLIB_H<br>
--#include &lt;jpeglib.h&gt;],<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 JPEG_LIBS=3D&#39;-ljpeg&#39;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT($jpeg_ok),<br>
--=C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([jpeglib.h not found])),<br>
--=C2=A0 =C2=A0 AC_MSG_ERROR([libjpeg not found]))<br>
-+JPEG_LIBS=3D&#39;-ljpeg&#39;<br>
- AC_SUBST(JPEG_LIBS)<br>
- <br>
- AC_CHECK_LIB(z, deflate, Z_LIBS=3D&#39;-lz&#39;, AC_MSG_ERROR([zlib not f=
ound]))<br>
- AC_SUBST(Z_LIBS)<br>
- <br>
--<br>
- AC_ARG_ENABLE([manual],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_HELP_STRING([--=
enable-manual=3D@&lt;:@auto/yes/no@:&gt;@],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Build SPICE manual]),<br>
--- <br>
-2.29.2<br>
-<br>
diff --git a/meta-networking/recipes-support/spice/<a href=3D"http://spice_=
git.bb" rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a> b/meta-networ=
king/recipes-support/spice/<a href=3D"http://spice_git.bb" rel=3D"noreferre=
r" target=3D"_blank">spice_git.bb</a><br>
index 5732f509b1..78e3b0d88d 100644<br>
--- a/meta-networking/recipes-support/spice/<a href=3D"http://spice_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a><br>
+++ b/meta-networking/recipes-support/spice/<a href=3D"http://spice_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">spice_git.bb</a><br>
@@ -13,49 +13,32 @@ architectures.&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079=
008b364516c&quot;<br>
<br>
-PV =3D &quot;0.14.2+git${SRCPV}&quot;<br>
+PV =3D &quot;0.15.2&quot;<br>
<br>
-SRCREV_spice =3D &quot;7cbd70b931db76c69c89c2d9d5d704f67381a81b&quot;<br>
-SRCREV_spice-common =3D &quot;4fc4c2db36c7f07b906e9a326a9d3dc0ae6a2671&quo=
t;<br>
+SRCREV =3D &quot;0c2c1413a8b387ea597a95b6c867470a7c56c8ab&quot;<br>
<br>
-SRCREV_FORMAT =3D &quot;spice_spice-common&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://anongit.freedesktop.org/spice/spice;=
name=3Dspice;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">anongit.=
freedesktop.org/spice/spice;name=3Dspice;branch=3Dmaster</a> \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://anongit.freedesktop.org/spice/spice-=
common;destsuffix=3Dgit/subprojects/spice-common;name=3Dspice-common;branch=
=3Dmaster" rel=3D"noreferrer" target=3D"_blank">anongit.freedesktop.org/spi=
ce/spice-common;destsuffix=3Dgit/subprojects/spice-common;name=3Dspice-comm=
on;branch=3Dmaster</a> \<br>
-=C2=A0 =C2=A0 file://0001-Convert-pthread_t-to-be-numeric.patch \<br>
-=C2=A0 =C2=A0 file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \=
<br>
-=C2=A0 =C2=A0 file://0001-configure.ac-explicitly-link-to-jpeg-lib.patch \=
<br>
-&quot;<br>
+SRC_URI =3D &quot;gitsm://<a href=3D"http://gitlab.freedesktop.org/spice/s=
pice;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>gitlab.freedesktop.org/spice/spice;branch=3Dmaster;protocol=3Dhttps</a>&qu=
ot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2018-10893] =3D &quot;fixed-version: patched already, =
caused by inaccurate CPE in the NVD database.&quot;<br>
<br>
-inherit autotools gettext python3native python3-dir pkgconfig<br>
+inherit meson gettext python3native python3-dir pkgconfig<br>
<br>
-DEPENDS +=3D &quot;spice-protocol jpeg pixman alsa-lib glib-2.0 python3-py=
parsing-native python3-six-native glib-2.0-native&quot;<br>
+DEPENDS =3D &quot;spice-protocol jpeg pixman alsa-lib glib-2.0 gdk-pixbuf =
lz4 python3-pyparsing-native python3-six-native glib-2.0-native zlib&quot;<=
br>
=C2=A0DEPENDS:append:class-nativesdk =3D &quot; nativesdk-openssl&quot;<br>
<br>
=C2=A0export PYTHON=3D&quot;${STAGING_BINDIR_NATIVE}/python3-native/python3=
&quot;<br>
<br>
-CFLAGS:append =3D &quot; -Wno-error&quot;<br>
-<br>
=C2=A0PACKAGECONFIG:class-native =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG:class-nativesdk =3D &quot;&quot;<br>
-PACKAGECONFIG ?=3D &quot;sasl&quot;<br>
+PACKAGECONFIG ?=3D &quot;sasl opus smartcard gstreamer&quot;<br>
<br>
-PACKAGECONFIG[celt051] =3D &quot;--enable-celt051,--disable-celt051,celt05=
1&quot;<br>
-PACKAGECONFIG[smartcard] =3D &quot;--enable-smartcard,--disable-smartcard,=
libcacard,&quot;<br>
-PACKAGECONFIG[sasl] =3D &quot;--with-sasl,--without-sasl,cyrus-sasl,&quot;=
<br>
-PACKAGECONFIG[client] =3D &quot;--enable-client,--disable-client,,&quot;<b=
r>
-PACKAGECONFIG[gui] =3D &quot;--enable-gui,--disable-gui,,&quot;<br>
-PACKAGECONFIG[opus] =3D &quot;--enable-opus,--disable-opus,libopus,&quot;<=
br>
-PACKAGECONFIG[opengl] =3D &quot;--enable-opengl,--disable-opengl,,&quot;<b=
r>
-PACKAGECONFIG[xinerama] =3D &quot;--enable-xinerama,--disable-xinerama,lib=
xinerama,&quot;<br>
+PACKAGECONFIG[gstreamer] =3D &quot;-Dgstreamer=3D1.0,-Dgstreamer=3Dno,gstr=
eamer1.0 gstreamer1.0-plugins-base&quot;<br>
+PACKAGECONFIG[smartcard] =3D &quot;-Dsmartcard=3Denabled,-Dsmartcard=3Ddis=
abled,libcacard,libcacard&quot;<br>
+PACKAGECONFIG[sasl] =3D &quot;-Dsasl=3Dtrue,-Dsasl=3Dfalse,cyrus-sasl,&quo=
t;<br>
+PACKAGECONFIG[opus] =3D &quot;-Dopus=3Denabled,-Dopus=3Ddisabled,libopus,&=
quot;<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(x86_64|i.86|aarch64).*-linux&#39;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-EXTRA_OECONF:append:toolchain-clang =3D &quot; --disable-werror&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104544): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104544" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104544</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100913321/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100913321/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000080f93706041ef864--

