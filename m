Return-Path: <abhilash.kollam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B341DC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 04:35:42 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.32711.1715920538112225111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 21:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iaus4E2u;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: abhilash.kollam@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b21e393debso639502eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 21:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715920537; x=1716525337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TcjDb3aE1Ftdmie7C0HU3ErsFqq6w264ahTWQ9u2/50=;
        b=Iaus4E2uGPxDGuRHfDbt25HKBoyKx0HUJigzui9SgAbia2cZfdV9raESavzxzSxCzc
         PfNCoZEPwAUidHTymvyIV9LViL5HwSN5Mh6g1lCzcGdIAIdTkY8ju1Ssrx0iDUhKhfBG
         6WQN6vqNbkVhEGLwcr8VabgjjgViKvq3XpycGRZR7GjgyoWZ+GNYAgNSMIP+uOeSMtWX
         +v+bvhk0ANIodqczb9mJ0spXN2l2+ElUjcGb3Y8MELkpmtp2KD+wV0j3DACo+F6OiedP
         n0Bs1Vg27M9SUnzy5BNsGA3TMG/r/zPxkSY+1/4nYPzyWIVfQrCHG1fKJzDF9MVxpJJ7
         10nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715920537; x=1716525337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcjDb3aE1Ftdmie7C0HU3ErsFqq6w264ahTWQ9u2/50=;
        b=vZxmO8d23twFu5Bkz+bWgV3TRDtsQJC1zQ8emu9dbAfCttUBsBgJHJkeBOTO6XRwgh
         QnU8cHPUSRGOryCAt99flJ1Er8/+zliTA17w6DYhYfJ5o2YCT/RaAoeNMMRFm+oQYWVa
         GIcrnwV4O0N/3WQE1M5rqSwZDQRyhcIVoQYaKMfETWnhnuk7oXYzyDrp2t/i4aEsFZNU
         ujjUZQwPhzwNujkqStma969J3l6uOe0cy7lNPjcwCu34gZTXyAPZjcmTQVccbag9DUMW
         kUU+GrBtdUm5U5GlHmLgY/Fuv13E4FjbmZGmST/5fe1+FAd/2+l0xRNfM7rdE5dYq/+S
         0l0g==
X-Gm-Message-State: AOJu0YzG5Gf4agx10n8dN9eYCd4K0ICqiDQvej3iX7hNeZ5pqEOUXLsS
	+26jiceWus62mmjjE/+KW98LVhypLK/zqO0TuXrLKgllK9Be3hqJa4SYSf9ZC0A=
X-Google-Smtp-Source: AGHT+IF9zTdd1gNy1quXm9x/EW2cGZJX/uBRRbzYQxjRwPtpbV10eSMcqN4Q+5MGASdc7mW+cP6EZw==
X-Received: by 2002:a05:6870:b14e:b0:23f:a83b:29c with SMTP id 586e51a60fabf-24172a22848mr24489289fac.11.1715920537000;
        Thu, 16 May 2024 21:35:37 -0700 (PDT)
Received: from gfwa129.aus.stglabs.ibm.com ([129.41.86.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2412acd6e14sm3883218fac.52.2024.05.16.21.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 21:35:36 -0700 (PDT)
From: Abhilash Raju <abhilash.kollam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhilash Raju <abhilash.kollam@gmail.com>
Subject: [meta-oe][PATCH v3
Date: Thu, 16 May 2024 23:35:32 -0500
Message-Id: <20240517043532.4070180-1-abhilash.kollam@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 04:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110418

An Observability framework to create and manage telemetry data such as
traces, metrics, and logs

Signed-off-by: Abhilash Raju <abhilash.kollam@gmail.com>
---
 .../opentelemetry/opentelemetry-cpp_1.15.0.bb | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
new file mode 100644
index 000000000..88033e58c
--- /dev/null
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Open Telemetry Library"
+DESCRIPTION = "An Observability framework to create and manage telemetry data \
+such as traces, metrics, and logs."
+HOMEPAGE = "https://github.com/open-telemetry/opentelemetry-cpp"
+SECTION = "libs"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+DEPENDS = "nlohmann-json"
+
+SRC_URI = "git://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;"
+SRCREV = "054b0dc207c1f58e290d78cdaac5f314bc328b31"
+
+S = "${WORKDIR}/git"
+inherit cmake pkgconfig lib_package
+
+PACKAGECONFIG ?= "opentelemety_install otlp_api"
+
+PACKAGECONFIG[opentelemety_install]="-DOPENTELEMETRY_INSTALL=ON,-DOPENTELEMETRY_INSTALL=OFF"
+PACKAGECONFIG[build_package]="-DBUILD_PACKAGE=ON,-DBUILD_PACKAGE=OFF"
+PACKAGECONFIG[otlp_api]="-DWITH_OTLP_API=ON,-DWITH_OTLP_API=OFF"
+PACKAGECONFIG[otlp_grpc]="-DWITH_OTLP_GRPC=ON,-DWITH_OTLP_GRPC=OFF"
+PACKAGECONFIG[otlp_http]="-DWITH_OTLP_HTTP=ON,-DWITH_OTLP_HTTP=OFF"
+PACKAGECONFIG[otlp_prometheus]="-DWITH_PROMETHEUS=ON,-DWITH_PROMETHEUS=OFF"
+PACKAGECONFIG[benchmark]="-DWITH_BENCHMARK=ON,-DWITH_BENCHMARK=OFF"
+PACKAGECONFIG[testing]="-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF"
-- 
2.40.1


