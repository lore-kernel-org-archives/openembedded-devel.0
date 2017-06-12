Return-Path: <maryan.pricak@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB045780A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 18:36:54 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id v20so10173019lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L0JpufGVwUUwkW6Yw9FQKWtVDET9zC/R6NY9EE68AMQ=;
	b=Hpig0Vd8QyLmiw5sz0bnL9hO1KXn5Pgzh+pg48Cy0t2/CLxvCL1WRso9LhA9UG7ybs
	vtAf1L+VJQWoUvAV3jtLVN9KvMTwOhWXl9jziyph7tyOyPZoOs35B6Awg64ECrnORdaW
	UamgUPrr0g5xpUj4EfKkfS4uRNyV23bvLI4jnr7kZEa4URpr9thFfkAmrqKO/jB5eY6x
	ru2VoyNzerb0e2Xi953tUPs/4g5YfRCsXpSeYtM5p+YgVobJ9J6KCvfnUuVXZGrgvSej
	K4UCyjVnRqhsfF0ciLprmHiz4c6ScQzcLlRWhgeYIQpvIYz0oO0PPQ2sv7yBKECWNHtw
	ujOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L0JpufGVwUUwkW6Yw9FQKWtVDET9zC/R6NY9EE68AMQ=;
	b=aEAkiAwy4fQJWKn5OOp6WLYjTgsfqNUvu4pQd+6nTNBnueuoDddjXeu1FN99B02fxw
	B6AgUmvQmvaOE7Ga9Xwek5AvH9wtMlb3yv4/470mYBM3UMzOcfe1p6DsfofQGHoPezmz
	DpG13QdLH9ToI13GMVT4xNjXhlZa3v2yNegrhtuYKVfCf/4GUrY4BbonmynBQAez0zuy
	io21NkYeek3CCp+rkihnNFDUQZK79H+6C4GclFjQ6MRq5mMcBjSTOudsPFYnxzRGBFsn
	/QHDGWt3S5N4k4WndZyoEZMRGOSBJy0EaL1EZBro89cEJolvoM739A5KDJWxIkVHZcif
	yq2g==
X-Gm-Message-State: AKS2vOzR8tkShUmKjQsrz8bV4/Tld/WFXmxYpZakSA+UIxUHX1lZSZa3
	aJud7UQb1QrgewWd3sI=
X-Received: by 10.25.79.25 with SMTP id d25mr1186248lfb.133.1497292614564;
	Mon, 12 Jun 2017 11:36:54 -0700 (PDT)
Received: from localhost.localdomain ([77.123.173.169])
	by smtp.gmail.com with ESMTPSA id b9sm2837062lfe.39.2017.06.12.11.36.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jun 2017 11:36:54 -0700 (PDT)
From: Marian Pritsak <maryan.pricak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jun 2017 21:36:50 +0300
Message-Id: <1497292610-29445-1-git-send-email-maryan.pricak@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] hiredis: Add recipe
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
X-List-Received-Date: Mon, 12 Jun 2017 18:36:55 -0000

Hiredis is a C client library for Redis database.
Hiredis does not use autotools, but plane Makefile instead,
so few changes had to be made, including removing hard coded
compiler, setting INSTALL to 'cp -r' to to avoid host user
comtamination QA issue, and setting PREFIX to ${prefix} instead of
default /usr/local.

Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
---
 .../0001-Makefile-remove-hardcoding-of-CC.patch    | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb | 21 ++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
 create mode 100644 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb

diff --git a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
new file mode 100644
index 0000000..fef2bc7
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
@@ -0,0 +1,32 @@
+From d13b918a3ff8b0ebfd1e7b18b198b4b45841d720 Mon Sep 17 00:00:00 2001
+From: Andrea Galbusera <gizero@gmail.com>
+Date: Fri, 31 Jul 2015 16:42:08 +0200
+Subject: [PATCH] Makefile: remove hardcoding of CC
+
+* upgrade previous patch to avoid wiping CFLAGS. This fixes build on arm
+platforms which previously caused and issue due to -fPIC being lost
+
+Signed-off-by: Andrea Galbusera <gizero@gmail.com>
+---
+ Makefile | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8b0f0c2..66a4317 100644
+--- a/Makefile
++++ b/Makefile
+@@ -34,11 +34,6 @@ define REDIS_TEST_CONFIG
+ endef
+ export REDIS_TEST_CONFIG
+ 
+-# Fallback to gcc when $CC is not in $PATH.
+-CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+-OPTIMIZATION?=-O3
+-WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
+-DEBUG?= -g -ggdb
+ REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
+ REAL_LDFLAGS=$(LDFLAGS) $(ARCH)
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
new file mode 100644
index 0000000..96b86f9
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Minimalistic C client library for Redis"
+HOMEPAGE = "http://github.com/redis/hiredis"
+LICENSE = "BSD-3-Clause"
+SECTION = "libs"
+DEPENDS = "redis"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
+SRC_URI = "git://github.com/redis/hiredis;protocol=git;rev=f58dd249d6ed47a7e835463c3b04722972281dbb \
+           file://0001-Makefile-remove-hardcoding-of-CC.patch"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+# By default INSTALL variable in Makefile is equal to 'cp -a', which preserves
+# ownership and causes host-user-contamination QA issue.
+# And PREFIX defaults to /usr/local.
+do_install_prepend() {
+  export PREFIX=${prefix}
+  export INSTALL='cp -r'
+}
-- 
2.7.4


