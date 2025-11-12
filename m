Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB08CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 10:05:05 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10050.1762941898389896449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 02:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I5GJ2RbH;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso371565f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 02:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762941896; x=1763546696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzmVBd94yQSJti8SDcl8a8CFiU9wieDpevKmKWqsxGk=;
        b=I5GJ2RbHIYzCSGApfzdUpSDzB9fbwxUCoxCWDoacb9yZC6zynRWV/a2g1WZjFQDb7y
         2WlV8BxFV7mND+g5l/Uutzc6GMxJlT6kRkD9+YnMRmpU8L0gMoILhvNwmYox+JKGsneR
         B/NFaEM/kSH8r+F3CF2pc8JhKs5bxap6noF9TsLyOnNStZh+qrtayLJLqPJp5EQKZFv2
         Oo7k4Jgcn988YpOaF6eD7DV1WTTHLPnc1/CmxRVZxwCWYhK3FUe2vhFr41mPLDhtRJMM
         An8iuJlnQcXTXetTM/kXcxqiaKOmXAptwZlYKE0u5Pm+wVhkrTDxGmMZ/ysNrm6O10Hb
         UoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941896; x=1763546696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BzmVBd94yQSJti8SDcl8a8CFiU9wieDpevKmKWqsxGk=;
        b=ArOhE7pbe1lDnbVlzCsR3PQOYcc202rms9og2VUkk+4ANTSAreauCXKWVBeXLw1RhI
         699R5IMYnFD+iZB0TPNvMM5/JR6X4KLxvSw76JEIVpPQ9c2Bso1t5vu5SnvBO+PVlES8
         AhbTcY4080qkBpJiGLMJBfIfUeWsAv5ly24xuwUIVwoe8+egC3lhD/naXwPw5O/qlpCc
         G9QOG/gv7gepXT2Fy+O5G6nakDXKTpFFJ8XS2BwsexvLcBqHwfhMmy8L5h9vQ8tbxjAV
         TUOFcX6loR+ZSZSWspWpQdrD++rzs/N7Ai0LXA9B1dT6VKH/vnt6uvHSDMcPsBjbNn+n
         pObw==
X-Gm-Message-State: AOJu0YyLkPkwDxp9wF+Eq2qjiIt3KiuPogR1pq61C3cVxPEX58NLuPHw
	vvGsRD1cxn8qbJ5PlbWAtdwo/vlmu8yaoJpkUoHg0C+eppUTgoQk0lcctynVcg==
X-Gm-Gg: ASbGncsrAfaY+9ypltssKW/9v7hrkF5unRS9fog6K6+70WnswyydzUWESeMbIR0Yh3S
	DGfxvA/axlq+yCDpJBHPjEBi/t9j+Q9pnD2eQh8bHvmknnhDtx5b2yEzxq4qb386xKj0I8yEiAw
	StxfCN1FYHuea5nGxExyc1m2slkzVb05SNVIJOBhFmG474Q3wkS8RMIYmGwxPGmCa9wRjdl7IhA
	F6M9HzPxnb6Fv1c5SzoRCQe//wgE0hwd9+hTpSZ5exQp9cFkhC23CFUUpiv8bc1QLbG8j6zPWuV
	DbkcUrfC+F6beA0lqhcFHadUhT76pg5p0COhznaa4ESzi2Jm7hItLO67TD2eIKWjHP4jj8yHHEy
	Q1sVzQns/rwC9Fy5P5zQxBgate9HoGTTB1vb4TVu8etuB94Zedp41oO2Nq6vkrio9qZmKArAVOZ
	iZd/IOuKwMWfXGA306wkkoBg==
X-Google-Smtp-Source: AGHT+IETrnOvOYtJ1Q0AXvkoB/+hlZRpl4L2EkBA20K8kPJZ2AugON1VyGwR6OWdkz053TdWl/XwNQ==
X-Received: by 2002:a05:6000:1acf:b0:42b:3ee9:4771 with SMTP id ffacd0b85a97d-42b4bb9c65dmr2145324f8f.23.1762941896290;
        Wed, 12 Nov 2025 02:04:56 -0800 (PST)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm37276170f8f.44.2025.11.12.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:04:56 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 2/2] python3-nanobind: Fix build
Date: Wed, 12 Nov 2025 11:04:54 +0100
Message-ID: <20251112100454.589682-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112100454.589682-1-zboszor@gmail.com>
References: <20251112100454.589682-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 10:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121529

Fix the order of inherited classes, so the nanobuild python module
actually gets built.

Also, put the cmake files into the correct location, i.e.
  ${libdir}/cmake/nanobind
instead of
  ${base_libdir}/cmake/python3-nanobind

onnx 1.20.0rc1 uses nanobind and during its build it detects the
presence of the python module, and wants to use the nanobind cmake
module, both of which fail.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-devtools/python/python3-nanobind_2.9.2.bb      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
index 85105fd196..cfbe9cea66 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
@@ -6,19 +6,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
 SRC_URI[sha256sum] = "e7608472de99d375759814cab3e2c94aba3f9ec80e62cfef8ced495ca5c27d6e"
 
-inherit pypi python_setuptools_build_meta cmake lib_package
+inherit pypi cmake python_setuptools_build_meta
 
 EXTRA_OECMAKE += "-DNB_TEST=OFF"
 
 DEPENDS += "\
+    python3-cmake-native \
     python3-scikit-build-native \
     python3-scikit-build-core-native \
     ninja-native \
 "
 
 do_install:append() {
-    install -d ${D}${base_libdir}/cmake/${PN}
-    install -m 0644 ${S}/cmake/* ${D}${base_libdir}/cmake/${PN}/
+    install -d ${D}${libdir}/cmake/${PYPI_PACKAGE}
+    install -m 0644 ${S}/cmake/* ${D}${libdir}/cmake/${PYPI_PACKAGE}/
 }
 
 FILES:${PN} += "${prefix_native}/* ${prefix_native}/${PN}/* ${base_libdir}/cmake/*"
-- 
2.51.1


