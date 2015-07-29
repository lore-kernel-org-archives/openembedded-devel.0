Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB9873237
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:54:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99027305"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 17:57:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T9qU4w016462
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 17:52:30 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 17:54:20 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jul 2015 17:54:08 +0800
Message-ID: <1438163651-3294-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 1/4] sessreg: upgrade 1.0.6 -> 1.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jul 2015 09:54:30 -0000
Content-Type: text/plain

* Remove PR
* Update the checksum of COPYING,but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../xorg-app/{sessreg_1.0.6.bb => sessreg_1.1.0.bb}               | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{sessreg_1.0.6.bb => sessreg_1.1.0.bb} (36%)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
similarity index 36%
rename from meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
index ec89064..617811a 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
@@ -2,9 +2,7 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 
 SUMMARY = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=07e6423e8815e6b372cd45da76faacd0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
 
-PR = "r6"
-
-SRC_URI[md5sum] = "8c8fcda19f4cffe573d43ec9b8255f8e"
-SRC_URI[sha256sum] = "73f31670842b7d969504a61f3c694bf1911f844831c390396971ae2b74de7190"
+SRC_URI[md5sum] = "e238c89dabc566e1835e1ecb61b605b9"
+SRC_URI[sha256sum] = "551177657835e0902b5eee7b19713035beaa1581bbd3c6506baa553e751e017c"
-- 
1.8.4.2


