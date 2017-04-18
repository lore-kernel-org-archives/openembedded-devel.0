Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7527371B50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:18 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id g2so479979pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xVoI4YNd7IHbQHleUUiCw8X7BbROX5TTMyq3BhiufMk=;
	b=YABtNC4vP6xLDD5fDSihVY6acaVTpQC3nEIPrZ4SekbXmSECdO7Bjfb83QXYXu3VOn
	r3RKu+5eQVu5paO7yj0Phla57JUEz1U4NcOW2N2aa/DmCx3Vxi8hkjVF8+MvqGlMZhDY
	3Ez4sfeaAjDbldsGb9Tb04r8RE5woZJVIc+VY8ieuecKtkDEb8JOcYqmOs5Hn/ykW0bd
	X/gS7tiW6vpENKUSCT8GoSh3PDS4xfuTVvweDDqsaYBvhxtsfhPVUS1TzGprQzhm4+wB
	69pS5SFfi5eW/98fNj3+dl0+DiWUmwgBhY6T265VCHBKc5gqwE2NT3E9R353OyER/vD7
	WIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xVoI4YNd7IHbQHleUUiCw8X7BbROX5TTMyq3BhiufMk=;
	b=XFDzDjCGZk4pqjUESsNlvJ/0Gq+Ewv0o/wkd422A1laqrqZw1lruG0nc33crKxkEo/
	gpcoRysfS+xVFsUNgzizQ6oqUYl/hwlyamDVw8crgb8Yx02h5hFOOvwbPtz6ymz7OCig
	oTKCE7K/3opYdxQOLemYTBS2WbmRW2PlpqxcG9yEdiIULZnvbENWqgTEHkTwH5T+tcqh
	/Ttu0+zzggVYc4w99J7BBUNc+OIlhlPb7Eo395/svIuWIvC3WZkzOxUhZKMajlsztxod
	Y8Lu9fmZjQFKhAf541qLQjJLeygesRohc5Zdux+970z+xZpR4VdbJaUCgliIx2piQ9VM
	V9rw==
X-Gm-Message-State: AN3rC/7a34YxytUAJQDQajJFQOMLb0rtWqlIskcEIx5qP5Y6CR/+weIf
	oOwDiR2y0dltFJ2m
X-Received: by 10.99.152.87 with SMTP id l23mr18292724pgo.59.1492539740188;
	Tue, 18 Apr 2017 11:22:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:28 -0700
Message-Id: <20170418182142.27253-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 18/32] avro-c: Fix build with clang
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:19 -0000

Update SRC_URI to point to github mirror
Add a patch to fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-avro-c-Fix-build-with-clang-compiler.patch | 37 ++++++++++++++++++++++
 meta-oe/recipes-support/avro/avro-c_1.8.1.bb       | 10 +++---
 2 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch b/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
new file mode 100644
index 000000000..01235d8ef
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
@@ -0,0 +1,37 @@
+From 518bb8ccfb3f3fc143fbd571782f3e40573d01b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Apr 2017 09:15:04 -0700
+Subject: [PATCH] avro-c: Fix build with clang compiler
+
+Clang advertizes itself to be compatible with gcc 4.2.1
+while that was true several years ago, it now supports
+a lot more newer features, the test to just check gcc
+version should be supplanted with clang check as well
+so atomic support in clang can be asserted as well
+
+Fixes
+
+lang/c/src/avro/refcount.h:301:2: error: "No atomic implementation!"
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lang/c/src/avro/refcount.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lang/c/src/avro/refcount.h b/lang/c/src/avro/refcount.h
+index 69afa4fc..d76ba057 100644
+--- a/lang/c/src/avro/refcount.h
++++ b/lang/c/src/avro/refcount.h
+@@ -118,7 +118,8 @@ avro_refcount_dec(volatile int *refcount)
+  * GCC intrinsics
+  */
+ 
+-#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500
++#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500 \
++|| defined(__clang__)
+ 
+ static inline void
+ avro_refcount_set(volatile int *refcount, int value)
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
index 8deee4b23..276fe2b5a 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
@@ -2,16 +2,18 @@ SUMMARY = "Apache Avro data serialization system."
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 
-
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
 
 DEPENDS = "jansson zlib xz"
+PV .= "+git${SRCPV}"
 
-SRC_URI = "${APACHE_MIRROR}/avro/avro-${PV}/c/avro-c-${PV}.tar.gz"
+SRCREV = "4b3677c32b879e0e7f717eb95f9135ac654da760"
+SRC_URI = "git://github.com/apache/avro \
+           file://0001-avro-c-Fix-build-with-clang-compiler.patch;patchdir=../../ \
+"
 
-SRC_URI[md5sum] = "b268348536714541e10411823a1b59b0"
-SRC_URI[sha256sum] = "e5042088fa47e1aa2860c5cfed0bd061d81f9e96628f8b4d87a24d9b8c5e4ecc"
+S = "${WORKDIR}/git/lang/c"
 
 LDFLAGS_append_libc-uclibc = " -lm"
 
-- 
2.12.2


