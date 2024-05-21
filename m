Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7140C25B7D
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3101.1716315045649606425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K1CshmfG;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f447976de7so1611368b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315045; x=1716919845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au6qYTdw+vOSxSNLYj/YJbyijCpp22cIgp0istqAo4Y=;
        b=K1CshmfGm017qn78xVJaMlIg6NYE/Hcx006+OTLghabzmMHzWDC4i7LcHRy7GJuMce
         sIhq9KIVlQC2C/1JtqtTGzIX6MU6HLvWxP5VYka61IC1EDBSCG3LxyJP/JXLiA8VI+Py
         KpLCrb40R4a96tnuzbT4vJrRnHQBAoI2SiHOK8MCLljVa5aGliX3ym9yHKLUP6H6DnCW
         qMDh+/zPYP5RBzusyYXyDEcIFQkYXOJlFETSIb5ffhIJH+aOqj3iu66OtRFzhmBVLjHe
         DLX0wMk+j/2N911eMmkjOoBLgKHTBhqt/Co3RRmhmV72rotCx+JyJku+Wa4sQ6KTGBtO
         BANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315045; x=1716919845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=au6qYTdw+vOSxSNLYj/YJbyijCpp22cIgp0istqAo4Y=;
        b=uv5+m2/eUACP7M8HtJkORbrrog/7YMPn6atehLPagmiZ/rGhjm6EBVcGrC5fLVAHYT
         sevYtx/Sp6Kava1kC8jE0ENglLxx0wvt4FDhct86DqAT5voGKormlYiYpOl+/Xd/4HwC
         uMqPHGFjubIiYRTEl9oL9Djs/qR18Rw6i8UIEvkwk7sXhNYL/eSQ/OdgEjzYoP/VbFQM
         6cGwb9Xt1XPBenRG2tk9uc+6wIlbAAL2bz/awURsbMvX2/ijRPDXkO8uLmas1v9QH/gU
         b3t1nS0+VmiIvlNSOx11yarGv4LRjwUDgUwlcWkFiqq1E+so7T9E94BkQjut5NBhjF6I
         QSug==
X-Gm-Message-State: AOJu0YwuHhr+Fbici3TQfSeO+NH5E+eTR1/+P6yNARjuPZ3uojXzds9c
	B7DW6qLbqvfVBg05xSburalUC2c222xnoNhXr3DYEg8AZ7UL/NcxL5SdZpcrFUI=
X-Google-Smtp-Source: AGHT+IFIAp0yoxwX7+5LSMwoNpNX4USWwpdXAIfXMvc6pPYMYj1s7zCCPQZfcLjstBl3sQa5a7IaxQ==
X-Received: by 2002:a17:902:ec85:b0:1f3:f10:2c8d with SMTP id d9443c01a7336-1f30f102fb3mr25788775ad.65.1716315044840;
        Tue, 21 May 2024 11:10:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 19/22] etcd-cpp-apiv3: Fix build on musl + GCC14
Date: Tue, 21 May 2024 11:10:20 -0700
Message-ID: <20240521181024.426176-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110468

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-include-stdint.h-for-int64_t-types.patch | 27 +++++++++++++++++++
 .../etcd/etcd-cpp-apiv3_0.15.3.bb             |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-include-stdint.h-for-int64_t-types.patch

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-include-stdint.h-for-int64_t-types.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-include-stdint.h-for-int64_t-types.patch
new file mode 100644
index 0000000000..373e146b98
--- /dev/null
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-include-stdint.h-for-int64_t-types.patch
@@ -0,0 +1,27 @@
+From 44f4254fe96c43437400f94a8a2800175ddf3279 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 21:00:48 -0700
+Subject: [PATCH] include stdint.h for int64_t types
+
+This is exposed when compiling for musl platforms where this
+header is not included indirectly.
+
+Upstream-Status: Submitted [https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/pull/270]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Value.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Value.cpp b/src/Value.cpp
+index cbda697..d6f2c9c 100644
+--- a/src/Value.cpp
++++ b/src/Value.cpp
+@@ -1,4 +1,5 @@
+ #include <iomanip>
++#include <cstdint>
+ 
+ #include "etcd/Value.hpp"
+ #include "etcd/v3/KeyValue.hpp"
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
index 401d53c79c..2e149577dc 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eae7da6a2cd1788a5cf8a9f838cf6450"
 SRC_URI = " \
     git://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3.git;branch=master;protocol=https \
     file://0001-cmake-fix-when-cross-compiling.patch \
+    file://0001-include-stdint.h-for-int64_t-types.patch \
 "
 
 SRCREV = "e31ac4d4caa55fa662e207150ba40f8151b7ad96"
-- 
2.45.1


