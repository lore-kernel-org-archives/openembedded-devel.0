Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.6279.1585899343952775629
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 00:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0337ZdF2006087
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 3 Apr 2020 00:35:40 -0700 (PDT)
Received: from 0d91d9514440.wrs.com (128.224.153.74) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Apr 2020 00:35:39 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-grpcio: disable ccache to workaround native build failure
Date: Fri, 3 Apr 2020 15:35:37 +0800
Message-ID: <20200403073537.23061-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

While enabling ccache, build python3-grpcio-native failed:
...
|error: can't copy 'tmp-glibc/work/x86_64-linux/python3-grpcio-native/
1.27.1-r0/build/lib.linux-x86_64-3.8/grpc/_cython/
cygrpc.cpython-38-x86_64-linux-gnu.so': doesn't exist or not a regular file
|ERROR: 'python3 setup.py build ' execution failed.
...

So disable ccache to workaround the failure.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
index 358b237f7..83d367101 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
@@ -30,3 +30,5 @@ do_compile_prepend_toolchain-clang() {
 CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CCACHE_DISABLE = "1"
-- 
2.17.1

