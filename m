Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F91C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:22:47 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.57442.1720030960400354109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=h6A1YVnv;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.182, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb3037b47dso752475ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720030960; x=1720635760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w+L/U14bpy6sz107z4VpfUifrQKKLXBCT+vyUEbVAb0=;
        b=h6A1YVnvHVfRFyEJmIxLlGS5gAFS8AUlZMeQMUw/k1pJWre/5wMd64QToK+BWhk8Gp
         9AXdurJCvzVNTgS+Qbh6gWHo/CN+JfD6eUI+iBY8qrCst9S4IKHEpwrVGcJyxPW+6UPU
         PM0aXI0a08N8J+ZsjERxnxtKH6YceQWYVl4DvrgAHkFXKGd8xoeWbTPK9vSgseVcv1nn
         nBeG5lCC/v4oEYMc9f4oJMLPB279foXrFlKxVllZDDJZnupwyZnByr5TpjpThNChagBW
         OY8AADGByoB+J1H6pvq+uAw4r0xFyKAZIOLdz+FaRgWLYHpsvdpanuEqW9826YMV2ZuY
         R9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720030960; x=1720635760;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+L/U14bpy6sz107z4VpfUifrQKKLXBCT+vyUEbVAb0=;
        b=YLYH/PjQLu3rPyqnH/yPO/i51o9qMKbOvgjZwBgwjf27XgW8i2yrnceIa34eoJvd/p
         ovqsqcjH35XNU5JcTxMG3K4/L84c2DlzxTr71WSHVhTAcnU9D/4qtA6//6XsL2vlfFbr
         6Wk5rYkjgOXeQBfxQfEckL1ZmCs6q07ZDQy1BU/Sg4YkO6f4SmiNoO6aA+r8e5Oa5n+u
         xPaX25UT9k+enGOcAXqvhcISjGnQ4FeehtLegdaXtlnzyLki38rYiidMUg8KtffK++e7
         2h/KSvcZT2z+jd3JuosUWkITd0VbQUcfcTQTPe0Lr4QdBCNwcZbt+wgc9eKZeEqwPADM
         /+Cg==
X-Gm-Message-State: AOJu0Yzg1rBbBw3s+ijUurSuXJtfKtOpFg8nIwaOLZvsKAcACOyhFySQ
	PXPb7/R5eylYcVSTiFTfFTc5mcpnTr+oc3jcSoI5bcdye1BkwF2Ew3ALZU3GDxPBn/KkhSit/Rs
	l
X-Google-Smtp-Source: AGHT+IGQx2Fqn/WhJKYR9DnDjGnHkvP/HfC1lmZGjWss6gnq4j+6r2C2eMZX6En4f2pmruUsoQKFGw==
X-Received: by 2002:a17:902:e844:b0:1fa:1f31:e78a with SMTP id d9443c01a7336-1fadbc5b820mr90407295ad.6.1720030959824;
        Wed, 03 Jul 2024 11:22:39 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c8d8esm106344135ad.47.2024.07.03.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:22:39 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [master][PATCH 1/1] redis: Update status for CVE-2022-3734
Date: Wed,  3 Jul 2024 11:22:35 -0700
Message-ID: <20240703182235.2087-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240703182235.2087-1-ninette@thehoodiefirm.com>
References: <20240703182235.2087-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111244

CVE only applies for Windows.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.5.bb b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
index bfb46240a..930c1cd9a 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.5.bb
@@ -68,3 +68,5 @@ INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
 
 SYSTEMD_SERVICE:${PN} = "redis.service"
+
+CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
-- 
2.44.0


