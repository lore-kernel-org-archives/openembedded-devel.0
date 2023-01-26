Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFD8C54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 18:43:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.82289.1674758621010944729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 10:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jUiwD+wA;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id m15so1765509wms.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 10:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SquO8ipSmnTyWvmWmXr5czGyBqrMaeutw8nrWdchaOE=;
        b=jUiwD+wA+lbQY1LtWASUXfsza5KPVIAoT8aajDOTQ7To6oFidcy6SY6uS45ucWJQ7C
         sZewoKjw8yXCYCnh+tn+444G9odOjONoZKXqODyAgMeaHvilsv8WJpWbFLoMco5Juth0
         oAz07NY6aBQfThr6fhbmoCY1tRKbspiTIf+wWzctSBR0jj6girmuT2R2t+6EDmFuFJGO
         TvUQwmKIam0g6IH5TjjBSqu47vJIOF/fNyTrfkoVUOGg2LgTRAdFvxzQZPVVXURyncy9
         tJboiz7tPqr3u/usAxXXsTKLzeBIMqdC1nH7860XFzwVSwKLSXCRKDuL0V/sGWP0oeRd
         Q7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SquO8ipSmnTyWvmWmXr5czGyBqrMaeutw8nrWdchaOE=;
        b=0Qj6z6FtQCX6KxRa4aM3KlnpIFv/aedtGaqgBm0lazWst+BXN2n+q9rtGapfhqB+jb
         cc6A5RCxsB/NWjHj8yaDit0wvxqTS8aqVZh+24/gwDHJFfHdMqQWx5SMaF8fGBJG20j3
         bP7mPbhjqt9wveMII7vRdYxKLB5LbcF2frv0yTbXV5drUj18WdVcZSQ4KVL6ghAWBgyy
         czoB/NBsAhzE0sNAjkf6QMDwXWPFESoub8Ss0F+oO5qrmVOPzPAV2OsdcNLILdc+kGeJ
         5c03JgA0GV7xTceNVIUtx7mUAjqWM6Cylzkeo6kyKqEts4AX2SiUoAweRqP5tSPi+w7m
         BJjA==
X-Gm-Message-State: AO0yUKUKB0U3mgZKIYfi5XCZ9TbuAYLt09UCRzKt+dBSzcm6M6GArVsL
	A5c8qXWFpnOtJZTPvxHibpUAC27G274=
X-Google-Smtp-Source: AK7set8C2+tx4wzGBBBX2j2V9k/w/kwzmpTHFwzEJHCsJ07zgfbAROJPEakfc0qvrweB5uaBbGIDMg==
X-Received: by 2002:a05:600c:4f4b:b0:3dc:2af8:83c0 with SMTP id m11-20020a05600c4f4b00b003dc2af883c0mr2385014wmq.31.1674758619376;
        Thu, 26 Jan 2023 10:43:39 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c2e9400b003d9862ec435sm2089910wmn.20.2023.01.26.10.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 10:43:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] htop: fix Upstream-Status format
Date: Thu, 26 Jan 2023 19:43:35 +0100
Message-Id: <20230126184335.898455-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 18:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100799

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
index 2760162acf..d85aa15637 100644
--- a/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
+++ b/meta-oe/recipes-support/htop/files/0001-Use-pkg-config.patch
@@ -9,8 +9,7 @@ ncurses*-config applications.
 Signed-off-by: Paul Barker <pbarker@toganlabs.com>
 Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
 
-Upstream-status: Inappropriate
-    (`ncurses*-config` can be used outside of OpenEmbedded)
+Upstream-Status: Inappropriate [`ncurses*-config` can be used outside of OpenEmbedded]
 
 ---
  configure.ac | 12 ++++++------
-- 
2.39.1


