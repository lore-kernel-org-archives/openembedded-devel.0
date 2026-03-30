Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDD5FB3D14
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48207.1774867172536043230
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=obsP43bT;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c1a131946so2522883a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867172; x=1775471972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uvswqXxEg4XM6OmyixuwH9QQL7EWGVYCDDQTa89dj4=;
        b=obsP43bTGv3zCfb5yr7jwX0EndY4DLLjJkRF9Y8tt+RHIk9b1PbVx+76nOSQreuRM/
         XggOc2c2Zk1o23d4iVg0OVRi3Vs6seLW8gndj+GosUfXql8vDA2ZQs9VgHrHyXoTVAyc
         O2CugM19dyUbm5WREeIvNSIWPKtIiVafmuHe52TOhekWkQaauKR+/kTZynx2kcBA8D3J
         dA7k1vtM9xOmC1T0n/VlBSx6cAQyZKpx6ZesSFrKzRVqBzViokfaDXvUEXH9jNXs4pYu
         GfXKA+4ihFLmtKL7HLn7U0h3Kgr2QpMp+9TA1DpyICNc1Kn2aK1jdgLjjhLhgRUG2VeY
         tm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867172; x=1775471972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uvswqXxEg4XM6OmyixuwH9QQL7EWGVYCDDQTa89dj4=;
        b=PGrpJoQ++ZNMwDoJuigxyqe8N9PJvSKV4yYVuUbHnr278n7HumBepHLvzEBU7dFM0D
         78g5mGpCMPSYByzUppMZgXCfHisdzcMsKgG/hzwPDQKG2BHbvDC+4cyA0g+A5/3qiR4T
         Qcp6cM0nKjkkwOxB/4/mTOGKFnwzygZhjtBlhGG8BtQYqh4LoyfQsAN4IfGLX/lS1oTB
         o70LRn044m+WEHO674BTtO0SFHSDvEjKV2rqjljHNFZ9f+jAr149AXYakvHsE53SVepT
         PYEUJNT5VufybloAMScJCcnUNx0Knpcre/mKm+aTNmg0tVszbe7p/UHCUY2PKb6Ok7Ob
         VLUg==
X-Gm-Message-State: AOJu0Yz9Pq6C3y+lRYwaR38F3Jo2hW9GteLpsL/iOko3NEbflp29vq5L
	2SOu8jQDRyfWgLhNJMJw6koJHxFzdXmLneDVwHc5Fu3CHoMXT9ztHV2eW8/PQw==
X-Gm-Gg: ATEYQzwxvrZ5cYEHzp91DiZOmdi6W+gjQHG6EENM0m6PAG/K923nidPDDnrLK1At9qk
	SUEXwynTDLKQzxH95j01i2ovZmCo5LidL3vDRrd9fkrVBawMmvPvKN95n/vvf/LsVcYdYabyuJH
	SerFNAyCoVhN2PJbpZGfx3Q4aVKkbLBTOxnnLqgSWQqiUbNybyDDP/95ujwEPSWc9x9tL3LvtmX
	odZm/9pvIpZ5Yde3bsVmmckRjP5a1vzmwZDWMluJRdrgxias+9gqH6OTRRsqqmDk/M98Qsse5DV
	cOHy5+Q3hXEAsl6rP5wUhLq1PUSQPjQiycF0T6Z2236bXTGIrwCEXqgZ8y1glPd3+7rH0HK81mA
	3n/KB2jwCCyKhTaqXvAKhkeQfWcWeTWnQm+bhRXpdBNIT3/1Qg1XYF3jGW3GbjAIdchKVyorA1Z
	4E549RPI1UivOqz8BReHUA8nlPDNFeVaYyop34TTlcC6DE0Q==
X-Received: by 2002:a17:90b:558e:b0:35d:aa02:d776 with SMTP id 98e67ed59e1d1-35daa02eaddmr2248826a91.2.1774867171787;
        Mon, 30 Mar 2026 03:39:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 11/19] python3-alembic: add HOMEPAGE
Date: Mon, 30 Mar 2026 23:38:38 +1300
Message-ID: <20260330103846.3381644-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125854

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
index 81bfdc64be..dc943836a9 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.17.2.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
+HOMEPAGE = "https://pypi.org/project/alembic/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 

