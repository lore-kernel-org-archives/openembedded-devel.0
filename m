Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D68C52D6F
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 00:11:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.23578.1724544715685023428
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 17:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhmvLWTM;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2020ac89cabso28401625ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 17:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724544715; x=1725149515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0mDiuYpKmRdpWienwwafzeJuqUMoZjyGQRLCCm93kUE=;
        b=bhmvLWTMOOhg3qP4NlEJcIzs/2o3I7vHj5TcSG+Y1ecIota+1JcvEJZePEAWlsDqYC
         wwze46x4WKWLpcfCdi939FQpkMuxPG1exm3NuCOkLMM5lMiUe6o8M78uP2FgTaCnJPzc
         R6kjw4vmQBcwrJUJeXEFJxDQTJVTJNvvbzpO5nbaFHniP0p9eYWy6oIhVaqc9kVSVntQ
         Fb5xgHTuXkGC+f4EGoWqneuqBOneowmwHrEJP1DALjdFw59gwaQi9jQI64zRgDUNmZ7V
         f0TDZkz/jwXU8jDR/J0lsB7h1ef9vYma5Xt/lYnHikL44bAHCHJKD2Gin3w9rVqf6FS3
         6gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724544715; x=1725149515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mDiuYpKmRdpWienwwafzeJuqUMoZjyGQRLCCm93kUE=;
        b=XQKLHMrY/Hyqm8OJm1T9DMYC2/SrAteEvSmE7B7dd7EPhyk5l1ISw8tUrnXAO+ggiF
         p6Rqr7W35dsLeHEfX0PzUwOodRj/tA08kJXvB0klu4IMkKGcXl9YWfJB2Cw9jJ9IFJqF
         CWT8rhGfQZfyiHQnEQ3IEVFpdHT8ulH+x+i7A9OuY3Cchmivr19sniGv5dnvkkhZA8hS
         mVIGXitzMO6+fRsxd80zvqdh54iM59r2d9C/F+hnEl5DTVFczJgjC5cKAilaAn3J/jWD
         KstXHKeDqpLZ/bCMZNCN1AiDLKBmyyLr0hff4KsQUuXIZC+hkJesC1KslgszXxN8d2L3
         FLbg==
X-Gm-Message-State: AOJu0YyZxX12ikKVrNLOlsjARalDbTN+Z/QSDyeKTrLnj9myWivH4lJS
	K76ZoHzqXALgdiTcdY0PG6Bkv/hB6oQ9rk0rMGY6/3DhJTQ5N8wd6mVrdA==
X-Google-Smtp-Source: AGHT+IEqY3ziyQRa0jSt9ZkdfqiWdnmVU6Ha8RWAa8J7NMG7/M9KkxY25gq1BsowBIkhaEqYOAbQCA==
X-Received: by 2002:a17:903:2305:b0:1fb:3e8c:95a6 with SMTP id d9443c01a7336-2039e4e855amr87131155ad.40.1724544714645;
        Sat, 24 Aug 2024 17:11:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385bdca50sm46861675ad.245.2024.08.24.17.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 17:11:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] bluealsa: Fix build on musl
Date: Sat, 24 Aug 2024 17:11:52 -0700
Message-ID: <20240825001152.2758217-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 00:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111926

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...asename-implementation-from-glib-2.0.patch | 174 ++++++++++++++++++
 .../bluealsa/bluealsa_4.3.0.bb                |   3 +-
 2 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch
