Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 27C0D7F97A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:39:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,402,1571673600"; d="scan'208";a="81374725"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:39:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B03ED406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:30:15 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:39:16 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:39:21 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 05:54:58 -0800
Message-ID: <1578318898-25525-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B03ED406AB15.A1508
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] kea: upgrade 1.7.2 -> 1.7.3
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
X-List-Received-Date: Mon, 06 Jan 2020 09:39:18 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-connectivity/kea/{kea_1.7.2.bb => kea_1.7.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.2.bb => kea_1.7.3.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.2.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.3.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/kea/kea_1.7.2.bb
rename to meta-networking/recipes-connectivity/kea/kea_1.7.3.bb
index 6f0a7c9cf..e230fd0fe 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.2.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.3.bb
@@ -14,8 +14,8 @@ SRC_URI = "\
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
 "
-SRC_URI[md5sum] = "38ed9af438a79ce4584b0ffea6813d26"
-SRC_URI[sha256sum] = "e43fb0079cb344ae4dec7cafb8d85f75440a228ff88d742a0033315cc8a7b0ca"
+SRC_URI[md5sum] = "fda03bf465818009b70dffc226da777d"
+SRC_URI[sha256sum] = "30f82c548b844c12ed46c4eb3880d63b45ec04cecfcf2e4ab1d7bada7fff4f2a"
 
 inherit autotools systemd
 
-- 
2.17.1




