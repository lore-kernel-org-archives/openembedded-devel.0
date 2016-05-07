Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EDEA273CBD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 07:01:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4771ZPt026286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 7 May 2016 00:01:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 7 May 2016 00:01:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 7 May 2016 03:01:26 -0400
Message-ID: <7f6dc847fd922d6ddf1d0923529d858b08e036db.1462603608.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1462603608.git.hongxu.jia@windriver.com>
References: <cover.1462603608.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: koen.kooi@linaro.org
Subject: [PATCH 2/3] efibootmgr: update and unblacklist
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
X-List-Received-Date: Sat, 07 May 2016 07:01:37 -0000
Content-Type: text/plain

From: Koen Kooi <koen.kooi@linaro.org>

Also fix style issues.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb  | 14 +++++++-------
 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch | 17 -----------------
 2 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index 9b611ce..d80c89f 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -10,20 +10,20 @@ DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "https://github.com/rhinstaller/efibootmgr/releases/download/${BP}/${BP}.tar.bz2 \
-           file://ldflags.patch \
+SRCREV = "eb6e36c9064eae256cd60df24a977e3abd87fd16"
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
           "
 
-SRC_URI[md5sum] = "6647f5cd807bc8484135ba74fcbcc39a"
-SRC_URI[sha256sum] = "a66f5850677e86255d93cb1cead04c3c48a823a2b864c579321f2a07f00256e6"
+S = "${WORKDIR}/git"
+
+
+inherit pkgconfig
 
 EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar` \
                  -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR)\" '"
 
 do_install () {
-    install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
+    install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
 }
 
-inherit pkgconfig
 
-PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
diff --git a/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch b/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
deleted file mode 100644
index 0d5594a..0000000
--- a/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Import this patch from meta-linaro.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
---- efibootmgr-0.5.4.orig/Makefile
-+++ efibootmgr-0.5.4/Makefile
-@@ -11,6 +11,8 @@
-   CFLAGS = $(EXTRA_CFLAGS) -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR).$(RELEASE_SUBLEVEL)$(RELEASE_EXTRALEVEL)\" \
- 	    -Wall -g -D_FILE_OFFSET_BITS=64
- 
-+  LDFLAGS += -lz
-+
-   MODULES := src
- 
-   BINDIR := /usr/sbin
-- 
2.8.1


