Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3638.1794429599852097503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 12:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GSDQEn4H;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1546194b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 12:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794429599; x=1795034399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVZB286jra/MAloMw3/X7/2u4otMenhJhFXnfiJ+npc=;
        b=GSDQEn4HTcKlkODH+vnnAYCAG7KT+I5tNbvHIzk6Xy7opUf4Od/CxF/SmzT5QTxYFI
         qIFEEs03gvpAu0y+30Z2yQlb6PBmloZiPotzVApzagDThjpqjoIQnSsTG/PAqzP1o/1q
         0szuGAeoskKzWm8sLy/oSos1+dF1eVm/9tsmkaTtw+QThL1BjTaCk0QWr6hlbfysj4oJ
         SUF0XVM4ebv34Y34RQ8ug+ldqxyVEFKITfxwyGWE8tEEPGVcNl1X7ERSSV3Z+4PL53Du
         4Wuc1UWk/id65VcjObphZYUmRfMUSqDJ2VkzvaTZL8oYVgMhqSX8f/GN6ahlOLARqxy/
         tGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794429599; x=1795034399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVZB286jra/MAloMw3/X7/2u4otMenhJhFXnfiJ+npc=;
        b=zZQHVFKX1QB+JJMPd5QUwuV8vlQuY5cpmPZZ0lo3zTQC9mdKuxORLD85FYMVbuA0CP
         +llySUAp99tMz3Cmg0syEXfLYMMD99dtj0eiVRvW/O0MGXJT3ga9DetzTEwyXv2B7I9u
         /hOOIUpiiiSLLEfGIWaiJU2PPcyascvUGiiHI0HyA7sQX4jK022BKeV7jB54dHxetjh4
         mqmHLtlxJxGxGK/Q+qxaU4l+rmZ85Gi8m8Qqv9dLoyg0fmxcfrGCZhOP5Z+tq7WqWGzW
         7u4qlVbNevpLnoL8lgrcE8juWCqy9P6FmEdfhOtfVM58AZ/h9JVpmoSN+J3ZSnaDY/0q
         o82w==
X-Gm-Message-State: APuU4Z/x176NWz2uuANXfvkpN4aV25LT438Vat3LEqUrxh5ySaInqdZd
	VhugDegMQ9yxWGrt2SwVhySsNfXgVGq+gE7/wyg5ZLjsPZkwdoUqKqNSQCbA9dQhCc4=
X-Gm-Gg: AYBFou3ZbVQ7WC74Yqcl3UxZcCpcLZ6PcRUqBZaAy18evx9lYU1rMFJZBggBXzr3LJZ
	IUD7/BdJFyHuweR5x8EzuZQRkEP+/uFXoznXnXjhvOUyxs+u+olErNOlFOl4i6mV7IUabG72Fap
	IjOHOV7F/svaJHfMlXQDUc5izdCa11CRPghwOGrKVSTPI7eP46iQHpKoI/DXaboGataTghpAbfR
	Nv+r8ugwg/h63jEjgN2l5ivkAyGMsX5fH9xoRKut4V25+3DTWfygzC+p1Fma9sN9fe63/l0Aeex
	gUFGvMEvvnupLlv0Hex+b2HFypxJ4r4/Y6wr0sCocG4KX+2U/rsO93j3lImuYgW/MBU9fD99UPf
	3X/e2+Z9Zx/YX1veEOT62d1mWV9c722pDclaN/YauajDfUtfaG5SxcXpQBEg8TJ5RnKmGA3wsf8
	+da2zbY/yaYaMeDGi8vJXuGBQZU/BoCtAF800NNOh4Aya3E2oEqLZZgniv9KDAAJwltpxm79bjI
	WTNOdEcxZ+4vNy9L/NFmzQ/QChA1LVbY+xm54+UnG0q8UqfCrUWyfJ37A3xjyAwlSsSGZIMh3bA
	/umPvoISbI85sgeHWW3D8iWzdBwjvNqDEkFZjY0RMtfgsE9JO3Hf49ibM0SqJ9c=
X-Received: by 2002:a05:6a20:6a25:b0:3e2:acd2:b94 with SMTP id adf61e73a8af0-3f2fd48cf97mr3787448637.35.1794429598996;
        Wed, 11 Nov 2026 12:39:58 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d699b93sm1841011a12.14.2026.11.11.12.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:39:58 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [meta-oe][PATCH 0/3] postgresql: add PGXS extension support and pg_cron
Date: Wed, 11 Nov 2026 20:39:54 +0000
Message-ID: <20261111203957.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132137
Content-Type: text/plain; charset="utf-8"

PGXS extensions cannot be cross-built in OE today. Patch 1 makes the
postgresql recipe support that, patch 2 adds a class for extension
recipes and patch 3 adds pg_cron as the first one.

Built for qemux86-64 and qemuarm64 and run in a qemux86-64 image. I
also built pgvector, pgaudit, pg_partman, orafce and hll through the
class to check it is not specific to pg_cron.

Babanpreet Singh (3):
  postgresql: make PGXS usable for cross-building extensions
  pgxs.bbclass: add class for PostgreSQL extensions
  pg-cron: add recipe

 meta-oe/classes/pgxs.bbclass                  | 22 +++++++
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-dbs/pg-cron/pg-cron_1.6.8.bb  | 13 ++++
 .../recipes-dbs/postgresql/files/pg_config    | 43 +++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 62 +++++++++++++++++--
 5 files changed, 135 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/classes/pgxs.bbclass
 create mode 100644 meta-oe/recipes-dbs/pg-cron/pg-cron_1.6.8.bb
 create mode 100755 meta-oe/recipes-dbs/postgresql/files/pg_config

-- 
2.43.0

