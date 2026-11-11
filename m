Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3639.1794429600940399266
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 12:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dVyvjuOR;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2384085a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 12:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794429600; x=1795034400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuN2Q7/h1U9XuDY4i0JtMo7/Vpunn5TuatsuUpOUTso=;
        b=dVyvjuORnI58v7D0+fjktTvknxV+RcfMG4EE4HiQ2YYx4DIJ588fc+lyo+SZpuslLJ
         cypUvxVYYrIEm/jzaHeDm2UDew0Y8WFsfMIU+kDr8xmUSHQ2JyDsx3jQn8cT67peHSMl
         Ahnq9s2zWDAYWaQ56PAmuhVU0BNh+8wmiLgZReNwjBsXfDj7RqRyFw1aKBX4db0wM7tT
         zpm8BRCGXb7oYJjgo8bAGdRttBoGkDM6k82mSWcj4GQjKOGgCN+zJnQT/Wt3hTMQFHZ+
         kEg46ajQlWHZ/Z+wSEdYaUCwJ0qA6L852/yYwHNhUGMIHfQHmMm+Duznzc8u3Hqwn2wN
         ck1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794429600; x=1795034400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yuN2Q7/h1U9XuDY4i0JtMo7/Vpunn5TuatsuUpOUTso=;
        b=ureyOG9kmRz2ern4GpRh29OoZU3FnwuanwE0rJV0m1BS+Ontxr11t/p65+GDXVcynx
         eFv7QjHPadnOqbtiP1+EM1CWZqORAJk8HA3iuqVIg3I7j4+MBOmv233wANN2Yws1MWwy
         Kko3M4ALnBWhZI5zrjEZVH0dZJD2Hf+3gEOfZJaYYVKUuL/p3ffhUyZYVNpC9pAi1U4Z
         w1NjV/HHID4ZBynaL+11P1K+TUVr6SI8qnprDBG45/1vu6lmy5MtsrpMMDm0tURuYq0C
         uwPd7idTUbHycV39EI+VRgHBaeSwAoqI/mqInxID+8ofXv0NIymgF/PyRYJQeMYWXBjO
         CHPg==
X-Gm-Message-State: APuU4Z+n3jRPqe6tCaxRRMeEIbbn+TNNjAucSMUP1BildSp9IupZ5FFW
	G/5OyEEEM+0SeCTwVNFu68zCHeWbYbBhzDPSn17nQRC1nwkUfqXQv99mRkh2lIOZ
X-Gm-Gg: AYBFou08krGqfudglvb3C6bUAsdAbWwvp4bVDwEAOX+UnWhpeGtCB278LeFjkLWvo67
	GFngkcOjkO54Zx4s8A+FOBKRuU4wDwzUkpI3DrtsLj0SQ4f8RIEEhDLmZWfq4nAfpY0kEjktKBO
	XLhfFR9omQoxfLJPK9CwVX/Okd1TOIgLzZrQ8/KQfUe6VdfD7YJV6BL/H13Ml0QPkIU6+mHHHkU
	fUlL9/OCIr/qdymTR6cErK+k5f3lcsrt/fhHDhHXUloe8EQ3MFcxLm9JO0qGCiCbILwf+ES++vg
	Sn2GrMEJ1eZhGVcEfhj1VOC6LSZrExCfrF6RP6YDDGnMsVQIsbpmuG4pSMqMQyVSYOs9sOgwUA/
	SkBXVJ4evreOgR7frHliN8+j8cbtkwip3CWINvcc77druOqY0l9j1ayErdHmlVd2pPPePl5RlbK
	3n/iQt5xt/MXZI8QCT24SmUeHxLaYZnhBNOI83YZEgSsnwLI/vbnn8U/C5LkBh+wIUJg14AAdlI
	+IfZxdlwZzRpPVCzilQuf5QERMlaMWnfXxvRkQl3gjDumy8HOGXMjEh9wOVj/RK0SN2hqQPOLVw
	x4ra/yrR6um2GNlELnZplSkT8PabQrENzsdT4NRJKgxONZbHaXK/ZSxoG7V3SxE=
