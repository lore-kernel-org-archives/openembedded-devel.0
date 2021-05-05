Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.1088.1620255960654663469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 16:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ijN5mtA4;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: romain.naour@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so2005169wmh.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 16:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7zl+dejctGWBp0vaKCj3tbnhyu25uhxo5wDQY9UU8w=;
        b=ijN5mtA4op6dM4/UbJPDTkmgygt4jzMBizX+T0qfboC27bLDYhUNHJoE/uIEx5YN+0
         7kIPWYnpxWD7Q75Itfe9dnzLtC2uiXgy+8AaEG4z/yvOqxhxjA86BV4km/80Dsup5Yfp
         /z3dptAUH54sU0wZuK7eXvyikxkeK3cNVMtfzXwCP+9VvwyKr5yNRWpop/9XqdzlzYuf
         12Q3aB5GX+9kHvbrLxeMrwT68whG1KXMyyA6/nd4mi+5eCDtJnj9zVOMI+f4IjXJsm7g
         dwKD4FUR3yqA7n6s0TH2Sf92C8iGMyjzFDJlghX/edMF+jOnZafYyTgk1LmWINLZ8H5E
         s+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7zl+dejctGWBp0vaKCj3tbnhyu25uhxo5wDQY9UU8w=;
        b=r+AwByXuSE8/9QY84JkVocxg2dwHGjw+pKbE63fa6L2/kyQLB1TYbYMYS39IRKRAPx
         cjZknDlqHqhGhq/5u2et4Qp6wgVht4tdpZUXOeDCwxj9Yozkn6DQ+CSefbi5RytnGSZa
         VnjXXuYT8yfKO/jck+P8s6LjQJuD+pGCmPUe0fHpabsfpbPXfPx5Usw3wEcDHYND1+Uk
         KJrSi0ZRb5mVKXh5VcjZShALj3k67dPc9oaIF5D0MfIBh2UqZOkg7kFpirryVeN05Axq
         YL8xcuHNE0nzbpEHojCkuKcEnqGtVjxlXdwWkByg85QacxcqywtIbhEFJ2owwbN7x2zy
         lTcA==
X-Gm-Message-State: AOAM530aQH8oNDpGhEEuI3GEYp7G68oA6ub+2eqBwbQO5K88v2McXs/N
	RHKkQoEqYUhg3DoSVJoO+7yN+wAde6A=
X-Google-Smtp-Source: ABdhPJzLyeMGFKIOJRTRSaH9VPesvn2+0vsNIuBeesh49bbX+LTGcdSSd4xShlX2x4VVjlWJZkCS/w==
X-Received: by 2002:a05:600c:214f:: with SMTP id v15mr12343636wml.146.1620255959244;
        Wed, 05 May 2021 16:05:59 -0700 (PDT)
