Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 187DF60017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2016 06:19:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6925437"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 May 2016 14:19:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 73DF3489F975
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2016 14:19:51 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 26 May 2016 14:19:51 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1456740792-15504-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 73DF3489F975.ADBB2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] talloc: fix error, talloc-dev cannot install
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
Date: Thu, 26 May 2016 06:19:56 -0000
X-Original-Date: Mon, 29 Feb 2016 13:13:12 +0300
X-List-Received-Date: Thu, 26 May 2016 06:19:56 -0000
Content-Type: text/plain

* satisfy_dependencies_for: Cannot satisfy the following dependencies for talloc-dev:
*      talloc (= 2.1.1-r0) *
* opkg_install: Cannot install package talloc-dev.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/talloc/talloc_2.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb b/meta-networking/recipes-support/talloc/talloc_2.1.1.bb
index 89c390f..ea30a24 100644
--- a/meta-networking/recipes-support/talloc/talloc_2.1.1.bb
+++ b/meta-networking/recipes-support/talloc/talloc_2.1.1.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF += "--disable-rpath \
 
 PACKAGES += "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg pytalloc-dev"
 
-#ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN} = "1"
 FILES_${PN} = ""
 FILES_${PN}-dev = ""
 FILES_${PN}-dbg = ""
-- 
1.8.4.2




