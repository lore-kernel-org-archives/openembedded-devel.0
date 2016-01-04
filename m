Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5D200731A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:11:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172130"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:11:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 989C94092578
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:11:13 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:11:13 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:11:06 -0800
Message-ID: <1451873466-5317-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 989C94092578.AE753
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] nodejs: 0.12.7 -> 0.12.9
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
X-List-Received-Date: Mon, 04 Jan 2016 02:11:30 -0000
Content-Type: text/plain

Upgrade nodejs from 0.12.7 to 0.12.9.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_0.12.9.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_0.12.9.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.9.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.9.bb
index 41eb5ee..ddea668 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.9.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "5523ec4347d7fe6b0f6dda1d1c7799d5"
-SRC_URI[sha256sum] = "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
+SRC_URI[md5sum] = "d404d9b81128c1e28cfbda8adcf0a7c3"
+SRC_URI[sha256sum] = "35daad301191e5f8dd7e5d2fbb711d081b82d1837d59837b8ee224c256cfe5e4"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.9.1




