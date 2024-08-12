Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8138EC52D7D
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 14:50:15 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.48253.1723474212552909264
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 07:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QZvVD7t4;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5b9d48d1456so513700a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723474211; x=1724079011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJrifgaxe2yLSOAmNk/arIvSwNwiNS27WOctItoNuv0=;
        b=QZvVD7t46LisuT2vI8QEZ7jQYpXaSdbTCmaqYTLyvQnxWgbKuMThpvVwqtRg8ppLsq
         y7H/C/OPVVXSH0zxR4t4OiVKj4tWupU/eUJqQkmLKFhAS2+wbNNgQjeLVtWBZwfcFks8
         nT+1r2DoA4kRjslNuS+Na9iYGZUXQWEUCOyUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723474211; x=1724079011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJrifgaxe2yLSOAmNk/arIvSwNwiNS27WOctItoNuv0=;
        b=c+S/b2LyA4wMPoIM+r9DxFVJySoHXvzwAiL/hDHP4WfPZ/kfmLADKV1teZ4sPIcm0F
         hwApIWs1MqrZsV9u90XmcbcDAf+3oDH6jrcE9X3bJ5oxDip0mWwdur6CNiwrEGfjoC5X
         WD2YKZqJ+Jb/3GRjHlsGh5bIhopqLM7hch+C7TTPRJGXwTTmVcgOnMAE476nDQZrt43K
         R1BqGjgSTX36VqW67mltNpxKSJYWZSqofJ1kNLGKBsC5FUUPXbVt610YacgcRebuOoZR
         G9SnJ10iqLeHRqy7+Q0sz3OsyvQPLkHDGDpKF0mRz/59E8GsclSfXadeUi9ikMTnGw6C
         pf8w==
X-Gm-Message-State: AOJu0YxfBeTRKoDTUoOFxGcNjWVR7LQVVz3IviBkf1b8YZU72CiXd/kr
	HSUbt5RxQp8yDgPRfpnJCSAVALXR7mC62CJQVsdfu8Weo708YJVg+s5Sz4APSMJieQZkJj2OgdG
	O
X-Google-Smtp-Source: AGHT+IHV7lfDD6HTgvd1GeChYlGS1DyINmQWFOSesws6gbWwoXSWQXDS7Q9gA8OURSibRpmd/5L6mQ==
X-Received: by 2002:a05:6402:51c8:b0:5b4:ec9d:d66a with SMTP id 4fb4d7f45d1cf-5bd450fb469mr302313a12.15.1723474210529;
        Mon, 12 Aug 2024 07:50:10 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f29d0sm2176676a12.2.2024.08.12.07.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 07:50:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-prettytable: Upgrade 3.10.2 -> 3.11.0
Date: Mon, 12 Aug 2024 17:50:06 +0300
Message-Id: <20240812145008.3210575-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 14:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111770

Upgrade to release 3.11.0:

- Attest build provenance of artifacts
- Add field selection to CSV and JSON outputs
- Add options to disable escaping HTML tables

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-prettytable_3.10.2.bb => python3-prettytable_3.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.10.2.bb => python3-prettytable_3.11.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.10.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.11.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.10.2.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.11.0.bb
index 519b58d20..df11141a5 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
 
-SRC_URI[sha256sum] = "29ec6c34260191d42cd4928c28d56adec360ac2b1208a26c7e4f14b90cc8bc84"
+SRC_URI[sha256sum] = "7e23ca1e68bbfd06ba8de98bf553bf3493264c96d5e8a615c0471025deeba722"
 SRC_URI += " \
 	file://run-ptest \
 "
-- 
2.39.2


