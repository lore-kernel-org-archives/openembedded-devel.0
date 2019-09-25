Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7C97E3B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 13:26:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8PDPiwi025841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 06:25:54 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 25 Sep 2019 06:25:33 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 09:25:33 -0400
Message-ID: <20190925132533.6804-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] haveged: upgrade v1.9.4 -> v1.9.6
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
X-List-Received-Date: Wed, 25 Sep 2019 13:26:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Both of the patches used in v1.9.4 have been incorporated in v1.9.6,
so they are no longer required - see upstream commits ceab89ad and
f2193587.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../fix-cpu-cache-size-detection.patch        | 20 ------------
 ...d-Makefile.am-add-missing-dependency.patch | 32 -------------------
 .../{haveged_1.9.4.bb => haveged_1.9.6.bb}    |  6 ++--
 3 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch
 delete mode 100644 meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.4.bb => haveged_1.9.6.bb} (88%)

diff --git a/meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch b/meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch
deleted file mode 100644
index 5b68f1966..000000000
--- a/meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Some ARM cpus does not report the cache size or say it is -1
-
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=866306
-
-Upstream-status: Pending
-
-Index: haveged-1.9.2/src/havegetune.c
-===================================================================
---- haveged-1.9.2.orig/src/havegetune.c
-+++ haveged-1.9.2/src/havegetune.c
-@@ -795,6 +795,9 @@ static int vfs_configInfoCache(
-          ctype = vfs_configFile(pAnchor, path, vfs_configType);
-          strcpy(path+plen, "size");
-          size  = vfs_configFile(pAnchor, path, vfs_configInt);
-+         if (size == -1) {
-+             size = ctype == 'I' ? GENERIC_ICACHE : GENERIC_DCACHE;
-+         }
-          cfg_cacheAdd(pAnchor, SRC_VFS_INDEX,  pArgs[1], level, ctype, size);
-          }
-      }
diff --git a/meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch b/meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch
deleted file mode 100644
index 020ac2c3b..000000000
--- a/meta-oe/recipes-extended/haveged/haveged/haveged-init.d-Makefile.am-add-missing-dependency.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b04eeea777df32364df74bd63fc5b7fb05d21c8d Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 27 Mar 2018 10:21:09 +0800
-Subject: [PATCH] init.d/Makefile.am: add missing dependency
-
-install-data-hook should depend on install-exec-hook, or the
-haveged.service might be installed incorrectly when build
-with -j option.
-
-Upstream-Status: Submitted [https://github.com/jirka-h/haveged/pull/13]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-Signed-off-by: Khem Raj raj.khem@gmail.com
----
- init.d/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/init.d/Makefile.am b/init.d/Makefile.am
-index 5940f78..07bcdf7 100644
---- a/init.d/Makefile.am
-+++ b/init.d/Makefile.am
-@@ -33,7 +33,7 @@ if ENABLE_SYSTEMD
- install-exec-hook:
- 	$(do_subst) < $(srcdir)/$(src_tmpl) > haveged.service;
-
--install-data-hook:
-+install-data-hook: install-exec-hook
- if ENABLE_SYSTEMD_LOOKUP
- 	install -p -D -m644 haveged.service $(DESTDIR)`pkg-config --variable=systemdsystemunitdir systemd`/haveged.service;
- else
---
-2.11.0
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
similarity index 88%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
index d0e1a29dd..0189e19c0 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
@@ -5,11 +5,9 @@ HOMEPAGE = "http://www.issihosts.com/haveged/index.html"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-# v1.9.4
-SRCREV = "faa40ff345af194d3253f5fb030403e3c9831c36"
+# v1.9.6
+SRCREV = "1470a82a7f79110c79beea1ca5f2d3b0fd1a4668"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
-           file://haveged-init.d-Makefile.am-add-missing-dependency.patch \
-           file://fix-cpu-cache-size-detection.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.21.0


