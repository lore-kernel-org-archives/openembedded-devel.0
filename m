Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 685DD65EA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 02:24:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3B2OCSa009142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 19:24:12 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 19:24:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Apr 2014 10:25:02 +0800
Message-ID: <1397183102-31944-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] dialog: update to version 1.1-20120706
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
X-List-Received-Date: Fri, 11 Apr 2014 02:24:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- add SUMMARY and HOMEPAGE
- remove the use of INC_PR

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...1-20111020.bb => dialog-static_1.1-20120706.bb} |    5 ++---
 meta-oe/recipes-extended/dialog/dialog.inc         |    4 ++--
 ...alog_1.1-20111020.bb => dialog_1.1-20120706.bb} |    5 ++---
 3 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog-static_1.1-20111020.bb => dialog-static_1.1-20120706.bb} (20%)
 rename meta-oe/recipes-extended/dialog/{dialog_1.1-20111020.bb => dialog_1.1-20120706.bb} (11%)

diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
similarity index 20%
rename from meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
rename to meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
index e21a914..595f323 100644
--- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
+++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
@@ -1,7 +1,6 @@
 require dialog.inc
-PR = "${INC_PR}.0"
 
 LDFLAGS += "-static"
 
-SRC_URI[md5sum] = "15dd2ce9f537c0400f600d1a383aa0a3"
-SRC_URI[sha256sum] = "746bf18b8414985864835b61536cee826ac916e6827fbcad9faffb496cae8a7a"
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
diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
similarity index 11%
rename from meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
index 73079a1..c87fb61 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
@@ -1,5 +1,4 @@
 require dialog.inc
-PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "15dd2ce9f537c0400f600d1a383aa0a3"
-SRC_URI[sha256sum] = "746bf18b8414985864835b61536cee826ac916e6827fbcad9faffb496cae8a7a"
+SRC_URI[md5sum] = "2e538305977178eb085a9859511c299d"
+SRC_URI[sha256sum] = "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44d079cb87cf0ce2f5"
-- 
1.7.9.5


