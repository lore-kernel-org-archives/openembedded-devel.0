Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154BCEE6425
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:00 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81879.1767167694726565557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DPT8zFAz;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47a8195e515so64804625e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167693; x=1767772493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WB2KFhNWp/LPVEz2+xehckViFeFFRBsPEGPUKqSHaC8=;
        b=DPT8zFAzIPx79QgZvQhkf3ZFO1fbZ45UIKXBqumMo6h0InWmKbxGPwArlD8InADm1A
         v3SLmR3P2c1vakqFT3BQcaxlA2JIOkq2L+77Jj/yqLxX4Q5NQnoC/Dk4hIxasI438D1J
         YWRQgAyCdKjmC3N5O1jHM2pv7lb+1AtjE+fP9dJcHKPjL6jG55fP2og4umlPuB/V+jx+
         JJx4IQNDeroQcNDsOmMT0+drOtZEOc6XZEb/U/563xqTxRbEZ5V8PgJ1AjIknJc7EsaE
         laqx3clCtuexZ9LjjNYltWDi7MPXuu3g0aG7lHzPcWnGRN8ouadCNc53Du/ifu4uXViS
         arOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167693; x=1767772493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WB2KFhNWp/LPVEz2+xehckViFeFFRBsPEGPUKqSHaC8=;
        b=VOLqQYnoBMRdQycHrqVy+s/Xyw56Z8YTlzukMTZx2DsAGZUbFqKly8gLVSNMbdGzlt
         1QmCuhSn65DxPlstJqqq50UAZFpLhhjCLOZLJBdVoCqA6EWE15CM5Bqd5TXASvrJcZHj
         FMz4HpJwSfKUMtuXL6ASt6VdWe4q7Uu9SHEyl3maZUdT9+vRxgvROJsIR+0Swu0llFfI
         LUp6Br+f/A9UW4pVULffgdb16CgE+ultPsEQcs+74dol3pII3QFTwyV2YyD97iZq+kcu
         qJk86Xe3BT4YVWaqTL2WNRlSMdBB3py6ay2GpMPsStPvYdXruDBwDjbZh2Sp//H+hSaz
         HKTw==
X-Gm-Message-State: AOJu0YyqNSWz9gAXVgaHkMxpL3QqOK3e2KfuBhR4D5CNvII8JllZ2JDo
	Rdm5XFn8ZEhgOKWC0AD4O9CJWxUAu4xkUm0x307S/zWkfP74DK95s8+kUu0+WQ==
X-Gm-Gg: AY/fxX5Go+bMkiwxLWYDf+ITACrjoLoNaeTlXuQjCykt/nsH29woEWxzAQ3WZ1ROIc2
	0PU15A9vt86yEl351GwfPnuOILPhL/t/bqlkLLOzl2TNHB8XQjgIWMYAJcqQe///ZXDBRGGv6eZ
	8DIDqBFcW1g5RGQsJwMGmPxJ7SLyogr56e/1CYPVIgOzaR+54RslFzLg8RVM+60pG03qTVbDV7P
	1Ovbx9XhT2h7NJPdfivee5sC0/NzPWqudxpwpXYVDRb/n5lO9OYG/qOjbtmap/AKntom22CLL+V
	fI8iXy4xPTPKpeSywKQMf80EfQLQ1bk6nWyHOT+REHJnY3a3xoJ7Dfj4TNI99RqZ6zXAXNL2j6+
	uq8b0PsstsxOk20cXGLtQcxALrzdpwJlVFkN1DlJrtK1PBd3mJjk5EZQSNX1Z2OI4H2tY+SDpqO
	giFj/DdnUw
X-Google-Smtp-Source: AGHT+IH5KX8kTLRrDRXAiV6z0x5waQVndEXRY3Kf55XpBFwwvtVY8TJuBUh9B1bAEggJQtIbFg4c+w==
X-Received: by 2002:a05:600c:1d0b:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-47d195498a2mr376604605e9.7.1767167693057;
        Tue, 30 Dec 2025 23:54:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 22/34] python3-priority: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:24 +0100
Message-ID: <20251231075436.771395-22-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123062

Set CVE_PRODUCT to the value that is used to track CVEs for this
recipe in the CVE db.

See CVE db query (priority-software vendor is not relevant):
sqlite> select * from products where product like '%priority%';
CVE-2016-6580|python|python_priority_library|1.0.0|=||
CVE-2016-6580|python|python_priority_library|1.1.0|=||
CVE-2016-6580|python|python_priority_library|1.1.1|=||
CVE-2021-26832|priority-software|priority_enterprise_management_system|8.00|=||
CVE-2022-23172|priority-software|priority|||22.0|<
CVE-2022-23173|priority-software|priority|||22.0|<
CVE-2023-23459|priority-software|priority|||22.1|<
CVE-2023-23460|priority-software|priority|19.1.0.68|=||
CVE-2024-41697|priority-software|priority|||24.0|<
CVE-2024-41698|priority-software|priority|||24.0|<
CVE-2024-41699|priority-software|priority|||24.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python-priority/python3-priority_2.0.0.bb                   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
index 26620a3a39..7a7ec94ca9 100644
--- a/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
+++ b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
 
 SRC_URI[sha256sum] = "c965d54f1b8d0d0b19479db3924c7c36cf672dbf2aec92d43fbdaf4492ba18c0"
 
+CVE_PRODUCT = "python:python_priority_library"
+
 PTEST_PYTEST_DIR = "test"
 inherit pypi setuptools3 ptest-python-pytest
 

