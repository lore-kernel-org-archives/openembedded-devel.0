Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E95F71C69
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 05:41:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36779443"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Feb 2018 13:41:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3EB5549F19C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 13:41:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Feb 2018 13:41:09 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Feb 2018 13:40:49 +0800
Message-ID: <1517809249-7183-6-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 3EB5549F19C4.A7C37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] tiptop: 2.3 -> 2.3.1
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
X-List-Received-Date: Mon, 05 Feb 2018 05:41:11 -0000
Content-Type: text/plain

Upgrade tiptop from 2.3 to 2.3.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/tiptop/{tiptop_2.3.bb => tiptop_2.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/tiptop/{tiptop_2.3.bb => tiptop_2.3.1.bb} (87%)

diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
similarity index 87%
rename from meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
rename to meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
index d729de9..0a00a36 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "ncurses libxml2"
 
 SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "f1fba1e90465b0e5a3865b19133fa19d"
-SRC_URI[sha256sum] = "3f07e958b40acaeab98e9eb1326c9f91b0be0a782c1cc2bd7a9e18d31fab18ca"
+SRC_URI[md5sum] = "46ca0fdf0236f02dd2b96d347626d2a2"
+SRC_URI[sha256sum] = "51c4449c95bba34f16b429729c2f58431490665d8093efaa8643b2e1d1084182"
 
 inherit autotools-brokensep
 EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
-- 
2.7.4




