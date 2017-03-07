Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2BF774E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:03 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 187so8405790pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gGxkuArLh1mzCOiJITuAeza9rQX4PjM6ZtM4GFasOBE=;
	b=iXdU7WUQ/znS3oQc5+lIDCzQkqQ7tR4EU/Pbcl/yV9hJqKwbfxVR/Rrms++JAA8ARa
	hSQKSJe8ywyVS3vxgIbNLnZaYJI2yxnduQLfwFVSBFcdhtuvXjwOSCl576s053nMONfL
	egC5GFF9k8bCyYc8dOX+HoWnAJ4/6jYZcdcG8Nrx/v/yLV2p3NZy5hZTj0K7AhuLpRJ+
	YHruJu1L4If9lNcV3e5cFk3K+ZZOtNu/QwKHrSELEeMbPz5FbWYaVUHQ8psC9StsccjC
	LxlKwt3p0TmSh2DvoRjSInf10TEFxmoW1bjvuqX4z0nKTa0wVaO9tjs7MC406RH84KKI
	Md0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gGxkuArLh1mzCOiJITuAeza9rQX4PjM6ZtM4GFasOBE=;
	b=OHKz+lAWerGkEbB56QEbd6z6ocTtuOsnWA99Leoo1TSSakzIbUYWUHhmidDCNzT5b8
	eJOgutlJgPqh31caIhGvav2FBZBhGlkp8l1+AanogluTwBzMGtt4PywdKi+0Qy/XdZY8
	HClsDVMyxYTr3wnwSmAU0cgsq381sVP5rSfjbMMCdJcPq4FGa4sWwc133VJinA6uGkcb
	6QwINDmvhF4C/WVVwBLSqUvZYMEePdiITJcF16OIgu/upkAdjv6hbyBl/7GfGVU3Ib79
	r0YinrvWszCJM5Ym4sPKBniZhaV+ESQUUJJuED5uQJQcU71x/iUcL87MHvKNfydaw7UV
	E9zw==
X-Gm-Message-State: AMke39nCeib6Rq8nuNOPV4ok+4fSp0QiqOpQkFyOMbfwC+F03grMwGMQp74WONY4mVEo/Q==
X-Received: by 10.84.192.137 with SMTP id c9mr32937621pld.17.1488870845154;
	Mon, 06 Mar 2017 23:14:05 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:41 -0800
Message-Id: <20170307071349.16444-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/14] gperftools: Fix build with clang
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Support-Atomic-ops-on-clang.patch         | 33 ++++++++++++++++++++++
 .../recipes-support/gperftools/gperftools_2.5.bb   |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
new file mode 100644
index 000000000..e582c0da6
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
@@ -0,0 +1,33 @@
+From ea9f64eb2cdf3be6c4dc65fa1472d854616e43ca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Mar 2017 13:38:46 -0800
+Subject: [PATCH] Support Atomic ops on clang
+
+clang pretends to be gcc 4.2 which is a lie
+it actually supports a lot more features then
+gcc 4.2, here it depends on gcc 4.7 to enable
+the atomics and fails for clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/base/atomicops.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/atomicops.h b/src/base/atomicops.h
+index be038f3..f1a21ff 100644
+--- a/src/base/atomicops.h
++++ b/src/base/atomicops.h
+@@ -118,7 +118,7 @@
+ #include "base/atomicops-internals-linuxppc.h"
+ #elif defined(__GNUC__) && defined(__mips__)
+ #include "base/atomicops-internals-mips.h"
+-#elif defined(__GNUC__) && GCC_VERSION >= 40700
++#elif defined(__GNUC__) && GCC_VERSION >= 40700 || defined(__clang__)
+ #include "base/atomicops-internals-gcc.h"
+ #else
+ #error You need to implement atomic operations for this architecture
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
index 2e4479c9d..3cab42385 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
@@ -4,7 +4,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 DEPENDS = "libunwind"
 
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz"
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftools-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz \
+           file://0001-Support-Atomic-ops-on-clang.patch\
+          "
 
 SRC_URI[md5sum] = "aa1eaf95dbe2c9828d0bd3a00f770f50"
 SRC_URI[sha256sum] = "6fa2748f1acdf44d750253e160cf6e2e72571329b42e563b455bde09e9e85173"
-- 
2.12.0


