Return-Path: <maryan.pricak@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2E52D71DCF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jun 2017 22:19:56 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id u62so7267315lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jun 2017 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kKz0DHuJ177bnIOyuCvHyPsiTXc+JOMn+T1WQJSF09A=;
	b=GRLSe1ijNckbK69uP4qG/MSfLwxBJA4QbAxq5EoAbS16EaYV/xtbJrs5rvkCqbxRJE
	V4rqkPPBLLJ1E6OlEH7bT20VFpRuPRD3D4Cd734jOYwsBnIFPzUdmipi6miBCZXOLbtW
	rJWApFzh4YUGpwxUv8uYNqOHmRYZuoZK02mV/BwfZDV7Cq9NkJnNQ9QcbT/wDz/c9aZj
	TVEL9kBgI3YZbz8tJDXUyJM30gXWbcesywqcdMyL9chiSKaSNLf3MI1n9v7oIgWhx/tg
	uJBrp9J7oIJqpi1VH8YWOQPMcf/jJOnuoC8AgOuup2xtT1U/X2QjL+G2JBS/w5vb48fv
	WKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kKz0DHuJ177bnIOyuCvHyPsiTXc+JOMn+T1WQJSF09A=;
	b=p2jVI1hwhaVwLJE+sgbv1DQib0Iuyd+U+G3e09BnAyfX1HJlYIPS02DS3Zkap+Wj0v
	2o1iGLli44tstqko20lj4s1ZUYJduNcWw1F27NT+VgyfetQYTWK7p7a0wr6YegXKEZQe
	c0FvvYUzSmQRZSGTZFK+p/Mmp91WBWCec+ssrHPvoFCW46S9AbHqyqJPw3ly+heUOoKr
	d+qQYihnZKy3imganZM2AjtUyq4QRZIYgzwX130+1/0mdnOWYWUzqghR/Kds8pQ/ZV5h
	8Uw0UMnIiX0O+5N4qWDN/kWVWXkdQkr9C/Tyo4khNU3HaymqmI+RzTP7yzOcAWjzSOix
	0ihw==
X-Gm-Message-State: AKS2vOxMhNjBIEBUAsiTy4Luk4MoZe1GLhEBagUDSzVOG6GWdxYRq2G0
	QVVkBOrapIIuMFnsI28=
X-Received: by 10.25.207.79 with SMTP id f76mr361954lfg.58.1497133196945;
	Sat, 10 Jun 2017 15:19:56 -0700 (PDT)
Received: from localhost.localdomain ([77.123.173.169])
	by smtp.gmail.com with ESMTPSA id b5sm1342333lfb.23.2017.06.10.15.19.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Jun 2017 15:19:56 -0700 (PDT)
From: Marian Pritsak <maryan.pricak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 01:19:28 +0300
Message-Id: <1497133168-19819-1-git-send-email-maryan.pricak@gmail.com>
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
X-List-Received-Date: Sat, 10 Jun 2017 22:19:57 -0000

Hiredis is a C client library for Redis database.

Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
---
 .../0001-Makefile-remove-hardcoding-of-CC.patch    | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb | 24 ++++++++++++++++
 2 files changed, 56 insertions(+)
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
index 0000000..c1b905f
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
@@ -0,0 +1,24 @@
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
+inherit autotools
+
+do_compile() {
+  cd ${S}
+  oe_runmake
+}
+
+do_install() {
+  cd ${S}
+  oe_runmake PREFIX=${D}/usr INSTALL='cp -r' install
+  cp hiredis.pc ${D}/${libdir}/pkgconfig/
+}
-- 
2.7.4


