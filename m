Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1F6EE57DB
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81866.1767167681636629947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hhvn8RJM;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so77326085e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167680; x=1767772480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+MR6FfbRJzGMLmOLU82ARapZae5QMTWMbz3Q21ftuw=;
        b=Hhvn8RJMWRjrkc6KnSmWYo2CEsvi0dPjNG8abyxhPZPZvVf8CRCzmxxYRMUcU7IH9d
         loW/tDSHVZzTi1hV6lrD5qqdqNws/3+1MQVuYTN7vamSIGT4z+r2dwTUv5rFU+XPGaRp
         Yu2YPDNyU26fVLuJ8m/m4anHQfMOw2c9NlrauoGJrRsYzVW30Mj8o3mEsTgrw4cJMfua
         cDha5KLRCEn99yw424JVeE7lnp1xRO7W4nDrEXVSo7sQ6B3Z8/UjJPaGWgUkta1t2oQs
         23f9DMzxXfnHmIJMnKkazrapOvkch1UFIBhZPnVTUQ2++Uq2W7dCnJ0IkIy9ur7GeFYn
         pYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167680; x=1767772480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+MR6FfbRJzGMLmOLU82ARapZae5QMTWMbz3Q21ftuw=;
        b=SX/7PaDC/g1BpJLsRy4UjYFbVzR5LHlA1wH70QHmwrLLOID+Yx0ldEMutfW8+r++n/
         BH0ciXisZftseotOWec2oBpQuhbo1dx09TTu308rJaOdOqOLJcP8o/pvE++B/0SPenIQ
         TwqlST6XEjC8Bd3kLacFjMAt4OMFQ/qR71IAZiQOYlESdgc4PKkgubW4YPec4BrcZojg
         iBp/k2sdrQnLIgUcmvoxCG1brQjS8raN9m2uDR8sqDblp2jiHhgGSqBjNM2V3At7wldf
         Zzl3YD4DmVN2/DDKA+zXl4PRGWlg8MtrJrIn+csn5OUyCCHrSDjyHOA2aHt4iCSBkpoJ
         Q0UA==
X-Gm-Message-State: AOJu0Yw1aIyvM0DWmokAN2ctVvD56xaXvEH7qw0STBdyI/fY6zVp2ijK
	U///pJ63M1oIh/GbAEwPoPVABNXimEThIyuYIul3qJUrqcl6e+KEqk8r8fBQHw==
X-Gm-Gg: AY/fxX5JcmIU50lBK+6VE072QOCNUoGMl/cR9lqpU8mAx3YRedPZ/yvanSOiS21X6WH
	ZoZFlYHHi5JOlk7qV+bs5NcnnOPIGl8ukEHrN0AAEieItQ1gKE7GP/4oDB1EntsXoqT1ze6DvJZ
	Npy4fNN1hKaIGD1KpFIoywE+7ug1rRkhywiKlUk0FJsPJ6VHO0lHkQzC2QQ9zHFr+PrD2OdZJAQ
	HdjApv9UPs9bGH6VLv+i5Q4f6uRPrG52oItB1WnX0o8S78NW9X29m/0zD5xnedpH0hb+acXtdqp
	HKiX6IvhX0EPtERfR1+JY8ZwSo+6tYO7r4qQIQlELIRgGxTPqcCZovmLCMLcXWVd9h0t1jJcDLw
	lmilvKHiU4SqHHYrLeI+6AauiLjrht2avj2Yy2iN/mWQZzA+LvQUuqHeqmZy6kBrFVNqqtHlZ0G
	qZ7FHkJK5F4elRuh+v2Tc=
X-Google-Smtp-Source: AGHT+IHdUhZW/Ictjwr3agXjrjS4I8fOv59Ub0ugPz6ifV3XOg5SeyPd3ZNz4+nRrFPwAT7CPLCedA==
X-Received: by 2002:a05:600d:4453:10b0:47d:2093:649f with SMTP id 5b1f17b1804b1-47d2093660fmr283989935e9.8.1767167679890;
        Tue, 30 Dec 2025 23:54:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/34] python3-py: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:05 +0100
Message-ID: <20251231075436.771395-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123043

The related CVEs are tracked using pytest:py CPE, so set the CVE_PRODUCT
accordingly instead of the default python:py.

See CVE db query:
sqlite> select * from products where product like 'py';
CVE-2020-29651|pytest|py|||1.9.0|<=
CVE-2022-42969|pytest|py|||1.11.0|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
index e0ef71df83..143f7ec555 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
+CVE_PRODUCT = "py"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta

