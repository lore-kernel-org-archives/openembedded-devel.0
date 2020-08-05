Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.5663.1596629142593580058
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2020 05:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dcP4mTU6;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: jonatan.p@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id i10so12602663ljn.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2020 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NFUarfG+aRgvzZBgc/4bQGLUyRtwVpXYHQwT/ASEwz8=;
        b=dcP4mTU6BNS1VfhVJ6BwmYNCAIKx4oxtkqK2qd2IGYVKkgXdnlpLk3qVFMgsFttKLm
         UWP8D5kHeAzvc8cGqcsoOR7U11nvFeD+GxvA8Mt7EXn6dOC+V7u4jW/KkkKc0hsVxHzJ
         Y11yeQ9RTEKhUrd+FXHU6a5Wo0bwZ7VPKcjmbAmTVDFnF6Z8xExkIwxwazEbVaYu7Q8G
         wSb+ATLxO9hVrqJ16kSjQeAc6GLGGEnC8PKOac14FnxMaxHxx0WFz78NFuJ7630pP/Lv
         wN2MW53/eHBn25sMJW/RFEibm2Sg3AojbdlGoHMsqotLbiKqrrP6v2JTU9w7NJpAGCyN
         CSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NFUarfG+aRgvzZBgc/4bQGLUyRtwVpXYHQwT/ASEwz8=;
        b=ipBeuOQwlJJF4JMjWe/5bxRkSE6dwECPmKg9nZXxN9vazJE3CVDGr3x4/Z3hxHVtZE
         UzqBC2WDNsG3pcsrq0aAgDoAwy/2l6CSHvZHD0aKCVPUJB6rE10lQdYASHYe7OvtZRhr
         YB+GNo0kEWMTOBHaN1TYQGBmJa6CjDRKXhbAxu05/l+1ZvCPurw2S8YQv6YyXe2TTIzq
         HV22B9nyhTLMWiRNPa1IdKq3zLAQpJ/ZJ/cLRAXFGyNq4D9QkVsEaEt74mF0/jooEWHI
         HMl/E0UHYB0qgSOdghbLDFHYkayeRQfS6A8xAIbBoKItuSMGIYxdJz+ubpkNilGPUg6q
         znig==
X-Gm-Message-State: AOAM530TvSujKqC4JP5NNI1gLfQ8foltDxELzKzuT6iCgmyNP3eOjdYl
	IelfRLLsg6lS2z+4tl47lo9pvhO6
X-Google-Smtp-Source: ABdhPJzyUSXlFP69wi5OK4OOYzofoblIfLC9vFyk1OcWivIBs69D59hAwJ+kWUwfzD8jkOwVo21pDw==
X-Received: by 2002:a05:651c:1344:: with SMTP id j4mr1389386ljb.164.1596629139899;
        Wed, 05 Aug 2020 05:05:39 -0700 (PDT)
Return-Path: <jonatan.p@gmail.com>
Received: from X1.lan (h-170-217-237.A357.priv.bahnhof.se. [81.170.217.237])
        by smtp.gmail.com with ESMTPSA id a19sm1038557lff.25.2020.08.05.05.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 05:05:39 -0700 (PDT)
From: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.p@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jonatan=20P=C3=A5lsson?= <jonatan.p@gmail.com>
Subject: [PATCH] openjdk-8: Convert do_unpack postfunc to _append
Date: Wed,  5 Aug 2020 14:05:26 +0200
Message-Id: <20200805120526.2162683-1-jonatan.p@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

archiver.bbclass will invoke do_unpack as a function (rather than a
task) during do_unpack_and_patch. When invoked as a function, the
postfuncs of do_unpack are not executed.

Convert the postfuncs into an _append fragment on do_unpack instead.

Fixes:

    .. snip ..
    No file to patch.  Skipping patch.
    1 out of 1 hunk ignored
    Patch 1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch does not apply (enforce with -f)
    ERROR: Logfile of failure stored in: .. snip .. /build/tmp/work/x86_64-linux/openjdk-8-native/252-r0/temp/log.do_unpack_and_patch.220625
    ERROR: Task (.. snip .. /sources/openembedded-core/meta-java/recipes-core/openjdk/openjdk-8-native_252.bb:do_unpack_and_patch) failed with exit code '1'
---
 recipes-core/openjdk/openjdk-8-common.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index c78bb2a..123e896 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -46,6 +46,13 @@ do_unpack_delete_X11_wrappers() {
     find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name '*.java' -delete
 }
 
+do_unpack_append() {
+    bb.build.exec_func('do_unpack_extract_submodules', d)
+
+    if not bb.utils.filter('PACKAGECONFIG', 'x11', d):
+        bb.build.exec_func('do_unpack_delete_X11_wrappers', d)
+}
+
 def package_config_option_cleanup(d):
     distro_x11 = bb.utils.contains('DISTRO_FEATURES', 'x11', True, False, d)
     distro_alsa = bb.utils.contains('DISTRO_FEATURES', 'alsa', True, False, d)
@@ -155,9 +162,6 @@ def jdk_configure_options(d):
     options = package_config_option_cleanup(d)
     return options[3]
 
-do_unpack[postfuncs] += "do_unpack_extract_submodules"
-do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
-
 export DEBUG_BINARIES = "true"
 
 ALTERNATIVE_PRIORITY = "50"
-- 
2.26.1

