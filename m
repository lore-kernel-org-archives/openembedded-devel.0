Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA89ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 04:32:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.6531.1663216360514090973
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 21:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LdYDNIeV;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 q62-20020a17090a17c400b00202a3497516so14031452pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 21:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lhlEcdF4Cqo1FsQpLrhp7CUb1B8eCczY9SU3EALT5eA=;
        b=LdYDNIeVGdzJV9Eu653xN8h1AcSwCyo1CiUNCAqO4dyrPLXjCu+tDxlZ/Zps11UpyA
         dW4JvkPk6K/N29qcD1N0571jbWV3f2BLocj9notpwtbNFHsr6B4E4D9rNSIs2v/31Ikt
         l3RaXBiUKf8XujGHx4k0OcMpsGQAWUjKw17REqsV2N63w/nh55nLYwfS9tcoiEU4ZYTt
         715jXZerf8k5AGnTMHu1Zfr/W0r/KfdNNJ3eQTLXK/xmj312pjMyB/ntqGGgRTy/XzEd
         3UltQbGT26dXtoFqWzVqHelTgj8IOUMIsYe03RyHsJynOB00zFkCRNg6NLlAc4q3bqbf
         OanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lhlEcdF4Cqo1FsQpLrhp7CUb1B8eCczY9SU3EALT5eA=;
        b=xQ+j0inoYUwNF9aiC3vh0k4QDyYUfXdq2I0mha6wjIp2lsX48GyaxomgJo00tcDzlG
         aC1HXskjwjFXg/kRM/ziPFPi3gAfSZbtqmnn/iibJudCcTUvR+YOvcx4ta7kqVFIl6Dt
         do6xHZIcq545vXslze5vCg10bwwQRxf9nWMa8A4nH2L/01y9tmxDazmv0CvOLB4WDYlM
         vKPuraBMUdND8dWG6AbTc8k+PsErML0S1MrTA8E3VwekT/0alJhoiap12zqjI3uyGK0A
         4eJGwm3+hXKIyiIi92mTzQZuWDOQfBPoCw8YdzJTpV0UJfUjALiH2jFYw7uu/u69L4BS
         mFkA==
X-Gm-Message-State: ACrzQf3NjEZRXzKD65DItYO4sG2QCyDiZgRhhDqfsYnerH3j9Y7Kvbyx
	4ODW+kaLPs02P0tI7KQnIK7JOutB07B6CQ==
X-Google-Smtp-Source: 
 AMsMyM6GP29Xk+rDg7V3v7NP/IUFqsEEcgIaenJfHEb5jYallNGcLUasQrcSjymiHvNmaw9FwpXpRA==
X-Received: by 2002:a17:90a:4805:b0:1f5:39ab:29a9 with SMTP id
 a5-20020a17090a480500b001f539ab29a9mr8433289pjh.202.1663216359602;
        Wed, 14 Sep 2022 21:32:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ec90])
        by smtp.gmail.com with ESMTPSA id
 a3-20020aa795a3000000b00540f2323f67sm11403760pfk.95.2022.09.14.21.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 21:32:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] sqlite: Drop sqlite2 recipe
Date: Wed, 14 Sep 2022 21:32:36 -0700
Message-Id: <20220915043236.899718-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915043236.899718-1-raj.khem@gmail.com>
References: <20220915043236.899718-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 04:32:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98812

Last update was in 2005, nothing in meta-openembedded layers need it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 ...-format-not-a-string-literal-warning.patch | 32 ----------
 .../sqlite-2.8.17/mainmk_build_dynamic.patch  | 32 ----------
 .../sqlite/sqlite-2.8.17/mainmk_no_tcl.patch  | 20 ------
 .../sqlite/sqlite-2.8.17/sqlite.pc            | 12 ----
 meta-oe/recipes-dbs/sqlite/sqlite_2.8.17.bb   | 61 -------------------
 6 files changed, 158 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
 delete mode 100644 meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
 delete mode 100644 meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch
 delete mode 100644 meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/sqlite.pc
 delete mode 100644 meta-oe/recipes-dbs/sqlite/sqlite_2.8.17.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 756ba46e34..cd99fb48c9 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -222,7 +222,6 @@ RDEPENDS:packagegroup-meta-oe-dbs ="\
     psqlodbc \
     rocksdb \
     soci \
-    sqlite \
 "
 RDEPENDS:packagegroup-meta-oe-dbs:remove:libc-musl:powerpc = "rocksdb"
 
