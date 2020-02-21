Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 398D06161C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:17:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83685046"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:17:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3375550A9976
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:07:27 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:17:06 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:17:07 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 07:24:15 -0800
Message-ID: <1582298655-25895-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582298655-25895-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582298655-25895-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3375550A9976.AFD13
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] uftrace: upgrade 0.9.3 -> 0.9.4
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
X-List-Received-Date: Fri, 21 Feb 2020 08:17:11 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../uftrace/{uftrace_0.9.3.bb => uftrace_0.9.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.9.3.bb => uftrace_0.9.4.bb} (94%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.3.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
similarity index 94%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.9.3.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index dba607c15..cfe461b8d 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.3.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -10,8 +10,8 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-# v0.9.3
-SRCREV = "e77780e7524c0a97f25313b205837191bbe9712a"
+# v0.9.4
+SRCREV = "5e422c0ec87b41d14e9ce8527983406718ef64e0"
 SRC_URI = "git://github.com/namhyung/${BPN} \
            "
 S = "${WORKDIR}/git"
-- 
2.17.1




