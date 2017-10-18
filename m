Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BB343782D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2017 01:26:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="29327796"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Oct 2017 09:26:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 790C548029C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2017 09:26:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 18 Oct 2017 09:26:34 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Oct 2017 09:26:35 +0800
Message-ID: <1508289995-12611-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 790C548029C6.A730D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] postgresql: Update to 9.4.14
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
X-List-Received-Date: Wed, 18 Oct 2017 01:26:38 -0000
Content-Type: text/plain

1) Upgrade pcsc-lite from 9.4.13 to 9.4.14.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../postgresql/{postgresql_9.4.13.bb => postgresql_9.4.14.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.13.bb => postgresql_9.4.14.bb} (67%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
similarity index 67%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
index bf97cad..5a78ea3 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.13.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.14.bb
@@ -11,5 +11,5 @@ do_compile_prepend_libc-musl() {
     sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
 }
 
-SRC_URI[md5sum] = "dbdb9fbe1b9a394b9ac19d3113b73944"
-SRC_URI[sha256sum] = "0080f55d65194de8b96a2dab153443f8248ff2b2b10e6ab4cda2dcadcac7f2ab"
+SRC_URI[md5sum] = "2b7e2a2b0232063b68b3f8a0a01902bd"
+SRC_URI[sha256sum] = "8e7df23a104b057b360d03180ebcb67f645e198a4a0bee94bf56b2bc9505ec6b"
-- 
2.7.4




