Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D550CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 09:52:35 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9881.1762941146082544430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 01:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZCWZ2oM;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c8632fcbso402778f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 01:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762941144; x=1763545944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dTqqCGmHc4Q7BP6RWFcbNDTpV1nG61ajZg2qB7QTkU=;
        b=TZCWZ2oM8sQbAAMLnw/E2A+w94lUPusc6o5GBMj2rhVHBdJgmUUrGYRfVuWvAxLAbm
         ZcLAv6FxPhII7WhfLUFipCJKQw1PkwRTiv/UW8S4mt+/rgU3wmG9K3VuYPqY49HMy1ji
         xAoWexYhN2TC56GYyF8ZABqkrFPhl4iZR/AOkO4eb61jL0m33a8TXrvj1hP2PeqCbYVE
         CoktimEVBRUJ9ktoT6GSvxHz6QgMXSL9VXhLsmJRriPiRxnIc1K/+UigSw/lS/aIqMd/
         +Gpm2IirazAXxiuTk91KcrNW89NOofNcF8HhAp4rqpsOP2cJZeSnPKrFCvX/UHELxzfm
         uO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941144; x=1763545944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dTqqCGmHc4Q7BP6RWFcbNDTpV1nG61ajZg2qB7QTkU=;
        b=HryfcyiNGCJPCo3ksK7vzntEX2okAD03LuqMerViF9ARkHiNWbq5zN2lmy2hoZUyC1
         PPyraI2m2dmBSC8rzPy/SzTSGYxho8dd5PIsL+7mLzPeS5pzfXlMWJ8RDuuvThefS0GK
         tDoXqf/pUzFPG1l1JQ7MDK16GA/axk+6LjIf42kkgUrY3EvNJKVdcdAZFSb9G/XCTvTg
         eLQQ2yEV3TiWgMAht9RAX8YanPQeglczjXo9TEbFbdOd+Dc6xc0mJ62M9qDZABenXAqP
         /jhhXc0WbIIZU9u8SoDRdf0dwhVLb0VL5E7HjeJHURMkGmSLYnsITJ8BsEbDVRF7jwd7
         gIkA==
X-Gm-Message-State: AOJu0Yz0S0vuSW4/OOgySQ54tPLX1pAFV8xwE5uS3GCEcew65MHruSSl
	VTlsk28X1718P1k9KWs/99CQ0iKt95amgHsZR03DFoOmbK2/TDJGZVDNTS9XXg==
X-Gm-Gg: ASbGncvtGnjfLe6o2kW7N+sYu8cnpHQZpQl4WgCfII4VgNc6bGg15PeCvjGl2cGBJ1t
	k2UOXDlo8NzfgVZGadBuZ+/7uos7HIhn22B8LVd0pOIHNBCJ3Ck/6/X0Ue5Sk15jdfKqzOANRu8
	m895MiN2dNs6OsUTs/GmvWGZWtiB3OkQ9T4jCm1UB+bErqK7wGxwM7mIrWByuHm8ZhojZDhafNE
	+T6tYp6AlnUmfR5KmQFmAmavraVVdy59kxpxbQGc3k0F2wfKNwir6Uy4yP81vbQqIRzwLlIeMko
	xG6jU+Hvfwd+wRb9CLnwuVWwt5eTdnvvkTLTKngdGhLE9Ez0gbW8HzoFLpptG96hWsBlmlBtt/Z
	YHnP0iq/rkUiRmTJ1rEB6nORdCCMZ9uT9Ku3N/C58kBjdWUhRF0qKAqwCzajAz4OYlV+0Xuh98u
	rpQrHWpMq0HwWdhQYRUvEmjeTZEVdFDrvD
X-Google-Smtp-Source: AGHT+IELw97IuLV4IUPobSFhoRl36g/52DBQfkF2S1yxl32/ZjCSXXHgWIrtQ/F30oRG8e718q9bQA==
X-Received: by 2002:a05:6000:2003:b0:42b:3b55:8927 with SMTP id ffacd0b85a97d-42b4bb935camr1886986f8f.21.1762941144107;
        Wed, 12 Nov 2025 01:52:24 -0800 (PST)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63ba87sm33892185f8f.14.2025.11.12.01.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 01:52:23 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-nanobind: Fix build
Date: Wed, 12 Nov 2025 10:52:21 +0100
Message-ID: <20251112095221.587048-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112095221.587048-1-zboszor@gmail.com>
References: <20251112095221.587048-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 09:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121527

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
 .../recipes-devtools/python/python3-nanobind_2.9.2.bb     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
index 85105fd196..a70ad2ae18 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.9.2.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
 SRC_URI[sha256sum] = "e7608472de99d375759814cab3e2c94aba3f9ec80e62cfef8ced495ca5c27d6e"
 
-inherit pypi python_setuptools_build_meta cmake lib_package
+DEPENDS = "python3-cmake-native"
+
+inherit pypi cmake python_setuptools_build_meta
 
 EXTRA_OECMAKE += "-DNB_TEST=OFF"
 
@@ -17,8 +19,8 @@ DEPENDS += "\
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


