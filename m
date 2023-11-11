Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE0BC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 19:46:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2713.1699731980397895342
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 11:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENo0tkJV;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso22645625e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 11:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699731978; x=1700336778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGcmXYSDMmo52lK3mxESfzWmP2cqAKmMjZ+Q6nddYpU=;
        b=ENo0tkJV4Ay6o2wqQOt8mUJtFMKn6q6w7mtSYRRvueGFyw+cILQ5DkPPfM1tWCVwHg
         9dPrLx4JhUiAjIdaU+M6KS5J52BjNn06SWDmAFiK5eqd08CX4zHHgifdS7dqG1QWVsP7
         fJsg//SbFaE96cFb5buOuHCMKwSDpN5eVYuqbZ/cteR/eaGHlnUqlt8c2RNpSj7hZ2rc
         MijDCPPQuQjl7aTLADagqQsWQgmqQQRwrQ/p9invxLGrhs/3GGKPTzTNHcSmyEFnJsVC
         AFX8JH2LravRhYBFJs4qFYWjrz3r+oZSUMbk6+UpRn5HzZXL5ff2bszexeqWlWDB0WkO
         MUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699731978; x=1700336778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGcmXYSDMmo52lK3mxESfzWmP2cqAKmMjZ+Q6nddYpU=;
        b=R8ZXov+Fh9HorE9aVnKoUolONTKa2TntePVY6cnm6TPVBSmFOBd8oxm5Sx26JHKwlq
         /VPC61EFV/v4eRTOrihO0foT/g6SekgNAp06YfTxqwOrJiJYPRyRdxXC9bkYw8buT6H8
         GlsfWZ2idqyd5o5/H96Q1Q+8m7FuAB6g1quVSBQ+ZBLkc2GENCWhMjTUQmiDKHOw9Iv2
         tvI0Fj6V8saXdM3vswhl387niwKb5ymNDdCJHiv5CaLieG13LXEv1OytkFIq3SFgpoZW
         beYrc4v9WerlBr4vhX17erNrevb0tMTYmXOaI32t4hycUvqoRfW75hf6s0CcerD/qn2e
         cfbA==
X-Gm-Message-State: AOJu0YzdGK69pQnDpn5CBm2VnjNc1aWNtP+hvxTxQCZF9yfC0oSRXZmx
	A6aSX3L/yog6s4LrFlZPUjcsWIgr20jXng==
X-Google-Smtp-Source: AGHT+IEqpUAzQne3H25FcFg3ah1hmoQ5nvK9DYDYwazc1CU9V9zEcOuKBR/CyJS//GA9dxto7HuG4A==
X-Received: by 2002:a05:600c:1988:b0:401:c338:ab94 with SMTP id t8-20020a05600c198800b00401c338ab94mr2214620wmq.29.1699731977982;
        Sat, 11 Nov 2023 11:46:17 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id fm14-20020a05600c0c0e00b003fee8793911sm2953447wmb.44.2023.11.11.11.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 11:46:17 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2] tuna: upgrade 0.18 -> 0.19
Date: Sat, 11 Nov 2023 22:46:10 +0300
Message-Id: <20231111194610.3426754-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 19:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106569

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-extended/tuna/{tuna_git.bb => tuna_0.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/tuna/{tuna_git.bb => tuna_0.19.bb} (91%)

diff --git a/meta-python/recipes-extended/tuna/tuna_git.bb b/meta-python/recipes-extended/tuna/tuna_0.19.bb
similarity index 91%
rename from meta-python/recipes-extended/tuna/tuna_git.bb
rename to meta-python/recipes-extended/tuna/tuna_0.19.bb
index a49341240..ea0f15792 100644
--- a/meta-python/recipes-extended/tuna/tuna_git.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171d
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
 
-SRCREV = "0681906e75e1c8166126bbfc2f3055e7507bfcb5"
+SRCREV = "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


