Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B190B77A45
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 18:23:16 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l44so13345834wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UHjl1EWZVl36oAw2nWqJ5m3Mp/AAdkDc4jL/TDFxVhw=;
	b=kzk8V2uWpGxhKdnbldlC8kKcildY2Tg7pcGIHaCRWhmi43ApanronWBI6Gk2n77o+v
	PhHr+r/71oG4igC+4x7F5N7KahhRvmI9UXtH4C40Bfr8lVWtOASvwgziQ1tUtCWX0nMq
	VqraoqitePo1Tcwb9Acq3slefImA/2njWxUZaW6oJ1/qoD2xGl0mu1ggSnAf5ehCjeVY
	HXCQ+0+dMrKi8LS4x590I2zx4B8UNKHHVrzr/fq0ge//bHw7EKw+gnfYVJ7nFfFOcBtA
	9bfp854Mme1tso/3kq7knChRRdvhm2jijPKXCa39IsyY98dRO3LN3QAubDjZNIWubApR
	uS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UHjl1EWZVl36oAw2nWqJ5m3Mp/AAdkDc4jL/TDFxVhw=;
	b=kkaQypvUq3jeZsJafEtNyVO+XXGWrtJbUiKW92qwKzK+8zkRJkqJ3fr8xDjlb8oRkf
	xILGwq/Zw6wTMPjfj78p3eNEFyU1S3f4ON87pnGDrc+uZRPCNS7LqDozW08c/MbQ8gJM
	EYGR0ZjqYpbmMXsiAC0+ypsYWfzF1SoontsMGcqRyyZUBo6Ifkl0K25H1GNASNGBSJFT
	zFOt6k5oPYSaWgbOCaic8030kS+Uh2sgOjhf77ApRsn0TCd05HGp9M859sLECFg+mH3W
	fWIOgU3FQQ4RUpvzizEXJ6B4kDkwvL3JSDY2rdse6eWLPEQcIt8ooZE5dOZZ6CC5IGIk
	Yiew==
X-Gm-Message-State: AN3rC/5RjeeeBAi1H3Q1f4UUhelxnv9u6BmqDBQA2M7SQkFvm3J5J6a0
	vtDdj361jpMH/HBWipQnyqAHwjWFqA==
X-Received: by 10.223.174.131 with SMTP id y3mr14575619wrc.196.1492798997204; 
	Fri, 21 Apr 2017 11:23:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Fri, 21 Apr 2017 11:23:16 -0700 (PDT)
In-Reply-To: <20170418182142.27253-30-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
	<20170418182142.27253-30-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Apr 2017 20:23:16 +0200
Message-ID: <CA+chaQdQog3J7nNnpMAY66TobRr8ckSNVB6WeoD4sapyyTDuUw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][ 30/32] lirc: update to 0.9.4d
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
X-List-Received-Date: Fri, 21 Apr 2017 18:23:17 -0000
Content-Type: text/plain; charset=UTF-8

lirc-0.9.4d: lirc: Files/directories were installed but not shipped in
any package:
  /lib/systemd/system/lircd-setup.service
  /lib/systemd/system/lircd-uinput.service
  /lib/systemd/system/irexec.service
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
lirc: 3 installed and not shipped files. [installed-vs-shipped]
lirc-0.9.4d: lirc:
/lirc-contrib/usr/share/lirc/contrib/99-remote-control-lirc.rules is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/97-lircd-uinput.rules is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/61-lirc.blacklist-all.conf
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircmd.conf is owned by uid
3004, which is the same as the user running bitbake. This may be due
to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/irexec.desktop is owned by
uid 3004, which is the same as the user running bitbake. This may be
due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/98-lirc-stable-link.rules
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircd.conf is owned by uid
3004, which is the same as the user running bitbake. This may be due
to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/irman2lirc is owned by uid
3004, which is the same as the user running bitbake. This may be due
to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/60-usb-generic-perms.rules
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/release-process.txt is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/60-lirc.rules is owned by
uid 3004, which is the same as the user running bitbake. This may be
due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/volume_pulse.lircrc
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/mplayer.lircrc is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/volume_mythtv.lircrc
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/vlc.lircrc is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/mythtv.lircrc is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/lircmap.xml is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/lircrc is owned by
uid 3004, which is the same as the user running bitbake. This may be
due to host contamination
lirc: /lirc-contrib/usr/share/lirc/contrib/lircrc/volume_alsa.lircrc
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


