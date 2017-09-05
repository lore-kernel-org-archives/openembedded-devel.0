Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3CCA777CD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 05:46:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a2so1198867pfj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2017 22:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9MiP1wxAc6SgqnoBSLqO6PYdK+VojjF2Pd6RYQIh9Qs=;
	b=sUX9KhxdWftGpbMmN0SWMp2Z7iuG6F9OGY/by0iWM8sPqi+qA3zYAlQgnvo6/v/umY
	JlCu/L1pDufOljwxW775Glzf3nwao36cXvqGCsw/NgDt3AmiMswFgLDMEMXfFd+ogL8d
	BHcYCoMByFuv7d+xa0Iz8ASu8ze1fYTNXCgYs97oHEJbImvwIGPgq8Ek0hxwP0R8Bt3W
	4VVu8B1j7l7wDlVp13O82Cq58YhF7ZG5wzekacF4iA/+9PvMe3Q5Fjn/nO0M0nkrwkQ4
	mYPPbPFKa+DDzwf/XgwQsYKTrKIni1IjSvaHzghJNd5O0NU2IyriaMXxy54XzLXXaPJP
	rh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9MiP1wxAc6SgqnoBSLqO6PYdK+VojjF2Pd6RYQIh9Qs=;
	b=Ovle7C19OH2eZoOLx+pkLoTnHy6de4v5WdH214c+/9zH7eZJGM9Yai75b3b9+0H3P8
	QtxJp5ynhAKc5o1lixb1Il1UqGqGRIvUETy5vWGGUaIR2l5AbiQtUolWbHNG5CwOi2/B
	muGgW3ULiT5nvxu/MD0uPpilv7jpY0bDYD4q97tyQn74aB3KziUTFgAO6AEXcim/SqZ7
	KMIFcW4M0vbplqN5AqzG+v1cmJ/8hqcwNO8Cuth0oREATRb3qSBq+82V+ZyGJa4clRmn
	gbxTbZ1r+v0pMVQ5djXRVQk0u+Isndr11JWZ3/hJVCiiB2GYOTEBC+81iop9oOr8Js1H
	FY8w==
X-Gm-Message-State: AHPjjUg6KG8RIm/5Yf+asPFduh0cQSkifMVzfBxkLfkKP14yAnd11yMS
	Btz23qaAEKBU0jq+
X-Google-Smtp-Source: ADKCNb6JrjMHccqkoNo3ZtT0zrdiMGNxEi5WfIsSA1gEk72Pt8StzkakQ80hViRuO9kXzXieOphHiQ==
X-Received: by 10.84.133.37 with SMTP id 34mr3213123plf.362.1504590389083;
	Mon, 04 Sep 2017 22:46:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	q186sm12203327pga.62.2017.09.04.22.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 22:46:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Sep 2017 22:46:18 -0700
Message-Id: <20170905054618.42430-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] leveldb: Fix build with clang
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
X-List-Received-Date: Tue, 05 Sep 2017 05:46:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...uild_detect_platform-Check-for-__SSE4_2__.patch | 40 ++++++++++++++++++++
 .../0002-makefile-build-SHARED_MEMENVLIB.patch     | 43 ++++++++++++++++++++++
 meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  4 +-
 3 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
 create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
new file mode 100644
index 000000000..a44ff883b
--- /dev/null
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
@@ -0,0 +1,40 @@
+From 5fd0918df2bb30e8f3edb2ee895d178edbf26f40 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 4 Sep 2017 22:38:03 -0700
+Subject: [PATCH 1/2] build_detect_platform: Check for __SSE4_2__
+
+just using -msse4.2 is not enough, especially with clang
+where it may accept -msse4.2 even during cross compiling
+for say arm, however the difference is that builtin defines
+wont be defined.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ build_detect_platform | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build_detect_platform b/build_detect_platform
+index d2a20ce..a06d49e 100755
+--- a/build_detect_platform
++++ b/build_detect_platform
+@@ -224,13 +224,13 @@ EOF
+     rm -f $CXXOUTPUT 2>/dev/null
+ 
+     # Test if gcc SSE 4.2 is supported
+-    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
++    $CXX $CXXFLAGS -x c++ -Werror - -o $CXXOUTPUT -msse4.2 -dD -E 2>/dev/null  <<EOF
+       int main() {}
+ EOF
++    eval fgrep __SSE4_2__ $CXXOUTPUT 2>/dev/null
+     if [ "$?" = 0 ]; then
+         PLATFORM_SSEFLAGS="-msse4.2"
+     fi
+-
+     rm -f $CXXOUTPUT 2>/dev/null
+ fi
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
new file mode 100644
index 000000000..fc708b23a
--- /dev/null
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
@@ -0,0 +1,43 @@
+From 1ed8cec1fcf666904bb3ebd29fc85e235b72d122 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 4 Sep 2017 22:40:49 -0700
+Subject: [PATCH 2/2] makefile: build SHARED_MEMENVLIB
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f7cc7d7..cb42278 100644
+--- a/Makefile
++++ b/Makefile
+@@ -126,12 +126,12 @@ SHARED_VERSION_MINOR = 20
+ SHARED_LIB1 = libleveldb.$(PLATFORM_SHARED_EXT)
+ SHARED_LIB2 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR)
+ SHARED_LIB3 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
+-SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3)
++SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3) $(SHARED_MEMENVLIB)
+ $(SHARED_OUTDIR)/$(SHARED_LIB1): $(SHARED_OUTDIR)/$(SHARED_LIB3)
+ 	ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB1)
+ $(SHARED_OUTDIR)/$(SHARED_LIB2): $(SHARED_OUTDIR)/$(SHARED_LIB3)
+ 	ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB2)
+-SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.a
++SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.$(PLATFORM_SHARED_EXT).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
+ endif
+ 
+ $(SHARED_OUTDIR)/$(SHARED_LIB3): $(SHARED_LIBOBJECTS)
+@@ -294,7 +294,7 @@ endif
+ 
+ $(SHARED_MEMENVLIB):$(SHARED_MEMENVOBJECTS)
+ 	rm -f $@
+-	$(AR) -rs $@ $(SHARED_MEMENVOBJECTS)
++	$(CXX) $(LDFLAGS) $(PLATFORM_SHARED_LDFLAGS)$(basename $(notdir $(SHARED_MEMENVLIB))) $(SHARED_MEMENVOBJECTS) -o $(SHARED_MEMENVLIB) $(LIBS)
+ 
+ $(STATIC_OUTDIR)/db_bench:db/db_bench.cc $(STATIC_LIBOBJECTS) $(TESTUTIL)
+ 	$(CXX) $(LDFLAGS) $(CXXFLAGS) db/db_bench.cc $(STATIC_LIBOBJECTS) $(TESTUTIL) -o $@ $(LIBS)
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
index d44aa14d2..dfe4b459a 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
@@ -8,7 +8,9 @@ SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
 PV = "1.20+git${SRCPV}"
 
 SRC_URI = "git://github.com/google/${BPN}.git \
-"
+           file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
+           file://0002-makefile-build-SHARED_MEMENVLIB.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


