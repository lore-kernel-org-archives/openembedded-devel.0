Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE6FEE57D9
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81869.1767167686535686217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ma09Yp5n;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so56997785e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167685; x=1767772485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNKnbyurPxZl44wcFGBlwj9rtKokMwPcrDluej0WCu0=;
        b=Ma09Yp5nrlwek4FYxeyqB+GdyPToSEH5sDafgy84N0DfJJbSFcyZ5KQ9DtJTIQVXNz
         4eLPc/IwV+w4dIGUgVROSOL0/GC8MJoVMfmVs+OiUvJu3GA1ZlfYZKOfSc5JGIJwGGV3
         7UgSDhVuP0LXERY6NdogqBbHYu4hc4E5tplP/TKd28SWIw2eMHa2xxd5CNnHEm1WRF3N
         PreUpXvsMWMBT/rDePDEvH/hHSLwFAwHEw71H0P8gsd5Fut096fpPZPFSWd0gFXSTROe
         Nxr0VlQOwjGuHXwWII/cScdBjgwaeEikaSWHKBBM2vSvEHG4plX+MYrtr1sPQ/iJAPZU
         zZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167685; x=1767772485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eNKnbyurPxZl44wcFGBlwj9rtKokMwPcrDluej0WCu0=;
        b=KySr5dBnQ70hxAOCSZsNDLenVCZNoa+1g6u2GpVx2GhUdwI9rTuL5sEcDwrA94qnG9
         0h/Vrc/MOA4HhdYX8z/FvpnZGWyuyIuLtRprMioADxIqV/DhYhmOBdBfePhSsBpQix60
         yQ19KGQ8fEMU8mJOQ9inWYr1g9T34zwd/Z7BSg3qnFz2FAzIjKcbQZeSrjNUzS04pBxf
         eJAwTNfsPSPmMejPq8Gp88HxMTf/qW9zb417HmR2Gttl0tZlcFhgfFg8wGpw2rKwYEth
         tkY+5317Iy6zpmDzK2G9X+mx7amWxub8ajtgwSDhmGQ7+0an4YhJPF/PR+76Pqe/AFLK
         QfkA==
X-Gm-Message-State: AOJu0YxlIQL0oYhHHWoGGgt+1wZIWofctpd7jBevPKCoXZK6vj5uCbKz
	iNSqB8COR/cDwV6KxHeHJdwW7DEQQodR5h+Bc0EMXbdTWy66Q0+OhtniMLinsQ==
X-Gm-Gg: AY/fxX41bA4Tqdw7zkIyp0wcuMut9CHdDVc9UAJEa9gDy7zdIr5li1SjWRXzFVDfumK
	pnTkFjZgN8oBmcXva27bjfsyXisnfpxi0XK59V6oVfs0qG6Wr6kQR3weB4OGQj0P4WGN1X7JQ6o
	sRWVGIWlAWJFQbRflgBmIAn+akjV7VpyDeSU4RhRertzQSciyBbyhcNa9MKjbvWO7Ckj8vMf3C3
	ZOCZl6L2VNKk7z4Hh5Vp/Cv2Ll6VVmTaRlsEslbbii75oErQR5yYSNHUt3jllo2P1qCFphq09aS
	H7eBgP1ki5ptaz+I6YKVGnMLlsmS1hhTH+eWXq+jFWm9qxc9g34rHwGd/8sCPUh7o6+4mpXBBy2
	DYRtbRVn34IiRd1OyHsZN51RuLy0VK/FRvgCcRYdL1K60/b6NqA2l1oD2jNZN4ODvL+df9xDJJS
	LoY5IjgVkn
X-Google-Smtp-Source: AGHT+IG0BZCS9ac9f98JYjldgXfvMYyZdxhySS4FxP1ULxzndgkE4oR0uxdwFN0Svy8QoQyOvwNvAA==
X-Received: by 2002:a05:600c:c0d2:20b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-47d1c4d78b4mr283331305e9.14.1767167684768;
        Tue, 30 Dec 2025 23:54:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/34] python3-pikepdf: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:13 +0100
Message-ID: <20251231075436.771395-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123051

The relevant CVEs are tracked with pikepdf_project:pikepdf CPE,
and the default python:pikepdf doesn't match CVEs.
Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like 'pikepdf';
CVE-2021-29421|pikepdf_project|pikepdf|1.3.0|>=|2.9.2|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
index f047969033..28983417f0 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
@@ -9,6 +9,8 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "pikepdf"
 
+CVE_PRODUCT = "pikepdf"
+
 DEPENDS += " \
 	python3-pybind11-native \
 	qpdf \

