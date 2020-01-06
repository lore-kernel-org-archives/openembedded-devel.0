Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6EAFE7F978
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:37:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,402,1571673600"; d="scan'208";a="81374651"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:37:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 32D1449E932A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:28:48 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:37:48 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:37:54 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 05:54:53 -0800
Message-ID: <1578318898-25525-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 32D1449E932A.A19D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] ipvsadm: upgrade 1.30 -> 1.31
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
X-List-Received-Date: Mon, 06 Jan 2020 09:37:46 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ipvsadm/{ipvsadm_1.30.bb => ipvsadm_1.31.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ipvsadm/{ipvsadm_1.30.bb => ipvsadm_1.31.bb} (92%)

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
similarity index 92%
rename from meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
rename to meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
index b375ca94e..8fb116f57 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
@@ -22,8 +22,8 @@ SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.
         file://makefile-add-ldflags.patch \
 "
 
-SRC_URI[md5sum] = "97f11b6af1920fde5a9d9eac0d7f9e50"
-SRC_URI[sha256sum] = "95573d70df473c9f63fc4ac496c044c69e3a6de7ccac119922210c0b44cd7a0c"
+SRC_URI[md5sum] = "f6d1707c5baf684b58fd33682d67871f"
+SRC_URI[sha256sum] = "1a0a5e25b5a1226435d2fb76341656f83a710183aebb0d204db39c0ec3bedfdb"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/ipvsadm"
 
-- 
2.17.1




