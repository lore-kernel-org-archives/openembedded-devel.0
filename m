Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9A0786B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 06:04:09 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 36so2720277ple.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 22:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NbxO1Zwu6HEHK6C5BuMDcEAFOgr2XSCA1OhWXQ4BlFg=;
	b=APbK/WUdbL5rCEkAJXeKoD9d55BqNRYSymVDaTUAJfz5jMAfzakRiPvrkxowlTfC14
	ouPrQwm6Otwv/xuM80tB0I8on22AG7WNTtDshKbNOMlqj3eKDiLfTe/oBOjefqVzvhWr
	GHZz7zM6Ve1ji7U/zrqlDLvigjw+KMQa520vkGtxYMkiu/KEXYcvlGbmKbbfBK03R+o4
	m0esb/lYIKbrUVIOKioh/l/aRMxKu2QnF8+ykHlJRlRmvE7YhY4WNacgwERY51xl4sxN
	FVb6iaaFtrpjqS0k8/vsB64a3yGTG2BKCR28zmzN9aTVRPTfz+qEThHGzHGfdtfuG05z
	7qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NbxO1Zwu6HEHK6C5BuMDcEAFOgr2XSCA1OhWXQ4BlFg=;
	b=tcTu6kr6+3TUL6JehIXssQ5E8amoS8Du0hi5lZFdZin/BIk6HewTwA5VymYj94+HVM
	20Se7FG4fBSj7xDWK1AfinerBy7bBihRN2DBWtX9nq9/CDHJ8L7X32Mo+N1roW9r8bce
	/m4U6eqIJtBK8RBysXsdxZtZiF9h7ba8Mpy0XXH51J6UVLU7gxlmZcX8hPLs4HbQY7Nw
	Maz8a9VGA0CDP1eyy66V0WOzP4KkF+dJhldPRDk1FwqyTs9foPuzb62L7JsyLAO0hCiN
	F5OujaD+gaKcN08L2tO6rSc/054Hzg/WQmKjxOdOcF/hCVgnqQ5OVjuWIwTbJKDY4uT/
	Im8w==
X-Gm-Message-State: AKwxytfj6X87JTfA0g/w4A2ODdv+NPJ3bQgFhTPYivid4s6tOjn3YKEk
	XTQ/B3KT0O4SUWbOPy3FuRUSXA==
X-Google-Smtp-Source: AH8x227WFmBQXfB+5Uc//ENje5R+c/xGo69IS2Vq8EefDMTCJCu9Cg22NG+YtuD8a5rPIhz50aldOg==
X-Received: by 2002:a17:902:4683:: with SMTP id
	p3-v6mr22370037pld.408.1517465050570; 
	Wed, 31 Jan 2018 22:04:10 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	k29sm26264452pgn.28.2018.01.31.22.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 22:04:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Jan 2018 22:03:55 -0800
Message-Id: <20180201060355.5218-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180201060355.5218-1-raj.khem@gmail.com>
References: <20180201060355.5218-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] stress-ng: Upgrade to 0.09.14
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
X-List-Received-Date: Thu, 01 Feb 2018 06:04:09 -0000

drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0003-stress-fcntl.c-fix-syntax-errors.patch    | 47 ----------------------
 .../{stress-ng_0.09.09.bb => stress-ng_0.09.14.bb} |  9 ++---
 2 files changed, 4 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-errors.patch
 rename meta-oe/recipes-test/stress-ng/{stress-ng_0.09.09.bb => stress-ng_0.09.14.bb} (73%)

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-errors.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-errors.patch
deleted file mode 100644
index 4b6a9b391..000000000
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-errors.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8537dcafb12be4d986b571f1e1d9f3ceecdc8e63 Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@linux.intel.com>
-Date: Sun, 7 Jan 2018 21:29:12 -0800
-Subject: [PATCH] stress-fcntl.c: fix syntax errors
-
-Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-
-Upstream-status: Accepted
-(commit 61d93d6857256cd49df6a6302caf6e7bb69b0f46)
----
- stress-fcntl.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/stress-fcntl.c b/stress-fcntl.c
-index 7c15d28..b7eade2 100644
---- a/stress-fcntl.c
-+++ b/stress-fcntl.c
-@@ -173,7 +173,7 @@ static int do_fcntl(const args_t *args, const int fd)
- 		owner.pid = getpgrp();
- 		ret = fcntl(fd, F_SETOWN_EX, &owner);
- 		check_return(args, ret, "F_SETOWN_EX, F_OWNER_PGRP");
--#else if defined(HAVE_GETPGRP) && defined(F_OWNER_GID)
-+#elif defined(HAVE_GETPGRP) && defined(F_OWNER_GID)
- 		owner.type = F_OWNER_GID;
- 		owner.pid = getpgrp();
- 		ret = fcntl(fd, F_SETOWN_EX, &owner);
-@@ -202,7 +202,7 @@ static int do_fcntl(const args_t *args, const int fd)
- 		owner.type = F_OWNER_PGRP;
- 		ret = fcntl(fd, F_GETOWN_EX, &owner);
- 		check_return(args, ret, "F_GETOWN_EX, F_OWNER_PGRP");
--#ele if defined(F_OWNER_GID)
-+#elif defined(F_OWNER_GID)
- 		owner.type = F_OWNER_GID;
- 		ret = fcntl(fd, F_GETOWN_EX, &owner);
- 		check_return(args, ret, "F_GETOWN_EX, F_OWNER_GID");
-@@ -436,7 +436,7 @@ ofd_lock_abort:	{ /* Nowt */ }
- #endif
- 		};
- 
--		ret = fcntl(fd, F_GET_FILE_RW_HINT, &hint)
-+		ret = fcntl(fd, F_GET_FILE_RW_HINT, &hint);
- 		if (ret == 0) {
- 			for (i = 0; i < SIZEOF_ARRAY(hints); i++) {
- 				hint = hints[i];
--- 
-2.14.3
-
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb
similarity index 73%
rename from meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb
rename to meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb
index 24f55ada2..7fab43025 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.14.bb
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "zlib libaio"
 
 SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
+           file://0002-stress-fcntl-fix-build-for-musl.patch \
           "
 SRC_URI_append_libc-musl = " \
     file://0001-Several-changes-to-fix-musl-build.patch \
-    file://0002-stress-fcntl-fix-build-for-musl.patch \
-    file://0003-stress-fcntl.c-fix-syntax-errors.patch"
-
-SRC_URI[md5sum] = "6e4df71095e780654ccc0a713b8423fe"
-SRC_URI[sha256sum] = "e993fddb1d990a0cdb23b2af6cf6c417a1c09e155ada7c558ad80eae8a5feed3"
+    "
+SRC_URI[md5sum] = "1f8b6c2c2830704d2a2814c16082d48e"
+SRC_URI[sha256sum] = "02cac34a5cb041197af60c1867844c6cbb089a6d10a38cdcf7b8f27bfaa6ef8f"
 
 UPSTREAM_CHECK_URI ?= "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
 UPSTREAM_CHECK_REGEX ?= "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.16.1


