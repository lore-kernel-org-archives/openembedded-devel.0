Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509C9C433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:12 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.17853.1635592571231827892
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NmKxbwIG;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id g184so12401449pgc.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MkV6hslx9gDI7+5vS7NmJol8Q7oM/8dKloT0O9jXvQY=;
        b=NmKxbwIGvbIjYrjlQWkj+MYf2kpC/d81CagfVQJaZwGHP7KwhtD0k4LsWkQFI02dHg
         +K12KugCACWbgG64hI7tlFJuboZtkb98HlP9rfIn6oCnUhuYPIZUUc59sTanqMR0rF35
         5Li8qZV3A2fAFxXaxrVxU+kjJIqnWpBPR//Araf+bjjsAwf91ZTv+S+EPpz/Znx2bZCR
         7QQ7yHrsP5ORoonHrXLQ1QK+Q1hFctQFdjtbqNO6Xbq5W//qPq0CM09m2NZMr3mg25b0
         wl1vfarS+KiwZ4s6qsC2TTJbCWnpIec9dTDwjKfRIZbn8UP2FU13sQCnjfh9zf2in6/n
         SMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkV6hslx9gDI7+5vS7NmJol8Q7oM/8dKloT0O9jXvQY=;
        b=k8ZjNhtki6VPNRrmwPCfoWxjidXNJ3e/2WwGy4zVwCbIe1iITlPG0zSFxmGqSB0dOd
         e5PQ3xI0O/48pMlay/1gIJCpJYq/qoeWCZBHQvzblBMiPB7sCXlg7G8b8brCCBto9EZy
         H3EaG1ZShkCFZz8kcVVb9LsQlB6hdLi9wS2nIacbZiu9+XyqgI7RSNjF1ybYQrZUPeHs
         w6fSrDXfnwyJ7j791EZSgY4D21mFlqfPTfebBcIF0gWGhlaIf0B/CIZUfPoIZ77DHS8t
         7O595QZJd/+wrv+iFZLDnB6Iso7/Sz1ERCmRjAiMkWGDuFZrws961nF6e47nhaYREpG/
         KIBA==
X-Gm-Message-State: AOAM531QAl8azx4VCGOWbEGRvfLVVEQ4YuRm9atcKNWzY5cDEWBfiUUs
	gaZZ7liiqHaoCIQ6pZq5aiQhpYQeG44=
X-Google-Smtp-Source: 
 ABdhPJw/XklBF+MlOQj927OfM5XTcp/M3HMAL4hsgwy6lLegb/8+Vjec45WfXIPB2Zxq8Zvg6CwIvA==
X-Received: by 2002:a05:6a00:24c3:b0:47f:837e:a6fd with SMTP id
 d3-20020a056a0024c300b0047f837ea6fdmr7156430pfv.71.1635592570488;
        Sat, 30 Oct 2021 04:16:10 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 13/14] strongswan: upgrade 5.9.3 -> 5.9.4
Date: Sat, 30 Oct 2021 04:15:50 -0700
Message-Id: 
 <74d9770221861f1253493adc77b5e1f21cf39564.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93670

From: Yi Zhao <yi.zhao@windriver.com>

Add openssl PACKAGECONFIG back as the openssl 3.0 compatibility issue
has been fixed.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cb08584d8c9e8e1fd9436d3e9466bcb088086de5)
[Includes: CVE-2021-41990 and CVE-2021-41991]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/{strongswan_5.9.3.bb => strongswan_5.9.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.3.bb => strongswan_5.9.4.bb} (98%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
similarity index 98%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index ad104e44ed..cbc263d301 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "9325ab56a0a4e97e379401e1d942ce3e0d8b6372291350ab2caae0755862c6f7"
+SRC_URI[sha256sum] = "45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


