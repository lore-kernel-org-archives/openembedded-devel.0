Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 171387C711
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2019 02:50:46 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id y4so12296418pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 18:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FVN9Fh/Z1jL5cv+qAqzWT6OVvH87k8mzaaXfd8fuUcs=;
	b=NApWBeCXw2RYCZgqFEj1jAUdyDYluws4EFurXSpzxnBBGyLFTSR1Yo3NBq4ElGqWUd
	wXVTp0uPJ6/dE+6G4yoihn9TukvD4RmW3SD8917ZnaDy84YmmK66WclYDM4RmyYxN/i7
	cfDGNH4gBfVzYvZcMW6tf1HqwI25DVBCTZZSlByqh1xDktFwYuF8aLJ2ENDEfvA+eb5z
	uo0XR8XDrDfWuWvd/glAKhyFf91He1X+SVwMp/w4UsB/VilAFy3bziWN5qLpUf3v93Sr
	h2dNSaTicbIJqJNEd+BtnYSePdkWj7ew3Z8OJQlAX6AnfoC+Rz3MhmJ17fvqy+MBufWw
	WmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FVN9Fh/Z1jL5cv+qAqzWT6OVvH87k8mzaaXfd8fuUcs=;
	b=KfODov5OBZVBBGaTZYcmaohZRc8aYAx1ZyZr48yjxFLNjal5GdAxO1FAzGA/NkH15q
	tZfnpWjTqkGnuVR2r4kq1vqZsQNukcSrns3QTzA1KV2fibfaSK+QVEL0WzloQxVDFh7f
	EDKFVearZEIF+dcO87hpeOEvvSjS8e8twf84Nv0MJSDaZqqy8EAF0WK7BV/jvr1Q1Zue
	QjY3JxU8hv2fsywm876fQK/ygM1DqlHr2M2+9vCA9DFOFyhQXq3MC39iK/kixrEAE1UP
	U1DNd3EZRol5pue7heyUMt/Bn76gZN5xwKa1OkpIZmptizaHjmOhcWwIB994E3WqVdo4
	4S2Q==
X-Gm-Message-State: APjAAAUEbq+TaKd9GbWy7NT7D22v7J62QlwigL+jJrVm8OkJidxiSIQ7
	Uh+XYOM+KTo1reeB52rM1A1JF8Oc
X-Google-Smtp-Source: APXvYqxdekGx0jHpk8sv+0mrEsvqGbG4nMRYGgex6x5QfbWG8cNlLI53Aw5iUusWXk7C55r+V22Gcg==
X-Received: by 2002:a63:8948:: with SMTP id v69mr8232107pgd.140.1551495047684; 
	Fri, 01 Mar 2019 18:50:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id z7sm46600905pfl.4.2019.03.01.18.50.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 18:50:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2019 18:50:34 -0800
Message-Id: <20190302025034.10954-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190302025034.10954-1-raj.khem@gmail.com>
References: <20190302025034.10954-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] uftrace: Upgrade to 0.9.2
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
X-List-Received-Date: Sat, 02 Mar 2019 02:50:47 -0000
Content-Transfer-Encoding: 8bit

Drop pathes which are upstreamed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-include-dlfcn.h-for-RTLD_DEFAULT.patch | 39 -------------------
 .../{uftrace_0.8.3.bb => uftrace_0.9.2.bb}    |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.8.3.bb => uftrace_0.9.2.bb} (89%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch
deleted file mode 100644
index fe7aac9318..0000000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From cdf7f2e394fcfb93a61f509ae3388f29540a6b35 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Sep 2018 11:56:13 -0700
-Subject: [PATCH] include dlfcn.h for RTLD_DEFAULT
-
-Fixes
-plthook.c:128:41: error: use of undeclared identifier 'RTLD_DEFAULT'
-
-Upstream-Status: Submitted [https://github.com/namhyung/uftrace/pull/487]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libmcount/plthook.c | 1 +
- utils/debug.c       | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libmcount/plthook.c b/libmcount/plthook.c
-index d9d84f0..d54f5e8 100644
---- a/libmcount/plthook.c
-+++ b/libmcount/plthook.c
-@@ -6,6 +6,7 @@
- #include <sys/mman.h>
- #include <pthread.h>
- #include <assert.h>
-+#include <dlfcn.h>
- 
- /* This should be defined before #include "utils.h" */
- #define PR_FMT     "mcount"
-diff --git a/utils/debug.c b/utils/debug.c
-index 2134b09..5460def 100644
---- a/utils/debug.c
-+++ b/utils/debug.c
-@@ -13,6 +13,7 @@
- #include <assert.h>
- #include <limits.h>
- #include <inttypes.h>
-+#include <dlfcn.h>
- 
- #include "utils/utils.h"
- 
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.2.bb
similarity index 89%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.9.2.bb
index 5963e5d690..4f4016895d 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.2.bb
@@ -10,10 +10,9 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-# v0.8.3
-SRCREV = "8b723a6fae2ef30495cd6279774fba9c95cd9c88"
+# v0.9.2
+SRCREV = "66fc1fb973f4a44aecd216541405ffe05196f11e"
 SRC_URI = "git://github.com/namhyung/${BPN} \
-           file://0001-include-dlfcn.h-for-RTLD_DEFAULT.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.21.0


