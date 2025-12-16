Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4DED5C0F9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:02:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18232.1765875737449991626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZopCqI86;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso1955262f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 01:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765875736; x=1766480536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nEEGEsxZ07bVEV+9n+3rN98zf4NJ6QkXVtv5O3Y+L9M=;
        b=ZopCqI86NYG9RBJQaJBJAAt1syDaoZ774ntoogO6j0FEtPrHaM+x5ZK0buEzlaUsBl
         9mtN0p+JNKjgkzyXglzW6nSlavPERQfYpBLmm+l5qTcvY2fr+C9/bUI22S6Zue4bgdNO
         qmnO3dGcdd1GTislNKAqSq5lBee+icbYmePnYCU9wci1beU7rZrw7hBUIGwxQEllNcBK
         q/oYk/ZfPURc2JFXSCWqeQu+/bjabDHo0ADgLGkh3dWA/MiMCNdPT0d/9MtzVspP8NOw
         n7SY+3WQu0a0BCHCciAu0AYhjMqHRZjH6hBpGowPiSEJ2iGCTWScHOGFHQkfDy5sdgbR
         qOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875736; x=1766480536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEEGEsxZ07bVEV+9n+3rN98zf4NJ6QkXVtv5O3Y+L9M=;
        b=ezp8WRZvi6wZynkQZTJ04SwpCWXeAcqn84UQTU97VxokUGXG8tbuf3jew+2VE3Qnym
         hhWZNK581dKhkTVQcI5p2yFAtySMb+Wlby+tJU1+9i8SUgEzgT98PztrUg+4wafsBUJV
         jsoIPnSByfnMGuLqQploGGKQXgChX+Vhr8Ql+L13HogZ+eyLFJlxG69aV7rpXwkU971b
         HHw5zvw89AcS4cI0T6RK7yV1xDzVm1MCeC79wwJbQr5vniu3/+7mDFISirAiNn10wPvG
         E8kY97WKnwcttMkZ9RQHlBdVUGlCQTBxzP/Hd7GklYhiImWJfyGr8C4yDIiZxpjA/c7m
         bVDg==
X-Gm-Message-State: AOJu0YxESoJuFxVPu91UUAUEOaAIKNy2KxeOh0xhEuy71RnxYes3iJ4f
	Ovg7f7IAUpDGv6VZK9q8k+/J/4aTo4TyEl3z7j8nJpC1FZ4vJx+co2suHbbcUw==
X-Gm-Gg: AY/fxX7h0WFkdPBg1Ic6hEtis1SZuyA76GZOD2napqtayHsjh6TUGa9lJYU4t4z6wnt
	R2xAC/3ZeNR7p+iWCvsxOUtn4yCdfUMxjpi3YdygRm2gafITqb7n1kaE0EN4X+HYyL6tdZeZ8FZ
	mtRc+bZmp3eYWEablZspDrnzv5cjUfWHG8Q2NBlpM0/4dAN2da/bEPhxSI0dXFTylPCpNaGYL2J
	GqA1TKypJ/gmKGYTZD+XRzCboQYigUP1dJrre9qC9TwJxfScoIOIvNsoP23M8wnqoeI6ihBCHz8
	8FO5O7500m6kh1BgGzafDW0LwIa2UzabXaSU9rNwen4ZC3eAEe05UHJLETFgvKN6ZfZOeJXnIuY
	Bb0APqFOrNy9XWn+3GpDlNWGoJxY7nGxfllCKF4JO9NPqLFAuXUqz0qRdYNrJYYNeHiUSmOh3nI
	8kXMMVOFE1
X-Google-Smtp-Source: AGHT+IHn9JwaMD4yAQUCpjJLN5NRwCgsk9jQYHpvJiFBvMRR/2PpVo2HtUIWsvZpKHh81QfR9i89Nw==
X-Received: by 2002:a05:6000:1868:b0:42b:3963:d08e with SMTP id ffacd0b85a97d-42fb44e21d8mr14149697f8f.22.1765875735471;
        Tue, 16 Dec 2025 01:02:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f1fa232csm20156648f8f.6.2025.12.16.01.02.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:02:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minio: ignore irrelevant CVEs
Date: Tue, 16 Dec 2025 10:02:14 +0100
Message-ID: <20251216090214.1404629-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122689

The minio umbrella covers multiple projects. The recipe itself builds
"minio client", which is a set of basic tools to query data from
"minio server" - like ls, mv, find...

The CVEs were files against minio server. Looking at the go mod list,
this recipe doesn't use minio server even as a build dependency - so ignore
the CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index f278a728fd..511dd4d869 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -164,3 +164,9 @@ do_install() {
     install -d ${D}/${sbindir}
     install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/mc
 }
+
+CVE_STATUS_GROUPS += "CVE_STATUS_WRONG_CPE"
+CVE_STATUS_WRONG_CPE[status] = "cpe-incorrect: The vulnerability is in minio server, not in minio client-tools"
+CVE_STATUS_WRONG_CPE = "CVE-2018-1000538 CVE-2020-11012 CVE-2021-21287 CVE-2021-21362 \
+                        CVE-2021-21390 CVE-2021-43858 CVE-2022-35919 CVE-2023-28433 \
+                        CVE-2023-28434 CVE-2024-36107"

