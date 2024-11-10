Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24913D12D4B
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 16:56:04 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.39531.1731257762720928229
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Nov 2024 08:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JEeyur5w;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d51055097so2215800f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 08:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731257761; x=1731862561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9miGDGa5UDkDfLpf0ql8IiLmfvpo2VmXXRjbGOO6DAU=;
        b=JEeyur5weuJgpB3R1h1QZUsmxr8KNzK83rUMvMxgYgSGoQXO7h13lKtC/b2RzfVKEF
         vvGBYV1cr2J6ukLLqJ/9sROVn+79TO5h08Q98H7NVPtqTivxmUlsnLmWilwlgtF5TSBe
         KcnVBCi6TERKLCL1vHw62tbQY5KfTGWeXl+yQbVWIpabAKv/1gbQoGpYNwYgmJ0u9jiV
         BRuQ9b4oE7YcJJH1mR0LqmDFcMHn7SnQ1F1xJkjZhJDJzMIPNm5MSAyUWj71xdevj6RS
         IMlkwhKNIajYAerJaX47pnTZQH0ho2LdinQDYiNNBE5/uK1nz/yxPJwyFwf/VA/bhBLo
         s5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731257761; x=1731862561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9miGDGa5UDkDfLpf0ql8IiLmfvpo2VmXXRjbGOO6DAU=;
        b=u0alwEEwqAkjZBom858yNSkL7QydTBeDu0ffjnfRcH0D1yyH8V9kbx+Ixf5b0EYk77
         CMRp1pAeWSTiRXVFXtHVvCYFierw2n8ypmbeiHiTlaVu8L1WzobZNCdaAtu0CMLhRcxT
         Vx2dQSkbXZcZ2i13asyIXYuiDKdQucRmsEsxRuG4Qv1cg5Ifw1LBKuBfztz4CccHbkZl
         Va1JjmrsnUZoiibwpgLc59eBiu++hYjk+2aAoVJUDT5OygSQV4qfR/FoE82GHzFE1nfS
         O/DxCA1lVUhifYQoDl2Z7ik0xMDkjR5GxOsGHIglZHb3ckHyaQ01G87iAPwT3TgyccG6
         yQEw==
X-Gm-Message-State: AOJu0YwqU+gebfub1SnP1z+Kw9YrZq9dffNpAfhbHBbgUiHFjfLbsDmz
	+5YdZ+xEQvI/AcH3PpMeeechpUQiGvu4glV8A0npgcQFvz0VSU2jqa8jQw==
X-Google-Smtp-Source: AGHT+IHAzYDzQPjbCxjihBNrslIso1d5g9iqk+hHoAISbePgXfCzZQvD9gS5Scxb5I3azX1nXzCKzQ==
X-Received: by 2002:a05:6000:1fa9:b0:381:cfea:2818 with SMTP id ffacd0b85a97d-381f186d156mr8395817f8f.30.1731257760279;
        Sun, 10 Nov 2024 08:56:00 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda137dbsm10609946f8f.110.2024.11.10.08.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 08:55:59 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-can: version bump 4.2.2 -> 4.4.0
Date: Sun, 10 Nov 2024 17:55:52 +0100
Message-Id: <20241110165552.533728-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 16:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113779

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/{python3-can_4.2.2.bb => python3-can_4.4.2.bb}  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-can_4.2.2.bb => python3-can_4.4.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb b/meta-python/recipes-devtools/python/python3-can_4.4.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-can_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-can_4.4.2.bb
index b0d87f4e3..3781737e1 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.4.2.bb
@@ -1,15 +1,16 @@
 SUMMARY = "Controller Area Network (CAN) interface module for Python"
+HOMEPAGE = "https://github.com/hardbyte/python-can"
 SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f"
+SRC_URI[sha256sum] = "1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195e92f87257f009df5"
 
-PYPI_PACKAGE = "python-can"
+PYPI_PACKAGE = "python_can"
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += " \
+RDEPENDS:${PN} += "\
     python3-aenum \
     python3-asyncio \
     python3-codecs \
-- 
2.39.5


