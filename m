Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8CFC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:42:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.1627.1737747764150098660
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 11:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j989lMLh;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1555639f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 11:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737747762; x=1738352562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCNuhmZU1vvhv1VB5rXfLGzQPN8Wvmr5tDm/WGQw6gs=;
        b=j989lMLhrxyUJxIvVDhSKT4dViYd1BB+2ZQC2aTHOTahcVAjhjwcYdpzsXYJf6bX+Q
         QwsMP2JqPNkN6Cu8BlT0dhAo+St+fHL4wlzk+67J43/gFjzT9xwxO4qf+chPauX4BYn8
         kB4XGR8E03vodzsoq8bccpkilbDMwIHkkuR2ZA+y2N0bnnu7BgxSC6EPZqqlKO7Jwb5k
         UK6ObJFumayEhOrgTQb0rhlEJO1X8UzwdqtmFC9uevWHGi/9B8+4yCEicL25CFMBKU7f
         ss8d84aeXvFYBWyUatWltwDT8IZh85pn6yahcHR7fvwTOP5Sn72iu+qsNWHi+GGo+e1k
         dUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747762; x=1738352562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCNuhmZU1vvhv1VB5rXfLGzQPN8Wvmr5tDm/WGQw6gs=;
        b=bkduO4yCFMD9zwv4Zrfkrw3AbIhes2AIZNaasZpmY1uCNkKxAGgodY3QMo+pla9y1O
         eKOiBW1Es+0ZbwyRqaaEPjKNOflsZOUD5eYOjSfLXJDFai4MPy0Ubmt0GKN3b7u/KeT9
         YnQrJqWGfsehLISQiihXPtbJv4KCEPjiOOELJ9+ZYvfyufC1DQ8p9vnobsGLXEqxofww
         LTEqs2LpmTwSzVBqZpWe0t8WXMGDEGti8x2rbBYlTQLMLAqPQ6x2bUgh29horb1z7AEg
         lC7XKKHFVS5+EaUds1Oc4FnAz/xqmuA1tzq7XplMat+YRrVM7pUt48uM6txFkowmQ+/E
         lMsg==
X-Gm-Message-State: AOJu0YyM4Gv4O9LpnJj/S60hIR/pBxvNaFbwmumEZbm3AY9hhzYfo166
	8Kpv+nlI0RCY+y4WFGM+Vw4gf0pefF0cfYpNxU2cCdTpNZrLYVPDopye5Q==
X-Gm-Gg: ASbGncuPR7B94MUFbTvA7dNORxPlYThQ2sikHKbf0B7V8dyxso6e9NBFOXy4e+icJsz
	aMSYHizG22hUCX0NsGfqBzlob4ekVTmsPa/ZJhlDl9Mqr2UTHzPzNkAPbcasu9DnEWG+tDzovab
	ixjNFdCtPxRh3AFRVMFBR+ZGo/G/d8FJBJx9G1OQ5G9pB8XUIpQJPJEMaWnYf0hk5D1S5o+ftZb
	Q8RGjWw27ThSLttZl0UXLGIQpEbziKkghEdQ/VALiGabNWUZ8wG/Fmr0Bi5o/2Lil8i67e2fC8r
	ISdZEm98wOYpSBLkifFA
X-Google-Smtp-Source: AGHT+IFPVO29cWHcTbxFPb0iww/rHp2Z/mem5IwG8goSvlP4iTchBd+x5CQ/sXtSNE4lXSMjhojI9A==
X-Received: by 2002:adf:f250:0:b0:38a:5dc4:6dcd with SMTP id ffacd0b85a97d-38c22279dafmr7413715f8f.22.1737747762425;
        Fri, 24 Jan 2025 11:42:42 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4199sm3475096f8f.89.2025.01.24.11.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 11:42:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH] opentelemetry-cpp: fix non-default PACKAGECONFIG options
Date: Fri, 24 Jan 2025 20:42:36 +0100
Message-ID: <20250124194236.56533-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 19:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115074

