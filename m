Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB8CFC72D4
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 18:26:57 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.742.1774204017129424877
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 11:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pqmd7PkN;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso309981eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 11:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774204016; x=1774808816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKnNppXCpVi9TNJRCdLrwK1El7/G9hcsDP0UtoCB2M4=;
        b=Pqmd7PkNBdkfzmfiSz5CGih156VPg6Y4MuG8O6dX6vfg7sduN/HDwhg21ByW21SCOW
         Lp50cg+rEL6/1DkbcQSifCerWq36MtQfPnYXQA5EPd+niGW1h/kIlrQdYUiWYhXIZq5s
         sUKs563MTZlGiz4K2IEBpPrX2FE0zkZ7ZojhEM9xKCMIwyGWXcT37evS4Eov/wDbQCcm
         2ATOar1Yiu5z6tmYQR3hbU/BB4f4bN5fy3riDxGLbnR3uHdDFhSGnlIinn8MguZAFE8g
         /Hh2plJfuc+uDYQTAWJVkiHas4WIRDOWFDvLRqMWGwH/xkMjIyvha/f/Ludsdzcf0Q8d
         dnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774204016; x=1774808816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKnNppXCpVi9TNJRCdLrwK1El7/G9hcsDP0UtoCB2M4=;
        b=EFs1BIYvlmXw9rjks/nJb0p9PSchFfTeR2QYV6baCcraNiO37ggp/pPN7ddP+0j/l9
         pCVZhFvgcLUVfA+MgMyaFW9ViAN7iJ7dUcyUUO4Y/tGt8lkNzcLXC1aQhRG5JxmrAegT
         ZY6S4N9QmLP3b7SDacp2kTStZxGu2YFW2PhJWVmWJfmbpnRp8CQiajsZaIKfCB2CaKsr
         BJZ+hyLV+EPYaZXIZBEuZwWdiqvzcWn9eHJI8JVBje/C4wEVkIPG9ame9UbkhyxfgRu5
         3ORmWtKsTgHpS2xl+ebw+Iin/XbpmrppqiEYILz/Zi8bgGpggUpEKvOFMAoMAeg/tmS/
         4cOg==
X-Gm-Message-State: AOJu0Yzs3q59XjQ3DIej81Zch5DhO42R6awGMZeBAx4I5yf5Jrv6oht3
	hM3Scz+H8ItRge0kYUTsHuLQsOnBuhjHAW9Oa1ERUJUgJ2x/AhrWbzKVug2r3n9SCz28RQ==
X-Gm-Gg: ATEYQzxFe2rBrvJodatcAD3Z5514D2dP9fdQjEQeibM7wKl3vQbx/iLxOJ6k/JZJZD0
	mOvO2tqqwQSjJpM3tvrymRpqqj0Nbbn73UiXvoaC07E659bujXHwiH2mygO/L43zpp/UGzj6yy5
	b2+xx9cRhUzeGHG0dishmtRSdF0VwnxS16PzGzkBbHMeXrpffrQgdhVItrXb89S4oRmM8NVGOwj
	PuT75sILnmu6Fe0eLHtjshHXmBHTDv8iWdeFhkd7Y/dZV9QvoOLJ4YTVh29+qPFg+NCyqh0eyUN
	dB3TP4wIu+XAmPcwn4d+EZR8UoCQ9cOM0PnfksrAfJwbAkI63QzAZHDZ4b+sB7vNBHPcgwxZEOI
	W2cw4wKA8KN0PRuwKyuRUyKcOoce0z3eMIR/bZ6RJPbunYPBAOrz+87NLAtOhcb7jHNXVeICHBm
	2yDhnFGsRThg5o4v6iTY1tzdit6WZTH9im/Yk9226fJecqpgIPr0jU8AlzFhRu28LHeR/vhDzP+
	ctFTfsOU1hE82r0GlA52tHRuwkvqWqoT73Z99gxlsG9VGZpLM014UpywxyX
X-Received: by 2002:a05:7300:d215:b0:2c1:14ca:7c86 with SMTP id 5a478bee46e88-2c114ca7fbcmr2178435eec.32.1774204016148;
        Sun, 22 Mar 2026 11:26:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm10212316eec.2.2026.03.22.11.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 11:26:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 2/2] netcf: Stick to shell implementation of gnulib-tool
