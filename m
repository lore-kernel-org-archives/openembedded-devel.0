Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328F6C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:55:14 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.42977.1635767713363612333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3AFA6iA64gfOj2X+eSJshyhwxRtBHFchMFZxGqfqr?=
 =?us-ascii?q?LsXjdYENShTAAzWpLCmqAOfuIYDT9et5xPImyoUwFsJfTy9FqGgE5pCpnJ55og?=
 =?us-ascii?q?ZCbXIzGdC8cHM8zwvXrFRsht4NHAjX5BJhcokT0+1H9bdANkVEmjfvRH+OkUba?=
 =?us-ascii?q?dUsxMbVQMpBkJ2EsLd9ER0tYAbeiRW2thiPuqyyHtEAbNNw1cbgr435m+RCZH5?=
 =?us-ascii?q?5wejt+3UmsWPpintHeG/5Uc4Ql2yauZdxMUSaEMdgK2qnqq8V23wo/Z109F5tK?=
 =?us-ascii?q?NmbC9fFAIQ6LJIE6FjX8+t6qK20AE/3JtlP1gcqd0hUR/0l1lm/hjyNhLuoapD?=
 =?us-ascii?q?wkvJbHklvkfUgVDDmd1OqguFLrveCHh7pbIlhGbG5fr67A0ZK0sBqUf4utxDGR?=
 =?us-ascii?q?E+PAUJTxIYh2diuaexLOgVvIqgdwuKsTuNo4TtnxsizbDAp4brTrrK0nRzYYAm?=
 =?us-ascii?q?m5u2YYVRrCDD/f1oAFHNHzoCyCj8H9OYH7moNqVuw=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AiPs9ZK2c0wajFjZP8ZlcLQqjBI4kLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SL39qynKppkmPHDP5gr5J0tLpTntAsi9qBDnhPtICOsqTNSftWDd0Q?=
 =?us-ascii?q?PGEGgI1/qB/9SPIU3D398Y/aJhXow7M9foEGV95PyQ3CCIV/om3/mLmZrFudvj?=
X-IronPort-AV: E=Sophos;i="5.87,199,1631548800";
   d="scan'208";a="116723145"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Nov 2021 19:55:12 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 34FDF4D0DC99
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 19:55:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 1 Nov 2021 19:55:08 +0800
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.41.0 -> 1.41.1
Date: Tue, 2 Nov 2021 04:54:42 +0800
Message-ID: <1635800082-101954-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 34FDF4D0DC99.A2247
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@fujitsu.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:55:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93738

This is release 1.41.0 (goat) of gRPC Core.

For gRPC documentation, see grpc.io.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-grpcio_1.41.0.bb => python3-grpcio_1.41.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.41.0.bb => python3-grpcio_1.41.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.41.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.41.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.41.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.41.1.bb
index fb6f1a3e2d..a882f6e031 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.41.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.41.1.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "15c04d695833c739dbb25c88eaf6abd9a461ec0dbd32f44bc8769335a495cf5a"
+SRC_URI[sha256sum] = "9b751271b029432a526a4970dc9b70d93eb6f0963b6a841b574f780b72651969"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1




