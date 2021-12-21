Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243E1C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 03:52:43 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1922.1640058761739871471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 19:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BL3qe5P004413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 19:52:40 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Dec 2021 19:52:40 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 20 Dec 2021 19:52:39 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libteam: improve the ptest output
Date: Tue, 21 Dec 2021 11:52:38 +0800
Message-ID: <20211221035238.40950-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 03:52:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94459

From: Mingli Yu <mingli.yu@windriver.com>

There is no PASS or FAIL related status report before, so
improve the ptest output to print the status.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...basic_test.py-check-the-return-value.patch | 34 +++++++++++++++++++
 .../recipes-support/libteam/libteam/run-ptest |  5 +++
 .../recipes-support/libteam/libteam_1.31.bb   |  1 +
 3 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-check-the-return-value.patch

diff --git a/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-check-the-return-value.patch b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-check-the-return-value.patch
new file mode 100644
index 000000000..96891c9ea
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-check-the-return-value.patch
@@ -0,0 +1,34 @@
+From e86a58271d7d0a3b9cd546251d2527e93898bdb8 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 21 Dec 2021 11:15:31 +0800
+Subject: [PATCH] team_basic_test.py: check the return value
+
+Not only print the traceback like before, also check the
+return value.
+
+Upstream-Status: Submitted [https://github.com/jpirko/libteam/pull/63]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ scripts/team_basic_test.py | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/team_basic_test.py b/scripts/team_basic_test.py
+index 0b64af2..17588c7 100755
+--- a/scripts/team_basic_test.py
++++ b/scripts/team_basic_test.py
+@@ -203,4 +203,10 @@ def main():
+     btest.run()
+ 
+ if __name__ == "__main__":
+-    main()
++    try:
++        ret = main()
++    except Exception as esc:
++        ret = 1
++        import traceback
++        traceback.print_exc()
++    sys.exit(ret)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/libteam/libteam/run-ptest b/meta-oe/recipes-support/libteam/libteam/run-ptest
index b5c6f4ebb..26f097d58 100644
--- a/meta-oe/recipes-support/libteam/libteam/run-ptest
+++ b/meta-oe/recipes-support/libteam/libteam/run-ptest
@@ -1,3 +1,8 @@
 #!/bin/sh
 
 python3 $(dirname $0)/team_basic_test.py
+if [ $? -eq 0 ] ; then
+    echo "PASS: libteam"
+else
+    echo "FAIL: libteam"
+fi
diff --git a/meta-oe/recipes-support/libteam/libteam_1.31.bb b/meta-oe/recipes-support/libteam/libteam_1.31.bb
index a3bed722e..e43d3e0da 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.31.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.31.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/jpirko/libteam;branch=master;protocol=https \
            file://0002-teamd-Re-adjust-include-header-order.patch \
            file://0001-team_basic_test.py-disable-RedHat-specific-test.patch \
            file://0001-team_basic_test.py-switch-to-python3.patch \
+           file://0001-team_basic_test.py-check-the-return-value.patch \
            file://run-ptest \
            "
 SRCREV = "3ee12c6d569977cf1cd30d0da77807a07aa77158"
-- 
2.17.1


