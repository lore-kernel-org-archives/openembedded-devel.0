Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C876B7CBC6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:24:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,398,1544457600"; d="scan'208";a="54942615"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Feb 2019 14:24:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9793F4C47E75
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:24:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 22 Feb 2019 14:24:42 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1549095907-56985-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 9793F4C47E75.ACD6E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] uftrace: Support armeb.
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
Date: Fri, 22 Feb 2019 06:24:39 -0000
X-Original-Date: Sat, 2 Feb 2019 16:25:07 +0800
X-List-Received-Date: Fri, 22 Feb 2019 06:24:39 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
index 30c8503..5963e5d 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
@@ -24,6 +24,8 @@ def set_target_arch(d):
     arch = d.getVar('TARGET_ARCH')
     if re.match(r'i.86', arch, re.I):
         return 'i386'
+    elif re.match('armeb', arch, re.I):
+        return 'arm'
     else:
         return arch
 
-- 
2.7.4




