Return-Path: <abhilash.kollam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F3AC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 05:20:10 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.7359.1715750409529585241
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 22:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BcZHDCik;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: abhilash.kollam@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c9b94951cfso528368b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 22:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715750408; x=1716355208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEl4NxG/f1qN58yLu8GWIalhO6BniAruFV9EyLSR2hA=;
        b=BcZHDCikqihr7UnkMVLLudd4YM8LBm8asKCaXOf1GvcqQK6ZpIYeGuboh/yqdDI5Jk
         ty4Chotm3mzPoA/Y87REFkfSwCMUO/pTRhm8HqGnWhWk8xtsSEmaptUKCBazvPYQ54G0
         br200F94A4RLMYKIqBFQN+uaYkVtCJcYiQBWjRPwUscilVro46GPhIblPFZKYhoYaGyQ
         6ELxsPJ0CB6GSt7hatC7ggamuyYk8bcD4sDHGi3Jy5O2ugeRK9xVFAiSOyEn04CWVYPJ
         xL1MLZcWvSEHOq4D5dxShDSHI7lHIKEcGD5jPZGXCOdSd6VbEGXarUaRc/qHWDaEx3yT
         u90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715750408; x=1716355208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEl4NxG/f1qN58yLu8GWIalhO6BniAruFV9EyLSR2hA=;
        b=Q93UEkDFXzkZ5m9aL/zUFMUpkKBABuxAvxcRsUsivYSoo72p3Yi3ePath2RQJUpO9q
         x5rM74FPkEbKm/ijo41uhhsMzfRFDKHAQsrkhO1wxHJlLDfGOk9itBLv+ue8DEEVuRpY
         SjD7pHnBJQb38rHuSDy524ScT6GmyH8LJyUXoc7W1p3+RvE5/tDIJFYDYWXCkxMpDCxo
         FNRWkaRdmjyhbDzW+HPkxbcV3iJgi6RClxGtrc5K77xxpQi7oE+V8dG4NUsVNonoxwC7
         Q4B/MVsIVscW4SOWPocJ/dOlpWjzkRdM3F/LGIORpISRtmyQ/dRyPq07nQu5okZVv6V0
         D++g==
X-Gm-Message-State: AOJu0YzTkgy+7PDxZp6H3cvXaTAi+wQq1bVQbz04UUex4rSWJdirNaX/
	8Ub/pGnw6zeAm4PAWDEDOourqDHjci5XZR30pvsxTuFLwhsGpSusePW/PyCvn1M=
X-Google-Smtp-Source: AGHT+IEJLTVqcW/YIm9tObIr8czlbP4b+X8noRv6IoIny26924SisOCT56nFTLUlPmlTStICA7uJbA==
X-Received: by 2002:aca:f13:0:b0:3c9:70ea:b5b7 with SMTP id 5614622812f47-3c99704cf96mr17378368b6e.19.1715750407047;
        Tue, 14 May 2024 22:20:07 -0700 (PDT)
Received: from gfwa129.aus.stglabs.ibm.com ([129.41.86.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3c992d8a3d2sm1957391b6e.22.2024.05.14.22.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 22:20:06 -0700 (PDT)
From: Abhilash Raju <abhilash.kollam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhilash Raju <abhilash.kollam@gmail.com>
Subject: [PATCH] opentelemetry-cpp: add opentelemtry recipe
Date: Wed, 15 May 2024 00:20:02 -0500
Message-Id: <20240515052002.3843823-1-abhilash.kollam@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 05:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110401

An Observability framework to create and manage telemetry data such as
traces, metrics, and logs

Signed-off-by: Abhilash Raju <abhilash.kollam@gmail.com>
---
 .../opentelemetry/opentelemetry-cpp_1.15.0.bb   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
new file mode 100644
index 000000000..85df5be82
--- /dev/null
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.15.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Open Telemetry Library"
+DESCRIPTION = "An Observability framework to create and manage telemetry data \
+such as traces, metrics, and logs."
+HOMEPAGE = "https://github.com/open-telemetry/opentelemetry-cpp"
+SECTION = "libs"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+DEPENDS = "nlohmann-json"
+
+SRC_URI = "https://github.com/open-telemetry/opentelemetry-cpp/archive/refs/tags/v${PV}.tar.gz"
+SRC_URI[sha256sum] = "69b0fef380658e15be9d817bfcb32e3f5de96da652bcdce77b4e750ed8beddee"
+
+S = "${WORKDIR}/opentelemetry-cpp-${PV}"
+
+inherit cmake pkgconfig lib_package
+EXTRA_OECMAKE = "-DOPENTELEMETRY_INSTALL=ON -DBUILD_PACKAGE=OFF -DWITH_OTLP_API=ON -DWITH_OTLP_GRPC=OFF -DWITH_OTLP_HTTP=OFF -DWITH_PROMETHEUS=OFF -DWITH_BENCHMARK=OFF -DBUILD_TESTING=OFF"
-- 
2.40.1


