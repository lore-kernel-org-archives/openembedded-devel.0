Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D5D337F8EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 06:34:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="77398024"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 14:34:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 00AF24CE150E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:27:07 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 24 Oct 2019 14:35:03 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 24 Oct 2019 14:34:59 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2019 14:34:48 +0800
Message-ID: <1571898888-130020-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 00AF24CE150E.A7C48
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] drbd-utils: upgrade 9.10.0 -> 9.11.0
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
X-List-Received-Date: Thu, 24 Oct 2019 06:35:00 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../drbd/{drbd-utils_9.10.0.bb => drbd-utils_9.11.0.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.10.0.bb => drbd-utils_9.11.0.bb} (93%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
similarity index 93%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
index 0e14ae7..286b0f6 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
@@ -12,9 +12,9 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
           "
-# v9.10.0
-SRCREV_drbd-utils = "859151b228d3b3aacefb09d06d515a2589c22e35"
-SRCREV_drbd-headers = "0955b3423f08f8e11ff05092bc1b766609fd804b"
+# v9.11.0
+SRCREV_drbd-utils = "63092751e76e1fba397e53df4be5c1161b83a223"
+SRCREV_drbd-headers = "d100ee01bf5aa8d5220767e4e35c4224faa8d865"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