1. Delete the build_package PACKAGECONFIG - it is used to build a deb/rpm package,
which is handled by Yocto.
2. Add the required build time dependencies for the other PACKAGECONFIG options,
as many of them were broken, and the build failed when they were enabled. (otlp_grpc,
otlp_http, otlp_prometheus, testing).
3. Switch to gitsm:// protocol in SRC_URI, as some of the PACKAGECONFIG options
do use some of the submodules included in the main repository.
4. Add EXTRA_OECMAKE arguments: OTELCPP_VERSIONED_LIBS and BUILD_SHARED_LIBS are
required to generated versioned libraries, and avoid triggering the dev-elf qa check
with the PACKAGECONFIG options that generate a SO file.
PROTOBUF_PROTOC_EXECUTABLE is used by otlp_grpc and otlp_http PACKAGECONFIGs only,
however this long option makes PACKAGECONFIG very hard to read - so added here.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../opentelemetry/opentelemetry-cpp_1.17.0.bb | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
index 04e43d99c..50e6bbeba 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS = "nlohmann-json"
 
-SRC_URI = "git://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main \
+SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main \
            file://0001-Fix-build-with-clang-19.patch"
 SRCREV = "fa0a5200ddbe9ae6f487a228e658aedc102dab56"
 
@@ -17,13 +17,18 @@ inherit cmake pkgconfig lib_package
 
 LDFLAGS:append:riscv32 = " -latomic"
 
-PACKAGECONFIG ?= "opentelemety_install otlp_api"
 
-PACKAGECONFIG[opentelemety_install]="-DOPENTELEMETRY_INSTALL=ON,-DOPENTELEMETRY_INSTALL=OFF"
-PACKAGECONFIG[build_package]="-DBUILD_PACKAGE=ON,-DBUILD_PACKAGE=OFF"
-PACKAGECONFIG[otlp_api]="-DWITH_OTLP_API=ON,-DWITH_OTLP_API=OFF"
-PACKAGECONFIG[otlp_grpc]="-DWITH_OTLP_GRPC=ON,-DWITH_OTLP_GRPC=OFF"
-PACKAGECONFIG[otlp_http]="-DWITH_OTLP_HTTP=ON,-DWITH_OTLP_HTTP=OFF"
-PACKAGECONFIG[otlp_prometheus]="-DWITH_PROMETHEUS=ON,-DWITH_PROMETHEUS=OFF"
-PACKAGECONFIG[benchmark]="-DWITH_BENCHMARK=ON,-DWITH_BENCHMARK=OFF"
-PACKAGECONFIG[testing]="-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF"
+EXTRA_OECMAKE:append = " -DPROTOBUF_PROTOC_EXECUTABLE=${RECIPE_SYSROOT_NATIVE}${bindir}/protoc \
+                         -DOTELCPP_VERSIONED_LIBS=ON \
+                         -DBUILD_SHARED_LIBS=ON "
+
+PACKAGECONFIG ?= "opentelemetry_install otlp_api"
+
+PACKAGECONFIG[opentelemetry_install]="-DOPENTELEMETRY_INSTALL=ON, -DOPENTELEMETRY_INSTALL=OFF"
+PACKAGECONFIG[otlp_api]="-DWITH_OTLP_API=ON, -DWITH_OTLP_API=OFF"
+PACKAGECONFIG[otlp_grpc]="-DWITH_OTLP_GRPC=ON -DWITH_ABSEIL=ON, -DWITH_OTLP_GRPC=OFF, grpc grpc-native protobuf-native"
+PACKAGECONFIG[otlp_http]="-DWITH_OTLP_HTTP=ON -DWITH_ABSEIL=ON, -DWITH_OTLP_HTTP=OFF, protobuf protobuf-native curl"
+PACKAGECONFIG[otlp_prometheus]="-DWITH_PROMETHEUS=ON -DUSE_THIRDPARTY_LIBRARIES=OFF, \
+                                -DWITH_PROMETHEUS=OFF, civetweb curl"
+PACKAGECONFIG[benchmark]="-DWITH_BENCHMARK=ON, -DWITH_BENCHMARK=OFF"
+PACKAGECONFIG[testing]="-DBUILD_TESTING=ON, -DBUILD_TESTING=OFF, gtest"
-- 
2.48.1


