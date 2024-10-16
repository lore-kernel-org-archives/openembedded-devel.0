Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29663D2A54B
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.32575.1729107315817448981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9Fqwbx7;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so73142f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107314; x=1729712114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRH9+KYWjml/JiYFK1BG09gOAgJ4a2jh0RvbOekMBcY=;
        b=Z9Fqwbx7vOipzPtsoee+jGUOldZDbj0LZ0tn9uR2E+RAEKINXZd2uTY/I+4+6G9aI/
         zqSlXDTdaDxHJQg2JeqWoXpnKVsNbpze3aViDXfMU/VmFf2sz5ulpwooxd6eSLSjsk7+
         q6dExr2l3I1CdDOcW3u7k11AVmKhHhrzpvUAhOhx7LOXteCqZV4HnopRlKr3Dd6VZha8
         /id9aHzl9kdoHmYHJR0/5UTz5Ssj/aMXHa7rOB/PEoZ6KPfj60zWPR0hFwBenEcycIt2
         2UE242uQFpyvQiDw9aLN7NOZ9QmuiH75lSB7CO9doQKrIQ8f3wCUYPuxEeVIdsyiSWz6
         pVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107314; x=1729712114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRH9+KYWjml/JiYFK1BG09gOAgJ4a2jh0RvbOekMBcY=;
        b=CcGBJwXPcKqR0tVA6+I6VRNIdGIDk5bYaV3puWjoOE8C8O0Ho/S4dMW/vMWV1kSmfu
         yuivf6mgK96Uv5/mKmoUU5HDAoao56/zJZvlv0OC0pnTTGbVgeLeGaHM7HBvzpY+mCtK
         OWOq5M8RrxL6GT/DSJqurM03TFd1eRprKnm8Xp1tArzfAHArD2wIOa9mksSS9vXnTelC
         e+Le2+KJR5YqbIWoXmx9JhOn95bWlMPW9ItxTcNUnwsBh9Sb5TvAdRjRT/n16mRM9P/4
         3sf/UCeo412ML1zSr/efqrEwGsc6WvYYOLI63cFn42f4OIaUSRkoXYXwE1MKH3L1fjWT
         H61g==
X-Gm-Message-State: AOJu0Yyy1DX2G5mqfhjNbqKCJ4LLDdKfzod+wLoUu+Oi1IuYpYd8BVp3
	0EuiSyy9CAKo44/f1rDLQ4KsoPuWRnRXdeRZ/pFw9W4hMX1sOfEBw6Wu4A==
X-Google-Smtp-Source: AGHT+IHGqsGba6zN+ENzu2EPdpkqIjG2nlz//zqWsZQ7RPEpXJ4UV2o9zZVAJiStujuIs831fv0L2A==
X-Received: by 2002:a5d:6e43:0:b0:37d:43e5:a013 with SMTP id ffacd0b85a97d-37d55198659mr14264176f8f.8.1729107313983;
        Wed, 16 Oct 2024 12:35:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/13] cmpi-bindings: disable python3 due to 3.13 incompatibility
Date: Wed, 16 Oct 2024 21:34:55 +0200
Message-Id: <20241016193505.3459828-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112944

Upstream ticket:
https://github.com/kkaempf/cmpi-bindings/issues/18

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
index 4f2585fe7..5bfa31112 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
@@ -21,7 +21,7 @@ inherit cmake python3targetconfig
 EXTRA_OECMAKE = "-DLIB='${baselib}' \
                  -DPYTHON_INCLUDE_PATH=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
                  -DPYTHON_ABI=${PYTHON_ABI} \
-                 -DBUILD_PYTHON3=YES \
+                 -DBUILD_PYTHON3=NO \
                  -DPython3_SITE_DIR=${PYTHON_SITEPACKAGES_DIR} \
                  "
 
-- 
2.39.5


