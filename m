Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2676C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 20:18:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wATKIZrw025003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:18:45 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 12:18:24 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Nov 2018 12:18:24 -0800
Message-ID: <20181129201824.11757-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] thin-provisioning tools: use sh on path for txt2man
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
X-List-Received-Date: Thu, 29 Nov 2018 20:18:55 -0000
Content-Type: text/plain

txt2man will use /bin/sh and may try to invoke ksh if it
does not like /bin/sh.  Use "our" version of sh.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../files/use-sh-on-path.patch                      | 21 +++++++++++++++++++++
 .../thin-provisioning-tools_0.7.6.bb                |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch b/meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch
new file mode 100644
index 0000000..8cb16de
--- /dev/null
+++ b/meta-oe/recipes-support/thin-provisioning-tools/files/use-sh-on-path.patch
@@ -0,0 +1,21 @@
+
+thin-provisioning-tools: use sh on path when invoking txt2man
+
+txt2man contains a test which might try to use ksh to run the script, so we
+avoid running /bin/sh.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: joe.slater <joe.slater@windriver.com>
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -210,7 +210,7 @@ endif
+ 
+ %.8: %.txt bin/txt2man
+ 	@echo "    [txt2man] $<"
+-	$(V) bin/txt2man -p -t $(basename $(notdir $<)) $< > $@
++	$(V) sh bin/txt2man -p -t $(basename $(notdir $<)) $< > $@
+ 
+ #----------------------------------------------------------------
+ 
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
index 20cb17a..5f6ba9e 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.7.6.bb
@@ -10,6 +10,7 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
            file://0001-do-not-strip-pdata_tools-at-do_install.patch \
            file://0001-fix-compile-failed-with-libc-musl.patch \
+           file://use-sh-on-path.patch \
 "
 
 SRCREV = "6f936992b8e6208a7838fcf1ec87c5bd3a694a77"
-- 
2.7.4


