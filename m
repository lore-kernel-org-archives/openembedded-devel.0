Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.238.1617899804394788485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bLs+qLBZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2901810otq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kJjo5dCEq9ASzognlZuXYu8nkPAIE8O5+AdIH3NUtPM=;
        b=bLs+qLBZn8u0gYYBCua8NKh4k0bBXg3IQ7JwNPSAtgnbeiNM2jYdKnAeY26edOqhZl
         L34PGqiFr9sI14EGdNL2o7iBpa3NXQY+3nL6RxWrtyZk7hQq0QGocAdyDEytJShiD/Ca
         cpmin2KQ6OQxpdPEVCvgCV2h/XWRqv0zWa85YJsfKteJXQuS5zAFYc1Ygxh1PfYjyaQG
         bomFjcdRQ61NBOPEVEO/AmDf8aDs1td6bQf4cM1ngivenaCfvmtu5dmL9nZV4MY3qbNm
         ghiqGJJTuq3pUzd4PyVDcgiu+s6+rT9GUnx6mlYlUJQpXDuueqNXZkJjhwSZCVR5Pcv+
         0DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kJjo5dCEq9ASzognlZuXYu8nkPAIE8O5+AdIH3NUtPM=;
        b=kGWcWfgFLb/YPOF+HNk9fZaCp5o5oQYc1sMQ52c9upfLgtg9xWutzSBr1C3w+GnwsU
         yfvcewYVKtdUFjkqsE6i6oXuZW2cNzTuQu3DYymzBdJwa2RpT6F85JeVAyDKbMPXJ5vs
         LBxYLg48BxYyxl4cRRvsrdcGHQuhA6g9tPXJHt9p0pisLPEyHnVH3oRcQwR0PzyUU8By
         JuAnxa93LSteDa0+nEQFCPA5IzQyHbJqJYZ2IXER3Dpyv/cr9j7YpmFVRrlh3iHBa+Gi
         iq9MOfea+KX3RxHN67Vm8iKCzvayRh8+/6cdrn7OiS86t7mFijgZWPV+6U/KlYH4RwMn
         fdaw==
X-Gm-Message-State: AOAM532FGgPOssmD1Uk4ibvRbBc1tMxDOVOCWwsiutnum5rGpakQ6+oa
	rY39gKrHvjhL3LREJPgCDrDzFzfYY6A=
X-Google-Smtp-Source: ABdhPJzVJGXVjEtI0Rvy3M6fhncv4pCGsPiLc/ttrg9qLxiaCnkdAe9CsJogrMKBFGjylLJFTWJM3g==
X-Received: by 2002:a05:6830:1d70:: with SMTP id l16mr8461746oti.148.1617899803620;
        Thu, 08 Apr 2021 09:36:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:43 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 33/64] zabbix: upgrade 5.2.5 -> 5.2.6
Date: Thu,  8 Apr 2021 09:35:40 -0700
Message-Id: <839f409436d465f17049e064999439dd28d9b09f.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5f3159f6349e5e1a1b134b2997d7dc62daaf2ef7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../zabbix/{zabbix_5.2.5.bb => zabbix_5.2.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.5.bb => zabbix_5.2.6.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
index 2bbfec9dcf2..37bb9a2820b 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
@@ -28,8 +28,8 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "e90822716c5c241890f6fed1588b5451"
-SRC_URI[sha256sum] = "ce0d9745a8b9154e87d6906edd0fce7b7ec298acd34a0543ea53d1a5f2f14bc5"
+SRC_URI[md5sum] = "31dab3535a1fa212f5724902727f6d4d"
+SRC_URI[sha256sum] = "76cb704f2a04fbc87bb3eff44fa71339c355d467f7bbd8fb53f8927c760e1680"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.17.1

