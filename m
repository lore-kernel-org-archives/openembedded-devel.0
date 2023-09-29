Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0392DE77343
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:28:30 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.30977.1696026505450706287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=be2s90mv;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9ad810be221so2006216066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696026504; x=1696631304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dThlM2DCE9fwg5VzpxXIzqH4QzJ4KMu2XbESaW12TXE=;
        b=be2s90mvvq+j+bb0POnTDxGvpL1gI/BCQq4kKgrK/AcNUQopPrCRcXjF2WL21oSl74
         4WMPPNYxsdXBuwJtlGXXV4W0yoNmDqQnKAL24Ttd7mzsm+q9hR2mIxK+pxahfdZeVz1C
         KJdXpZXlaPxpSc7DNZ0rjUMjdBOQRvlHjXj1HwNGG+E6LBIXE+suCfHZlwObfFwYLYta
         nmO9+5/6ABOw6GccwW3OYml+VhGwdMIyvcmfp+NLz6kUs+bQIvcKs/MEsH8dPRdFYoqq
         ZAtNUTa8qQ5FJi0gi35UZffkF6c1UpcL+D1oM4z1XMi/CflU3c4cfXDQ3o9GnyMTypV9
         GCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696026504; x=1696631304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dThlM2DCE9fwg5VzpxXIzqH4QzJ4KMu2XbESaW12TXE=;
        b=dRzyjU8t8zvlVZ+M3x8DCBN1qoOaE5rX07oBEaoSf/qEeysDfLRaGlncCrwNkuy3Pu
         Lkt6vF1665dLKUcZlo4UsX5Oh04pk/kONUklkWIjJ7jwSoNLkNvcyW2wOOCPgB34wEer
         JkpAdMZ6aDgTa0JFG7SYRMSX9bHyRAGNFWQb8nnIUP8avyautdFBvhDuLluA11DmdZvm
         u7TDIRoDHz3SG2pE/xy5MAYX4asO2rOi+puKyhYbv+eQzyh0cReRZt3ZSQLKjAaOxBd+
         HubyaZ5WnenfN2SKIJlgNYKDNB4Yb13+rb9w0bs+bs1voIcnCB4EzO+W9e5wvWlWRQUi
         6qkg==
X-Gm-Message-State: AOJu0Yy9EszU+Nn0vDHKAe0aMxxUXTDWkftauLfIyvcqpoCicAr28NE3
	zS6hD/vE5bqFFiS0EE60vECbIajdVu15mdHK
X-Google-Smtp-Source: AGHT+IHOL8QKdlkGXsno2PIaShat/eQAaKe/tP9TkcLZKSWaf5r2YS73c3WA3I3Z4C2SYrpszPCscg==
X-Received: by 2002:a17:907:1dca:b0:9ae:43be:e5f5 with SMTP id og10-20020a1709071dca00b009ae43bee5f5mr5224884ejc.4.1696026503493;
        Fri, 29 Sep 2023 15:28:23 -0700 (PDT)
Received: from slackware.local ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id a19-20020a170906275300b0099290e2c163sm12953660ejd.204.2023.09.29.15.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:28:23 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH v2 1/3] overlayfs-tools: Drop unneeded dependency
Date: Sat, 30 Sep 2023 00:26:57 +0200
Message-Id: <20230929222659.57046-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 22:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105277

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
index eb6e4963a..c638be9af 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
@@ -15,7 +15,6 @@ SRCREV = "291c7f4a3fb548d06c572700650c2e3bccb0cd27"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-DEPENDS += "attr"
 # Required to have the fts.h header for musl
 DEPENDS:append:libc-musl = " fts"
 
-- 
2.35.1


