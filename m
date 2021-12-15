Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615D5C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.2063.1639592284326371811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 10:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M8QMHaz1;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id l18so16108678pgj.9
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yT8gD+ZfNu6qEZQplmKFRh5dxnXH2FPHJ2MmvXNEcEo=;
        b=M8QMHaz1Mzf258zhcceRgtFdOf7nWw2n5PqmrfkAcGTx+0y2dcSSXTJyEfRdBAMY+d
         tuW2xMgyjWMY7pT+6MrQI3psko0/QR2H7UtNGl/Ju8XZkqK732r5GH0G57nqHlBePcUR
         i5uCLb87tWppAhLr7X5TidlBV6bCOIicdUsQ++LS3HqgaBgeZ+6SvAtNYcl000M3gErU
         pr1XWyaL+tpapBdvl6JGq3YV1Nf7dHEL/XkzStZNVCVgiikVi4qAhCCOgYImNLVlXqAw
         nEuvB3cNF+QNVbltK5oP5DRsRWD0TqHrObEsTGnMX5o8zzFrQeUu7Hrv2y1s96vW6wSr
         rgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yT8gD+ZfNu6qEZQplmKFRh5dxnXH2FPHJ2MmvXNEcEo=;
        b=12QwE3PBKZcP98beudsqgVwdtzZxNgc4I35ajIFX6wONhbl9UHwgZYWXow6Asz+Ye+
         U1XOyiM2tNuJrJwXS34AVt+7lW3GRf6weggGo8LN4UlRUIHj6WmYzkxo34d9InF7QsEn
         qPUJsWqEqGHuHysASm8vw0PYNLCj2DfAyIgNWefMVkNznjzmkIH2nmJmRzBFbEs8sUXo
         uXK6gTCHYQsUifXnW/TJWXICAyzFdXnZNrIvWnqB7Ulq/xbYYYX0726Ntes/Ev02EN/U
         plOUS4p4J+fHKOtKPrdWQC1geJ8D8QFYZ9/TzkBD0ST/Zr2qye9NwjlvBnVTRTZzCswz
         6hTw==
X-Gm-Message-State: AOAM532H1d0oOS7sH1wqI/rNkHWZBa75RcvjZXi5uRMR62CU7oQ/yi4l
	2atqdTcC9dW5pux//xPPZU0Sa8Qs/MNsOw==
X-Google-Smtp-Source: 
 ABdhPJyUTy1LBpsAQ8ta+1mUHlQPYFb06lrhfnIX/Grz5YQ9UcwJUGoaNaHDPB/BF9n0F5hgx5wyAQ==
X-Received: by 2002:a63:1950:: with SMTP id 16mr9101357pgz.422.1639592283620;
        Wed, 15 Dec 2021 10:18:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 h5sm3556010pfc.113.2021.12.15.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 10:18:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] inotify-tools: Upgrade to 3.21.9.6
Date: Wed, 15 Dec 2021 10:18:00 -0800
Message-Id: <20211215181800.1636004-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94369

Changes
https://github.com/inotify-tools/inotify-tools/compare/e268888...8f8fcdf

Fixes build errors

/usr/include/bits/stdlib.h:46:12: e3.21.9.6rror: call to '__realpath_chk_warn' declared with attribute warning: second argument of realpath must be either NULL or at least PATH_MAX bytes long buffer [-Werror=attribute-warning]
|    46 |     return __realpath_chk_warn (__name, __resolved, sz);
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{inotify-tools_git.bb => inotify-tools_3.21.9.6.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/inotify-tools/{inotify-tools_git.bb => inotify-tools_3.21.9.6.bb} (76%)

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
similarity index 76%
rename from meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
rename to meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
index 5383d0ddc4..489ca56b91 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
@@ -5,10 +5,9 @@ SECTION = "console/devel"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
-SRCREV = "98e8dfa47eb6a6ba52e35de55d2de21b274a4af8"
-PV = "3.20.11.0"
+SRCREV = "8f8fcdffb7e80928bea6c1fccd3527a9f5d8fe77"
 
-SRC_URI = "git://github.com/rvoicilas/${BPN};branch=master;protocol=https"
+SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


