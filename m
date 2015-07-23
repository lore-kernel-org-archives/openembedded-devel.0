Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D3DA5734B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 06:34:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98760492"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 14:38:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N6WccP014410
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:32:38 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 14:34:26 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 14:34:14 +0800
Message-ID: <1437633254-4293-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] hostapd: upgrade 2.2 -> 2.4
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
X-List-Received-Date: Thu, 23 Jul 2015 06:34:37 -0000
Content-Type: text/plain

Update the checksum of COPYING,since the date in it has been changed,
but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/hostapd/{hostapd-2.2 => hostapd}/defconfig | 0
 .../hostapd/{hostapd-2.2 => hostapd}/hostapd.service                | 0
 meta-oe/recipes-connectivity/hostapd/{hostapd-2.2 => hostapd}/init  | 0
 .../recipes-connectivity/hostapd/{hostapd_2.2.bb => hostapd_2.4.bb} | 6 +++---
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd-2.2 => hostapd}/defconfig (100%)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd-2.2 => hostapd}/hostapd.service (100%)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd-2.2 => hostapd}/init (100%)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.2.bb => hostapd_2.4.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/defconfig b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
similarity index 100%
rename from meta-oe/recipes-connectivity/hostapd/hostapd-2.2/defconfig
rename to meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service b/meta-oe/recipes-connectivity/hostapd/hostapd/hostapd.service
similarity index 100%
rename from meta-oe/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
rename to meta-oe/recipes-connectivity/hostapd/hostapd/hostapd.service
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init b/meta-oe/recipes-connectivity/hostapd/hostapd/init
similarity index 100%
rename from meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
rename to meta-oe/recipes-connectivity/hostapd/hostapd/init
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
index b75f2b9..36c0cd4 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
 LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://README;md5=0854a4da34ac3990770794d771fac7fd"
+LIC_FILES_CHKSUM = "file://README;md5=4d53178f44d4b38418a4fa8de365e11c"
 DEPENDS = "libnl openssl"
 SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
@@ -44,5 +44,5 @@ do_install() {
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
-SRC_URI[md5sum] = "23c1f78a693c3288802d516adb7fd289"
-SRC_URI[sha256sum] = "f15b6bcb434378860ea5b88dffed7f54d8cb71fff2146de0f006977a5e25a882"
+SRC_URI[md5sum] = "04578f3f2c3eb1bec1adf30473813912"
+SRC_URI[sha256sum] = "6fe0eb6bd1c9cbd24952ece8586b6f7bd14ab358edfda99794e79b9b9dbd657f"
-- 
1.8.4.2


