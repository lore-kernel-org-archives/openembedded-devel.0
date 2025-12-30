Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577F0E95A89
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63151.1767097502889303319
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clA29VgK;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb2314f52so5537772f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097501; x=1767702301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqltlZ/FDJgeEH/I4Dgv23cyg8gjkm0zqAVstbeEJ0s=;
        b=clA29VgKyNatBh9/yQ8lqCvfGHTAUGa/1xtflo9mP+hBz1IkQWlURgU6hucKwfpJJD
         V/OTEjTGg/bGqAFBwIuLOgsalduc/stwE11qTsUyrJUeMsDPN6wP4O3WXAa585SqmW7r
         YvhPGW3pzb3pPCInoshS2NYc+wTdCAOfCFlIKTtdziYqp7fBR6cow+4YJkEGjU4Lhb4z
         HCNyRm5t4d6obHDNpcz5teYa/7NjofRBdQC0JaxpgTecZUbs3ZinVoLr+Y8wUheIuh6h
         FSAknh3qfZWyMY2mCktOzVEpaw6UpcVciR8qpMwKsdghV3CzgyDjyeBa88YiXthmE9NI
         WvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097501; x=1767702301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sqltlZ/FDJgeEH/I4Dgv23cyg8gjkm0zqAVstbeEJ0s=;
        b=wMFsSYME7JSLvt5OttZZIK5lJGEJWiTOlMlzP5DE2b3N2/pnwlW+rBE7Tc2HTN49mp
         PxX89qRADjdTGXeJaSAjMu1LbsuPjgCBhVypoTeDHXhQak3fjGDfSMOrEGO1kNG3RyZi
         xQbKNZn+vDYFLZ6IwvLoWRpYbzZNGEvJ2DWpuQq6Cewvaw/INNu2XgNWmJmOsyyzoMgy
         GMR34iEmibSE01TlshNw1OvzEQ08/GVtNqvo8V9MeUKWDwq9jzp3h84X2nZAs7X2fIhF
         OrBeGVnCY7lisv0cnTof9UUCIwqfLUmwkAf5yB8c7wJM7SrKUkn04Jw/CUrye1gxw/Dq
         iH5A==
X-Gm-Message-State: AOJu0YwipmSthWxo+zjtNOBGqRAcNC5de7No7Mz5KIHLk7VRmsqK1vSu
	cRRDjH+Zo2/4t1XKK5f7Guux28P4JBZ4UekQSHvUtifKroBguqm4Uy8e/4EdiQ==
X-Gm-Gg: AY/fxX49JcVTBOSAGMWTJMLzyVKU0camMVUAs5HykqM4R7jORsBguFecDnZMLE6Kxlo
	RypESlP9hFfl3XN0V46wJ+rpvxa+2i2+kIdYB2rIcSc51Pq2BmQg8DRQnMoZprlrXNZcqBbfuv+
	npjcoXgGWwNVL/H3kzyHvEZyQid0adzR1PaDMwKJUeAtaluiLOPaHdMUQSsrpuQKKAgI8MS7qYx
	HU4NNdZh0oozpFTDOxJtEK603s7P8THX86PGzRQc306KLgYw/Tubveb1r2b3KNaNwV1z9gAUmIK
	xUrLytlHJn1buKifytX5fXRC9TH42rFNEEI3z766OJaE6HKhV5elvBg7w3LVbJDBNgjTeYfeEn+
	YoZzgRODS7onQ9rs0/maysVkIyNvBiWWU6Y6guSWHNuHgGWv3FeaF0izJ2x9LVpBqpGj69O7fOC
	yFHC/uRBvP0SnzfpHnEIs=
X-Google-Smtp-Source: AGHT+IHNYnZtjQVl1pAJxCZRMfUm1G09T4bmgREMBC2npSIOv8DYThLQVi+ANZaFF4ytpNYS+HqhDg==
X-Received: by 2002:a05:6000:2203:b0:430:8583:d182 with SMTP id ffacd0b85a97d-4324e5015d9mr43478646f8f.29.1767097501133;
        Tue, 30 Dec 2025 04:25:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.25.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:25:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/10] python3-virtualenv: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:53 +0100
Message-ID: <20251230122454.721515-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123015

There are relevant CVEs tracked under two different CPEs:
python:virtualenv (the default in OE), and virtualenv:virtualenv (these were missed).

See CVE db query:
sqlite> select * from products where PRODUCT = 'virtualenv';
CVE-2011-4617|python|virtualenv|||1.4.9|<=
CVE-2011-4617|python|virtualenv|0.8|=||
CVE-2011-4617|python|virtualenv|0.8.1|=||
CVE-2011-4617|python|virtualenv|0.8.2|=||
CVE-2011-4617|python|virtualenv|0.8.3|=||
CVE-2011-4617|python|virtualenv|0.8.4|=||
CVE-2011-4617|python|virtualenv|0.9|=||
CVE-2011-4617|python|virtualenv|0.9.1|=||
CVE-2011-4617|python|virtualenv|0.9.2|=||
CVE-2011-4617|python|virtualenv|1.0|=||
CVE-2011-4617|python|virtualenv|1.1|=||
CVE-2011-4617|python|virtualenv|1.1.1|=||
CVE-2011-4617|python|virtualenv|1.2|=||
CVE-2011-4617|python|virtualenv|1.3|=||
CVE-2011-4617|python|virtualenv|1.3.1|=||
CVE-2011-4617|python|virtualenv|1.3.2|=||
CVE-2011-4617|python|virtualenv|1.3.3|=||
CVE-2011-4617|python|virtualenv|1.3.4|=||
CVE-2011-4617|python|virtualenv|1.4|=||
CVE-2011-4617|python|virtualenv|1.4.1|=||
CVE-2011-4617|python|virtualenv|1.4.2|=||
CVE-2011-4617|python|virtualenv|1.4.3|=||
CVE-2011-4617|python|virtualenv|1.4.4|=||
CVE-2011-4617|python|virtualenv|1.4.5|=||
CVE-2011-4617|python|virtualenv|1.4.6|=||
CVE-2011-4617|python|virtualenv|1.4.7|=||
CVE-2011-4617|python|virtualenv|1.4.8|=||
CVE-2013-5123|virtualenv|virtualenv|12.0.7|=||
CVE-2024-53899|virtualenv|virtualenv|||20.26.6|<

Set the CVE_PRODUCT so both are matched.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-virtualenv_20.35.4.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
index 28444f12c4..0c50a35be9 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
@@ -24,3 +24,5 @@ RDEPENDS:${PN} += " \
     python3-modules \
     python3-platformdirs \
 "
+
+CVE_PRODUCT = "virtualenv"

