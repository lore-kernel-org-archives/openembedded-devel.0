Return-Path: <Fupan.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C861460851
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Sep 2017 02:24:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8U2OuJl025217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 19:24:56 -0700
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 29 Sep 2017 19:24:55 -0700
From: <fupan.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Sep 2017 19:24:55 -0700
Message-ID: <20170930022455.137406-1-fupan.li@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8-common: Fix the issue of building failed adlc on host with gcc < 6
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
X-List-Received-Date: Sat, 30 Sep 2017 02:24:55 -0000
Content-Type: text/plain

From: Fupan Li <fupan.li@windriver.com>

The patch recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-flags.patch
had tried to fix this issue, and it tried to filter out the TARGET_FLAGS/TARGET_
CXXFLGAS, but for the flags such as "-fno-lifetime-dse" was added to CFLAGS/CXXFLAGS,
directly, thus that patch failed to filter it out.

To fix this issue, it's better to add those GCC version specific flags to BUILD_CFLAGS/
BUILD_CXXFLAGS and TARGET_CFLAGS/TARGET_CXXFLAGS separatedly, thus that patch can work
as expected.

Signed-off-by: Fupan Li <fupan.li@windriver.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 36 ++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 83828e1..c609232 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -231,27 +231,39 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 # version is and only add the flags that are appropriate for that GCC
 # version.
 
-def version_specific_cflags(d):
+def version_specific_cflags(d, toolchain):
     extraflags = None
     version = None
 
-    if bb.data.inherits_class('native', d):
-        from subprocess import Popen, PIPE
+    from subprocess import Popen, PIPE
+    cmd = d.expand('%s -dumpversion' % toolchain ).split()
+    cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
+    version = cc.communicate()[0].decode('utf-8')[0]
 
-        cmd = d.expand('${CC} -dumpversion').split()
-        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
-        version = cc.communicate()[0].decode('utf-8')[0]
+    if version.isdigit():
+        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
+        return extraflags
+    return ''
+
+python __anonymous() {
+    if bb.data.inherits_class('native', d):
+        toolchain = d.getVar('CC', True)
+        extraflags = version_specific_cflags(d, toolchain)
+        d.appendVar("CFLAGS", ' ' + extraflags) 
+        d.appendVar("CXXFLAGS", ' ' + extraflags)
     else:
         # in the cross case, trust that GCCVERSION is correct. This won't
         # work if the native toolchain is Clang, but as of this writing that
         # doesn't work anyway.
         version = d.getVar('GCCVERSION', expand=True)[0]
-
-    if version.isdigit():
         extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
-        return extraflags
-    return ''
+        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
+        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
+
+        toolchain = d.getVar('BUILD_CC', True)
+        extraflags = version_specific_cflags(d, toolchain)
+        d.appendVar("BUILD_CFLAGS", ' ' + extraflags)
+        d.appendVar("BUILD_CXXFLAGS", ' ' + extraflags)
+}
 
-CFLAGS_append = " ${@version_specific_cflags(d)}"
-CXXFLAGS_append = " ${@version_specific_cflags(d)}"
 CXX_append = " -std=gnu++98"
-- 
2.11.0


