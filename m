Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB04731D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 04:52:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10961847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 12:52:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AE8A94623461
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:52:01 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 12:52:00 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Sep 2016 00:51:57 -0400
Message-ID: <1473828717-3079-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: AE8A94623461.A679C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] drbd-utils: 8.9.3 -> 8.9.6
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
X-List-Received-Date: Wed, 14 Sep 2016 04:52:11 -0000
Content-Type: text/plain

1) Upgrade drbd-utils from 8.9.3 to 8.9.6.
2) Delete one patch, since the data has been changed.
    0001-Makefile.in-don-t-compile-documentation.patch
3) Modify EXTRA_OECONF, since the documentation file is not suitable for cross-compile, so we do not compile it.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../drbd/{drbd-utils_8.9.3.bb => drbd-utils_8.9.6.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd-utils_8.9.3.bb => drbd-utils_8.9.6.bb} (86%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
similarity index 86%
rename from meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
index 44459b5..3d6f5b2 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
@@ -9,11 +9,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "http://oss.linbit.com/drbd/${BP}.tar.gz \
-           file://0001-Makefile.in-don-t-compile-documentation.patch \
            file://0001-Makefile.in-fix-permission-bits-for-drbd.service.patch \
           "
-SRC_URI[md5sum] = "09c9c33c041e1f4f85dd359f9e0b0f24"
-SRC_URI[sha256sum] = "011050578c153bf4fef86e03749304ff9f333b7af3512c5c395e0e870a0445bd"
+SRC_URI[md5sum] = "76ed6d3190cd77b00890f3365353124b"
+SRC_URI[sha256sum] = "297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913"
 
 SYSTEMD_SERVICE_${PN} = "drbd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -28,6 +27,7 @@ EXTRA_OECONF = " \
                 --with-distro debian          \
                 --with-initscripttype=both    \
                 --with-systemdunitdir=${systemd_unitdir}/system \
+                --without-manual\
                "
 
 RDEPENDS_${PN} += "bash perl"
-- 
2.7.4




