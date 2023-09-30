Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F28E748EE
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 22:14:36 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.49904.1696112071215037759
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 15:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AX/x9nvZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1dd54aca17cso5380393fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696112070; x=1696716870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A0IAGarwcIZEzxAEC5fV9x5rjGDdpI2IBa9LBPqI9s=;
        b=AX/x9nvZEyTSykPTNjkryQ7rX5Bej8IDSQO95hrIIq8gmij/bCPCgMzJbMvlq1gHOY
         HnCHmIN2K4rJcMgKkpPMIKsd99b7Ca4/xk7Q1OuQB1TLvDId2iNlue2J0m09uYGX9adU
         qKQHpVHSHYoyhHxQM/2lL+7LJqIJ0ym4lqGBHxRu8xfkLgF7XqINuj7kPxsHLhYBycgi
         wj0e8i7GAeNofA5ZGJ7zMWWubmmScd8S0VdoNvBNMySwe8um0ZaI174CFwryP4sIp6Gr
         w7w9+uVz0Yg4O9Sq4AOQQvV+Mov+51JVrALBnRXACANChbIyuBdrNcJw522J5SyJECZh
         HTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696112070; x=1696716870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8A0IAGarwcIZEzxAEC5fV9x5rjGDdpI2IBa9LBPqI9s=;
        b=fpFjBaAG1dd5MPO7/mn2dyXLltfhqb6yppEjzJU+V77M1zLAL8b2qmOE9q+OcDyiKM
         jaIvnSXuPss3hl5m7M2qRIXO9CGqvVt7QOTqQ1NwvGAPeRZenXNaBg8UZAN9NFCNbyw1
         2gEi14fHOnEI6C5XSKCc4XHGF45BU7Xacb4RARDU2xKoymBOTVXulSKdWLKg7LPpDCkG
         Kj1xXEarn5bI5s70KuUwO3WP+WmMbufHmiLf8PvIuX70zVaGT/g1TK7xwUY9ZurBaH8m
         T2WxfS9/25iwpzTnrULs7G0455mDInYpi74H8jqlEbVihq4IwzWZfNmYaMhbWPzNToK0
         96Eg==
X-Gm-Message-State: AOJu0YzEU25baTQsXPaAVDJn7AzJOIwBWunyu854MAHLqFRzNOAegJD4
	3VCF0uSsO93zraisqBzk3kbT7vsEQX0pKA==
X-Google-Smtp-Source: AGHT+IG7w2TnE15ADggSKnoGLpkaEdJAEStNUOHNNICEE9pYsga6VW4otr4OKvLz3I5pjxm4h4OUDw==
X-Received: by 2002:a05:6870:8287:b0:1dc:a055:8587 with SMTP id q7-20020a056870828700b001dca0558587mr9634365oae.6.1696112070245;
        Sat, 30 Sep 2023 15:14:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id v1-20020a62a501000000b0068be4ce33easm8469411pfm.96.2023.09.30.15.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 15:14:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] webkitgtk3: Do not use musttail with clang on arm
Date: Sat, 30 Sep 2023 15:14:26 -0700
Message-ID: <20230930221426.347516-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230930221426.347516-1-raj.khem@gmail.com>
References: <20230930221426.347516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 22:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105286

Fixes
https://github.com/llvm/llvm-project/issues/67767

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk3/no-musttail-arm.patch          | 21 +++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.42.0.bb            |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
new file mode 100644
index 0000000000..c660baa1f7
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
@@ -0,0 +1,21 @@
+clang/arm: Do not use MUST_TAIL_CALL
+
+This causes clang-17 to crash see [1]
+this code is new in webkit 2.42[2] thats why we do not see the crash in older webkit
+
+[1] https://github.com/llvm/llvm-project/issues/67767
+[2] https://github.com/WebKit/WebKit/commit/4d816460b765acd8aef90ab474615850b91ecc35
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WTF/wtf/Compiler.h
++++ b/Source/WTF/wtf/Compiler.h
+@@ -284,7 +284,7 @@
+ /* MUST_TAIL_CALL */
+ 
+ #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
+-#if __has_cpp_attribute(clang::musttail)
++#if __has_cpp_attribute(clang::musttail) && !defined(__arm__)
+ #define MUST_TAIL_CALL [[clang::musttail]]
+ #endif
+ #endif
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
index 8962dbfe7d..f682cd9f03 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
+           file://no-musttail-arm.patch \
            "
 SRC_URI[sha256sum] = "828f95935861fae583fb8f2ae58cf64c63c178ae2b7c2d6f73070813ad64ed1b"
 
-- 
2.42.0


