Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9671.1623141487274639498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 01:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1588c5TO018105
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 01:38:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 8 Jun 2021 01:38:04 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 8 Jun 2021 01:38:03 -0700
From: "kai" <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-m2crypto: fix word size for qemuppc64 little endian
Date: Tue, 8 Jun 2021 16:38:00 +0800
Message-ID: <20210608083800.22260-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile python3-m2crypto for qemuppc64 little endian:

| /path/to/tmp-glibc/work/ppc64p9le-wrs-linux/python3-m2crypto/0.37.1-r0/
    recipe-sysroot/usr/include/openssl/opensslconf.h:23:
| Error: Unable to find 'openssl/opensslconf-32.h'

It defines '__powerpc64le__' but expects '__powerpc64__'. Define the
right macro for qemuppc64le.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index e1f92928c..2284a43a3 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -39,6 +39,7 @@ SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('S
 SWIG_FEATURES_append_riscv64 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES_append_riscv32 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES_append_mipsarch = " -D_MIPS_SZPTR=${SITEINFO_BITS}"
+SWIG_FEATURES_append_powerpc64le = " -D__powerpc64__"
 export SWIG_FEATURES
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

