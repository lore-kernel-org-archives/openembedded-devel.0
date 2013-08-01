Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C00A6B490
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:24:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r71GOEMD017419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Aug 2013 09:24:14 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 1 Aug 2013 09:24:13 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Aug 2013 09:24:13 -0700
Message-ID: <1375374253-5681-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 1/1] policycoreutils: fix genhomedircon construction
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2013 16:24:13 -0000
Content-Type: text/plain

CQID: 418197

Reference /usr/sbin instead of the directory into which
the script is installed on the host.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../selinux/policycoreutils/scripts_makefile.patch |   26 ++++++++++++++++++++
 recipes-security/selinux/policycoreutils_2.1.13.bb |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 recipes-security/selinux/policycoreutils/scripts_makefile.patch

diff --git a/recipes-security/selinux/policycoreutils/scripts_makefile.patch b/recipes-security/selinux/policycoreutils/scripts_makefile.patch
new file mode 100644
index 0000000..8972474
--- /dev/null
+++ b/recipes-security/selinux/policycoreutils/scripts_makefile.patch
@@ -0,0 +1,26 @@
+policycoreutils: fix genhomedircon generation
+
+The script is put on the target and needs to reference
+the directory in which semodule is installed.
+
+Upstream Status: pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/scripts/Makefile
++++ b/scripts/Makefile
+@@ -8,11 +8,12 @@ LOCALEDIR ?= $(PREFIX)/share/locale
+ 
+ all: fixfiles genhomedircon chcat
+ 
++# we want the script to use the user sbin directory on the target
++#
+ genhomedircon:
+ 	@echo "#!/bin/sh" > genhomedircon
+ 	@echo >> genhomedircon
+-	@if [ ! -e semodule_path ]; then echo -n "$(USRSBINDIR)/" >> genhomedircon; fi
+-	@if [ -e semodule_path ]; then echo -n "`cat semodule_path`/" >> genhomedircon; fi
++	@echo -n "$(sbindir)/" >> genhomedircon
+ 	@echo "semodule -Bn" >> genhomedircon
+ 
+ install: all
diff --git a/recipes-security/selinux/policycoreutils_2.1.13.bb b/recipes-security/selinux/policycoreutils_2.1.13.bb
index 6696357..687347c 100644
--- a/recipes-security/selinux/policycoreutils_2.1.13.bb
+++ b/recipes-security/selinux/policycoreutils_2.1.13.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 
 include selinux_20120924.inc
 include ${BPN}.inc
@@ -11,4 +11,5 @@ SRC_URI[sha256sum] = "34040f06f3111d9ee957576e4095841d35b9ca9141ee8d80aab036cbef
 SRC_URI += "\
 	file://policycoreutils-revert-restorecon-update-type.patch \
 	file://policycoreutils-revert-run_init-open_init_pty.patch \
+	file://scripts_makefile.patch \
 	"
-- 
1.7.3.4


