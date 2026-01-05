Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB36C2A072
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 08:32:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60300.1767601925758046922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 00:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZWWUjUUH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775895d69cso58599995e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 00:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767601924; x=1768206724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBG9I42rcrJAE8QgSyyx/Rj8Xs3+mnEdIZBVFbPDyoQ=;
        b=ZWWUjUUH2qeE9ey3+Q8qENWJCf/Tt/Q5eIwUyHKxR7Sl/maz/aMKCR07hNUgPy0UB6
         2VAxk16VnW8VYYK/sglYixpnQxDKlQ0CFMlpdB1mZYojLEWJqyuU7IVggG0qayJQLNTW
         bXYr1bKdXwsD4YacbXOUAGpog9iyf264y7jo/WJ6KdEumG42rKJwNm6QQmhQCk7Lol9b
         Gnj7WI3ppHj34cMG1NbgXtn7iiR482BEff/cNEHvtvx4sSDu+tJ3qlLYA830M7aLkrD6
         xjrpbf6nhxRj94lz55NabKf48S6ExKUfJc7GmzfLc04b5l+av7fN17ZIDBmCxYSIUwnx
         QcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601924; x=1768206724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IBG9I42rcrJAE8QgSyyx/Rj8Xs3+mnEdIZBVFbPDyoQ=;
        b=WkiUUo3nk/ex31sLYuKhjS/03b+IssGlnokRFUTHqPvhf9NumxBwKsD/++iSg4alZi
         fJjF6SVC7rpHtiJuhsLmN+Y1+NiF293IDte3LHG6zbx1ySTc9XjNI0RDHr5BfE8/Knd1
         8VH5dFVR54oEyF/0ot8xC3Z0uBJxIkdOGazVkTBEaIrExzgJesL+UcNCBnMfsIssB4+Z
         NW/lvMt6gEyJVYUfnMqfyQJ6ygrvXp5OsPDHIWpCQey2dlTccAez1O86mncDc2HnchzI
         O69SPziy/XEkEJoh9Uwi+k+QuhF2zyPvytn6gDb8w6JJkfYu3Ds7t+AXNenDj/mIb20+
         fsJw==
X-Gm-Message-State: AOJu0YxnFbyzKUxnMrNU8Ozg5GssPIFGRrfqZaSDOq3NOgv6tYrOtF8T
	gNbRnx2AR4N1cqcUXik7sfEEzJ95VCD8BUnjiiR4qNxFz+B6KJYPVs0IcKFV2A==
X-Gm-Gg: AY/fxX7n99LHTMvdp3o7BuzBPp1piJaCisc3QaaY21VnI0fl/xzFDPqPjiTxFDyKsxo
	MF+8Qz64M3U0LAOCbHsuFwwnC02rcp0lreNdXUIC3sG/oFaRLRxiVbU4cGIiWnL+WSihOG3i8+T
	/uxqyhCPGo6G1z0TnMPUhc4EcvlkC9pOQC6mFecJRF8CR7tBVDv0HwGXROa6kQiVilNeZnTykKo
	ADdAjKFeWDyjTuzyDTTi3NqpXYxoBcB9P4KGycHMbpGWC1df6XTJl1NHKaj5l++omCACxPUMsiV
	8JSu0thXWje2+WW9PBgo5Ruqb8SID6bArFz/Knng2aIaXhFr/J07UmCeTq7tuOz3Cd0IUuIVKPU
	ftkO/jQxa4PpWARHqBvEUbZgQbH577NiAINffPhsmDZH7h3SR84kgPJWhofdxh6nJXYAQOQAREQ
	X1lEHY0uqm
X-Google-Smtp-Source: AGHT+IFVrSI8qcTObR1oObx1oCSb2jhIqgiNESKEj5GrISV4CBbx8CecjoQTQxfN5FO+eB4BPFpfvA==
X-Received: by 2002:a05:600c:45cf:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d1954a550mr610798285e9.12.1767601923977;
        Mon, 05 Jan 2026 00:32:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be53a0csm54867635e9.3.2026.01.05.00.32.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:32:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/5] python3-protobuf: set CVE_PRODUCT
Date: Mon,  5 Jan 2026 09:31:58 +0100
Message-ID: <20260105083201.1225143-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105083201.1225143-1-skandigraun@gmail.com>
References: <20260105083201.1225143-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 08:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123128

From: Peter Marko <peter.marko@siemens.com>

Similarly to c++ protobuf, add products matching historical entries.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ae7556a737f7d21b0e345226fdab4a286d2f85db)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
index 3c25373796..b3846ddeb3 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
@@ -11,6 +11,8 @@ SRC_URI += "file://CVE-2025-4565.patch"
 
 SRC_URI[sha256sum] = "2e3427429c9cffebf259491be0af70189607f365c2f41c7c3764af6f337105f2"
 
+CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
+
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
 CLEANBROKEN = "1"

