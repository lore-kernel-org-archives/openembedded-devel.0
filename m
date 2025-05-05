Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3050DC3ABBC
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 17:16:19 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.56348.1746465371504996894
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 10:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9kjzELk;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e75668006b9so3107051276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746465370; x=1747070170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gban/NBrVQYP6S6UdSwnBKOqlkuYvwPJ/OtzzE10h4A=;
        b=I9kjzELktzBZO86MhfGMp0ZKFuRJKIDV6P3PGH0OgEzUQIZx7c7ir7PXJ45KoCJPnt
         uWqOPGqmrH0ozdQ0VwY3fcSEYaqvNGHGT1NNwUBqduUr6fRX0f2WvtYZdI3N9aCr+N4J
         MFwzQTU/l0R7yOfyaCSNxzSNQ+sCqKYXsxUtiNxIWY8S+UQD9TD1V0gZ5Z7Z3QJBmohX
         kZkYGrVonReUYW+yvmABuZFbUar/X12vi++6Mds1MOLq3vNusc+vES+kE/lWvw4ImN9I
         shlJuLkg25FvpCLeovyFSyK0/eB05FH6W9WAw/wd+2N5+9CX2CDcCCNLPBIYsG+Tdd4S
         j5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746465370; x=1747070170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gban/NBrVQYP6S6UdSwnBKOqlkuYvwPJ/OtzzE10h4A=;
        b=YsxpMSMY+G1QVzIKZKCWoRflW7EtjaUVNSEfG+9lRf33Qz3wPevjGrJr9JoPFvP+Yf
         zH6qTI4HWWmKQR0v6AbcOV4xU1VHoJqDg5UQzxviyFomgXh85K1Qx0EVWLBwCJwQy+Rn
         XIBgwE9H7VfV2mVYOnfDE5kUhCLWrefhIdiT591hWPrhRpNbyHD/5Y6aBWXVQUWug7DK
         A4lnKHYzHSzGpgV9PHfXMkNsZlb9Rgd4wvuux/lQiAA5CU3Fd+ryUoQ6qXVTi8KIxbsd
         LldHLxUYgvoA+H85210rnupE04uuOHgEt98IBMu+3B8drQFbqW4tPNzLtFDKYk2biS5l
         tWrw==
X-Gm-Message-State: AOJu0YyKS5EHr71PPtzGNU6DIQZNEbmWP+Zm7esKDmQ1oHa5nmXjOZ38
	GRfeOh60Cu9VLMy41+irKHHDkuZB6tzAiITCPmheX1aZNvc/Vj6I8u5Jx0xI
X-Gm-Gg: ASbGncvl8e76BdG9z+hWV+8vilPbBIijeErsKMbyptLBd+lzWTwMMprwDMaLwS2bf8W
	CwFnSO1TMq6gxhcigk1WDUb7sybH5GZlT1xjd72CciA4Iju+sQC1lrk0wiuMbdr3RIgVtPN0JR7
	MFFgG/3oIsYk9HRMsd2M5DIsfymB+NNqdfy9C+C8ja9/TpLuOf9N1Q4ClUDx+iHAIcyxCPpsB1m
	3Fu1kDR4yHd4Cxa1N+/MHwjhvr5Z/zDR5YGIXo2d+q4XlnN7LF43jeyUFy+e+gSo/rKfVQoKBAr
	WzJqWsdvIa1t/pB5GI6+2mHe2zo9KmeDI6hT3v709BOfKQ==
X-Google-Smtp-Source: AGHT+IFo2t16FF/eDGlAb6W99FypK13BqinK9na26O1vtzMiwuchaFjZwieM+eQiQ37WzOVAyYOnMQ==
X-Received: by 2002:a05:6902:15c7:b0:e75:bd52:f14f with SMTP id 3f1490d57ef6-e75bd52fe5bmr771614276.34.1746465370070;
        Mon, 05 May 2025 10:16:10 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e6e7ae6sm2098781276.8.2025.05.05.10.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:16:09 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-networking][PATCH] pgpool2: upgrade 4.5.2 -> 4.5.3
Date: Mon,  5 May 2025 13:15:47 -0400
Message-ID: <20250505171547.12487-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 17:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117327

Changelog: https://www.pgpool.net/docs/latest/en/html/release-4-5-3.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../pgpool2/{pgpool2_4.5.2.bb => pgpool2_4.5.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.2.bb => pgpool2_4.5.3.bb} (92%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
similarity index 92%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
index d3dadfc6d0..7b51fc558e 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.3.bb
@@ -10,13 +10,13 @@ HOMEPAGE = "http://pgpool.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 
-SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
+SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
 	   file://define_SIGNAL_ARGS.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "480ac23f01cd7d6c856b29386bf17a848712fb4b4057d4c8abd5c8bf819bdf06"
+SRC_URI[sha256sum] = "25ed340d7b7dc00c20e4ba763d3f9c07ba891b150d9d48af313a1351cafdd778"
 
 S = "${WORKDIR}/pgpool-II-${PV}"
 
-- 
2.43.0


