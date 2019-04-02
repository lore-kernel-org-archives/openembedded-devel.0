Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE23A7D20A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 00:29:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w1so14319141wrp.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 17:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wUps/7m3JV2VRoziBfL1skcD6Ujk6I05HsBBzknCJms=;
	b=oDiKfwlBq8GPycJqEab1CvRDnzq3PPNHsc6y35dz4xhvnsao6QVVwFDQ3IoYjTivjN
	1Wo4XDziQmTwqDHNlVkxdoY16W3Z9Z8oaLNOO0Vf42USyX0gFwi6U/bR7vUtBYV/mjBP
	647QAg6wnNRGoewZaGmzogEmLkhE9SV47aMmxgedj4sft/7Jt7AUCGkbyls6kJjq5Nqe
	o4dPtRvlFYgR9gNtbe1RE6ocXWL/Ibl6LMHoyUi9GbrMhmx9KUOPrYjn41vF21HcCGPK
	pEYIKbmEtYPvLEyS8NrejOLexg8dn6KMwfSQaO9JotxqIdVUtzdpLD8eaGOD8PKgNjW4
	MLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wUps/7m3JV2VRoziBfL1skcD6Ujk6I05HsBBzknCJms=;
	b=eEu1NMVSPizZmBsZkdcXrRbJInNmfGWl9VL5rKsmEv5Vbpmdwzac27241vrKLl7PgO
	vnQC4SDpD0K5SY0HjY00lWbiBRCpIt+Im1/MJ0ukuYNlA2hoxjZKE3DpySPgDjlYBrlB
	qyy1CtTG1Y5ngm4GSZ9vdGNaz/D5ufvbVVbxYSTi0kGJRSziQ+98dX6UJcZJ/kcPKJcH
	CL1RmuJ7EauZt7NvfBlpioezYW2oiGXFmNvVk0onVybhoNAwLnzrfgWLOCnV7zPkD59o
	JlrsqZYZU4oexhj8/fOEx5/cLJL38Qlnq7MDBhueVfHNE10nZ4GEMUlZLb/8ocVce/uf
	J9kQ==
X-Gm-Message-State: APjAAAUam0jduxlLk22ouTd5XBYDDhyrnlLsogcvN1e5O0uEc+dneu0g
	3faXINAGPNzeIQHLAurvvMHg2zVh
X-Google-Smtp-Source: APXvYqwsGeEoALoA1cjs1GqPbL3/pQsqOmj4LMzhgTbfCP3NihHovZBLeNQiwzJyb8ms7s6qUQ/u/Q==
X-Received: by 2002:a5d:424b:: with SMTP id s11mr9967313wrr.158.1554164991449; 
	Mon, 01 Apr 2019 17:29:51 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2CB726864FD5BA05684929.dip0.t-ipconnect.de.
	[2003:f0:7f2c:b726:864f:d5ba:568:4929])
	by smtp.gmail.com with ESMTPSA id
	d6sm18305452wrx.62.2019.04.01.17.29.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 17:29:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2019 02:29:37 +0200
Message-Id: <20190402002937.10839-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190402002937.10839-1-schnitzeltony@gmail.com>
References: <20190402002937.10839-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] networkmanager: fix build with musl
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
X-List-Received-Date: Tue, 02 Apr 2019 00:29:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Cleanup patches
* Apply musl-hacks only for musl

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

