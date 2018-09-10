Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 43324753D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:39 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id ba4-v6so9149954plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ghepz7qLAKgkzzV46OFOK/q1OgkhYSDmRd+4Gunuhog=;
	b=sKOW3FWY4d/NHitzHYUl39WjTnpNCwIrHTUkQBbv2bse/TI30h3rXTF4JIXVx9CGdN
	UCSYBKSi7jmJ7Of/D/rpjOmmTKgNonleuHjt25/m+hZ/XZmIkNHqOverWhNcld3P7Uvn
	gKrR2DcAcL7DckKLtDyAdl18h7Y8FJR0Gnud3seFkVnw35gM76uDgWS+U2TkczcsV/q1
	kZJ0LtUtFMhAzz4nf7QZ2bqWTawZ6aGMNHKu1FWUqKeWAdgwgxcwdk0d0EErHwBwnl0a
	oqlsCBYJt10vDh/Hug+Sf0MaOye2mHc5LE/0pGQ1wg5pXOnCPYm2IRmtNEtdCw6gyzdQ
	STDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ghepz7qLAKgkzzV46OFOK/q1OgkhYSDmRd+4Gunuhog=;
	b=dmNIusdc8XDWD/vRH0Rj9Z89VGlmOQKZDxZN/7c+pBGo/nVfEGEZ1CXQcHaMxGra4f
	vWHXzE7y+s02y43YMbloo2ubDcYQ3RbeoESMmSNJ8WVdthPpBkvtzG7b6RjpsYiomO5O
	7qMTzYdJ296O/qV+RGFJvrXbTxc2AC/39xkCkaCdwGaMSqGMHdI4KMhC8BNjTIkAb7UQ
	NHMmxSY7TaXL0QaDovKU8MIyZAi7FXgWwRSK0chR0jKud1FpTepU3QkHkAUSP7iIH2f9
	FvbDU4YCcBZZf/4ncrhqY94Yt89ndjdN3Xzij48UpJFyYTX5W7HBBd21ieYIRQNcZe2z
	1n6Q==
X-Gm-Message-State: APzg51Bm26alRU+ArlrKvEG3gYcus9o+KCorttcaCAHu4cqbro8/b788
	ct/uaylG2zpJhhfzJbE/aJo+6+GA
X-Google-Smtp-Source: ANB0VdYHkzIHHlTwPKnLryAHQKuJkmQBcab0+m30Rr9pKv94+PKdm8DyAGqk5v8Oe7iUpIvFLhdHsA==
X-Received: by 2002:a17:902:d917:: with SMTP id
	c23-v6mr19962394plz.65.1536555999849; 
	Sun, 09 Sep 2018 22:06:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:21 -0700
Message-Id: <20180910050629.16170-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 02/10] uftrace: Upgrade to 0.8.3
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
X-List-Received-Date: Mon, 10 Sep 2018 05:06:39 -0000

* Deliberately provide a non existing path to with_elfutils so it does
  not copy libelf.so into its staged install and become a provider for
  that library while elfutils should be the legit provider and this
  package should just list it in its rdeps

* Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Fix build with musl

 ...001-include-dlfcn.h-for-RTLD_DEFAULT.patch | 39 +++++++++++++++++++
 .../{uftrace_0.8.bb => uftrace_0.8.3.bb}      | 12 ++++--
 2 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.8.bb => uftrace_0.8.3.bb} (65%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch
new file mode 100644
index 0000000000..fe7aac9318
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-include-dlfcn.h-for-RTLD_DEFAULT.patch
@@ -0,0 +1,39 @@
+From cdf7f2e394fcfb93a61f509ae3388f29540a6b35 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Sep 2018 11:56:13 -0700
+Subject: [PATCH] include dlfcn.h for RTLD_DEFAULT
+
+Fixes
+plthook.c:128:41: error: use of undeclared identifier 'RTLD_DEFAULT'
+
+Upstream-Status: Submitted [https://github.com/namhyung/uftrace/pull/487]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libmcount/plthook.c | 1 +
+ utils/debug.c       | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libmcount/plthook.c b/libmcount/plthook.c
+index d9d84f0..d54f5e8 100644
+--- a/libmcount/plthook.c
++++ b/libmcount/plthook.c
+@@ -6,6 +6,7 @@
+ #include <sys/mman.h>
+ #include <pthread.h>
+ #include <assert.h>
++#include <dlfcn.h>
+ 
+ /* This should be defined before #include "utils.h" */
+ #define PR_FMT     "mcount"
+diff --git a/utils/debug.c b/utils/debug.c
+index 2134b09..5460def 100644
+--- a/utils/debug.c
++++ b/utils/debug.c
+@@ -13,6 +13,7 @@
+ #include <assert.h>
+ #include <limits.h>
+ #include <inttypes.h>
++#include <dlfcn.h>
+ 
+ #include "utils/utils.h"
+ 
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
similarity index 65%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
index 82b179521c..e377a5c9d5 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
@@ -10,15 +10,19 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "5af9ff9fa89c340617e52c8ed05798b352a7145c"
-SRC_URI = "git://github.com/namhyung/${BPN}"
+# v0.8.3
+SRCREV = "8b723a6fae2ef30495cd6279774fba9c95cd9c88"
+SRC_URI = "git://github.com/namhyung/${BPN} \
+           file://0001-include-dlfcn.h-for-RTLD_DEFAULT.patch \
+           "
 S = "${WORKDIR}/git"
 
 LDFLAGS_append_libc-musl = " -largp"
-EXTRA_OECONF = "ARCH=${TARGET_ARCH}"
+EXTRA_UFTRACE_OECONF = "ARCH=${TARGET_ARCH} \
+                        with_elfutils=/use/libelf/from/sysroot"
 
 do_configure() {
-    ${S}/configure ${EXTRA_OECONF}
+    ${S}/configure ${EXTRA_UFTRACE_OECONF}
 }
 
 FILES_SOLIBSDEV = ""
-- 
2.18.0


