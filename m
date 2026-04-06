Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9699F46C47
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:13:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57249.1775488388136474119
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 08:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QsjxS1kn;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso30429355e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775488386; x=1776093186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk1Vjq0ddhK0/Qq4HN/OIMvPPPSseBA2kvSoxqx/9WQ=;
        b=QsjxS1kn8hyN3IT2UOithfgXasU6LqrCAV8TdeTaYYlcPEVJbhKjK7nueG2TIEdZvf
         Mp5NAsZF8ooo6ybs18y/TsroXiZTMyHaQ+S2KS9YR7XAGDWiqHSOpko93QxQVn7epi3i
         RRK2pCBVoHepe54PtDDZPiTVifS1iYDwDkfdhq/3JlXEk11kFrMkfZj9vuLEsCORus8v
         Sn61hPZ+PjndaJhYCUY9ICYf9pYEhMUjHWd6VUkF6Z6UekSyyA24tm+bAN+7qLCnMEPI
         XsT9QUm69UaUd9iV8d7uds0ll82Iv2uwwpmP+8olGApS8sgWT23yfCIWtaejHyi6BNRf
         0Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775488386; x=1776093186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bk1Vjq0ddhK0/Qq4HN/OIMvPPPSseBA2kvSoxqx/9WQ=;
        b=dzGWYySEs1W9wbliXHWhKMjORSgl+RDpQ0RmV1oBh/16Brhc3vKGxSSjboyOq4gxbO
         BEbtlUDfW4LecnQaEe2069bSD0F2ONzP1qQds4tNUm32ip334YRgvqrGUFdkJKy6lwhQ
         o71I6eAG0SCB+NO8sS7l26radrtupS36eUWns60FZ97imhnzEWqlHddEhekDqZnWbKZO
         9eDkZYn8F3YPzLH0O6D+1TJyHT5StNDMGjYJJbl3orPVWiZHOHSW6sKfWzIcAblOhytN
         L3VK2I2YjrKgfZJXHIKIG00PCTkPgzcMuS9hG6manx5wChTS3syHBX7bV+XfeYyXus4q
         acIQ==
X-Gm-Message-State: AOJu0YxonPC04hQhtMmjuApw3XmzsV4Z+trFQZhHjFnBmshKd6ZZCIeD
	3cHSGNZvDvN+xfv8mAcsDBlwdTJsxh5viinJqZpm3hG/WS28dlia3yM+iznMDQ==
X-Gm-Gg: AeBDievQUBSYQrwipbiNsjKOh0xZ2barz6aBtQ+nfcEtH7euBkFhPVbLxKc1+PSMtS1
	Hhm92DZtMsK2qG0rC1WY70IxQYGiYupwL6XjNnXXiUDJDA0MeVjA7+QTf5yRfbaz9KDJPy+pb5B
	VfWfPkrFu5qEKryrSqPR6ytLUAOWPn4hEBoJ2LjMLKgQQ+G2DbK9ogUltfQ50BoUpqR9JiB2O1Y
	+/+Vj3X7Nn27uSStUQA9esLh8EjXYeBRL7BHnYVyBx9zJZsxRfP42nMucwfDi8fXWSO0PZI0djQ
	yWxrJBn5i4w0OTbWBvz0ZA/EX3jQogUrmiu38vJArx7dgNHG+lS0qvrZKN7T6lu/05XIOwEEGf5
	TUJsWvnm/f3BEgYbpEFXRnPjnesIAeqmvwrIcvxxDLBhbBfDRffQy8kEVuZCk4fJjW0ju4j/TGt
	7Aq6CSdEUBFI32CmU6aHDO
X-Received: by 2002:a05:600c:1d1d:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-4889977600bmr178647085e9.15.1775488386378;
        Mon, 06 Apr 2026 08:13:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b6ff70bcsm92848765e9.14.2026.04.06.08.13.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:13:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/4] python3-aiohttp: mark fixed CVEs are patched
Date: Mon,  6 Apr 2026 17:13:02 +0200
Message-ID: <20260406151303.3640343-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406151303.3640343-1-skandigraun@gmail.com>
References: <20260406151303.3640343-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 15:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126049

All these CVEs have been fixed already, the relevant NVD
reports mention it explicitly that 3.13.4 is fixed, along
with referencing the commit that fixes the respective
vulnerabilities. However each of these are tracked without
version info by NVD -.-

Due to this, mark them explicitly as patched.

Relevant reports:
https://nvd.nist.gov/vuln/detail/CVE-2026-22815
https://nvd.nist.gov/vuln/detail/CVE-2026-34513
https://nvd.nist.gov/vuln/detail/CVE-2026-34514
https://nvd.nist.gov/vuln/detail/CVE-2026-34515
https://nvd.nist.gov/vuln/detail/CVE-2026-34516
https://nvd.nist.gov/vuln/detail/CVE-2026-34517
https://nvd.nist.gov/vuln/detail/CVE-2026-34518
https://nvd.nist.gov/vuln/detail/CVE-2026-34519
https://nvd.nist.gov/vuln/detail/CVE-2026-34520
https://nvd.nist.gov/vuln/detail/CVE-2026-34525

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-aiohttp_3.13.5.bb        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 7e6f80102b..f3a0fbf557 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -7,6 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 SRC_URI[sha256sum] = "9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209dbb7d1"
 
 CVE_PRODUCT = "aiohttp"
+CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
+CVE_AIOHTTP_FIX_3_13_4[status] = "fixed-version: fixed in 3.13.4"
+CVE_AIOHTTP_FIX_3_13_4 = "CVE-2026-22815 CVE-2026-34513 CVE-2026-34514 \
+CVE-2026-34515 CVE-2026-34516 CVE-2026-34517 CVE-2026-34518 CVE-2026-34519 \
+CVE-2026-34520 CVE-2026-34525"
 
 inherit python_setuptools_build_meta pypi 
 

