Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFEDF7307F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:14:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8PDEDeP010351
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Sep 2018 06:14:13 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 06:14:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 25 Sep 2018 21:24:12 +0800
Message-ID: <1537881852-14022-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537881550-13954-4-git-send-email-hongxu.jia@windriver.com>
References: <1537881550-13954-4-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking V2][PATCH 4/4] crda: use gcrypt as default crypt
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
X-List-Received-Date: Tue, 25 Sep 2018 13:14:12 -0000
Content-Type: text/plain

As Makefile told us, if `USE_OPENSSL=1', only openssl10 works,
even though the recipe depends libgcrypt.
[Makefile snip]
|ifeq ($(USE_OPENSSL),1)
|CFLAGS += -DUSE_OPENSSL
[snip]
|else
|CFLAGS += -DUSE_GCRYPT
[Makefile snip]

The crda dpends openssl 1.0.x which there is a build failure with
openssl 1.1.x. So use gcrypt instead of openssl by default.

The idea refers:
https://bugs.chromium.org/p/chromium/issues/detail?id=735782
https://gitweb.gentoo.org/repo/gentoo.git/tree/net-wireless/crda/crda-3.18-r1.ebuild#n36

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index c596ded..853a523 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -4,8 +4,10 @@ SECTION = "net"
 LICENSE = "copyleft-next-0.3.0"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
 
-DEPENDS = "python-m2crypto-native python-typing-native python-native \
-           libgcrypt libnl openssl10"
+DEPENDS = "python-m2crypto-native python-typing-native python-native libnl \
+           ${@oe.utils.conditional("DEFAULT_CRYPT", "gcrypt", "libgcrypt", "", d)} \
+           ${@oe.utils.conditional("DEFAULT_CRYPT", "openssl", "openssl10", "", d)} \
+          "
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
@@ -21,9 +23,12 @@ SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e
 
 inherit python-dir pythonnative siteinfo
 
+# "gcrypt" or "openssl"
+DEFAULT_CRYPT ??= "gcrypt"
+
 # Recursive make problem
 EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg'"
-EXTRA_OEMAKE_append = " USE_OPENSSL=1"
+EXTRA_OEMAKE_append = " ${@oe.utils.conditional("DEFAULT_CRYPT", "openssl", "USE_OPENSSL=1", "", d)}"
 TARGET_BITS = "${SITEINFO_BITS}"
 export TARGET_BITS
 
-- 
2.7.4