Date: Sun, 22 Mar 2026 11:26:51 -0700
Message-ID: <20260322182651.4090587-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322182651.4090587-1-khem.raj@oss.qualcomm.com>
References: <20260322182651.4090587-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 18:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125489

Fix build with newer autotools and gnulib

Newer gnulib use python implementation by default if it
finds py3 on the system. However, netcf is old package
and its not expecting python implementation, therefore
make the shell implementation be used.

REALLOC_N is gone in latest gnulib so house a local
macro

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nulib-read_file-fread_file-signature.patch | 41 ++++++++-----
 ...bootstrap-with-newer-gnulib-automake.patch | 61 +++++++++++++++++++
 .../recipes-support/netcf/netcf_0.2.8.bb      |  6 +-
 3 files changed, 91 insertions(+), 17 deletions(-)
 create mode 100644 meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch

diff --git a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
index b188248fff..83fdfded52 100644
--- a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
+++ b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
@@ -17,11 +17,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/ncftransform.c | 2 +-
  4 files changed, 5 insertions(+), 5 deletions(-)

-diff --git a/src/dutil_linux.c b/src/dutil_linux.c
-index 742153a..eb72eb2 100644
 --- a/src/dutil_linux.c
 +++ b/src/dutil_linux.c
-@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *ncf,
+@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *

      xasprintf(&path, "/sys/class/net/%s/operstate", ifname);
      ERR_NOMEM(!path, ncf);
