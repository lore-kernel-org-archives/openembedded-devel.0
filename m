Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.13269.1589899436445005800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dvG3Hpoh;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id t40so1529558pjb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jW4p4/2RssOiDoVxZs5nF9tU9L67ugoqlOl3fS09Y2U=;
        b=dvG3Hpohj4mff8l0pS8GBgpBH03QH33X/SQ8kz60JSwGSZWOXvVhtS8uq7YsGBZ6g5
         Hb/W5BhTzOKOc6c5qyROuV0Aaznt9pw3EcwlcUAUYwtBv4/D2r9UHIGflw/6fzhA4iIT
         mdt4FS5nl5lVcywuzW7rBeR1H6oUQX+2S802ljiSTee9XDjArHgfTE1OP9G/8UKz4h3m
         OYJt0T9PnQtQNfsluD9ClAApvwXZkxBwrwUJjNw5vQ7aye+eQbpMmFPQ0/zSZl5FPCad
         qUMUc2oNQUKJrpNN+BoNCQCWvhcBfN9rlLU+f6XIQdvgLNNovBRk5tQIw15YGUOnb/sG
         EURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jW4p4/2RssOiDoVxZs5nF9tU9L67ugoqlOl3fS09Y2U=;
        b=jxzhLBOLzfF3mJCZSOdbb7kTnYYmO7kpP2RdThs974WYAITktJeOTSWRlwYjUeMfvI
         OiKrR0bLpGfp7ZZ0pia6k+pWYkr8fsYOFd6erXWkfnHC9q9WbChxUpsCXvUvl7ZEjZOK
         AIrT8MpqqXSskmrSCANBaQekst+NZj7ZUvR2i9GCIBfx62KkBimMTS0Lfqjtocq8VF7W
         LsUPuFP/LJ/Qk3LtkECqzk2OLTqSGcJeIpgyEcGOgwdVxD0Rxjq/ghnVWP00vXX1Ix0J
         wGQLYthdTYMIfcaleciWTQXW3lJjxLZ4p4uvjqON750eT5ajGNdQIa2M21b7ZPT1BBBH
         GS4w==
X-Gm-Message-State: AOAM530BhRm1nhlhSaxx7gw/C08tsF+WBAGEstzBN4i+n/i4EfollP/4
	teOg2nooge9sJoDAHanwnoCsBctt
X-Google-Smtp-Source: ABdhPJzLjyZHLkgoBBJ46jQwxYRNHX/P6qRZgczEcm5GRERcdmGu4gpskHXI/wrqYTBK3SlylFqscw==
X-Received: by 2002:a17:902:7783:: with SMTP id o3mr215202pll.286.1589899435696;
        Tue, 19 May 2020 07:43:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:55 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 17/18] libldb: upgrade 1.5.6 -> 1.5.7
Date: Tue, 19 May 2020 07:43:31 -0700
Message-Id: <20200519144332.12822-17-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6bc961cbff095498d5092f57f17be82c565d01a9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libldb/{libldb_1.5.6.bb => libldb_1.5.7.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.6.bb => libldb_1.5.7.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb b/meta-networking/recipes-support/libldb/libldb_1.5.7.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.6.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.7.bb
index cc24863c60..da77a23898 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.7.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
-SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
+SRC_URI[md5sum] = "4d72bbfe7c7fcdf592482a98c853d222"
+SRC_URI[sha256sum] = "b9eeb77ecb94f3b53caeff7cbc1850b6294fa937be4364c53a92a62c6548c001"
 
 inherit waf-samba
 
-- 
2.17.1

