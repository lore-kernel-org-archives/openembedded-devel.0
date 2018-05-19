Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 84A9C603FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 03:20:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40513390"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 May 2018 11:20:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D687A4B40413
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 11:20:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 29 May 2018 11:20:21 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 19 May 2018 11:11:12 -0700
Message-ID: <1526753472-30951-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: D687A4B40413.AC8C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] tiptop: Add aarch64 into COMPATIBLE_HOST.
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
X-List-Received-Date: Tue, 29 May 2018 03:20:34 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
index 0a00a36..4289c68 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "51c4449c95bba34f16b429729c2f58431490665d8093efaa8643b2e1d1
 
 inherit autotools-brokensep
 EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
-COMPATIBLE_HOST = "(i.86|x86_64|arm|powerpc).*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64|arm|powerpc|aarch64).*-linux"
 
 do_configure_prepend () {
     # Two bugs in configure.ac when cross-compiling.
-- 
1.9.1




