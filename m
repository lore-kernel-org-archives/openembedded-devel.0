Return-Path: <zach@mandolincreek.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EC1C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 23:15:25 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.1505.1653606919406813394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 16:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aquabyte-ai.20210112.gappssmtp.com header.s=20210112
 header.b=DjizmgGL;
 spf=none, err=SPF record not found (domain: aquabyte.ai, ip: 209.85.210.172,
 mailfrom: zach@aquabyte.ai)
Received: by mail-pf1-f172.google.com with SMTP id j6so2893167pfe.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 16:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aquabyte-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BqsJXcWrvMNUAnfNm19tF3chS/x/2t9fbG54eZaUrM4=;
        b=DjizmgGLzosgvJdVQAt0DEj1vJHSsxu+u6izTjM0aVrBsPmqsfcIErp+nygT+vhjaS
         STH6g+/S3HRQUGValXp5VAgE/xusQQOGnBw+Cyen5R7SQzvjC37+UK23A0AkBmIpNs6H
         R5sR+XSD7SL987K5NE5wYLfZhbHI20jBKiPa0YRMoPcXdiAmNp0xjlM/QwR1WS9gIR2k
         P8Mr5gfyNYhrPAwvi5ArryGd+0QyYSqAU77WE0VA0zP2cfPbYK2yJaIY8Qg6nNgrfRvi
         lRZhsgdrhjzBbqApegjw5J9cBxraym6Yt/tzK+yTT/U/SFTkob5+wlCIBT3/sLW8gflq
         oI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BqsJXcWrvMNUAnfNm19tF3chS/x/2t9fbG54eZaUrM4=;
        b=pcMpXmwAi0rrfX/Rurqkg6WNZUhptg9KFIKYdqpcXgdtAygYisC36Z2CsoRNWT867J
         czKyCZAxeU3LzmkzrqA4lC1E5fLG/QYBTAMLvcGJz/tOc20k7sSPqsHM29SJeNnTY5Nt
         fx9q7xWBqcS8Ct+5+m5Ujf/R7rR9nV/X/R+ZKjOsFT+REPOx5kj/kwRF4mun87sTN5/H
         asSjgeE11mGgUV1cO6TLuAG+YgBZYwnPywXsw38R0EEyGyJlOHu0i9EgkiSb7uADncQB
         htUH5/eCYbpKIR1+/ieoymPoNkaA+t3LpkjIxJXd6GG4xYOpq91IT5OVrcFqwMPvAP34
         bO6A==
X-Gm-Message-State: AOAM530lpPsfyfS/15rquMtj7m0okwSOva0JoAinSMI3zuNM1YhkDrya
	ET6geY9FtKqAYfP8UEwMFpd38Q==
X-Google-Smtp-Source: 
 ABdhPJz8cKWVTxQFaOynMu2oxkfmoYv57Iue03UHL0snvpzK8qdcuDHaJRAA9+MMbpDPOIoHOtKpKQ==
X-Received: by 2002:a62:b40b:0:b0:50d:3e40:9e0 with SMTP id
 h11-20020a62b40b000000b0050d3e4009e0mr1008136pfn.48.1653606918639;
        Thu, 26 May 2022 16:15:18 -0700 (PDT)
Received: from aquabyte.at.mandolincreekfarm.com
 (fluffy.mandolincreekfarm.com. [192.173.156.26])
        by smtp.gmail.com with ESMTPSA id
 d5-20020aa78685000000b0050dc76281e6sm2002931pfo.192.2022.05.26.16.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 16:15:17 -0700 (PDT)
Received: by aquabyte.at.mandolincreekfarm.com (Postfix, from userid 1000)
	id 7E3FB25200FC; Thu, 26 May 2022 16:15:16 -0700 (PDT)
From: Zachary T Welch <zach@aquabyte.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Zachary T Welch <zach@aquabyte.ai>
Subject: [PATCH] ccache.bbclass: document CCACHE_MAXSIZE variable
Date: Thu, 26 May 2022 16:14:44 -0700
Message-Id: <20220526231444.608039-1-zach@aquabyte.ai>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 May 2022 23:15:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97282

Setting this avoids premature cache object eviction during large builds.

Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
---
 meta/classes/ccache.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 4532894c57..913304ab35 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -12,7 +12,12 @@
 #   Set CCACHE_TOP_DIR to a shared dir
 #   CCACHE_TOP_DIR = /path/to/shared_ccache/
 #
-# - TO debug ccahe
+# - Adjust the ccache size limit to avoid overflow during large builds:
+#   export CCACHE_MAXSIZE = "100G"
+#   To find a reasonable limit, set this limit to 0 (no limit), then
+#   observe how large the ccache directory grows.
+#
+# - To debug ccache:
 #   export CCACHE_DEBUG = "1"
 #   export CCACHE_LOGFILE = "${CCACHE_DIR}/logfile.log"
 #   And also set PARALLEL_MAKE = "-j 1" to get make the log in order
-- 
2.25.1


