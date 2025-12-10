Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62CBD3C53C
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:39:42 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14723.1765370382230194696
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5gN2+57;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29555415c5fso78177035ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765370381; x=1765975181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgjA4SgIkHRl3RXUEs+JHPNu+vF4ojJ3t3/K48aKfZ0=;
        b=b5gN2+57mwMIzKQTRR4q+rPq/5UtyAdv6DPmf7FKUEfO7hLU60j1nWOAAqcfY7usEA
         lcC3mX1ISfFvwKG91PtXJvldfhxyIiWuaBk7MRqk79C5hCfZrR6y/hVOvOuho6mqkKwi
         UIF1Stw/FBMrgDlpncacjO3zYkm1JyVe+W84JX35dgwRmt3RrLZX9w6nA1l7jfiBZ/bD
         4ch+8Md9CWIA6oYq4r0lTsoPDK79shIbFzoD9WQBAiZIpHZyp4W0YzuH2d3aDXS/9zux
         LUdwrC77Lrup1Xi7iC8H/tehg7xw+yebZl3qMULZRpYXjE60/HTkMyKWhsBSblxsJ2dX
         adyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370381; x=1765975181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgjA4SgIkHRl3RXUEs+JHPNu+vF4ojJ3t3/K48aKfZ0=;
        b=I2PhdgFIaEfgeESbjHuhhqWqUmg6j4/mwOOBq9B+0zOMa4QI/X8c/C1VM2sphWYkoC
         vsc+aIti7npOCu348y62D6WEq3dDvfGOnLgWiU87IwIcPS50w07aFf0phlE10A74WOoU
         ZuajyDJ+8x1kwn+amkCHvYsMVxi7q3V9ZicOvIFglczpA63ag9CKVcr5L+1wqbQGuKYG
         HUECwZAy9K2lRwh4EwNOadYkZfN0Ryo2i3YQcI1fqfBHFYFdLc/FKuyVI/9pa1tmSXxC
         d3QtL5UMK6mSIWhtA0A4xJqtsFTBcmrWHgVLJUNoT8dp8Xdqd/VJa/LowUaxvH103GxH
         oOnQ==
X-Gm-Message-State: AOJu0YwJAJUStUtipAZdVsT/U1htxV8uJY1TA9H6dIhujnk3hlB8GZhm
	B0G3EMFg465Te9saOWKs4o3igQkVYf9vjy5FqhTvW6EEv5e+MhLXJRzLa0/KWw==
X-Gm-Gg: AY/fxX6mBNEBQjinLQcA97EEETwZ2IyKn/r3gpGyKSCD0vMdQibxfNIdX8+XKYSFSi8
	YiZvxq7v9w7pmPigns2y7vwdIzTNhKbnQOanKpb0UQ1PmipDMqydQFJCUxd5IPCrDyqsTVxnCzI
	tNLb8vpDphlaZC3dHAE7rvDK+qYkaXmeCYRCZookoS9fVpE10kUkLbdKS6Oqwu4d8cMdcUefcFz
	BT3H3IeqnD7TM5RtXfoaQ//mBvgfE2EDxt0TLqy/CdKNszbLAjkhcIZh7GyuH1cOUjr83zmCMQc
	jjPG3QGVrT/o2X5WlcEvbxhLbPh5CA4gatKAwnzHJsbtmBTa/4KNsbLwOVX7En+sMKPnnIP59X+
	1C31A6OKT0+E3k2RRd3pjDRZ7bPawrpdEYUQkVYu70MwMSqiSkOrmtZu01wnteHLMs1d4SHmPO9
	qYu+QCNmI6ncVoNp81V0hLcg==
X-Google-Smtp-Source: AGHT+IFVZYCqZ1zhW8rkD4brbCr0yw2gI0P8SIVwDL1i9wvFR53CDpTzS6KvI7g03WLuQSt2A4zMgg==
X-Received: by 2002:a17:903:ac7:b0:29e:a287:99a5 with SMTP id d9443c01a7336-29ec27d0aafmr23256545ad.44.1765370381346;
        Wed, 10 Dec 2025 04:39:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6b47sm185036815ad.94.2025.12.10.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:39:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 07/43] libgphoto2: upgrade 2.5.32 -> 2.5.33
Date: Thu, 11 Dec 2025 01:38:34 +1300
Message-ID: <20251210123911.9547-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122511

From: Wang Mingyu <wangmy@fujitsu.com>

serial:
* added caching

canon:
* use caching from serial driver

ptp2:
* fixed crash on capture regression
* added new ids:
  * Sony ZV-E10M2
  * Fuji X-M5
  * Ricoh GR IIIx (corrected id)
* imported libmtp ids

translations: updated romanian, chinese, polish, ukrainian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f8f560d335413bd55b041b9cecd0d8c3fcca0686)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/{libgphoto2_2.5.32.bb => libgphoto2_2.5.33.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.32.bb => libgphoto2_2.5.33.bb} (93%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
similarity index 93%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 20e0645d21..6b5e6c21b9 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
 "
-SRC_URI[libgphoto2.sha256sum] = "495a347be21b8f970607a81e739aa91513a8479cbd73b79454a339c73e2b860e"
+SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gphoto/files/libgphoto/"
 

