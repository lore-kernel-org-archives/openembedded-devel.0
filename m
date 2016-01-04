Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 766F1731BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:12:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172200"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:12:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F17A1409256E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:12:45 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:12:45 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:12:43 -0800
Message-ID: <1451873563-5544-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: F17A1409256E.A0BC8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libp11: 0.2.8 -> 0.3.0
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
X-List-Received-Date: Mon, 04 Jan 2016 02:12:58 -0000
Content-Type: text/plain

Upgrade libp11 from 0.2.8 to 0.3.0.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/libp11/{libp11_0.2.8.bb => libp11_0.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.2.8.bb => libp11_0.3.0.bb} (81%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.2.8.bb b/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
similarity index 81%
rename from meta-oe/recipes-support/libp11/libp11_0.2.8.bb
rename to meta-oe/recipes-support/libp11/libp11_0.3.0.bb
index 5801484..d97bfc6 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.2.8.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
@@ -8,8 +8,8 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "7d56d89fcad6440d108bbbccfb1ebd958e7eb740"
+SRC_URI = "git://github.com/OpenSC/libp11.git;protocol=http"
+SRCREV = "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1




