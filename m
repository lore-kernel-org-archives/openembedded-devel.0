Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9C365D4F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 08:31:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s388VdJM029264
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 01:31:39 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 01:31:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Apr 2014 16:32:28 +0800
Message-ID: <1396945948-5006-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] dialog: update to version 1.1-20120706
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
X-List-Received-Date: Tue, 08 Apr 2014 08:31:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- add SUMMARY and HOMEPAGE
- remove the use of PRINC

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../dialog/dialog-static_1.1-20111020.bb           |    7 -------
 .../dialog/dialog-static_1.1-20120706.bb           |    6 ++++++
 meta-oe/recipes-extended/dialog/dialog.inc         |    4 ++--
 .../recipes-extended/dialog/dialog_1.1-20111020.bb |    5 -----
 .../recipes-extended/dialog/dialog_1.1-20120706.bb |    4 ++++
 5 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
 create mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
 delete mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
 create mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb

diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
deleted file mode 100644
index e21a914..0000000
--- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require dialog.inc
-PR = "${INC_PR}.0"
-
-LDFLAGS += "-static"
-
-SRC_URI[md5sum] = "15dd2ce9f537c0400f600d1a383aa0a3"
-SRC_URI[sha256sum] = "746bf18b8414985864835b61536cee826ac916e6827fbcad9faffb496cae8a7a"
diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
new file mode 100644
index 0000000..595f323
--- /dev/null
+++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
@@ -0,0 +1,6 @@
+require dialog.inc
+
+LDFLAGS += "-static"
+
+SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
+SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes-extended/dialog/dialog.inc
index 27e4e60..c1c28fd 100644
--- a/meta-oe/recipes-extended/dialog/dialog.inc
+++ b/meta-oe/recipes-extended/dialog/dialog.inc
@@ -1,13 +1,13 @@
+SUMMARY = "display dialog boxes from shell scripts"
 DESCRIPTION = "Dialog lets you to present a variety of questions \
 or display messages using dialog boxes from a shell \
 script (or any scripting language)."
+HOMEPAGE = "http://invisible-island.net/dialog/"
 SECTION = "console/utils"
 DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-INC_PR = "r0"
-
 SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz"
 
 # hardcoded here for use in dialog-static recipe
diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb b/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
deleted file mode 100644
index 73079a1..0000000
--- a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require dialog.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "15dd2ce9f537c0400f600d1a383aa0a3"
-SRC_URI[sha256sum] = "746bf18b8414985864835b61536cee826ac916e6827fbcad9faffb496cae8a7a"
diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
new file mode 100644
index 0000000..c87fb61
--- /dev/null
+++ b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
@@ -0,0 +1,4 @@
+require dialog.inc
+
+SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
+SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
-- 
1.7.9.5


