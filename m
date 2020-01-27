Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EBA977FE60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:04:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so13344555wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M4ZKzN+Hkji8tPgSe0mHY+LyFMjDRWFV82yv1KKEv4E=;
	b=pBZMRnkyvIAX0LO7nHIYt2RuO/j/VCJzUINhkB/H2TdSQu8ghdVZUH2PPVIo8Uy2V9
	lWBnPO9RJ4odkI1TDOGaYrJ9Kpd+banzd1z9rHE6VSVKRiynqCx806eoUV2ihFh8E+r/
	3j3XLIM9qQTyej4+xQPdDXGuW4T+y4kgNd24qkF54FcX0So0lj3ClfS5j7lXqEnwD9Gf
	UfkWGboRsfKFuywVTrywg1Fu9Qn2NtADQezynaxh4s8J9AaAnaEqGi79vxd0Y30j0698
	xmVabzrIetCGX8Yta96MMrO/STBXDl0sGe63Jx2uv4vzBO+jgNYOL+s6M9yACUfeNOPN
	x3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M4ZKzN+Hkji8tPgSe0mHY+LyFMjDRWFV82yv1KKEv4E=;
	b=SNqIN34cT0ch31r9Wclj5nTNN2EezFazVqdKb3um29U/S8v2/w9lcZXsssHLFYACqK
	bcbL3qyFKfHSaNwtHWmXbAHjB7r4kV1u8u+VhFFa82BLsmLUx4dCmLpIfGTT58+LADSK
	t86bq5nLA75Di0vXjc/yCMENAV8WAAo+xbKnEpGcYmPuP6AeyzFAdEntgXpH/loqPWPf
	78yMDwgd3KJjy+NvnyWoZhsI7sjbs2Vr8M4byYmX5AUBi92CC6WO7Y2yuiWJN0XPYdeR
	6Xi8PDmvDDL/SkqCqgUBHZkGQzfvSbBP/nCEKS4LPHsq9xvcpdW1PnIJEGSiqsTGs7JN
	ikmA==
X-Gm-Message-State: APjAAAXmHxTW7ZJSube3UgPZBd+giU3z7O+yeLqZsBTAJrc2S6VwPsWw
	64kAaGdN6Q+UKCUwD5ygJ8KYJjjKAXw=
X-Google-Smtp-Source: APXvYqyU3wwRw4wc+tW42tfMZyYhXP66LeXuDycluZ0LsF7c1PSLLIhEXI/wOQu0fNnxRg88Obk28Q==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr23515637wrs.184.1580159073444;
	Mon, 27 Jan 2020 13:04:33 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	m3sm21787004wrs.53.2020.01.27.13.04.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 13:04:33 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 21:04:14 +0000
Message-Id: <20200127210414.25338-2-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127210414.25338-1-andrey.z@gmail.com>
References: <20200127210414.25338-1-andrey.z@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] libhugetlbfs: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 21:04:33 -0000

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
index f1a4efba2..4768d7b63 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "sysfsutils"
-RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
+RDEPENDS_${PN} += "bash python3-core"
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


