Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DDE047D6A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykS4Cxsz7K
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230192;
	bh=MBcxoLz4jAkcSbipa395PZpiXzXB1qkHFG7rEpYjXHo=;
	h=From:To:Subject:Date:From;
	b=PXmvY06A98e5pefoti7Lyx7lvT57BGvTMzs4yUrUmhciAM7dYJBBdP+yv0Bu4di5y
	5ADaCfI+81LEgkifP+ltoMWLXejnwTM0i0gPmQ0SCJUDQSGIuGDl3QsYbMZs2jPjWL
	2WpQsc0BT0b+bO263lxnX2YWTeOWFaBzv5rGM3kCnKiNId2aVKMk4D1AWtbG+2uCrN
	yIutQ+93Xq9+SFruDTrKFEMEKt9yx7tnx1AqIcs3WByxiA8COIGS29EvS5GqHrbqIB
	udlXOZaKRrlRbuqUU2YjgHeSKuImpCkTxSRqtjt2Cu85XOl24ue78G/ozvP7qua70i
	hgqAdMbqEYjsLyUQTRp7eWAtU9oCXmvihhNca8NgT+SAwKydqBoaylLKfLvmaDgxDG
	tkx9j0TsImYZxdx0ZUSm3m1YF8gNB6A8TyRe7VF4syHHxTC2SaNWK5t6wLzi0mjzYC
	B9IYPSlCMQyJdiepNJSAM4wkailti0JcwuUdEHBNQMPkl4tYCLGzQjuNJD6hPTxysw
	DFQjt/OusGf9+ZH+89Ifi0df83U41MLXE2jazgLk6c5qgEURP0Ygiok1GYvHIcfO2i
	bMtli3WVPiO5Vb5v8UsI1aixaW4xKnwTFt9SZ8Xc7FE5ApJhjTeN7gXnRPsInMOCLU
	xJdMTmcaZjnzsj6Zq1E6rOSg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:22 +0300
Message-Id: <20190507115630.30368-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] socat: upgrade 1.7.3.2 -> 1.7.3.3
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
X-List-Received-Date: Tue, 07 May 2019 11:56:32 -0000

Remove patches for issues fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...ccess-c_ispeed-and-c_ospeed-via-APIs.patch | 52 -------------------
 .../Makefile.in-fix-for-parallel-build.patch  | 35 -------------
 .../{socat_1.7.3.2.bb => socat_1.7.3.3.bb}    |  6 +--
 3 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
 delete mode 100644 meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.3.2.bb => socat_1.7.3.3.bb} (85%)

diff --git a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
deleted file mode 100644
index c0e27f3d78..0000000000
--- a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From fb10ab134d630705cae0c7be42437cc289af7d32 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Mar 2016 21:36:02 +0000
-Subject: [PATCH] Use __c_ispeed and __c_ospeed on musl
-
-Original intention of these asserts is to find if termios structure
-is mapped correctly to locally define union, the get* APIs for
-baudrate would not do the right thing since they do not return the
-value from c_ospeed/c_ispeed but the value which is stored in iflag
-for baudrate.
-
-So we check if we are on Linux but not using glibc then we use
-__c_ispeed and __c_ospeed as defined in musl, however these are
-internal elements of structs it should not have been used this
-way.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Upstream-Status: Pending
-
- xioinitialize.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/xioinitialize.c b/xioinitialize.c
-index 9f50155..8fb2e4c 100644
---- a/xioinitialize.c
-+++ b/xioinitialize.c
-@@ -65,6 +65,12 @@ int xioinitialize(void) {
- #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
- #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
- #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
-+#if defined(__linux__) && !defined(__GLIBC__)
-+      tdata.termarg.__c_ispeed = 0x56789abc;
-+      tdata.termarg.__c_ospeed = 0x6789abcd;
-+      assert(tdata.termarg.__c_ispeed == tdata.speeds[ISPEED_OFFSET]);
-+      assert(tdata.termarg.__c_ospeed == tdata.speeds[OSPEED_OFFSET]);
-+#else
-       tdata.termarg.c_ispeed = 0x56789abc;
-       tdata.termarg.c_ospeed = 0x6789abcd;
-       assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
-@@ -72,6 +78,7 @@ int xioinitialize(void) {
- #endif
- #endif
- #endif
-+#endif
-    }
- #endif
- 
--- 
-2.8.0
-
diff --git a/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch b/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
deleted file mode 100644
index aa4db65a79..0000000000
--- a/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c6f0080b55679b6e8b5d332d6e05fdcbda1e4064 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 4 May 2015 00:58:47 -0700
-Subject: [PATCH] Makefile.in: fix for parallel build
-
-Fixed:
-vsnprintf_r.o: file not recognized: File truncated
-collect2: error: ld returned 3 exit status
-Makefile:122: recipe for target 'filan' failed
-
-Let filan depend on vsnprintf_r.o and snprinterr.o to fix the issue.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index f2a6edb..88b784b 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -118,7 +118,7 @@ PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysut
- procan: $(PROCAN_OBJS)
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(PROCAN_OBJS) $(CLIBS)
- 
--filan: filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o
-+filan: filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
- 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o $(CLIBS)
- 
- libxio.a: $(XIOOBJS) $(UTLOBJS)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
similarity index 85%
rename from meta/recipes-connectivity/socat/socat_1.7.3.2.bb
rename to meta/recipes-connectivity/socat/socat_1.7.3.3.bb
index b2d6b1dea4..7a889a3801 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
@@ -12,13 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-           file://Makefile.in-fix-for-parallel-build.patch \
            file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
-           file://0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch \
 "
 
-SRC_URI[md5sum] = "607a24c15bd2cb54e9328bfbbd3a1ae9"
-SRC_URI[sha256sum] = "e3561f808739383eb10fada1e5d4f26883f0311b34fd0af7837d0c95ef379251"
+SRC_URI[md5sum] = "b2a032a47b8b89a18485697fa975154f"
+SRC_URI[sha256sum] = "0dd63ffe498168a4aac41d307594c5076ff307aa0ac04b141f8f1cec6594d04a"
 
 inherit autotools
 
-- 
2.17.1


