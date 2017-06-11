Return-Path: <maryan.pricak@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD3166E5FB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 15:27:12 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id v20so8006790lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HWmMPvybVNfracvzHcx12E35COSrcqP/IytLeM4E+o0=;
	b=ehewrJbS6ytXmY7svqJa6ubYzTwcvr2z5J+Bz1bGO2DQuW5hMnMs5jIzyD24H2xffb
	4K/X/TNY0bZ700bIpEDecIh22D22EnepZB7DwUKLwfMR/WIdzHISS8o6rjLqNsRh5dxG
	gK6j79qGsH3ZsssqIM4JITvLZtAdEqVZxvwfZ/Tdq/8GyCHgeGBWxYdFpC8VpmXRwVNv
	kbTbKvD20HL5GAhOsId2wxYytx4C4Kp3mwvNK4UWSV45Z+rs3L/qvb5FtV3+iA3XJzIz
	4DEGIDvEicMrpkRdBnviQdhmlKqy+Df7WRbBA3KJxhED0eiGXiYhJNmx4lOZm9bIjm9f
	pyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HWmMPvybVNfracvzHcx12E35COSrcqP/IytLeM4E+o0=;
	b=Rc9zboBqO3NP8deIoJIsm8jJLT15CLXZ/LlBD+sxn/SbVgwLqJaDrfP5X0syjjRKd1
	NOm2IPf/g/9hcO37eRpKamRVOJimFNzS0xvLs0ktUbMKs0/hjTSI21603+6FZzzRg9+h
	V+dkJPloc4gTgY2rAsfHLAEeC8pJME9HFzYd+GzCwVaQVbGgUP14L59MA3xAbRMCZZyz
	zGwzDulw6RDW9tiKvGMbFbHJtiZzmeOwy8yKLeOJAPk2X6LL9INL9AIfETLWQEsxZnGz
	FhJmWnEaKpKhUlnDDzaodD/QB5oQcefRJVKQAcztQ6O7/LLrs5MFC16YkYoAJIDVP5xe
	ppCg==
X-Gm-Message-State: AODbwcCEyBk3rsojtmS1m2sZuYL6yltb/q9emW9Ocr5gRe7UG7BVyW63
	pKum6aY4ekkgQK+KRhQ=
X-Received: by 10.25.86.10 with SMTP id k10mr12985175lfb.113.1497194832747;
	Sun, 11 Jun 2017 08:27:12 -0700 (PDT)
Received: from localhost.localdomain ([77.123.173.169])
	by smtp.gmail.com with ESMTPSA id
	i127sm1920817lfg.40.2017.06.11.08.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 08:27:12 -0700 (PDT)
From: Marian Pritsak <maryan.pricak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 18:27:05 +0300
Message-Id: <1497194825-16654-1-git-send-email-maryan.pricak@gmail.com>
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
X-List-Received-Date: Sun, 11 Jun 2017 15:27:13 -0000

Hiredis is a C client library for Redis database.

Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
---
 .../0001-Makefile-remove-hardcoding-of-CC.patch    | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb | 18 ++++++++++++
 2 files changed, 50 insertions(+)
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
index 0000000..68ba90f
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
@@ -0,0 +1,18 @@
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
+do_install_prepend() {
+  export PREFIX=/usr
+  export INSTALL='cp -r'
+}
-- 
2.7.4


