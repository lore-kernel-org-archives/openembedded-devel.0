Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410A7C4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18682.1784626291755626104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ajCz0HUM;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f785467faso1278660f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784626290; x=1785231090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXdN/T4vMSEEJrx+CK88slykIOb7DJqQsuB/9WGc4f8=;
        b=ajCz0HUMVGQkjgqRluRE34VlrFVh/HKjp4GIBSeJWJbRZUz4xsDv8vrmIS2lCsjGo4
         /NdSGtwUs40XrrXAw7lBF4PzfjCtqtRTfmAtbtsq0ZSc5GARHrXi+/u6fuVq6O40mDMO
         35DZ01top5Zl4/B2k5tUfKNHOw2js8nAsUpqxH3O6o6vfBJr0Dox+8I7Pz7Og2kZDpO/
         NJGbQOZmA5e1L0bMK1al/lINYTvNeipsrFLeZAunS7Ush3v45sn3cjRDGDlqV301h/DK
         Febd+SvjjiO3m4v28CVmYN3xDhk78S1oH/WeoZwCkuYW3rIMJv9tLQs1VqiN0eAHjyRm
         3BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626290; x=1785231090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXdN/T4vMSEEJrx+CK88slykIOb7DJqQsuB/9WGc4f8=;
        b=HRUHO5imQkN/Y0lyjgotLT5jl/ZI1DvFPXojL6rbSbDehzZ00OsKCa3Ixq8xCJAbkU
         kOjvqN9gM6FVUaMKBi2IP3sokm2J5U4OGGW1hS6cnI0U4difuCNt5B0g0pdFqOvC/NyN
         /5mR2YP+f2+dGeftfGw9AnQ0C7uJYartwkR4nPAhiC6sVINkSD3O89nozv9K2x2TJgzA
         NqdUQXUmmjHm6TD31aju0IZSZ555zrFFPjHWSEktNhprpNQJXRtNA+Bo75w3EwJqsuYN
         gIzBDhN6NERVlGwYvP5ZW5OaoRVFS3N+BQXke5re0OhOW3nqa27pdw88gYv4UhStNbKd
         0HdA==
X-Gm-Message-State: AOJu0YwlBH/H8rLb0V9lCfZ3CtFcrp42JMNceijCWl8XG4tJocdmpMzx
	SzJi8zgTel2X7CxVwCqmTDdaDhGtUjTdJ9Dd2KdiSE1/nfskp082lzJtPTB2Qgt4
X-Gm-Gg: AR+sD10p8h8bwGcnVG/Q1E/1r1UwQ0n2+V3PZZpdYt5YfvyhLyw7AdXykDAUcPIWyVh
	vlDQbm2pGhdTHQekTFnQUXRCfOVUibu2dItCVesJ8Rmv9cdbcbgSAhzhXA6Y+MGkUtzQYSodOr9
	kB6PDWzixX7BxpqaIa67G7b03MwZ764320ZxAxCsin491WBXrkw337M1uuovg8cQtkdO9BN8Zgs
	SevjsGqzkgWSCnYC7iYBwaamBtgUxKnkg7m1x6fNFpVsRTG7dJwYk6x6ezNKPE2CQid8PptIKG1
	zdSKg8Dk7mGcUYUoJO1KTa8ZWHiiICU88clTIe6t+Q8egR6YCdMrsGIjapvYOx7DndKcHX8DHEj
	P7wPTNpiCgNA5qRDtD1MEw6ncszU1v9V6IVNLOFa5/cJGBEJREOpd8xvVBMnUu1M1X4cAoRGi3o
	GnkrkTxULYmeumOpEnRaW4Pi1txy4vbxTSvMHsLwdkblzp/hM5MZgqpXXQfLDu
X-Received: by 2002:a05:6000:2905:b0:47f:59ef:bbb2 with SMTP id ffacd0b85a97d-47f62305f1amr22798114f8f.17.1784626289774;
        Tue, 21 Jul 2026 02:31:29 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eea8afsm39305943f8f.33.2026.07.21.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:31:29 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] ktx-software: update LICENSE format
Date: Tue, 21 Jul 2026 11:30:38 +0200
Message-ID: <20260721093039.2675786-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721093039.2675786-1-martin.jansa@gmail.com>
References: <20260721093039.2675786-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128343

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
WARNING: meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb: ktx-software: LICENSE is using an old syntax and should be upgraded to: "Apache-2.0 AND BSD-1-Clause AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND CC-BY-3.0 AND CC-BY-4.0 AND CC0-1.0 AND MIT AND Zlib AND LicenseRef-Cesium-Trademark-Terms AND LicenseRef-ETCSLA AND LicenseRef-HI-Trademark AND LicenseRef-Kodak AND LicenseRef-PNGSuite AND LicenseRef-fmt"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../ktx-software/ktx-software_5.0.0.bb                 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
index 8db0c79b87..64cc6c4a0e 100644
--- a/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
@@ -2,9 +2,13 @@ SUMMARY = "KTX (Khronos Texture) Library and Tools "
 DESCRIPTION = "KTX (Khronos Texture) is a lightweight container for textures for OpenGL, Vulkan and other GPU APIs."
 HOMEPAGE = "https://github.com/KhronosGroup/KTX-Software"
 
-LICENSE = "Apache-2.0 & BSD-1-Clause & BSD-2-Clause & BSD-3-Clause & BSL-1.0 \
-	   & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark & fmt & \
-	   Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
+LICENSE = " \
+    Apache-2.0 AND BSD-1-Clause AND BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 \
+    AND CC-BY-3.0 AND CC-BY-4.0 AND CC0-1.0 AND MIT AND Zlib \
+    AND LicenseRef-Cesium-Trademark-Terms AND LicenseRef-ETCSLA \
+    AND LicenseRef-HI-Trademark AND LicenseRef-Kodak \
+    AND LicenseRef-PNGSuite AND LicenseRef-fmt \
+"
 
 LIC_FILES_CHKSUM = "file://REUSE.toml;md5=9f87c97ba36aab42411bf93c094a61f2"
 

