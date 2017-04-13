Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id CE9F277D5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:43 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c198so33255096pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9WDauMw7pcKwXeZkjwbNT2B/wxbtXpz+H15EJo3OoFY=;
	b=LxCmLATZKfIbyGHQR3+ZHguu1WmLdJOp/t2P5QOuj5I0m+s3wNQOY14ID7bT0s0D7Y
	6habqNTEvCMYg1Zlhojp7YX7aH6Z2DpqtY6e8AAQ0xKuMFgVzp6UJjVGKz0NEHDZ+A+j
	JHVdHTtoCjo3gza3vIoqm4xhiv1X969wxsFmm8CkS1u9QJ3VNLz+GPkIPwQJZnFnN3Rp
	SxdUipPyK5eUSBU8SQjkRMKvikEt9Pa/WPufCK4KXFsWtetU3CZaZ1Is5+hPURWRxXyT
	gzbctFHrBbEwBefF7FkCyySXjPX8Lev1FiMGlMCHPk0Qlppt5EWGFM2DqEk7N4aKatav
	5EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9WDauMw7pcKwXeZkjwbNT2B/wxbtXpz+H15EJo3OoFY=;
	b=IymrwqRZevrxeAbc/MQAcNWZPzHoepeYoGDd+QU6XkTq+JvHQgEr5w3L3p6GMGemWm
	taVH2XzUj7jE4IuSTe7xtyaSxebII6G7Lhf9SxBZJMVGaNVaLcrpkmw2QJxH5KJajEbR
	0f3hx17WQb1BNNls5LRAdMHhlD7NtSD+135F37EHn2EKHtCOrimGEJuguypb6xeMvBr1
	0LW97xYFxHFcE3tkn+C3CpKJfIhZvxBfzoZ5U3yErrYh/WD1EgojeHnXCbf/8m1O+c6G
	7IURr0Gr7N1NaXWlrHdEHO1NVjObmXB9xznMYHUid89CFSdisxsO8hgAvI5r0E5NarD5
	a5Ow==
X-Gm-Message-State: AN3rC/5JuR4lHyHpLw4aEeyXnBIchbKjk1Ev3O74EPrz1Vna8AZiUsrJ
	CMoh4ImfydkB+CEv
X-Received: by 10.98.64.88 with SMTP id n85mr4263953pfa.211.1492116104779;
	Thu, 13 Apr 2017 13:41:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:55 -0700
Message-Id: <20170413204106.30679-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 18/29] dash: Fix build with clang
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-printf-format-errors-with-clang.patch | 28 ++++++++++++++++++++++
 meta-oe/recipes-extended/dash/dash_0.5.8.bb        |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch

diff --git a/meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch b/meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
new file mode 100644
index 000000000..b3991faa8
--- /dev/null
+++ b/meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
@@ -0,0 +1,28 @@
+From 3ddf397febf47f8de9ca2805e92355ecb3ba0e9f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2017 12:37:54 -0700
+Subject: [PATCH] Fix printf format errors with clang
+
+error: format string is not a string literal (potentially insecure)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/jobs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/jobs.c b/src/jobs.c
+index c2c2332..dcb81c1 100644
+--- a/src/jobs.c
++++ b/src/jobs.c
+@@ -427,7 +427,7 @@ sprint_status(char *s, int status, int sigonly)
+ 				goto out;
+ #endif
+ 		}
+-		col = fmtstr(s, 32, strsignal(st));
++		col = fmtstr(s, 32, "%s", strsignal(st));
+ #ifdef WCOREDUMP
+ 		if (WCOREDUMP(status)) {
+ 			col += fmtstr(s + col, 16, " (core dumped)");
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
index 4961d7b83..78ca60d6f 100644
--- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
+++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives
 
-SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
+SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz \
+           file://0001-Fix-printf-format-errors-with-clang.patch \
+           "
 SRC_URI[md5sum] = "5c152209680dab3c319e8923f6c51378"
 SRC_URI[sha256sum] = "c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f"
 
-- 
2.12.2


