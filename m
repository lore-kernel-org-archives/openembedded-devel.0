Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 48A447D431
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 02:06:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="58432412"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Apr 2019 10:06:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C7FBD4CD80C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 10:06:53 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 4 Apr 2019 10:06:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Apr 2019 10:07:31 +0800
Message-ID: <20190404020731.7102-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: C7FBD4CD80C6.A8B5E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] augeas: upgrade 1.10.1 -> 1.11.0
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
X-List-Received-Date: Thu, 04 Apr 2019 02:06:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from augeas_1.10.1.bb to augeas_1.11.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/augeas/augeas_1.10.1.bb | 4 ----
 meta-oe/recipes-support/augeas/augeas_1.11.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/augeas/augeas_1.10.1.bb
 create mode 100644 meta-oe/recipes-support/augeas/augeas_1.11.0.bb

diff --git a/meta-oe/recipes-support/augeas/augeas_1.10.1.bb b/meta-oe/recipes-support/augeas/augeas_1.10.1.bb
deleted file mode 100644
index 26e191bd3..000000000
--- a/meta-oe/recipes-support/augeas/augeas_1.10.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require augeas.inc
-
-SRC_URI[md5sum] = "6c0b2ea6eec45e8bc374b283aedf27ce"
-SRC_URI[sha256sum] = "52db256afab261d31cc147eaa1a71795a5fec59e888dfd0b65a84c7aacd6364d"
diff --git a/meta-oe/recipes-support/augeas/augeas_1.11.0.bb b/meta-oe/recipes-support/augeas/augeas_1.11.0.bb
new file mode 100644
index 000000000..cdd11beec
--- /dev/null
+++ b/meta-oe/recipes-support/augeas/augeas_1.11.0.bb
@@ -0,0 +1,4 @@
+require augeas.inc
+
+SRC_URI[md5sum] = "abf51f4c0cf3901d167f23687f60434a"
+SRC_URI[sha256sum] = "393ce8f4055af89cd4c20bf903eacbbd909cf427891f41b56dc2ba66243ea0b0"
-- 
2.20.1




