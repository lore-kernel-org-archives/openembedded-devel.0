Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAC07EEA8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:25:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,276,1559491200"; d="scan'208";a="71678589"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jul 2019 10:25:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 35F724CDDD42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 10:25:01 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 18 Jul 2019 10:25:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Jul 2019 10:24:16 +0800
Message-ID: <20190718022416.12700-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 35F724CDDD42.A87F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] uftrace: upgrade 0.9.2 -> 0.9.3
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
X-List-Received-Date: Thu, 18 Jul 2019 02:25:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from uftrace_0.9.2.bb to uftrace_0.9.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/uftrace/{uftrace_0.9.2.bb => uftrace_0.9.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.9.2.bb => uftrace_0.9.3.bb} (94%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.2.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.3.bb
similarity index 94%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.9.2.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.9.3.bb
index 4f40168..dba607c 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.2.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.3.bb
@@ -10,8 +10,8 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-# v0.9.2
-SRCREV = "66fc1fb973f4a44aecd216541405ffe05196f11e"
+# v0.9.3
+SRCREV = "e77780e7524c0a97f25313b205837191bbe9712a"
 SRC_URI = "git://github.com/namhyung/${BPN} \
            "
 S = "${WORKDIR}/git"
-- 
2.7.4




