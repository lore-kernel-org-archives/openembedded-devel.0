Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7231F78A11
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 06:22:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w656M7Tg006924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 23:22:07 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 4 Jul 2018 23:22:06 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Jul 2018 14:22:01 +0800
Message-ID: <1530771721-20959-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530771721-20959-1-git-send-email-yi.zhao@windriver.com>
References: <1530771721-20959-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH 2/2] aufs-util: upgrade 4.4 -> 4.9
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
X-List-Received-Date: Thu, 05 Jul 2018 06:22:06 -0000
Content-Type: text/plain

Drop 0001-libau-Define-STRIP-weakly.patch since it had been merged
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../aufs-util/0001-libau-Define-STRIP-weakly.patch | 37 ----------------------
 .../recipes-utils/aufs-util/aufs-util_git.bb       | 13 ++++----
 2 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch
deleted file mode 100644
index 6732dc4..0000000
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Define-STRIP-weakly.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From daf04dc9ca1f2e4c65ec338ab439e0a792e1a8ac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 5 Sep 2017 10:36:52 -0700
-Subject: [PATCH] libau: Define STRIP weakly
-
-STRIP can be set on environment to use cross version of strip utility
-hardcoding to strip is not working in cross environment
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- libau/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libau/Makefile b/libau/Makefile
-index 81520ac..c25eef2 100644
---- a/libau/Makefile
-+++ b/libau/Makefile
-@@ -25,6 +25,7 @@ LibSoHdr = libau.h rdu.h
- LibSoExport = $(addsuffix .exp, $(basename ${LibSoObj}))
- LibSoExportErr = $(addsuffix .err, ${LibSoExport})
- LibSoVerScript = verscript
-+STRIP ?= strip
- 
- all: ${LibSo}
- 
-@@ -77,7 +78,7 @@ ${LibSo}.${LibSoMajor}.${LibSoMinor}: ${LibSoObj}
- 	${CC} --shared -Wl,-soname,${LibSo}.${LibSoMajor} \
- 		-Wl,--version-script,${LibSoVerScript} \
- 		${LDFLAGS} -o $@ $^ ${LDLIBS}
--	strip -R EXP $@
-+	${STRIP} -R EXP $@
- #	readelf --syms --use-dynamic libau.so
- 
- install_ulib: File = ${LibSo}.${LibSoMajor}.${LibSoMinor}
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 64eb940..cdee11e 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -7,19 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 DEPENDS = "coreutils-native aufs-util-native"
 DEPENDS_class-native = ""
 
-SRCREV = "89afb1806c3d2eed8db2666ae254b77518ae3ceb"
-SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs4.4 \
-           https://raw.githubusercontent.com/sfjro/aufs4-linux/aufs4.4/include/uapi/linux/aufs_type.h;name=aufs_type \
+SRCREV = "568636e5c45006b1e6e0c4b704401610a02c0089"
+SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs4.9 \
+           https://raw.githubusercontent.com/sfjro/aufs4-linux/aufs4.9/include/uapi/linux/aufs_type.h;name=aufs_type \
            file://aufs-util-don-t-strip-executables.patch \
            file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
-           file://0001-libau-Define-STRIP-weakly.patch \
 "
-SRC_URI[aufs_type.md5sum] = "f7b4a255dcb55fe7b0967f5f59b44f19"
-SRC_URI[aufs_type.sha256sum] = "85bc8e4c1a94a7d526c382e4b047b4256cab8c4a65fc0396291707ad9a327a18"
+SRC_URI[aufs_type.md5sum] = "b37129ef0703de72a852db7e48bdedc6"
+SRC_URI[aufs_type.sha256sum] = "7ff6566adb9c7a3b6862cdc85a690ab546f1d0bc81ddd595fd663c0a69031683"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-PV = "4.4+git${SRCPV}"
+PV = "4.9+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


