Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD9D78A56
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 05:48:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37468215"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2018 13:48:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7607748AE761
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:48:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Mar 2018 13:48:27 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Mar 2018 13:48:05 +0800
Message-ID: <1520228885-9939-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520228885-9939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1520228885-9939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 7607748AE761.A572F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] nodejs: 8.9.0 -> 8.9.4
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
X-List-Received-Date: Mon, 05 Mar 2018 05:48:26 -0000
Content-Type: text/plain

1.Upgrade nodejs from 8.9.0 to 8.9.4
2.Update the checksum of LIC_FILES_CHKSUM, since nodejs has been changed. But lincese remains the same.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.9.0.bb => nodejs_8.9.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.9.0.bb => nodejs_8.9.4.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
index 1cab6a4..6164f91 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=14045ee6ae930d784435884f8aa1be0d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=270f7477a1705f7cd3e29d3d4512915d"
 
 DEPENDS = "openssl10 zlib"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "49001b4037b2ddf10c2174c38a40f112"
-SRC_URI[sha256sum] = "ae8258f89e127a76d4b4aff6fdb8dc395b7da0069cba054b913dfc36b3c91189"
+SRC_URI[md5sum] = "631ed102fe58c13cf63bc92a68cf4759"
+SRC_URI[sha256sum] = "6cdcde9c9c1ca9f450a0b24eafa229ca759e576daa0fae892ce74d541ecdc86f"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4




