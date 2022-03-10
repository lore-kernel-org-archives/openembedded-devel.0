Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B9EC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 15:38:30 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.10958.1646926708837497714
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 07:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7MY7QZj;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id h2so1433270pfh.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 07:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pr6NV6ZNVjbhbBxvPKFhvqNUlzFI5ur5HZD3yAUbuSw=;
        b=L7MY7QZjMyyvzMNVTBm3nve0R8Wsh7NhkUK/w388DKKiOZLJRWd9UtFc/uJd0S2vrX
         9dcdnl6YQb2RvCr8VXjBRzDEvywbvV1LDJaN+Ps9T9kStyveIF31mV+twTZcpJkrXlMB
         6RX+Ci1U7kK0BM7FHRd+SzL1vIZVEnzfOK2iRnE/cTxOlaIU2YMBT0m8O9axpBgxgOXg
         tsp5JllWsQiyNcDcU/req4yE0ZtC+NU4PuPAN+opVAJqaMX6+x3LXWeCujMlUqntisgd
         0+HRicir1xfLvRte/qJkvhVESuJUbG6hS0J6iF0kenXRAai4fsYay/Tb4HFmquzAZ3gz
         2oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pr6NV6ZNVjbhbBxvPKFhvqNUlzFI5ur5HZD3yAUbuSw=;
        b=qXSIERpnz4yeUR/ni5mXCtzBgb0gMmCfFkClu4GHBPX8waya6mhPz5cHij84jNf7ZH
         2+7wN5wodHRX0UErkhWZo6YzPu6/LQNXCrZ/U8IuBhm4omBGTppXRl8IVYDKA5n92gSB
         VzW3crVpMETiUEWi64OG1T0DgtGWKIgzcoM/XQUW3zkAtX+4DZz0cZJADTvp5LhJ9Wvy
         aSNofgqBrVBmzK/6vxzZy8pHI9fWv0IWSjK8R1K/ORTW78O3cob8CnwRdOtV0I5+t2AH
         5D43wEgZj07T4O4EVXac7Abz3SFyH4+ynVEn54e3TPeRyqZfLhRsFE5cP1zyV60v2PP4
         3gdQ==
X-Gm-Message-State: AOAM531MNrVt5jx3wywcYupdoF5VmWfulfhv+GPDzyVsyXKjhX3fEyRI
	ATB6sbSe1U0JebHVjzBA4jIVlLRLWnDo7w==
X-Google-Smtp-Source: 
 ABdhPJyOdAS6B9E5JfflKfptfxg6DR/8vmfyk1obiUEMUsfsGWurkZY96ROTTIMangwkGJb/+OWkBQ==
X-Received: by 2002:a05:6a00:139e:b0:4f7:1576:f8fb with SMTP id
 t30-20020a056a00139e00b004f71576f8fbmr5341741pfg.85.1646926707803;
        Thu, 10 Mar 2022 07:38:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm11312306pjb.16.2022.03.10.07.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 07:38:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ttf-vlgothic: Specify accurate BSD license type
Date: Thu, 10 Mar 2022 07:38:25 -0800
Message-Id: <20220310153825.3203568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 15:38:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95934

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
index a386bb850f..6b79eb9197 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
@@ -4,7 +4,7 @@ SUMMARY = "Japanese TrueType fonts from Vine Linux"
 AUTHOR = "Contributor: noonov <noonov@gmail.com>"
 HOMEPAGE = "http://vlgothic.dicey.org/"
 
-LICENSE = "ttf-mplus & BSD"
+LICENSE = "ttf-mplus & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.en;md5=cc06b20e7a20bdf6c989624405378303 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
-- 
2.35.1


