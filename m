Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D8C9478EFB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:41:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44069359"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2018 17:41:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 223FA4B6AE12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:41:45 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 28 Aug 2018 17:41:42 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Aug 2018 17:41:28 +0800
Message-ID: <20180828094128.19607-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180828094128.19607-1-hongl.fnst@cn.fujitsu.com>
References: <20180828094128.19607-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 223FA4B6AE12.AD876
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-xxxx][PATCH] nodejs: 8.11.3 -> 8.11.4
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
X-List-Received-Date: Tue, 28 Aug 2018 09:41:49 -0000
Content-Type: text/plain

Upgrade nodejs from 8.11.3 to 8.11.4

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.11.3.bb => nodejs_8.11.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.11.3.bb => nodejs_8.11.4.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.11.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.11.4.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.11.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.11.4.bb
index 4017d92..60f60d2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.11.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.11.4.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "6cb0e19089ad13a4ec02640b604d2e0f"
-SRC_URI[sha256sum] = "577c751fdca91c46c60ffd8352e5b465881373bfdde212c17c3a3c1bd2616ee0"
+SRC_URI[md5sum] = "ba3ef2f12e911d7e64c2ab135378792a"
+SRC_URI[sha256sum] = "fbce7de6d96b0bcb0db0bf77f0e6ea999b6755e6930568aedaab06847552a609"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4