@@ -30,7 +28,7 @@ index 742153a..eb72eb2 100644
      if (!state) {
          /* missing operstate is *not* an error. It could be due to an
           * alias interface, which has no entry in /sys/class/net at
-@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *ncf,
+@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *
          FREE(path);
          xasprintf(&path, "/sys/class/net/%s/speed", ifname);
          ERR_NOMEM(path == NULL, ncf);
@@ -39,11 +37,9 @@ index 742153a..eb72eb2 100644
          if (!speed && errno == EINVAL) {
              /* attempts to read $ifname/speed result in EINVAL if the
               * interface is ifconfiged down (which isn't exactly the
-diff --git a/src/dutil_posix.c b/src/dutil_posix.c
-index 1313514..b9884f0 100644
 --- a/src/dutil_posix.c
 +++ b/src/dutil_posix.c
-@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const char *const *argv, char **output)
+@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const
                         "Failed to create file stream for output while executing '%s': %s",
                         argv_str, errbuf);

@@ -52,11 +48,9 @@ index 1313514..b9884f0 100644
      ERR_THROW_STRERROR(*output == NULL, ncf, EEXEC,
                         "Error while reading output from execution of '%s': %s",
                         argv_str, errbuf);
-diff --git a/src/ncftool.c b/src/ncftool.c
-index f1b5642..c878cb0 100644
 --- a/src/ncftool.c
 +++ b/src/ncftool.c
-@@ -351,7 +351,7 @@ static int cmd_define(const struct command *cmd) {
+@@ -351,7 +351,7 @@ static int cmd_define(const struct comma
      struct netcf_if *nif = NULL;
      int result = CMD_RES_ERR;

@@ -65,8 +59,6 @@ index f1b5642..c878cb0 100644
      if (xml == NULL) {
          fprintf(stderr, "Failed to read %s\n", fname);
          goto done;
-diff --git a/src/ncftransform.c b/src/ncftransform.c
-index fbabfc3..4c9a56d 100644
 --- a/src/ncftransform.c
 +++ b/src/ncftransform.c
 @@ -54,7 +54,7 @@ int main(int argc, char **argv) {
@@ -78,6 +70,25 @@ index fbabfc3..4c9a56d 100644
      if (in_xml == NULL)
          die("Failed to read %s\n", argv[2]);

---
-2.44.0
-
+--- a/src/internal.h
++++ b/src/internal.h
+@@ -30,6 +30,7 @@
+
+ #include <string.h>
+ #include <stdarg.h>
++#include <stdlib.h>
+
+ #include <libxslt/transform.h>
+ #include <libxml/relaxng.h>
+@@ -85,6 +86,11 @@
+ #define ATTRIBUTE_NOINLINE
+ #endif                                   /* __GNUC__ */
+
++#ifndef REALLOC_N
++# define REALLOC_N(ptr, count) \
++    (((ptr) = realloc((ptr), sizeof(*(ptr)) * (count))) == NULL ? -1 : 0)
++#endif
++
+ /* This needs ATTRIBUTE_RETURN_CHECK */
+ #include "ref.h"
+
diff --git a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
new file mode 100644
index 0000000000..62daeff812
--- /dev/null
+++ b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
@@ -0,0 +1,61 @@
+From dded6e3321e304f50922e61c553d4e4eb0f80fd0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 22 Mar 2026 11:05:34 -0700
+Subject: [PATCH] netcf: fix bootstrap with newer gnulib/automake
+
+Upstream netcf is old enough that bootstrap/autoreconf now trips over:
+- gnulib-tool.py wrapper expectations in newer gnulib
+- stricter automake handling of AM_CFLAGS += from generated gnulib.mk
+- subdir source warnings
+- deprecated INCLUDES usage
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac             | 2 +-
+ gnulib/lib/Makefile.am   | 2 +-
+ gnulib/tests/Makefile.am | 2 ++
+ tests/Makefile.am        | 2 +-
+ 4 files changed, 5 insertions(+), 3 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([gnulib/m4])
+ AC_CONFIG_HEADERS([config.h])
+-AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests parallel-tests])
++AM_INIT_AUTOMAKE([-Wno-portability 1.11 subdir-objects color-tests parallel-tests])
+ AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
+ AC_CANONICAL_HOST
+
+--- a/gnulib/lib/Makefile.am
++++ b/gnulib/lib/Makefile.am
+@@ -13,4 +13,4 @@ CLEANFILES=
+
+ include gnulib.mk
+
+-INCLUDES = $(GETTEXT_CPPFLAGS)
++AM_CPPFLAGS = $(GETTEXT_CPPFLAGS)
+--- a/gnulib/tests/Makefile.am
++++ b/gnulib/tests/Makefile.am
+@@ -3,6 +3,6 @@
+ ## Copyright (C) 2011 Red Hat, Inc.
+ ## See COPYING.LIB for the License of this software
+
+-include gnulib.mk
++AM_CFLAGS =
+
+-INCLUDES = $(GETTEXT_CPPFLAGS)
++include gnulib.mk
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT = \
+   abs_top_builddir='$(abs_top_builddir)' \
+   abs_top_srcdir='$(abs_top_srcdir)'
+
+-INCLUDES = -I$(top_srcdir)/src
++AM_CPPFLAGS = -I$(top_srcdir)/src
+
+ TESTS=
+ check_PROGRAMS=
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index 4170e9fab0..d1f9e29d3a 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -10,6 +10,7 @@ SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
 PV .= "+git"

 SRC_URI = "git://pagure.io/netcf.git;protocol=https;branch=master \
+           file://0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch \
            file://0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch"

 UPSTREAM_CHECK_GITTAGREGEX = "release-(?P<pver>(\d+(\.\d+)+))"
@@ -27,6 +28,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"

 do_configure:prepend() {
+    export GNULIB_TOOL_IMPL=sh
     currdir=`pwd`
     cd ${S}

@@ -50,11 +52,11 @@ do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        if [ -d "${D}${libdir}/systemd/system" ]; then
-           if [ "${systemd_unitdir}" != "${libdir}/systemd" ] ; then
+           if [ "${systemd_unitdir}" != "${libdir}/systemd" ] ; then
                mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
                rm -rf ${D}${libdir}/systemd/
 	   fi
-       elif [ "${systemd_unitdir}" != "${nonarch_libdir}/systemd" ] ; then
+       elif [ "${systemd_unitdir}" != "${nonarch_libdir}/systemd" ] ; then
            mv ${D}${nonarch_libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
            rm -rf ${D}${nonarch_libdir}/systemd/
        fi

