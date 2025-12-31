Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F4DEE6421
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81800.1767167684073455066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1K8rP2f;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae77516so106711595e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167682; x=1767772482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3St2B7oiC4i6HWNd9wch3N1L29772945MX/osYt6aM=;
        b=Y1K8rP2fS82nww1cESy8PaYkzW+UkFkjmNYDaos0KuyD+hwTKkvOOAMbl0xwrQag2F
         cnUvcihKtgUtJRrosZf8kuUXapwT//NSNFzPoLr2Jrb5unWC8t69fQ6SZ+KTVfKN8MNU
         epd7JoDWypQ1FWaGupq4BTz1QKoMZT/dTqEwwV0pEibqIFf/y3wlb5yQnJ/6ZBW5nxC8
         W9hkZ3Ou8iY2bOai0JfWIeNzoJGg1UYsesPPvqMMB/johDgrsWDBealzxw1P2lVUAHYY
         TK3bMfj+/fRX7aTVGp2tDGqiPrzHHjyaiBbHXv5gIzQ9WbD1OrZyKMhfmSj+b8Yys/ZF
         DU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167682; x=1767772482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d3St2B7oiC4i6HWNd9wch3N1L29772945MX/osYt6aM=;
        b=Hu4G3/djdlsfmZ0kJHlJUHRCliZCcpiXCfT394SRnhiGP7IhbYfVXwWq1yeastnNVS
         GS4X0QOk7F9UECBTbDnP/l/Jlyg8pTQumq9y4KZ6mVK5StwzmzqbhuBDJ5zEfND7cHyW
         jFxc/k/FScCWV9P0cOWVm38EWTQKESGjZ3SYuTOIs6rt9/tcAmcoCnF4MK00go94gqeV
         GYCBzTl4nmukhz2iPNXzdTPJxNAq3FK8k4M0C5S5hKpY//uzgPpkLseVmsQ8RqXuB80U
         AkyLinKFwMGk8x4FruvOqpMgglnP2vRgQoY2fYD/BdekYH4t3ZDZZWyXu9ik2t7Jacnb
         h15w==
X-Gm-Message-State: AOJu0YwdUY3FYD6HTeZY512cYv0s04+PtXL0vK6c+uYYnFsUrclUFLl8
	ufQqw+ee7xIgdHhMFXizB4HJ2mKe/hlsokBX/oFIP7pRhEzRpNV/WKbXFO47AA==
X-Gm-Gg: AY/fxX5uZYchv+qZR+uRh4aGQJigDdqvLD5TaxfvnWJc9YhoPUCnLxV0CpHi8M8D/F6
	WzLlsaj0SAUZkxpaM+2akLx10kxLpctUoGcU+MRvmkMSy2Un71GSx75S/vk5qUPdLOX/0mMgg1J
	XfsrTTO2MJ4IpOBCDZ1sGp1fIUHOJ+BWZ6jAR9Gqz3oqWLOC6ryqxgaZF5KMhgF1pN65Ky2rtl1
	JvzwYBhD5DBIiPL030okjevjzs/4/0xORo2qmnaKNsAFXZ+JrztMaW1dtFAr1DAdeGj91eu8Kyb
	5msG/jg3TUAjPiMFIUrhxtmgJxfpzWV7sV+kFVxomKTlTUO1lBGhVyYm2qrZpY/HdaXkkZGY+E+
	FzFrmY4Ut1IS8HZXpoVwwU56eCz/I/0xa0A54eEBSP0mCvKUPK8+jWW9cOch6cEav0872iGxxxx
	nkEF4fC/5P
X-Google-Smtp-Source: AGHT+IFxFXVJs/Ffo82pukLigadyhwCEChzrxIwbcnD7HTa4kKDCt80AI+5tyRYchHjiZlOqwELRPg==
X-Received: by 2002:a05:600c:310e:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d1956eb70mr434427095e9.1.1767167682334;
        Tue, 30 Dec 2025 23:54:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/34] python3-aiohttp: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:09 +0100
Message-ID: <20251231075436.771395-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123047

The related CVEs are tracked using aiohttp:aiohttp CPE, so the default
python:aiohttp CPE doesn't match relevant CVEs.

Set the CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like 'aiohttp';
CVE-2021-21330|aiohttp|aiohttp|||3.7.4|<
CVE-2022-33124|aiohttp|aiohttp|3.8.1|=||
CVE-2023-37276|aiohttp|aiohttp|||3.8.4|<=
CVE-2023-47627|aiohttp|aiohttp|||3.8.6|<
CVE-2023-47641|aiohttp|aiohttp|||3.8.0|<
CVE-2023-49081|aiohttp|aiohttp|||3.9.0|<
CVE-2023-49082|aiohttp|aiohttp|||3.9.0|<
CVE-2024-23334|aiohttp|aiohttp|1.0.5|>=|3.9.2|<
CVE-2024-23829|aiohttp|aiohttp|||3.9.2|<
CVE-2024-27306|aiohttp|aiohttp|||3.9.4|<
CVE-2024-30251|aiohttp|aiohttp|||3.9.4|<
CVE-2024-42367|aiohttp|aiohttp|3.10.0|>=|3.10.2|<
CVE-2024-52303|aiohttp|aiohttp|3.10.6|>=|3.10.11|<
CVE-2024-52304|aiohttp|aiohttp|||3.10.11|<
CVE-2025-53643|aiohttp|aiohttp|||3.12.14|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
index e249f99860..df5d674a3d 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI[sha256sum] = "40176a52c186aefef6eb3cad2cdd30cd06e3afbe88fe8ab2af9c0b90f228daca"
 
+CVE_PRODUCT = "aiohttp"
+
 inherit python_setuptools_build_meta pypi 
 
 DEPENDS = "python3-pkgconfig-native"

