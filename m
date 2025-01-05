Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054EEE77199
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.48495.1736119454088460298
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Au5gXE+Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e549be93d5eso2830104276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119453; x=1736724253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fe6zycykDEG3EIkVItNWvT5Cf5OOnAUo2sfgNGsmNBE=;
        b=Au5gXE+QFmqZrlaL5gZUun2WLuQriSTpt596qcUwRrUFhMQLLKXkWybw5NgbDrCR5F
         vua8Ap7idbxtHO4Df55saY5CaFX4iTbYWwjqtY72oWo5x2CbcGMDC5kBe3gSCM2AdnoI
         iNHz/cEMJSbvMeSoFKQiMvEiS2Pzwae9b+a4CetQgsZJ0FsbXh2xZn5O3btlyw4GSuWx
         0N1NBoe9tX8NoX0QmAQzC58pfnRVlaIS2Rxlos3vodXspcYjU0ixTYb1s+/3NQADUaBv
         Kzk2XkZ4/5Q4fR4oSkgxhsJkoj32IF3eHPUyoasDSaScgw7GdA/ArGPM4bv0PuyXR8tu
         8w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119453; x=1736724253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fe6zycykDEG3EIkVItNWvT5Cf5OOnAUo2sfgNGsmNBE=;
        b=f+OiBadAys4A5ect4bDjWxnwt0wVlkiy4D0fuQQ5e4xgbMbU6gKdzk+pf2FIX799e9
         nwhNkOckJhTHeU8PtssE91nM7MeKMRkB2xxTV3KpGHdtLe/uiMJ4tRldFwpk/6mz7YCu
         bOHPEhZ49nhP3b4Ic0JMqxCSiRI2D5SewEdMwTUpkpI3ovcPWHPr1+3edU8VnsMCnfLg
         AerJ5D//+dZ9NRWZrjHygYSyQsKq4zQH0WR9WMTxlvZ1QvhZ/5ZwkLVga4Nrb7ow1f5V
         WrPJmkIGPDq3ifnXqDTAhFXfW10cE8nsnY3apUzQK/D9XhPL/QYkIchOxaRCYNIWY9xb
         39vg==
X-Gm-Message-State: AOJu0Yz+okpQ5++w+FvCMmIpzc+fLi9EBeJWzjLoHlD9CiVaoOz7RysJ
	uhYnnYpmCoL5md7dK9PiYlQah/b8cPJDegm2AVb/hUG4o0SjL0VDeRwP6QgO
X-Gm-Gg: ASbGnct9deI0YFHYyuyT3ewVif5EbOnrDYmZMRESvR/38T9tmDM8ihely/FCw1VcqYB
	0Z6uLFQlYrXCMURZS2tSVp0ohA5gZudiLTR7yAmSXZiBU/NEQDrt3mcPjYlDn5gQxzUMbAWT61p
	m126Ffe1L+YJ1+hnpSg6sS4+Svf5aG09SaYJRVVs3xO9iMXxWYqrUesJ+EJvjewysYOwEMWegmA
	kpmqrkM7lSn7RYUSCfBe0oj1AktCYaYtNGc92XK2yj45vVABSOugp0P2fWoGSkxnlDFyA==
X-Google-Smtp-Source: AGHT+IFGQBZUMKexXXUY36eiGoAeJ/o6ZYmRMUEzGFPew618Fc5ChiOwBR2udReFPK2V1NXtGlV7gw==
X-Received: by 2002:a05:6902:120a:b0:e4e:551e:fce9 with SMTP id 3f1490d57ef6-e538c3fca98mr42084872276.47.1736119453246;
        Sun, 05 Jan 2025 15:24:13 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 21/24] emlog: set CVE_PRODUCT
Date: Sun,  5 Jan 2025 18:23:54 -0500
Message-ID: <20250105232358.1502946-21-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114651

From: Peter Marko <peter.marko@siemens.com>

This will remove false-positive CVE-2024-50655 from reports.
There are different emlog components from other vendors around.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8d45d909315f5c784234261bb3e97d2e1f0a102)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
-- 
2.43.0


