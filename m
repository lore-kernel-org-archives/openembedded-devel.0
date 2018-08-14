Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4349C745A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:34:59 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id x5-v6so9334999pgp.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xucLsN9EGraJx/n+G2i1oZVa1072llxTh6yZe9RQlPM=;
	b=MIT4qjrVpTCOjb4xd9FfKJ9b4YXBJiWXP5ECRz4wgfPQ3PJRw+sMOaE+1HQqWUOmLE
	vQu7Pxry1sGHUHnlvtnUCgVdeWP7kCh+F2uDuGXrv2zTTLrpKeaXxQYlblsyU2kQKTpy
	LjiKzJG5XelSZi8eoKV7U7X91RYDkOCC4eoLoi1t3Ar3Zop9l5neuOLKxXE8IyY0eR+N
	lIYJjZI61+lg1sFNHqutaGke5/kmeCWJDdfdISCEGqWDexp7KsEs5qwivQ4O2ZzpTQ5n
	/+YqjcowdbvyBfaYnQba6EF0gwL6K8pgCVq1nCBQgDWPkyh9lP3BdKJNadap65ODBErV
	NHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xucLsN9EGraJx/n+G2i1oZVa1072llxTh6yZe9RQlPM=;
	b=Senb21ZzZrRF5nRu9RzjsjcnRH/C7fSKFlsCobDTYlCFufkmDgHXJv6qruPhy3csGZ
	m/C73oc8bWsQBGgaEn69QO6utlbo8QkXHXRXtCpD+fK9wig3qxILjbiJupaxxB/V7zDl
	btqPZhZM28XmaPpGBg6MTVUqoC90qL50s3Om/vq5eLndX6eZF3QL5ZJBMoncxtcHgyL8
	xr482bO+yhyOAX9pEzwRslP9Z21Z6LJxyCME3tTWVpeAP4BJgH5JdXptmLRRBnUPBdJR
	GTgpkKnQxm3crxsi1dGJFMvaL4nhCv2UOOmBFvu/HtkfE2lMXM7lRA4Ird10rvQdiqfC
	bDLw==
X-Gm-Message-State: AOUpUlEXPDPlQydKjkZjD0hIiZHdnhA6VYSGnnFmTW+1w3Uo5OCDbnML
	WCU7MMBv9Z7inF+WKvFNDUOhBk/C
X-Google-Smtp-Source: AA+uWPzcBT07KqHUAeR3drz6eJlqD0ndTEyxWJ3ZVlnnoLxw008PBVRzrKd1FTQIL1WTjtc7zAXDsQ==
X-Received: by 2002:a62:54c7:: with SMTP id
	i190-v6mr24042728pfb.155.1534264499938; 
	Tue, 14 Aug 2018 09:34:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm35564388pfo.164.2018.08.14.09.34.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 09:34:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 09:34:44 -0700
Message-Id: <20180814163445.24736-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH V2 1/2] stress-ng: Upgrade to 0.09.37
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
X-List-Received-Date: Tue, 14 Aug 2018 16:34:59 -0000

Carries fixes needed for building with glibc 2.28+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update to 0.09.37

 ...force-sync-after-build-in-case-reboo.patch | 28 +++++++++++++++++++
 ...01-Several-changes-to-fix-musl-build.patch |  2 +-
 ...0002-stress-fcntl-fix-build-for-musl.patch | 25 -----------------
 ...ess-ng_0.09.14.bb => stress-ng_0.09.37.bb} |  8 +++---
 4 files changed, 33 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
 rename meta-oe/recipes-test/stress-ng/{stress-ng_0.09.14.bb => stress-ng_0.09.37.bb} (74%)

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
new file mode 100644
index 0000000000..fd2199e535
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
@@ -0,0 +1,28 @@
+From 7c97710bfc44d895b7111bef9c55866f00a3589c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Aug 2018 11:54:27 -0700
+Subject: [PATCH] Revert "Makefile: force sync after build in case reboot loses
+ executable"
+
+This reverts commit ae6322b1baea56a589207c96e358daae8edd0a8f.
+
+Not needed for cross-builds
+
+Upstream-Status: Inappropriate [Cross compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+Index: stress-ng-0.09.37/Makefile
+===================================================================
+--- stress-ng-0.09.37.orig/Makefile
++++ stress-ng-0.09.37/Makefile
+@@ -344,7 +344,6 @@ OBJS += $(CONFIG_OBJS)
+ stress-ng: info $(OBJS)
+ 	@echo "LD $@"
+ 	@$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -lc -o $@
+-	@sync
+ 
+ .PHONY: info
+ info:
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
index d604f860a1..93d9b544d5 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
@@ -1,4 +1,4 @@
-From 784dcd09d3f266e271d007f4fd257e85036872ca Mon Sep 17 00:00:00 2001
+From d499375fe267be8819ecb985123d89a21edc0e59 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
 Date: Tue, 17 Oct 2017 10:13:20 -0500
 Subject: [PATCH] Several changes to fix musl build
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
deleted file mode 100644
index ed3287e329..0000000000
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From faadbc147394cea9278bc2494f33e3521d88e742 Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@linux.intel.com>
-Date: Tue, 9 Jan 2018 18:38:45 -0800
-Subject: [PATCH] stress-fcntl: fix build for musl
-
-Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-
-Upstream-status: Pending
-
----
- stress-fcntl.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/stress-fcntl.c b/stress-fcntl.c
-index 2ea867b..e91b345 100644
---- a/stress-fcntl.c
-+++ b/stress-fcntl.c
-@@ -415,6 +415,7 @@ ofd_lock_abort:	{ /* Nowt */ }
- #if (defined(F_GET_FILE_RW_HINT) && defined(F_SET_FILE_RW_HINT)) | \
-     (defined(F_GET_RW_HINT) && defined(F_SET_RW_HINT))
- 	{
-+		int ret;
- 		size_t i;
- 		unsigned long hint;
- 		static const unsigned long hints[] = {
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
similarity index 74%
rename from meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb
rename to meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
index 7fab43025f..19ce641924 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "zlib libaio"
 
 SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
-           file://0002-stress-fcntl-fix-build-for-musl.patch \
-          "
+           file://0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch \
+           "
 SRC_URI_append_libc-musl = " \
     file://0001-Several-changes-to-fix-musl-build.patch \
     "
-SRC_URI[md5sum] = "1f8b6c2c2830704d2a2814c16082d48e"
-SRC_URI[sha256sum] = "02cac34a5cb041197af60c1867844c6cbb089a6d10a38cdcf7b8f27bfaa6ef8f"
+SRC_URI[md5sum] = "81d73313ea7778f749470b6f950553af"
+SRC_URI[sha256sum] = "8494afb2f2e2cf7e79ec9c6c3129308b098e530141ba2b07d6547708fd63af3d"
 
 UPSTREAM_CHECK_URI ?= "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
 UPSTREAM_CHECK_REGEX ?= "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.18.0


