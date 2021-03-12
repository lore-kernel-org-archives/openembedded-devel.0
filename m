Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.5280.1615535223486222812
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nelKVBXv;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so10371914pjc.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 23:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tok0f7ck3mrqUAeCjh12Wnv9lo1vR6fXy78l3Gsh9Jw=;
        b=nelKVBXvyHlmUVvfP/OHyy1EGGRKx7rstih70532j1Ge6SNdjZTqmE7mxrb32G6vqM
         Jaln0VlgFJzupPabcHIUJDG4mIpeulRijJjEXXQWGpY2j+VR0IvQ0o/nSN90miNB/HhV
         rj9TvVh7AcrOBzB7kzxCJFdb/IpD0Ge2E9GBg58lUHM8f5U4knC9a8njSBx+SqsI6BtD
         YX3UE1G8i6Dl8tjf1nenIWbITxxpqDtmIZxrVwZ4h1Inw0VUtaHO9dWDYK84JBNb8gf1
         6nCEYVf4RDvZ2rFgxYLouOtfeqep3XqQGuJAXWS0tCU7nARcrAbpWzfXUs+ykHXw7NFc
         Nudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tok0f7ck3mrqUAeCjh12Wnv9lo1vR6fXy78l3Gsh9Jw=;
        b=iSXTmygyJu7k8N4TEyz+c86uz35+/btjCnw3R17VPjzZcKfWQSfdYQHaV+6YtU1KQP
         7UroB9Qu2JkCXqyd3Dary+FYTTy2Oef5yz9bLVKDrEDXbEVEq/8ZH6/bzr9o9NCKoAJY
         STRGQ9d2KhGG1ppWrIITtkDXqcjAM+8uUdp4WPRkOtmAHKJXlGUIlb3Uu4TNxIGqzo18
         4yuOf/G3BSzqM1f05E6F/0yRkmKZv8cPB0JGEx5s7ET2hrqFrDvh9hZq+0uxUEaGKFwC
         5hhubfakk1l9YeXMBTTxPSRWICjQ2kLK9jt9EN2Plk/EZemYSdYTYbbUS/hzACNVoEh8
         72Dg==
X-Gm-Message-State: AOAM532Cn0krmNemQh/r8Kf8bZwmJyC5DMxAhQKXCE0x8F/aRxd6JVC1
	4b6wMvx/37IstpQNUxegMaFXXNHWFu34OA==
X-Google-Smtp-Source: ABdhPJwT1ts1VLd/3WLsueWEB3zs8RqLK93fAfJLsHrqXT8CGDGJuOvvthO1T5yE0pNwcJiOWVMutw==
X-Received: by 2002:a17:902:8501:b029:e2:d953:212c with SMTP id bj1-20020a1709028501b02900e2d953212cmr12188667plb.49.1615535222428;
        Thu, 11 Mar 2021 23:47:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id l20sm4810716pfd.82.2021.03.11.23.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 23:47:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] openh264: Disable building for ppc64le
Date: Thu, 11 Mar 2021 23:46:59 -0800
Message-Id: <20210312074700.1984018-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needs porting to ppc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb    | 1 +
 .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
index 3988cfff86..75d5010f18 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
@@ -23,6 +23,7 @@ COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_mips = "(.*)"
 COMPATIBLE_MACHINE_mips64 = "(.*)"
+COMPATIBLE_MACHINE_powerpc64le = "null"
 
 EXTRA_OEMAKE_armv7a = "ARCH=arm"
 EXTRA_OEMAKE_armv7ve = "ARCH=arm"
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 78c7c06b22..c4be1b5ce9 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -74,6 +74,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "x265", "", d)} \
 "
 RDEPENDS_packagegroup-meta-multimedia_remove_libc-musl = "projucer"
+RDEPENDS_packagegroup-meta-multimedia_remove_powerpc64le = "openh264"
 
 RDEPENDS_packagegroup-meta-multimedia-connectivity = "\
     gssdp \
-- 
2.30.2

