Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id F26016FC68
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 18:56:47 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x13so1313700wgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wG7gaRGSmW5n80C1r+rtOCWSxdbB9cGnOHLnAPhJtAY=;
	b=KZ828P6QZdR2OQJ+iT4d6BvVS8en4hnMOqh3BiHCxcdn2VJxs+GQ5buyI/RXk1h/bu
	gvWm0KSMn/m2gs126ErudfQVAsXq74VHz2nICauAITXQ55Nd1c+WUSc3ZaXQgLQkUEF8
	cWBbeYRwCyzvXc4QoBTxzqhJsMDbLToBcNOR4uDsqbfESx6tY26OO7op5oyjHNOmpWQb
	b322x0+IfTDCf7+lqgmuImPZwQutchMmhQlHNmS5GDaNivbpR39IviAeajjjoyhPVsxb
	rLVtXXThqPh+jzlHwh0TDfXmM9tTt+tKLMKA2hYrEWMl3m7RI8BMt8FEm6dvUfpIryJD
	GT6g==
X-Received: by 10.194.142.209 with SMTP id ry17mr67014287wjb.57.1412189808391; 
	Wed, 01 Oct 2014 11:56:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ei1sm2762661wib.20.2014.10.01.11.56.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 11:56:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 20:57:39 +0200
Message-Id: <1412189859-11024-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-oe][PATCH] leveldb: import from meta-webos and upgrade
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2014 18:56:56 -0000

* it's needed for newer qtwebkit-5.4

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../leveldb/0001-Explicitly-disable-tcmalloc.patch | 48 ++++++++++++++++++++++
 meta-oe/recipes-extended/leveldb/leveldb_git.bb    | 27 ++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
 create mode 100644 meta-oe/recipes-extended/leveldb/leveldb_git.bb

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
new file mode 100644
index 0000000..4b76dd0
--- /dev/null
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
@@ -0,0 +1,48 @@
+From d6daac04dab4b3acf4b88f16742d1b402cdc3d83 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 1 Oct 2014 18:54:04 +0200
+Subject: [PATCH] Explicitly disable tcmalloc
+
+Without this change leveldb autodetects tcmalloc from sysroot and
+sometimes became dependant on gperftools
+
+Disable autodetection without TCMALLOC_ENABLED=true pased to make
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ build_detect_platform | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/build_detect_platform b/build_detect_platform
+index bb76c4f..a586364 100755
+--- a/build_detect_platform
++++ b/build_detect_platform
+@@ -201,15 +201,17 @@ EOF
+         PLATFORM_LIBS="$PLATFORM_LIBS -lsnappy"
+     fi
+ 
+-    # Test whether tcmalloc is available
+-    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
+-      int main() {}
++    if [ "$TCMALLOC_ENABLED" = "true" ]; then
++        # Test whether tcmalloc is available
++        $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
++          int main() {}
+ EOF
+-    if [ "$?" = 0 ]; then
+-        PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
+-    fi
++        if [ "$?" = 0 ]; then
++            PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
++        fi
+ 
+-    rm -f $CXXOUTPUT 2>/dev/null
++        rm -f $CXXOUTPUT 2>/dev/null
++    fi
+ fi
+ 
+ PLATFORM_CCFLAGS="$PLATFORM_CCFLAGS $COMMON_FLAGS"
+-- 
+2.1.1
+
diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
new file mode 100644
index 0000000..a6a3024
--- /dev/null
+++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "LevelDB is a fast key-value storage library"
+DESCRIPTION = "LevelDB is a fast key-value storage library that provides an ordered mapping from string keys to string values"
+HOMEPAGE = "http://leveldb.googlecode.com"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
+
+SRCREV = "803d69203a62faf50f1b77897310a3a1fcae712b"
+PV = "1.18+git${SRCPV}"
+
+SRC_URI = "git://github.com/google/${BPN}.git \
+    file://0001-Explicitly-disable-tcmalloc.patch \
+"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
+    # leveldb makefile variable CFLAGS and broke leveldb build.
+    CFLAGS="${CFLAGS}" make || die
+}
+
+do_install() {
+    install -d ${D}${libdir}
+    oe_libinstall -C ${S} -so libleveldb ${D}${libdir}
+    install -d ${D}${includedir}/leveldb
+    install -m 644 ${S}/include/leveldb/*.h ${D}${includedir}/leveldb/
+}
-- 
2.1.1


