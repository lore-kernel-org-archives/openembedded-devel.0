Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1036A77E91
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:26 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id 123so4705755pgj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZzJfCmQviDgb5h0jIgVcWo1BqPm7gzDHhKxabUzi/mg=;
	b=JEnQT2kYEz+myOGVyuBwwn+P4/T6XK3D1PUNkhaXAXEDBvjqidNJiAyou0RXunCUX0
	7a18F9FkFOtcK+gipOFeKcGwQDXgKsglsYdvDbg+2KkkugZToSxsoJP9zlqi3Xj6tNUz
	dHdyc0z1D3UNWmOavmdeCY61/uHrBTFdlU65e47zrELMmGYnEXSsEyBzXS4Dzh0DHCEk
	8T8PcuyQ8+BFt38usAa+v/RU+BcOTMcCTkGzCnCkkhGERV0qqeiVXsj2zYUSIygBzkHi
	X7tCzHCxQ1QAtQWyP0KGd0jCPfeQ708OMCyxwglH+zkBK0mgqIN83JC7LGDupRt+ijiI
	gpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZzJfCmQviDgb5h0jIgVcWo1BqPm7gzDHhKxabUzi/mg=;
	b=Whc3TmaibOSIuBAtUbCB+aR615RJ6+FXFzYovqCr9te1B7oKb9BzUZlUMapcP0m5Rv
	9vq4LprVGVRwEFktOlm9OvSJi+hBWC7qSOCUfFJfRF/kqdAcYY+jwonAU9Pj9mUUbvlE
	Cg4t2PgLY1ArsTx2hevb20rFYYB51UyMJKOWDjKB3Cvlt/rahiQJfUOO2yAomD0NI4b+
	bevxv8P5VR7jI2DT86pFRPpgfRi08sXVdyuMUbwc9tZ+lryQ8IIQFcKnHvpsdzt9ugk2
	ToOZCsa0gLF28YfcFn/rvLNlWR2hsNvRSIDW145j2fg10O6WhnB9QEJaMA++JN91yNZd
	8Qew==
X-Gm-Message-State: AIVw110+NMB8iL1Jw/GlwuF7oekqg7JCWSQCWWbMhylqe0f8IedWH5RG
	SYo4MLMqy3g8YHy/
X-Received: by 10.84.209.165 with SMTP id y34mr844519plh.200.1500347427905;
	Mon, 17 Jul 2017 20:10:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:09:59 -0700
Message-Id: <20170718031013.44536-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/17] multipath-tools: Include limits.h for PATH_MAX
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-kpartx-include-limits.h-for-PATH_MAX.patch | 29 ++++++++++++++++++++++
 .../multipath-tools/multipath-tools_0.7.1.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 000000000..46dd8e23b
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-kpartx-include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,29 @@
+From 330028a5a904a0da3788141030e614569dc5aaa7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 23:28:12 -0700
+Subject: [PATCH] kpartx: include limits.h for PATH_MAX
+
+lopart.c:76:12: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'INT8_MAX'?
+  char path[PATH_MAX];
+            ^~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kpartx/lopart.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kpartx/lopart.c b/kpartx/lopart.c
+index 7005445..5efe5dc 100644
+--- a/kpartx/lopart.c
++++ b/kpartx/lopart.c
+@@ -22,6 +22,7 @@
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <unistd.h>
++#include <limits.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+ #include <sys/mman.h>
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
index 93312116f..610ba7a94 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.1.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0012-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
            file://0013-Always-use-devmapper.patch \
            file://0014-Always-use-devmapper-for-kpartx.patch \
+           file://0001-kpartx-include-limits.h-for-PATH_MAX.patch \
            "
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-- 
2.13.3


