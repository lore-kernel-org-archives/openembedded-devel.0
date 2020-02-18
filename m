Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 89FE2615AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:21:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83480867"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 14:21:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C3DA406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:12:09 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 14:21:44 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Feb 2020 14:21:52 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Feb 2020 05:40:39 -0800
Message-ID: <1582033240-93392-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4C3DA406AB15.A15C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] fetchmail: upgrade 6.4.1 -> 6.4.2
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
X-List-Received-Date: Tue, 18 Feb 2020 06:21:50 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.1.bb => fetchmail_6.4.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.1.bb => fetchmail_6.4.2.bb} (86%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.1.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb
similarity index 86%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.1.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb
index 0faf19648..236c32bdd 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.1.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb
@@ -9,8 +9,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "c2b836a919cdd4ec53b06b70e0aa3e63"
-SRC_URI[sha256sum] = "3f33f11dd08c3e8cc3e9d18eec686b1626d4818f4d5a72791507bbc4dce6a9a0"
+SRC_URI[md5sum] = "039b49a4f41f8544a51d82d2f4599dfc"
+SRC_URI[sha256sum] = "e21f6b3326f29fdb0c4786b5602aa4b9e668805424d0708eb42be6395c1ca630"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.17.1




