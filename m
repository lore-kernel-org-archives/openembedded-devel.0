Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48E8C369D0
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:32:56 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.9981.1744975971083171494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HUpjF/GR;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb415dd8faso286351866b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975969; x=1745580769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8R9W0DxN+Ocvu0a7aTSOU8XhyIhiwL+o1oSHI6YRBJ0=;
        b=HUpjF/GR+OT2n4fkiC5NuOjk1ouem0WFW58pPszinyLnWXjSQwjM/5Jkrhpoi2QPxN
         fcxFREIhy0D6l1xVFF4g9kVta/bab0AkCdM7hT6dWWCZ0bmO+bTUAFRXuP8F6rcq5giF
         pZWpauROApUnZV1CtFw9pjPidBGKxmyJYckI7a6xIptmpQUFaZtCOctW+IxFlARTyaLO
         nfwuSRyrslVKs1gzNHwQEfTGFOeYDIiKR+OWBudYNFLE4QRmWzCurx18e4qu/PcF5Lec
         UOcLNQL5ZHIrIiZtxg6EuYqWmkzw3uSbtHlxaj1SD+qHvWtkIZUfHW0u4sKn3zlH9YZk
         hcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975969; x=1745580769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R9W0DxN+Ocvu0a7aTSOU8XhyIhiwL+o1oSHI6YRBJ0=;
        b=A+YCYx9Y0jISvjvt/+MfzHD1szm3eohc9kjzf3CoiZRkn1LDxByFzJWW8zNMxhrPMs
         yfwslmNj3+yyZeydDrIPMcWtsEBGYk6UBLgCRK5I+1Dlq1ymVzLVyGM1CpGChwhcNhpS
         YbzYZ9enfJPRzo7AJkgXcsZHL12htfrMGAViK1841NRo5alilgsP++7fIbGGCJzrIBHL
         mdtPxHSCuO2jVEZuOumoMzwQDlCozNh4YE157cIeq2EVcVBNqekB547qNTYHOQOogmYg
         rZ2FOCyhcjLBjd9BsTg32mtIzHobE5EJqfjWCEGVmXUjnbBI4gddPnLZFLJUZw6JD2JP
         MmMw==
X-Gm-Message-State: AOJu0YyBIo2tspZlbssWe5P0mZF08azo2ixUranPIjV3V4VCd1NfCLAf
	HofCjMcVp4+nUr6Gv4PLXD83pH2cXeJnpjnkwCO0il4q93YXd16n
X-Gm-Gg: ASbGncv6xB79Ebp6u3uaE4FhN5pNnJfcwFkTaWa+Uk4LW7i9mIpPLRHXC7nSwno51PE
	qfQrD2kbwKR81gGHh26wVgjARDwgfkt9A2JQ17We+nCVC5XOkCmuyJrYXZlVwrMO2/Ucjgg0J0c
	q0uUuvb8Tig8kr5XY0USFd1qGaI9m8qODomXzPV3BDIV0UcCS/EYoOh2pKdrM/uSfiKAtw03h1r
	kkx5/Ccw5Cfe3HtsbHgZmYrdqFg+iPflrkhhqaVstOlib87sV6vz5amRgKepb1xiGnJgcJ0Nj9D
	QpchQr6VnhkaPxYw2ibkt25Y2EeVuVDCdqlXNOEC9EAN6mah412wlBpH2Ys0zuFhyRpXyBA/mG+
	QRgOpk5dQFET9nnM03MrwLSJtkaZjaZrhKa8gWzOBc8kcyfqa8XPd
X-Google-Smtp-Source: AGHT+IF4A1ldifmqJqwlO1rfCzIE5uX+kpInkW1i3mdP9XGYkusnkK/Qay9pOJtVcN6TDAYJnCTg2A==
X-Received: by 2002:a17:907:3fa7:b0:ac2:912d:5a80 with SMTP id a640c23a62f3a-acb74ad3825mr207716966b.5.1744975969274;
        Fri, 18 Apr 2025 04:32:49 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm108313566b.43.2025.04.18.04.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:32:49 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][scarthgap][PATCH 4/5] can-utils: Fix build regression on musl
Date: Fri, 18 Apr 2025 13:31:47 +0200
Message-Id: <20250418113148.142480-5-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
References: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116955

From: Khem Raj <raj.khem@gmail.com>

This got introduced with 2025.01 upgrade on musl systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Cc: Mark Jonas <mark.jonas@de.bosch.com>
---
 ...ime.h-for-timespec-struct-definition.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
new file mode 100644
index 0000000000..91b9dd3c4e
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
@@ -0,0 +1,28 @@
+From 4363ef59cc9f2169455f56453759d4a4d9b89a5f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Feb 2025 22:14:47 -0800
+Subject: [PATCH] Include time.h for timespec struct definition
+
+Fixes
+git/isobusfs/../libj1939.h:33:18: error: field has incomplete type 'struct timespec'
+   33 |         struct timespec next_send_time;
+      |                         ^
+
+Upstream-Status: Submitted [https://github.com/linux-can/can-utils/pull/579]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libj1939.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libj1939.h b/libj1939.h
+index 44393a2..7c19f43 100644
+--- a/libj1939.h
++++ b/libj1939.h
+@@ -17,6 +17,7 @@
+ #include <linux/can/j1939.h>
+ #include <stdbool.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <sys/socket.h>
+ 
+ #ifndef J1939_LIB_H
-- 
2.34.1


