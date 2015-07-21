Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F25C4734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 09:19:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98672921"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jul 2015 17:22:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6L9HTDY007824
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 17:17:29 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 21 Jul 2015 17:19:16 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 17:19:04 +0800
Message-ID: <1437470344-1669-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437470344-1669-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437470344-1669-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] crda: upgrade 3.13 -> 3.18
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
X-List-Received-Date: Tue, 21 Jul 2015 09:19:18 -0000
Content-Type: text/plain

Dropped backported patches(commit-id):
-crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch(2cabb258)
-crda-Fix-the-linking-order-to-avoid-compilation-erro.patch(fefefdb2)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...STDIR-support-in-install-libreg-rules-in-.patch | 35 ---------------
 ...e-linking-order-to-avoid-compilation-erro.patch | 51 ----------------------
 .../do-not-run-ldconfig-if-destdir-is-set.patch    |  0
 .../fix-linking-of-libraries-used-by-reglib.patch  |  0
 .../crda/{crda_3.13.bb => crda_3.18.bb}            |  6 +--
 5 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
 delete mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
 rename meta-networking/recipes-connectivity/crda/{crda-3.13 => crda}/do-not-run-ldconfig-if-destdir-is-set.patch (100%)
 rename meta-networking/recipes-connectivity/crda/{crda-3.13 => crda}/fix-linking-of-libraries-used-by-reglib.patch (100%)
 rename meta-networking/recipes-connectivity/crda/{crda_3.13.bb => crda_3.18.bb} (82%)

diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch b/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
deleted file mode 100644
index 3646400..0000000
--- a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From: "John W. Linville" <linville@tuxdriver.com>
-Date: Fri, 14 Feb 2014 13:58:44 -0500
-Subject: [PATCH] crda: Add DESTDIR support in install-libreg* rules in Makefile
-Origin: https://git.kernel.org/?p=linux/kernel/git/mcgrof/crda.git/commit?id=2cabb2588da56735369131b709f191453c080be0
-
-Upstream-Status: Backport
-
-Signed-off-by: John W. Linville <linville@tuxdriver.com>
-Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
----
- Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 0b2f0d7..1f25509 100644
---- a/Makefile
-+++ b/Makefile
-@@ -120,13 +120,13 @@ $(LIBREG): regdb.h reglib.h reglib.c
- 
- install-libreg-headers:
- 	$(NQ) '  INSTALL  libreg-headers'
--	$(Q)mkdir -p $(INCLUDE_DIR)
--	$(Q)cp *.h $(INCLUDE_DIR)/
-+	$(Q)mkdir -p $(DESTDIR)/$(INCLUDE_DIR)
-+	$(Q)cp *.h $(DESTDIR)/$(INCLUDE_DIR)/
- 
- install-libreg:
- 	$(NQ) '  INSTALL  libreg'
--	$(Q)mkdir -p $(LIBDIR)
--	$(Q)cp $(LIBREG) $(LIBDIR)/
-+	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
-+	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
- 	$(Q)ldconfig
- 
- %.o: %.c regdb.h $(LIBREG)
diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch b/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
deleted file mode 100644
index 68b4b13..0000000
--- a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
-Date: Mon, 16 Dec 2013 21:57:39 +0530
-Subject: [PATCH] crda: Fix the linking order to avoid compilation error
-Origin: https://git.kernel.org/?p=linux/kernel/git/mcgrof/crda.git/commit?id=fefefdb2c52c8fbedbb339b4badb8226cad7e7e0
-
-While linking the crda.o and libreg.so, first put crda.o
-and then -lreg. This fixed the below error:
-
-  GEN  keys-gcrypt.c
-  Trusted pubkeys: pubkeys/linville.key.pub.pem
-  CC   libreg.so
-  CC   crda.o
-  LD   crda
-crda.o: In function `main':
-crda/crda.c:196: undefined reference to `reglib_get_rd_alpha2'
-collect2: ld returned 1 exit status
-make: *** [crda] Error 1
-
-Note: This still doesn't fix the below error (will send another mail)
-
-  CHK  /usr/lib/crda/regulatory.bin
-Database signature verification failed.
-Invalid or empty regulatory file, note: a binary regulatory file should be used.
-make: *** [verify] Error 234
-
-Upstream-Status: Backport
-
-Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
-Signed-off-by: Chaitanya T K <chaitanya.mgit@gmail.com>
----
- Makefile | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4a351c6..0b2f0d7 100644
---- a/Makefile
-+++ b/Makefile
-@@ -28,10 +28,11 @@ RUNTIME_PUBKEY_DIR?=/etc/wireless-regdb/pubkeys
- CFLAGS += -O2 -fpic
- CFLAGS += -std=gnu99 -Wall -Werror -pedantic
- CFLAGS += -Wall -g
--LDLIBS += -lm
- LDLIBREG += -lreg
-+LDLIBS += $(LDLIBREG)
-+LDLIBS += -lm
- LIBREG += libreg.so
--LDFLAGS += -L ./ $(LDLIBREG)
-+LDFLAGS += -L ./
- 
- all: all_noverify verify
- 
diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda-3.13/do-not-run-ldconfig-if-destdir-is-set.patch
rename to meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/fix-linking-of-libraries-used-by-reglib.patch b/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda-3.13/fix-linking-of-libraries-used-by-reglib.patch
rename to meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.13.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
similarity index 82%
rename from meta-networking/recipes-connectivity/crda/crda_3.13.bb
rename to meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 12eefe0..931a053 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.13.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -9,13 +9,11 @@ DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/crda/${BP}.tar.xz;name=crda \
            https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2014.11.18.tar.xz;name=bin \
-           file://crda-Fix-the-linking-order-to-avoid-compilation-erro.patch \
-           file://crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
            file://fix-linking-of-libraries-used-by-reglib.patch \
 "
-SRC_URI[crda.md5sum] = "66b1b0417c1ad19f0009a5c0c0c1aebc"
-SRC_URI[crda.sha256sum] = "2f85da7ab0170b140d6ed62596c8f268d4a7dedecf84cac7182ada979742ff59"
+SRC_URI[crda.md5sum] = "0431fef3067bf503dfb464069f06163a"
+SRC_URI[crda.sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
 
 SRC_URI[bin.md5sum] = "d750c402c5510add7380edcb1d9b75b2"
 SRC_URI[bin.sha256sum] = "eab6b50f30748a8b0065ba38cf3df05aac161a5861ae0a6c3cfd01d38a71c9dd"
-- 
1.8.4.2


