Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AE595731E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 02:22:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2262392"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2016 10:22:12 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 706D841896CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 10:21:49 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 6 Jan 2016 10:21:49 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jan 2016 18:21:23 -0800
Message-ID: <1452046883-9942-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 706D841896CC.ACA95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-oe][PATCH] lvm2: 2.02.125 -> 2.02.138
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
X-List-Received-Date: Wed, 06 Jan 2016 02:22:25 -0000
Content-Type: text/plain

Upgrade lvm2 from 2.02.125 to 2.02.138.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc                               | 2 +-
 meta-oe/recipes-support/lvm2/{lvm2_2.02.125.bb => lvm2_2.02.138.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.02.125.bb => lvm2_2.02.138.bb} (11%)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index cd7f6fd..c4d1b19 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -34,7 +34,7 @@ PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '',
 
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
 
-inherit autotools pkgconfig systemd
+inherit autotools-brokensep pkgconfig systemd
 
 do_install_append() {
     # Install machine specific configuration file
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
similarity index 11%
rename from meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
index 8e464d2..13a866e 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
@@ -1,4 +1,4 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "2d24ba982c8a85e8c837210f087a6a51"
-SRC_URI[sha256sum] = "0e6da28465752cc2db7e7e6fc7b012a0146a98d717ac5dea1c900d4bc32bedb1"
+SRC_URI[md5sum] = "c660e02ad4586a1d297b6befbe85556d"
+SRC_URI[sha256sum] = "93878a4ba4f70d9f2d0d919eb85bc51652a58776b5428ec8e7e32769d332f596"
-- 
1.9.1




