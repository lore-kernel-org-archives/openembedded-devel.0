Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDDE374F09
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:20:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5T6KqlM023624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:20:52 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:20:52 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:20:43 +0800
Message-ID: <1530253243-32383-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530253243-32383-1-git-send-email-changqing.li@windriver.com>
References: <1530253243-32383-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-networking] dnsmasq: upgrade 2.78 -> 2.79
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
X-List-Received-Date: Fri, 29 Jun 2018 06:20:51 -0000
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch | 2 +-
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb   | 8 --------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb   | 8 ++++++++
 3 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
index 0991dd8..1bf0f75 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -1,7 +1,7 @@
 From be1b3d2d0f1608cba5efee73d6aac5ad0709041b Mon Sep 17 00:00:00 2001
 From: Joe MacDonald <joe_macdonald@mentor.com>
 Date: Tue, 9 Sep 2014 10:24:58 -0400
-Subject: [PATCH] Upstream-status: Inappropriate [OE specific]
+Subject: [PATCH] Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
deleted file mode 100644
index 4d1dc6e..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI += "\
-    file://lua.patch \
-"
-
-SRC_URI[dnsmasq-2.78.md5sum] = "3bb97f264c73853f802bf70610150788"
-SRC_URI[dnsmasq-2.78.sha256sum] = "c92e5d78aa6353354d02aabf74590d08980bb1385d8a00b80ef9bc80430aa1dc"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb
new file mode 100644
index 0000000..a66b9a9
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.79.md5sum] = "5d7120a46d0c16a334f46757d7e2ba55"
+SRC_URI[dnsmasq-2.79.sha256sum] = "77512dd6f31ffd96718e8dcbbf54f02c083f051d4cca709bd32540aea269f789"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.7.4


