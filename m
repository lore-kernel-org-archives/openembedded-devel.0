Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AB6C47FD6D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:22:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so1961356wro.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NVtoRCr+o3JwxhXUFiD9yYnRWGmWr8HvkxSClt055L4=;
	b=ZRbC94tojezq9xDaTobltVx0BUc3Xk5Slo3H9JRPRtJSUUb2KCZnopYgxUoX9sPHCN
	CdGX0IHQkgH5HSLOORPO+1ytbsz9LyBWpWCzOvUa3uf3Eplqm0Ngs4MriUQYvU5dCEVV
	p1Nm0WrMDwLcE6UEWkAHRuFr986ORVsJpq852LlBPhEvBEy1W8YWe3cBbysoPo85DuS5
	vXqTC1uuYddD5qqipAOTMl28xyd0OyTIgOB95oJFYi3cydOzupfzPun4FsMKqEsYqs4r
	3XIDuNvVQWOlnNa7Yo9WtSN46gSamWrE8uX66tlCTjL7HKakf8QuFJjb1eqQ+U09RzkC
	Q/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NVtoRCr+o3JwxhXUFiD9yYnRWGmWr8HvkxSClt055L4=;
	b=O0C/7IagQAcDiDjXsKiUGG2uxd7vwhjH565JvrloJLdaISkOviITrQOd6Al26fZool
	RXyYVqLWSOeNggd+hq+UFMY0J1rUa2xNoCwhmLbXs85vO/ti9ptyyAGb+Qb+bvgrpxNs
	YMi8MsrJFF6hb8DClAJ/lCQBcizdy6CGNGaLXOb8P0SvtUzsp1LEgb+gH9sCjVZ7TvCs
	y3QMtfytwJ5ueOoVvqjs2HzM+YMwJscglS7G3Ou1x6Yu0vNEphEw2L3CTrhCvMtBNTfg
	I2mYaHO+oOSnBagjPKSsLkJKuI3YeXS/Jb7lqgMcOBApDZ5F88Ud8ijqVbUY0VfL2Rhl
	Ityg==
X-Gm-Message-State: APjAAAXVIdn0Y1I5qKwFMVHO/zI0ecmaUGP/2pYJKfyY468Gp8B6RD0h
	KSgimaHwe7tIpF+SDSEkA2gX+K0Rv04=
X-Google-Smtp-Source: APXvYqxtdMWVGRvEx9Uyw4jk1c4FTqSVSFF+BvO4ayCa0aFaNfjWGigvvnUnSh3yModKmu2lodiRaA==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr3428191wrw.373.1579591354089; 
	Mon, 20 Jan 2020 23:22:34 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	a1sm50911880wrr.80.2020.01.20.23.22.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 23:22:33 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 07:22:31 +0000
Message-Id: <20200121072231.105967-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] fatcat: Add recipe
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
X-List-Received-Date: Tue, 21 Jan 2020 07:22:33 -0000

fatcat is a tool designed to manipulate FAT filesystems, in order to
explore, extract, repair, recover and forensic them. It currently
supports FAT12, FAT16 and FAT32.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- fix inclusion of argp.h

 ...d.h-not-argp.h-for-all-POSIX-systems.patch | 37 +++++++++++++++++++
 .../recipes-utils/fatcat/fatcat_1.1.0.bb      | 18 +++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
 create mode 100644 meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
new file mode 100644
index 000000000000..fd8e22abca2e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
@@ -0,0 +1,37 @@
+From 14ef83291096e019ebc48040cf63530a2574a26d Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sun, 19 Jan 2020 16:03:21 +0000
+Subject: [PATCH] Use unistd.h not argp.h for all POSIX systems
+
+getopt(3) is found in unistd.h on all POSIX systems and we make no use
+of any of the GNU specific argp extensions. Include unistd.h directly to
+allow building with musl on linux, whilst retaining compatibility with
+glibc and other unices.
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-status: Pending
+---
+ src/fatcat.cpp | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/src/fatcat.cpp b/src/fatcat.cpp
+index ce23ca07bb99..b4427e465bde 100644
+--- a/src/fatcat.cpp
++++ b/src/fatcat.cpp
+@@ -1,14 +1,10 @@
+ #include <stdlib.h>
+-#include<string.h>
+-#ifdef __APPLE__
+-#include <unistd.h>
+-#else
++#include <string.h>
+ #ifdef __WIN__
+ #include <ctype.h>
+ #include "xgetopt/xgetopt.h"
+ #else
+-#include <argp.h>
+-#endif
++#include <unistd.h>
+ #endif
+ 
+ #include <stdio.h>
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
new file mode 100644
index 000000000000..c72671739df1
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "FAT filesystems explore, extract, repair, and forensic tool"
+DESCRIPTION = "This tool is designed to manipulate FAT filesystems, in order to \
+explore, extract, repair, recover and forensic them. It currently supports \
+FAT12, FAT16 and FAT32."
+HOMEPAGE = "https://github.com/Gregwar/fatcat"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=57fbbfebd0dd1d6ff21b8cecb552a03f"
+
+SRC_URI = "git://github.com/Gregwar/fatcat.git \
+           file://0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch \
+           "
+
+SRCREV = "b923172d97c578297964c062e3a92799e2a9eca4"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.17.1


