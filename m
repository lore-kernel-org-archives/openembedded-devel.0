Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.5866.1596436659356773644
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2020 23:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0736bHCg024066
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 2 Aug 2020 23:37:27 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 2 Aug 2020 23:37:06 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] rdist: fix parallel build
Date: Mon, 3 Aug 2020 14:36:50 +0800
Message-ID: <20200803063650.24149-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803063650.24149-1-kai.kang@windriver.com>
References: <20200803063650.24149-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile rdist occasionally when system load of build server
is high:

| In file included from common.c:57:
| ../include/defs.h:49:10: fatal error: y.tab.h: No such file or directory
|    49 | #include "y.tab.h"
|       |          ^~~~~~~~~
| compilation terminated.

Make $(COMMONOBJS) which include common.o to depends on related header files
and y.tab.h to fix the parallel build failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../rdist-6.1.5-fix-parallel-build.patch      | 31 +++++++++++++++++++
 .../recipes-connectivity/rdist/rdist_6.1.5.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch

diff --git a/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch
new file mode 100644
index 000000000..f35e96a34
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdist/rdist-6.1.5/rdist-6.1.5-fix-parallel-build.patch
@@ -0,0 +1,31 @@
+It fails to produce common.o when system load is high:
+
+| In file included from common.c:57:
+| ../include/defs.h:49:10: fatal error: y.tab.h: No such file or directory
+|    49 | #include "y.tab.h"
+|       |          ^~~~~~~~~
+| compilation terminated.
+
+Make $(COMMONOBJS) which include common.o to depends on related header files
+and y.tab.h to fix the parallel build failure.
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/Makefile.real | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.real b/src/Makefile.real
+index e0f0dfc..53d4944 100644
+--- a/src/Makefile.real
++++ b/src/Makefile.real
+@@ -41,7 +41,7 @@ $(SERVER_BIN): $(SERVEROBJS) $(COMMONOBJS) $(MISSINGOBJS)
+ $(CLIENT_BIN): $(CLIENTOBJS) $(COMMONOBJS) $(MISSINGOBJS)
+ 	$(CC) -o $@ $(CLIENTOBJS) $(COMMONOBJS) $(MISSINGOBJS) $(LIBS) $(LDFLAGS)
+ 
+-$(CLIENTOBJS) $(SERVEROBJS): $(HFILES) y.tab.h
++$(COMMONOBJS) $(CLIENTOBJS) $(SERVEROBJS): $(HFILES) y.tab.h
+ 
+ y.tab.h: gram.c
+ 
diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index 3a27c2c5b..37b3eebe4 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://rdist-6.1.5-linux.patch \
             file://rdist-6.1.5-fix-msgsndnotify-loop.patch \
             file://rdist-6.1.5-bb-build.patch \
             file://rdist-6.1.5-makefile-add-ldflags.patch \
+            file://rdist-6.1.5-fix-parallel-build.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/rdist/files/rdist/"
-- 
2.17.1