On Tue, Apr 18, 2017 at 8:21 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/lirc/lirc.inc         |   2 +-
>  ...crcd-Mark-local-inline-funtions-as-static.patch |  49 ----------
>  .../recipes-connectivity/lirc/lirc/pollfd.patch    | 101
> +++++++++++++++++++++
>  .../lirc/{lirc_0.9.2.bb => lirc_0.9.4d.bb}         |   7 +-
>  4 files changed, 106 insertions(+), 53 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/
> lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch
>  create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
>  rename meta-oe/recipes-connectivity/lirc/{lirc_0.9.2.bb => lirc_0.9.4d.bb}
> (92%)
>
> diff --git a/meta-oe/recipes-connectivity/lirc/lirc.inc b/meta-oe/recipes-
> connectivity/lirc/lirc.inc
> index 6ff8e0160..ef79885a0 100644
> --- a/meta-oe/recipes-connectivity/lirc/lirc.inc
> +++ b/meta-oe/recipes-connectivity/lirc/lirc.inc
> @@ -6,7 +6,7 @@ DESCRIPTION_append_lirc-nslu2example = " This package
> contains a working config
>  HOMEPAGE = "http://www.lirc.org"
>  SECTION = "console/network"
>  LICENSE = "GPLv2"
> -DEPENDS = "alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
> +DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack
> portaudio-v19"
>
>  SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2"
>
> diff --git a/meta-oe/recipes-connectivity/lirc/lirc/0001-
> lircrcd-Mark-local-inline-funtions-as-static.patch b/meta-oe/recipes-
> connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-
> funtions-as-static.patch
> deleted file mode 100644
> index e19d27671..000000000
> --- a/meta-oe/recipes-connectivity/lirc/lirc/0001-
> lircrcd-Mark-local-inline-funtions-as-static.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From c2be4543e4777c9e3d74b30326ba37b01917b0a9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 25 Aug 2016 03:02:37 +0000
> -Subject: [PATCH] lircrcd: Mark local inline funtions as static
> -
> -These functions are not used anywhere outside
> -this file, so they should be converted into static
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - daemons/lircrcd.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/daemons/lircrcd.c b/daemons/lircrcd.c
> -index 55777cd..5ddc94d 100644
> ---- a/daemons/lircrcd.c
> -+++ b/daemons/lircrcd.c
> -@@ -153,7 +153,7 @@ char *s;
> - /* A safer write(), since sockets might not write all but only some of
> the
> -    bytes requested */
> -
> --inline int write_socket(int fd, char *buf, int len)
> -+static inline int write_socket(int fd, char *buf, int len)
> - {
> -       int done, todo = len;
> -
> -@@ -167,7 +167,7 @@ inline int write_socket(int fd, char *buf, int len)
> -       return (len);
> - }
> -
> --inline int write_socket_len(int fd, char *buf)
> -+static inline int write_socket_len(int fd, char *buf)
> - {
> -       int len;
> -
> -@@ -177,7 +177,7 @@ inline int write_socket_len(int fd, char *buf)
> -       return (1);
> - }
> -
> --inline int read_timeout(int fd, char *buf, int len, int timeout)
> -+static inline int read_timeout(int fd, char *buf, int len, int timeout)
> - {
> -       fd_set fds;
> -       struct timeval tv;
> ---
> -1.9.1
> -
> diff --git a/meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
> b/meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
> new file mode 100644
> index 000000000..4feea8034
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
> @@ -0,0 +1,101 @@
> +Index: lirc-0.9.4d/daemons/lircrcd.cpp
> +===================================================================
> +--- lirc-0.9.4d.orig/daemons/lircrcd.cpp
> ++++ lirc-0.9.4d/daemons/lircrcd.cpp
> +@@ -29,10 +29,12 @@
> + #include <sys/un.h>
> + #include <sys/stat.h>
> + #include <sys/types.h>
> ++#include <poll.h>
> + #include <syslog.h>
> +
> + #include "lirc_client.h"
> + #include "lirc/lirc_log.h"
> ++#include "lirc/curl_poll.h"
> +
> + #define MAX_CLIENTS 100
> + #define WHITE_SPACE " \t"
> +Index: lirc-0.9.4d/lib/curl_poll.c
> +===================================================================
> +--- lirc-0.9.4d.orig/lib/curl_poll.c
> ++++ lirc-0.9.4d/lib/curl_poll.c
> +@@ -36,6 +36,7 @@
> + #include <stdlib.h>
> + #include <sys/time.h>
> + #include <sys/types.h>
> ++#include <sys/poll.h>
> +
> + #include "lirc_log.h"
> + #include "curl_poll.h"
> +@@ -67,7 +68,7 @@ static const logchannel_t logchannel = L
> +
> + #ifdef HAVE_POLL_FINE
> +
> +-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
> ++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
> + {
> +       return poll(ufds, nfds, timeout_ms);
> + }
> +@@ -112,7 +113,7 @@ static int verify_sock(int s)
> + }
> +
> +
> +-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
> ++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
> + {
> +       struct timeval pending_tv;
> +       struct timeval* ptimeout;
> +Index: lirc-0.9.4d/lib/curl_poll.h
> +===================================================================
> +--- lirc-0.9.4d.orig/lib/curl_poll.h
> ++++ lirc-0.9.4d/lib/curl_poll.h
> +@@ -1,5 +1,5 @@
> +-#ifndef _POLL_H
> +-#define _POLL_H
> ++#ifndef _LIB_CURL_POLL_H
> ++#define _LIB_CURL_POLL_H
> + /***********************************************************
> ****************
> +  *                                  _   _ ____  _
> +  *  Project                     ___| | | |  _ \| |
> +@@ -29,13 +29,9 @@
> + extern "C" {
> + #endif
> +
> +-#ifdef HAVE_SYS_POLL_H
> +-#include <sys/poll.h>
> +-#else
> + #include <poll.h>
> +-#endif
> +
> +-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
> ++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
> +
> + #ifdef __cplusplus
> + }
> +Index: lirc-0.9.4d/lib/lirc/curl_poll.h
> +===================================================================
> +--- lirc-0.9.4d.orig/lib/lirc/curl_poll.h
> ++++ lirc-0.9.4d/lib/lirc/curl_poll.h
> +@@ -1,5 +1,5 @@
> +-#ifndef _POLL_H
> +-#define _POLL_H
> ++#ifndef _LIRC_CURL_POLL_H
> ++#define _LIRC_CURL_POLL_H
> + /***********************************************************
> ****************
> +  *                                  _   _ ____  _
> +  *  Project                     ___| | | |  _ \| |
> +@@ -29,13 +29,9 @@
> + extern "C" {
> + #endif
> +
> +-#ifdef HAVE_SYS_POLL_H
> +-#include <sys/poll.h>
> +-#else
> + #include <poll.h>
> +-#endif
> +
> +-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
> ++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
> +
> + #ifdef __cplusplus
> + }
> diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
> b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
> similarity index 92%
> rename from meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
> rename to meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
> index 17261921f..a9bcb760c 100644
> --- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
> +++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
> @@ -1,7 +1,7 @@
>  require lirc.inc
>
>  SRC_URI += " \
> -    file://0001-lircrcd-Mark-local-inline-funtions-as-static.patch \
> +    file://pollfd.patch \
>      file://lircd.service \
>      file://lircd.init \
>      file://lircexec.init \
> @@ -11,8 +11,8 @@ SRC_URI += " \
>  "
>  #file://0001-Adaptation-for-STM-configuration.patch \
>  #
> -SRC_URI[md5sum] = "3afc84e79c0839823cc20e7a710dd06d"
> -SRC_URI[sha256sum] = "4e3f948fcdee6dce009171143f0cb7
> cd7be48593dd58138db4101a41f651a1dd"
> +SRC_URI[md5sum] = "0d11679cbdd94a5a6da00a8e7231b4bf"
> +SRC_URI[sha256sum] = "c68f18c35b489b865c0a741d119b13
> 6e8702191538cd3551b977a7af6c4e41ab"
>
>  SYSTEMD_PACKAGES = "lirc"
>  SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service"
> @@ -27,6 +27,7 @@ PACKAGECONFIG ?= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '',
> d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)} \
>  "
> +CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
>
>  #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
>  do_install_append() {
> --
> 2.12.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

