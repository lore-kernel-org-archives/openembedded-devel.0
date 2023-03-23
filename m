Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA62AC74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 22:41:02 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.87609.1679611255799573838
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 15:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n5HV63eO;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id k14-20020a056830150e00b0069f156d4ce9so36113otp.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679611255; x=1682203255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41GBlnmMBtHi7Q3JGV9cl+QaZahov+0vSy00rcuI+ls=;
        b=n5HV63eObs9OrVSiBYzRib2FsMde80sApR0nNgAf1E7x/N45IsseBqKXOPizdI0jHo
         pcVsdl21qt0m4JSPomR8CCsSCOd2L5DNE+uID/3TYOz83p1yj8DK5rUsENl6d37vrhyu
         EOGTf8rilEUh85pjnjDnYRPIoGNBZAGKqPOfmH9PFMDzg+L2emF8EOJvm56ofvs65a4A
         lKx0llqbX3WBv8SCdJCAXfY774ItJ/tnSIO8TC+ThC7CkABNLj6TsrxkRXUBE7n8Q22r
         8tUkQQNJHPMW69Vtp/NQiHu2XxT0kcbiRk+pW1vTCQHD4HLMnGNod1Jn1X9upBZpRRcX
         OHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679611255; x=1682203255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41GBlnmMBtHi7Q3JGV9cl+QaZahov+0vSy00rcuI+ls=;
        b=XT3VAhpdooTxpzyWor7oKivAx+8lAIoozcRWub0uz7k4+Hbo2GglJIsgoED9HB4acw
         1jbHgPfxTh4VRQeH/rRWiXSIjTNvcovrs7SumyxJhOmRl6lNci9PUCLCFMhz3yzIJKGV
         xS0rYHO0+KZPSH+oL5O+8isdu/EWae9r3/mQldKTE2sfhIRGviKUunj/IuoQpgpujJDW
         4P9mRoPTVRRHMZOteWrvLulEGC0oreUGPSts3sm0JjcEonEy8NgheSGk3PcJRRUpZBmA
         SSXLLwDPueSFcM37VCOKAtvIt7q4xhSmaRXrNJ8T9jV/WM7wITCDBc0w5ylZ5VTk1jGE
         4wlw==
X-Gm-Message-State: AO0yUKWAQDT/II8OFOiTJvNf1hVgRu1E6s5V6p4nBLhWbLUS0eY8OeIe
	y7DddtbRZrnIPsS3Exv5OT96nI5J2BH1vg==
X-Google-Smtp-Source: AK7set/5aiwlFDKvI8sVbm+FzToW/kyr07jGA7glQ7p17Sro3jDTGoMoyq8H/k7gix0vkqNzrwRfvg==
X-Received: by 2002:a9d:4b9a:0:b0:69e:c0fd:76ef with SMTP id k26-20020a9d4b9a000000b0069ec0fd76efmr624657otf.2.1679611254683;
        Thu, 23 Mar 2023 15:40:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:a23d:2b74:f5e9:5ae8])
        by smtp.gmail.com with ESMTPSA id v2-20020a0568301bc200b0068bb73bd95esm8006307ota.58.2023.03.23.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 15:40:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [meta-networking][PATCH v2] ettercap: Update Upstream-Status
Date: Thu, 23 Mar 2023 19:40:43 -0300
Message-Id: <20230323224043.3455733-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 22:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101672

From: Fabio Estevam <festevam@denx.de>

The patch has been applied upstream, so update the Upstream-Status
line accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Fix typo in the Subject line.

 ...1-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch b/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
index 82456c2f963b..592ea52f2ef4 100644
--- a/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
+++ b/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
@@ -14,7 +14,7 @@ TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/ettercap/0.8.3.1-r0/g
  ^
 1 error generated.
 
-Upstream-Status: Submitted [https://github.com/Ettercap/ettercap/pull/1221]
+Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/40534662043b7d831d1f6c70448afa9d374a9b63]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  plug-ins/sslstrip/sslstrip.c | 2 +-
-- 
2.34.1


