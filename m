Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10432.1591262894216414317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 02:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgmAT-0003Bi-WA; Thu, 04 Jun 2020 12:28:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-decorator: Consolidate in a single file
Date: Thu,  4 Jun 2020 12:28:01 +0300
Message-Id: <20200604092801.10123-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-decorator.inc               | 19 -----------------
 .../python/python3-decorator_4.4.2.bb         | 21 +++++++++++++++++--
 2 files changed, 19 insertions(+), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-decorator.inc

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
deleted file mode 100644
index 3faee3913..000000000
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Python decorator utilities"
-DESCRIPTION = "\
-The aim of the decorator module it to simplify the usage of decorators \
-for the average programmer, and to popularize decorators by showing \
-various non-trivial examples. Of course, as all techniques, decorators \
-can be abused and you should not try to solve every problem with a \
-decorator, just because you can."
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
-
-SRC_URI[md5sum] = "d83c624cce93e6bdfab144821b526e1d"
-SRC_URI[sha256sum] = "e3a62f0520172440ca0dcc823749319382e377f37f140a0b99ef45fecb84bfe7"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-stringold \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb b/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb
index 844cbdc9a..23d0cf218 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb
@@ -1,2 +1,19 @@
-inherit setuptools3
-require python-decorator.inc
+SUMMARY = "Python decorator utilities"
+DESCRIPTION = "\
+The aim of the decorator module it to simplify the usage of decorators \
+for the average programmer, and to popularize decorators by showing \
+various non-trivial examples. Of course, as all techniques, decorators \
+can be abused and you should not try to solve every problem with a \
+decorator, just because you can."
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
+
+SRC_URI[md5sum] = "d83c624cce93e6bdfab144821b526e1d"
+SRC_URI[sha256sum] = "e3a62f0520172440ca0dcc823749319382e377f37f140a0b99ef45fecb84bfe7"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-stringold \
+    "
-- 
2.17.1

