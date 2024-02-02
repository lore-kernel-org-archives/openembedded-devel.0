Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E282C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 21:58:07 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.5083.1706911084463964248
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 13:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3be9e11ee59so1435028b6e.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 13:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911083; x=1707515883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhK1Mx4UHYhhCez+l7fo376LaCti0xdVQcSMOW+CjIE=;
        b=wWtgDqnA1tKgtfBb9zaKaqmz0LUwpAlE57lywAVq0yQLd9EmTisRUftFWvtKNesx/j
         wGlPZb1pTczb1cyRU5GmnQJnvTcNmVDEmJd+9Ppg+JMw/1f1x+ffjggBdqBsGqB38key
         XW0aqR3UfBdqmYdGKHS16tudgYoMvr3vcDjDRqNVf7BIMTzxLRP67VJOZO26uAsw0H4Z
         s3PCTWBCoGjBGvjpxulm3zt8RVOvmwSgzjJu2IHe5W8eRIrzJHUiLiXHPB6a7PuAmjVB
         xKFDJXUa4i5lg8QnUTdCMiM+uNH5plrBvpFweSrC4b38ZhC3Qga+lpLlMPhzm22qqIi9
         hacQ==
X-Gm-Message-State: AOJu0YznJ+JIcEvrEp76JLDEGu/PpjKpJnsA+9wAgH7FANIDQN4TDfe+
	tB2T8fMZq5M+yluCo+3w6K4d26x/ut2baJ3AOlUNXm0riTyLsOEhHW0lV9gcd0pY3CBv
X-Google-Smtp-Source: AGHT+IFaAkWUqtMeWO21pC9eJCcxeYJxrtz4Ic44ZRX/KPgkNdnpLXVX92qFTtHYM5LUhnNo9tpreA==
X-Received: by 2002:a05:6808:2e90:b0:3be:67e5:5b09 with SMTP id gt16-20020a0568082e9000b003be67e55b09mr10737467oib.44.1706911083135;
        Fri, 02 Feb 2024 13:58:03 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id y29-20020a05620a09dd00b00785538802c0sm900182qky.26.2024.02.02.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 13:58:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-grpcio-tools: update to version 1.60.1
Date: Fri,  2 Feb 2024 21:54:42 +0000
Message-Id: <20240202215442.1612506-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 21:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108549

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...n3-grpcio-tools_1.60.0.bb => python3-grpcio-tools_1.60.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.60.0.bb => python3-grpcio-tools_1.60.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
index 8e5c7d48f..0ec9d95a4 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
@@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "ed30499340228d733ff69fcf4a66590ed7921f94eb5a2bf692258b1280b9dac7"
+SRC_URI[sha256sum] = "da08224ab8675c6d464b988bd8ca02cccd2bf0275bceefe8f6219bfd4a4f5e85"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.34.1


