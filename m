Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1D63877972
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 04:59:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21174164"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jul 2017 12:59:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7D1E746B524B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:59:15 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 12 Jul 2017 12:59:14 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jul 2017 12:58:41 +0800
Message-ID: <1499835521-973-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499835521-973-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1499835521-973-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 7D1E746B524B.A6C00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5] [PATCH v4 4/4] qtquick1: add ptest
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
X-List-Received-Date: Wed, 12 Jul 2017 04:59:14 -0000
Content-Type: text/plain

   Add ptest for qttools by using provided testsuite in qtquick1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qtquick1/run-ptest | 6 ++++++
 recipes-qt/qt5/qtquick1_git.bb    | 1 +
 2 files changed, 7 insertions(+)
 create mode 100644 recipes-qt/qt5/qtquick1/run-ptest

diff --git a/recipes-qt/qt5/qtquick1/run-ptest b/recipes-qt/qt5/qtquick1/run-ptest
new file mode 100644
index 0000000..044f834
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+for x in ` awk '{print $1}' tst_list `;do
+    ./${x};
+done
+
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e9b6185..d41b838 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,5 +1,6 @@
 require qt5.inc
 require qt5-git.inc
+require qt5-ptest.inc
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-- 
2.7.4




