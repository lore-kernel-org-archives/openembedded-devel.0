Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB4EC5DF7A
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:13 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19633.1786922643349870450
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VOwRxwof;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1818376a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922643; x=1787527443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=InVgNPkmTPrNT+sn7Hlh1Zmfqz5e4CNjSJl7z/yFzqo=;
        b=VOwRxwofHw9pqxuDGLZFuRATq69LeQN3kHk7GjLaaomA8JEcaLnhkLebIsc0VznNAp
         iSCffLR5gxybfYHMtnwZNWpRrwb9WH3T8u2KCS3C9jO3SL8slmITx6IMG5gCwuQuhayi
         xa8PpH9cse+t83MPwIyRjGRzu9D3RJ9J5944brZrJXfgto7w5amCksp6eqVZwNwnRlCu
         ytbOl+ipg5JiHufakSJcw1a4coesFIReOhqFi/SS4ylDhwF3FkCMkwa/oLto/nAWmfZH
         E67i8MQ9F4V09z5/g6OhBpvasv+2ZMyLMoBx+P0qxnxoq2aVZYhBekTIErF9KOsc1pCq
         mEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922643; x=1787527443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InVgNPkmTPrNT+sn7Hlh1Zmfqz5e4CNjSJl7z/yFzqo=;
        b=F8EFKdZqd9voQ2PxGSjID35/hgc7aEm5tSO/aa7815Tye3QXS0x0MKh5ExMiwP0wA6
         HFg07sJflsuj4jyx9Os2MEFX4S5j3BWqlFMXZ+onepGwzehOjHJrbPcxAS2tdGJ69arT
         VakJuswPpV5DQlWt9MN051K1fr1ZF7jY9tz4yU/jdOKXpNtGQM4+EiVsaW79Ujc9/ci0
         LWnhzeM1SvhBtXgja6lKYEengbAhEHQvFyCjEF0L75j+LEQyT2nJaQMMmLfvVk4gZmV7
         iMeZEHkmLRAYMfLDlB8wjQ+YlwQ/4VaBxZEHWkP+TDPg8nv+UyR1L4e9fT9/hOtvfdYH
         E6rA==
X-Gm-Message-State: AOJu0YxwqnXFcLK+9YxdRwwZHa4PbsfBt7bIR9wL2+sSGj5/wJ4QU6zz
	dMOCt6XTdfgaXMYaC47f6rIXpscwTAEHOunmLR/SD9eatsI80+tx6tfW4IISxA==
X-Gm-Gg: AR+sD102r8RlZCtl43zXS5quaJksmc/qgI2tkeA56V7Z7eV4ac0rXViQgXGVCPMcLJc
	s0i0aaTsgaeXXcEOqax2xGQLMUD2yvaXsMtwM6T2fOA5Ps5RpwcY6M6f4CWSjxjucReldJuK5/q
	0kwFFWLXhLOWro0djZBMlzA5Iu7idjzlfxFKrFcTUC1qJP9kbS7nQh3TJS3ougB22O/ujdXNt3f
	avK2Q1Et9Jdh1jQ5BPHQ+Id0Z1+yGOWG07lw/IaWeht7QDkhsMnk4mVMhL1rFGh/FCtHCCCFFlK
	7F2htnCngQogB3lKVk99m3tUdH6L/7Tm3srxO9d01uz20ptD3C6YnefnQA0OIXjfs92QcvnG2i5
	KZ1dHRQab5DuI8yERBYotWAKUqxaKyFyZ7n+G42tEGhvGhyx45XjJ1Vgf7oHn/Pnf9SCyQO3+RA
	LLU+hAP8ja8Pvdp1s+pRWgC1LjlnJEVXmtgrfmQnc72mCHwsNazC5PTZcijGKFCw+qi79r6HBWc
	vfU6OEN+Pt7Nrg3Yw1PmpoWgy0s56mRNVeNokXy2XcwEnMV8Yecj+GFpkhyAR4I4o5j/G69P+dT
	vzmwiQJmdlwBQn3YrP29FQmQzVuYT60sBtMl12LwBva8m6adNCG2hjVSJtRKxABGdMVrbYMWlWf
	DN/frkYtri/3xAuv+XYli3WhcNgp3Ytvp1fNTe9EUAO5qrg==
X-Received: by 2002:a05:6a21:3398:b0:3c0:ac0f:6558 with SMTP id adf61e73a8af0-3cc71d53e91mr21050879637.2.1786922642651;
        Sun, 16 Aug 2026 16:24:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 01/12] python3-cbor2: add tzdata/zoneinfo RDEPENDS for ptest
Date: Sun, 16 Aug 2026 16:23:47 -0700
Message-ID: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129178

From: Khem Raj <raj.khem@gmail.com>

Tests exercise zoneinfo-based timezones; add python3-tzdata and
python3-zoneinfo to RDEPENDS:${PN}-ptest.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
index d7f08c6cbc..4074ccb29d 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
@@ -13,7 +13,9 @@ require ${BPN}-crates.inc
 
 RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
+    python3-tzdata \
     python3-unixadmin \
+    python3-zoneinfo \
 "
 RDEPENDS:${PN} += " \
     python3-datetime \

