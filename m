Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AF5D75E5D
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 19:18:34 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.53845.1732389509490401522
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 11:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OD6b8XqK;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2126408cf52so27135335ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732389508; x=1732994308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr/atLM5IMuGzgNCPpGBX8IS+FE9fyeASvkcHtlC3hA=;
        b=OD6b8XqKdboGixCZzYFVRm7WfwwH/dydac01fRC5yNy2fuR8aomkXUP5pxDsQWBA8V
         OFRZO40y2BcFm8Z0F9juTKXTqlqzgtuC3Mzd+VqHfXxnW7LNEF3RCjIhZT/J70WDNYvN
         7hoFx0lsKUHicO9E99hhAJgtiYG4ki5UHr7E6WahN+Y9pvD53POqBV06Vgc2S3uWh7yd
         V+VA4543YcfLfa4hUnSrrVRuxNyHTa08+auiiSHKfD1S7kqCVo0jEoCbZ/zDIQFYCeHl
         ZiycD8GudSSZdyz0PO5vOQJggStb9mfWhZjb0IZES7/K6unhtbBXklIfN4ALaePcOM3Q
         /hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732389508; x=1732994308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr/atLM5IMuGzgNCPpGBX8IS+FE9fyeASvkcHtlC3hA=;
        b=bzRHxsWLqhsb9muJmgsfYtC3M2Rj1GLHX6CROfJwk0svI62ugEhLtg49fZLFJuS2dm
         sY2aNYtg8p6RGIbpT5wK1suftcjxSPBv6/XdBbxsttXg4VjKHz3pO+91gQ1yF5vmk/d3
         3Jivv1hEtSMNobYxybN2cIQDeZoHlBjr6srxRqsB19qNHtzHrzmgtW5sRurCITwKwhbv
         YB2pMc4HTb+seojSrcFcOC3w0S4ah6HVGCgip9sNBeRUPC0Ar5kgY22w8VHXacMFXRtq
         1fOmv+6jFETCC9VFGCkhMyFmMjc1r8eZDqF7PdLeEMsep71O6UrN/bgdjxL+5pIM4r1v
         3M6A==
X-Gm-Message-State: AOJu0Yzzr3bhtvEoTI3UOyxC10agS41J3PE/hcDZKJMBi4cnDcjRSiSq
	kuwRfw8bqEzmfwa4w3YcAhDURr/5T0w6UZBe3S8JEgUyjCxyn+YRlJG+Kw==
X-Gm-Gg: ASbGncttQXK0/YWPz00yfHGoLwM+ki4GX7PuUvZtp54t7VTn3E/urkfuESyCmWNncSP
	VHffGSYARisqUwOm5JolmBQ6KjTu639uzcckjKc1uYKXCTqtZfOWgcsjSW4cHp86BdyjkH6tyem
	2MVLnWHLelVqD1lNDtwP+tNV110Xyv4meS0p+u14AgLq2IVW+kLpyPqNh93d6gU5VxxKtybKHx5
	j7e9b83RqA3lB+dXW/z+4T9t8y2Yfg/EBZTYUB+uqs6DzS3y2U=
X-Google-Smtp-Source: AGHT+IFNSuqb4zbl8W1XhAyCREQ3uXNmCnHVAOqn/P3Gy+yeDtEVo2QoAqynpzKTMEKOL4jEDy4i7g==
X-Received: by 2002:a17:902:e751:b0:20c:70ab:b9c3 with SMTP id d9443c01a7336-2129f6ffdd5mr95689455ad.34.1732389508522;
        Sat, 23 Nov 2024 11:18:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c9d8sm35961345ad.48.2024.11.23.11.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:18:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] webkitgtk3: Fix build with ICU-76+
Date: Sat, 23 Nov 2024 11:18:25 -0800
Message-ID: <20241123191825.656582-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241123191825.656582-1-raj.khem@gmail.com>
References: <20241123191825.656582-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 19:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114020

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Support-ICU-76.1-build.patch         | 36 +++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.44.3.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch
new file mode 100644
index 0000000000..31535e7ae2
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch
@@ -0,0 +1,36 @@
+From 57b80aa00be614218552fda67b2bf8d535b4f4cf Mon Sep 17 00:00:00 2001
+From: Jason Schonberg <schonm@gmail.com>
+Date: Wed, 20 Nov 2024 11:05:52 -0500
+Subject: [PATCH]  Support ICU 76.1 build
+
+https://bugs.webkit.org/show_bug.cgi?id=282120
+
+Reviewed by Yusuke Suzuki.
+
+In ICU 76.1 an additional macro `U_SHOW_CPLUSPLUS_HEADER_API` was added to
+control visibility of the C++ API within ICU. Set this value to `0` since WebKit
+wants to only use the C API.
+
+* Source/WTF/wtf/Platform.h:
+
+Canonical link: https://commits.webkit.org/285727@main
+
+Upstream-Status: Backport [ from webkitgtk-2.47.1 https://github.com/WebKit/WebKit/commit/63f7badbada070ebaadd318b2801818ecf7e7ea0 ]
+
+Signed-off-by: Jason Schonberg <schonm@gmail.com>
+---
+ Source/WTF/wtf/Platform.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 23070df2..51a8dce9 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -115,6 +115,7 @@
+ /* ICU configuration. Some of these match ICU defaults on some platforms, but we would like them consistently set everywhere we build WebKit. */
+ #define U_HIDE_DEPRECATED_API 1
+ #define U_SHOW_CPLUSPLUS_API 0
++#define U_SHOW_CPLUSPLUS_HEADER_API 0
+ #ifdef __cplusplus
+ #define UCHAR_TYPE char16_t
+ #endif
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 01eefe13de..3eaade5399 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            file://0001-Fix-build-issues-with-latest-Clang.patch \
            file://fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch \
+           file://0001-Support-ICU-76.1-build.patch \
            "
 SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 

