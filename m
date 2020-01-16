Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 559467F893
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 04:42:24 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q8so9582009pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aNsw/wjxE5jUlJ81Ler1WwZXTv2/Z3QTI04/45oCEOo=;
	b=h9mVcHYz4O5h2RM/3BK7gLj8s1UuWuQAoPHTY1edh05sTMv9NLMa6lJFdXWvzRxrtp
	I0CG6S3xeqnL5S7MRk44XTK8GQVMkYk5tB6p8bkQb2pZv6Cnz3Esn9lmIVPMiS9YYPgm
	YG106PnwVVkO9rslPjXxQ6/sGKijtnYcKT0fsShvgB57VOeK17c/Br+VVZ6YzVhs8OO4
	r8DxXV8jq3uJrzjvdiBcQP6AbxXeKo8+UOi7TD1E4vj8wqmIv+6rUNdSD83c3L8Yc4Fu
	PILZpPggAiZWRjwLHDW3BN6rCKFi1cw04wvFccwM6x7lnAnYUTwtTTX2unfL+zAQiLJ/
	vr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aNsw/wjxE5jUlJ81Ler1WwZXTv2/Z3QTI04/45oCEOo=;
	b=PlgnSglCI+30bkTGOO9EwNp6fubMsYZ81Sxwgasxwdk3zGDgERmUQ/DRe+8qztk34J
	m+q9+SmPxJouzpBUxATvRKkDOg1ModfG6RrdvgYrE/b2hgVdy/hVJU1K2nNENCFme3c4
	TT1sXozThDuShVRmJlYCIKaIM23MqlFEXy2SGIIyxaFR0skj/YOjSyiI+cnQPqL9V5C6
	HaXEa5S9pgxDUKGiQNfezAr95rILX3J/KSp6JW3cK3LFiBWvq/2Nw3OgYcVPL4ol1iKc
	V79OETryX6VO/RasXG3iLw4XMUXNF3rk5Otp4/X1qoFJP8wAuVn8Fr4tq2EBAnLCyu2+
	bUQg==
X-Gm-Message-State: APjAAAXI+wWzeJ/k7AuK0LP4cDbVZgO112TWt76HSe4oqJz/k5b0pf/a
	pxcc5AMX/pLuuPN7xBeGXLHGdt+gXmM=
X-Google-Smtp-Source: APXvYqw0s08FHYBfE+sCVqyfyBc9camyWim8X2TiHUzbzaWNFJ/BeqGBeoftLAJwLr4fiIJJUr2TIg==
X-Received: by 2002:a63:e17:: with SMTP id d23mr37446643pgl.173.1579149744660; 
	Wed, 15 Jan 2020 20:42:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l14sm1425742pjq.5.2020.01.15.20.42.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 20:42:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 20:42:19 -0800
Message-Id: <20200116044220.3667460-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116044220.3667460-1-raj.khem@gmail.com>
References: <20200116044220.3667460-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] libhugetlbfs: Fix missing file mode in create() API
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
X-List-Received-Date: Thu, 16 Jan 2020 04:42:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dd-explicit-permissions-to-open-call.patch | 41 +++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
new file mode 100644
index 0000000000..9d52b908e9
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
@@ -0,0 +1,41 @@
+From d07d2f9601b49bb72cd4b36838f0c238bd1b0fc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Jan 2020 18:45:09 -0800
+Subject: [PATCH] tests: add explicit permissions to open() call
+
+Fixes
+gethugepagesizes.c:227:35: error: open with O_CREAT in second argument needs 3 arguments
+|         fd = open(fname, O_WRONLY|O_CREAT);
+|                                          ^
+
+Upstream-Status: Submitted [https://groups.google.com/forum/#!topic/libhugetlbfs/anNtDXbQKro]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/gethugepagesizes.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c
+index 9551b38..5777265 100644
+--- a/tests/gethugepagesizes.c
++++ b/tests/gethugepagesizes.c
+@@ -223,7 +223,7 @@ void setup_fake_data(long sizes[], int n_elem)
+ 		FAIL("mkdtemp: %s", strerror(errno));
+ 
+ 	sprintf(fname, "%s/meminfo-none", fake_meminfo);
+-	fd = open(fname, O_WRONLY|O_CREAT);
++	fd = open(fname, O_WRONLY|O_CREAT, 0600);
+ 	if (fd < 0)
+ 		FAIL("open: %s", strerror(errno));
+ 	if (write(fd, meminfo_base,
+@@ -233,7 +233,7 @@ void setup_fake_data(long sizes[], int n_elem)
+ 		FAIL("close: %s", strerror(errno));
+ 
+ 	sprintf(fname, "%s/meminfo-hugepages", fake_meminfo);
+-	fd = open(fname, O_WRONLY|O_CREAT);
++	fd = open(fname, O_WRONLY|O_CREAT, 0600);
+ 	if (fd < 0)
+ 		FAIL("open: %s", strerror(errno));
+ 	if (write(fd, meminfo_base,
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index f258122790..e66db1a090 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://0004-shm.c-Mark-glibc-specific-changes-so.patch \
     file://0005-Include-dirent.h-for-ino_t.patch \
     file://0006-include-limits.h-for-PATH_MAX.patch \
+    file://0001-tests-add-explicit-permissions-to-open-call.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.25.0


