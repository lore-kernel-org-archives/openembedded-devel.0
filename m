Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDFFCCA46F
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:39 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.21080.1759223973057665591
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfY31Xt6;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-424da17e309so61645575ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223972; x=1759828772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S15kOdZrnVLM1RCAEEdfDDGSy1OhBLTn6fXIXLmPDU=;
        b=UfY31Xt6c1KJBhjiEMEXpjO5UbeOMGu4uHExyim9hEdoUyuS+IJfEzO9NHru8EvDV8
         w7ezwGTjAOLe2ouV6q/oKqzHFRKKWrmcYTWaQzBTPE7oypOingky9fAMwmLD3ss2/66p
         6hffeFClzk+H1X5PE7UB9QfVq7LptAN+YwsHL2Z1Ba3Sa43zI/HMY1OJzrV/bsDvGc04
         gxGUxNho8ruVKX6qnn4bP4yg5QlYfzUWsaIW37fYxdOzmprX0R5gD1gv88a0vVt9eS4n
         qChVRktP4eZ8yw2rLfxxSGNpSTq3DsUxsfpXTM11N1iB0rwjuYRWZfaLp2aYqcmf69lE
         SsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223972; x=1759828772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S15kOdZrnVLM1RCAEEdfDDGSy1OhBLTn6fXIXLmPDU=;
        b=d9IrtFQeroU91lgsezPLvhTo2anqKQY3skFyO/HiMcbvOh1cMp/9iuYGIvBPA4sP5T
         ZwnlHhD4PFdP6eG0b4daCs+TFQBk9l2Ib0bW4SXfNxI2tawJjNCoVP72WDMRF8+2rijM
         5U3SF/bixeKlt/xLjATuU9ay8Da16LLMn6+HkYlSKW4HB/tczI5Ell+7QAk6U+y2pV1i
         dvhAK4twEsoeXmUqIkysrKSJIyQ7sH4VLSgONYzRw5b+rjBKCS6tpvZr+CmMTbuvypqH
         K62QAR+AXEnKJQ3HM6lOtVHjKUOsk6D247zbP+5tFQ3aon0WJfrcnMFNb5EvWB4f3ef6
         Ko+Q==
X-Gm-Message-State: AOJu0Yxx0kFTq5vHjZ3RxdcwLFw9QAFAt5lMepV2FpIJLazOv+tGYxQf
	5fttbjhEhxMum6A/oRnargd24t9bANNHtgFgd9xTYoTSkSeMvIdzXPukIK/0vOrT
X-Gm-Gg: ASbGncs0xDrBSsVaZ1h7vXJSbaVh3ifpGh6OswogISs+p5MrmpV+dUNNnUbJFJdVV2e
	uKbambPJQYswo4h8xPKhYhmjICcFLFb+fkx7kBCDzBRpLtSrL04Tc22ierutme3bTQlhCUKHdGl
	KoJN1q7DoRakOI9Xz01Jj7mu5iNP511rrIs72NdJBDoV0jpMLNFAH7aJRbqPmvwFO7GcPBsBxlX
	LJbqe0HYbcfqlQ71dtqn10F4zgP/jJLjpCj5Queh9vkq5RqtALLC0zRCISunaSkIAfT2a4bqIfz
	EsEI7GbieTkoHZUrVHzpx9TaX3z5mfr0IiijxWZljAYaQQnBW4y7h+CGpxYxARxtO/9KyXHQbc1
	vQr6v8vRq8gMHbBiQF7IRN/jZSp1Rw8puAZJV3wNCxBN5zMTUauPRnQMdWZ70x29dv7ou4E5Gd7
	v7eF8VPnCGRQ==
X-Google-Smtp-Source: AGHT+IFZzb921n2R6B0D3oZtshssnsF/W5dFsy+7r+x/5jdQv0oVKEtjF4qd9DAruU1petotgRf9vA==
X-Received: by 2002:a92:c0c4:0:b0:424:85b0:e1cb with SMTP id e9e14a558f8ab-42595644bb7mr64022955ab.31.1759223972052;
        Tue, 30 Sep 2025 02:19:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:31 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 17/22] tokyocabinet: fix license
Date: Tue, 30 Sep 2025 22:18:36 +1300
Message-ID: <20250930091841.1693131-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120069

From: Gyorgy Sarvari <skandigraun@gmail.com>

The application is distributed under the LGPL license, not GPL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8fd2b5c5b24335eba407b67e9805298576bdf6ca)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index 75f68ab5f5..cc4a174089 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -12,7 +12,7 @@ Records are organized in hash table, B+ tree, or fixed-length array."
 
 HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \

