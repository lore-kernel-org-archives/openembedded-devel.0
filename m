Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C9C9C7D5A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykS1SBpz6Y
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230192;
	bh=gvMNI/GZ1DeKHNj9zKw3xFR+hVbAWMRn24JEPkxO3q8=;
	h=From:To:Subject:Date:From;
	b=fV9MLBu43944vhVVVRzuyEWop8OUyYU6tq2076pxKAZNmR1tu1tNB3YSspvgk1feL
	qSqDw6bjq4NJPFTdg15Sg9DbvV/gqD3vS44Fdw9zuNY7PNhUBm4cdzVj7lR4ZUzUVl
	RyG+Ckb2nZtZPwWRXOidyAbs/d6aL/8UwcX325NYg/s7oGRpvmyDzI9qwOXhx7mf8R
	g1eOQ+4oYjXlf8vuetbdiYnmym1nbMTrwmhbwaYw2QopbeWtgE5V4ZNy+CZ0GSbMX3
	gVu6VRc6qDXZM9k/WA8dPXzDX4NjE7FVX/ExBf3RPa06rJ2h7gfAvloxi86EFS0KIB
	tZlZApikmeSYSaXL7IzeOdqphCj5pimit2L21gnObnMMqGUuKJts0yAoqYZXr2nhLs
	qQaQYc85+6hJdIH9FQ0xPGhWk1vtgrR4+FhUV3hAFSy79uWT+58ETOZqplcn3YBiVF
	pJpo4m6ZjI6tb8nMRS9gIAEjUJQUKXWK8iM6331twnx4hcpRVNxDNpzzAVWvXatDFr
	15dlzCa+lTLqzaTEDrkx5GdmLHEs/dX3ba3ryejAKloJSBoxTS21ZRiDVtfbIFDalm
	oT59TL9tgv2L4uexEv+5p89N1bsVGGPn/gp4y2xO8Y7/xCig118mJx2fL4OKizB6qq
	AA2NPkSFthpbIVa8UKdyheoA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:21 +0300
Message-Id: <20190507115630.30368-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ofono: upgrade 1.25 -> 1.29
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

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../ofono/ofono/use-python3.patch             | 27 -------------------
 meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
 meta/recipes-connectivity/ofono/ofono_1.29.bb |  8 ++++++
 3 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb

diff --git a/meta/recipes-connectivity/ofono/ofono/use-python3.patch b/meta/recipes-connectivity/ofono/ofono/use-python3.patch
deleted file mode 100644
index 7b84075257..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/use-python3.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-set-ddr should use Python3 like all the other tests.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 17b69cd1da4c5c5f732acb38ca1602446c567ee7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 29 Jan 2018 11:31:25 +0000
-Subject: [PATCH] test/setddr: use Python 3
-
-All the other tests use Python 3, so this should to.
----
- test/set-ddr | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/set-ddr b/test/set-ddr
-index 5d061b95..33631f31 100755
---- a/test/set-ddr
-+++ b/test/set-ddr
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- 
- import sys
- import dbus
--- 
-2.11.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.25.bb b/meta/recipes-connectivity/ofono/ofono_1.25.bb
deleted file mode 100644
index 3688b9d2fc..0000000000
--- a/meta/recipes-connectivity/ofono/ofono_1.25.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://use-python3.patch \
-"
-SRC_URI[md5sum] = "31450cabdd8dbbf3f808ea2f2f066863"
-SRC_URI[sha256sum] = "eb011fcd3080e93f3a56f96be60350b6595a8b5f36b61646312ba41b0bcb0d75"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
new file mode 100644
index 0000000000..d026ae6f3b
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -0,0 +1,8 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+"
+SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
+SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.17.1


