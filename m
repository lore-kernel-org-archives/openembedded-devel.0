Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5328C02191
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 11:13:07 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.93748.1726312373742218728
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 04:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7ZYfAL1;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-378c16a4d3eso1796713f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726312372; x=1726917172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcjHzDfyap1U8aY2FZB2Ckk/Wsjfi+eOKzlF/pxPEoE=;
        b=C7ZYfAL1nG9grOQZaxEIozF9GrpfH+Id69JRMUPfQDWP1jQN9h9MshLQB9wJ5vb+5M
         +WrKA60+d9FtrV3q4+zj+USw4h4bNfE4YgVX3zmhvgxYtqIwfj9+e47N2VfIrWsRG8zI
         FzQ05nCoIk06M08BqD9LcDjOSC3N1Bybmw27YW2ugV9pBJcFp0rQy09pGZGTU7QLl0Ex
         gHNaFxYTlwL5DvEfLdv6W1jS3dJbblrtsnm/kkBIGUWgHpEsD65eeczjBZq8+vyGLxeH
         6FZ3H5hDQpYF3KUG/I4akgi5+uJ4WqYAzcaq5tK227OTbHjpnFyrSoyTNKTn2bePSagG
         sNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726312372; x=1726917172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcjHzDfyap1U8aY2FZB2Ckk/Wsjfi+eOKzlF/pxPEoE=;
        b=E6MtdI4vBGV2me0SA5eut0YwOaZk5m92CHv8e6Wt6fAblsXLROgDfygdsmpTx0uXh7
         yVpKO4qb0fgSCvwJdx1RrPP682DPIx45ul5CxXCb6C/O9HvIeox18sEkTNwfUA191LnN
         GgbQrH2bTd7tQQgREIVJQl9d0H0q9GQv2QI0oazopO1+Buam0KIk3I+tTEnZHeXla6yB
         jWjCLfoHP44qtDdlM2FRf6btiPLd20joKdnL/sG7+aKVQ+YpShCnUCeXdBkAYl6L1vvg
         HDgdFB6oz+pFWQhSVVfGGlx9Ey0a8qlg/5lRpYgxm9FW9eXUhosXIP5W9b3vcHda1vR/
         Vt9g==
X-Gm-Message-State: AOJu0YweVKPk6kVuHwh6KeTX3jfXlhKkevkT/61ok8JXXscf0vWS8U8C
	T0iGTB8KFV+gb0uP/RG+qr+mt/0uR539ooua7sixurXTWznFDs8UZUI9AIOl
X-Google-Smtp-Source: AGHT+IGKmzTW+KOnbquacT8EKhDytoDybuh+t1c6uH46kGMQlBbEr8djmbf855pqm4GwWcBnZi/TMA==
X-Received: by 2002:adf:f24c:0:b0:374:c7f8:3d50 with SMTP id ffacd0b85a97d-378d6253af9mr4645257f8f.58.1726312370829;
        Sat, 14 Sep 2024 04:12:50 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e81a5sm1485442f8f.34.2024.09.14.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 04:12:50 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver] netdata: version bump 1.47.0 -> 1.47.1
Date: Sat, 14 Sep 2024 13:12:43 +0200
Message-Id: <20240914111243.2530714-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 11:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112285

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/{netdata_1.47.0.bb => netdata_1.47.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.47.0.bb => netdata_1.47.1.bb} (97%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.47.0.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
index 9fa322b74..e134c06b0 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://netdata.service \
     file://netdata-volatiles.conf \
 "
-SRC_URI[sha256sum] = "6735222ffcff941508b92c8edddc26fbcd719b15880be4911d77fbfd9dbd9a1d"
+SRC_URI[sha256sum] = "fb970a4b571ffd542b7d24220ef806a4c1b56c535e0f549a9978860a9f1dcc9c"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
-- 
2.39.2


