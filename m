Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D345277BC5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 12:29:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r78so11604506wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 04:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=87sUCZcdmQPsQClROMsY4L6SOusMvNDhRYBHqZrO1hM=;
	b=ntKcGoA9CdQlJCLszNY6xh0q0eCs9aRdSKpDaLb9Juj4Zc9zZZsh9oF+gYKHH5rSxa
	8hGwvP+bnDvT6JJdr5SGflXYDh+aOFNtPEZWhKFVVuGqsDYfqyTHdvgMyx/BRXvDjx6M
	0gF+NXErKy/2vNOJ3KPbwWIC+3zSM/wudsV6tHM4CTPxtOn+0G35s9mObkbAwV4O5JQf
	s9kT3OwwUMtIDuS+ErI4IJsqj/2TlmTkqWxBI2LnpIKH0HzOAhAxQNPp27RbQZTYLwzo
	YB3/EyJoUPpUZq9fncJK6zuXbIv4T+V9Wy/Jyem9Z5DTCnufhnj53zU5XDn//HtRlyIf
	GTcA==
X-Gm-Message-State: AKwxytcKvAT/4MgCzrkOyMEHPrVc8fNjNcNKHoaXhg/1VuKO0Vgi0drS
	R2MtgI3mZjiZuymzqJ5dZs0McjW3
X-Google-Smtp-Source: ACJfBovw0xo3XvbkwD63vUqg2NNyS7ORsIskbCLVtQgcPMZwvr4/anijKwA61+s+EnOd2/vRF5Nv8g==
X-Received: by 10.80.146.211 with SMTP id l19mr1889316eda.152.1515760184235;
	Fri, 12 Jan 2018 04:29:44 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s14sm12631318eds.78.2018.01.12.04.29.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 04:29:43 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jan 2018 12:29:41 +0000
Message-Id: <20180112122942.22396-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] uthash: update to v2.0.2
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
X-List-Received-Date: Fri, 12 Jan 2018 12:29:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

- the license has changed to BSD-1-Clause
- the main package is empty (as this only provides
  header files), so the -dev package must not depend
  on the main package

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-oe/recipes-support/uthash/uthash_1.9.7.bb | 16 --------------
 meta-oe/recipes-support/uthash/uthash_2.0.2.bb | 30 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-support/uthash/uthash_1.9.7.bb
 create mode 100644 meta-oe/recipes-support/uthash/uthash_2.0.2.bb

diff --git a/meta-oe/recipes-support/uthash/uthash_1.9.7.bb b/meta-oe/recipes-support/uthash/uthash_1.9.7.bb
deleted file mode 100644
index 82a9f2a6a..000000000
--- a/meta-oe/recipes-support/uthash/uthash_1.9.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Hash table for C structures"
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=564f9c44927f6247dc810bf557e2b240"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "1f14bbee7ee73ed0ceb3549f8cf378b4"
-SRC_URI[sha256sum] = "956f5c99798349c413275fe4c9ff128d72e280655dadbe4365f8e9fbda91393f"
-
-do_install () {
-    install -dm755 ${D}${includedir}
-    install -m 0644 ${S}/src/*.h ${D}${includedir}
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/uthash/uthash_2.0.2.bb b/meta-oe/recipes-support/uthash/uthash_2.0.2.bb
new file mode 100644
index 000000000..8a6887ef0
--- /dev/null
+++ b/meta-oe/recipes-support/uthash/uthash_2.0.2.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Hash table and linked list for C structures"
+DESCRIPTION = " uthash-dev provides a hash table implementation using C preprocessor macros.\n\
+ This package also includes:\n\
+  * utlist.h provides linked list macros for C structures\n\
+  * utarray.h implements dynamic arrays using macros\n\
+  * utstring.h implements a basic dynamic string\n\
+"
+HOMEPAGE = "https://troydhanson.github.io/uthash/"
+SECTION = "base"
+LICENSE = "BSD-1-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc1f1e4c71f19f580458586756c02b4"
+
+SRC_URI = "https://github.com/troydhanson/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
+UPSTREAM_CHECK_URI = "https://github.com/troydhanson/${BPN}/releases"
+
+SRC_URI[md5sum] = "d08632a58674274c9cd87e2930f5696a"
+SRC_URI[sha256sum] = "34a31d51dd7a839819cecd6f46049b4ffe031d7f3147d9a042f5504fdb1348d1"
+
+do_compile[noexec] = "1"
+
+do_install () {
+    install -dm755 ${D}${includedir}
+    install -m0644 src/*.h ${D}${includedir}
+}
+
+# The main package is empty and non-existent, so -dev
+# should not depend on it...
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "native"
-- 
2.15.1


