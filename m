Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 532157E25A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2019 07:31:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x547V7ff011909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Jun 2019 00:31:07 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 00:31:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 4 Jun 2019 15:31:04 +0800
Message-ID: <1559633465-4558-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] postgresql: improve reproducibility
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
X-List-Received-Date: Tue, 04 Jun 2019 07:31:07 -0000
Content-Type: text/plain

- Make pg_config not record var-CC, var-CFLAGS, and configure
  which contains build paths

- Split pgxs in which Makefile.global contains build path from
  package postgresql to postgresql-server-dev, it refers ubuntu
Here is we got from Ubuntu 18.04
$ dpkg -c /var/cache/apt/archives/postgresql-server-dev-10_10.8-0ubuntu0.18.04.1_amd64.deb
-rwxr-xr-x root/root     30792 2019-05-07 17:20 ./usr/lib/postgresql/10/bin/pg_config
drwxr-xr-x root/root         0 2019-05-07 17:20 ./usr/lib/postgresql/10/lib/
drwxr-xr-x root/root         0 2019-05-07 17:20 ./usr/lib/postgresql/10/lib/pgxs/
drwxr-xr-x root/root         0 2019-05-07 17:20 ./usr/lib/postgresql/10/lib/pgxs/config/
drwxr-xr-x root/root         0 2019-05-07 17:20 ./usr/lib/postgresql/10/lib/pgxs/src/
-rw-r--r-- root/root     31309 2019-05-07 17:20 ./usr/lib/postgresql/10/lib/pgxs/src/Makefile.global

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-Improve-reproducibility.patch       | 39 ++++++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc      |  4 ++-
 meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb  |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
new file mode 100644
index 0000000..32b7f42
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
@@ -0,0 +1,39 @@
+From 3c13315447fa175da6c9ebe59a039e611cdb5bd1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 4 Jun 2019 13:45:30 +0800
+Subject: [PATCH] Improve reproducibility,
+
+Remove build patch from binaries which pg_config do
+not record var-CC, var-CFLAGS, and configure
+
+$ /usr/bin/pg_config --cc
+not recorded
+
+$ /usr/bin/pg_config --configure
+not recorded
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/common/Makefile | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/common/Makefile b/src/common/Makefile
+index 1fc2c66..5e6c457 100644
+--- a/src/common/Makefile
++++ b/src/common/Makefile
+@@ -27,10 +27,6 @@ include $(top_builddir)/src/Makefile.global
+ # don't include subdirectory-path-dependent -I and -L switches
+ STD_CPPFLAGS := $(filter-out -I$(top_srcdir)/src/include -I$(top_builddir)/src/include,$(CPPFLAGS))
+ STD_LDFLAGS := $(filter-out -L$(top_builddir)/src/common -L$(top_builddir)/src/port,$(LDFLAGS))
+-override CPPFLAGS += -DVAL_CONFIGURE="\"$(configure_args)\""
+-override CPPFLAGS += -DVAL_CC="\"$(CC)\""
+-override CPPFLAGS += -DVAL_CPPFLAGS="\"$(STD_CPPFLAGS)\""
+-override CPPFLAGS += -DVAL_CFLAGS="\"$(CFLAGS)\""
+ override CPPFLAGS += -DVAL_CFLAGS_SL="\"$(CFLAGS_SL)\""
+ override CPPFLAGS += -DVAL_LDFLAGS="\"$(STD_LDFLAGS)\""
+ override CPPFLAGS += -DVAL_LDFLAGS_EX="\"$(LDFLAGS_EX)\""
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 6e20231..0fe5d58 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -280,7 +280,9 @@ FILES_${PN}-timezone = "${datadir}/${BPN}/timezone \
     ${datadir}/${BPN}/timezonesets \
 "
 RDEPENDS_${PN} += "${PN}-timezone"
-FILES_${PN}-server-dev = "${includedir}/${BPN}/server"
+FILES_${PN}-server-dev = "${includedir}/${BPN}/server \
+                          ${libdir}/${BPN}/pgxs \
+"
 
 FILES_libecpg = "${libdir}/libecpg*${SOLIBS}"
 FILES_libecpg-dev = "${libdir}/libecpg*${SOLIBSDEV} \
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
index ff9306c..a18eca3 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=87da2b84884860b71f5f24ab37e7da78"
 SRC_URI += "\
    file://not-check-libperl.patch \
    file://0001-Add-support-for-RISC-V.patch \
+   file://0001-Improve-reproducibility.patch \
 "
 
 SRC_URI[md5sum] = "c2a729b754b8de86a969c86ec25db076"
-- 
2.7.4


