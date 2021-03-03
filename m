Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.1966.1614803424460826738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 12:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EVaevxoG;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id i14so4909597pjz.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 12:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F1q/U8A/eC5Cr/4V9cGhcfA/V7C4DWJYWMDcbUcmFIA=;
        b=EVaevxoGnL1qXYendXkRfX1qHF/fwxLr0m8nYN5+2yEpn6i+7q0QX76sfuDopnuDun
         sRLN3yNznfwHhqMvKH8z+5cuGh2qk4aGnnCL5Vm1RFNzvyfbqyWoNpNQccUPhKQK5Tyj
         lOzgjz/jC9/IOd3IJbS6Q7xYBvloqfZuhznF0L72hgZE7M15amRqO7qlfR5KwV2MT+wO
         9KhczjEJObZxUWer1Lok0yob1aLX0QRNdXnF9rbMgOLAbuahxSOTG4LBdeBxRENg3WWt
         wkoqN18V7DzZClFTEfZCnfmORrDR+xJigGTV+AfMSpMcXnMgUoBC9eh3Ss87MEXUImhr
         HJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F1q/U8A/eC5Cr/4V9cGhcfA/V7C4DWJYWMDcbUcmFIA=;
        b=tdr6N23lkNqaRAeaa+XAfcFXqtHKffnGS49oF0AnB8p6/J37bLoU4xWiS1U5cyvHzE
         gOO3G8KXbTv+t++fBQfyyZGS6w/V3sLRaXTFhGPWGj+u9ComN+l2hHkizf5f+mgkbLtL
         jQLKs+F4EuXbyw7csUYmxJj0ml7L/x8nwxVIplzU778Dl8HI4qtWjbQBqMo5HzpASspq
         LVfAcTfY3vSq5KeUA7olzIG0dx6ikvPkvgwzgxaxtG/KzK4PMM1Z3eNsv77/YTzOolo6
         lE31PGjZ5JgL3pZBA0yKRwuJ9MP1Xrji/YcmRDhwPQc1npPAkSMV69QVXWt6MphGKhoe
         pB2A==
X-Gm-Message-State: AOAM531WM7F+fLkPlR89xzdZ2UM4YBAJLis4EZYfI+yCZkJ94ekHQq7w
	w1MM32gBWfhYj1uicuwrN7MlM6G5LYsj7Q==
X-Google-Smtp-Source: ABdhPJxf5A260drQ0vVQinH7HFvGxQBw1x3UGYz+GHbkd9ruIyykIz6+5eVC7lbtY/xmhXG1cXgvVg==
X-Received: by 2002:a17:90a:4104:: with SMTP id u4mr814547pjf.81.1614803418855;
        Wed, 03 Mar 2021 12:30:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id e21sm23219690pgv.74.2021.03.03.12.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 12:30:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-grpcio: Upgrade to 1.36.1
Date: Wed,  3 Mar 2021 12:30:16 -0800
Message-Id: <20210303203016.2832532-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release notes are here [1]

See the differences after 1.35.0 upwards

[1] https://github.com/grpc/grpc/releases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-grpcio/ppc-boringssl-support.patch           | 2 +-
 .../python/python3-grpcio/riscv64_support.patch                 | 2 +-
 .../{python3-grpcio_1.35.0.bb => python3-grpcio_1.36.1.bb}      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.35.0.bb => python3-grpcio_1.36.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
index dadd3da85e..5c9be443d8 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
@@ -12,6 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#elif (defined(__PPC__) || defined(__powerpc__))
 +#define OPENSSL_32_BIT
 +#define OPENSSL_PPC
- #elif defined(__mips__) && !defined(__LP64__)
+ #elif defined(__MIPSEL__) && !defined(__LP64__)
  #define OPENSSL_32_BIT
  #define OPENSSL_MIPS
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
index 7e071ae1e6..350c67deaf 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
@@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
 +++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
 @@ -108,6 +108,14 @@ extern "C" {
- #elif defined(__mips__) && defined(__LP64__)
+ #elif defined(__MIPSEL__) && defined(__LP64__)
  #define OPENSSL_64_BIT
  #define OPENSSL_MIPS64
 +#elif defined(__riscv)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index 2c137f6ce7..d374b54b34 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -11,7 +11,7 @@ SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
                                 file://boring_ssl.patch \
 "
-SRC_URI[sha256sum] = "7bd0ebbb14dde78bf66a1162efd29d3393e4e943952e2f339757aa48a184645c"
+SRC_URI[sha256sum] = "a66ea59b20f3669df0f0c6a3bd57b985e5b2d1dcf3e4c29819bb8dc232d0fd38"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.30.1

