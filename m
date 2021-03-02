Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5472.1614671259700623980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 23:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,216,1610380800"; 
   d="scan'208";a="105016255"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Mar 2021 15:47:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8FA9E4CE7C1F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Mar 2021 15:47:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Mar 2021 15:47:30 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] Fix do_package error when enable multilib.
Date: Tue, 2 Mar 2021 15:47:27 +0800
Message-ID: <1614671247-67782-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8FA9E4CE7C1F.A9F12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

ERROR: grpc-1.35.0-r0 do_package: QA Issue: grpc: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/pkgconfig
  /usr/lib/pkgconfig/grpc.pc
  /usr/lib/pkgconfig/grpc_unsecure.pc
  /usr/lib/pkgconfig/grpc++.pc
  /usr/lib/pkgconfig/gpr.pc
  /usr/lib/pkgconfig/grpc++_unsecure.pc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
grpc: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: grpc-1.35.0-r0 do_package: Fatal QA errors found, failing task.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
index 5097b2b1b..363e2b468 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
@@ -35,6 +35,11 @@ EXTRA_OECMAKE = " \
     -DgRPC_INSTALL_CMAKEDIR=${baselib}/cmake/${BPN} \
     "
 
+do_configure_prepend() {
+    sed -i -e "s#lib/pkgconfig/#${baselib}/pkgconfig/#g" ${S}/CMakeLists.txt
+}
+
+
 do_configure_prepend_mipsarch() {
     sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
 }
-- 
2.25.1



