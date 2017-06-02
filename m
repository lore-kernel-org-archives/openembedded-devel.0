Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8E37D77794
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:50:29 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id e193so48728202pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oq0iVMLePYcJ0qOJgw+CQH7fhbUloSG6RCUbhzm19PA=;
	b=PLwuyS87+ADe26631aZaSENJFhS8bFWfoLXDw24srJdTb84x3TQxzlTFB9sz4gMcY4
	52ed/gOF7+WOthGqkgUE4Zt6SVjJL8R3gTGQHQ8hve+rai83z8EVZPs04CEcYcqO/3wN
	SpoRvTB5jMg0tzLTEuEz63Ta74xC63cgfMGs0tRyNkbL1gcB/ykwWdHpWFQ6JltcE1sa
	OEgdpdn6hntVBP1EndFPvdTgbaGa1Arcb4p79K42p98QlW5fbjhnf1dsBSEFwuHQh4fb
	95bMxtD2YOZTzPYx92hOdDl9G6KwUup5du6gZ2xjiwnvRtrrffsXYoNia2OHsiVXRfiZ
	A/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oq0iVMLePYcJ0qOJgw+CQH7fhbUloSG6RCUbhzm19PA=;
	b=KkV2laJlpUTn0U9G5YAEIuBxC6NCz6odECvP88jgGyYzEOOv2F0mija/9JOgNsXGOP
	q4kwg6y5NzTlNO9rUfqDVtuVFosV2ClHa6VOOAcgea72YZicb04e495tE/TU68WvCo5h
	CmIRyuGDTDMhFpVBnOnhg5AV+x3tOKyVXdSjbBZoEJHzl0W/CaHNduyqWlbCxd5OZoVw
	hNZtFw8lP2mR0eahsNEot/z2MPtG3aI8/S56bFFKif82dcjIMDRNbo0zLjBCcG7nhfCu
	Whk/PG2PxVdpfH4/pmU0xg6OSdNJq9nIeReOkRdJg7FtVbdSRvWI8c3c8foLrmVbtZsJ
	GfXg==
X-Gm-Message-State: AODbwcDDW1NXeoehebCACesZgT4AF47cBcIvC+KpVzyGkMNhFIV65xa+
	FI3QMRzF3AGh1bvm
X-Received: by 10.99.2.84 with SMTP id 81mr5534899pgc.19.1496386230291;
	Thu, 01 Jun 2017 23:50:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	a78sm43177369pfk.122.2017.06.01.23.50.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 23:50:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 23:50:14 -0700
Message-Id: <20170602065016.27954-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170602065016.27954-1-raj.khem@gmail.com>
References: <20170602065016.27954-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] leveldb: Update to 1.20
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
X-List-Received-Date: Fri, 02 Jun 2017 06:50:29 -0000

package tests into a seprate package
package static libs as well
Update also fixes build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../leveldb/0001-Explicitly-disable-tcmalloc.patch | 48 ----------------------
 meta-oe/recipes-extended/leveldb/leveldb_git.bb    | 19 ++++++---
 2 files changed, 13 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
deleted file mode 100644
index 4b76dd0c3..000000000
--- a/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d6daac04dab4b3acf4b88f16742d1b402cdc3d83 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 1 Oct 2014 18:54:04 +0200
-Subject: [PATCH] Explicitly disable tcmalloc
-
-Without this change leveldb autodetects tcmalloc from sysroot and
-sometimes became dependant on gperftools
-
-Disable autodetection without TCMALLOC_ENABLED=true pased to make
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- build_detect_platform | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/build_detect_platform b/build_detect_platform
-index bb76c4f..a586364 100755
---- a/build_detect_platform
-+++ b/build_detect_platform
-@@ -201,15 +201,17 @@ EOF
-         PLATFORM_LIBS="$PLATFORM_LIBS -lsnappy"
-     fi
- 
--    # Test whether tcmalloc is available
--    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
--      int main() {}
-+    if [ "$TCMALLOC_ENABLED" = "true" ]; then
-+        # Test whether tcmalloc is available
-+        $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
-+          int main() {}
- EOF
--    if [ "$?" = 0 ]; then
--        PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
--    fi
-+        if [ "$?" = 0 ]; then
-+            PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
-+        fi
- 
--    rm -f $CXXOUTPUT 2>/dev/null
-+        rm -f $CXXOUTPUT 2>/dev/null
-+    fi
- fi
- 
- PLATFORM_CCFLAGS="$PLATFORM_CCFLAGS $COMMON_FLAGS"
--- 
-2.1.1
-
diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
index a6a302430..d44aa14d2 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
@@ -4,15 +4,16 @@ HOMEPAGE = "http://leveldb.googlecode.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
 
-SRCREV = "803d69203a62faf50f1b77897310a3a1fcae712b"
-PV = "1.18+git${SRCPV}"
+SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
+PV = "1.20+git${SRCPV}"
 
 SRC_URI = "git://github.com/google/${BPN}.git \
-    file://0001-Explicitly-disable-tcmalloc.patch \
 "
 
 S = "${WORKDIR}/git"
 
+inherit utils
+
 do_compile() {
     # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
     # leveldb makefile variable CFLAGS and broke leveldb build.
@@ -20,8 +21,14 @@ do_compile() {
 }
 
 do_install() {
-    install -d ${D}${libdir}
-    oe_libinstall -C ${S} -so libleveldb ${D}${libdir}
-    install -d ${D}${includedir}/leveldb
+    install -d ${D}${libdir} ${D}${bindir} ${D}${includedir}/leveldb
+    oe_libinstall -C ${B}/out-shared libleveldb ${D}${libdir}
+    oe_libinstall -C ${S}/out-static libleveldb ${D}${libdir}
+    oe_libinstall -C ${S}/out-static libmemenv ${D}${libdir}
+    install -m 0755 ${B}/out-shared/db_bench ${D}${bindir}
+    install -m 0755 ${B}/out-static/*_test ${D}${bindir}
     install -m 644 ${S}/include/leveldb/*.h ${D}${includedir}/leveldb/
 }
+
+PACKAGES =+ "${PN}-ptest"
+FILES_${PN}-ptest = "${bindir}"
-- 
2.13.0


