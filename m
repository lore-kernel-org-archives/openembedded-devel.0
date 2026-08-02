Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3040CC55179
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 08:15:12 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19799.1785658509336445603
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 01:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bapGd9ia;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacb8416a1so23166675ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 01:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785658509; x=1786263309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVhZ+3OVmdzBAOpnle7XlufCcyJm+2I7m0BvRIsk/2g=;
        b=bapGd9iaZhlQCeGgkrkjri1p07gyDhLWX5RfZ03Q23pf67HorRQY0dMf2dLVHC/gIO
         pqMdmRc7og7alQ4eTIujT8qmPXKDXA+Giqd4X1LLzrlEd/fhbIp/cLQinhIjIxs6olBC
         WmLV5rhR1Cj3FkD4ZsiXwEV2/QnIusUdCvATN7cIS6htybfPjojsGyzmXwrQWqwz6pZ2
         zjvg3tyLSEJhRtmxorEWwclzaMv4TbxYONUxViNpbVpjVu98HfCutP5KVzf/6nOWdqXh
         1vZXG6jTlX+ee4BTMYeUdUgUYx+UUraeVmBA+7KpofMPBnj0zZfg7VejZMNMisQAgOVp
         8m7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658509; x=1786263309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVhZ+3OVmdzBAOpnle7XlufCcyJm+2I7m0BvRIsk/2g=;
        b=EcWNTHf5pa/rgXc8QFZQmJzHpN5N3bXVNH60SPyq+vHqDeAUNbRaEevU3GR9ctij4S
         EeadpF2Yj+37lvHdDC+deQpcnvawI6Qfja/nozKgz7eRqN99dnupr+2QonmFwWZSm+RM
         vEtSu1Vlrgat4pLt4kmXCuoaHU4GyMoMUD7eSYnD0xZbxUCwjcvtigSPK28YZdyMwKBl
         3GrhTATVCfqb2my+H/S2eoB/Kqnr9zdaL2tTjHD+Ta30LCxzzSKX6PCqfsjp0xaB2dqp
         ztWe8qspfe4hMDaVR8B1tAgOICEZWSHjvYofSbBz3jM/dMDMPcEpWBl3ruEEKbcMFjqh
         kQkA==
X-Gm-Message-State: AOJu0Yzlsu6hYSD+y1McFlA+B+DK811YuYhb27NafbTlqmfA6PyubKm3
	fzGsyqSBIgns1e5EGYEwlC24HAoznFODYz4VyWA9kNg2WG/3pkUCi8orHJWZcQ==
X-Gm-Gg: AR+sD11sVr3Nj+fER1hU2V/iHXSD/o2RAl7dWPX8CPRqlBOOW4J8Ll7Dd2RrNYe3O8M
	kj80/c2qvLZbzdwPae3U/XmwW7yeSsb9u4udyNbX4tqyNHvKN+key2lzaw8fYToGyKDcFs8gWbM
	iGRU2W9xNahy6UKzSKsVnkyARaE/kdJnDVY0likLlHZtaOry4eiHaapW9JRiBoGRfxry76UiuGc
	tGKmz6vaZ3yAWSyI0l5g9yF0MSbMdUhJlyuuGyC6hC9X4fkT8thy4ZjwLPVvg/F8eWh/K4kQCEh
	/ZpMlvH73YKWLnkZM5E89FJuyaFo0crrserpamJbXdNt43qQPGJayfDmcdLk5Rq+FTZdXlAEts6
	F+pl/9WBszbFavoD7UqBPTYTcduGyE1N8U5pN6OtiPXVDUgz7UKyvI3nmC35sraep/dppbAyNhr
	gehnjpTOc59Wu37U4IlkuomAq4SaMJZCtkzos1XeWH5JxOaizLRQIMo8H+bDR8GzHbY2fA593cr
	4WCigibmxNPf90jBtN0Ee9O
X-Received: by 2002:a17:903:37c4:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2d052188df9mr62078575ad.2.1785658508624;
        Sun, 02 Aug 2026 01:15:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19fb5sm24371085ad.9.2026.08.02.01.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:15:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][master-next][PATCH 2/4] liblc3: include tag in the SRC_URI
Date: Sun,  2 Aug 2026 20:14:56 +1200
Message-ID: <20260802081458.525763-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802081458.525763-1-ankur.tyagi85@gmail.com>
References: <20260802081458.525763-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128653

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
index 40c4b0f93e..86c8b405d1 100644
--- a/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
+++ b/meta-multimedia/recipes-multimedia/liblc3/liblc3_1.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/liblc3"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/google/liblc3.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/google/liblc3.git;protocol=https;branch=main;tag=v${PV}"
 
 SRCREV = "96a3af0beb5487aca3b98a4b992a539a1f6d80d1"
 

