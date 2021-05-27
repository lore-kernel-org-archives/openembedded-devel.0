Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.9400.1622132867126265357
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 09:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X3uu48Aa;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id y15so952466pfn.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGFs2afwWokeuXVbghr6iI8lDIJVOPsb5A+ks8tQOvI=;
        b=X3uu48Aalap2mJuwxvxAyORM6BatZ+upGGoLvu4onAlLpAFL2aZJaSHiBFJBA5glRX
         HK5ckQ2XvStn8COehs6GoEoHMhn/GH7xde3BuUB227qu0F3pLde63jonk++h9PMOzw+d
         osqFoVJtvRjFqTdO/RreNQgsyCBSD7+pz/9UvZ4vr/nk3yhA9OwYA4fF6s3SnXMFr8SD
         6wvtC2oESDRSrFpanOeqda0um+H0iF0SQgDSSBuE849Copky1G2LY3R93vslIgaeWAWp
         9HFR+WSFOp9T4imeO41MrjIs5pd+Pg8i2t+s+6q0JfxYisAVpEAg3K3FIwfv9in4mvNL
         bJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGFs2afwWokeuXVbghr6iI8lDIJVOPsb5A+ks8tQOvI=;
        b=hPom9dk7eZ7OLjd/ALRc/lV2rApf7yKJGu905sZLZxp+5kfcVXIgpIYxCFLblzFeJd
         SmW3TV+gXyaKiqm5PoEtxMlcjO39fEMPQc0UkYGR3jz8qyfNJql/Ly/eiyEW5l7eRzZY
         miJqxPet9GieG9+CCMjjkv0TdzsFI1HBvzWwVop7WYir6wkabUZW7YM61FkjchW6YVh3
         fbGdYiOH7WnRuodrJeIHc2y212BOzGPN3VrI8sj054mL1QpLO/BLlzPiYye+F1CHUg7Q
         QP/3JLtCLWnEyoAYLyPnKObMdROu0NIJz+ikmuaqHHsd7yDPguxN/kJTUz6tNSXBbQ9o
         0JDQ==
X-Gm-Message-State: AOAM531RdZYW41uxzxqvMVJyu4qtJ5/yXZ1nBSH/sRyGxHwvpwbfLGNg
	RInmY5Xb0E2qB0Mi0XAehpgwozXa95Lvdw==
X-Google-Smtp-Source: ABdhPJyaTRaFgYRXWuptl8xVKhafwXvB87Q/ZB5cs28LA62eyyXYge+oGQx5JxUnVtfaiNVGstLgHA==
X-Received: by 2002:aa7:9316:0:b029:2e9:4972:3fab with SMTP id 22-20020aa793160000b02902e949723fabmr2378351pfj.76.1622132866143;
        Thu, 27 May 2021 09:27:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id u6sm2148210pjx.21.2021.05.27.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 09:27:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix build error found by clang
Date: Thu, 27 May 2021 09:27:43 -0700
Message-Id: <20210527162743.670535-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ession-language-Fix-build-with-clang.patch | 42 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-extensions-expression-language-Fix-build-with-clang.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-extensions-expression-language-Fix-build-with-clang.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-extensions-expression-language-Fix-build-with-clang.patch
new file mode 100644
index 0000000000..2e917f0308
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-extensions-expression-language-Fix-build-with-clang.patch
@@ -0,0 +1,42 @@
+From fb6b36d8315032ca78ab6f55ef59d35131083989 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 27 May 2021 09:01:17 -0700
+Subject: [PATCH] extensions/expression-language: Fix build with clang
+
+Define long long version of explic Value conversion function
+
+Fixes
+
+Expression.cpp:632:10: error: ambiguous conversion for
+ functional-style cast from 'std::chrono::duration<long long, std::ratio<1, 1000
+>>::rep' (aka 'long long') to 'org::apache::nifi::minifi::expression::Value'
+  return Value(std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono
+::system_clock::now().time_since_epoch()).count());
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extensions/expression-language/common/Value.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/extensions/expression-language/common/Value.h b/extensions/expression-language/common/Value.h
+index 1666637d..e7c2c7a1 100644
+--- a/extensions/expression-language/common/Value.h
++++ b/extensions/expression-language/common/Value.h
+@@ -71,6 +71,12 @@ class Value {
+     setSignedLong(val);
+   }
+ 
++  /**
++   * Construct a signed long long value
++   */
++  explicit Value(long long val) {
++    setSignedLong(val);
++  }
+   /**
+    * Construct a long double value
+    */
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 322b58477d..62d935eb56 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
             file://0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch \
             file://0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch \
             file://0001-cxxopts-Add-limits-header.patch \
+            file://0001-extensions-expression-language-Fix-build-with-clang.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
-- 
2.31.1

