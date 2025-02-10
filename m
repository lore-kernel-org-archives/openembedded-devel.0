Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BA1C0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 23:26:12 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.7510.1739229970988066806
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 15:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JgykZ3a8;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f7f03d856so37799345ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 15:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739229970; x=1739834770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yfI8vPIr2esnYWeGD8EUkBJSCcBFm4SEBMUXT1EK2/4=;
        b=JgykZ3a8gAWldBiFImEYDhX4mgf1ITafq+kp2Nw8Jn/yCJL+ms1kobFJdXMw9Rf9jN
         Vd7tCUYOWgf0r3F3s4273sEj9tOZ0hfLN7IuIVNeh32TOCUcB0cBTkkp/vbMDKPkmldN
         hkCO9cElRGKNgJYZlirvs443RGQGu+mURGzv7xCdInbMEXbN7o41jcdi0JtrDyt7l7yS
         EAzFRTbOuKfNJlmXj+7knjxQiZ/KhZflmBUe4TROXHzp5rhmdnDLA6ng0JcudlJgBpzS
         vbyBrOL/wCys0UR/6KmgOIK6SRnSwZJbROUjoQbNxwD1/QgD8HEsQoO2+VXSmwEU10mR
         EbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229970; x=1739834770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfI8vPIr2esnYWeGD8EUkBJSCcBFm4SEBMUXT1EK2/4=;
        b=f6r30ciXrEPezAIUjHG+hQ/d3q3M4cSwbZV6c1uAzGmdRx8KFcCHP67GiOzdTv2oif
         tKYKfcNiS1UNR57ajlrTuUTKzJHSXwFRBzgKcEN1EAf3G8WOqUTS5WvRQvTbpCkUJgsD
         u1KJzS3lmTZFM9qzeXlY43BiBJMjPbsKYpmMHtUUihWZZivyBiewaQlJ8+AGZcgpLLjw
         Vx5sA1no1RuUDE5hTtofA8fT6O9QuttGwdoJh3zJdo3pRMbUGY3jDadcjwtg/1jq8nNc
         uaPKRryqrf0mR80KBKzl1Sjkieck0y4wbo4Psr/2CHqHFPmjOlCEoXiw0BKcfTR8+fuU
         ZSDQ==
X-Gm-Message-State: AOJu0YwsCPeZd4wdoMRM0ZLY+yjnKgl1zNy5zXwOGWdZewhPsEA15n7Y
	is/WKrZj9vpUXBVadMcz6hkW8CWZVFaYWU8Poid8GOl1k26jNTtwNnTmc1Vy
X-Gm-Gg: ASbGncvB+iM0x/T7o2x5w8aa/IQ0HcQk0ny495QOjZPqOYWUwSajR7PvBz5n6kRSheX
	6RG4a/rdTprnmqjHsDZYTsPtrcO72U0ow2+p5uhGDk+9VlHrl4GL0upoiT0/QPVY/lbbUfJRmQz
	N6CY2Z007tz7UkWs9LNc1lNiEoRLoaQelNv0L5dVUysjxxTKneqvs9KN1RZC5FCGtNvfWhaPhDE
	KG6Vwuw2Q73XxzmQLhIseEvDztafSNEjWgr96myyioWJUDPIkkg2RtDtZ4KfRSt3ZE04w9llew4
	qYqMhw==
X-Google-Smtp-Source: AGHT+IH3YxqQxVBUG1uJuDu84ZvTgyKpPglxeGof0hE9tv42QUlfTckKFjtlbOAn4Fm4AFpmH6g6wA==
X-Received: by 2002:a05:6a20:9d8f:b0:1ed:a6d7:3ac8 with SMTP id adf61e73a8af0-1ee03a21d74mr28931624637.7.1739229969876;
        Mon, 10 Feb 2025 15:26:09 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::8da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad55c04ea47sm1291331a12.4.2025.02.10.15.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:26:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-soupsieve: Add missing rdep on python3-typing-extensions for ptests
Date: Mon, 10 Feb 2025 15:26:07 -0800
Message-ID: <20250210232607.593305-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 23:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115410

Fixes ptest runs
'E   ModuleNotFoundError: No module named '
                      "'typing_extensions'\n"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
index dfcd9f4842..80596f6be8 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
@@ -18,6 +18,7 @@ RDEPENDS:${PN}:append:class-target = " \
 
 RDEPENDS:${PN}-ptest += " \
     python3-beautifulsoup4 \
+    python3-typing-extensions \
 "
 
 BBCLASSEXTEND = "native nativesdk"

