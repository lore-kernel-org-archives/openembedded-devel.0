Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B05FEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 22:03:42 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.4817.1688508214163423291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 15:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f/O0gW7U;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a0423ea749so4277639b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688508213; x=1691100213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsMhUcirUbumIapYiUuzxn8ubOuPraYnvFFZP5ZiQ9c=;
        b=f/O0gW7UfsM3iZZcWOcPYdhDDmRHEXx/YefkPX8Cnay67Ak2EyRm6mbExox49tQzRG
         6Ub4VNjyQbHg4T/j1SlIWvAE7OUXcKHcZrC4otg6HTWMHXOGVKcYIaR6cEIU1I4N8NZg
         b7fDW4INQTbdGqY+7ncPVWgVBVE8lw1q2NgNm85jJIiBJJzkSicuAJ1v2gv1r4cYYlbq
         f/+lFwflqGpQuSR+RCez9AgOZAoe4FQ27mp+LEhI4HL7NnJfLrxUhbQP1/98aBM0sJwO
         hL7rzkV8MxQWMKn7Q52tY5AGUisuAz5sKDQNCROxADqqljmOwDWukB39yWxb+2aAWSJZ
         ECZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688508213; x=1691100213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsMhUcirUbumIapYiUuzxn8ubOuPraYnvFFZP5ZiQ9c=;
        b=LlAJPmuRjqVNVZXKt2lKhvMsv/nJR/P3RgItqVqNXSh0/vGH6u6OZnKpvRi5EBu6Js
         oJom8xRGNsusk2+ecihkpS9c08+29mzfT0DxOFuevEDJQp7ynXYiFk49UPKjdYPoCEA7
         MJ6nKDm/u9fRwHimloEd+SKTBQYBF6eOhtO6+U4QaYOlY1y5KMiTgQ9PWPJC2cSb/0Kj
         kdH2PrKq9rNFtx1kfxxcwUD3yAE7cxZNjm5fqlMJsaZF2rb3cyBv2s+4e2pITDjdrRsW
         mTJAcDaf+rrlzpxUPi2TjloxpxRVnHZjmg2hGWfcbcoIo99ygm8vsbPsQ6TnAGSySCQ6
         3F/g==
X-Gm-Message-State: AC+VfDwDF9tbdpyirO/e8Lib06a5EilAvkChu0rTHy1FzgW12NRWIERx
	gt1G63BAsie92m2J1hTz4Pp48hhadTs=
X-Google-Smtp-Source: ACHHUZ6pOl6r7pnhpCtZXcxOawNwY1KcLXH2Lihh1rZp3C+BIO5ScrmwHb9LkLt0PopzVaxvNpoL8w==
X-Received: by 2002:a05:6808:b2a:b0:3a3:7505:700a with SMTP id t10-20020a0568080b2a00b003a37505700amr13111141oij.44.1688508213101;
        Tue, 04 Jul 2023 15:03:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::e2fe])
        by smtp.gmail.com with ESMTPSA id s21-20020a62e715000000b0067b643b814csm12419850pfh.6.2023.07.04.15.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 15:03:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] ctags: Extend to build native package
Date: Tue,  4 Jul 2023 15:03:14 -0700
Message-ID: <20230704220315.1958265-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 22:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103663

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ctags/ctags_6.0.20230611.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230611.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230611.0.bb
index 0fd3f8c4fb..1b8d367fa7 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230611.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230611.0.bb
@@ -32,3 +32,5 @@ PACKAGECONFIG[json] = "--enable-json,--disable-json,jansson"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 PACKAGECONFIG[yaml] = "--enable-yaml,--disable-yaml,libyaml"
 PACKAGECONFIG[manpages] = ",,python3-docutils-native"
+
+BBCLASSEXTEND = "native"
-- 
2.41.0


