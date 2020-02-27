Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 57CC0611A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:58:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="84484074"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 13:58:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0C50C50A9975
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:48:25 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 13:58:09 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Feb 2020 13:58:19 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 04:43:11 -0800
Message-ID: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 0C50C50A9975.A444A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] drbd-utils: upgrade 9.11.0 -> 9.12.0
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
X-List-Received-Date: Thu, 27 Feb 2020 05:58:12 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../drbd/{drbd-utils_9.11.0.bb => drbd-utils_9.12.0.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.11.0.bb => drbd-utils_9.12.0.bb} (93%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
similarity index 93%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
index 01bb16af9..b83f68f8c 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
@@ -12,9 +12,9 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
           "
-# v9.11.0
-SRCREV_drbd-utils = "63092751e76e1fba397e53df4be5c1161b83a223"
-SRCREV_drbd-headers = "d100ee01bf5aa8d5220767e4e35c4224faa8d865"
+# v9.12.0
+SRCREV_drbd-utils = "91629a4cce49ca0d4f917fe0bffa25cfe8db3052"
+SRCREV_drbd-headers = "233006b4d26cf319638be0ef6d16ec7dee287b66"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




