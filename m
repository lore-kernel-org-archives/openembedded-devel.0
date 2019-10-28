Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E8BA57FBCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:30:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="77574333"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 15:30:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 578204CE151D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 15:22:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 28 Oct 2019 15:30:32 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 23:24:49 +0800
Message-ID: <1572276289-125302-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 578204CE151D.A4EB2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] postfix: upgrade 3.4.5 -> 3.4.7
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
X-List-Received-Date: Mon, 28 Oct 2019 07:30:31 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/postfix/{postfix_3.4.5.bb => postfix_3.4.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.5.bb => postfix_3.4.7.bb} (84%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.7.bb
similarity index 84%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.7.bb
index 189baea..3699ee5 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.7.bb
@@ -15,7 +15,7 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch \
            "
-SRC_URI[md5sum] = "093109941095390562166de766d4720d"
-SRC_URI[sha256sum] = "8b2ba54f9d2a049582a0ed3ee2dbe96ba57e278feea9cb4f80e1a61844e6319f"
+SRC_URI[md5sum] = "b29ab85e8f6ef7fae132b004e777671b"
+SRC_URI[sha256sum] = "fe3253121d3ba8836a23774225518560b35e40497951ad5bec154afa8205f967"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.7.4




