Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC7A7F971
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:38:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,402,1571673600"; d="scan'208";a="81374688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:38:29 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 39F3049E932C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:29:28 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:38:27 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:38:32 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 05:54:55 -0800
Message-ID: <1578318898-25525-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 39F3049E932C.A4936
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] nghttp2: upgrade 1.39.2 -> 1.40.0
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
X-List-Received-Date: Mon, 06 Jan 2020 09:38:29 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../nghttp2/{nghttp2_1.39.2.bb => nghttp2_1.40.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.39.2.bb => nghttp2_1.40.0.bb} (90%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
similarity index 90%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
index c27afdb55..f37e9b746 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[md5sum] = "de52cd6b587b76486346745514972995"
-SRC_URI[sha256sum] = "a2d216450abd2beaf4e200c168957968e89d602ca4119338b9d7ab059fd4ce8b"
+SRC_URI[md5sum] = "8d1a6b96760254e4dd142d7176e8fb7c"
+SRC_URI[sha256sum] = "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
 
 inherit cmake manpages pythonnative
 PACKAGECONFIG[manpages] = ""
-- 
2.17.1




