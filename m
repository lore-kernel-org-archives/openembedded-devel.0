Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8196E6103F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:17:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83685041"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:17:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A6BC050A9997
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:07:20 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:16:59 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:17:00 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 07:24:13 -0800
Message-ID: <1582298655-25895-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582298655-25895-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582298655-25895-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A6BC050A9997.A1F26
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] crash: upgrade 7.2.7 -> 7.2.8
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
X-List-Received-Date: Fri, 21 Feb 2020 08:17:03 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-kernel/crash/{crash_7.2.7.bb => crash_7.2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/crash/{crash_7.2.7.bb => crash_7.2.8.bb} (98%)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.7.bb b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
similarity index 98%
rename from meta-oe/recipes-kernel/crash/crash_7.2.7.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.8.bb
index 8098d09..61cc71f 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.7.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            "
-SRCREV = "5b0e3777ccbb571678791903e93446ccd0aba03a"
+SRCREV = "24f4801f8c8871a2e3e660fe9fa8fdd86bb29876"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.7.4




