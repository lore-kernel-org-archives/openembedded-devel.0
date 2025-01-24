Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9670C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 18:46:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.318.1737744396102006557
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 10:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kc+HQcIR;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436341f575fso26087075e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737744394; x=1738349194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKaObWZm8uDs9dO6y2CMKLPXNtBmPofZZ7CBaEh9ZEI=;
        b=Kc+HQcIRmfoAJ2XumPtzjxcmqwF+ZxittYbquUXkxtqLlCN8bLZMio5jqtZw7gngsY
         xsaM0J3v1MdOvHdl6Qd+8hQKwt8uWtrqEYduTtAdU1OQBTCKiZnS5y04tmf5u1pkNWup
         0YeN0+BNMyHM8bdjryn2VBmsEXp2rbeQA82jqnFM9bvvQbdT1UY0D6XQzah02h9UiCTA
         MOf6uKHXyYQqY2cADky6uXK2+qpfGl3ywVuVLRjpga0o1lpB144v0fTv6o75JFKBpaFO
         4LHnIn3PBa2pivBFAVDAbLNa2SMK/V3zo6OL9APDIjrexS6ObjM6o8+504bD6VYY2bfq
         y6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737744394; x=1738349194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKaObWZm8uDs9dO6y2CMKLPXNtBmPofZZ7CBaEh9ZEI=;
        b=lY1aaEbRXs7cybMdTZwBJ3RuV6GE4NawuVPTGnq95QPZSOWg6sUppJW1gh1bmE6NVC
         F0qzW/gWv/K4Te+FUD/hlgWy2gb0Zqp5oU479uImjChFFbCjgHkPDXqjuvweM1eR7ijG
         ciEk/i4JcvlxB2jDveFWZSFrFj1K8ZxB2vCm1hPzkQxrP2Lj+C2xydfnk10mYnbowsxS
         VE0SchSTThGsHlDfyBa9IgrWJz11yWa5AeLYE/hAIGFbmuyHxaVnTKrvwcGU903k2KmG
         kzUEOWxmDMtU7OXj4bcCoTKIGEIeBr8JFUa5gcI2G/UWs7blZuxTe+gRogwYW4UtQceV
         5OEA==
X-Gm-Message-State: AOJu0Yyb23vrM8zLcN5EYg2YI5ZFOVwE4BQTbus96fNLUyDsO9PyI2EY
	a6eWfqGlZmp659CIs3U1e+FowFhDdf5ulCB7zeeW3u6KvlakKhZDFqz5cQ==
X-Gm-Gg: ASbGncukqG4yNNTzEHlSlutyctO6/kOKat1HRhPMLpoaIg+zNonpGOrIuhsxp3cAWZP
	kdsK3nr0vPd2MMrZTggO6oRo7bdHeynQig89BOJ+6okHzdy3yzrlmRL0qkPF8+HMmEdaUKB5pzW
	leLk8x20ug8ojeAkgR5nroFvTyXLFRT7/IOIGIqOHKYitz7C1bk6e8MajpQfBv49bNVSZdSvvNz
	oBkoeopMZFP32aYseVxWwla2KyZm5HKqvdw/HjcA5/xcVeOidj0PKfSbIS7/k5XgtragReNWgep
	R+QCdYVf9blrIWId1Xa8/YPk1IDMeZ8=
X-Google-Smtp-Source: AGHT+IEOHaGpW7pL39SGBqcX4pISXt/ATWUOvHSt5ZgJiqQkrZQH/RBLgpCj0Wg1liezXIAaaNg5jQ==
X-Received: by 2002:a05:600c:1d20:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438913e1b1fmr355271255e9.11.1737744394268;
        Fri, 24 Jan 2025 10:46:34 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa46esm35676385e9.1.2025.01.24.10.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:46:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-ujson: correct license file and checksum
Date: Fri, 24 Jan 2025 19:46:28 +0100
Message-ID: <20250124184631.35956-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 18:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115069

The PKG-INFO line referenced in the LIC_FILES_CHKSUM variable
is outdated, and points to a non-license related detail.

Instead use LICENSE.txt to verify the license.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
index 48d51e6fb..9832a4fe4 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
 SRC_URI[sha256sum] = "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
 
-- 
2.48.1


