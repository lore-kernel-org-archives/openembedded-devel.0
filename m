Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtxsO-00066e-5f
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:22:56 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so1462221bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=U20Bs3vfLS/N/yrU4DnS5pSZP9Vsx5InxA/IYjOkWXI=;
	b=hTpu2V7aht7Xlaac9PHro77a9cP8VqbBExhxjxl8BLp0MNr9rRirgNX0db0/5+TLPi
	GU5wKAQzrf9Wt3M54M6C8K1wawnTrunhTFdds/fZncpQG+gYwQuP6THyNhsz3ZkRv8Ae
	488JDoVe69edQCqMWFytieYDpbe2p7Jl8zutM=
Received: by 10.204.233.76 with SMTP id jx12mr194276bkb.71.1313655499220;
	Thu, 18 Aug 2011 01:18:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a3sm643145bkd.2.2011.08.18.01.18.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:18:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2011 10:18:06 +0200
Message-Id: <30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
References: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1313655444.git.Martin.Jansa@gmail.com>
References: <cover.1313655444.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] e-wm: remove SHR specific patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2011 08:22:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/e-wm/wizard-module-skipping.patch          |   63 --------------------
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    4 -
 2 files changed, 0 insertions(+), 67 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch

diff --git a/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch b/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch
deleted file mode 100644
index d124325..0000000
--- a/meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Index: e/src/modules/wizard/Makefile.am
-===================================================================
---- e/src/modules/wizard/Makefile.am	(revision 43860)
-+++ e/src/modules/wizard/Makefile.am	(working copy)
-@@ -6,7 +6,7 @@
- files_DATA = \
- e-module-$(MODULE).edj module.desktop
- 
--EXTRA_DIST = $(files_DATA) page_040.c page_050.c page_060.c
-+EXTRA_DIST = $(files_DATA) page_030.c page_040.c page_050.c page_060.c page_070.c page_080.c
- 
- # the module .so file
- INCLUDES               = -I. \
-@@ -21,9 +21,6 @@
-                          page_000.la \
-                          page_010.la \
-                          page_020.la \
--                         page_030.la \
--                         page_070.la \
--                         page_080.la \
-                          page_200.la
- 
- ### disabled because profile selector really does the job. code here just for
-@@ -60,10 +57,10 @@
- page_020_la_DEPENDENCIES = $(top_builddir)/config.h
- 
- #Choose Menus
--page_030_la_SOURCES      = page_030.c
--page_030_la_LIBADD       = @e_libs@ @dlopen_libs@
--page_030_la_LDFLAGS      = -module -avoid-version
--page_030_la_DEPENDENCIES = $(top_builddir)/config.h
-+#page_030_la_SOURCES      = page_030.c
-+#page_030_la_LIBADD       = @e_libs@ @dlopen_libs@
-+#page_030_la_LDFLAGS      = -module -avoid-version
-+#page_030_la_DEPENDENCIES = $(top_builddir)/config.h
- 
- #page_040_la_SOURCES      = page_040.c
- #page_040_la_LIBADD       = @e_libs@ @dlopen_libs@
-@@ -81,16 +78,16 @@
- #page_060_la_DEPENDENCIES = $(top_builddir)/config.h
- 
- #Choose appliactions
--page_070_la_SOURCES      = page_070.c
--page_070_la_LIBADD       = @e_libs@ @dlopen_libs@
--page_070_la_LDFLAGS      = -module -avoid-version
--page_070_la_DEPENDENCIES = $(top_builddir)/config.h
-+#page_070_la_SOURCES      = page_070.c
-+#page_070_la_LIBADD       = @e_libs@ @dlopen_libs@
-+#page_070_la_LDFLAGS      = -module -avoid-version
-+#page_070_la_DEPENDENCIES = $(top_builddir)/config.h
- 
- #Choose quick launch
--page_080_la_SOURCES      = page_080.c
--page_080_la_LIBADD       = @e_libs@ @dlopen_libs@
--page_080_la_LDFLAGS      = -module -avoid-version
--page_080_la_DEPENDENCIES = $(top_builddir)/config.h
-+#page_080_la_SOURCES      = page_080.c
-+#page_080_la_LIBADD       = @e_libs@ @dlopen_libs@
-+#page_080_la_LDFLAGS      = -module -avoid-version
-+#page_080_la_DEPENDENCIES = $(top_builddir)/config.h
- 
- page_200_la_SOURCES      = page_200.c
- page_200_la_LIBADD       = @e_libs@ @dlopen_libs@
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 9272aab..38257b5 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -16,10 +16,6 @@ SRC_URI = "\
   file://applications.menu \
 "
 
-SRC_URI_append_shr = " \
-  file://wizard-module-skipping.patch \
-"
-
 EXTRA_OECONF = "\
   --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
   --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-- 
1.7.6



