Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 18531601F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 07:45:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99020039"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 15:49:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T7hfTv005704
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 15:43:41 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 15:45:32 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jul 2015 15:45:23 +0800
Message-ID: <1438155923-2929-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] quagga: upgrade 0.99.23 -> 0.99.24.1
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
X-List-Received-Date: Wed, 29 Jul 2015 07:45:36 -0000
Content-Type: text/plain

Remove "--enable-ipv6" to avoid build warning like this:
WARNING: QA Issue: quagga: configure was passed unrecognised options:
--enable-ipv6 [unknown-configure-option]

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc                   | 1 -
 .../quagga/{quagga_0.99.23.bb => quagga_0.99.24.1.bb}                 | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-protocols/quagga/{quagga_0.99.23.bb => quagga_0.99.24.1.bb} (45%)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 2f0b515..de78e26 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -65,7 +65,6 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 ${@base_contains('DISTRO_FEATURES', 'sysvinit', '--enable-watchquagga', '--disable-watchquagga', d)} \
                 --enable-ospf-te \
                 --enable-opaque-lsa \
-                --enable-ipv6 \
                 --enable-ospfclient=yes \
                 --enable-multipath=64 \
                 --enable-user=quagga \
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.23.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
similarity index 45%
rename from meta-networking/recipes-protocols/quagga/quagga_0.99.23.bb
rename to meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
index a56767e..09c4e7d 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.23.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
@@ -3,7 +3,7 @@ require quagga.inc
 SRC_URI += "file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
 "
 
-SRC_URI[md5sum] = "d17145e62b6ea14f0f13bb63f59e5166"
-SRC_URI[sha256sum] = "2c7798204f35dc7acea9f206647e8aa3957cae3b21733cdff413b506481a101c"
+SRC_URI[md5sum] = "7986bdc2fe6027d4c9216f7f5791e718"
+SRC_URI[sha256sum] = "84ae1a47df085119a8fcab6c43ccea9efb9bc3112388b1dece5a9f0a0262754f"
 
 QUAGGASUBDIR = ""
-- 
1.8.4.2


