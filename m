Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 00E4C7D71A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 17:24:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45jq1r5ryYz56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 19:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562693072;
	bh=RTFAwwRZuXJcqWk+AzlXvN58wHcfNbs1CjW/f8ak3BE=;
	h=From:To:Subject:Date:From;
	b=HjbPFMl44xhQMY3ubqJTLhzrnOs+ldj9mBrKC/lObCcj2JmnwxfOTkgIt5mnt29VM
	QbfYjpxMvgGYjP0chSv2kRGJ69fd97mEuv/egGT1Di5o2bH2yXovOz9QxZc7jC3aDN
	qyj4JHj+yEFLGQ5ZZvI5/yLRZuVl/Qwp+7rVP4fbTeea55IE/PJzi9bjvTVlRzbmKz
	Omg9Pmzm0NM4+b7tic1w+sxuj+YRhNZf7T9klyGX4Ox5tOiiWem/92Aynd+u/HaGzG
	cFL6HjG1QNK/ULKd5KyvvrULkTWey211KMgM1AirNqDEfsQMjOX9xigEemAM1dO9p0
	eBOMQid5SUyJt0u9sqqnUpeXkW7Yq37bsHeulTGJqcjSBJn1GyMialW4mSoqYAFcmN
	DL7usiLj4VHCsxQ1hByhjO/hlQ39j9PSdwPY9uHIt1xjEForGFWkWbFjv/6zLb2EQD
	HKFoITuyuT0VJPijIeFba3fa1sIr/Yzak36z8Qv2UKxWZXGr14tSjUIziGwZoLO4o5
	4+lfL7mCY4+RkjLmbI3k0/S0xVIqXNOzkmzJvu0ftEiFwae4QGb2xER3BN7g/grsZj
	wH1oiFRLduJ7vJWCh+xj+6DX/7BJsU7hVq+CkWfGbTo0gPXvLq1mgLAL4YGwn8SgHY
	/Mr30Fm/tpbobWExvMhboSmQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jul 2019 20:24:27 +0300
Message-Id: <20190709172427.12247-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Remove obsolete musl patch
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
X-List-Received-Date: Tue, 09 Jul 2019 17:24:33 -0000

Upstream fixed this differently 4 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0002-include-sys-ttydefaults.h.patch      | 35 -------------------
 .../recipes-navigation/gpsd/gpsd_3.18.1.bb    |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0002-include-sys-ttydefaults.h.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0002-include-sys-ttydefaults.h.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0002-include-sys-ttydefaults.h.patch
deleted file mode 100644
index e91e4e9fb..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.18.1/0002-include-sys-ttydefaults.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f221fa959c80b43c65426500a6836a1b5cf6fe0c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 Aug 2016 02:16:12 +0000
-Subject: [PATCH] include sys/ttydefaults.h
-
-This is needed for CTRL definition, as exposed by musl on glibc
-this include file gets pulled indirectly.
-
-/usr/src/debug/gpsd/3.14-r0/gpsd-3.14/gpsmon.c:605: undefined reference to `CTRL'
-clang-3.9: error: linker command failed with exit code 1 (use -v to see invocation)
-scons: *** [gpsmon] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Foreward port to gpsd 3.16
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
----
- gpsmon.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gpsmon.c b/gpsmon.c
-index 89c43ee2..5cc0dabd 100644
---- a/gpsmon.c
-+++ b/gpsmon.c
-@@ -24,6 +24,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/select.h>
-+#include <sys/ttydefaults.h>
- #include <fcntl.h>
- #include <unistd.h>
- 
--- 
-2.12.0
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
index 22097e3aa..5730f3da2 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
@@ -13,7 +13,6 @@ EXTRANATIVEPATH += "chrpath-native"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
-    file://0002-include-sys-ttydefaults.h.patch \
     file://0003-SConstruct-disable-html-and-man-docs-building-becaus.patch \
 "
 SRC_URI[md5sum] = "3b11f26b295010666b1767b308f90bc5"
-- 
2.17.1


