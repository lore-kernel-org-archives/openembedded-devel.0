Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A789EE57EC
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81816.1767167701784530726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MvN3AbUm;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so56998595e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167700; x=1767772500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ign8pzhT3UBV9GxhABqSsezdLJc0BrRjbZPYxye12fY=;
        b=MvN3AbUmlWKpO/xO5p0fMgEWoy5lOVTwSmkwPf5e3RbOQu2X6TDqlm8Epooyuo4t6k
         /dtwccCfy1IsMM5gbRzvF49If0ZSnCJJKB5pXM3w5yS4Q/UdRVB3GeL8xvZ7ns2EoTrJ
         QD3+6EIg6nwXSXvVxBsbdeEyJgeiBHvnmqhirYGUkbr3oVXyJnXYHsvpvZHqg7yMs9Vx
         kB1o2qp8XaxhZH4xPxcZLpPyY18PeM+0yMB4+9DtvJNDlLO3X4dhg821yj9nQejbq0tZ
         7Dk3e68wq+5ZNry4oadLe2icWorG6oWp3/1i6ow4qwnhc/An7qekkWc11z3pV2KYBd9x
         eTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167700; x=1767772500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ign8pzhT3UBV9GxhABqSsezdLJc0BrRjbZPYxye12fY=;
        b=cvl/TERc7EtGe6tA4TnL7GCEUZZdttXkc76lQnZopfpsWme84JuRouMxrOHrvYnRbD
         hWRy7PVNTWiPxboVlDP4R8HsefU81xOhiXVX20HAPAMzCBevdtxQXJreZJFKy5J2vbK4
         f9I142rglefOBI7sL/nMe5jJ49xBWwBRc4Jy2AKRUUDh3a6/us+1pfzlj5K6KvJMeFk7
         5YBMvWwAZPF+DDJClDQlGjEk4592kv2BNd/NWFWViC3E2AhK0a33EuYgHHFoz2PKvvN2
         tFsm4+FyKkQAnIkWiwo6vaRwKu4f6tnzicYz+F0VnyUWqQHoLdDX9X2sLD4IbgBCWF80
         qk1w==
X-Gm-Message-State: AOJu0YylVJrQ5/4jXI7FM8xniOJZy1aywazvRqOrf3U6V/vpUnsBdV57
	N4lOknNIxSKX4+2BTWa/nGkZEFHcb6XaXP/kOnaqFiIQgGi31Q4YJyFtsVBnEQ==
X-Gm-Gg: AY/fxX574NcBk77WHelUz78+l3WpD9XhVNJ9y9ZzKBtjobdaEbtrGnSTQtRc14w1SV7
	/mv6XTCrP386ZmIjreJAUgGpKm/UxLE/2PNqBOPRPu0smOKEAi6tX9U6vEX9/Z1vsEQsoUNHJ0r
	Ab55BU5h+WpTTxFSIVlKrE/5FTi5txctX9dJtBUSggIeLDhC0SOtMFz1FzH0+sTvdVrcADcSiZp
	g4iFTonYPnUi3VOtsY1k4UJGMBtss/ogJcZxzcoOT2ieJYLsjihFXmGJcpVKKT6rtd54bIWPdrP
	xhd9NqIKG96uap38ZVNQ0Q29MSrgknlbvgp9O6kwv1ktzRbRA+W+cpAW+poX2okSzTadkaGa3DP
	4VPP4Z6eQcz6M1IbkqijdjIWxxFqTJ4p4A0htOWp5H6HznU+oSZqVk6TFd40diBzRnrNrYwr50F
	ed3VixmFKm
X-Google-Smtp-Source: AGHT+IEfMywN0RV2v9Nzcyhfx8aLiijgpqN656r7RnWWUJtrEIMgbMYTAgMupsWq5d/ZggKfILjPSw==
X-Received: by 2002:a05:600c:310b:b0:471:1716:11c4 with SMTP id 5b1f17b1804b1-47d1959783amr421056545e9.34.1767167700142;
        Tue, 30 Dec 2025 23:55:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 30/34] python3-ecdsa: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:32 +0100
Message-ID: <20251231075436.771395-30-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123070

Set the correct CVE_PRODUCT value, the default python: ecdsa doesn't
match relevant entries.

The correct values were taken from the CVE db, by checking which CVEs
are relevant.

See CVE db query:
sqlite> select * from products where product like '%ecdsa%';
CVE-2019-14853|python-ecdsa_project|python-ecdsa|||0.13.3|<
CVE-2019-14859|python-ecdsa_project|python-ecdsa|||0.13.3|<
CVE-2020-12607|antonkueltz|fastecdsa|||2.1.2|<
CVE-2021-43568|starkbank|elixir_ecdsa|1.0.0|=||
CVE-2021-43569|starkbank|ecdsa-dotnet|1.3.2|=||
CVE-2021-43570|starkbank|ecdsa-java|1.0.0|=||
CVE-2021-43571|starkbank|ecdsa-node|1.1.2|=||
CVE-2021-43572|starkbank|ecdsa-python|||2.0.1|<
CVE-2022-24884|ecdsautils_project|ecdsautils|||0.4.1|<
CVE-2024-21502|antonkueltz|fastecdsa|||2.3.2|<
CVE-2024-23342|tlsfuzzer|ecdsa|||0.18.0|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
index 4e884b2d74..2025d5e139 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 PYPI_PACKAGE = "ecdsa"
 SRC_URI[sha256sum] = "478cba7b62555866fcb3bb3fe985e06decbdb68ef55713c4e5ab98c57d508e61"
 
+CVE_PRODUCT = "python-ecdsa_project:python-ecdsa tlsfuzzer:ecdsa"
+
 inherit pypi setuptools3 python3native ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \

