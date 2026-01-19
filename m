Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4299FCA6013
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31272.1768811312134830603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uss7lvaR;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f47610542so2077506b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811311; x=1769416111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWflm4ubsP43W6TYvmkyNR1F5668hoR0KfVuBlPd05A=;
        b=Uss7lvaRRGBcnFU5pAw1t8dKrCeao3y/frmvkKB/AAcjjjlUGvp3PQO8ZqVTtquw9J
         Hd7dyqCOgE9CUU+yP6WksyKa0+JGEtrkzj2Ilp1RHUkKcCZopkh5uEyn8a67SHnOTeMK
         a8W9Qs4w0Fp+g4/XJVykcY1aAn3FMelWwY2kj7JMauX/kc06BwYrd9sVblWgr47N4lRe
         o9Sw2Z/FRw84fjRjQzpHmDAG264PSUU8/TzlxrTtuapWrmVZ0oFCwzT7r5wl6W5hIFTR
         nkBSgPymykiplcn5muFVyS9Ym4Y8N95R/VZ1oOFzREmDLZsmIp9VZd6o8hldzftrqQ/a
         S/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811311; x=1769416111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWflm4ubsP43W6TYvmkyNR1F5668hoR0KfVuBlPd05A=;
        b=SFss3t6/0k6bIJnad277fj8QGp8zfboSLplTUnybbZjT2k30zMi6r1u9MUreDQTR21
         FokPEOi42vZx0Z8q5Zy415UvCAynWJ6hiMXPbdkGQZisWOIdyzqsjKlb9wKSNcMHgSKZ
         Cjd+fNMj9d0JM+YGSUxWyBJ1hAb+IxXHJWof2dHzJkGsYODuzlmptnZugBGgmVO92dg/
         3xFU0RXJ8EkXmCLiQinecA/uA8j419iaKrIC+aPpyTUM7323eUkN8x2+hrmDwPKhESgb
         MatnIOBBn+aAXFimxKpyCnBWZgbptuqJAwuYpWgNnFlOlDxsu1dFK7RF5VfgWewEH/Gc
         pJFw==
X-Gm-Message-State: AOJu0YzkMx2gPrQmwgT349I2kkoBE0EkK62PHF7pCymWkPPqM7F7GNb4
	vE8POglzbMyY3ny8RCAN2aYtGs5yMGrUr0V7SKcufTQxLFmnfopCi8r0h1pXHw==
X-Gm-Gg: AY/fxX6ibqUX0yigCQL3FGFJ9JiXVFEw+L6By046lGJKCMdsqLHhlu8Y0uETgCqdlI5
	nQO2yJYq1g+S02JKGLRm3RXEjVErYe1H5Hv7DoGLVkV7cyYyDSQ4/xYgOB8NbKamDylDc8SQGD7
	xp+mn9nvwIdDdyk/KbKexoSLaenVyzHE5Q+rCPj3LWkp/L1BrvK2AsT9iqCWzxePSOynohh1Jnd
	sIhbE0Lc3Vyxpqs6SNasrN0Qn/RiJ1njE2dGDVtxomvRim+oETZ2RNuNetvVI8YzaU4dPz4Dw2n
	rwsd/zbTPR0AXC59fw9v9g/mkFWiShSRCvAWcDJGrV/9lmiCp00vpZULcfewA4c5HV/wL04W7KE
	duJC4vlw5h1L0V0LK9+km+8IsAiPim3t1Pr0888fB3OvnntMG6FF0xY3zIKelv2NmY7XZpiQPIY
	fyL898X2RZcmZbwuveEceuzifVWDWwN2kWyQ==
X-Received: by 2002:a05:6a20:914c:b0:366:14ac:e20d with SMTP id adf61e73a8af0-38dfe80124amr8968538637.75.1768811311287;
        Mon, 19 Jan 2026 00:28:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 12/28] cryptsetup: upgrade 2.8.1 -> 2.8.3
Date: Mon, 19 Jan 2026 21:27:34 +1300
Message-ID: <20260119082752.4120991-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123606

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6f41c5872d9166aa1197ce1b51f8670561548353)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.8.1.bb => cryptsetup_2.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.1.bb => cryptsetup_2.8.3.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb
index a77d488f44..44bf66c1ed 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2c3379eb76597dcab50911449b013e2697c4bffcc716dbbf0d9b0e8fbbb46fb4"
+SRC_URI[sha256sum] = "4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f"
 
 inherit autotools gettext pkgconfig
 

