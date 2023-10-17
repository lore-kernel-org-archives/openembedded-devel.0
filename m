Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622B2CDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 17:17:10 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.224656.1697563026698581871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 10:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vr3st+OV;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-58e119bb28eso5372743a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697563026; x=1698167826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kK60Dy3lE/DKeMxuU7WgVad0Sy+qJu510S8Pc2DGBso=;
        b=Vr3st+OVNIK5UjYD7SccN0W7um6Lzr723xuf8kW+ZfD20Z+e0+ZEjgsQBWS/Z2c1/6
         nn/CQ0KeCJ0TmJUVhsiafxnTeBA5y/tHUbuv5gneW/tRhCyxQzDEIM6r7nOPCM7CWH39
         12+VOwNDbutiSyZzZZWZmUd1AcGukk1GrM0PUBFnJniX+6yOwCVFlT1cYqIj4yCUGK3M
         PrVozRMkfaC6jCHP+3K1IbqkxHQtwV8Ug90R8K/Px5lHYZ0W2tqMO/Q7ZeM4mXg6qcuj
         GTH8lrM11oJ0oJ+3vpp7CtrDZXa7pXfnV/mUOncBj1ntqM1YAlEpTaMwtpJnmFSHMJqq
         M9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697563026; x=1698167826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK60Dy3lE/DKeMxuU7WgVad0Sy+qJu510S8Pc2DGBso=;
        b=egX233+jmZ9cvVKvyOVCtnWCdYgFGcqHUKkmlqMSR1ag1+Z7jPGqOyrfJNrpbd4J7w
         hAsPkBofQVyhSWLWu/enkYOXu0pgFJNBaQAnVE1I7j4UWYeEX9zD+m4Ytb7LrgvhTJsY
         MYP//KiqWKCQqCNUYXHf2FDwDIxIcYrs/VnhyJ/1z7to4w+/YCtUFk+XbdzSgKvDxvXo
         xSZfXMWhiEBg+1hPoeQw5qnNnQ4Zs+NyDICILZTGLgb+plsp/VaGUB3p++OZZ/gLX6xm
         9vASWWPOTGckHpPUqQ40YKIKSly6KBUyxn3UzYG+HI17HWfn7MUP68FnDNHkXTyTCv8G
         55IA==
X-Gm-Message-State: AOJu0YzILJrdFfgu6EemtM3mGUvDu1RYtKjiuZckPZLZOAv5yRsgbiLc
	nX9SyA/a6/5M8sFdyZqiR6vhAOTMz+evxQ==
X-Google-Smtp-Source: AGHT+IGu63T3oj81jk6PziQyvBKbc+wBO/r+r9PQUbeeqDdmYfJ70snDRsCVwluOgvBbRDqto/CT4Q==
X-Received: by 2002:a17:90b:3b4a:b0:277:422d:3a0f with SMTP id ot10-20020a17090b3b4a00b00277422d3a0fmr3830904pjb.17.1697563025691;
        Tue, 17 Oct 2023 10:17:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id nn18-20020a17090b38d200b00268b439a0cbsm1587129pjb.23.2023.10.17.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 10:17:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] leveldb: Upgrade to 1.23 plus latest git
Date: Tue, 17 Oct 2023 10:17:02 -0700
Message-ID: <20231017171702.2964390-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 17:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105556

Switch to git submods as it needs gtest and benchmarks checked out at a
particular commit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-dbs/leveldb/{leveldb_1.22.bb => leveldb_1.23.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/leveldb/{leveldb_1.22.bb => leveldb_1.23.bb} (89%)

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
similarity index 89%
rename from meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
rename to meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
index 6afc45ab7e..61fa02c154 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
@@ -4,14 +4,13 @@ HOMEPAGE = "https://github.com/google/leveldb"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
 
-SRC_URI = "git://github.com/google/${BPN}.git;branch=main;protocol=https \
+SRC_URI = "gitsm://github.com/google/${BPN}.git;branch=main;protocol=https \
            file://run-ptest"
 
-SRCREV = "78b39d68c15ba020c0d60a3906fb66dbf1697595"
+SRCREV = "068d5ee1a3ac40dabd00d211d5013af44be55bea"
 S = "${WORKDIR}/git"
 
 inherit cmake ptest
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[benchmarks] = "-DLEVELDB_BUILD_BENCHMARKS=ON,-DLEVELDB_BUILD_BENCHMARKS=OFF,sqlite"
 PACKAGECONFIG[snappy] = ",,snappy"
-- 
2.42.0