Return-Path: <romain.naour@gmail.com>
Received: from localhost.localdomain (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
        by smtp.gmail.com with ESMTPSA id u2sm6924174wmc.22.2021.05.05.16.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 16:05:58 -0700 (PDT)
From: "Romain Naour" <romain.naour@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Romain Naour <romain.naour@gmail.com>
Subject: [meta-oe][PATCH 1/2] poke: add recipe for version 1.2
Date: Thu,  6 May 2021 01:05:44 +0200
Message-Id: <20210505230545.2574514-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch to disable tcl/tk dependencies when gui support
is disabled.

Add a local patch to workaround a path poisoning issue. Issue
reported upstream.

Add another local patch when HELP2MAN is missing.

See:
http://www.jemarch.net/poke-1.0-relnotes.html
http://www.jemarch.net/poke-1.1-relnotes.html
http://www.jemarch.net/poke-1.2-relnotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...ck-for-Tcl-Tk-if-disable-gui-is-spec.patch | 43 ++++++++++++++++++
 ...nfig.in-avoit-host-poisoning-while-c.patch | 45 +++++++++++++++++++
 ...P2MAN-replace-by-true-when-cross-com.patch | 34 ++++++++++++++
 meta-oe/recipes-devtools/poke/poke_1.2.bb     | 31 +++++++++++++
 4 files changed, 153 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
 create mode 100644 meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
 create mode 100644 meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
 create mode 100644 meta-oe/recipes-devtools/poke/poke_1.2.bb

diff --git a/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch b/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
new file mode 100644
index 000000000..3bd041a0e
--- /dev/null
+++ b/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
@@ -0,0 +1,43 @@
+From cef3fc90f02ef4fc49515745194bac3d81a2265b Mon Sep 17 00:00:00 2001
+From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
+Date: Fri, 30 Apr 2021 13:17:05 +0200
+Subject: [PATCH] build: do not check for Tcl/Tk if --disable-gui is specified
+
+2021-04-30  Jose E. Marchesi  <jemarch@gnu.org>
+
+	* configure.ac: Do not check for tcl/tk if --disable-gui is
+	specified at configure time.
+
+(cherry picked from commit 280a5e154287e43c0a40d9530a9cc658a7367a9c)
+[Romain: remove Changelog entry]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c7205513..c2f0760a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -214,12 +214,15 @@ fi
+ dnl The GUI is optional, and depends on the availability of Tcl and
+ dnl Tk.
+ 
+-POKE_TCLTK
+-
+ AC_ARG_ENABLE([gui],
+               AS_HELP_STRING([--enable-gui],
+                              [Enable the GUI (default is YES)]),
+-              [gui_enabled=$enableval], [gui_enabled=$has_tcltk])
++              [gui_enabled=$enableval], [gui_enabled=yes])
++
++if test "x$gui_enabled" = "xyes"; then
++ POKE_TCLTK
++ gui_enabled=$has_tcltk
++fi
+ 
+ AM_CONDITIONAL([GUI], [test "x$gui_enabled" = "xyes"])
+ 
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch b/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
new file mode 100644
index 000000000..fa55f817f
--- /dev/null
+++ b/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
@@ -0,0 +1,45 @@
+From c37419e459bd5863534719fa50755174d0912e6d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 30 Apr 2021 14:32:21 +0200
+Subject: [PATCH] jitter: jitter-config.in: avoit host poisoning while
+ cross-compiling
+
+When jitter is bundled into another project (poke), jitter-config --cppflags
+return an unsafe path "-I /usr/include".
+
+In the context of Buildroot, such configuration script woulf be "fixed"
+after installation. But jitter-config is not installed by poke since it's
+build as static library and liked to poke.
+
+For now, patch jitter-config.in instead of jitter-config.in.m4sh since
+there is an issue while converting the M4sh m4sh script ( .in.m4sh )
+into a portable shell script ( .in ) ready to be processed by aclocal
+for @-substitutions.
+
+[1] https://git.buildroot.net/buildroot/tree/package/pkg-generic.mk?h=2021.02.1#n291
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ jitter/bin/jitter-config.in | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/jitter/bin/jitter-config.in b/jitter/bin/jitter-config.in
+index 5e124f0..af0ac9d 100644
+--- a/jitter/bin/jitter-config.in
++++ b/jitter/bin/jitter-config.in
+@@ -998,11 +998,7 @@ while test "$#" != "0"; do
+             append_to_output cflags;;
+         --cppflags)
+             no_option_argument
+-            append_to_output cppflags
+-            # Append a -I argument.  This is defined separately from the rest,
+-            # as the installation prefix can be decided very late, at Jitter
+-            # installation time.
+-            output="$output -I $includedir";;
++            append_to_output cppflags;;
+         --ldadd)
+             no_option_argument
+             append_to_output ldadd;;
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
new file mode 100644
index 000000000..f217c917f
--- /dev/null
+++ b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -0,0 +1,34 @@
+From 8ba76a5a7ce311f67890199c5595bc1f626495ad Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 30 Apr 2021 15:43:59 +0200
+Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
+ cross-compiling
+
+Avoid:
+/usr/bin/make  ./../poke/poke
+../run \
+  : -p poke --name="The GNU extensible binary editor" \
+      ./../poke/poke -o ./poke.1
+../run: line 51: exec: :: not found
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c2f0760a..93769ef9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
+ if test $cross_compiling = no; then
+   AM_MISSING_PROG(HELP2MAN, help2man)
+ else
+-  HELP2MAN=:
++  HELP2MAN=true
+ fi
+ 
+ dnl recfix is part of the GNU recutils suite, and is used in cfg.mk to
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-devtools/poke/poke_1.2.bb b/meta-oe/recipes-devtools/poke/poke_1.2.bb
new file mode 100644
index 000000000..dcb547ff8
--- /dev/null
+++ b/meta-oe/recipes-devtools/poke/poke_1.2.bb
@@ -0,0 +1,31 @@
+SUMMARY = "GNU poke is an extensible editor for structured binary data"
+HOMEPAGE = "https://pokology.org"
+DESCRIPTION = "GNU poke is an interactive, extensible editor for binary data. Not limited to editing basic entities such as bits and bytes, it provides a full-fledged procedural, interactive programming language designed to describe data structures and to operate on them."
+SECTION = "console/utils"
+LICENSE = "GPL-3.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
+          file://0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch \
+          file://0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch \
+          file://0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch \
+          "
+
+DEPENDS = "flex-native bison-native bdwgc readline"
+
+SRC_URI[sha256sum] = "f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62"
+
+# poke does not support using out-of-tree builds
+inherit autotools-brokensep gettext pkgconfig
+
+# The automatic m4 path detection gets confused, so force the right value from
+# the poke bootstrap script.
+acpaths = "-I ./m4"
+
+EXTRA_OECONF = "--disable-gui \
+                --disable-libnbd \
+                --disable-mi \
+                --with-libreadline-prefix=${STAGING_INCDIR} \
+                "
+
+FILES_${PN} += "${datadir}/emacs/site-lisp"
-- 
2.30.2

