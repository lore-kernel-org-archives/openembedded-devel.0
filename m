Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4397D76060
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 09:25:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w579P09k020457
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jun 2018 02:25:01 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 7 Jun 2018 02:24:59 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Jun 2018 02:24:58 -0700
Message-ID: <20180607092459.33931-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/2] openjdk-8: remove debuglink
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
X-List-Received-Date: Thu, 07 Jun 2018 09:25:00 -0000
Content-Type: text/plain

We need remove previous debuglink before add it if it has existed,
because it may have a different file name with this that we will add.

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