new file mode 100644
index 0000000000..546f82884b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch
@@ -0,0 +1,174 @@
+From ebf62deb8422f5ac8e057c24ab10f6dcd50f28dd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 24 Aug 2024 17:02:05 -0700
+Subject: [PATCH] Use basename implementation from glib-2.0
+
+This is portable across various platforms and system C libraries e.g.
+basename differs between glibc and musl, where glibc provides a GNU
+implementation and POSIX version, and musl provides posix version only
+and Newer version of musl have removed prototype for basename in string.h [1]
+which caused build failures with gcc-14 on musl systems.
+
+g_path_get_basename() is implemented in glib-2.0 and is portable across
+these systems. It allocates a new string for the returned value which
+should be free'd by user, however, all our usecases here are in main()
+functions, so technically we are not going to leak any memory.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/arkq/bluez-alsa/pull/726]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/main.c               | 3 +--
+ test/mock/mock.c         | 2 +-
+ utils/aplay/Makefile.am  | 2 ++
+ utils/aplay/aplay.c      | 3 ++-
+ utils/cli/Makefile.am    | 2 ++
+ utils/cli/cli.c          | 3 ++-
+ utils/rfcomm/Makefile.am | 2 ++
+ utils/rfcomm/rfcomm.c    | 3 ++-
+ 8 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index 96a66ae..be94845 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -276,8 +276,7 @@ int main(int argc, char **argv) {
+ 			syslog = true;
+ 			break;
+ 		}
+-
+-	log_open(basename(argv[0]), syslog);
++	log_open(g_path_get_basename(argv[0]), syslog);
+ 
+ 	if (ba_config_init() != 0) {
+ 		error("Couldn't initialize bluealsa config");
+diff --git a/test/mock/mock.c b/test/mock/mock.c
+index 947211a..177d3e8 100644
+--- a/test/mock/mock.c
++++ b/test/mock/mock.c
+@@ -256,7 +256,7 @@ int main(int argc, char *argv[]) {
+ 			return EXIT_FAILURE;
+ 		}
+ 
+-	log_open(basename(argv[0]), false);
++	log_open(g_path_get_basename(argv[0]), false);
+ 	assert(ba_config_init() == 0);
+ 
+ 	/* Add BT address to the HCI filter to test filtering logic. */
+diff --git a/utils/aplay/Makefile.am b/utils/aplay/Makefile.am
+index 570a4c7..3df0d96 100644
+--- a/utils/aplay/Makefile.am
++++ b/utils/aplay/Makefile.am
+@@ -22,12 +22,14 @@ bluealsa_aplay_CFLAGS = \
+ 	@ALSA_CFLAGS@ \
+ 	@BLUEZ_CFLAGS@ \
+ 	@DBUS1_CFLAGS@ \
++	@GLIB2_CFLAGS@ \
+ 	@LIBUNWIND_CFLAGS@
+ 
+ bluealsa_aplay_LDADD = \
+ 	@ALSA_LIBS@ \
+ 	@BLUEZ_LIBS@ \
+ 	@DBUS1_LIBS@ \
++	@GLIB2_LIBS@ \
+ 	@LIBUNWIND_LIBS@
+ 
+ endif
+diff --git a/utils/aplay/aplay.c b/utils/aplay/aplay.c
+index 3de7790..cb48520 100644
+--- a/utils/aplay/aplay.c
++++ b/utils/aplay/aplay.c
+@@ -32,6 +32,7 @@
+ #include <alsa/asoundlib.h>
+ #include <bluetooth/bluetooth.h>
+ #include <dbus/dbus.h>
++#include <glib.h>
+ 
+ #include "shared/dbus-client.h"
+ #include "shared/dbus-client-pcm.h"
+@@ -1105,7 +1106,7 @@ int main(int argc, char *argv[]) {
+ 			break;
+ 		}
+ 
+-	log_open(basename(argv[0]), syslog);
++	log_open(g_path_get_basename(argv[0]), syslog);
+ 	dbus_threads_init_default();
+ 
+ 	/* parse options */
+diff --git a/utils/cli/Makefile.am b/utils/cli/Makefile.am
+index 9d99a35..8c5783e 100644
+--- a/utils/cli/Makefile.am
++++ b/utils/cli/Makefile.am
+@@ -27,10 +27,12 @@ bluealsa_cli_SOURCES = \
+ bluealsa_cli_CFLAGS = \
+ 	-I$(top_srcdir)/src \
+ 	@DBUS1_CFLAGS@ \
++	@GLIB2_CFLAGS@ \
+ 	@LIBUNWIND_CFLAGS@
+ 
+ bluealsa_cli_LDADD = \
+ 	@DBUS1_LIBS@ \
++	@GLIB2_LIBS@ \
+ 	@LIBUNWIND_LIBS@
+ 
+ endif
+diff --git a/utils/cli/cli.c b/utils/cli/cli.c
+index aeeabe5..83765ab 100644
+--- a/utils/cli/cli.c
++++ b/utils/cli/cli.c
+@@ -22,6 +22,7 @@
+ #include <strings.h>
+ #include <sys/param.h>
+ 
++#include <glib.h>
+ #include <dbus/dbus.h>
+ 
+ #include "cli.h"
+@@ -414,7 +415,7 @@ int main(int argc, char *argv[]) {
+ 		}
+ 	}
+ 
+-	log_open(basename(argv[0]), false);
++	log_open(g_path_get_basename(argv[0]), false);
+ 	dbus_threads_init_default();
+ 
+ 	DBusError err = DBUS_ERROR_INIT;
+diff --git a/utils/rfcomm/Makefile.am b/utils/rfcomm/Makefile.am
+index 907df1a..2a5f915 100644
+--- a/utils/rfcomm/Makefile.am
++++ b/utils/rfcomm/Makefile.am
+@@ -16,10 +16,12 @@ bluealsa_rfcomm_CFLAGS = \
+ 	-I$(top_srcdir)/src \
+ 	@BLUEZ_CFLAGS@ \
+ 	@DBUS1_CFLAGS@ \
++	@GLIB2_CFLAGS@ \
+ 	@LIBUNWIND_CFLAGS@
+ 
+ bluealsa_rfcomm_LDADD = \
+ 	@DBUS1_LIBS@ \
++	@GLIB2_LIBS@ \
+ 	@LIBUNWIND_LIBS@ \
+ 	-lreadline
+ 
+diff --git a/utils/rfcomm/rfcomm.c b/utils/rfcomm/rfcomm.c
+index d01f081..abc2130 100644
+--- a/utils/rfcomm/rfcomm.c
++++ b/utils/rfcomm/rfcomm.c
+@@ -25,6 +25,7 @@
+ 
+ #include <bluetooth/bluetooth.h>
+ #include <dbus/dbus.h>
++#include <glib.h>
+ #include <readline/readline.h>
+ #include <readline/history.h>
+ 
+@@ -134,7 +135,7 @@ int main(int argc, char *argv[]) {
+ 
+ 	char dbus_ba_service[32] = BLUEALSA_SERVICE;
+ 
+-	log_open(basename(argv[0]), false);
++	log_open(g_path_get_basename(argv[0]), false);
+ 
+ 	while ((opt = getopt_long(argc, argv, opts, longopts, NULL)) != -1)
+ 		switch (opt) {
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
index 419d6e8d22..f089e036e3 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
@@ -16,7 +16,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=143bc4e73f39cc5e89d6e096ac0315ba"
 
 DEPENDS += "alsa-lib bluez5 dbus glib-2.0-native python3-packaging-native sbc"
 
-SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master \
+           file://0001-Use-basename-implementation-from-glib-2.0.patch"
 
 SRCREV = "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
 

