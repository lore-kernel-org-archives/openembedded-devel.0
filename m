Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244AAECAAD8
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 05:41:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.22021.1661924508961034100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gri9kCZE;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id z187so13407702pfb.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 22:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mAKC91FV29HIA5Ag8Vigr8KIW1A8cjYWQ6yN31KLXLI=;
        b=Gri9kCZEvA2NgJa5t3BtP9Zfznc70OIpZEBaP9l8VIqWQIkltveXM41WrDApDGBtUp
         x0RxKiBM4vpGKHTUhphqdWXz5nv6zvnWIpQWaGHpwERDZK/qxmL9p9kQqM16ktFcI0qI
         wtWOzrfBIpuNY1CsbSnrJzFMNXC+1Du9EC/HxmcGm7y5rPczWw7p4xu2M+sffwlOfSth
         FCZnQPcsjByTyzQWm5vl0o7NVHsXurDSi/tEI2ZsfmKhS4DhogfATpgJ8wb5pZuKPw5X
         YCpPRTz7PHicnA6FS7fvIfq8zrxjl1p6UPSt0M34kJZTieLkZ8FWHIrtTRPdujpXP1La
         Rb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mAKC91FV29HIA5Ag8Vigr8KIW1A8cjYWQ6yN31KLXLI=;
        b=1w2w3IYb0mHea9X5hVk7Yy/ZP53EhHV8sjFz3CZ+roy3roMHgCxJlOw7zQpCdR1KBo
         qF4eOPmMEJ9HpLiQ1ZYZ6LpyxTKOL1OSZEnTLo9Rhm7k0USXee8G5pwvcOrgAtDvRpg2
         rSk6BfDj76dQyCghsup4kP28f4avOust6FJGjCo8Rw6qx4tcdtGxQaeQj2F3S+xtLCiD
         clomjIA2AHNwLj4+Bpt/59s5/xZz/PAcdDINjc5H2HPwikupNanqlRXf8wBHQcKN3Miv
         YN9fNPdjJo7hv9sMLrBhotsSdul6/nnQNWOvBIqC3EzKaw9E/hAG52wnNNfNeNQkXnfb
         uA9Q==
X-Gm-Message-State: ACgBeo1Ki9iT3f+fuHrvHgCvQR4DI4JchT6PRMkVEVms+VOhhQpTKuS/
	lEmf2bV1FN4TVESElE2ZgUyYawKyHBG+kg==
X-Google-Smtp-Source: 
 AA6agR47j3xmkSKQNbtQjXH34jyCyc7RSoKckpx9dtEfKlP9mAQNre/SzyETeraBY0mIpXWiS9Fy1g==
X-Received: by 2002:a63:6a48:0:b0:42a:3cab:cc36 with SMTP id
 f69-20020a636a48000000b0042a3cabcc36mr21033187pgc.135.1661924508117;
        Tue, 30 Aug 2022 22:41:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e80400b001733c13cc81sm7275181plg.169.2022.08.30.22.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 22:41:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] nlohmann-fifo: Update to tip of trunk
Date: Tue, 30 Aug 2022 22:41:39 -0700
Message-Id: <20220831054139.3493726-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831054139.3493726-1-raj.khem@gmail.com>
References: <20220831054139.3493726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 05:41:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98574

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index ace3215396..5a130ebda4 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/nlohmann/fifo_map.git;branch=master;protocol=https"
 
 PV = "1.0.0+git${SRCPV}"
 
-SRCREV = "0dfbf5dacbb15a32c43f912a7e66a54aae39d0f9"
+SRCREV = "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.37.3


