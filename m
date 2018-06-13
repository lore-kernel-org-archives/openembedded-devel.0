Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2E05F7450D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:35:13 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id f1-v6so926730plt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 23:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+Bd7RKV6IrhNn0AexGKhf04ncgGOoHqlK0YWxS/uf2Y=;
	b=U0v465XQg9hH/vM5tf/w1bHrArv6DykhypQN47T07guXoanCIqZVfO+Dh6Yt9ihsqG
	u3rgQ9l7reb8kRIXrNMQ2habSp1Qv3tfqTHPBeMVDA5hsOofBAUYxCvTwL6rccyzHtIr
	aGHcPmUbLjzSyAp2MEQ8shtWQbOKZ2rNMpk+PWK+O6kVm4R0T5SKlOmqJJ87EBH3JRYL
	lFjlN7eqBuFsT8w9TDZLpCmMc7L3vB00sEmduNHGhBB/A/HY8PwXecZPKYbSNjdunRpF
	bdnE6wlWZRa2oIuN1MN5nVcwutmdrDeG0lvR2TPtJDgpg9xgomy2O/xQYN8MOr9i27Kn
	3SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+Bd7RKV6IrhNn0AexGKhf04ncgGOoHqlK0YWxS/uf2Y=;
	b=i/hKPeyO1jAJitnnciuQHuGaYF2FrBXAnMXWJ7W1rKo6TFoVjuS7gLzuMk9UmEfn5n
	j5tMv6IYdK3wzmqfeDMgGzvllHIWgGwtfol8lLVrwhvg6DU3wBMJ0MJRrxU/iq2CXhWD
	HZRwhizsE/xuXxO5ie6d7hxKulzSin2w7qmzd6Lg/VGk39bkkZs8sTFRilSeTTH+GMKB
	0+kF2J6tEDyRorieJQ0sIemsvngcdhBFs/CYPnEPZ9pbzHvlL3v0cJYF4X0WFVSAl6kA
	7di87iMl1qwUOG/c4NTUT537wxewc9/18xHRKC0XLRk3pxu2Ew0S8Mb73dvvEgHsfjOo
	LSJw==
X-Gm-Message-State: APt69E0e42g5woUEIemhDmmzI/+wV55E/4FyGQc6NZdbirQ3EegVNu7u
	royyyAS4Hna944S4g3bX0pEeMA==
X-Google-Smtp-Source: ADUXVKIdc1EGwv6cDAuqKXvRV4hBy25VAL1OLg/ckIyLgG0weJWklvLmlGVYCniOpXhY0SLwarsudQ==
X-Received: by 2002:a17:902:264:: with SMTP id
	91-v6mr3668351plc.341.1528871713963; 
	Tue, 12 Jun 2018 23:35:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	b83-v6sm3525707pfe.159.2018.06.12.23.35.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 23:35:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 23:35:10 -0700
Message-Id: <20180613063512.1755-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613063512.1755-1-raj.khem@gmail.com>
References: <20180613063512.1755-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 3/5] celt051: Fix building testcases
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
X-List-Received-Date: Wed, 13 Jun 2018 06:35:13 -0000

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


