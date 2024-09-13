Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53757EEEC2A
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:20:58 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.67531.1726208455058882480
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JztCetXx;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2055136b612so23450595ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208454; x=1726813254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTP7QbY9x+eNreiNPTI3uc5EwNsgBdQxJNgBi2HTQ8g=;
        b=JztCetXxFR1JXOsYoN0OS4ogiP7Noetd7HL2FneAU0drmYb0iep/vU6SX3YIUbiUKi
         jKUL5IXpiZSF1smjcb61M6cDujClp0PK8T4E4J7n7V6oqAsQVOgo0lIG9DF1baCh1tBx
         TK1KCsCqbn6Y15R+BiRcp4fMHYEv14nmqYdJOnEuDx7EpjO3evQ0AkeO58p91MrRCbb+
         p7cdvWCMy4Gf2ng/gshO9fmlMJUgirzQanLJNzLk4pGxFCsHn4j/w2U4P3Pe5s0Vt6sG
         2DvfcRTJk6lDgwJiPwtgK1/QkYTMPCue3SD1/QXYMO3Iv3SCI0BE3VZRIhflgzuhoIzf
         d8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208454; x=1726813254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTP7QbY9x+eNreiNPTI3uc5EwNsgBdQxJNgBi2HTQ8g=;
        b=sxWb7kexM0Sg+99ZvhEau2SnSnx6jz4UgW3djRh3pKEC+HlnzD/yRO7jdp+SIhJKc1
         aygKbo9AELJfcBQXaLB9Gs0DSQxUucaJPKA3FGB4wMoQYsPLwzupkcuOKqtBB/mOC1r6
         67H8CpuiTUAdklIWaYiAuSGvkoik2zxR8pIrwylSReMPUtB2SDqY80Hy22uv8/6cOZtb
         a5eVmvmHXKhjL5QArOHI1blCnO7Igdpqmjc0+2K45GMDHM/Ub/+MhMUhkMgnLIXxq6Yj
         PgutRqOnJd/Q0Bv9kgQ9f95k8LfptfC+Hs8WLQxwonPX1leGFtVGbKPYIdvprLm3/h89
         2KPA==
X-Gm-Message-State: AOJu0Yx4CtaIIMqnjK63XqqoYXmXOofihgpLGOGTwQG24l7nU+P2q87p
	RTL7ontxwwjq9SY7UAUTzK3lFMbcGH9DFx+EhRNujxXjPVs3s1bUEU1cDlzI
X-Google-Smtp-Source: AGHT+IHyKHD5Tg2xUcjejz+fjOZmkm29WaOS4L1lEh+HEcquNJAEwNt7kCUNbhWtrIZEmwP61iLQvA==
X-Received: by 2002:a17:902:e88a:b0:203:a030:d0a1 with SMTP id d9443c01a7336-2076e447cfbmr77936825ad.58.1726208454183;
        Thu, 12 Sep 2024 23:20:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 02/10] python3-serpent: Fix typo attr -> attrs
Date: Thu, 12 Sep 2024 23:20:42 -0700
Message-ID: <20240913062050.2597921-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112261

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-serpent_1.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
index f3cf80a375..9265081fd0 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
@@ -11,7 +11,7 @@ SRC_URI += " \
 "
 # python3-misc for timeit.py
 RDEPENDS:${PN}-ptest += " \
-    python3-attr \
+    python3-attrs \
     python3-misc \
     python3-pytest \
     python3-pytz \

