Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1549.1588375991152948438
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 16:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 041NX96X003184
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 May 2020 16:33:10 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 1 May 2020
 16:32:51 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] syslog-ng: change shebang to python3
Date: Fri, 1 May 2020 16:32:51 -0700
Message-ID: <20200501233251.20037-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The file is executable and can be put on a target.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/files/shebang.patch | 18 ++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/shebang.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/shebang.patch b/meta-oe/recipes-support/syslog-ng/files/shebang.patch
new file mode 100644
index 0000000..35d9677
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/shebang.patch
@@ -0,0 +1,18 @@
+syslog-ng: change shebang to use python3
+
+Correct shebang for python3.  This is far from the only python file with an out of date shebang,
+but it is the only one that winds up on a target.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/lib/merge-grammar.py
++++ b/lib/merge-grammar.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #############################################################################
+ # Copyright (c) 2010-2017 Balabit
+ #
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
index 01ed767..10bf00f 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.24.1.bb
@@ -7,6 +7,7 @@ SRC_URI += " \
            file://fix-invalid-ownership.patch \
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0001-syslog-ng-fix-segment-fault-during-service-start.patch \
+           file://shebang.patch \
            file://syslog-ng-tmp.conf \
            "
 
-- 
2.7.4

