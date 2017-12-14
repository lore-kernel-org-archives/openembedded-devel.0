Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9604571D79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:36:42 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id p84so4110198pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 09:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1Z4rSFaDIPfXLPELhWl1mCagryf1sL7GxOhgHaxqbvM=;
	b=MzDl7t34zVh/KikMRMJPaC/6yAcsY07dgb5K/6ZcElBH06V2LP6XHJTuenuz1w23Kl
	yFYiFGdBD3HWPP5lJh7UO6dXXG8Fn4I7RSLC9439+y8v8IqJAEN3h9qplyD+5Z4P+0/k
	AABwbEFFKt2BPvjFgQl0oFXxJdrBX/jACLM2ItOuLjkhHiEQRNiLaI7pq3Lpz74/4UIV
	nQ2zF0es+pA2wQYZeElNEtEM85MAYJ9YHe89j9HN5nZcB4jb4C8aVtZFbuDHHs3nMZXQ
	RyuAh7hSBBogCTmpnownkqslSUQnmrn2eQ8pChWvuE2VmUUydGsN9CM+maxTsVbkTsDQ
	hWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1Z4rSFaDIPfXLPELhWl1mCagryf1sL7GxOhgHaxqbvM=;
	b=BMB51RibfEgL9DphLaL5orIDsOxswRuZa+aYM0d6UCKpZ7OU09hYuARA46Qo6HpOnj
	JvFTBkQrEsFsVIjaogsh7cmzauXMZ0/1wEMm11q7vi8E7RtsHdGq2RrcSAaP0n0HHaPC
	6Vao9bBdqGjPsX2Z3FUWbhEgHppbfypguSNOvmJcwyskeHND+lo81SkG2xlLujIhaB++
	i6dn97eJJRBPvRxdTKkeoLkGzsOxUSYBfd6xoTI7DH7NoL0K/uYWIthBenuygEhmrubS
	Maj5Joa9ShPYgX1U+qyPKNcYaflE+IQ8ka6Hj50gIEPA/klzxtnUDVBDWeCYIkJFLtkH
	XANQ==
X-Gm-Message-State: AKGB3mLIvlwmi35kcsIOFi2VJMU99CDNwXD6TfVL5ZcVrHzbIzbllYLc
	98Cv+B99K3yaWlEP1bm8KZNmwQ==
X-Google-Smtp-Source: ACJfBouZ8gRvBqWJumWwpL1i+yta1+pg7pyXu/xGP392fPWft3kXDvfkPMokCQ1Fsgx+GKtuObFlQw==
X-Received: by 10.159.254.8 with SMTP id r8mr9755539pls.291.1513273003158;
	Thu, 14 Dec 2017 09:36:43 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id l14sm7437748pgn.9.2017.12.14.09.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 09:36:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 09:36:29 -0800
Message-Id: <20171214173633.16405-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-networking][PATCH 1/5] open-isns: Fix build with musl
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
X-List-Received-Date: Thu, 14 Dec 2017 17:36:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ....h-endian.h-is-available-on-musl-on-linux.patch | 38 ++++++++++++++++++++++
 .../recipes-support/open-isns/open-isns_0.97.bb    |  6 ++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch

diff --git a/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch b/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
new file mode 100644
index 000000000..825e2bf6a
--- /dev/null
+++ b/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
@@ -0,0 +1,38 @@
+From e0d86318227a23f00cf0f6639a6685bb9f5771a1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Dec 2017 09:42:19 -0800
+Subject: [PATCH] util.h: endian.h is available on musl on linux
+
+just checking for glibc alone is not enough since
+it excludes musl, therefore check for platform
+being linux as well
+
+Fixes build issues
+
+include/libisns/util.h:114:12: fatal error: sys/endian.h: No such file or directory
+ #  include <sys/endian.h>
+            ^~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ include/libisns/util.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libisns/util.h b/include/libisns/util.h
+index 9a2bd13..6cc1a1b 100644
+--- a/include/libisns/util.h
++++ b/include/libisns/util.h
+@@ -100,7 +100,7 @@ enum {
+  * There's no htonll yet
+  */
+ #ifndef htonll
+-# ifdef __GLIBC__
++# if defined(__GLIBC__) || defined(__linux__)
+ #  include <endian.h>
+ #  include <byteswap.h>
+ #  if __BYTE_ORDER == __BIG_ENDIAN
+-- 
+2.15.1
+
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
index 9ee1f87c8..abfa7510e 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
@@ -13,9 +13,9 @@ SECTION = "net"
 
 DEPENDS = "openssl"
 
-SRC_URI = " \
-    git://github.com/open-iscsi/open-isns \
-"
+SRC_URI = "git://github.com/open-iscsi/open-isns \
+           file://0001-util.h-endian.h-is-available-on-musl-on-linux.patch \
+           "
 
 SRCREV ?= "09954404e948e41eb0fce8e28836018b4ce3d20d"
 
-- 
2.15.1


