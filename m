Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F5CC433FE
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 06:52:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.41068.1635749553954017802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 23:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fhxpuyc8;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id gn3so11524427pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 23:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j8UMvUDbexuIOK6JBqyrX+prYWL/DaFJ9j0mug+5OmI=;
        b=fhxpuyc8Qjq1dyDt5T/6k13wv3S+5K8GDkeTbaZFKWKSeWbM1Tvl0mE8bK4QHiEybN
         poZC/uf5m32+9St3oWaRc3T54/XgH1/GJ9TnkL8WI/F3bZ2O4xEBbAwTC59pxAUaG/X6
         mQjAmktSNcPDVrac6gowpyUlKsm82xfnAu+YRzuNTxnaBS3N3EMiv7zOtBwWIVUw+LIP
         QbKncAX9dwSQSQshdz5tfq5mBFM59z2Dm0cAApx/2GKHNbMObaxDQX0KSnt4J8/X1fWZ
         J9BDYigh5oCoZDHVWE+oyNEsKL1fJyERuwp+ZVytUF9z8U2WRf5rwXgzqyA1o//frIcw
         YCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j8UMvUDbexuIOK6JBqyrX+prYWL/DaFJ9j0mug+5OmI=;
        b=XBNJMBomPufGBL5xKhifHAk8rGQkHe1dwDBATkrOn70ML9umeMslZ4C3JqfEvP/TKI
         EW7ZsSSZhiSPPFR+JLiMZC8iczAKQiUVFK1YXWUzuvHqV3kAWQcYpIBLvp1FVqTYu297
         7pHTlmMNiiqF14JjihVtJUn7KehBd2n+woHKqZNSJQBGTIHeqohUlCZdHjolWkuCL5++
         CQ/rclethdn6QFoo8exwP7j6GlGNT8COLiCALFj7O4hNkQQ8kNiXoX8XUWyOloHy0D0Q
         0bd00uTxk/sG90IZU8b2S2rUtrv36Hf10verwL6wfSbhkb7gtwZQYakI2vjx9DWE621i
         hndA==
X-Gm-Message-State: AOAM533xfB+ySCXpAYJx77KmlORpVvobN6hTcnvYjOPlVAUtXodNasBd
	YqD3/1cdR5wOtW2xiHRS6LIvCWZUbP4=
X-Google-Smtp-Source: 
 ABdhPJzqyBct6gd6REBntF0PYOWEiirmZb8/qFoVItz3XZBob+3DIZvA6bGHeSWVa/zNrbu1ILGTvw==
X-Received: by 2002:a17:902:70c9:b0:140:5ca3:e67a with SMTP id
 l9-20020a17090270c900b001405ca3e67amr23670220plt.29.1635749553090;
        Sun, 31 Oct 2021 23:52:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 l21sm14558506pfu.213.2021.10.31.23.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 23:52:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] protobuf: Disable tailcall on mips/clang
Date: Sun, 31 Oct 2021 23:52:26 -0700
Message-Id: <20211101065228.1430262-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101065228.1430262-1-raj.khem@gmail.com>
References: <20211101065228.1430262-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 06:52:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93689

Clang13 crashes and lets workaround it for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-on-mips-clang.patch        | 32 +++++++++++++++++++
 .../protobuf/protobuf_3.19.1.bb               |  3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
new file mode 100644
index 0000000000..8a0696edfe
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
@@ -0,0 +1,32 @@
+From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Oct 2021 23:39:44 -0700
+Subject: [PATCH] Fix build on mips/clang
+
+clang13 crashes on mips, until its fixed upstream disable tailcall on
+mips
+
+https://bugs.llvm.org/show_bug.cgi?id=52367
+
+Upstream-Status: Inappropriate [Clang workaround]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/google/protobuf/port_def.inc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port_def.inc
+index 71325c387..303475232 100644
+--- a/src/google/protobuf/port_def.inc
++++ b/src/google/protobuf/port_def.inc
+@@ -230,7 +230,7 @@
+ #error PROTOBUF_TAILCALL was previously defined
+ #endif
+ #if __has_cpp_attribute(clang::musttail) && \
+-  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__)
++  !defined(__arm__) && !defined(_ARCH_PPC) && !defined(__wasm__) && !defined(__mips__)
+ #  ifndef PROTO2_OPENSOURCE
+ // Compilation fails on ARM32: b/195943306
+ // Compilation fails on powerpc64le: b/187985113
+-- 
+2.33.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
index 9b8c396045..93daa1804e 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
@@ -19,6 +19,9 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-Fix-linking-error-with-ld-gold.patch \
            "
+SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
+SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
+
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig ptest
-- 
2.33.1


