Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ACD1E7F817
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:36:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so12459083wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 09:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZvVPFq1xj5l/8lEHUXYgyCUHUuvvmZWQtxpR/yWYzRc=;
	b=oD2AUUlE65vWV4r7Vv9jpFyz7OEnCuvKyc+RcDn9hIMfZtgbpjPXETqLKJ5JKc5QeN
	U65o3pL3PgXb0a5KdZT3uyJvKhIIG31zNsGiafKUww1kqw+sJlRDjSqiiwtcfGq1MMfP
	VXSY6N2+fxEoC1uXYUOyXJPVbLjKuNKY/1jLnYyr/H45fMnE/5A2YgCiM9E6Y62o22KE
	J6vECAPIPS5zJPSZN39tUf+j1zYgsvGd9PLJYA4x+aDWU/kCY0g4/7zeiq2TzOT0QYW3
	P0waIiZyrkMs9jtHHGmChQLX7wlEaYu4dLZGN1b3W6rVTRif/I5MAhjMa5JXzlTNpMDB
	In9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZvVPFq1xj5l/8lEHUXYgyCUHUuvvmZWQtxpR/yWYzRc=;
	b=JT8Wrj7IogGFLm2O3QH/yarCAU4I1AvqhKzFiBg1gujqVISa+qwW+/cPOhPxvyzLHj
	cQOAh3JczDbZAmTMFSeCJvQmMUN0J3m6fgiqLBrp1+ejEJHtucKmaK/tcFyaP6IOioiz
	TtJeSQOxsWFWWjChS51eb7gQ+gG6Z2GxYQuhC2bFbtvyhknZb9w/ZPAJO9V5wYEUz7je
	22KJ3QjrkXSyyOaZP1MvmCZv6jJ3IohHLqgZm9iFtvUbrXGBIyafBcw1AuNRQz18ngeC
	Xc2GWgP8hJDsIdEIWL+WqlaoUg3G+jKI2cHCrP5kFoZnVNsDZgPKoqykYIltfriOyfSe
	UJ7g==
X-Gm-Message-State: APjAAAV5jczvkmDC/y5+CzFFjifc4cyFY2ytnVjw9G73lizhO7qjgujk
	tcaXwXLqa1kCfBgcYkvURpL/LIAYFmU=
X-Google-Smtp-Source: APXvYqx84VQTNIfwdzqs2/l+ltFmeJcjDgiKUYJhWKAtBWRj42BnOiNHxETZYoHqEpYwVmZnVtv+pQ==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr22659848wrr.215.1580146595537;
	Mon, 27 Jan 2020 09:36:35 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id
	s10sm21916939wrw.12.2020.01.27.09.36.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 09:36:34 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin
	<andrey.zhizhikin@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 17:36:08 +0000
Message-Id: <20200127173608.24874-3-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
Subject: [meta-oe][PATCH 3/3] libhugetlbfs: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 17:36:35 -0000

From: Andrey Zhizhikin <andrey.z@gmail.com>

Update recipe to use python3 since python2 is EOL and has been dropped
from OE-Core.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...setup_helper-use-python3-interpreter.patch | 29 +++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb          |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch
new file mode 100644
index 000000000..e45f283b3
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch
@@ -0,0 +1,29 @@
+From b77c61de4d88d2c6e5d31f4f5a5877cc4c61272e Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.z@gmail.com>
+Date: Mon, 27 Jan 2020 17:27:55 +0000
+Subject: [PATCH] huge_page_setup_helper: use python3 interpreter
+
+Setup helper script is already prepared to be used with python3, use the
+interpreter explicitly. This removes dependency to python2 and will not
+fail the QA check.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+---
+ huge_page_setup_helper.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/huge_page_setup_helper.py b/huge_page_setup_helper.py
+index a9ba2bf..7ba0c92 100755
+--- a/huge_page_setup_helper.py
++++ b/huge_page_setup_helper.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ 
+ #
+ # Tool to set up Linux large page support with minimal effort
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index f1a4efba2..7f7f83828 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "sysfsutils"
-RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
+RDEPENDS_${PN} += "bash python3 python3-core"
 RDEPENDS_${PN}-tests += "bash python3-core"
 
 PV = "2.22"
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://0005-Include-dirent.h-for-ino_t.patch \
     file://0006-include-limits.h-for-PATH_MAX.patch \
     file://0001-tests-add-explicit-permissions-to-open-call.patch \
+    file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.17.1


