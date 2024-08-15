Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9501C3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:46 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.116217.1723697136786030245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JT7TtWe7;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71275436546so474619b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697136; x=1724301936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsY1lTAC8w7QOHUz9hG3izoohhk/EHkTrQRs2i+ZBWI=;
        b=JT7TtWe7yMNkXce3SDoYCRE7rSuxQdj5WNCbHBYkjBEnomO4Gm4f+9QaCg0AMKoB44
         AgjunGY8egxt4ghYX9GJY+YFiA4xhpp4ZbboXNcmb2/hDn6mNrLQnSEUBhaNTnFNBsNS
         RpuZYrRvgQrZ/kAPD1aCf3eCLmjiQmGSWi6rpH7uMfto0kqsQnlTTE+J4u4ZQZR7Mm2S
         9OqhOJtRm4Sc1WqMJjxj5PxeRbbQcPEWhMcfqUU14m6tz+ALYNmEVK7axhGZ4yBWEK58
         le4fvbEIJTQKhmSNi8fFm7+d78EdSuyQm6CjWymr7l6EBMRpZXYpF0DE/CBSmH3ahBD1
         lJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697136; x=1724301936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsY1lTAC8w7QOHUz9hG3izoohhk/EHkTrQRs2i+ZBWI=;
        b=vrHhGDoBxHJj/dDS5J8tSXncwTeTvEScd2qJW2KFABZD5HLve/6gwapKpcb7cYff/G
         QbzZu9jm09b7RbrZMw7x6QlU5rDsezCEdkg3b0jxOGSM77CXyDK8ghA9HpqAbn/XB/gr
         l4ldk9ZU1oq3yoC5qJ2bww5iADoqUlTntsNrdY0TaIt0h5gZX8CzY2+IJUCsZPvA/rkj
         YCa2Ix+Mhl3tXQ+JXXJF4osyE46hCm1HdHk6r3t0skGuvz/fjDw9tMJa9s+tXrryVXLw
         Hg/z6iI1sX2v2V674wKSC0gAPwIzD4ECP21aTvC8QO+lru9M8l28CumNVSAHW2ufYKUT
         k8Zw==
X-Gm-Message-State: AOJu0Yx1pdTLXVcYMSTRtvrlGOOPLTj4QXczh8aeSagRa68YtOhlmwUH
	2OR1YZmJH3EhY9IherbfLLCHqUrBt2pZVNwll5OoHgJIlXtq272vZpgo0A==
X-Google-Smtp-Source: AGHT+IHUWZNkNIioePz0i980mvyeLveYLH1Pk+lu1ptWV/717wJgCcOuv/JLUhN2U86gf5fmUAZ0XQ==
X-Received: by 2002:a05:6a00:982:b0:70d:2796:bce8 with SMTP id d2e1a72fcca58-712673aa50cmr6500859b3a.20.1723697135886;
        Wed, 14 Aug 2024 21:45:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/9] libforms: Remove buildpaths from fd2ps and fdesign scripts
Date: Wed, 14 Aug 2024 21:45:22 -0700
Message-ID: <20240815044523.1030831-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111816

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
index 251c07adf0..db648ec8c2 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
@@ -24,3 +24,8 @@ DEPENDS = "libxpm jpeg libx11 virtual/libgl"
 RDEPENDS:${PN} = "bash"
 
 EXTRA_OECONF = "--with-extra-inc=${S}/lib" 
+
+do_compile:append() {
+    sed -i -e 's|${B}|.|' ${B}/fd2ps/fd2ps
+    sed -i -e 's|${B}|.|' ${B}/fdesign/fdesign
+}

