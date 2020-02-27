Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DA9ED61178
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:01:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="84484380"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 14:01:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7736D49DF154
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:51:40 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 14:01:24 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Feb 2020 14:01:32 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 04:43:16 -0800
Message-ID: <1582807398-13955-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7736D49DF154.A2B41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] flashrom: upgrade 1.1 -> 1.2
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
X-List-Received-Date: Thu, 27 Feb 2020 06:01:29 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-bsp/flashrom/{flashrom_1.1.bb => flashrom_1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.1.bb => flashrom_1.2.bb} (77%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
similarity index 77%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 074a1a5f6..17445ac2d 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -7,8 +7,8 @@ DEPENDS = "pciutils libusb libusb-compat"
 
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
            "
-SRC_URI[md5sum] = "91bab6c072e38a493bb4eb673e4fe0d6"
-SRC_URI[sha256sum] = "aeada9c70c22421217c669356180c0deddd0b60876e63d2224e3260b90c14e19"
+SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
+SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 
-- 
2.17.1




