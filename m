Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2820.1628650172383903469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 19:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17B2nU4g023791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 19:49:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 19:49:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 19:49:29 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-m2crypto: fix for new overrides syntax
Date: Wed, 11 Aug 2021 10:49:25 +0800
Message-ID: <20210811024925.28280-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix wrong replacement caused by script convert-overrides.py. And use new
overrides syntax for 'x32'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-devtools/python/python3-m2crypto_0.38.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
index e0f4870be..e1ee99bae 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
@@ -31,14 +31,14 @@ DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGIN
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
 
 SWIG_FEATURES:x86 = "-D__i386__"
-SWIG_FEATURES_x32 = "-D__ILP32__"
+SWIG_FEATURES:x32 = "-D__ILP32__"
 
 SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']}"
 
 SWIG_FEATURES:append:riscv64 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES:append:riscv32 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES:append:mipsarch = " -D_MIPS_SZPTR=${SITEINFO_BITS}"
-SWIG_FEATURES:append:powerpc64le = " -D_:powerpc64__"
+SWIG_FEATURES:append:powerpc64le = " -D__powerpc64__"
 export SWIG_FEATURES
 
 export STAGING_DIR
-- 
2.17.1

