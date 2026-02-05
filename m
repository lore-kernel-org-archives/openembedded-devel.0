Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B656E91272
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15262.1770274808912226019
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFPWzAVB;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4807068eacbso4597385e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274807; x=1770879607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVu3UkV/ukG+hvs97x2l4hvdQ8IS0cJvMCg6dDWoIrw=;
        b=SFPWzAVBIwmPLBhIbfz0fvoNqb2sT39vJH2HR372TX2JOBFIXVSSz+SwoO2AoR6Aeg
         FKdtq9PVjKL0bDFdDUiQjihumNJVF/M+g8tfG/KIUSUMwslB0ILsLh5XuFvFNKrBo0h+
         ZfsZmYXBZSIq0v+SHkVeVslieq3RZm4znCK5Y8bqZZwvnHCFPUcMw7PDHgUty0ojLO7m
         r5Ce7wQvCS6KYFkBUPbeklIb4FFZ9hQZpXa4j55A5Fan+KbXbVKrnqDz4IfxUZp6UsdZ
         lvOiex7LWhYES3jlut1WNBvCQa7yBoPYVGmhzIF62luI0/IUtq+uNMcBew2htSlnBiM7
         OIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274807; x=1770879607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SVu3UkV/ukG+hvs97x2l4hvdQ8IS0cJvMCg6dDWoIrw=;
        b=NF0J+t7aGRxe3PtTE8/Q3UL8a37WgGwaZC7tU19gw1p0RUSrWWS/NRWbYh357VkJ4o
         1I4m+LLE4u058v1M6yC/KWCCCRdqVQ3BwFX1u4SaFOm2HZmq9kVy85t2kPTzJvIFuWuz
         jn+733Frj3MNOAH6x6XOcHKGcoX+vAsEeFDUV6zwG6LLlIVmiwb6zvgfKbpO83iPOH72
         bqTdHLpyggTyeWksxXl43qlKbhmmHbP8yAK9x8uLyrgGalF58GH5nYYv69nSU+Is3F+7
         7JhsNkLkGl0jQSQbZaak+x5ozOKAAWCv/FPaOT87ILcPrc1c8pRmK57VqDzXv7xVrsYD
         sH2A==
X-Gm-Message-State: AOJu0YxBzrZRj9nyfhGH5jnVO5clT+qB1KC6bFoQ01zbumZsMai28rBA
	ZPz0/nt4pFWwhhCVyEgy1Onh3vdzlEO9QjhRxUkiT2yTmmod8+HKNMyksPDj7A==
X-Gm-Gg: AZuq6aJI+Y3FNwHap7u1tQPzAenRsz+3ZyNFOWjAqjw/dZu/TD+InRDGHtP2tQ/ASl4
	tcm1xaRth3eJ4enAGhqwGSFPEVhFtvXhCVV6kjzhnjSKJf+3PflLX1YH02aWCvUGHwiPOqtIkYX
	H2fh8p9wFfyexgj60rCw0DXQoKU+PEzFbtMHhA3Q3KipIb7o0lbD/ldBIOzATBr26WWZFhrCJIo
	sIzU73mMDFZmXAzKF5PqCasSMBCY0dwxRI2z6jxypU2ismZH3r3BIxSzzHBBoXjMg3HiobEMpKn
	hsg8a3ph4YswzqulsfzTXNt5XBxjqYLUmhAMNvTNks/jpUw3CAUh29DbtApUlJUZk5NQ0MNWP3y
	3liiiaVk4hiMr6R15CH50DqIDZwL6JPOLqKax3raBSiqhj/043I4chdg//qYjSGSC368hEduKuc
	/A0Iuk6Du2
X-Received: by 2002:a05:600c:820a:b0:480:3338:292d with SMTP id 5b1f17b1804b1-4830e987bb9mr84482955e9.31.1770274807005;
        Wed, 04 Feb 2026 23:00:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 15/20] python3-uvicorn: mark CVE-2020-7694 patched
Date: Thu,  5 Feb 2026 07:59:50 +0100
Message-ID: <20260205065955.1267785-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124191

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-7694

The vulnerability was reported to the project[1], and the commit[2] that
resolved the issue has been part of the project since version 0.11.7.

Mark the CVE as patched due to this.

[1]: https://github.com/Kludex/uvicorn/issues/723
[2]: https://github.com/Kludex/uvicorn/commit/895807f94ea9a8e588605c12076b7d7517cda503

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a5ee234b8cf06b6385a9bf1eb5b60d6171a993c9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb
index b0ce49be97..ee295abf5d 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.38.0.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
 inherit pypi python_hatchling ptest-python-pytest
 
 PYPI_PACKAGE = "uvicorn"
+CVE_STATUS[CVE-2020-7694] = "fixed-version: The vulnerability has been fixed since 0.11.7"
 
 RDEPENDS:${PN} = "\
     python3-click \

