Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C47DE95A81
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63170.1767097498292278893
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CUGAODi4;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432755545fcso2147318f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097496; x=1767702296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twltbS2jKLBlgoYlQ31QdQnPGvZ7qLZBuDcKvb8XXn8=;
        b=CUGAODi4RHIZJgcw+VM+bRye6HcTqtULglulNHXz6xY78XKE4aL9EB+NVfN2u5Kgmw
         wElAVgLBrWLF68TGTQnru+0GhFjcYnyYG9cxlk+sEDSHzd12fh07/f/5EcoCyg3Q6y/1
         olJKBcDJKG9vs+2kQEo5fN2iYbunLv7WgHUNgJzT9TTl+7ooKfFOq8fj4y2NS9s82gCO
         c+Wvgvt/9bGt1wN4YgtYuxA5VNjIOMr/URkOicKk2FTKMAdAUuMMGVe3m5fJzvoIW+ZR
         rruLL0NM38Ixmr0sG7eVIQ7Z8Y3wWzd0e3pXq648CDgkkIsDC/FyPHepRQJPs8I45Oar
         6Zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097496; x=1767702296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=twltbS2jKLBlgoYlQ31QdQnPGvZ7qLZBuDcKvb8XXn8=;
        b=YAtQb8a3dE5Jq6WYeyqlFPHPd1EA4CshmhZk/nI4/OToVwK8UPQGiZCHJXEfdr4r0W
         Z7Or+LZGb5HmkbBAl4PnUoLV7w8ojlgOOJycy4mb5wP12KhtAMxzrBB3DLtlY0IhodmQ
         4WUzKdV1WHAMhRgtuG0VIqa02S4pMDxsyGk1y5NVDry8VwWnHexOUorWH2Bc3H3OZsq6
         WM961rm1KinlD9+ug24r5CqNkVSXg8qx04xyOQUk5ds8lemyYxxkHulDXWnnNft32yni
         tv4KXRPT/s/Oqm3Dflv5hqwCQ5XlYaZsGayMfK/F5XE6NsPPwncxdcfsmKHy8iuPD/C2
         6z4w==
X-Gm-Message-State: AOJu0YyQfTOlvQjqjcwcZ65nvywMtFypzFMLBKBgBbzQvsC5dvaXnunM
	vqwF06AV+JxtbTDJ4lW09HMaVaY1K58v9LxTyrEsHX1UGC3GyX4KQTwtn/Mc/Q==
X-Gm-Gg: AY/fxX5wOz4P3B9B3lcdSGWKnZpikrX8hP7KwF74o1WQzViJA3cG+RZpvcSJXMdcZZf
	ajaRp+FjPDyU0kjRMU2YUyUwx2tA24VbxB6MRqAW4YJ64xuwMqt8Azxm6HB1WAvnhsavjOVizux
	3L2VnzFzn0Jq+tLviGSwIHPQvxQmugtLonE7mNz5kKZnVVUaLBMteCgqEilQtkY5NVM815g2f+Z
	KN6tc0sCKTYhdV1pVeJzqyEl4esmXOBcg2thZQ3TQKhs9ho7hC1K18WeQJYAhN0JSXIQXKMSPTs
	5UKaBKG8TV/3Iw5mYO8OSypLAK57xjdbKyzx7yLOncjMAFWcPa53iTOmXXLE4PdEOPDLb+aWTc6
	f/o69eueXXlNVbQrXGcBjMuKE/VJX33Fs45PGWHIMIMo/j8DBkVSjb9wA0YQMDs0k/V4KSfgHqV
	iBfgLqEwi3
X-Google-Smtp-Source: AGHT+IHQZwbnzS8F9eXRooAY+5iHT5/V8ahkoWEk1+i56yxbYtqelBjoE7fvjVsbHXWTXZEfulMitw==
X-Received: by 2002:a05:6000:250e:b0:431:266:d142 with SMTP id ffacd0b85a97d-4324e4c90b9mr41575045f8f.26.1767097496491;
        Tue, 30 Dec 2025 04:24:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/10] python3-paramiko: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:46 +0100
Message-ID: <20251230122454.721515-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123008

Set correct CVE_PRODUCT for paramiko. The default python:paramiko value
doesn't match CVEs, because the product has its own set of CPEs associated
with CVEs.

See CVE db query:
sqlite> select * from products where PRODUCT = 'paramiko';
CVE-2008-0299|python_software_foundation|paramiko|1.7.1|=||
CVE-2018-1000805|paramiko|paramiko|1.17.6|=||
CVE-2018-1000805|paramiko|paramiko|1.18.5|=||
CVE-2018-1000805|paramiko|paramiko|2.0.8|=||
CVE-2018-1000805|paramiko|paramiko|2.1.5|=||
CVE-2018-1000805|paramiko|paramiko|2.2.3|=||
CVE-2018-1000805|paramiko|paramiko|2.3.2|=||
CVE-2018-1000805|paramiko|paramiko|2.4.1|=||
CVE-2018-7750|paramiko|paramiko|||1.17.6|<
CVE-2018-7750|paramiko|paramiko|1.18.0|>=|1.18.5|<
CVE-2018-7750|paramiko|paramiko|2.0.0|>=|2.0.8|<
CVE-2018-7750|paramiko|paramiko|2.1.0|>=|2.1.5|<
CVE-2018-7750|paramiko|paramiko|2.2.0|>=|2.2.3|<
CVE-2018-7750|paramiko|paramiko|2.3.0|>=|2.3.2|<
CVE-2018-7750|paramiko|paramiko|2.4.0|=||
CVE-2022-24302|paramiko|paramiko|||2.10.1|<
CVE-2023-48795|paramiko|paramiko|||3.4.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
index a69ed72804..daf6386888 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
@@ -18,3 +18,5 @@ RDEPENDS:${PN} += " \
     python3-pynacl \
     python3-unixadmin \
 "
+
+CVE_PRODUCT = "paramiko:paramiko python_software_foundation:paramiko"