diff --git a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
deleted file mode 100644
index c5d7c0c81a..0000000000
--- a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 443980ddc82fb40e2e1f9544f2be169bd23dd246 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jun 2017 16:49:24 -0700
-Subject: [PATCH] shell.c:  Fix format not a string literal warning
-
-src/shell.c:695:20: error: format not a string literal and no format arguments [-Werror=format-security]
-|      fprintf(stderr,zHelp);
-|                     ^~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/shell.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/shell.c b/src/shell.c
-index bb46c49..3c6fe0f 100644
---- a/src/shell.c
-+++ b/src/shell.c
-@@ -692,7 +692,7 @@ static int do_meta_command(char *zLine, struct callback_data *p){
-   }else
- 
-   if( c=='h' && strncmp(azArg[0], "help", n)==0 ){
--    fprintf(stderr,zHelp);
-+    fprintf(stderr, "%s", zHelp);
-   }else
- 
-   if( c=='i' && strncmp(azArg[0], "indices", n)==0 && nArg>1 ){
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
deleted file mode 100644
index 914422f1df..0000000000
--- a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_build_dynamic.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-diff -urN sqlite-2.8.17.orig/main.mk sqlite-2.8.17/main.mk
---- sqlite-2.8.17.orig/main.mk	2005-04-23 22:43:23.000000000 +0000
-+++ sqlite-2.8.17/main.mk	2009-04-02 20:10:36.000000000 +0000
-@@ -139,7 +139,7 @@
- # This is the default Makefile target.  The objects listed here
- # are what get build when you type just "make" with no arguments.
- #
--all:	sqlite.h config.h libsqlite.a sqlite$(EXE)
-+all:   sqlite.h config.h libsqlite.so sqlite$(EXE)
- 
- # Generate the file "last_change" which contains the date of change
- # of the most recently modified source code file
-@@ -148,13 +148,12 @@
- 	cat $(SRC) | grep '$$Id: ' | sort +4 | tail -1 \
-           | awk '{print $$5,$$6}' >last_change
- 
--libsqlite.a:	$(LIBOBJ)
--	$(AR) libsqlite.a $(LIBOBJ)
--	$(RANLIB) libsqlite.a
--
--sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.a sqlite.h
--	$(TCCX) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.c \
--		libsqlite.a $(LIBREADLINE) $(THREADLIB)
-+libsqlite.so:	$(LIBOBJ)
-+	$(CC) $(LDFLAGS) -shared -o libsqlite.so -Wl,-soname,libsqlite.so.0 $(LIBOBJ)
-+
-+sqlite$(EXE):	$(TOP)/src/shell.c libsqlite.so sqlite.h
-+	$(TCCX) $(LDFLAGS) $(READLINE_FLAGS) -o sqlite$(EXE) $(TOP)/src/shell.c \
-+		-lsqlite $(LIBREADLINE) $(THREADLIB)
- 
- sqlite_analyzer$(EXE):	$(TOP)/src/tclsqlite.c libsqlite.a $(TESTSRC) \
- 			$(TOP)/tool/spaceanal.tcl
diff --git a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch
deleted file mode 100644
index b84b6486ef..0000000000
--- a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/mainmk_no_tcl.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -bur sqlite-2.8.17~orig/main.mk sqlite-2.8.17/main.mk
---- sqlite-2.8.17~orig/main.mk	2006-02-13 04:09:33.000000000 -0600
-+++ sqlite-2.8.17/main.mk	2006-02-13 04:15:42.000000000 -0600
-@@ -58,7 +58,7 @@
-          expr.o func.o hash.o insert.o \
-          main.o opcodes.o os.o pager.o parse.o pragma.o printf.o random.o \
-          select.o table.o tokenize.o trigger.o update.o util.o \
--         vacuum.o vdbe.o vdbeaux.o where.o tclsqlite.o
-+         vacuum.o vdbe.o vdbeaux.o where.o
- 
- # All of the source code files.
- #
-@@ -91,7 +91,6 @@
-   $(TOP)/src/sqlite.h.in \
-   $(TOP)/src/sqliteInt.h \
-   $(TOP)/src/table.c \
--  $(TOP)/src/tclsqlite.c \
-   $(TOP)/src/tokenize.c \
-   $(TOP)/src/trigger.c \
-   $(TOP)/src/update.c \
diff --git a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/sqlite.pc b/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/sqlite.pc
deleted file mode 100644
index 6bc742eecb..0000000000
--- a/meta-oe/recipes-dbs/sqlite/sqlite-2.8.17/sqlite.pc
+++ /dev/null
@@ -1,12 +0,0 @@
-# Package Information for pkg-config
-
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: SQLite
-Description: SQL database engine
-Version: 2.8.17
-Libs: -L${libdir} -lsqlite
-Cflags: -I${includedir}
diff --git a/meta-oe/recipes-dbs/sqlite/sqlite_2.8.17.bb b/meta-oe/recipes-dbs/sqlite/sqlite_2.8.17.bb
deleted file mode 100644
index bb62afab48..0000000000
--- a/meta-oe/recipes-dbs/sqlite/sqlite_2.8.17.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-SUMMARY = "An Embeddable SQL Database Engine"
-HOMEPAGE = "http://www.sqlite.org/"
-SECTION = "libs"
-DEPENDS = "readline ncurses"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=10;md5=e98469a8efa024a38ad5b2e4b92f4a96"
-
-PR = "r7"
-
-SRC_URI = "http://www.hwaci.com/sw/sqlite/sqlite-${PV}.tar.gz \
-           file://mainmk_build_dynamic.patch \
-           file://mainmk_no_tcl.patch \
-           file://sqlite.pc \
-           file://0001-shell.c-Fix-format-not-a-string-literal-warning.patch \
-           "
-
-SOURCES = "attach.o auth.o btree.o btree_rb.o build.o copy.o date.o delete.o \
-           expr.o func.o hash.o insert.o main.o opcodes.o os.o pager.o \
-           parse.o pragma.o printf.o random.o select.o table.o tokenize.o \
-           trigger.o update.o util.o vacuum.o vdbe.o vdbeaux.o where.o"
-
-inherit autotools pkgconfig
-
-do_configure() {
-    echo "main.mk is patched, no need to configure"
-    # make pkgconfig.bbclass pick this up
-    cp ${WORKDIR}/sqlite.pc ${S}
-}
-
-do_compile() {
-    oe_runmake -f ${S}/Makefile.linux-gcc \
-             TOP="${S}" \
-             BCC="${BUILD_CC}" \
-             TCC="${CC}" \
-             OPTS="-fPIC -D'INTPTR_TYPE=int'" \
-             TCL_FLAGS= LIBTCL= \
-             READLINE_FLAGS="-DHAVE_READLINE=1 -I${STAGING_INCDIR}" \
-             LIBREADLINE="-L. -L${STAGING_LIBDIR} -lreadline -lncurses"
-}
-
-do_install() {
-    install -d ${D}${libdir} ${D}${bindir}
-    install sqlite ${D}${bindir}
-    install -m 0755 libsqlite.so ${D}${libdir}/libsqlite.so.0.8.6
-    ln -sf libsqlite.so.0.8.6 ${D}${libdir}/libsqlite.so
-    ln -sf libsqlite.so.0.8.6 ${D}${libdir}/libsqlite.so.0
-    ln -sf libsqlite.so.0.8.6 ${D}${libdir}/libsqlite.so.0.8
-    install -d ${D}${includedir}
-    install -m 0644 sqlite.h ${D}${includedir}/sqlite.h
-    install -d ${D}${libdir}/pkgconfig
-    install -m 0644 ${S}/sqlite.pc ${D}${libdir}/pkgconfig/sqlite.pc
-}
-
-PACKAGES += "${PN}-bin"
-FILES:${PN}-bin = "${bindir}/*"
-FILES:${PN} = "${libdir}/*.so.*"
-
-SRC_URI[md5sum] = "838dbac20b56d2c4292e98848505a05b"
-SRC_URI[sha256sum] = "3f35ebfb67867fb5b583a03e480f900206af637efe7179b32294a6a0cf806f37"
-
-BBCLASSEXTEND = "native"
-- 
2.37.3


