Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 83E2B78A56
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 05:48:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37468214"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2018 13:48:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C1D3A48AE763
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:48:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Mar 2018 13:48:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Mar 2018 13:48:04 +0800
Message-ID: <1520228885-9939-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520228885-9939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1520228885-9939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: C1D3A48AE763.A65C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libol: 0.3.18
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
X-List-Received-Date: Mon, 05 Mar 2018 05:48:25 -0000
Content-Type: text/plain

1.Modify SRC_URI
  http://www.balabit.com/downloads/files/libol/0.3/${BP}.tar.gz  to
  http://www.balabit.com/downloads/libol/0.3/${BP}.tar.gz

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/libol/libol_0.3.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
index 74e1ef2..d7adb2b 100644
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "http://www.balabit.com/downloads/files/libol/0.3/${BP}.tar.gz \
+SRC_URI = "http://www.balabit.com/downloads/libol/0.3/${BP}.tar.gz \
            file://configure.patch"
 SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
 SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
-- 
2.7.4