And yes I am aware that it is now nm-applet failing on musl :(

 ...-net-ethernet.h-and-linux-if_ether.h.patch |  54 ---
 .../musl/0001-Fix-build-with-musl.patch       | 364 ++++++++++++++++++
 ...-net-ethernet.h-seems-to-be-over-spe.patch |  37 --
 .../networkmanager/musl/0003-musl-basic.patch |  56 ---
 .../musl/0004-musl-dlopen-configure-ac.patch  |  33 --
 .../musl/0005-musl-network-support.patch      |  71 ----
 .../musl/0006-musl-process-util.patch         |  60 ---
 ...er-conflicts-by-including-net-ethern.patch |  75 ----
 ...-Add-a-strndupa-replacement-for-musl.patch |  45 ---
 .../networkmanager/networkmanager_1.16.0.bb   |  10 +-
 10 files changed, 366 insertions(+), 439 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-basic.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-dlopen-configure-ac.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-network-support.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-musl-process-util.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0008-Add-a-strndupa-replacement-for-musl.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
deleted file mode 100644
index 555e5ffcb..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From b2cdab746ef64bc25ba0b9cff596ebdddd6e8dc6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Nov 2018 11:30:44 -0800
-Subject: [PATCH] Do not include net/ethernet.h and linux/if_ether.h
-
-They conflict when used together especially with musl
-removing them still keeps it working so it seems they are redundant
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- shared/n-acd/src/n-acd.c              | 1 -
- src/platform/wpan/nm-wpan-utils.h     | 2 --
- src/settings/nm-settings-connection.h | 2 --
- 3 files changed, 5 deletions(-)
-
-diff --git a/shared/n-acd/src/n-acd.c b/shared/n-acd/src/n-acd.c
-index def56a2..dd4eb78 100644
---- a/shared/n-acd/src/n-acd.c
-+++ b/shared/n-acd/src/n-acd.c
-@@ -11,7 +11,6 @@
- #include <inttypes.h>
- #include <limits.h>
- #include <linux/if_packet.h>
--#include <netinet/if_ether.h>
- #include <netinet/in.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/platform/wpan/nm-wpan-utils.h b/src/platform/wpan/nm-wpan-utils.h
-index 1b54ec4..ed39938 100644
---- a/src/platform/wpan/nm-wpan-utils.h
-+++ b/src/platform/wpan/nm-wpan-utils.h
-@@ -20,8 +20,6 @@
- #ifndef __WPAN_UTILS_H__
- #define __WPAN_UTILS_H__
- 
--#include <net/ethernet.h>
--
- #include "nm-dbus-interface.h"
- #include "platform/nm-netlink.h"
- 
-diff --git a/src/settings/nm-settings-connection.h b/src/settings/nm-settings-connection.h
-index e796b71..c01fef6 100644
---- a/src/settings/nm-settings-connection.h
-+++ b/src/settings/nm-settings-connection.h
-@@ -22,8 +22,6 @@
- #ifndef __NETWORKMANAGER_SETTINGS_CONNECTION_H__
- #define __NETWORKMANAGER_SETTINGS_CONNECTION_H__
- 
--#include <net/ethernet.h>
--
- #include "nm-dbus-object.h"
- #include "nm-connection.h"
- 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
new file mode 100644
index 000000000..21e9a16d6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
@@ -0,0 +1,364 @@
+From f43c9a5b07832a91383e59d655bc3c8a9f48c451 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 2 Apr 2019 01:34:35 +0200
+Subject: [PATCH] Fix build with musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ clients/cli/connections.c                    |  1 -
+ configure.ac                                 |  1 +
+ libnm-core/nm-utils.c                        |  2 +-
+ shared/n-acd/src/n-acd.c                     |  1 -
+ shared/systemd/src/basic/in-addr-util.c      |  1 +
+ shared/systemd/src/basic/process-util.c      |  9 ++++++
+ shared/systemd/src/basic/socket-util.h       |  6 ++++
+ shared/systemd/src/basic/stdio-util.h        |  2 ++
+ shared/systemd/src/basic/string-util.h       |  5 ++++
+ shared/systemd/src/basic/util.h              | 29 ++++----------------
+ src/platform/wifi/nm-wifi-utils.h            |  4 +++
+ src/platform/wpan/nm-wpan-utils.h            |  2 --
+ src/settings/nm-settings-connection.h        |  2 --
+ src/systemd/src/libsystemd-network/sd-lldp.c |  1 +
+ src/systemd/src/systemd/sd-dhcp-client.h     |  2 ++
+ src/systemd/src/systemd/sd-dhcp-lease.h      |  2 ++
+ src/systemd/src/systemd/sd-dhcp6-client.h    |  2 ++
+ src/systemd/src/systemd/sd-ipv4ll.h          |  2 ++
+ src/systemd/src/systemd/sd-lldp.h            |  2 +-
+ 19 files changed, 44 insertions(+), 32 deletions(-)
+
+diff --git a/clients/cli/connections.c b/clients/cli/connections.c
+index 6db44f8..36e51cc 100644
+--- a/clients/cli/connections.c
++++ b/clients/cli/connections.c
+@@ -25,7 +25,6 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <signal.h>
+-#include <netinet/ether.h>
+ #include <readline/readline.h>
+ #include <readline/history.h>
+ #include <fcntl.h>
+diff --git a/configure.ac b/configure.ac
+index 872c292..b1d7a68 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -241,6 +241,7 @@ dnl
+ dnl Checks for libdl - on certain platforms its part of libc
+ dnl
+ AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
++AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
+ AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
+ 
+ PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
+diff --git a/libnm-core/nm-utils.c b/libnm-core/nm-utils.c
+index d276cfe..2aec785 100644
+--- a/libnm-core/nm-utils.c
++++ b/libnm-core/nm-utils.c
+@@ -21,10 +21,10 @@
+ 
+ #include "nm-default.h"
+ 
++#include <netinet/ether.h>
+ #include "nm-utils.h"
+ 
+ #include <stdlib.h>
+-#include <netinet/ether.h>
+ #include <arpa/inet.h>
+ #include <uuid/uuid.h>
+ #include <libintl.h>
+diff --git a/shared/n-acd/src/n-acd.c b/shared/n-acd/src/n-acd.c
+index def56a2..dd4eb78 100644
+--- a/shared/n-acd/src/n-acd.c
++++ b/shared/n-acd/src/n-acd.c
+@@ -11,7 +11,6 @@
+ #include <inttypes.h>
+ #include <limits.h>
+ #include <linux/if_packet.h>
+-#include <netinet/if_ether.h>
+ #include <netinet/in.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
+index 5ced350..c6b52b8 100644
+--- a/shared/systemd/src/basic/in-addr-util.c
++++ b/shared/systemd/src/basic/in-addr-util.c
+@@ -13,6 +13,7 @@
+ #include "in-addr-util.h"
+ #include "macro.h"
+ #include "parse-util.h"
++#include "string-util.h"
+ #include "util.h"
+ 
+ bool in4_addr_is_null(const struct in_addr *a) {
+diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/process-util.c
+index b0afb5c..7adc8bd 100644
+--- a/shared/systemd/src/basic/process-util.c
++++ b/shared/systemd/src/basic/process-util.c
+@@ -21,6 +21,9 @@
+ #include <sys/wait.h>
+ #include <syslog.h>
+ #include <unistd.h>
++#ifndef __GLIBC__
++#include <pthread.h>
++#endif
+ #if 0 /* NM_IGNORED */
+ #if HAVE_VALGRIND_VALGRIND_H
+ #include <valgrind/valgrind.h>
+@@ -1168,11 +1171,13 @@ void reset_cached_pid(void) {
+         cached_pid = CACHED_PID_UNSET;
+ }
+ 
++#ifdef __GLIBC__
+ /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
+  * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
+  * libpthread, as it is part of glibc anyway. */
+ extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void *dso_handle);
+ extern void* __dso_handle _weak_;
++#endif
+ 
+ pid_t getpid_cached(void) {
+         static bool installed = false;
+@@ -1201,7 +1206,11 @@ pid_t getpid_cached(void) {
+                          * only half-documented (glibc doesn't document it but LSB does — though only superficially)
+                          * we'll check for errors only in the most generic fashion possible. */
+ 
++#ifdef __GLIBC__
+                         if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_handle) != 0) {
++#else
++                        if (pthread_atfork(NULL, NULL, reset_cached_pid) != 0) {
++#endif
+                                 /* OOM? Let's try again later */
+                                 cached_pid = CACHED_PID_UNSET;
+                                 return new_pid;
+diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/socket-util.h
+index d2246a8..76f257f 100644
+--- a/shared/systemd/src/basic/socket-util.h
++++ b/shared/systemd/src/basic/socket-util.h
+@@ -13,6 +13,12 @@
+ #include <sys/types.h>
+ #include <sys/un.h>
+ 
++#if !defined(__GLIBC__)
++/* SIOCGSTAMPNS from linux/asm-generic.h
++ * for src/systemd/src/libsystemd-network/sd-lldp.c */
++#include <linux/sockios.h>
++#endif
++
+ #include "macro.h"
+ #include "missing_socket.h"
+ #include "sparse-endian.h"
+diff --git a/shared/systemd/src/basic/stdio-util.h b/shared/systemd/src/basic/stdio-util.h
+index dc67b6e..6336243 100644
+--- a/shared/systemd/src/basic/stdio-util.h
++++ b/shared/systemd/src/basic/stdio-util.h
+@@ -1,7 +1,9 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ #pragma once
+ 
++#if defined(__GLIBC__)
+ #include <printf.h>
++#endif
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <sys/types.h>
+diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
+index 38070ab..6b918e0 100644
+--- a/shared/systemd/src/basic/string-util.h
++++ b/shared/systemd/src/basic/string-util.h
+@@ -27,6 +27,11 @@
+ #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
+ #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
+ 
++/* musl does not know strndupa */
++#if !defined(__GLIBC__)
++#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
++#endif
++
+ int strcmp_ptr(const char *a, const char *b) _pure_;
+ 
+ static inline bool streq_ptr(const char *a, const char *b) {
+diff --git a/shared/systemd/src/basic/util.h b/shared/systemd/src/basic/util.h
+index dc33d66..cc768e9 100644
+--- a/shared/systemd/src/basic/util.h
++++ b/shared/systemd/src/basic/util.h
+@@ -27,6 +27,11 @@
+ #include "macro.h"
+ #include "time-util.h"
+ 
++#if !defined(__GLIBC__)
++typedef int (*__compar_fn_t) (const void*, const void*);
++typedef __compar_fn_t comparison_fn_t;
++#endif
++
+ size_t page_size(void) _pure_;
+ #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
+ 
+@@ -66,16 +71,6 @@ int prot_from_flags(int flags) _const_;
+ bool in_initrd(void);
+ void in_initrd_force(bool value);
+ 
+-void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
+-                 __compar_d_fn_t compar, void *arg);
+-
+-#define typesafe_bsearch_r(k, b, n, func, userdata)                     \
+-        ({                                                              \
+-                const typeof(b[0]) *_k = k;                             \
+-                int (*_func_)(const typeof(b[0])*, const typeof(b[0])*, typeof(userdata)) = func; \
+-                xbsearch_r((const void*) _k, (b), (n), sizeof((b)[0]), (__compar_d_fn_t) _func_, userdata); \
+-        })
+-
+ /**
+  * Normal bsearch requires base to be nonnull. Here were require
+  * that only if nmemb > 0.
+@@ -116,20 +111,6 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
+         })
+ 
+-static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
+-        if (nmemb <= 1)
+-                return;
+-
+-        assert(base);
+-        qsort_r(base, nmemb, size, compar, userdata);
+-}
+-
+-#define typesafe_qsort_r(p, n, func, userdata)                          \
+-        ({                                                              \
+-                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
+-                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
+-        })
+-
+ /* Normal memcpy requires src to be nonnull. We do nothing if n is 0. */
+ static inline void memcpy_safe(void *dst, const void *src, size_t n) {
+         if (n == 0)
+diff --git a/src/platform/wifi/nm-wifi-utils.h b/src/platform/wifi/nm-wifi-utils.h
+index 36148b5..d282eb2 100644
+--- a/src/platform/wifi/nm-wifi-utils.h
++++ b/src/platform/wifi/nm-wifi-utils.h
+@@ -22,7 +22,11 @@
+ #ifndef __WIFI_UTILS_H__
+ #define __WIFI_UTILS_H__
+ 
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#else /* musl libc */
++#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
++#endif
+ 
+ #include "nm-dbus-interface.h"
+ #include "nm-setting-wireless.h"
+diff --git a/src/platform/wpan/nm-wpan-utils.h b/src/platform/wpan/nm-wpan-utils.h
+index 1b54ec4..ed39938 100644
+--- a/src/platform/wpan/nm-wpan-utils.h
++++ b/src/platform/wpan/nm-wpan-utils.h
+@@ -20,8 +20,6 @@
+ #ifndef __WPAN_UTILS_H__
+ #define __WPAN_UTILS_H__
+ 
+-#include <net/ethernet.h>
+-
+ #include "nm-dbus-interface.h"
+ #include "platform/nm-netlink.h"
+ 
+diff --git a/src/settings/nm-settings-connection.h b/src/settings/nm-settings-connection.h
+index e796b71..c01fef6 100644
+--- a/src/settings/nm-settings-connection.h
++++ b/src/settings/nm-settings-connection.h
+@@ -22,8 +22,6 @@
+ #ifndef __NETWORKMANAGER_SETTINGS_CONNECTION_H__
+ #define __NETWORKMANAGER_SETTINGS_CONNECTION_H__
+ 
+-#include <net/ethernet.h>
+-
+ #include "nm-dbus-object.h"
+ #include "nm-connection.h"
+ 
+diff --git a/src/systemd/src/libsystemd-network/sd-lldp.c b/src/systemd/src/libsystemd-network/sd-lldp.c
+index 741128e..62914ae 100644
+--- a/src/systemd/src/libsystemd-network/sd-lldp.c
++++ b/src/systemd/src/libsystemd-network/sd-lldp.c
+@@ -3,6 +3,7 @@
+ #include "nm-sd-adapt-core.h"
+ 
+ #include <arpa/inet.h>
++#include <net/ethernet.h>
+ #include <linux/sockios.h>
+ #include <sys/ioctl.h>
+ 
+diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/systemd/sd-dhcp-client.h
+index bd0d429..c935fe1 100644
+--- a/src/systemd/src/systemd/sd-dhcp-client.h
++++ b/src/systemd/src/systemd/sd-dhcp-client.h
+@@ -20,7 +20,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ #include <sys/types.h>
+ #include <stdbool.h>
+diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/systemd/sd-dhcp-lease.h
+index d299c79..991e67e 100644
+--- a/src/systemd/src/systemd/sd-dhcp-lease.h
++++ b/src/systemd/src/systemd/sd-dhcp-lease.h
+@@ -19,7 +19,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ #include <sys/types.h>
+ 
+diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/systemd/sd-dhcp6-client.h
+index 43d38f5..57ab487 100644
+--- a/src/systemd/src/systemd/sd-dhcp6-client.h
++++ b/src/systemd/src/systemd/sd-dhcp6-client.h
+@@ -20,7 +20,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <sys/types.h>
+ 
+ #include "sd-dhcp6-lease.h"
+diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/sd-ipv4ll.h
+index 71bd4cf..1c667ba 100644
+--- a/src/systemd/src/systemd/sd-ipv4ll.h
++++ b/src/systemd/src/systemd/sd-ipv4ll.h
+@@ -19,7 +19,9 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ 
+ #include "sd-event.h"
+diff --git a/src/systemd/src/systemd/sd-lldp.h b/src/systemd/src/systemd/sd-lldp.h
+index bf3afad..4cace87 100644
+--- a/src/systemd/src/systemd/sd-lldp.h
++++ b/src/systemd/src/systemd/sd-lldp.h
+@@ -18,7 +18,7 @@
+ ***/
+ 
+ #include <inttypes.h>
+-#include <net/ethernet.h>
++//#include <net/ethernet.h>
+ #include <sys/types.h>
+ 
+ #include "sd-event.h"
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
deleted file mode 100644
index 5c59208b4..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 32dc6cab58912add5bc6495558538953d9344c36 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 31 Mar 2017 16:48:00 -0700
-Subject: [PATCH] sd-lldp.h: Remove net/ethernet.h seems to be over specified
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/systemd/src/libsystemd-network/sd-lldp.c | 1 +
- src/systemd/src/systemd/sd-lldp.h            | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/systemd/src/libsystemd-network/sd-lldp.c b/src/systemd/src/libsystemd-network/sd-lldp.c
-index 741128e..62914ae 100644
---- a/src/systemd/src/libsystemd-network/sd-lldp.c
-+++ b/src/systemd/src/libsystemd-network/sd-lldp.c
-@@ -3,6 +3,7 @@
- #include "nm-sd-adapt-core.h"
- 
- #include <arpa/inet.h>
-+#include <net/ethernet.h>
- #include <linux/sockios.h>
- #include <sys/ioctl.h>
- 
-diff --git a/src/systemd/src/systemd/sd-lldp.h b/src/systemd/src/systemd/sd-lldp.h
-index bf3afad..4cace87 100644
---- a/src/systemd/src/systemd/sd-lldp.h
-+++ b/src/systemd/src/systemd/sd-lldp.h
-@@ -18,7 +18,7 @@
- ***/
- 
- #include <inttypes.h>
--#include <net/ethernet.h>
-+//#include <net/ethernet.h>
- #include <sys/types.h>
- 
- #include "sd-event.h"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-basic.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-basic.patch
deleted file mode 100644
index 8d905489f..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-basic.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ff1a5b849755db67b1778940fff92d6eb8b8b050 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 17:54:10 +0100
-Subject: [PATCH] Usual fix for musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Stolen from [1] and prettyfied slightly
-
-[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
----
- shared/systemd/src/basic/stdio-util.h | 2 ++
- shared/systemd/src/basic/util.h       | 5 +++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/shared/systemd/src/basic/stdio-util.h b/shared/systemd/src/basic/stdio-util.h
-index dc67b6e..6336243 100644
---- a/shared/systemd/src/basic/stdio-util.h
-+++ b/shared/systemd/src/basic/stdio-util.h
-@@ -1,7 +1,9 @@
- /* SPDX-License-Identifier: LGPL-2.1+ */
- #pragma once
- 
-+#if defined(__GLIBC__)
- #include <printf.h>
-+#endif
- #include <stdarg.h>
- #include <stdio.h>
- #include <sys/types.h>
-diff --git a/shared/systemd/src/basic/util.h b/shared/systemd/src/basic/util.h
-index dc33d66..8ee2d64 100644
---- a/shared/systemd/src/basic/util.h
-+++ b/shared/systemd/src/basic/util.h
-@@ -27,6 +27,11 @@
- #include "macro.h"
- #include "time-util.h"
- 
-+#if !defined(__GLIBC__)
-+typedef int (*__compar_fn_t) (const void*, const void*);
-+typedef __compar_fn_t comparison_fn_t;
-+#endif
-+
- size_t page_size(void) _pure_;
- #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
- 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-dlopen-configure-ac.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-dlopen-configure-ac.patch
deleted file mode 100644
index 419e1be24..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-dlopen-configure-ac.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7743ea63fbe572b1f82db7d399fe9c5c99521432 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 18:18:06 +0100
-Subject: [PATCH] musl: dlopen is included so LD_LIBS="" instead of
- LD_LIBS="none required"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Stolen from [1] and prettyfied slightly
-
-[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index b914219..1b2b0ff 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -241,6 +241,7 @@ dnl
- dnl Checks for libdl - on certain platforms its part of libc
- dnl
- AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
-+AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
- AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
- 
- PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-network-support.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-network-support.patch
deleted file mode 100644
index 45f607f2c..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-network-support.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 70ecbc01874bf2f8603ccbdfda634cac0bb83d93 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 18:24:07 +0100
-Subject: [PATCH] musl: network support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Stolen from [1] and prettyfied slightly
-
-[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
----
- libnm-core/nm-utils.h                  | 4 ++++
- shared/systemd/src/basic/socket-util.h | 6 ++++++
- src/platform/wifi/nm-wifi-utils.h      | 4 ++++
- 3 files changed, 14 insertions(+)
-
-diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index 2b5baba..976850c 100644
---- a/libnm-core/nm-utils.h
-+++ b/libnm-core/nm-utils.h
-@@ -30,7 +30,11 @@
- #include <netinet/in.h>
- 
- /* For ETH_ALEN and INFINIBAND_ALEN */
-+#if defined(__GLIBC__)
- #include <linux/if_ether.h>
-+#else
-+#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
-+#endif
- #include <linux/if_infiniband.h>
- 
- #include "nm-core-enum-types.h"
-diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/socket-util.h
-index d2246a8..76f257f 100644
---- a/shared/systemd/src/basic/socket-util.h
-+++ b/shared/systemd/src/basic/socket-util.h
-@@ -13,6 +13,12 @@
- #include <sys/types.h>
- #include <sys/un.h>
- 
-+#if !defined(__GLIBC__)
-+/* SIOCGSTAMPNS from linux/asm-generic.h
-+ * for src/systemd/src/libsystemd-network/sd-lldp.c */
-+#include <linux/sockios.h>
-+#endif
-+
- #include "macro.h"
- #include "missing_socket.h"
- #include "sparse-endian.h"
-diff --git a/src/platform/wifi/nm-wifi-utils.h b/src/platform/wifi/nm-wifi-utils.h
-index 36148b5..d282eb2 100644
---- a/src/platform/wifi/nm-wifi-utils.h
-+++ b/src/platform/wifi/nm-wifi-utils.h
-@@ -22,7 +22,11 @@
- #ifndef __WIFI_UTILS_H__
- #define __WIFI_UTILS_H__
- 
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#else /* musl libc */
-+#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
-+#endif
- 
- #include "nm-dbus-interface.h"
- #include "nm-setting-wireless.h"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-musl-process-util.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-musl-process-util.patch
deleted file mode 100644
index 525e35932..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-musl-process-util.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 4f2fb1e1f785bad22df8f3d96cb4792acf21f315 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 25 Oct 2018 09:57:07 +0200
-Subject: [PATCH] musl: process-util
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Stolen from [1] and prettyfied slightly
-
-[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
----
- shared/systemd/src/basic/process-util.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/process-util.c
-index b0afb5c..7adc8bd 100644
---- a/shared/systemd/src/basic/process-util.c
-+++ b/shared/systemd/src/basic/process-util.c
-@@ -21,6 +21,9 @@
- #include <sys/wait.h>
- #include <syslog.h>
- #include <unistd.h>
-+#ifndef __GLIBC__
-+#include <pthread.h>
-+#endif
- #if 0 /* NM_IGNORED */
- #if HAVE_VALGRIND_VALGRIND_H
- #include <valgrind/valgrind.h>
-@@ -1168,11 +1171,13 @@ void reset_cached_pid(void) {
-         cached_pid = CACHED_PID_UNSET;
- }
- 
-+#ifdef __GLIBC__
- /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
-  * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
-  * libpthread, as it is part of glibc anyway. */
- extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void *dso_handle);
- extern void* __dso_handle _weak_;
-+#endif
- 
- pid_t getpid_cached(void) {
-         static bool installed = false;
-@@ -1201,7 +1206,11 @@ pid_t getpid_cached(void) {
-                          * only half-documented (glibc doesn't document it but LSB does — though only superficially)
-                          * we'll check for errors only in the most generic fashion possible. */
- 
-+#ifdef __GLIBC__
-                         if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_handle) != 0) {
-+#else
-+                        if (pthread_atfork(NULL, NULL, reset_cached_pid) != 0) {
-+#endif
-                                 /* OOM? Let's try again later */
-                                 cached_pid = CACHED_PID_UNSET;
-                                 return new_pid;
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch
deleted file mode 100644
index 211a2da94..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 4232a34064e33b52f07cca51b902b93699800f72 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 16 Apr 2018 14:45:44 +0200
-Subject: [PATCH] musl: avoid further conflicts by including net/ethernet.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
----
- src/systemd/src/systemd/sd-dhcp-client.h  | 2 ++
- src/systemd/src/systemd/sd-dhcp-lease.h   | 2 ++
- src/systemd/src/systemd/sd-dhcp6-client.h | 2 ++
- src/systemd/src/systemd/sd-ipv4ll.h       | 2 ++
- 4 files changed, 8 insertions(+)
-
-diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/systemd/sd-dhcp-client.h
-index bd0d429..c935fe1 100644
---- a/src/systemd/src/systemd/sd-dhcp-client.h
-+++ b/src/systemd/src/systemd/sd-dhcp-client.h
-@@ -20,7 +20,9 @@
- ***/
- 
- #include <inttypes.h>
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <netinet/in.h>
- #include <sys/types.h>
- #include <stdbool.h>
-diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/systemd/sd-dhcp-lease.h
-index d299c79..991e67e 100644
---- a/src/systemd/src/systemd/sd-dhcp-lease.h
-+++ b/src/systemd/src/systemd/sd-dhcp-lease.h
-@@ -19,7 +19,9 @@
- ***/
- 
- #include <inttypes.h>
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <netinet/in.h>
- #include <sys/types.h>
- 
-diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/systemd/sd-dhcp6-client.h
-index 43d38f5..57ab487 100644
---- a/src/systemd/src/systemd/sd-dhcp6-client.h
-+++ b/src/systemd/src/systemd/sd-dhcp6-client.h
-@@ -20,7 +20,9 @@
- ***/
- 
- #include <inttypes.h>
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <sys/types.h>
- 
- #include "sd-dhcp6-lease.h"
-diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/sd-ipv4ll.h
-index 71bd4cf..1c667ba 100644
---- a/src/systemd/src/systemd/sd-ipv4ll.h
-+++ b/src/systemd/src/systemd/sd-ipv4ll.h
-@@ -19,7 +19,9 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <netinet/in.h>
- 
- #include "sd-event.h"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0008-Add-a-strndupa-replacement-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0008-Add-a-strndupa-replacement-for-musl.patch
deleted file mode 100644
index 885810185..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0008-Add-a-strndupa-replacement-for-musl.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From cdd69321ec97ed19e66a747a968a1637a251b9e6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 16 Apr 2018 15:07:20 +0200
-Subject: [PATCH] Add a strndupa replacement for musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
----
- shared/systemd/src/basic/in-addr-util.c | 1 +
- shared/systemd/src/basic/string-util.h  | 5 +++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
-index 5ced350..c6b52b8 100644
---- a/shared/systemd/src/basic/in-addr-util.c
-+++ b/shared/systemd/src/basic/in-addr-util.c
-@@ -13,6 +13,7 @@
- #include "in-addr-util.h"
- #include "macro.h"
- #include "parse-util.h"
-+#include "string-util.h"
- #include "util.h"
- 
- bool in4_addr_is_null(const struct in_addr *a) {
-diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
-index 38070ab..6b918e0 100644
---- a/shared/systemd/src/basic/string-util.h
-+++ b/shared/systemd/src/basic/string-util.h
-@@ -27,6 +27,11 @@
- #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
- #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
- 
-+/* musl does not know strndupa */
-+#if !defined(__GLIBC__)
-+#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
-+#endif
-+
- int strcmp_ptr(const char *a, const char *b) _pure_;
- 
- static inline bool streq_ptr(const char *a, const char *b) {
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
index 4a432be77..90792ff4e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
@@ -26,15 +26,9 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
-    file://musl/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch \
-    file://musl/0002-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
-    file://musl/0003-musl-basic.patch \
-    file://musl/0004-musl-dlopen-configure-ac.patch \
-    file://musl/0005-musl-network-support.patch \
-    file://musl/0006-musl-process-util.patch \
-    file://musl/0007-musl-avoid-further-conflicts-by-including-net-ethern.patch \
-    file://musl/0008-Add-a-strndupa-replacement-for-musl.patch \
 "
+SRC_URI_append_libc-musl = " file://musl/0001-Fix-build-with-musl.patch"
+
 SRC_URI[md5sum] = "10abacaafb162a67d2942adf03e7e9e4"
 SRC_URI[sha256sum] = "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef098d05f2324c5d2c"
 
-- 
2.20.1