X-Received: by 2002:a17:90b:2684:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3b182df326emr3589595a91.3.1794429600138;
        Wed, 11 Nov 2026 12:40:00 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d699b93sm1841011a12.14.2026.11.11.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:39:59 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [meta-oe][PATCH 1/3] postgresql: make PGXS usable for cross-building extensions
Date: Wed, 11 Nov 2026 20:39:55 +0000
Message-ID: <20261111203957.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111203957.7-1-bbnpreetsingh@gmail.com>
References: <20261111203957.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132138
Content-Type: text/plain; charset="utf-8"

Extensions built with PGXS need pg_config and Makefile.global, but
pg_config is a target binary and the staged Makefile.global has its
paths stripped.

Stage a shell pg_config in crossscripts and fix up the staged PGXS
makefiles so extensions can be built against the sysroot.

Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 .../recipes-dbs/postgresql/files/pg_config    | 43 +++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 62 +++++++++++++++++--
 2 files changed, 99 insertions(+), 6 deletions(-)
 create mode 100755 meta-oe/recipes-dbs/postgresql/files/pg_config

diff --git a/meta-oe/recipes-dbs/postgresql/files/pg_config b/meta-oe/recipes-dbs/postgresql/files/pg_config
new file mode 100755
index 0000000000..1fab031a90
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/pg_config
@@ -0,0 +1,43 @@
+#!/bin/sh
+# pg_config for cross builds, the real one is a target binary.
+# Build paths are answered inside the sysroot, install paths as on the target.
+
+sysroot=$(cd "$(dirname "$0")" && pwd -P)
+sysroot=${sysroot%@CROSSSCRIPTS@}
+
+value() {
+	case $1 in
+	--bindir) echo "@BINDIR@" ;;
+	--docdir) echo "@DOCDIR@" ;;
+	--htmldir) echo "@DOCDIR@" ;;
+	--includedir) echo "$sysroot@INCLUDEDIR@" ;;
+	--pkgincludedir) echo "$sysroot@PKGINCLUDEDIR@" ;;
+	--includedir-server) echo "$sysroot@PKGINCLUDEDIR@/server" ;;
+	--libdir) echo "$sysroot@LIBDIR@" ;;
+	--pkglibdir) echo "@PKGLIBDIR@" ;;
+	--localedir) echo "@LOCALEDIR@" ;;
+	--mandir) echo "@MANDIR@" ;;
+	--sharedir) echo "@SHAREDIR@" ;;
+	--sysconfdir) echo "@SYSCONFDIR@" ;;
+	--pgxs) echo "$sysroot@PKGLIBDIR@/pgxs/src/makefiles/pgxs.mk" ;;
+	--version) echo "PostgreSQL @VERSION@" ;;
+	*)
+		echo "pg_config: $1 is not available in a cross build" >&2
+		exit 1
+		;;
+	esac
+}
+
+all="bindir docdir htmldir includedir pkgincludedir includedir-server \
+	libdir pkglibdir localedir mandir sharedir sysconfdir pgxs version"
+
+if [ $# -eq 0 ]; then
+	for opt in $all; do
+		printf '%s = %s\n' "$(echo "$opt" | tr a-z A-Z)" "$(value "--$opt")"
+	done
+	exit 0
+fi
+
+for arg; do
+	value "$arg"
+done
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 76e90df765..5ac0513085 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql-setup \
     file://postgresql.service \
     file://run-ptest \
+    file://pg_config \
 "
 
 LEAD_SONAME = "libpq.so"
@@ -284,16 +285,65 @@ do_install:append() {
     install -m 0644 ${UNPACKDIR}/postgresql.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@BINDIR@,${bindir},g' \
         ${D}${systemd_unitdir}/system/postgresql.service
-    # Remove the build path
+    # Make the installed PGXS makefiles usable from extension recipes: take
+    # the toolchain from the environment and drop the build paths. PostgreSQL
+    # 18 skips pg_config when prefix is set, the first expression undoes that.
     if [ -f ${D}${libdir}/${BPN}/pgxs/src/Makefile.global ]; then
-        sed -i -e 's#${RECIPE_SYSROOT}##g' \
-               -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
-               -e 's#${WORKDIR}##g' \
-               -e 's#${TMPDIR}##g' \
-             ${D}${libdir}/${BPN}/pgxs/src/Makefile.global
+        sed -i \
+            -e 's#^ifneq (,$(if $(PGXS),,1)$(prefix))$#ifndef PGXS#' \
+            -e 's#^CC = .*#CC := $(CC)#' \
+            -e 's#^CXX = .*#CXX := $(CXX)#' \
+            -e 's#^CPP = .*#CPP := $(CPP)#' \
+            -e 's#^LD = .*#LD := $(LD)#' \
+            -e 's# -fcanon-prefix-map##g' \
+            -e 's# -f\(file\|debug\|macro\)-prefix-map=[^ ]*##g' \
+            -e 's#^CFLAGS = \(.*\)#CFLAGS := \1 $(CFLAGS)#' \
+            -e 's#^CXXFLAGS = \(.*\)#CXXFLAGS := \1 $(CXXFLAGS)#' \
+            -e 's#^LDFLAGS = \(.*\)#LDFLAGS := \1 $(LDFLAGS)#' \
+            -e '/^CFLAGS :=/s# -I${STAGING_INCDIR}/${PYTHON_DIR}##' \
+            -e 's#${RECIPE_SYSROOT}${includedir}#$(includedir)#g' \
+            -e 's#${RECIPE_SYSROOT}${libdir}#$(libdir)#g' \
+            -e 's#${STAGING_BINDIR_NATIVE}/perl-native/perl#perl#g' \
+            -e 's#${STAGING_BINDIR_NATIVE}/python3-native/python3#python3#g' \
+            -e 's#${STAGING_BINDIR_NATIVE}/##g' \
+            -e 's#${TMPDIR}/hosttools/##g' \
+            -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
+            -e 's#${RECIPE_SYSROOT}##g' \
+            -e 's#${WORKDIR}##g' \
+            -e 's#${TMPDIR}##g' \
+            ${D}${libdir}/${BPN}/pgxs/src/Makefile.global
+        # PGXS installs headers and libraries into directories pg_config
+        # reports inside the sysroot, strip the sysroot there
+        sed -i -e '/^pgxsdir = /a pg_sysroot := $(patsubst %$(pgxsdir)/src/makefiles/pgxs.mk,%,$(PGXS))' \
+            ${D}${libdir}/${BPN}/pgxs/src/Makefile.global
+        sed -i -e 's#$(DESTDIR)$(includedir_server)#$(DESTDIR)$(includedir_server:$(pg_sysroot)%=%)#g' \
+            ${D}${libdir}/${BPN}/pgxs/src/makefiles/pgxs.mk
+        sed -i -e 's#$(DESTDIR)$(libdir)#$(DESTDIR)$(libdir:$(pg_sysroot)%=%)#g' \
+            ${D}${libdir}/${BPN}/pgxs/src/Makefile.shlib
     fi
 }
 
+# pg_config is a target binary, stage a script for extension builds
+SYSROOT_PREPROCESS_FUNCS += "postgresql_sysroot_preprocess"
+postgresql_sysroot_preprocess() {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+    sed -e 's,@CROSSSCRIPTS@,${bindir_crossscripts},g' \
+        -e 's,@BINDIR@,${bindir},g' \
+        -e 's,@DOCDIR@,${docdir}/${BPN},g' \
+        -e 's,@INCLUDEDIR@,${includedir},g' \
+        -e 's,@PKGINCLUDEDIR@,${includedir}/${BPN},g' \
+        -e 's,@LIBDIR@,${libdir},g' \
+        -e 's,@PKGLIBDIR@,${libdir}/${BPN},g' \
+        -e 's,@LOCALEDIR@,${datadir}/locale,g' \
+        -e 's,@MANDIR@,${mandir},g' \
+        -e 's,@SHAREDIR@,${datadir}/${BPN},g' \
+        -e 's,@SYSCONFDIR@,${sysconfdir}/${BPN},g' \
+        -e 's,@VERSION@,${PV},g' \
+        ${UNPACKDIR}/pg_config \
+        > ${SYSROOT_DESTDIR}${bindir_crossscripts}/pg_config
+    chmod 0755 ${SYSROOT_DESTDIR}${bindir_crossscripts}/pg_config
+}
+
 SSTATE_SCAN_FILES += "Makefile.global"
 SSTATE_SCAN_FILES:remove = "*_config"
 
-- 
2.43.0

