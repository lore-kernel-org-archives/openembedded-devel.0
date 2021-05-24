Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.25622.1621872530848167828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 09:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MpS46Psj;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id df21so32637820edb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qNcz/zqLB83YxHPr6NgPa6JTVC3M5x+IQBlZslckZz4=;
        b=MpS46Psjt9PnhaY0Qe5Htx7b+sKCluhq2/sW5NpAnjhpzydjFrprrh4FI0KP5n/Q/b
         3UxZTjlFdsK33G06OrlGWPPU/k8ZOhd8S34Kqx//4eYAAMfC4kDq5ZofEbtJZFZgwur9
         XgZbwUn+qhkPHmXf3OaCjxivWvNe8Ayq2IeE00mQijnJaMb1Zjru9Q/6WUcsB7gorafa
         mjr1nFk6/KPmCOmGZo/KyM13qSc9dTIE5W0rmyfD1gmFB+ttYV2W9Q8ab+M/pmwDasQK
         AfPV8rgMfDlVtHA0pEI3KE7Qrnf5GRE6gdh3m7K9wTP3wCpf/0CMVH/tPYHBpfqIAWoz
         N79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qNcz/zqLB83YxHPr6NgPa6JTVC3M5x+IQBlZslckZz4=;
        b=NLuGHFMeyygGSzHxUvA81K6BA47uHgHy3LBlKb4Q01ninT6iEPCFRGVWi5xo8z4ZNw
         V71tXIETeVu3OHw0CEeflpwyFJS9RhE6Xh+8C4thLkqzi+q3ZeX+LHDa9lsZpeeevT0w
         JDb46z4MKpAboH0d1KIk2MIgc60XqLi9yhPPhasurEIH9kpnGpHIrO4bfF8683sSCR66
         ImeOBDFh+MqUCNjrxldPWr5Yz5g1PP5/vgl2ykDfaGEIcAOBMwtKq2AxIad/9dEgg+bN
         gcetfqYHNmKuwyE5Ant9JDWFmssVpDvzpUDVTgIpnyX2bCd7E9TcNixZhXpWPUAiKq8v
         WdkQ==
X-Gm-Message-State: AOAM5314bNPIVqK532HsyisR5F+anwCjonwclUjLmLqxIAjE/uf6AH52
	edJAmhbCN16u5w9RWxIwrHPph2auG5o=
X-Google-Smtp-Source: ABdhPJwnuEqkYr2535+QUitzRnWdY7J02g4CaP6xCexkRnUPb27yA5QIZ/TF+TUxqxzSCdgS7gKMJA==
X-Received: by 2002:a05:6402:1719:: with SMTP id y25mr26699677edu.304.1621872529499;
        Mon, 24 May 2021 09:08:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b189e31b9623dc41a84.dip0.t-ipconnect.de. [2003:f0:7f1a:3b18:9e31:b962:3dc4:1a84])
        by smtp.gmail.com with ESMTPSA id k22sm7953470eja.33.2021.05.24.09.08.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:08:49 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] renderdoc: upgrade 1.7 -> 1.13
Date: Mon, 24 May 2021 18:08:39 +0200
Message-Id: <20210524160840.194431-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524160840.194431-1-schnitzeltony@gmail.com>
References: <20210524160840.194431-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* backported patch can go
* license checksum was changed by update of copyright year

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-glslang-pool_allocator-setAllocator.patch | 31 -------------------
 .../{renderdoc_1.7.bb => renderdoc_1.13.bb}   | 10 +++---
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.7.bb => renderdoc_1.13.bb} (72%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch b/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch
deleted file mode 100644
index 6ba1e4268..000000000
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-Remove-glslang-pool_allocator-setAllocator.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 49dd914109fd1ee9e1e917890bf18f85dd95ff31 Mon Sep 17 00:00:00 2001
-From: Reid Kleckner <rnk@google.com>
-Date: Sun, 29 Dec 2019 23:17:16 -0800
-Subject: [PATCH] Remove glslang::pool_allocator::setAllocator
-
-TPoolAllocator is not copy assignable, so this setter could never have
-been used. After a recent change (878a24ee2), new versions of Clang
-reject this code outright.
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/0de87ee9a5bf5d094a3faa1a71fd9080e80b6be0]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h b/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h
-index 0e237a6a2..b8eccb883 100644
---- a/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h
-+++ b/renderdoc/3rdparty/glslang/glslang/Include/PoolAlloc.h
-@@ -304,7 +304,6 @@ public:
-     size_type max_size() const { return static_cast<size_type>(-1) / sizeof(T); }
-     size_type max_size(int size) const { return static_cast<size_type>(-1) / size; }
- 
--    void setAllocator(TPoolAllocator* a) { allocator = *a; }
-     TPoolAllocator& getAllocator() const { return allocator; }
- 
- protected:
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.7.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
similarity index 72%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.7.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
index 6ea632d06..fa74fb39e 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.7.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
@@ -2,12 +2,12 @@ SUMMARY = "RenderDoc recipe providing renderdoccmd"
 DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
 HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=df7ea9e196efc7014c124747a0ef9772"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5486c0df458c74c85828e0cdbffd499e"
 
-SRCREV = "a56af589d94dc851809fd5344d0ae441da70c1f2"
-SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x \
-	   file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
-	   file://0001-Remove-glslang-pool_allocator-setAllocator.patch \
+SRCREV = "cc05b288b6d1660ab04c6cf01173f1bb62e6f5dd"
+SRC_URI = " \
+    git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x \
+    file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.31.1

