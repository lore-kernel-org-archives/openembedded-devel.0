Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AA0C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:37 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.23551.1668873510322161459
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X6np20hG;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id h24so4938757qta.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4KByxGlYgBjAIWA3hsfk59GGDwO1T1uMWHLOM6UfY4=;
        b=X6np20hGxPJSdcXINnsUL66DmBO5VocPWGhzVHhOrgLiZOrytXy3SZHOrjjM3JeoOL
         Ovk4IQvTw0b48nACmk1mkqPHAHi0RqvQQ1qqACOcBNXIJGAQ9DOpnMiyd/EMaMdj2T1g
         Fjt0BJU8ds3A045oawSKghTk7ivxYDPxcr3PxDoAYKBLz86BpX/b6lsn/frsX+g0t3C6
         VTVbIbol+YxjTgaHRdxfUy+WyxQVHvKJ5MUB/F9lgwPEywH3DOKpzGpnCRvjhMvT0ZoI
         9RsCxecSi4zX6JZC1tUvEdA2SU1tiiNQALcmzFroCRIh+x4z5BKSRpUoFJWYuQG93piN
         91iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4KByxGlYgBjAIWA3hsfk59GGDwO1T1uMWHLOM6UfY4=;
        b=WnoTCex+ic/l54Wn9sr1eMf22odFcqzNJtSYU3imBrpv+/eUU1F98YO1JuujPlj+4t
         PhzsqrE0AJZ782L54h0KUFsHBUtb2fxYdQcyahtrEoCqw/tRyxCkKixfiZBuLmFoZk++
         b0pXWOLvwcPL673ROAj9LU3lOfPnaQ9q4FaVb5EDiSKb5zq3I6s8c4As7ZIMNtcf5jIr
         Du/R2BYvXc5oeaY3ZfbtjJ5OLh7zVInYGmF1H367nFyKztjj6/PBaMfGahyVcLRyPX+x
         p7FJ/0BnTRXbhWBA0MmBIEQnP6umk6VzWR00vrqG7rOY/SWvtkbqSyiHnOa5tz5W10Cp
         Db5g==
X-Gm-Message-State: ANoB5pnT1XVbY9jvM3iZtw0VPdiQ2sSThDUOEqKkY/FaEo457ZK4p64A
	eWpO4jdHQ734MqmMFNg70rtQS5CAh1sBDA==
X-Google-Smtp-Source: AA0mqf5iz0MKKznEDfL9zJsblaHcurYYZC558YOnrY8tINgtNgT+PdJlJ68akTbOoPPNhtWoZRLQUQ==
X-Received: by 2002:ac8:71cb:0:b0:3a5:ebea:9950 with SMTP id i11-20020ac871cb000000b003a5ebea9950mr11016545qtp.535.1668873508910;
        Sat, 19 Nov 2022 07:58:28 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 18/35] python3-pika: upgrade 1.3.0 -> 1.3.1
Date: Sat, 19 Nov 2022 10:57:42 -0500
Message-Id: <963077a7726776ccb8e8315753aa2bdf547161d5.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99657

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3b17c8b52086a66441ca3703449a82b7a599ea0d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-pika_1.3.0.bb => python3-pika_1.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.3.0.bb => python3-pika_1.3.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.3.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pika_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
index 7ffec26e55..075f3bb577 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "15357ddc47a5c28f0b07d80e93d504cbbf7a1ad5e1cd129ecd27afe76472c529"
+SRC_URI[sha256sum] = "beb19ff6dd1547f99a29acc2c6987ebb2ba7c44bf44a3f8e305877c5ef7d2fdc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


