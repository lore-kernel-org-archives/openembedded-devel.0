Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0308C77B73
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 19:40:23 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.23855.1685907618453395047
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jun 2023 12:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gJdbJO/v;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: geoffhp@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-33b3cfb9495so20496625ab.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jun 2023 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685907617; x=1688499617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jec53ieHY/S6Ca29MfE60cKMj3YP01Jmdge0FyfUPog=;
        b=gJdbJO/vdQ0tkZwTnkNUMWxZOr50Qa9htQD3MD0IiQEhfPVZRo7t0XXE1MmfIRqMyr
         9kwrk/tzIw/MXfT6laNPlQt0yucGVvkvPy+PC4Q0B5YRK3dtevz+M1BPIu+vElqaS6iA
         IQrg/p2HbE9wx24WPmpZs5wqyxIWlpzHxVX/YeZ9gggEcSznV1NvLvBjRuByXTO/NlWW
         cSBk1AwgSTpAQU9C0MYuG9MeX/qeQyt0kQVD6Pe/3N0Ynhya4mFF0PPYuHD6EENnUjmS
         ArMw0hKSa9MubHdzh858GP/ah6j1M83jC2EUfXGQZuJLdroKLZw/vminoRg533lJzHHP
         PQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685907617; x=1688499617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jec53ieHY/S6Ca29MfE60cKMj3YP01Jmdge0FyfUPog=;
        b=kdmV0rG8AxRBkxjKVAHwihPq5FKtWEqmofqSO9PPSjOCSnCL5+L4ie6GnXDlDtwXFm
         5tWEv0R2+m9WvJUMJCutQRTBqDGTABLJsd0Va6ns+9Yj+saf5RFme+RMzFTvpLE9bQ0f
         5WGSVUZYXfwwF4VpJJvLusLMrUQJXdT8ZD/mdg3ObDnpGz+3eCDvOztYN4/25CnmEY4q
         Z/TAVHat70/tWRhO8Gb+9cX4Ll+p3RLTJwQRnUDBoo+Qg/B9hx9jpYhER4u5kTDMMY53
         s5kjw/Wh8oYUsgU9h66UUikBefsBk1XbMe8FGPLnx5YVjlZBN2eXyZbMKl2rMEu8xUWJ
         rjSA==
X-Gm-Message-State: AC+VfDyee4lxzMbVlbjIAdobQfdLeSuNyko9/TIDlr8qhE794baXyOwK
	/L6I7TQ4Xr62pz7BstNDS0iLHPpvtZA=
X-Google-Smtp-Source: ACHHUZ6YFDxxCeZqRcgTjaRzB6JBuWTCTRrKRKOFM1KwgBPKFwJovcKKWgFx3b8I+1jwRaFH9lFINg==
X-Received: by 2002:a92:dc0e:0:b0:33d:825c:3266 with SMTP id t14-20020a92dc0e000000b0033d825c3266mr6830992iln.1.1685907617339;
        Sun, 04 Jun 2023 12:40:17 -0700 (PDT)
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id j64-20020a638043000000b00520f316ebe3sm4397340pgd.62.2023.06.04.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:40:16 -0700 (PDT)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH] python3-platformdirs: add nativesdk to BBCLASSEXTEND
Date: Sun,  4 Jun 2023 12:40:16 -0700
Message-Id: <20230604194016.4113354-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jun 2023 19:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103105

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 .../recipes-devtools/python/python3-platformdirs_3.5.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
index 4fefe565f..c5c3d9fe6 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
@@ -32,4 +32,4 @@ do_install_ptest() {
         cp -rf ${S}/tests ${D}${PTEST_PATH}/
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


