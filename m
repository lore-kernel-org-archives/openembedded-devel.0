Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D6EC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:01:53 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.4253.1634338913239301437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=wi+cHdam;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id i24so46585534lfj.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xFF9oxfvsKVsJBAybduK1F/HfDao0amDTrk/E9S1arQ=;
        b=wi+cHdamnVVbh9DjRH1BOMxtEr+DUErOiKmhaOyVR2xXaUaTe21A0xRKUtvGj7yW94
         eFA7VOE/MnuMczBscfi1Ra64DyDC84hgXpd66bDNOgfic3MPNIqrgGqgjeJt1caGPJgG
         9JpMtKiOwDKvzrredGPXU/75u/k/ymC2cyHAR5o1pY3lnWX+/5POfuifU+z/Wm/9u+VM
         3kM8F6NhQ5WhzkEPY47oHjMAmBoORvKG/pMdc4sVSeCra3+5JREYlXjx1ey4vL8n8tPK
         942VDYkiyN4S/6OF03BivZMtX+AxhPUz3M+Qw0g9eHDSfAyuJhe9J8DUxPL9L1ykrPuU
         flCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xFF9oxfvsKVsJBAybduK1F/HfDao0amDTrk/E9S1arQ=;
        b=7T193ws/jIOU8ejNtHlHu9TVq9Ai0y9DSLJsLAOL4Q5kiJ+2v4RrgfWRYXhYfbdbTq
         n5pGLZoBKvkp10PqwIVMwy24MPN9ft7fbjXFB65IgR5QEchwncrL68/IdodIJGHIJg2/
         R12fXX0u+k9uum6j9h5Tq1EHRQLuGecNtDd2+0MQ9CL4TOWfesNjmWgRhqviBVIbzoCf
         Pmh7nZspSkLXxcQ274PDN4wxSS8RpgkcWAJyz94p4/USe7WLR8HgztnhlU5sDW7Ppoi9
         QnbU3O2+hIuKftKPfnV+UcuNxgZpr+ctcn0XPySlpiyKnSCkbxazwEGlJHqh9bOdz1Vu
         1aVw==
X-Gm-Message-State: AOAM532xO1oNYvoMdNdoQ9N/fCY/q+Tbc5R0qVTMcVfJfwrJdgHbUdec
	k5z3H3mwanbUyZouzfiEnKiM+QWyK8+4HUm3
X-Google-Smtp-Source: 
 ABdhPJx7NtWsMkVGTZM4/rTPXA3DgG6MX1pMNH3iZ0Oy7Xq+ltGZ0Fm8IgL952bZRdbdYsr6uM71Qg==
X-Received: by 2002:a05:651c:988:: with SMTP id
 b8mr15117177ljq.187.1634338911340;
        Fri, 15 Oct 2021 16:01:51 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id 9sm698502ljo.78.2021.10.15.16.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:01:50 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-dateparser: update to 1.1.0
Date: Sat, 16 Oct 2021 01:01:49 +0200
Message-Id: <20211015230149.4165541-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93378

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-dateparser_1.0.0.bb => python3-dateparser_1.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.0.0.bb => python3-dateparser_1.1.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.1.0.bb
index 3d6995adb..5b661a086 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[md5sum] = "24a06a429597239004d47e6b93991aaf"
-SRC_URI[sha256sum] = "159cc4e01a593706a15cd4e269a0b3345edf3aef8bf9278a57dac8adf5bf1e4a"
+SRC_URI[sha256sum] = "faa2b97f51f3b5ff1ba2f17be90de2b733fb6191f89b4058787473e8202f3044"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.25.1


