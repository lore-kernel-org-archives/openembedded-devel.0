Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13880E80A8C
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:37:56 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.11551.1695793069423271546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-77574c2cffdso16974685a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695793068; x=1696397868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQtLYuFAYD3y2Cd2QV4xRRMQ5KHrsD1iWMtQZ0BlJ70=;
        b=Ctp5eiNsjZxIS3gVQ9kn5ftelbFeUezN8HK/lKApchnxMc1SY38CEmnwmKPF1EByAb
         dfGL8bINhTlTa+lv+lu4K3mE2OLwkFk4mgIYTvXJRMFPCyR1gAKhZsKG8RAzFwb3mf+1
         QWfFGS4/XyqygO4qlMWFiSgoP3+6qxs0swg2bsQDNh4zSqVZO1h5XgTUBXQXKm9xRq3M
         WQDyDkKKTDqDoVaKtAD0njjUOqJQUYRC+o+1itW0M7wLpAOjNLz8PvwQX5AvlNrV72KV
         dO8OT8r8rZ/Ck5e+VGffVPKCC/jUWKA0fqMifQ+XAaRvFdVDWNFauXoY2z0kv5O9emdU
         +zUQ==
X-Gm-Message-State: AOJu0Yw7zNtNJQRJZsPXqFi6LNNVzh84p/ABPvEB8sPYlrYfNCe3lNKS
	V2r7puC+kNyOScCCbmJSReiH8zUFFFaoQg==
X-Google-Smtp-Source: AGHT+IFa8+1rlwRwLMTNDovl7sZ43cwduOAKisXXVwcq10f//RPvXppRZcxCUg/kVSGB6Vdl45Xcrw==
X-Received: by 2002:a05:620a:1aa6:b0:765:6923:623e with SMTP id bl38-20020a05620a1aa600b007656923623emr992520qkb.29.1695793068125;
        Tue, 26 Sep 2023 22:37:48 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id e2-20020a05620a208200b0076cda7eab11sm5177386qka.133.2023.09.26.22.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 22:37:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-ninja-syntax: Fix upstream check by specifying the UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
Date: Wed, 27 Sep 2023 05:37:38 +0000
Message-Id: <20230927053738.1699792-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105168

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-ninja-syntax_1.7.2.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
index 9a6326f37..ec7747307 100644
--- a/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja-syntax_1.7.2.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "342dc97b9e88a6495bae22953ee6063f91d2f03db6f727b62ba5c3092a
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "ninja_syntax"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ninja_syntax/"
+UPSTREAM_CHECK_REGEX = "/ninja_syntax/(?P<pver>(\d+[\.\-_]*)+)"
\ No newline at end of file
-- 
2.34.1


