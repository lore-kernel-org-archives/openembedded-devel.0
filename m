Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7AA7FD08
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 09:31:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,409,1571673600"; d="scan'208";a="81480877"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jan 2020 17:31:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 467EF406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 17:22:14 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 8 Jan 2020 17:31:13 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 8 Jan 2020 17:31:23 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2020 05:41:08 -0800
Message-ID: <1578490868-66073-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578490868-66073-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578490868-66073-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 467EF406AB15.A331D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] msgpack-c: upgrade 3.1.1 -> 3.2.1
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
X-List-Received-Date: Wed, 08 Jan 2020 09:31:18 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../msgpack/{msgpack-c_3.1.1.bb => msgpack-c_3.2.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-c_3.1.1.bb => msgpack-c_3.2.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_3.1.1.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/msgpack/msgpack-c_3.1.1.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb
index 90fd44e60..d410dc6e0 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_3.1.1.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb
@@ -11,8 +11,8 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/msgpack/msgpack-c \
            "
-# cpp-3.1.1
-SRCREV = "83a82e3eb512b18d4149cabb7eb43c7e8bc081af"
+# cpp-3.2.1
+SRCREV = "8085ab8721090a447cf98bb802d1406ad7afe420"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




