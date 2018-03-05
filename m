Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 713AF789DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 05:48:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37468209"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2018 13:48:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3AE3148AE762
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:48:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Mar 2018 13:48:17 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Mar 2018 13:48:02 +0800
Message-ID: <1520228885-9939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 3AE3148AE762.A7DB5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] hexedit: 1.2.13 -> 1.2.14
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
X-List-Received-Date: Mon, 05 Mar 2018 05:48:21 -0000
Content-Type: text/plain

1.Upgrade hexedit from 1.2.13 to 1.2.14

2.Modify SRC_URI to git://github.com/pixel/hexedit.git

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb | 17 -----------------
 meta-oe/recipes-extended/hexedit/hexedit_1.2.14.bb | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
 create mode 100644 meta-oe/recipes-extended/hexedit/hexedit_1.2.14.bb

diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
deleted file mode 100644
index 39df5b2..0000000
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "view and edit files in hexadecimal or in ASCII"
-HOMEPAGE = "http://rigaux.org/hexedit.html"
-SECTION = "console/utils"
-LICENSE = "GPLv2+"
-DEPENDS = "ncurses"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI = "http://rigaux.org/${BP}.src.tgz \
-    file://0001-don-t-strip-when-installing.patch "
-
-SRC_URI[md5sum] = "a5af1378d028512a9cad27a5ba3e15f9"
-SRC_URI[sha256sum] = "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb54c58c983963b88dd7"
-
-inherit autotools-brokensep
-
-S = "${WORKDIR}/${BPN}"
diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.14.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.2.14.bb
new file mode 100644
index 0000000..b6652e5
--- /dev/null
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.14.bb
@@ -0,0 +1,16 @@
+UMMARY = "view and edit files in hexadecimal or in ASCII"
+HOMEPAGE = "http://rigaux.org/hexedit.html"
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+DEPENDS = "ncurses"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "git://github.com/pixel/hexedit.git \
+    "
+
+SRCREV = "800e4b2e6280531a84fd23ee0b48e16baeb90878"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep
-- 
2.7.4




