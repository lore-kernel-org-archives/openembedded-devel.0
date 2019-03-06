Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id B158A7C7D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:57 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id j3so7424367pgm.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RK79ibkvizPNsdyFAStiEMzFDvqDak9/tq9HZUQFyHU=;
	b=cJkD8OQVhNzmFH8tnksS8TzIgeo1llvsWIuSN420nLSGBO+iQp4ZqhfjDPPXZzcqOn
	usr3BDYlAYvKVhKPN9ThR5x9vCq0sZHxMnPtCzLkPlGfGjG56Iyh9ARmpRCQeessFpQx
	UGxi2+hqQjPIlyzukVpMW8Ch9izKlYErb5DRzPWsUzlGwla3OODdUjM4YG4E6cCO2uwL
	4U0ZPUIz+d5LtTvpgoeUdiwhbF66SAH+UuKtYZYHV67t0UQVpHH/3yirSdYwwG1qvDCf
	nEp/l7Bmoa0PBpmahbGt0UNnGPhXa/19RSt4jss/mQZlDvUTZVZpltPybGv7d8Uw/8NV
	aAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RK79ibkvizPNsdyFAStiEMzFDvqDak9/tq9HZUQFyHU=;
	b=hEc1jvx6H1p8D3pev7lyEPIQlvT8ty36DUr7GtPECHQIJYjSsleWAl6yuRF4WfXoId
	CN/adBvqL6+U5pLysygpSnCCxS5+YPstzYYBTKGEc2nlc8EvM1WJDE/UqC/nPr8KYRjQ
	pY+moNdUInqbop8WGghxCDdhJ0cLkDDhGFVys6zpQlbkRsYzxSkcWx6Me/p9E2GPkHtR
	8apDTlRaq2MX2s4k2wZe3pGwfynIwV2hnpdrJ5C4aR4YLWGB4AsgVfGxXlEASOhV1r6b
	aEksur8XR4mrOohCdJePgb6FqSNIu8IRzqu90Zhea6k0ZWYv49Ziw71Ttu8rg46eFy/A
	V+Jg==
X-Gm-Message-State: APjAAAXg7OwgqbBQgNfFugGxIGCU0RF/+IqRGeosiA7FDSNbQ9hxbT73
	iS0b3mOk1pz315xuTp+1EzAaNPcy
X-Google-Smtp-Source: APXvYqxT5OQaI1uQyuxp+LrGlT0LiaAnHvicyrOcBC/tZt7Gs+LSX5pA9CfQbafpn6dDHS4b2A1y+Q==
X-Received: by 2002:a63:1241:: with SMTP id 1mr4742061pgs.211.1551851158350;
	Tue, 05 Mar 2019 21:45:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:41 -0800
Message-Id: <20190306054548.16430-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 05/12] python-grpcio: Upgrade to 1.19.0
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:57 -0000
Content-Transfer-Encoding: 8bit

Refresh patch to apply cleanly
Fix build for RISC-V

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-grpcio.inc    |  6 ++++--
 ....py-Do-not-mix-C-and-C-compiler-options.patch | 12 +++++-------
 .../python/python-grpcio/riscv64_support.patch   | 16 ++++++++++++++++
 ...-grpcio_1.17.1.bb => python-grpcio_1.19.0.bb} |  0
 ...grpcio_1.17.1.bb => python3-grpcio_1.19.0.bb} |  0
 5 files changed, 25 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio/riscv64_support.patch
 rename meta-python/recipes-devtools/python/{python-grpcio_1.17.1.bb => python-grpcio_1.19.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.17.1.bb => python3-grpcio_1.19.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio.inc b/meta-python/recipes-devtools/python/python-grpcio.inc
index 0cef0dda02..fd341f5de7 100644
--- a/meta-python/recipes-devtools/python/python-grpcio.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio.inc
@@ -8,6 +8,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-grpcio:"
 
 SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
                                 file://ppc-boringssl-support.patch \
+                                file://riscv64_support.patch \
 "
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
@@ -19,8 +20,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
 
 inherit pypi
-SRC_URI[md5sum] = "dd46d7270dfce713c03f45fae999cae3"
-SRC_URI[sha256sum] = "fd6774bbb6c717f725b39394757445ead4f69c471118364933aadb81a4f16961"
+
+SRC_URI[md5sum] = "188565f150f34d1927b87e014f0f4b73"
+SRC_URI[sha256sum] = "2ddbca16c2e7b3f2ffc6e34c7cfa6886fb01de9f156ad3f77b72ad652d632097"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 996597b146..f17f048de8 100644
--- a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -18,11 +18,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: grpcio-1.14.1/setup.py
-===================================================================
---- grpcio-1.14.1.orig/setup.py
-+++ grpcio-1.14.1/setup.py
-@@ -123,7 +123,7 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.
+--- a/setup.py
++++ b/setup.py
+@@ -145,7 +145,7 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.
  EXTRA_ENV_COMPILE_ARGS = os.environ.get('GRPC_PYTHON_CFLAGS', None)
  EXTRA_ENV_LINK_ARGS = os.environ.get('GRPC_PYTHON_LDFLAGS', None)
  if EXTRA_ENV_COMPILE_ARGS is None:
@@ -31,7 +29,7 @@ Index: grpcio-1.14.1/setup.py
    if 'win32' in sys.platform and sys.version_info < (3, 5):
      EXTRA_ENV_COMPILE_ARGS += ' -D_hypot=hypot'
      # We use define flags here and don't directly add to DEFINE_MACROS below to
-@@ -135,7 +135,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
+@@ -157,7 +157,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
      else:
        EXTRA_ENV_COMPILE_ARGS += ' -D_ftime=_ftime64 -D_timeb=__timeb64'
    elif "linux" in sys.platform:
@@ -39,4 +37,4 @@ Index: grpcio-1.14.1/setup.py
 +    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
    elif "darwin" in sys.platform:
      EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
- EXTRA_ENV_COMPILE_ARGS += ' -DPB_FIELD_16BIT'
+ EXTRA_ENV_COMPILE_ARGS += ' -DPB_FIELD_32BIT'
diff --git a/meta-python/recipes-devtools/python/python-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python-grpcio/riscv64_support.patch
new file mode 100644
index 0000000000..fef7d9e757
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio/riscv64_support.patch
@@ -0,0 +1,16 @@
+Add RISC-V 64bit support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/third_party/boringssl/include/openssl/base.h
++++ b/third_party/boringssl/include/openssl/base.h
+@@ -104,6 +104,9 @@ extern "C" {
+ #elif defined(__mips__) && defined(__LP64__)
+ #define OPENSSL_64_BIT
+ #define OPENSSL_MIPS64
++#elif defined(__riscv) && defined(__riscv_xlen)
++#define OPENSSL_64_BIT
++#define OPENSSL_RISCV64
+ #elif defined(__pnacl__)
+ #define OPENSSL_32_BIT
+ #define OPENSSL_PNACL
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.17.1.bb b/meta-python/recipes-devtools/python/python-grpcio_1.19.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-grpcio_1.17.1.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.19.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.17.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.19.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.17.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.19.0.bb
-- 
2.21.0


