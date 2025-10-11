Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D6CCCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 12:36:34 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.10820.1760186190256875482
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 05:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WBTgwJic;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so5581272a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760186188; x=1760790988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCbygdfCj5ED9OH605+/z69B91hs+NDV9DTRGP3/fVk=;
        b=WBTgwJic/Ax+x8TyJZBShbmpdpkH9E0OkpP53kh1ORhdU3v32LoLI5DO69pCTliQw7
         qlbgoT9qBPE6VWuU032XNB391fQ39QaxXvTErf/M9MJ6UaC2vWfLJSikDsOdfXU5asmw
         o0vX1jb1LYoFxJXyP/eW8TinXnQXeCi64IIWM5sWrZXBmEL6UJVibaR73W3sY1jR/WTX
         2MZeoH6A/m1oEvjOk+JGs0pLkrnVA6q3LZULJl1otTgpXkDR74N8ubcLlxj4k/hGIjQT
         6wUOtpE/UwWgcF7PNUK+lSmsfb/RW+8ePaNkfYMxXaHjOeWxNbeZyH6nVbwvDJqwmDFO
         BT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760186188; x=1760790988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCbygdfCj5ED9OH605+/z69B91hs+NDV9DTRGP3/fVk=;
        b=NaiQbWpB9JprMy/xCLLJ1A/jKXHdR37yt3kYj59SP9JeHKvoQWU9bLM8L+s83Klb6t
         J1s+RuJIpvrYNHLGQxSZ8lAIb9RDgVRa1W+7wZ571Rx67vs69fnvl0ClRHAFyUi/VbAn
         Q429nkpwfuusgjKx197Xkq6tb0OfmkG4JFNt3gnqD3KN9EXqtq5seqDj7uL9w4988xim
         rg7WYDMr7P1aO5ig82rix80Apuy6Sgopjm0q4vMirotaQnxYQowzE/7Ad9cg2M2UC+tj
         6EU/e4VCSFjTSE1K8+QUdQwWQf6DOIj4GDUNpyDtH+tjkldj65ZQ5tNPfxcTVKcBJH8O
         paJQ==
X-Gm-Message-State: AOJu0YwGigzHg7/c84mMLqHTOzIJDcnAkqC3a+hZXmY4AMtmtf6O9fYs
	EOdQL1TS4H152+Pbu4q8eVdNSRb7LUyysleHPIq3pmweK+1ZUvFPymcrOqQxpx63
X-Gm-Gg: ASbGncueCH9jeOzYiMBtNrF7Jw0BpJgrt036IhZDNERJZHbLW53Wp/ITJoUN9exnlBX
	w9Qvk3qOOi322ofYMAGaPavNhLk/0G0nZ2pQSomeakiEZ1501uC0JJSDMCjSf50PC/+SBFEGZcl
	WdNUgU2Z37Miu1Vj8TFof858WxnsQYMoFwJC0OB2ZLp4y9cUjMCqXanjuwPndDAKQX0sC+iGDoU
	knJNndSrfA+I2AMpj8h/UXclDG+KZgXugtVSz+RnV4XzGoz9T/e2fHrYUQd+HrBHmff59kMBT7J
	lm6C2GTCb/j21wLpvjBevBwXpjqtn0JVv6ARrVf3z/Y4vgdUbpn49i4KZfRUgJAVRHX38lXdClC
	QTvivnrcbQKS+SmgVmO4797AiywUKYUeOs4j+yvby+0xvY7CBSzz0ke89O7XC
X-Google-Smtp-Source: AGHT+IHgNUDvtdRP4Ao09lwu+3KwHPdOEMcCbFlwRAiPQu4HtkU2BlbzS9ZcXbA7QYVa2sQuZyZX7w==
X-Received: by 2002:a17:907:2d8c:b0:b32:2b60:ee2 with SMTP id a640c23a62f3a-b50ac1c46d7mr1515120366b.41.1760186188470;
        Sat, 11 Oct 2025 05:36:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c129c4sm485686866b.41.2025.10.11.05.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 05:36:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] emlog: set CVE_PRODUCT
Date: Sat, 11 Oct 2025 14:36:27 +0200
Message-ID: <20251011123627.2019203-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 12:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120492

From: Peter Marko <peter.marko@siemens.com>

This will remove false-positive CVE-2024-50655 from reports.
There are different emlog components from other vendors around.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8d45d909315f5c784234261bb3e97d2e1f0a102)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 631e52f388..ec78a11086 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -8,6 +8,8 @@ SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
 PV = "0.70+git"
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "nicupavel:emlog"
+
 EXTRA_OEMAKE += " \
     CFLAGS='${TARGET_CFLAGS}' \
 "

