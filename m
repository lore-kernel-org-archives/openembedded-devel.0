Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E834FF8E499
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 23:38:24 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29505.1776382703779706675
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 16:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TUJMjBB8;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c565dd3a7so253959c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 16:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776382703; x=1776987503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgvF38B4cNeUVjUggIWMkBoSLpqLvtHviST70kz9pOs=;
        b=TUJMjBB8Pc4IAzflj+I2XhY6zM8vMmjvKZRTSKP+HxolA/GAnW7iiUvks9ad+sngK0
         3BigdYzpg7e+yPnaVix1ee3V36KPnZ2N8BMvhSJV9jYBdzDap9Ce0KcFFKKxPTc1NMwO
         3eJVZ1V85iY7Zah/dcijb+vWrdXUOcKBpO18rEGw5scQqFIPZbD8IKdEaR/iG2JT/QhE
         H5fTY9F/mOhUzkkkiUe7Ft11dwO29FgVJLNn6HQ9LFvRoDFtUivf36C8syKbZxCBRNZe
         mHOCl2mSlHBro/idtWW7RvO/jWS3QV6r4sU8gXVhIrPySnS8v1rXOZ9SZdPoj1+9mtme
         QRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776382703; x=1776987503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tgvF38B4cNeUVjUggIWMkBoSLpqLvtHviST70kz9pOs=;
        b=dJbH8G2zHJA0wS0XYYLlF2Pucw1misZTs+i764JZOPZpXQsYKLBO0EcAa6o1Q2DbAg
         Zh/tZGbmXA8Pbyt0TypSS6PGEJnhWJC2TotTDXfFZqs/XXs6Pd1Yy2y2Y5EKmCfRFGLU
         5KkE2xk9zrfMSg9H4haArdssZ27ifzL+61LAO3O28xaOJ50R2LpYrXqipgiwjzajJNwB
         5ysS/vsLVWRk54OVmI9mUB2fvI5V69wln1rojznTUcacq8bxRHv9O6kVcC2goaoemWzG
         gt3LCVmN5BTbsJOKqdTNR9+gjwhb20rB3UAh5XkVFgx3OSO5hsGn80apxZmYxNO47HDC
         fH8Q==
X-Gm-Message-State: AOJu0YxVHzy9MXrXGGCG0c6fyalLLETjAZOrLC8NU8wchub6ja7LXXkm
	93a9Ohp2q+TYF7Lo3e6/GJC9eXulSCMDA2hhfVW7A9BAy0n4nTJR2dQFCmWKerVu
X-Gm-Gg: AeBDietsEIL8B5rh+dcPBaayckECb9LZ097F7ytz569yTQPdRtzr52Y7qyHTQuCI5eY
	HBnWyPTxg9WvgehInWB0MTENiGaw+LLVyTFcqMRr4vxxQjOUorKcEv2Plu33gTvpztZyShkj3aI
	qqjQ2o/V14iUcVx9OIHX0WVLrjBViSrdZBCcw73qYddK0X+euCmCTkRyFOXi52hsGfkTIYF+Ym+
	bguOXa9gFz1a6pEs0aoqI0R4nomDgdl8G1LFVJy+J63DBiKufWVw5OaTDtWNnJuuyF49LoYYBjW
	6qS51wevG9acQ0/rTHvsr18fTbxGNyvBs+8q4frJ30s51lBuV3XwBdg15kmXgoc4lmvB1fpEACL
	a+BzBcG8dYLrP98PXcZ41MZQN6MFc7kyh6ZAHCrR02t3xODVfIqaDl3eykvFEIB2RH0qrqknGlB
	A9qbCth39lxqtezysAtCQ6iia/uPz/Ur6r74PXMivPwi6emgvdRgH5qmSzhLrIk2fq82WGXQDgi
	xxUEuIqbtb7fNxrNXTgZgwfqlkpZRSEbOf746Nz2EtkWZtz3XgyhmF4J8tKUcJuxQbIA63CsoaL
	XO9tDH7fp21q5KHI/b09T6/QdGi3MJGO4UhjOxU2FZOO36SbROk=
X-Received: by 2002:a05:7301:1e8c:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2e465772629mr203623eec.11.1776382702830;
        Thu, 16 Apr 2026 16:38:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e4c3f4fe72sm247993eec.3.2026.04.16.16.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 16:38:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH v2 3/4] magic-enum: Upgrade to latest
Date: Thu, 16 Apr 2026 16:38:17 -0700
Message-ID: <20260416233818.3790619-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416233818.3790619-1-khem.raj@oss.qualcomm.com>
References: <20260416233818.3790619-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 23:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126422

It has fixes for C23 and Clang-22 added also fixes/workarounds for
libstdc++-14 combinations with different versions of gcc and clang.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Bump to include clang-22 fixes

 meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
index 6d5399c8d0..958ae21065 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
@@ -16,7 +16,8 @@ SRC_URI = " \
     file://run-ptest \
 "

-SRCREV = "e046b69a3736d314fad813e159b1c192eaef92cd"
+SRCREV = "7d87efb4a3dddbbe8caa9ca14eff05ede1102ab8"
+PV .= "+git"

 inherit cmake ptest


