Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4814.1586834302005717519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 20:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03E3IKBe023628
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2020 20:18:21 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Apr 2020 20:18:04 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mce-test: switch to python3
Date: Tue, 14 Apr 2020 11:18:03 +0800
Message-ID: <20200414031803.425179-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Make gcov_merge.py and scov_merge.py port to python3.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...e.py-scov_merge.py-switch-to-python3.patch | 110 ++++++++++++++++++
 .../recipes-support/mcelog/mce-test_git.bb    |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch

diff --git a/meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch b/meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch
new file mode 100644
index 000000000..969bfc17c
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch
@@ -0,0 +1,110 @@
+From 430982376a544bbccaef5006fab94bbc2f1d1711 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 13 Apr 2020 07:12:44 +0000
+Subject: [PATCH] gcov_merge.py/scov_merge.py: switch to python3
+
+Make gcov_merge.py and scov_merge.py port to python3.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tools/scripts/gcov_merge.py | 12 ++++++------
+ tools/scripts/scov_merge.py | 12 ++++++------
+ 2 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/tools/scripts/gcov_merge.py b/tools/scripts/gcov_merge.py
+index 0ac9bed..9f1cb8c 100644
+--- a/tools/scripts/gcov_merge.py
++++ b/tools/scripts/gcov_merge.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # Merge gcov graph from several test cases. This can be used to check
+ # the coverage of several test cases.
+@@ -11,7 +11,7 @@
+ import sys
+ 
+ def die(str):
+-    print str
++    print(str)
+     sys.exit(-1)
+ 
+ def die_on(cond, str):
+@@ -55,11 +55,11 @@ def merge(gcls1, gcls2):
+         gcl1.merge(gcl2)
+ 
+ def gcov_merge(fns, of):
+-    f = file(fns[0])
++    f = open(fns[0])
+     gcls_base = parse(f)
+ 
+     for fn in fns[1:]:
+-        f = file(fn)
++        f = open(fn)
+         gcls = parse(f)
+         merge(gcls_base, gcls)
+ 
+@@ -67,10 +67,10 @@ def gcov_merge(fns, of):
+         gcl.write(of)
+ 
+ def usage():
+-    print 'Usage: %s <gcov graph files>' % (sys.argv[0])
++    print('Usage: %s <gcov graph files>' % (sys.argv[0]))
+ 
+ if __name__ == '__main__':
+     if len(sys.argv) <= 1:
+         usage()
+-        exit -1
++        sys.exit(-1)
+     gcov_merge(sys.argv[1:], sys.stdout)
+diff --git a/tools/scripts/scov_merge.py b/tools/scripts/scov_merge.py
+index f83b922..bbcf760 100644
+--- a/tools/scripts/scov_merge.py
++++ b/tools/scripts/scov_merge.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # Merge mce serverity coverage file from several test cases. This can
+ # be used to check the coverage of several test cases.
+@@ -11,7 +11,7 @@
+ import sys
+ 
+ def die(str):
+-    print str
++    print(str)
+     sys.exit(-1)
+ 
+ def die_on(cond, str):
+@@ -47,11 +47,11 @@ def merge(gcls1, gcls2):
+         gcl1.merge(gcl2)
+ 
+ def scov_merge(fns, of):
+-    f = file(fns[0])
++    f = open(fns[0])
+     gcls_base = parse(f)
+ 
+     for fn in fns[1:]:
+-        f = file(fn)
++        f = open(fn)
+         gcls = parse(f)
+         merge(gcls_base, gcls)
+ 
+@@ -59,10 +59,10 @@ def scov_merge(fns, of):
+         gcl.write(of)
+ 
+ def usage():
+-    print 'Usage: %s <severities coverage files>' % (sys.argv[0])
++    print('Usage: %s <severities coverage files>' % (sys.argv[0]))
+ 
+ if __name__ == '__main__':
+     if len(sys.argv) <= 1:
+         usage()
+-        exit -1
++        sys.exit(-1)
+     scov_merge(sys.argv[1:], sys.stdout)
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index 007b3944a..35fb94470 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git \
            file://makefile-remove-ldflags.patch \
+           file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch \
           "
 SRCREV = "7643baf6c3919b3d727e6ba6c2e545dc6a653307"
 PV = "20190917+git${SRCPV}"
-- 
2.24.1

