Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4188.1587690816856909082
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 18:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03O1DadN024433
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 18:13:36 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 18:13:30 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pexpect: change shebang to python3
Date: Fri, 24 Apr 2020 09:13:28 +0800
Message-ID: <20200424011328.191909-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

we have offcially dropped python2, so it is possible
that our code run on python3 only host, so change
shebang to python3 to avoid error like:
python: command not found

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../python/python-pexpect.inc                 |  2 ++
 ...hange-shebang-from-python-to-python3.patch | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index f02aa994e..c6230b2b5 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -4,6 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
+SRC_URI += "file://0001-FSM.py-change-shebang-from-python-to-python3.patch"
+
 SRC_URI[md5sum] = "153eb25184249d6a85fde9acf4804085"
 SRC_URI[sha256sum] = "fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c"
 
diff --git a/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
new file mode 100644
index 000000000..bee772da6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-python3.patch
@@ -0,0 +1,25 @@
+From 35462d7b778eea32fd0cc0bbc79d6e6f53d942b4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 23 Apr 2020 08:01:42 +0000
+Subject: [PATCH] FSM.py: change shebang from python to python3
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ pexpect/FSM.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pexpect/FSM.py b/pexpect/FSM.py
+index 46b392e..4e77654 100644
+--- a/pexpect/FSM.py
++++ b/pexpect/FSM.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ '''This module implements a Finite State Machine (FSM). In addition to state
+ this FSM also maintains a user defined "memory". So this FSM can be used as a
+-- 
+2.24.1
+
-- 
2.24.1

