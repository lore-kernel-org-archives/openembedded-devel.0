Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B33B578DE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:38:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5D8bh2x028813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 01:37:58 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 13 Jun 2018 01:37:32 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jun 2018 01:37:31 -0700
Message-ID: <20180613083732.15059-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-java][PATCH V2 1/2] openjdk-8: remove debuglink
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
X-List-Received-Date: Wed, 13 Jun 2018 08:38:07 -0000
Content-Type: text/plain

During openjdk-8 compiling, its debug file is xxx.debuginfo, and it will
add libjvm.debuginfo as libjvm.so's debuglink section's file name, this
name is different with that we will create and add in splitdebuginfo()
of package.bbclass, in oe-core, the debug file name is the same with the
corresponding executable file or library file, this will make we can't get
symbol information when debug libjvm.so in gdb, so we must remove the
previous debuglink before add it if it has existed(if a file has contained
the debuglink section, it will not be changed when add again).

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 46f13fd..03cab11 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -105,5 +105,21 @@ EXTRA_OEMAKE_append = '\
     images \
 '
 
+python remove_debuglink() {
+    dvar = d.getVar('PKGD', True)
+    objcopy = d.getVar("OBJCOPY", True)
+
+    # Remove the previous debuglink if it has existed, because it has a different file name with that we will add.
+    if d.getVar('PN', True).find("jre") != -1:
+        file = dvar + d.getVar("JRE_HOME", True) + "/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
+    else:
+        file = dvar + d.getVar("JDK_HOME", True) + "/jre/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
+
+    cmd = "'%s' --remove-section .gnu_debuglink '%s'" % (objcopy, file)
+    oe.utils.getstatusoutput(cmd)
+}
+
+PACKAGE_PREPROCESS_FUNCS += "remove_debuglink"
+
 # There is a symlink to a .so but this one is valid.
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.11.0


