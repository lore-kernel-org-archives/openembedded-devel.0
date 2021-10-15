Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913D6C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:29 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.4305.1634338589043235793
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=GyWt3zNP;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id g36so30995960lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=41z2ozPAZz1soZ3nTFELYmYQISgac0eq99aH07n4V3c=;
        b=GyWt3zNPjq1VUSiC7oNYdN0BJSH2SoA0pdRPpttuJ4kTa0QqBsnyhzHX3qQCHSV3bM
         ghg/f/179gfoPewdF4RLb6WNpCXOHSGWwnpt8eKuBr58Q+Q4ik8LDiX+rQJ+/N4XbJTb
         PJGMXi/rB6ECw/bC7Nxva4wnhB9qguaz9BHyyk4a/hSlfQJviPc8wZkhjFMoCa1qvZGi
         eDWHxYXp4fG1Pka6RHLgggUYjp8QbS6YjXyiBCISNiJRo9eGY7o4c9OvQi9mcNAJXMxr
         IvrR6uZBmlqT8Lxm7xmkmADYZbpDv9Ro6VjB3cmZnIX0tppO0QgT0rG66mmX1Me3ycUu
         TtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=41z2ozPAZz1soZ3nTFELYmYQISgac0eq99aH07n4V3c=;
        b=iP1tjvIgo4xqPw7k0qQI8GG56F7lI8B5yz0w5HLMObwwFwr7mg6nIaDMq6wm2mGG0S
         lwMXcxRgkn16FW7YYFvvPU4NjhfLKFqxuv72wLzLH12KluSPdyPkrABfO6IAF2Cis4nF
         0iY+kMOzh+uE/zU7jr6Co1TglIFk9siNhBwgD7AplgHwAcPqwZFrZAaOiLsfogaY4MWH
         mlIDcYMRWNczd3t6qyzJTSXx3t4JlCEQ6zQeuEO/TejKJhxMLnLLA1cejbn3Ks4VSj54
         +pmeY5pGpRT0Cj8vyhvQ1IHd5UnQp8kYh7q/Ju11I4kHdrb7TfXO+SLQe0JDlVNrAnvu
         yflQ==
X-Gm-Message-State: AOAM532NpWufN/hZrkFZxUOBbzn7eHaTAB1fx/1ozwK4HBYf3Y3XcMZQ
	v7XwX/NG0GBr+CnuzIFp7pYDiPKW3rAKFRh4
X-Google-Smtp-Source: 
 ABdhPJw4vS4N2mEqhjXGZKPxzSDEOHAxkThfjcYH3SpMPuql6n3oN32vlM1/YstnBmFn7xO/2R2B/Q==
X-Received: by 2002:a05:6512:1691:: with SMTP id
 bu17mr13268485lfb.401.1634338587118;
        Fri, 15 Oct 2021 15:56:27 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id 9sm697287ljo.78.2021.10.15.15.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-protobuf: update to 3.18.1
Date: Sat, 16 Oct 2021 00:56:25 +0200
Message-Id: <20211015225625.4162870-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93358

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-protobuf_3.17.3.bb => python3-protobuf_3.18.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.17.3.bb => python3-protobuf_3.18.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.17.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.17.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb
index b43529cc9..8ecb3ab6e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "72804ea5eaa9c22a090d2803813e280fb273b62d5ae497aaf3553d141c4fdd7b"
+SRC_URI[sha256sum] = "1c9bb40503751087300dd12ce2e90899d68628977905c76effc48e66d089391e"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


