Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356D7C61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 20:34:44 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6959.1788010058781121421
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 06:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20251104.gappssmtp.com header.s=20251104 header.b=CauY98uM;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.210.42, mailfrom: nate@nkent.net)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f434cc1c5eso1854537a34.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20251104.gappssmtp.com; s=20251104; t=1788010058; x=1788614858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZfsb8b10MsB219WfwVEdytlsh+6X/fNZ5Wm7lri6Sw=;
        b=CauY98uMmHAFCeaWItOIjJQ0YEphLYx4S/w/XJV9qjwqbesPHXjumXMpv4UFzL03Ic
         ujGej/oPtP6OWei3I6bMkePmVKJ4IyvUz/BZ5/dAoJteqRg9rAoGHLF+6/xAdU/03wD0
         j1ibDGi+xgc3U4vSw630lA4jfblSERfzoxZtCWHEwhrIuo7IGO77z5IuWb26zMwPXIxE
         ZZyqSBlq3G1DXxm9jkzIWw9wt9fEdQEjoBgPrY4mE1dXMiGUDIYDOhbCjX761ytHFks8
         uoqRgwJV0QguMn23Uhpi9EbVPXqw/0SNOFfuWagCNoMEU4rTrbAiYzlA9+JVIibTLAWU
         ILRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788010058; x=1788614858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZfsb8b10MsB219WfwVEdytlsh+6X/fNZ5Wm7lri6Sw=;
        b=UThYzXXVCNm5kxbdD6BvZxDDMV2hEKfUbdcKRoxhxTgg6gMXiZmjKr1OGaxJM2ft3C
         vndUYw2rknm3eDqjeZbeZgx/SdM9GfzH9cAeYVehTkzMJ4BA9jYsJnOf/tamiCG1FL7s
         9EwOJjZxwvzV0bX3tqZ4zCfeXvSMhDuW70uBjuppWoHfyOoHyZcnGjHfZH7UNfgziSHL
         6ry4vK455pZKHhtUnBvC71p3hB9pxZmk0Pk9MHgR4mOxDdUA2bNWF34CstLnT7i394Y4
         hP/ch1QAnmRnmQT0ZESiVh3EQy2wKxlklXtO0/n9otQiLMCvMmVo0gop8PhVse+sCrIS
         vGMQ==
X-Gm-Message-State: AFuF++mXS99khxjMO6rjj4HcocbVk2yfB/Ks+HE6kX1xLkbJLphiJOua
	eTlSENN38MN/lcVf7yZQJtWBcFQyX8plo5PUAqOA1koOnyAlwQ7zMqANr3OzNVMh8zqdm5Gfxdp
	f5IVv7/TtIg==
X-Gm-Gg: AR+sD11n0nsJ1CSHUNMvQbiHcwU2NbticGSQ3v1dJQlhGvnLpiSkr+avS2WJpYvCR74
	TZZDN/4l2j9VMXzSyCEiyWA7ASR/YM59UxinUflsNekiLwdp1+uyVeiTXOO450DiXmjo6xkthmZ
	jZFfvfHJR1DvUNg9JFrXmlEvlrv+4JuZ3u03yTdeMZvcw7JoDpEPSRwxTU32ByWWvhH0tRE6cXQ
	1DpGdXpSJx1sZXA8/Pg+fpB9sK4iEzfE8uXa9F0WqxQopeB6IyLoXZY1gf15L2dIvyBOR3RHXEn
	qKzNXKuPadfWG7ZlAlznrEDr3puuySHyCALn/liNXSHW+8jz6WfeaA9tWN4VEIUqpZYwCmzSYPv
	HcOob19dZ/qyfBZ2btpUEZaTGhnZ2B5t8Dg/0aHT07yWN+L0W+RPhbwP0c6zaSTiupFbWd3yjTT
	hjVIgqvjZpTETv3CxNxviSPQf6lA/YYQFsqWFx8Bfdxjz1NFHaZ8o4IWhI/dE2zDpIdaveUvcqN
	Ru1jxsp92VxVOGG1DIauQ==
X-Received: by 2002:a05:6214:5a06:b0:90c:5947:7e64 with SMTP id 6a1803df08f44-90ce0bf74f1mr218555556d6.3.1788009609128;
        Sat, 29 Aug 2026 06:20:09 -0700 (PDT)
Received: from akatosh.telenet.be ([146.70.165.85])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5440sm38475906d6.27.2026.08.29.06.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 06:20:08 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [meta-networking][PATCH] nng: upgrade 1.11 -> 1.12.3
Date: Sat, 29 Aug 2026 15:19:55 +0200
Message-ID: <20260829131955.3572355-1-nate@nkent.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 20:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129581

These are bug fix releases, including fixes for a few security bugs.
Running ptest on nodistro qemux86-64 shows all tests passing, including
the previously failing 'httpclient' test.

Changelogs:
* https://github.com/nanomsg/nng/releases/tag/v1.12.3
* https://github.com/nanomsg/nng/releases/tag/v1.12.2
* https://github.com/nanomsg/nng/releases/tag/v1.12.1
* https://github.com/nanomsg/nng/releases/tag/v1.12.0

Signed-off-by: Nate Kent <nate@nkent.net>
---
 .../recipes-connectivity/nanomsg/{nng_1.11.bb => nng_1.12.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_1.11.bb => nng_1.12.3.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
rename to meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
index 031827a5c0..7f8a3986f2 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.12.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https \
            file://run-ptest \
           "
 
-SRCREV = "84aa701f42968bf536141a24e826da66963b571a"
+SRCREV = "73f715235967afc783e0b99c52d015dc10897fda"
 
 inherit cmake pkgconfig ptest
 
-- 
2.54.0


