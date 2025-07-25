Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99061C87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 10:22:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.15617.1753435749403326174
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 02:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=OMwjR4R+;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.52, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso20830355e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753435748; x=1754040548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFbOaiuScLvXX64uQG6RoqCHS6f9fQU69pNeTOKVops=;
        b=OMwjR4R+nZL1oF2AJhWHFYQj/IEps669V4tIftbTo6z1MBP7rcbPc5YbC7pzcak1Gs
         92ky2zj0afHoTdGdm8QWtj20n4wcprK1UmFxsOuyKbvZItyoEAspGsl/3U+KpLOopkJ3
         UCR7MlzeYxkMhNMruhYww3ySGpTGw9CnANqVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435748; x=1754040548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFbOaiuScLvXX64uQG6RoqCHS6f9fQU69pNeTOKVops=;
        b=TfiLNEwWKDTab7mg8u95newTzBju+N4xz9anRoTUJ64c50Pb8DJGR7RbM4fdrFX1uw
         ZqMJwudFngfWgnhEG7izxt5MiUjd9kiDShOz/WLe1HP07L01oQBtsg3PZkBdTzNH6mbD
         nW76G6SUc+kusll6eyEowvcgK965IJ0GEVZLcjvO6rl2D4B5u3kL3sEWT16xspcqUz19
         PGMIvMll/8N2uoicR3SxJRo4GjSXhtlFg5ZNh4Pbop/PUkvyr+tEdFQR5mBba+H7Hjrg
         SKvXuh4QPRsckI3UyqlxOeITMwzxFd/q3sTJDLjwQtu6+kFNh4gazNHytQUNQa7I0zaD
         q30A==
X-Gm-Message-State: AOJu0Yx3hDTYUkvcYenN3dB9FDKX8mZonj/g62Kqu1ms3gSfjx+B9UW/
	Tyze8yQWRWaYPw96JM/ZG20BskO4Woicq0m/6OVnvMdH59E+fWzK34FL6+rPQNaJ29XOWpzzTr1
	tJOdE
X-Gm-Gg: ASbGncslTXlw6Sw2/sfeQalMUI5rGK1+dOpdPD3lL8We5/NZ7T1BKXHqXKS75DN8AJW
	0tFG0LA0Uyf+lBWZ9LHd0iaJzH3qbm63DaE3uEFJ3tGCOCcBgMVA3pdCuj46GCRbP0h2zhUMzJm
	MsgAa4/lI+MTBhenMMX6D0Rh01xt9UT0okDiZIJmIdl2ugjLYWa5DFnr8kJRQUlvGLJxcibFfNN
	ceBwPMMA8sTxVytYYsp/uJ6nKiwptJqHYGBXc6L39U9yAelID1M8ud5tvMW2RXwPxo3W709aHBT
	99jzY6HLZoaf2Hr4/FaUF+8mLsFrSihF/9tpux0P3MFwwtSfAfU5uRCj0THzRxpNGOEjNxKXZrJ
	DSRcLghDrL5kFToNWKbMU4BRQrVTrfi5Z0eaLZFbg4JgdYvJfbm65Zf2A9JdbzQ==
X-Google-Smtp-Source: AGHT+IHsyZ2l5vtfKeu76pEHWpTHsqSB6DpBETdUkoevzOoenWfU8/aGquwvz/Nuxd9ybDcXhB8Nlw==
X-Received: by 2002:a17:907:7254:b0:ae0:b33d:2a4a with SMTP id a640c23a62f3a-af61e051379mr111525466b.35.1753435341120;
        Fri, 25 Jul 2025 02:22:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([62.19.251.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44da58sm243520366b.91.2025.07.25.02.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 02:22:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [meta-filesystems][PATCH] ufs-utils: update SRC_URI
Date: Fri, 25 Jul 2025 11:22:07 +0200
Message-ID: <20250725092207.3059910-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 10:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118727

The ufs-utils repository has changed ownership on GitHub and is now
maintained under the "SanDisk-Open-Source" organization. Although the
old URL is still redirected, let's point to the new upstream address to
reflect the current ownership and avoid relying on redirects.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
index 0366654d7b19..3c12bc5fbe9a 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
@@ -6,7 +6,7 @@ BRANCH ?= "dev"
 
 SRCREV = "dd2e655780424eadf7610de33e5966be19168a95"
 
-SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
+SRC_URI = "git://github.com/SanDisk-Open-Source/ufs-utils.git;protocol=https;branch=${BRANCH} \
            file://0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch \
           "
 
-- 
2.43.0


