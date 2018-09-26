Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11F066E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 00:42:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="45348052"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Sep 2018 08:42:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E8584B6EC9E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 08:42:26 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 26 Sep 2018 08:42:28 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Sep 2018 08:42:35 +0800
Message-ID: <20180926004237.28406-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 2E8584B6EC9E.AFEA4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] nodejs: upgrade to 8.12.0
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
X-List-Received-Date: Wed, 26 Sep 2018 00:42:29 -0000
Content-Type: text/plain

Upgrade nodejs from 8.11.4 to 8.12.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.11.4.bb => nodejs_8.12.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.11.4.bb => nodejs_8.12.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.11.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.11.4.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
index 60f60d2..e3b46bc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.11.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "ba3ef2f12e911d7e64c2ab135378792a"
-SRC_URI[sha256sum] = "fbce7de6d96b0bcb0db0bf77f0e6ea999b6755e6930568aedaab06847552a609"
+SRC_URI[md5sum] = "8b3abd033dae96b6fadcb6a872a44d3c"
+SRC_URI[sha256sum] = "5a9dff58016c18fb4bf902d963b124ff058a550ebcd9840c677757387bce419a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4




