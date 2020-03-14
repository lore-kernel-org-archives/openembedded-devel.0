Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8089F61CBC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 03:30:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,550,1574092800"; d="scan'208";a="86307991"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Mar 2020 11:30:03 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1856C50A997C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 11:19:58 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 14 Mar 2020 11:29:59 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 14 Mar 2020 11:30:00 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 14 Mar 2020 02:15:19 -0700
Message-ID: <1584177319-73191-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584177319-73191-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584177319-73191-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1856C50A997C.A807F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] sg3-utils: upgrade 1.44 -> 1.45
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
X-List-Received-Date: Sat, 14 Mar 2020 03:30:05 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../sg3-utils/{sg3-utils_1.44.bb => sg3-utils_1.45.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.44.bb => sg3-utils_1.45.bb} (81%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.44.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
similarity index 81%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.44.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
index 4909035b3..22995b773 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.44.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
@@ -14,8 +14,8 @@ MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-SRC_URI[md5sum] = "c11d2b3ca4cc2fd01796473e5330afed"
-SRC_URI[sha256sum] = "8dae684d22e71b11353a48b16c95597af90f0cbe9bbd57f98d7f5544da5cae7b"
+SRC_URI[md5sum] = "2e71d7cd925dcc48acb24afaaaac7990"
+SRC_URI[sha256sum] = "0b87c971af52af7cebebcce343eac6bd3d73febb3c72af9ce41a4552f1605a61"
 
 inherit autotools-brokensep
 
-- 
2.17.1




