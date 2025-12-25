Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1E4E7AD60
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 14:02:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138945.1766671347372090051
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 06:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCqCoBzI;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477632b0621so41880975e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 06:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766671346; x=1767276146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEeATz59OvMCkqsZCpSEaC4Ts6Pt8Q+moC5Lybs67MA=;
        b=FCqCoBzIndUoTC/PVJ2s4QpVhomvEBOHVWqh8Onm31maf9xpjn2lxEmD22l/zNOFAa
         h2prjCEwOi4dBL9/Yh2dn0q8eBSm+MQjXjmL3x4/RrtEBFwg3g5tQ9aOOP7gmuzpXXfB
         EVxLcdUYaGLLQLBLuCH6GVJcZD228yha0Node5dZ96XDDxj5aA+Fa0jCPeecYqmRhXKC
         SaA1i0cp5I6jx/X/uMVXcYu5qPEgQMDbrul3Aj++Mc9nMoVM92bGUNCkKFYoRjjW/qed
         YtV+xLLJDNtSCBvmLggsmAo85yDWtKejik3hjsn9eTPmvWAv1oBajMMAycGtmftsJsD3
         F9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766671346; x=1767276146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DEeATz59OvMCkqsZCpSEaC4Ts6Pt8Q+moC5Lybs67MA=;
        b=gzCJb3ANF8Lcm5cdifKRd+844YHKeb5YBN1oD/G+ZDM+rhoTAHlMKDvAqF3+43upRw
         T52EFx4b0SbLM0ac+euEfT7YmnwganRHR0iVIylNe2wgS/04LpVpW5qF6E0FKfl0C2kF
         BpvM5HCwC20aVmZN9tDdXq2bxl0vpzMB3OQ45X6z1AYw9BEXhlO5f79unoy1J9id1PmN
         d33rOsn87QZBA5EN5QnvvaSBSZSNRjVlYNuESMZfbuk5GnXLKxyuWn18Sku27DITAGL8
         5Pg/+WIloaHZkflivuRzjYWdqrEm4jjZ33P6iU0jLfzjXoFurFeQgBsDwJT7hQA6xwUL
         wlYA==
X-Gm-Message-State: AOJu0YwE+soSbPTc4mgT3AFTLIXsoQ+YCGT+vCmqcjN37HbO5b0hKXYr
	aWOYMe99HzXIqpSoExV+gWQkReyuZMYKIKgAKQxoBaIfY68whNKTy6Cm7jP+wQ==
X-Gm-Gg: AY/fxX7pMxK668a7KlB79OcgiTCm7tLT0NFU5sA1wMmf/oL4Q3rLs/3yOCgxJoSs8KQ
	9xMw6KaMR8AswQBdMMx30/ii0wm6CuIeLrBGA16O+ujYBWXuvFSvJCrVwbb7iTwnBRrzM4l9NLN
	5cARZ8Ez5KagD3Lo1drJB3SZkiBeuiETjGrAoR70Rfir0AuWm1s3r+ocaGM7nY+Ei24VEsjrojt
	deNsk7dhhE0rVSwj6kLSJkD8WrAr9diXNCDIpo7g1Zk6qlSWHCuENu1EO+EfcU5XJZ3mP749FtK
	SEI9trSNPkNDLL6G/E81pZKWxS/X7v0ugWhymMiq32k9QOv/Mrq2obVMPCI8YCRIfqkeDcWQLFZ
	U0OHLdemDaQP8DZ7rdogEpJjwrr++bpLLLc61wr9H1iPrmF5qVezA/J+v595Ij8q2q4EFtYtwew
	wYONqwn/LO
X-Google-Smtp-Source: AGHT+IH46JJomSz78lCRuCObOLHmb76XWzE8sUUMyzUf+tMOGI6m3ZPUD0h7Aec7SV/KwwCBziXS7g==
X-Received: by 2002:a05:600c:4e46:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-47d3ffa6713mr61017735e9.21.1766671345694;
        Thu, 25 Dec 2025 06:02:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm388573965e9.15.2025.12.25.06.02.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:02:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/4] smarty: update CVE_PRODUCT
Date: Thu, 25 Dec 2025 15:02:20 +0100
Message-ID: <20251225140223.3015168-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225140223.3015168-1-skandigraun@gmail.com>
References: <20251225140223.3015168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 14:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122924

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ceadb83fcf18134b40b36cddcacbc8192ea68f82)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_4.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
index 382f0f415c..1d044e18ce 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
@@ -26,3 +26,5 @@ do_install() {
         install -m 0644 ${S}/libs/sysplugins/*.php ${D}${datadir}/php/smarty3/libs/sysplugins/
 }
 FILES:${PN} = "${datadir}/php/smarty3/"
+
+CVE_PRODUCT = "smarty:smarty"

