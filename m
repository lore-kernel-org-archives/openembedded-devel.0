Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.19825.1586101788916489070
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 08:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vdLOJbVU;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id k18so4902208pll.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKIHhmtmcXXlpYrXqa3TeESFb0wFgH+IUkxb2RfhV2s=;
        b=vdLOJbVUclKas37o7dwLHQIHT+hZlm1t0f1QF1xUb0zYEhx8Eqnmnrxlxv6FOk5dm6
         SuJprO4mhjRhWbMfdJbA88FX2HH7MLs/ohE5T9PrKsppY7nljWa5263OhTo36mJI8SV+
         yBidFxbyfetYIiOtQFYWivLOk4qJOWrDY9lKopTEMUlyleQ+QLauhLpel6zZFJCfnFo/
         ShUlZ1wnXIKFCjSYIJzemZz1bHZcXuAijMJh9YAcf0g2MyYeOijcS+B0zUBIiH+xnKk1
         u1qZbOZjUIptZFgx/HNRtlELQeKHRW1fmUHapNJwNaFUpLIxzb8wGubfZc2HWAhPpQ3K
         f4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKIHhmtmcXXlpYrXqa3TeESFb0wFgH+IUkxb2RfhV2s=;
        b=lYug5Z+ebyHtwpLtsKmkYOz2jfdL8o3SDX3cF8SKMG/akNk6jQ5zRQ3r5E2E02Y51C
         VkDZrK8R0yDde8u0q+YEbj1T0rJII0RXDphpPPutuO9LRDHnS7z5tK8Xr8fWA0Ba+3ZL
         w4lfX7bEn4BJXsyLSh+3g68sq23DYJk9S2lm1SbS5ddil9Hmg1qvNDByRdyKHSAWX0OM
         PVWZmkZ05hGst2ERP3MJWyn6xlpC+Mk0vW/McxoaRGVWhnOSOfaHehgDT0kdPXCIidpB
         pBlzRYwkqxfQy/3fwyrBjV2WDCzZ3tdBmvyD+T6tInzakZmLBvWkIG7m3WTjzAhjM95n
         JbGw==
X-Gm-Message-State: AGi0PuZtfVewSZSjQhYoPh8wYGrkStFh3e6Qt1is/dRJZA/VddfiCBy5
	IjCX/kM633JKToT+yjUtE+TVIi9qpNI=
X-Google-Smtp-Source: APiQypLzHh7kSXANq9za5RYcQfT0RgQg4VPSn+VmAUeNUaF1TBHDhdEWnZa1iohbsPUA/52LZ5Q19g==
X-Received: by 2002:a17:902:b281:: with SMTP id u1mr16755487plr.287.1586101787869;
        Sun, 05 Apr 2020 08:49:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id k14sm9692933pfg.15.2020.04.05.08.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 08:49:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] upm: Drop gcc-only warnings
Date: Sun,  5 Apr 2020 08:49:58 -0700
Message-Id: <20200405155001.1816150-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps in compiling upm with clang, in followup patch
we wll disabled Werror too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...isable-using-Wno-maybe-uninitialized.patch | 37 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-using-Wno-maybe-uninitialized.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-using-Wno-maybe-uninitialized.patch b/meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-using-Wno-maybe-uninitialized.patch
new file mode 100644
index 0000000000..2f581855f5
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-using-Wno-maybe-uninitialized.patch
@@ -0,0 +1,37 @@
+From 169f62770f63a43b15d4d4c82336fd57c8467cfe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 4 Apr 2020 21:43:51 -0700
+Subject: [PATCH] cmake: Disable using -Wno-maybe-uninitialized
+
+This warning causes clang builds to fail because this is not a
+recognised warning with clang
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -6,7 +6,6 @@
+ set (SWIG_CXX_DISABLE_WARNINGS -Wno-error
+                                -Wno-delete-non-virtual-dtor
+                                -Wno-unused-function
+-                               -Wno-maybe-uninitialized
+                                -Wno-strict-aliasing)
+ 
+ # If building under android, make sure swig gets an ANDROID flag
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -115,8 +115,7 @@ endif (WERROR)
+ upm_add_compile_flags(C ${C_CXX_WARNING_FLAGS}
+   -Winit-self
+   -Wimplicit
+-  -Wsign-compare
+-  -Wmissing-parameter-type)
++  -Wsign-compare)
+ 
+ # Set CXX compiler warning flags at top-level scope and emit a warning about
+ # unsupported flags
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index c851c93bc4..3ab6bbb6ba 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http \
            file://0001-Use-stdint-types.patch \
            file://0001-initialize-local-variables-before-use.patch \
            file://0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch \
+           file://0001-cmake-Disable-using-Wno-maybe-uninitialized.patch \
            "
 
 SRC_URI_append_toolchain-clang_x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
-- 
2.26.0

