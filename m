Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id B6EF46C4AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b5-v6so1986585pla.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9fmTGxCDMO9tDYli9EI43dyRbqLj5jfkKonT1UKTp90=;
	b=TxIGlmT7fH1UQ3+Epa5ahYhcb7qoZnwBZmtnWQP0BUWEEtx1LWLA6FgSiXhB2fspuP
	a55r0u6x3vVIKGcBuTRp2V+QRQkjEA0D47wpPeNRl2R0Fs5JzEyS1Fn/3V/6hxMQ3xmE
	1JxieCkFYlcipyse8A3tESl5RNaMNi/N3OpEfPW6qe9yXZxNaMhqYHMQh2z/7EGk2jQw
	fWRFJE5D/zepYvwS0l4qiwErOVNV3zve8r5vwY7sNiiEgzXp9yQ9/02NEj9KtXC31sBf
	S6n3fzLwqw8GPr8HxlWYU0FRlv6GlCOcfGoGXjCKCQEmZgquHpPOBhsEUGUgnlgNpVg+
	QC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9fmTGxCDMO9tDYli9EI43dyRbqLj5jfkKonT1UKTp90=;
	b=iBZCN5I8oEj/lLN3m7VXnIU7t+DyINk3vOW+KiRWNu/cTZOJB4uBLGEMv6pspfC89n
	3oobmFhpl2tO2L9aagWRUt+aa+cZlS1KMvCjMzLgo0eEKNqVeUkmIXXdu2bBMdO+n1B1
	e12Z6cTN+mPMwufiYfA7DDqeiozVc6lzSTm9ZNUy7r3vRAReQAW49pIzaCFW2r1dqX7p
	jScGI1IwQQO4jPfh/NIK5gPf0QzG1K40VA75XOGjezRQjMYCFQgl15v9c6/bhXpp0Zxx
	P3TvYtFoDrDZYPivGyT1fL1Qqxn47T+gf96EJI04WfwHqNnnARhdculgl8Z+ETSskIu8
	wuPQ==
X-Gm-Message-State: AGRZ1gKMOFglBKHg8Fw1HPDp8cG3/2DvbBrdvSoqGoBbDcgbsuVpOLSu
	L/mduakOVdK0EIftjqTi08LjMqm6Jj0=
X-Google-Smtp-Source: AJdET5fNKCe8eK8BcVv13XqDznhXQ5Rg0jcoKx//NbJEqEClJvysMyb6dip+Nnb/GcduqY7J8LfiLA==
X-Received: by 2002:a62:5444:: with SMTP id i65mr3829539pfb.193.1542746309262; 
	Tue, 20 Nov 2018 12:38:29 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:10 -0800
Message-Id: <20181120203814.11500-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120203814.11500-1-raj.khem@gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Ivan Maidanski <ivmai@mail.ru>
Subject: [meta-oe][PATCH 06/10] bdwgc: upgrade 7.6.0 -> 7.6.8
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
X-List-Received-Date: Tue, 20 Nov 2018 20:38:28 -0000
Content-Transfer-Encoding: 8bit

From: Ivan Maidanski <ivmai@mail.ru>

Highlights of this upgrade:
* Fix numerous bugs (concurrency, overflow, CVE-2016-9427, etc.)
* Fix various typos in comments and documentation
* AddressSanitizer and MemorySanitizer support
* RISC-V support

See the following for detailed changes:
* https://github.com/ivmai/bdwgc/releases/tag/v7.6.2
* https://github.com/ivmai/bdwgc/releases/tag/v7.6.4
* https://github.com/ivmai/bdwgc/releases/tag/v7.6.6
* https://github.com/ivmai/bdwgc/releases/tag/v7.6.8

Signed-off-by: Ivan Maidanski <ivmai@mail.ru>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-check-for-NO_GETCONTEXT-definition.patch | 29 -------------------
 .../bdwgc/bdwgc/musl_header_fix.patch         | 27 -----------------
 .../bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb}  |  6 ++--
 3 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
 delete mode 100644 meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
 rename meta-oe/recipes-support/bdwgc/{bdwgc_7.6.0.bb => bdwgc_7.6.8.bb} (85%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch b/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
deleted file mode 100644
index 8ef774f0f2..0000000000
--- a/meta-oe/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-configure.ac: add check for NO_GETCONTEXT definition
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[yann.morin.1998@free.fr: add a comment, change variable name, use
- AS_IF, remove debug traces, use AC_CHECK_FUNCS (as suggested by
- Thomas)]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
----
-Upstream-Status: Pending
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
---- bdwgc-7.2f.orig/configure.ac	2014-06-01 19:00:47.000000000 +0200
-+++ bdwgc-7.2f/configure.ac	2014-12-23 14:13:11.585716713 +0100
-@@ -365,6 +365,12 @@
-   AC_MSG_RESULT($ac_cv_fno_strict_aliasing)
- fi
- 
-+# Check for getcontext (uClibc can be configured without it, for example)
-+AC_CHECK_FUNCS([getcontext])
-+AS_IF([test "$ac_cv_func_getcontext" = "no"],
-+  [CFLAGS="$CFLAGS -DNO_GETCONTEXT"
-+   CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"])
-+
- case "$host" in
- # While IRIX 6 has libdl for the O32 and N32 ABIs, it's missing for N64
- # and unnecessary everywhere.
diff --git a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch b/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
deleted file mode 100644
index 4a18496650..0000000000
--- a/meta-oe/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Add missing header to avoid:
-
-| 1472659610.016355: ../git/pthread_stop_world.c: In function 'GC_brief_async_signal_safe_sleep':
-| 1472659610.0540252: ../git/pthread_stop_world.c:397:22: error: storage size of 'tv' isn't known
-| 1472659610.0540252:        struct timeval tv;
-| 1472659610.0540252:                       ^~
-| 1472659610.054099: ../git/pthread_stop_world.c:397:22: warning: unused variable 'tv' [-Wunused-variable]
-| 1472659610.054099:        struct timeval tv;
-| 1472659610.054099:                       ^~
-| 1472659610.054099: Makefile:1530: recipe for target 'pthread_stop_world.lo' failed
-
-in musl builds.
-
-Upstream-Status: Pending
-
-Index: git/pthread_stop_world.c
-===================================================================
---- git.orig/pthread_stop_world.c
-+++ git/pthread_stop_world.c
-@@ -45,6 +45,7 @@
- #include <semaphore.h>
- #include <errno.h>
- #include <unistd.h>
-+#include <sys/time.h>
- #include "atomic_ops.h"
- 
- /* It's safe to call original pthread_sigmask() here.   */
diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
similarity index 85%
rename from meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
index dcb68f0282..18722fb441 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_7.6.0.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_7.6.8.bb
@@ -19,12 +19,10 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
 HOMEPAGE = "http://www.hboehm.info/gc/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.QUICK;md5=4f81f24ec69726c312487c2ac740e9e3"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=728501f233050290314d33fb07d883eb"
 
-SRCREV = "8ac1d84a40eb7a431fec1b8097e3f24b48fb23fa"
+SRCREV = "8b2a98209a59c92e1be318e4acda507d83175f4d"
 SRC_URI = "git://github.com/ivmai/bdwgc.git \
-           file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
-           file://musl_header_fix.patch \
           "
 
 FILES_${PN}-doc = "${datadir}"
-- 
2.19.1


