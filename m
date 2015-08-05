Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6C61A6E5D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 02:58:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99276412"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 11:01:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t752uUbo025104
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Aug 2015 10:56:30 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Aug 2015 10:58:23 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Aug 2015 10:57:36 +0800
Message-ID: <1438743456-2869-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-oe][PATCH v2] pcsc-lite: upgrade 1.8.6 -> 1.8.13
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
X-List-Received-Date: Wed, 05 Aug 2015 02:58:28 -0000
Content-Type: text/plain

* Remove PR
* Modify chksum of COYING,since the explanation of GPLv3+ is added, but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../pcsc-lite/{pcsc-lite_1.8.6.bb => pcsc-lite_1.8.13.bb}        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.6.bb => pcsc-lite_1.8.13.bb} (69%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
similarity index 69%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
index c562b3d..cc72549 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
@@ -2,14 +2,13 @@ SUMMARY = "PC/SC Lite smart card framework and applications"
 HOMEPAGE = "http://pcsclite.alioth.debian.org/"
 LICENSE = "BSD & GPLv3+"
 LICENSE_${PN}-dev = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a39d325b7d9cf2f07826a5154b16500c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
 DEPENDS = "udev"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/3757/pcsc-lite-${PV}.tar.bz2"
-SRC_URI[md5sum] = "3e4b777231d35ce35c15c0704f936eaa"
-SRC_URI[sha256sum] = "1e44049168d1ce55fd56c175f61206955254df0f385455f2a20ec7e8a0e6a77a"
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/4126/pcsc-lite-${PV}.tar.bz2"
+SRC_URI[md5sum] = "4dcd22d20a6df8810fac5480cc320b6d"
+SRC_URI[sha256sum] = "f315047e808d63a3262c4a040f77548af2e04d1fd707e0c2759369b926fbbc3b"
 
-PR = "r3"
 
 inherit autotools systemd pkgconfig
 
-- 
1.8.4.2


