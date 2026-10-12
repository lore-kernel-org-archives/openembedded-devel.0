Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2D3CA9ECF
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3506.1791763830056688366
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JNupWc5L;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso405054a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763829; x=1792368629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ/To9wsn2t3Pxs/kp8y7LosA82+dyROBT2jtGHTIO8=;
        b=JNupWc5LX3gIzKQbO2LEcRrAwRqxm5Z2olpyyMN2rOtD66KEYjTK+c3Hc6MlYyga2U
         IR3Wrnbd2fxmU9nrP4CvbLbDEZf4Z9hjGYsu9juI5mBGKooYxLwq4Hxvr+WytPCM7eii
         Xovt08zAuUyLB85OEiyFAGEae0MmRcz2wCI/WO+fwXz1JEpK1kks2eT+5ROEwwBPlDV6
         N5y5q5zO7v9dn15Gjxpu8LjVWOlV/bMcGv11dgSSy8Z/X2wv9diFqCVRADF2ogb6G9m9
         /ENVwFqwuEUAqClatOuD6QLcGfZai8G/s0uHfV5stgelwwGo75VdJ6XfCLxSKT92d92Y
         mBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763829; x=1792368629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQ/To9wsn2t3Pxs/kp8y7LosA82+dyROBT2jtGHTIO8=;
        b=rU3o1Oip71j6Pbh6OCrvd8hVa5YsSOT2Y6ICAyeAXjz8adeN0hzVxDgyJM1mGAeIYh
         Ph51hdOMPw57tp3FMFG0DVQYB0KkNtcfnvbJLEb+jgnEuUcYCRE/iFIIi5iTiW1l07I9
         dZwjNMQZ79MAQhc4sC8bohZL4Knlxl4/4wLAu+WU8SYhrrHg6uknAYW2cei8ZlZ1lBgF
         KaOeZJWAaGnoTObZqNwQMef0vqOw4CfQxxSCvO4RPvb2sfxLJbPxWzkZtwxUJ+2MgSKM
         ucVg7LepLM0plptDLSzU+gplKJsejAwou+qgMBZcxvPvzWzUzwuSwbAy7NaZuUMQKFgN
         0f9A==
X-Gm-Message-State: AFq9FYIoGSpiCDmSYmo94Z9pdIv8cVjDngCDlj+A6ce0HMamEDSWEG6P
	1RA12G8C6rVYcRD23cUyGmXxBPpok21NtxTgelKArBO8Gi3EAYQbV4hkSa08mbYg1T8=
X-Gm-Gg: AYBFou32MH5htPC8y0ule2hjErPUkNyc2kjtGoAEt2TtyjGFW1GU7zlfCf2SBV7aJLX
	fhepWSGjCREuXborJAhRgvQGVDZkjFH5D7AJZVJSS3snm+PWkXn3Z4fJe1RoYYjmzOdD4vBh396
	w1W0R/cQl5kS68xXj+F9MImGt9t1+dE4cE/BS8RUOBlwFa/EUKuQBkUbDzPOVwRyjywHy89tOVk
	DtXE//qWedzswqkdzWCXYnrX/p2eODM/Ww+Elao1f0ZgJ7QBdnhq2ziljOv17Ua0WndlCMqR/gk
	PhpoCWTfeywzK9+TLxwkAKmfoHM9T5cUpHC6b7Bv8MszjjOo9xsK1yx7GGATRlW3fBCYYasi0C/
	eyxIz9LhLd/8a8MwKuMHSMopPYWPGXiONQvDd/Q8iNBLsZQx7O7ES12TJTWHogGItgRuN7lyhs5
	GV7BDTnM5QOpB2pbGpsBaunuWdeLeBDSqKRCZ8ZJJYIhqeLB2NkSTiYV5I90+rQT469iT1iqKvR
	bmNBjjQRth7goNLOfR9HCNdd+VfpqB4IHZE5CkD7CmKJXEIlg==
X-Received: by 2002:a17:90b:164d:b0:3a4:a370:d888 with SMTP id 98e67ed59e1d1-3ab3a99b4c2mr5704195a91.20.1791763829429;
        Sun, 11 Oct 2026 17:10:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/28] bcc: correct CVE_PRODUCT mapping
Date: Mon, 12 Oct 2026 13:09:44 +1300
Message-ID: <20261012001007.2541673-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130731

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use "iovisor:bpf_compiler_collection", the exact NVD identity for the
https://github.com/iovisor/bcc source.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../meta-python/recipes-devtools/bcc/bcc_0.37.0.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
index 8caeef90bfb..eec8ef4a32d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
@@ -91,3 +91,5 @@ FILES:${PN}-doc += "${datadir}/${PN}/man"
 OEQA_BUILDPATHS_SKIP = "/home/ubuntu"
 
 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
+
+CVE_PRODUCT = "iovisor:bpf_compiler_collection"

