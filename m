Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52277C83F16
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:36 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.3028.1752082293865008198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WFx/pD3u;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553dceb342fso67896e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082292; x=1752687092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nAfYjSrSFmwuT1JheVI1SJZY6wRqr1atUwOW8IVZ8M=;
        b=WFx/pD3uSmqvAw57vuv1Uh0HYeC9izKh+qhxXg/P/LfinrVQfvu8dpCfUpKSHPGhBv
         5Bi2nawMho8XDEYaVnpF1p3KwHn3LSrMZ4BsDRKYhJwOjAn/zAsSDzWvWvtra5Zrogko
         mxKFyjpxKXfgXnYZOoRNzXbTZI4aF0GEdS41maTF1FhPWjYfZfSlGMV6HzdDtYiCl8tO
         jd13L01eHF7k4dQGnLSVSXyplfTap1G2en5jMDXiD91lB8HviW/kW2ABRHVuhCw6QcRT
         Ph8tuvfLAAqVfB90OM/IV18rKIUjVwlB/Uc7/ZdDeee3h5kXfnQH2V12pYL4PXy15uWe
         Wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082292; x=1752687092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nAfYjSrSFmwuT1JheVI1SJZY6wRqr1atUwOW8IVZ8M=;
        b=uQq9yxlLUodZh0/LMeJCfllG8kCG0P9uJMiSspKYEyl0AuR+fxuXTsG3Q6+u7Mj3JO
         qfzez0IfNfSuC2Vur+e/+Pn4mC2dOuhxZTlnKt67MMy6uwHHFYpuUs2fSCraACMS6yV6
         Dkg5ra8mFuabwAzhgO7Y4cVYHW6IJDeHvNm7wM80KSa7j2006833EXCiHR/+391kq9Rm
         lPRfitXecDek/buCttfKZAAtUmxf4JRorxhYB0uMCeJHaNR4fKurPQYYq8vqXpqu1mG6
         Fsn6cSpP02tHUM7ELnUPT10sR9nPauAkclo/SSiiXjZNbhfaBsF05Cg3RFusuReeh9Hv
         9OcQ==
X-Gm-Message-State: AOJu0YxIAzhq5oHiQC45+oNThQfBVnUodCIBOB1PanpuKDlpcg8Vvjxm
	DwZAFFsT0osltdscMOIjJl90wqeCPAkQoAYNutVRhaf1/x4EvfF0SjSRz2x8pw==
X-Gm-Gg: ASbGncvjB9ZTV96T66aWUpOvAwzJIWbIVXioiYbBDKTfYpB+1xoD7Tuayc9ksowDsND
	lsI6pA6VYjDwm/HQ8CbKM9o2urVcEwKhPTUbptMv1h0eEEMXM1zhlNVAg3JujxVzPXvc4T+ufyV
	a9scr3bhd+kvlYlf4lZY3TdVtvwTVHbm169CBd/0kPuKSExhlTdty4gPCJ6vPW9I6OpuJ8IuWwM
	jQCOmi0btqLFJUGcR6TfiFGs+bIfG3UlKSbH2tyeW8u6OdnOEgb95yfuT7auRhuNUap5z9b6Iv1
	niTMO/sa/XaZtaqTZGGUyyv925Lip1GhUGEyqv87TpFXV0JiJHSoHSnAGzqqDE+OaUCxMtAom2A
	hXfw=
X-Google-Smtp-Source: AGHT+IGJYRQs+OGel3XvNQcdAKg81X0Pp9KSjJB/2yu757mq8C4UxkCWbPKBoyedC5aF4p5d8H12TA==
X-Received: by 2002:a05:6512:6d5:b0:553:314e:8200 with SMTP id 2adb3069b0e04-558fa877c8dmr1286780e87.8.1752082291375;
        Wed, 09 Jul 2025 10:31:31 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:30 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 18/20] fatcat: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:52 +0300
Message-ID: <20250709173054.605430-18-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118372

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0003-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../recipes-utils/fatcat/fatcat_1.1.1.bb      |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/fatcat/fatcat/0003-allow-build-with-cmake-4.patch

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat/0003-allow-build-with-cmake-4.patch b/meta-filesystems/recipes-utils/fatcat/fatcat/0003-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..1baa9c7e87
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat/0003-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From a2a3d85d44fc27edfee5c4d9667b2c315dfacd23 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 19:38:06 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/Gregwar/fatcat/pull/46]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d6a2649..8f3eadc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(fatcat)
+ 
+ OPTION(DEFINE_WIN "Compiling windows" OFF)
+-- 
+2.43.0
+
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
index bdde0d311a..876e8618eb 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
@@ -11,9 +11,9 @@ SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https \
            file://0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch \
            file://0002-Enable-64bit-off_t.patch \
            file://0001-Replace-std-ptr_fun-for-c-17.patch \
+           file://0003-allow-build-with-cmake-4.patch \
            "
 
 SRCREV = "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
 
-
 inherit cmake
-- 
2.43.0


