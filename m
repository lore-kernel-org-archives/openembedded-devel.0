Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12444C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:07:00 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.939.1703182019702799363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7b7f6097355so36812239f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703182018; x=1703786818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGeiMua/pN2Aeux0s0cJNXWnR4ibZUUdVTlTK7LLN9E=;
        b=VBWwogeXIpSiHFvAy/jlXUJKTWvoLrTofTeuSlYix5fe0ZdtCCizJIG0ZNqb2XkmdV
         EqCeJYH9cmj6Wc3gzYBs+el4TYKFYMHjZi/aGySKxBmsPGdj2BXGU0bsFFBYrnFz3by6
         Epv8A/Vf1YvBqwOTKaMvEKL15xT1TFmaINBSIO4yTuQ0kpudG3nUFiL3Wb87XcRHKbib
         HHExmbjVZIiotabbWGIAZonA7unuFKNxmnxRs5rnIzmjthPcU/2fi3LbaLv4KlgVZ1I5
         NgiCkLMneUAWae42h9KvQpgbZldRnZ+cTV1i5jaCawXatGOpIL91QXSx2r40KSfERvmv
         vBuA==
X-Gm-Message-State: AOJu0Yzuim258VPZ9lAPUvlgscKRpAEofBoc7mqNQ8W2cA1K7/kZx+dE
	Bl6B5zTCLXFRWDQnvqvLgVwRhpgox0Ve4Q==
X-Google-Smtp-Source: AGHT+IEQmUguLUZEKBfuifpzXRKrZV9pXiYGi4kc8eOTUcaZ+lvZnsgveVxo9TIFobiB9hTCXOKNhg==
X-Received: by 2002:a5e:834d:0:b0:7b7:a9fa:55ec with SMTP id y13-20020a5e834d000000b007b7a9fa55ecmr170490iom.10.1703182018093;
        Thu, 21 Dec 2023 10:06:58 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id gg8-20020a056638690800b0046b14785710sm611513jab.113.2023.12.21.10.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:06:57 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-ipython-genutils: fix upstream uri and version check
Date: Thu, 21 Dec 2023 18:06:47 +0000
Message-Id: <20231221180647.3902692-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107727

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
index 8725150e4..3261d8047 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35"
 
 PYPI_PACKAGE = "ipython_genutils"
 
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ipython_genutils"
+UPSTREAM_CHECK_REGEX = "/ipython_genutils/(?P<pver>(\d+[\.\-_]*)+)"
+
 SRC_URI[md5sum] = "5a4f9781f78466da0ea1a648f3e1f79f"
 SRC_URI[sha256sum] = "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
 
-- 
2.34.1


