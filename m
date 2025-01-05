Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC35E77199
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.48446.1736119443920388930
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZ8/RhgS;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53c9035003so16428123276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119443; x=1736724243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YkqacsNqjRS0q7KICUF23ed8wFeW2WwFv20k4DhJBc=;
        b=PZ8/RhgSiZMayv90WnYtvMn4zwEldEn2H9k2IGGhsepuB8B5NT5Yo9KzUhJNNdSpSZ
         KHKXFrYPvxXQwKcEFglqSQLrUpcFYViwbrBFIKoiIAqNKkQmItugLx2/Zs+KOEGUP274
         YuBAXI7aF4F/oe0JfR6NwOsoz5Pd+Dmbz5pLkuSFezxJ9CLgNfEN1PgT9L/uXkIgw6tz
         k4iYMXETP2c9fQ2yBoEpmIHSp9sV4QwVucygUQacd1uCxx1k79HqkAFqIbrFuUlf/C49
         EvzKKtxtcndougwNTRs6awyt1mnFbi/hqGtjLxrHJjCcIqzwXhOGN2aruiRcqb+Pi+x6
         062w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119443; x=1736724243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YkqacsNqjRS0q7KICUF23ed8wFeW2WwFv20k4DhJBc=;
        b=H47Dny3Ae4lGx/+fZtj/hRxs/skthmzZ/WD8UtAefhHx8r+dZ4+AieIymnEoPxVJwM
         WFKodqgeZXUeTtCnAMxKy3L2icwiuXF4bg/58EksalALQw1TppPhD5O0HkJXRD+bLG5j
         6x1tzQKKSZX15KyqfJVKy61+YNRU7PAFxgtGtnExSbDYGJJpUuCHNFsrhzyGkPwjzjw+
         OwGjFLD5fJzP0LbGufWgmsNvO8G13zvD+DiKi5DI64cRlXegDL6+M/+sG4Qfk81v+Gbm
         TovUh9HQrMsV7L9S29KjKC/mD4BWIKL6jbv3svZv+L38TEReeZnO+udIxYIZkTbTV1JW
         dAxw==
X-Gm-Message-State: AOJu0YyMkWr/T+ZLUWd/5aZOXzyjrYQyZpRqtmDj1Vrx4LgpIz8XYulX
	SGsSKWkA064x0YDyHVZflBltwMU8AW0CWHNG4urw5PBA26JUVohXV8GGpwMC
X-Gm-Gg: ASbGnctn9b5RKcvvlUtAm7EeFfdenEm+xd1hwKFHvSWyxzSJV39rQ5PKifvzkpqiVsX
	YUZUTyJG8e2qBEyQo/boBXn05og88481dujmzUzbGW0IsA5RQnHdpsP/DvnUL4THg5GI3T+Zh0T
	8dGhvbPmBjLpArXZ4FWgBHAs8CcqNLpUliCTSQ10+fsB+1+jz1m6uLgkAP7ZMfAKxd2bcnfrWuH
	9VCfSvSuGNTe6YwXYOVuhiBT79i36TERY61tnPzYqPDZmWKULqk9ugSnRp7fuOI6fXrVw==
X-Google-Smtp-Source: AGHT+IHCh94VmsfDbls9Ok3scY54hxhlYPnde0j7+ctkNGwoiGIb48Gx8OZikKehAqbAY7PKj+AuzA==
X-Received: by 2002:a25:5382:0:b0:e48:7efe:57a5 with SMTP id 3f1490d57ef6-e538c40be00mr31426733276.46.1736119442981;
        Sun, 05 Jan 2025 15:24:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 07/24] dash: set CVE_PRODUCT
Date: Sun,  5 Jan 2025 18:23:40 -0500
Message-ID: <20250105232358.1502946-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114636

From: Peter Marko <peter.marko@siemens.com>

This removes false positive CVE-2024-21485 from cve reports.

$ sqlite3 nvdcve_2-2.db
sqlite> select * from products where product = 'dash';
CVE-2009-0854|dash|dash|0.5.4|=||
CVE-2024-21485|plotly|dash|||2.13.0|<
CVE-2024-21485|plotly|dash|2.14.0|>=|2.15.0|<

Our dash:dash did not reach major version 1 yet.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1427013e01df44b9275908f7605e8e25fc3fd83)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
index 947ef702d7..1bf3625760 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -10,6 +10,8 @@ inherit autotools update-alternatives
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
 SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
 
+CVE_PRODUCT = "dash:dash"
+
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
 ALTERNATIVE:${PN} = "sh"
-- 
2.43.0


