Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6C1D3B7ED
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:40:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10696.1765294796374184067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 07:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFes18eI;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47a8195e515so4205985e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765294795; x=1765899595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zRjgTlEsUHai2QVNTmNHMCzglHGsH+YxDtuwRJaB+0A=;
        b=NFes18eI6WunGKjDtWIIcLTSEt3mZhzTL2me8eyOSkewKhy5HOvgq4ldeIXQapPFK8
         3l85NBhwlhoEDRbomW8Me5gQlcQehVgfQKljLXk+mWfqD5QHp8FnOlEtetnl+54Daakx
         8/piwxqP4Vw1ubjHT+rdce59kZR7i1sTlIeaLmAInHVN3Fv13+U/IGpT3neH/x86UjvC
         1HcTqOlO7ZxU0v7l7VW2wEO0GWfne2JAVbRF5cTut1ADftzfqWW30PoZWgyo5e1eC0h/
         3O3c0BqskTo1qaZrrFnqut63QHS+DvWrpgV2CI1QnFq4ulmETdh/GGbDCCWv3U9AM8WR
         q7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294795; x=1765899595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRjgTlEsUHai2QVNTmNHMCzglHGsH+YxDtuwRJaB+0A=;
        b=nvtK0P0BX5Ydz8oejtWdP5hIzx9Ies+ylRMPWuNfdGPzvEulJc4Ky6Lg03+taQgpQN
         /aotQJA8nHQ+OeTbhCXZncETWqFjzOTm1utTSgWNziJCOOZZq7hvoUuiY9iABGy6lR20
         M7yiJeK7yIZ7U3+ctGmVYcGNspKz26UDzvep0MwtxCZSf9NM1achl/ZVeo4dLFTLdbqO
         R5BZIaOahfVguLRc5cLr+H9oL0bq5w5MG3XM46CwWIyl2wRnx9IZleI9aY/UYCuslJ6g
         0IBN85Oek1pI8a8w2JE5rsNC9qrG3yRVg7cdPjHzwEFkKT37+Whzu23GozUBdyrI2W9S
         pMBA==
X-Gm-Message-State: AOJu0YzSvcYgvGW7SjBvqnB+4I//HtmTpYDd/k/jlrMid5SXIUhYHGTs
	KirDUa0cfU3uZHkXo/Qd26/btBVqAKZbZtLwld2qSCWRF8qN6HXRiaA8aSnkyw==
X-Gm-Gg: ASbGncsMruK0b89cUpSl0ynBHHuI53WiuMNpBaoa5J7XDiB6ECQgi5ggTL3rUzGb4hQ
	qMzYEKIL3wnvfKx+lM+GE9J/DyqzYirZrGWeZq6x9u6JLciNhRA5Z0ZiRKnt+0Mp2xfY78FTxDs
	ZON9VVvixYARemTcIx4p/YL1Qj6fpoeC/SrN8X5H0lcVaPJ9dkIqfJ8GeJEukdP5J3xqVEksM2w
	toE82qWTI0sOF0l7H3ujSsWmAecYbCOHiDUlpZnhs5cC8xdqIGhcyMBGAd/hGGishd9+mf4ysJ6
	kn1+YnDjAVLFUYKSR/Po4xW7gi8nXsZnxb/+XHz8/yZvHqQf6MFHuT5YdOQl6lvIJ524zRQeZ6n
	q779rf0UkzSOnsDX3d9LrNBTFvgN9MoO1NbVMK3Lpr95NXYDsNQTc8GQkWbkKdVeMfzwwsLVqir
	7feP7IDS2a
X-Google-Smtp-Source: AGHT+IFDZBAN3zYraVxEsa0Y5jNvXDcxe4LdyXD/Gs/6MF/+ZLzT8MazASgIpK27qN2Q4qhXq5LX0A==
X-Received: by 2002:a05:600c:3b07:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-47939e27b85mr112467385e9.20.1765294794463;
        Tue, 09 Dec 2025 07:39:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d632cebsm46375495e9.7.2025.12.09.07.39.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:39:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] accountservice: ignore CVE-2023-3297
Date: Tue,  9 Dec 2025 16:39:49 +0100
Message-ID: <20251209153953.951218-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 15:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122460

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3297

The vulnerability is triggered by a patch added by Ubuntu, and the vulnerable patch is
not present in the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/accountsservice/accountsservice_23.13.9.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
index e3dfcfffff..c024ae3f92 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
@@ -41,3 +41,5 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
 "
+
+CVE_STATUS[CVE-2023-3297] = "not-applicable-platform: The vulnerability is Ubuntu specific"

