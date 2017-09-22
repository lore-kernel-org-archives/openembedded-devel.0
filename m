Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A89AA78357
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:23:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i130so4496518pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c4oMC6d0TK1DRBNIWallo3bwXpz2YqzFVHusg/Yfcpc=;
	b=Sq6BeyuMBvlxTJrj+NV5D94x8kGiRUk0t+cwqIklKbIEsTlrITtgN1PB39Azak59L2
	jSWqeJMoum37YsAj6oYqw+EAvHcMcBFonN0qoL4+9eqzhgRv886wjtQDI/s/XSjUSXD7
	Nrf/BRaNVgLJcOpIiPz0gHmXR9PYz/DhHdhrh1Dfeoc5Q9S6ekYV/JSeTuGj6vQLiJzn
	CJSU+5LUpLbl9+2JiCr4Utdj2wjUJcGvP4i5oNo2ULVFaURy0CCnKc3lw6IdHkPBZI74
	xph965VrTu4xwnJrfnnfYeON/25WGtEgIMfz0UYaFKwX+MXoFz8DMf12UeRembdFt9dy
	1F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c4oMC6d0TK1DRBNIWallo3bwXpz2YqzFVHusg/Yfcpc=;
	b=XUKsUlOJNSjtbC5wOnIpDukJiElerhMutJ5WM9oGiUhTRV7cU6Wk7vjCFHnQ9NptW7
	x2HCVtDdxiCkSGBQupx+dXg71wtDIAILIWm/rc+URVcPKSc0hXP4ctW0A96G5HaVa1HC
	I9mkRyJtBBnEEpNapsAmDeghqmH2mE1XxgmoHEUMHParS+B2Q102oX3i65NiiROJMk7F
	E/SorvB/v21S5oxShWLkUMH502CafP3yKv4p3AeLSLkfdm1pnBA0TUlu2QtORbJXcFFT
	JBhM+KH799fi6U3ldQDq94LcjC19c3TEoCk8Hntj5rqryBUUMshktgRFmTJLm7QPZNAi
	5NyQ==
X-Gm-Message-State: AHPjjUiGaugSn0NfbjO5kuBujkO9UpYa9XecQ6kDmDbhpbvURIhRwITs
	QlgdBQITVzi/zfKRMSjf7yuQ2w==
X-Google-Smtp-Source: AOwi7QDUn8l7E9mOAnJKuqGn6Of71FCquIDtvb2sZn3So2cQDRSEQb3Brd0QVoOBoft74Hy+yy44Kw==
X-Received: by 10.101.70.138 with SMTP id h10mr7925944pgr.8.1506050611659;
	Thu, 21 Sep 2017 20:23:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o79sm4517921pfi.108.2017.09.21.20.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 20:23:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 20:23:15 -0700
Message-Id: <20170922032316.18616-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922032316.18616-1-raj.khem@gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V3 6/7] leveldb: Fix parallel build
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
X-List-Received-Date: Fri, 22 Sep 2017 03:23:30 -0000

Add build parallelism, since we do not use oe_runmake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V3: Fix parallel build

 .../leveldb/0001-Makefile-Fix-parallel-build.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
new file mode 100644
index 000000000..5068654e2
--- /dev/null
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-Makefile-Fix-parallel-build.patch
@@ -0,0 +1,35 @@
+From c85978e77725ef233543370d24e23f853f449170 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Sep 2017 17:47:02 -0700
+Subject: [PATCH] Makefile: Fix parallel build
+
+Sometimes mkdir $(SHARED_OUTDIR)/db races with compiler which is
+creating .o file in the same directory $(SHARED_OUTDIR)/db/db_bench.o
+
+Fixes error like
+
+| mkdir out-static
+| mkdir out-shared/db
+| Assembler messages:
+| Fatal error: can't create out-shared/db/db_bench.o: No such file or directory
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -386,7 +386,7 @@ $(STATIC_OUTDIR)/write_batch_test:db/wri
+ $(STATIC_OUTDIR)/memenv_test:$(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS)
+ 	$(XCRUN) $(CXX) $(LDFLAGS) $(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS) -o $@ $(LIBS)
+ 
+-$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
++$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db $(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
+ 	$(XCRUN) $(CXX) $(LDFLAGS) $(CXXFLAGS) $(PLATFORM_SHARED_CFLAGS) $(SHARED_OUTDIR)/db/db_bench.o $(TESTUTIL) $(SHARED_OUTDIR)/$(SHARED_LIB3) -o $@ $(LIBS)
+ 
+ .PHONY: run-shared
diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
index dfe4b459a..8fec89c6f 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
@@ -10,6 +10,7 @@ PV = "1.20+git${SRCPV}"
 SRC_URI = "git://github.com/google/${BPN}.git \
            file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
            file://0002-makefile-build-SHARED_MEMENVLIB.patch \
+           file://0001-Makefile-Fix-parallel-build.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -19,7 +20,7 @@ inherit utils
 do_compile() {
     # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
     # leveldb makefile variable CFLAGS and broke leveldb build.
-    CFLAGS="${CFLAGS}" make || die
+    CFLAGS="${CFLAGS}" make ${PARALLEL_MAKE}|| die
 }
 
 do_install() {
-- 
2.14.1


