Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3659D107BCEF
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 00:50:04 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1804.1773449397219813228
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 17:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ftHQc/Zy;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aec4a71ef9so13656285ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 17:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773449396; x=1774054196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npwMojc2+3Hg+hVQN0fuKm7cbkHt2J3aPDh9bLQC9aQ=;
        b=ftHQc/ZyVKmUEgL2mq7s/8GuzihpCOjRDanxm2NWdNb21hSYz//ZKUDDi5Rn6eeT3c
         UzjySJWw0SjQpHn15PQUcUXfj5S/1qcaRPcea+yQh49P8VpZj7tMGxYCoSMOjqjH+R7f
         6N98aFESao150dlQSaRUkHWdxEt8yWlvhgbhKoxrykhUnOpthqrEiRNMxIPjaPsotGhi
         rTsVvUUWvHc9nFbMbhJnHipZRpbFKutgMSFQRiOE03lJt3b+m7nrp4MuJur+AsoygIcL
         hfTMXn73xVgVXWhdA9Qs3UDHmSMAvhd9H70b6/7zHpsJJJOqXhzSM4t4plZKxwp/SFE+
         VGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773449396; x=1774054196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npwMojc2+3Hg+hVQN0fuKm7cbkHt2J3aPDh9bLQC9aQ=;
        b=iZ050o+JkiIYLC5OniaiHxzxmR8SwgytVbpQKJiHVIg80TuWWFeh7CAzAGlt1dfmUp
         BRYYO3ES0GLLwSK/rT+GnO4usVQ2raDc3Dd6AGawUzjv9a2KNzurQ5nQpdHhPEIwdfq2
         rnDtwi7z8Sa+pKSTqzo9E1uIp2LDROw1ghMdIv1ymGNN+eQJMj+gAP4e4GXd7BznaJMI
         raatX52TwryRD89UdUZgEPQCay8CQEPo8fe5Ukq5/NZzuEKSlzUju6DwOdSJiXGaKRmw
         ZLp+p/NfPQm5Dq540CsSW/QYsG1s+PJAUWU4y7khAVvCyLKMPbrloNpPCzE2OTnv6tO+
         /6CQ==
X-Gm-Message-State: AOJu0Ywfj32p9j7iHmSGyoyKpj59m5xfoxtC4H9Bald2xLgT42joDZX5
	MF5vQA8qEqJSnYMCZrhunVvVOkH/228/jVUlvJ5uiHN+XJisCOiiAZcyEEqRDw==
X-Gm-Gg: ATEYQzw+p2481TtYWehX3d1Rv6fBcyR0mF9qemmBusOs+AsHEWX0WagRE+vBprR5O+G
	3PtWam/N/5oCPypsb6V5khx68x8/UtdxcerD1qIvyzJSj/HnBcEFVlb1uRN0zznirPxi4duIvD7
	5/MVFWrSoPiOsbJ3ghmp5xS7ekcB4Q/G8dFMaoKV6fxrVPKAHxu00/d4FP1UaA+2k/9u0BsWMDD
	yd8lLqedyRrzqiq5SvHEs/AfQ0IP7wgmZje+lX9ERjftZLPqlvOvQMdDPn+QAEaab/MB2ScYW8K
	MCK1Q91+Uc2eycZfk6/bp1ySIj15ftrbiiBGYDke8aZPkntYfOOkScEWKHtyiFB8cpN59NHeFyF
	4a73B1AFmvrYjiXbwnDLiw4DYQaarKICBN/5QjBcKq1Ujq49BwkDoQZzT+mGsN8khe9WCTnjatd
	ACVmFbC2ahd28abUqmqmpP4SWF6Q/PQlXXFzI=
X-Received: by 2002:a17:902:ffd0:b0:2ae:5628:a170 with SMTP id d9443c01a7336-2aecac54df5mr47781255ad.46.1773449396298;
        Fri, 13 Mar 2026 17:49:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece838d3fsm46873695ad.77.2026.03.13.17.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:49:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 1/2] ser2net: upgrade 4.6.6 -> 4.6.7
Date: Sat, 14 Mar 2026 13:49:44 +1300
Message-ID: <20260314004945.317114-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 00:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125195

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 23d4ba6b96833ce3305a47d63657ae7b46101dd3)

ser2net is updated to fix some issues in reloading the configuration.
There were some situations that could cause crashes.
The bug was actually in gensio, but a workaround has been added to ser2net for
older versions of gensio.

https://github.com/cminyard/ser2net/releases/tag/v4.6.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ser2net/{ser2net_4.6.6.bb => ser2net_4.6.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.6.bb => ser2net_4.6.7.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
index 56ade35bc7..db442e41dc 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "a468073c7bf8166c78c61d30bba487916dc4088e98f96e190b37ea8100a94fd4"
+SRC_URI[sha256sum] = "6b921bc7efb1b9a8a78268d63332701902cc1c8dbac51842d46ede6ffb5fa2a4"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 

