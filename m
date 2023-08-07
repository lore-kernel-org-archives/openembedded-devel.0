Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551FFC001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:16:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.42290.1691432188735993966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 11:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lhOWDFFq;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-686e29b058cso3366725b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 11:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691432188; x=1692036988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4/NJGkXVxMyQzB7oRtc5KAu7pOkpJPXK7BzUuY9OFQ=;
        b=lhOWDFFqiHLIbKBtnJ8FITAIJDXYZsslkeVFYM1qffI7jaT7NPpztMfKCOTqauZ1z1
         hBHoPw55bHhSKil9gvrKASHTChzLyRy0EN5qZRLtOKwWBMRDNapXSoWX1vbaIJek54B/
         FXfUqWlZZtJApwMZFsIK1RSK2uuRDQphCVPjLJv/I73rkJJbN5vm6uhhpWHTuO5vMtQ/
         kmNdSNmQj+sgMoMmEdxiiC9onKQmIONMGSaveNGPS07IultzOgou3LPZ2W8pImTiBe8F
         rhl4T0/wEtazHDaGSvVn2GaH74I7DXRMtPm05jt/KqkaFvCZ+RLyswlNgs+SI6xh4N7J
         OGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691432188; x=1692036988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4/NJGkXVxMyQzB7oRtc5KAu7pOkpJPXK7BzUuY9OFQ=;
        b=Q3XkMdloPQzsUhLG2S1NqcmfHqduYUJiuFpF5zf9mndvTjMddFz4sIlucXIKz3z5Az
         i9ThDXe9LV9FCUVdcsQKFPsHjeeiyldbhrM0MljL6KYdEKliilRJmUqNm/tra9pcd+jM
         qLD29iagh9R2AUuSYQcFsJdZa0JvvH4gXHkph98OZVsPclLgkPPwND4yL03hYNDoyjTw
         uukskJmko7C5w+fSyMUSKqBZDcrRaBfLykIqc1F7xrwYtfARFxEEJAydp5l29jYpZLIu
         d3lP5KNp2FMxq8qIGgtWFUn8VDd7YlHYqj7ZgyWd1zwh2H10rqu6+Qw5v/WShrzsBPzB
         kUFg==
X-Gm-Message-State: AOJu0Ywn136YjJDC+gliiAiGOjVAJnGD4mks302Hde+/2PwDQeTJlKNA
	GBBZUtL8UuHdc/kxTm7rGt7WQ4oD/QsPqg==
X-Google-Smtp-Source: AGHT+IEYK1ImoopF6N5wnYbrRw1mgDjZdHlVMN3RQWEd4gHdALp1OWMYbaC5qsFD8ZihPut1lp4cPA==
X-Received: by 2002:a05:6a00:b8a:b0:687:60bf:aed9 with SMTP id g10-20020a056a000b8a00b0068760bfaed9mr10211864pfj.24.1691432187902;
        Mon, 07 Aug 2023 11:16:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id 6-20020aa79246000000b0068758701717sm6431299pfp.160.2023.08.07.11.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 11:16:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-m2crypto: Remove __pycache__ files
Date: Mon,  7 Aug 2023 11:16:25 -0700
Message-ID: <20230807181625.2761204-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 18:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104306

They may not be appropriate for target due to cross compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-m2crypto_0.39.0.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
index 3a4a700bf7..ac62773064 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
@@ -44,4 +44,9 @@ export SWIG_FEATURES
 
 export STAGING_DIR
 
+do_install:append() {
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/SSL/__pycache__/*.cpython-*.pyc
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/__pycache__/*.cpython-*.pyc
+}
+
 BBCLASSEXTEND = "native"
-- 
2.41.0


