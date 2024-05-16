Return-Path: <abhilash.kollam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95920C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 06:26:55 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.6728.1715840798453553561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 May 2024 23:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VC/JenTA;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: abhilash.kollam@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f12eb91ec7so42972a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 23:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715840797; x=1716445597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bq98J4W0SEU9CuZqPOc3khR9aL18/jQ6XKMFAKSKej4=;
        b=VC/JenTAjt+FbVvk06MA7e9mJeINzpsV7GDcSslYIByL1nA4HNNIl4jddHZddTeabf
         VqUwbNRzx7YgimK+zmbl/tqbA+800d6Xco9onzHxIGvMsTvr2KylDw1KI2HG2KFRjW5S
         DYq4tjO+pv4UB5bak5p6EfP2BFRQC2WqlH2ItZX89blsmUKMlSSw+nnYTRRSzugjVFtD
         iYzQGzhi4YSnR6YQtkO7c+SqxchzpoWFn2Q+RTc5uG/3wgY78FcAKe2U4ZaBJ4bJAnYv
         /coZAU3N/IVFTnoY2xaDRToRtRlJzfde5O93kS8jEJ26bkqFQvqEBzDwl70Hc/i4HYtU
         hq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715840797; x=1716445597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq98J4W0SEU9CuZqPOc3khR9aL18/jQ6XKMFAKSKej4=;
        b=HOUo0NObJhWWOIYru7p0gs4fak8/XlUk2y01PGG7xC0i6gaxMhc9NG3a0F3N5U9OLc
         Lt8YduzqKbLnjTJjxUJFzOBCOdCNK20b/9j2jbz4LDXpVHiR2WldHcijqMCXVsTgg9Ix
         W1GotXqY8zzpBFs6sDZX/u/NeUODy5109oKIRClcba1ck7oaWo+IqpTM3qI/yIGnJkFz
         cxqAZd2FIClSkhDFyb4K3fYI/LCh2xULBbwJvID9Mlx1d6b7p6QmPFVxyxby9Nv+FNZp
         tkfy6vDl9D5Q7JPIoeukTuqUQ3m16plthbRA9HEbuRk84dOuo+iNWPK44Rn5eR88pk9V
         4/Tw==
X-Gm-Message-State: AOJu0YwOiukNEoEeWGzRigaUUT5V7SMvQvWIVZO1iPrkh2H67u1nBGZO
	nTmQ0js7WEKZptxdI6BVOJI1WGRpX6KTee8kEAV/RC2yTwCWjFZ4AB6dLA==
X-Google-Smtp-Source: AGHT+IHU/Qv+Jf1SV+g3Epk8YPt9l5zbG+eakIy43raNujzGeKmyzAN8MX05jKpkWIxjxtOg9itzOw==
X-Received: by 2002:a9d:7ac7:0:b0:6f1:32:c929 with SMTP id 46e09a7af769-6f10032da02mr12517299a34.36.1715840797474;
        Wed, 15 May 2024 23:26:37 -0700 (PDT)
Received: from gfwa129.aus.stglabs.ibm.com ([129.41.86.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0e4d0193csm2470450a34.78.2024.05.15.23.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 23:26:36 -0700 (PDT)
From: Abhilash Raju <abhilash.kollam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhilash Raju <abhilash.kollam@gmail.com>
Subject: [[meta-oe][PATCH v2]] opentelemetry-cpp: add opentelemtry recipe
Date: Thu, 16 May 2024 01:26:31 -0500
Message-Id: <20240516062631.3994402-1-abhilash.kollam@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 06:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110410

An Observability framework to create and manage telemetry data such as
traces, metrics, and logs

Signed-off-by: Abhilash Raju <abhilash.kollam@gmail.com>
---
 .../opentelemetry/opentelemetry-cpp_1.15.0.bb | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
new file mode 100644
index 000000000..bb2b09e5a
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
+SRC_URI[sha256sum] = "69b0fef380658e15be9d817bfcb32e3f5de96da652bcdce77b4e750ed8beddee"
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


