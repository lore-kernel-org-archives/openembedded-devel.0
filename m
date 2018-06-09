Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 036F7751D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:44:14 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id c23-v6so9461205plz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 23:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+Bd7RKV6IrhNn0AexGKhf04ncgGOoHqlK0YWxS/uf2Y=;
	b=UIPNtXhF3MyEl2/V7LRlt7PPefNYDMk2cndp1iYKBTWXVk41hoMixDlqMsad2hZJ91
	i/Ho1pb2/IJm7FTBzLwgGzMmIME9wrQnB+DOmXnccGEItQ5w2gEyKKOR/uBBMx3JoFCN
	1Q6acwVtfP3wBMTVrZrhGZKHgaXAyMHpmfmwlQyYx8y3aef23CziCy+ZTu0J19d0wu+W
	ZJc2/yysE/aB/EbqqYq7dsjYitq3VtfhEuCxYmrG8l2K53WHC2iUsKY807j2VRbML+4/
	u5RBR7ESWf0xUAQFUn1sD719UUPt4akM7LyXg61bFYz1iOlsgr6wfbM/wzUbUbOIoYuJ
	zJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+Bd7RKV6IrhNn0AexGKhf04ncgGOoHqlK0YWxS/uf2Y=;
	b=QFU9VVQrIWU4JGqEIPO6ZMaJnG29Rz4aOEoOUjYOqAup2epLb9u/jRiSaBqV0VLbi5
	1rbW2621TtCSEkPJdeiSg4VFKdpLG5v19NzCeN/BDk/W9ylMDglxjS0V5tpcSyINNJJK
	leRdVUfhURB1QDAch0ltQqUliwOn/xd0F7qdXw9LFuscsMeFYxBfrVcn1x36TKaPuhP7
	BH2sD8bdnezd6b/37KQcPIUZq3R9P8cg2uoUgggwGwnJyX22EFD1BrWKzdbiFfetJKsi
	QVq4k2pBxtelUXhu73GBxeeA+LkMox6UOfxNnNIiPd/HoWkIaBsQORsvyxCF4SBPcofW
	G/lw==
X-Gm-Message-State: APt69E0Val9oRqnpCIIKEdKrLcoajZ/AGjqI9t7Bx5uqHSqWnKgC8iHd
	z8VTEvOboOxBb+NAx+sMgHhQ6A==
X-Google-Smtp-Source: ADUXVKJyvgbyX5rZtYIOd693a9iJCwbVp3ehJcww8Cc3/cj0aonul2t+Y+tg7Z8++P/thm886b1efA==
X-Received: by 2002:a17:902:8f93:: with SMTP id
	z19-v6mr9640865plo.166.1528526655778; 
	Fri, 08 Jun 2018 23:44:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm26926352pfj.173.2018.06.08.23.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 23:44:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 23:44:10 -0700
Message-Id: <20180609064415.10270-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 1/6] celt051: Fix building testcases
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
X-List-Received-Date: Sat, 09 Jun 2018 06:44:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tcode.c-into-test-sources-to-provide.patch | 55 +++++++++++++++++++
 .../recipes-support/celt051/celt051_git.bb    |  5 +-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/celt051/celt051/0001-tests-Include-entcode.c-into-test-sources-to-provide.patch

diff --git a/meta-networking/recipes-support/celt051/celt051/0001-tests-Include-entcode.c-into-test-sources-to-provide.patch b/meta-networking/recipes-support/celt051/celt051/0001-tests-Include-entcode.c-into-test-sources-to-provide.patch
new file mode 100644
index 0000000000..cc893f0999
--- /dev/null
+++ b/meta-networking/recipes-support/celt051/celt051/0001-tests-Include-entcode.c-into-test-sources-to-provide.patch
@@ -0,0 +1,55 @@
+From 61fbdddb660c5944ac23b820754a7c4cf4eee097 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jun 2018 19:29:03 -0700
+Subject: [PATCH] tests: Include entcode.c into test sources to provide
+ definitions of functions e.g. ec_ilog()
+
+Fixes link errors in tests
+| /usr/src/debug/celt051/0.5.1.3+gitAUTOINC+5555aae843-r0/git/tests/../libcelt/rangedec.c:202: undefined reference to `ec_ilog'
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/cwrs32-test.c  | 1 +
+ tests/ectest.c       | 2 +-
+ tests/laplace-test.c | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/cwrs32-test.c b/tests/cwrs32-test.c
+index 3a95df2..a159ab3 100644
+--- a/tests/cwrs32-test.c
++++ b/tests/cwrs32-test.c
+@@ -8,6 +8,7 @@
+ #include "rangeenc.c"
+ #include "rangedec.c"
+ #include "cwrs.c"
++#include "entcode.c"
+ #include <string.h>
+ #define NMAX (10)
+ #define MMAX (9)
+diff --git a/tests/ectest.c b/tests/ectest.c
+index aa35453..94eb9a3 100644
+--- a/tests/ectest.c
++++ b/tests/ectest.c
+@@ -5,7 +5,7 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <math.h>
+-#include "entcode.h"
++#include "entcode.c"
+ #include "entenc.c"
+ #include "entdec.c"
+ #include "rangeenc.c"
+diff --git a/tests/laplace-test.c b/tests/laplace-test.c
+index 3f98ab3..8e1fb4e 100644
+--- a/tests/laplace-test.c
++++ b/tests/laplace-test.c
+@@ -6,6 +6,7 @@
+ #include <stdlib.h>
+ #include "laplace.c"
+ #include "stack_alloc.h"
++#include "entcode.c"
+ #include "entenc.c"
+ #include "entdec.c"
+ #include "rangeenc.c"
diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index 850704f5af..116800522a 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -17,8 +17,9 @@ PV = "0.5.1.3+git${SRCPV}"
 SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
 
 SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https \
-    file://0001-configure.ac-make-tools-support-optional.patch \
-"
+           file://0001-configure.ac-make-tools-support-optional.patch \
+           file://0001-tests-Include-entcode.c-into-test-sources-to-provide.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


