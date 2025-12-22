Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65249E6ADC7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:27:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88049.1766435257718875630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k7/+M5iN;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so2868920f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 12:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766435256; x=1767040056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmJenmKO9WJo+4GSrf1cjXhKo/Q2YlHOJFPJmKs4Vuo=;
        b=k7/+M5iNqcwxbQuafKOOOuUHQJlIVsdCWrkkp0kvQmsKb8VVBimxP3/m2ou9BxU86X
         CBQskrRDjeIrMEWtWC5FhB0M7UkBrzzTt8akU9NeplqWPGP509Qb+iQ4We4tSQHfMuxs
         10pp65NhdJ+Lez3HBN/DWS0ple0J4O9+/gtlJBubZnJF73qpk+IAASXXkF5GHtJccsRh
         1tbcBhGnoWnG99W4SA8NnIbVa4b2+d8pR/X2T2azNYZUH2xMwfWKJ2+q3cLLIzdCkPMn
         Rb6QnZDPYtKnvfQbh1kvfLg3UKS27SceQF28zD7xyrVA+nFs4zRkplTMTaLKg7UNdIGC
         H4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766435256; x=1767040056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmJenmKO9WJo+4GSrf1cjXhKo/Q2YlHOJFPJmKs4Vuo=;
        b=G9nsNrYDusRVjwnkf9rT3G17fKNj3+sQaIPE2h1WIUYZScgWurQyoHJl2jPJ9conF9
         XDpmMzPUynZJajZxPyakREcRbQdJTMXHLupuaI977oTQokh0Vrj48LDx1RxK5fguvaYr
         5/wDt1m1ibUa8GnN8J34pi8B2p/2OLocA8tKlIwhF3bK8lfwzh7AV8Ibke3/BNayE88H
         PmsDjVdObGLFrQOTEaYhiN3t0OHsdERgqy+1shR9aeyHAWX3/nPe/MeU4x4wJXK1obnp
         b0bnHWD9X5BP0KNzK1+iJrWXHE4UpmSpYCDXO3HhEfMUg9l/JHKmNnzU5TdLpYRU/4FB
         I83Q==
X-Gm-Message-State: AOJu0YxuCke9W6ChJueWaSoRwusdt5HqwRWUWLlMEhj74NbB3t5I196Z
	eDsBJv8SC3hWV6XS+GwXmuMadHKfjDsqPll8wKl9opzyeIi1XftXNLMPNUoeWg==
X-Gm-Gg: AY/fxX6sdKAU9hmjZbcNVFg4Vexpqtd2kC+X64B5bvjq3mon30DjPK7TKvoAKAdFIyc
	5TDTDzbErjiRxHNts/Z8tqGmJ/s0eJaFMt83l0qc7Mi0jBZdBkgFtFxHghHBChavCZ1/teDzHXK
	Z/2eD9CqQ1gkZeYm+c1/MlJnwsGPBTBjp6T6u+kHbVXYovPRmRdl+AFaMXPgvYlbS4QC4fgSb/W
	Vg4u6ASml3v1QeWHuUxodh/JQTXPilIF0A0XSADSxJVIgSr9lc39WbAPJ5laGlQ0+WkYrdV/wNZ
	bUn078t45xPMcHOCrD4WP0sZNCAC8at7Ok5oSeTC+di5Dvd40uGn/W+IUBPHrFHf2wwmD40n4kJ
	NopXTZbU+5p7kvVufy6pdTdF2riBHKC6SpSlWhrOGOoaTZt45/Jp7Q8O/TfF7w2Eb9huY7whSvv
	GgSfH25qTshmGLXG1RVFM=
X-Google-Smtp-Source: AGHT+IHMfPzaK056zoVhGFjdzd8huQxaTIczAeFIc6DxO6ihao5jen36rGqwTKI6G0o/zQQl/AzQug==
X-Received: by 2002:a05:6000:22c8:b0:431:a16:5533 with SMTP id ffacd0b85a97d-4324e4faa32mr14628165f8f.31.1766435255830;
        Mon, 22 Dec 2025 12:27:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm24204522f8f.38.2025.12.22.12.27.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:27:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 1/5] accountservice: ignore CVE-2023-3297
Date: Mon, 22 Dec 2025 21:27:28 +0100
Message-ID: <20251222202732.3363914-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 20:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122807

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3297

The vulnerability is triggered by a patch added by Ubuntu, and the vulnerable patch is
not present in the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 071a45c9d76c9a222c8fbaa50089a8af44f44e74)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/accountsservice/accountsservice_22.08.8.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb
index 439958c7d2..d63e3bd34c 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.bb
@@ -30,3 +30,5 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
 "
+
+CVE_STATUS[CVE-2023-3297] = "not-applicable-platform: The vulnerability is Ubuntu specific"

