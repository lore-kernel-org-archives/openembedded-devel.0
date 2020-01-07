Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 721567FD72
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 09:09:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,405,1571673600"; d="scan'208";a="81428992"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 17:09:38 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EEDB849E9333
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:00:36 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 17:09:34 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020 17:09:42 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2020 05:23:11 -0800
Message-ID: <1578403399-45535-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: EEDB849E9333.A73A5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] botan: upgrade 2.11.0 -> 2.13.0
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
X-List-Received-Date: Tue, 07 Jan 2020 09:09:39 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../botan/{botan_2.11.0.bb => botan_2.13.0.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.11.0.bb => botan_2.13.0.bb} (83%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.11.0.bb b/meta-oe/recipes-crypto/botan/botan_2.13.0.bb
similarity index 83%
rename from meta-oe/recipes-crypto/botan/botan_2.11.0.bb
rename to meta-oe/recipes-crypto/botan/botan_2.13.0.bb
index c2d644b41..0854bd672 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.11.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.13.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=f4c145d4d70a3244a053c9f90d4841fc"
+LIC_FILES_CHKSUM = "file://license.txt;md5=a02e03c8fa2c5e7b9b3fcc1b9811fd3b"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[md5sum] = "2dba13b0d25d0e9d2a6f9867c62c9f2e"
-SRC_URI[sha256sum] = "f7874da2aeb8c018fd77df40b2137879bf90b66f5589490c991e83fb3e8094be"
+SRC_URI[md5sum] = "9f90c7d523778be5f23f3ce79046ba35"
+SRC_URI[sha256sum] = "f57ae42a41e1091bca58f44f41addebd9a390b651603952c881ec89d50187e90"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.17.1




