Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.1782.1614802630830136455
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 12:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CH/He1j5;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id t29so17071626pfg.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 12:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KUkT7mSf27ECBC3d6c2CjW8C8qMCaBdYO8dgx9KRX2Q=;
        b=CH/He1j5j/Bt/4w04MJwfuAZjzfb7VrIY3zVz+Wclrhv7ZFIWboqs1tqq6Opobf8ou
         Tg1lwUYxUwWSo/+mt3R/eC7jEIU6p6ZO1nn/NlxWlEsMmRHNiXVsZRfDI1pR0PtQgmWM
         WNxqOaFX+lWYTf5cAC55Hol7KLbRvJpQnWq4iUwZBQA1BKMCQI2b8nfVu4b/TxmaT0bY
         Pde6jno0dxXLoLIa0jIbPbqWvzzVSYl08dS7QEHEe7C5DK3On79KmF7ibD2gM7DQOwV2
         oEg/Fwb1n/DnTVjJgUhpk/YmnmdwRJJwEts3NAzZGl7BrF0hCcZxL52yg0NtkUSP+i8U
         HERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KUkT7mSf27ECBC3d6c2CjW8C8qMCaBdYO8dgx9KRX2Q=;
        b=kRdvbjSvw3QmhhQIFD4c9HRR/Plt+ws5MdFY2zd9hlt7jMVOdBdGsOVzYoh8JzdmQU
         egpqmT0kJmZAYjRegI9pTDZIMuaRpJCK6iqlHXfD9G/zW+LVlYgaA70tt/Yef+vSI+yk
         ZxvoSdkW1R3UWgKA9t1TjNtTj87XmsX4PwGTC3oqqprWTzIZyVy5o8FW/AfEQz3wUKqW
         YxjXzDo4j0AfAqRJIbjcLWM0Sf8v4jG4jwepHXeiipGn9XiJeBk6FCDBrcFedKS1UZs0
         96iUgAP05VpoIEGwtJu0XIzjSBDJSPth0tT/T0g9NqDsc72v09dn4gWtg93zZp9IuUul
         plGg==
X-Gm-Message-State: AOAM531B3eoaPAfHpZhjOf+Idm3Ee1hFb1GXeYgoErzvvJecyTuDUtK2
	p74FYT0+bRhzuJviGCtMCxXiSJJ71cTXAg==
X-Google-Smtp-Source: ABdhPJwEG/ifARZ5teIRTB8yh8+1T/Ugii8IjhHHk2l41bX/g89RQfy+F/aDZwU5VFux5bz1TooOnA==
X-Received: by 2002:a63:7885:: with SMTP id t127mr556323pgc.237.1614802629810;
        Wed, 03 Mar 2021 12:17:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id j35sm11116739pgj.45.2021.03.03.12.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 12:17:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [meta-oe][PATCH] opengl-es-cts: Disable -Wuninitialized for external/amber
Date: Wed,  3 Mar 2021 12:17:07 -0800
Message-Id: <20210303201707.2808412-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the code in verifier.cc needs to be ported to use enums or memcpy as it
violates aliasing rules. Until then disable the warning

HexFloat16ToFloat, HexFloat10ToFloat, HexFloat11ToFloat are the
functions to be reworked in external/amber/src/src/verifier.cc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...-not-error-on-uninitialized-warnings.patch | 28 +++++++++++++++++++
 .../vk-gl-cts/opengl-es-cts_3.2.6.1.bb        |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch
new file mode 100644
index 0000000000..4f3c7554cf
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch
@@ -0,0 +1,28 @@
+From f9906a3a1b7f1ade7a6c4e1a8aa67cb3a5e663a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Mar 2021 11:33:15 -0800
+Subject: [PATCH] Do not error on uninitialized warnings
+
+code in verifier.cc violates C/C++ aliasing rules so code should be
+perhaps changed to use a union
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ external/amber/src/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/external/amber/src/CMakeLists.txt b/external/amber/src/CMakeLists.txt
+index 80a0df7..4323c81 100644
+--- a/external/amber/src/CMakeLists.txt
++++ b/external/amber/src/CMakeLists.txt
+@@ -133,6 +133,7 @@ elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
+     -Werror
+     -Wextra
+     -Wno-unknown-pragmas
++    -Wno-error=uninitialized
+     -Wpedantic
+     -pedantic-errors)
+ elseif(MSVC)
+--
+2.30.1
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
index 801bd05c91..184547aa76 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
@@ -9,6 +9,8 @@ SRCREV_spirv-headers = "e4322e3be589e1ddd44afb20ea842a977c1319b8"
 SRCREV_spirv-tools = "1eb89172a82b436d8037e8a8c29c80f7e1f7df74"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
+SRC_URI += "file://0001-Do-not-error-on-uninitialized-warnings.patch"
+
 S = "${WORKDIR}/git"
 
 do_install() {
-- 
2.30.1

