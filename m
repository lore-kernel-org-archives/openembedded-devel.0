Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA616E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 00:42:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="45348051"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Sep 2018 08:42:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C36B74B6ED40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 08:42:26 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 26 Sep 2018 08:42:29 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Sep 2018 08:42:36 +0800
Message-ID: <20180926004237.28406-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180926004237.28406-1-hongl.fnst@cn.fujitsu.com>
References: <20180926004237.28406-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: C36B74B6ED40.AED2C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] mozjs: upgrade to 52.9.1
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
X-List-Received-Date: Wed, 26 Sep 2018 00:42:28 -0000
Content-Type: text/plain

Upgrade mozjs from 52.8.1 to 52.9.1

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>

	renamed:    mozjs_52.8.1.bb -> mozjs_52.9.1.bb
---
 meta-oe/recipes-extended/mozjs/{mozjs_52.8.1.bb => mozjs_52.9.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs_52.8.1.bb => mozjs_52.9.1.bb} (95%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
similarity index 95%
rename from meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
rename to meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
index 626522e..0dfe2f8 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonk
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.8.1.orig.tar.bz2 \
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.9.1.orig.tar.xz \
            file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
            file://0010-fix-cross-compilation-on-i586-targets.patch \
            file://0001-do-not-create-python-environment.patch \
@@ -22,8 +22,8 @@ SRC_URI_append_mipsarchn32 = " \
            file://0001-fix-compiling-failure-on-mips64-n32-bsp.patch \
            "
 
-SRC_URI[md5sum] = "3a44c2fd3d7b5a370ed9184163c74bc4"
-SRC_URI[sha256sum] = "fb5e11b7f31a33be820d5c947c5fa114751b0d5033778c1cd8e0cf2dad91e8fa"
+SRC_URI[md5sum] = "c9473c625ee0a9edaaac8b742ff24c5f"
+SRC_URI[sha256sum] = "f9324a6724233ab15f10381fe13e635e89d725ef1e78025a0a7d36c58a84a0f9"
 
 inherit autotools pkgconfig perlnative pythonnative
 
-- 
2.7.4




