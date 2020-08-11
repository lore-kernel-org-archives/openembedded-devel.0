Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1502.1597179753061548334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 14:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07BL2UtT016235
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 14:02:31 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 11 Aug 2020
 14:02:30 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] mozjs: specify TMPDIR
Date: Tue, 11 Aug 2020 14:02:29 -0700
Message-ID: <20200811210229.93989-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Although it is extremely rare the following type of error
can occur during configuration:

Creating `/tmp/conftest.i53clm4z.cpp` with content:
...
x86_64-wrs-linux-g++: error: /tmp/conftest.i53clm4z.cpp: No such file or directory
x86_64-wrs-linux-g++: error: /tmp/conftest.i53clm4z.cpp: No such file or directory
x86_64-wrs-linux-g++: fatal error: no input files

So, specify a local directory as TMPDIR during configuration.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
index f13a184..629c652 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -100,7 +100,9 @@ do_configure() {
     autoconf213 --macrodir=${STAGING_DATADIR_NATIVE}/autoconf213 old-configure.in > old-configure
 
     cd ${B}
-    ${S}/js/src/configure ${EXTRA_OECONF}
+    # use of /tmp can causes problems on heavily loaded hosts
+    mkdir -p "${B}/lcl_tmp"
+    TMPDIR="${B}/lcl_tmp"  ${S}/js/src/configure ${EXTRA_OECONF}
 
     # Make standard Makefile checks pass
     touch ${S}/js/src/configure
-- 
2.7.4

