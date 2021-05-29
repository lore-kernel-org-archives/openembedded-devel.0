Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.24506.1622317370425197412
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 12:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DCjYmnAh;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so871297pja.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 12:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xQl2+mUQKpWd6AjXttkxpWI6Ro+QV31MiFpdGrqyjEA=;
        b=DCjYmnAhHiMcemlv16Df26q3/lWucmntnPkA6+ARJV9aZ+ehCcs0LVPLuyEeVe7ZRU
         /FBjEuTTmI/N2n30Cl789J2v6T+ReAma3Vk19IRahQ2WFHlpAAIG3ro/Ab5JNCikRR9J
         veVaagVej5IgvvQ1vGIbCfNw8yYIOM+cnkN0e2uGIMPmSjtknlOwzO8+1OmpmQsXcoVq
         OSez00hMQuwCJkDWudcl7rZu9TTOO+UZr6qgQWrreCxegRKcMACnorU7UP1g++P3/9dO
         KoqYkejCtefNxF2Am+1+q+AdAbgHcLHNthK/BpB7LltOzWcjsFaWucfXcy/pwnSsVbsA
         MvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xQl2+mUQKpWd6AjXttkxpWI6Ro+QV31MiFpdGrqyjEA=;
        b=q45PWaBOsttqYvN5bA4PmnLB9t18n3GL2wYoPqPs8J5z0ElHLIVBbcTknw6ifFyu9n
         xbD+3yTjhUTaf5UhyPzN2+Um/q6/CbwlyLVGSG5TrvgyIPsK9q7FPisANEykZwxTRcHH
         niGvrusCeM2+BfikW/Rwvdpwv/kdiNwgGakd+jmZe8+opS6rFdMYxpCnehkwYUDlBkfE
         JOS/C2Zr+3dBI76g66sun+IDkde/hv2KPhK2aB5u01e+tq2StCmbyyHRn34vimwgkvmK
         LuliIRHgILSoA06CMNBcfWlrxBtGEuyEDT0++A+Vi+Io3dD6GAe9mpAlVKgyOp9awZEG
         fmwQ==
X-Gm-Message-State: AOAM531bQZ1JQS+63WUpeNHjpG33d9wWkpyQPIzhuLZlNrTXTJWSd2Az
	wEZoxX/r8PhmKxPWgVns7x2SJ1JFiRH8FQ==
X-Google-Smtp-Source: ABdhPJw+7b/gUve2wZ1sLQKtUjtXjMIoRcrOLcCX4yO9CXNEoGLqK+qoA9nFNEiOLRVgqpc/qW5tkA==
X-Received: by 2002:a17:902:4:b029:fa:670f:f20f with SMTP id 4-20020a1709020004b02900fa670ff20fmr13507667pla.11.1622317369766;
        Sat, 29 May 2021 12:42:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.localdomain ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id s3sm8114965pgs.62.2021.05.29.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 12:42:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-grpcio: Update to 1.38.0
Date: Sat, 29 May 2021 12:42:45 -0700
Message-Id: <20210529194245.3168135-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529194245.3168135-1-raj.khem@gmail.com>
References: <20210529194245.3168135-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop riscv patch as its applied upstream
Refresh patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python3-grpcio/mips_bigendian.patch       |  2 +-
 .../python3-grpcio/riscv64_support.patch      | 21 -------------------
 ...cio_1.37.0.bb => python3-grpcio_1.38.0.bb} |  4 +---
 3 files changed, 2 insertions(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.37.0.bb => python3-grpcio_1.38.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
index 343f25a46e..775afa415c 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
@@ -12,4 +12,4 @@
 +#elif defined(__mips__) && defined(__LP64__)
  #define OPENSSL_64_BIT
  #define OPENSSL_MIPS64
- #elif defined(__riscv)
+ #elif defined(__riscv) && __SIZEOF_POINTER__ == 8
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
deleted file mode 100644
index 350c67deaf..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Add RISC-V 64bit support
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
-+++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
-@@ -108,6 +108,14 @@ extern "C" {
- #elif defined(__MIPSEL__) && defined(__LP64__)
- #define OPENSSL_64_BIT
- #define OPENSSL_MIPS64
-+#elif defined(__riscv)
-+# if (__riscv_xlen == 64)
-+#  define OPENSSL_64_BIT
-+#  define OPENSSL_RISCV64
-+# elif(__riscv_xlen == 32)
-+#  define OPENSSL_32_BIT
-+#  define OPENSSL_RISCV32
-+# endif
- #elif defined(__pnacl__)
- #define OPENSSL_32_BIT
- #define OPENSSL_PNACL
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.37.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.38.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.37.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.38.0.bb
index 47fb71120d..d9e00422bc 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.38.0.bb
@@ -8,12 +8,11 @@ DEPENDS += "${PYTHON_PN}-protobuf"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
-                                file://riscv64_support.patch \
                                 file://boring_ssl.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "b3ce16aa91569760fdabd77ca901b2288152eb16941d28edd9a3a75a0c4a8a85"
+SRC_URI[sha256sum] = "abbf9c8c3df4d5233d5888c6cfa85c1bb68a6923749bd4dd1abc6e1e93986f17"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
@@ -46,4 +45,3 @@ CCACHE_DISABLE = "1"
 
 # needs vdso support
 COMPATIBLE_HOST_libc-musl_powerpc64le = "null"
-
-- 
2.31.1

