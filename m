Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303FCC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 22:00:57 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.5249.1706911252275820667
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 14:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-686a92a8661so13622516d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 14:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911250; x=1707516050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80ulxFPD8AYQ/3kgnQacDCOSbgtUFnL+w85AniM+zx0=;
        b=iwooDGVd1PGlMbz2Fmx06m6Rdb3wxV5SsJZGgQPIXTndtwRMXB9voANzoJeorjGMlS
         WNxOnGimuKbN6qwQ/Bn0oL7ei0Z7uvGAxE8oMo0NpT4DUcVwdAGO6jbRRKXbGPmt4d4K
         t7Uxyjh6Bpd8WscHBg6iDjkOLgwcsStvVGkzWPOCyH1Bl3oNYq27EO3FEIJ3clDpucbY
         jcyOn0ke/4PLAychjnrxHryTHQp1KIc8nJsACwbcQ8wvT17MTrtHhvZGezygjMBcoDpx
         6j7pEUpX2+k3BjL2P7Oi7Vmcrubiv4D//647bXBIPR786XSkx7d3flc9BS9/kUfuK0XZ
         YHJQ==
X-Gm-Message-State: AOJu0YxUMhT4OvqKKDLH1nNs/Ec3AL4wVSlu8IQYG3ve8JbhLW9maF+n
	10IkszDdteQnC5RL3z11Rp3OOI13sq8L1j/BVpBR7MMMAxouDHGcHtwbyQ2Xz7p2htTm
X-Google-Smtp-Source: AGHT+IGASk5F63lb1CsscAcnjH8A1LtqDHxnypKa3tiNcAo8GO+IKTBdYdVrBO1CWnzBk4KR95MYog==
X-Received: by 2002:a0c:f2c5:0:b0:68c:689d:92ec with SMTP id c5-20020a0cf2c5000000b0068c689d92ecmr3184505qvm.25.1706911250506;
        Fri, 02 Feb 2024 14:00:50 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id mb6-20020a056214550600b006869dc6c9b7sm1184089qvb.44.2024.02.02.14.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 14:00:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cachecontrol: update to version 0.14.0
Date: Fri,  2 Feb 2024 22:00:42 +0000
Message-Id: <20240202220042.1616272-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 22:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108550

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...n3-cachecontrol_0.13.1.bb => python3-cachecontrol_0.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.13.1.bb => python3-cachecontrol_0.14.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.14.0.bb
index b4c90bcff..1e374529c 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=e2fd6ddcf506e08972d5ba4b93c0022e"
 
-SRC_URI[sha256sum] = "f012366b79d2243a6118309ce73151bf52a38d4a5dac8ea57f09bd29087e506b"
+SRC_URI[sha256sum] = "7db1195b41c81f8274a7bbd97c956f44e8348265a1bc7641c37dfebc39f0c938"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


