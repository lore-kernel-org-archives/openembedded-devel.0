Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027F0CDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 09:41:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17349.1782207692604183684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 02:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CUy6NxAy;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-461edb387ddso1200994f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782207691; x=1782812491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzApI98+gM0bI/rDku98+QCMrj+5WtC1tgN9j5zVMS4=;
        b=CUy6NxAycISexpSbElwzKKWBs6I2+bQBynB82bqMacrZ9m2SWENT9IH37CeU3EDe85
         PUeZS4Ooq5Wk+zGMfUTa1i0tFnfogNTtWDdF1R7Cxg9YWeAPlqOUcZ3OVL5RY4x4p59d
         u6e8uaj2qptDWsJbHOATwgwQxAsleSsEsGLt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207691; x=1782812491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzApI98+gM0bI/rDku98+QCMrj+5WtC1tgN9j5zVMS4=;
        b=PPhsrd6oPP2MAWmndxVlCbRA3/kNNXSgFtzbj//VbiSGZ24/d+8KDXLFehiwviGy7h
         7ttlfLrriZ+2GRwebKJt672DMrYi1V/q8suizeEjhS+Zkl2+qXHLZ40O+Fuk1DYIeLMI
         ZTqjLIMbyBkdF72WpgA0pfYR/ShZWUqCmC/YKEHgXKrvImco/rsu4G9xS6VS0eokpr3J
         fnPcxH4OVYUY+s6Z31RvWQFDBBeD4n4JqrA35hH/GDdY1B/iTQkU5mbkSpgFa8TdJT40
         +/PPBTb9YDRCpqKqhk2xqrO9YVkIS7RaI2hRuHzSsN0SyBwr9iRjVhPjRbZRWH/EDD6w
         IugA==
X-Gm-Message-State: AOJu0Yyg6IZw5AwpQSi9sZd6svVKBCcdTVd4u5DqUFTQn4AuZtkpiVtt
	rNPDjjmOVOOo7bQ8SfOQygqh0Jguuv7f39usjhwJXXb7YSCfHRsp04R1WDblYipMLY24RECWmI+
	9dS1X
X-Gm-Gg: AfdE7clY336pOYJ0h/iNZyY9rkbERizmpTyptUnnVmNGqJ/tGQnqg9skJcDh44MCPd9
	+sbKzSk6PkzK5LG1bSC7x6bAQIMa0k7obg9Len9tPehRFVFzIxnZ3gQYrkUFgYmuijMxROxLtzu
	Av4WiabSc1Qz5ICJsbn3nT8ZZFf6j4o32z6AbTTgOkzUCytVZ8OTD13WkDTu1RcErsBW+xF+FL5
	Bnd0VCgucZazxdcOhyDjve9FomNNPwt+GPGMc1n0eC+mQMVsmhKTFlXbO8hsqM16qeuyZ4ruY70
	qY0vYovicjIT4GUjUxltsNqsnzknlVYAtCSLB1KaIN2hDNGY9+JWZYq6gYfNrlkyJDfpvXrO8Rm
	2tUu5AKo2ItTuyMYkIuOulO7bWW4a+aOd3lJeFwidQAIbGYNpq6NqnOcorAIv/dJSd9X9GtgGiG
	SbAfETGvxTVKkazibbbMoR0xYvig==
X-Received: by 2002:a5d:6206:0:b0:460:71e6:e11 with SMTP id ffacd0b85a97d-46508bef711mr24215435f8f.24.1782207690731;
        Tue, 23 Jun 2026 02:41:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm33581597f8f.14.2026.06.23.02.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:41:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-zeroconf: Upgrade 0.149.17 -> 0.150.0
Date: Tue, 23 Jun 2026 12:41:24 +0300
Message-ID: <20260623094127.1592848-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 09:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127697

Upgrade to release 0.150.0:

- Add async_update_interfaces to rescan network interfaces at runtime

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-zeroconf_0.149.17.bb => python3-zeroconf_0.150.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.149.17.bb => python3-zeroconf_0.150.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.150.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.150.0.bb
index e0ab47d3aa..170d0b390f 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.150.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "f10e58071bc5e749176b8dc8d7e7ed4d2e6b507dde20fd8169b760cf4f7f4c5a"
+SRC_URI[sha256sum] = "a5fe7feab1de6ef5e541e0a3d07e534fd91629b813fc27281593584100f63164"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3


