Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DBE6877E35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:36:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,408,1498492800"; d="scan'208";a="24168249"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Aug 2017 16:35:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8414047243AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 16:36:00 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 21 Aug 2017 16:36:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Aug 2017 16:35:59 +0800
Message-ID: <1503304559-10627-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 8414047243AB.A2425
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] pcsc-lite: Update to 1.8.22
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
X-List-Received-Date: Mon, 21 Aug 2017 08:36:08 -0000
Content-Type: text/plain

1) Upgrade pcsc-lite from 1.8.13 to 1.8.22.

2) License information has changed in pcsc-lite-1.8.22/COPYING  for src/strlcpy.3, src/strlcat.c and src/strlcpy.c have been removed in pcsc-lite-1.8.22, so modify the LIC_FILES_CHKSUM. 

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../pcsc-lite/{pcsc-lite_1.8.13.bb => pcsc-lite_1.8.22.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.13.bb => pcsc-lite_1.8.22.bb} (82%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
similarity index 82%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
index 0d2cb33..90d58b0 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
@@ -8,12 +8,12 @@ LICENSE_${PN}-dev = "BSD"
 LICENSE_${PN}-dbg = "BSD & GPLv3+"
 LICENSE_${PN}-spy = "GPLv3+"
 LICENSE_${PN}-spy-dev = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
 DEPENDS = "udev"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/4126/pcsc-lite-${PV}.tar.bz2"
-SRC_URI[md5sum] = "4dcd22d20a6df8810fac5480cc320b6d"
-SRC_URI[sha256sum] = "f315047e808d63a3262c4a040f77548af2e04d1fd707e0c2759369b926fbbc3b"
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/4225/pcsc-lite-${PV}.tar.bz2"
+SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
+SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
 
 
 inherit autotools systemd pkgconfig
-- 
2.7.4




