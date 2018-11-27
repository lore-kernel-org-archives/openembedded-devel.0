Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9C46D13C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:38:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR9bhPB020852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:37:54 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:37:33 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:37:15 +0800
Message-ID: <1543311437-292979-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
References: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/4] dnsmasq: upgrade to 2.80
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
X-List-Received-Date: Tue, 27 Nov 2018 09:38:03 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb | 8 --------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb
deleted file mode 100644
index a66b9a9..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.79.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.79.md5sum] = "5d7120a46d0c16a334f46757d7e2ba55"
-SRC_URI[dnsmasq-2.79.sha256sum] = "77512dd6f31ffd96718e8dcbbf54f02c083f051d4cca709bd32540aea269f789"
-SRC_URI += "\
-    file://lua.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
new file mode 100644
index 0000000..fdbdefb
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.80.md5sum] = "1f071fd11454e1cffea73bdadcf70b21"
+SRC_URI[dnsmasq-2.80.sha256sum] = "9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.7.4


