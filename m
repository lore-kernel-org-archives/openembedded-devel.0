Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DEBC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:55:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.4656.1739307320439908919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZEh/M0A;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f6f18b474so50886005ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739307320; x=1739912120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPp7yOTh5UiJVIEj1IbxhOIK2Hn6mWYjvZEk38b25hA=;
        b=IZEh/M0AiGQ5uFX4UV8v9y+HGz2pewhALDp3ZMKnjlP0hMu4EeT/DrezT/G25oroVZ
         goXX6nRJn52xmx/1IxX8vBAulyyJxB8WvPUbmKBrtAyjy+jYVRGpoGT2v4iyGT0r6Wcs
         zTvBMWegZwsbabh4UwFRTbM5r58Avp7vEy+mZ88tT4lnwOwG9kRBzPKqyFIu6zjeH3y6
         oDP9LLH+HNsJtNtgXLKN2V8QuGkqzHVb0eqS1HxfJk3bhURO/88seVt0o9qg48rGyfk+
         xoq8kpztxMSQaWTitSNnLMdz/YlBBDRRdwdg6KvVzU5rr7jHts3eSzu6yq0S7TaLoDcR
         zCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307320; x=1739912120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPp7yOTh5UiJVIEj1IbxhOIK2Hn6mWYjvZEk38b25hA=;
        b=oum8QmVEl0qK8oZAi/jgMlIQziwGzpDSHSCT/Gb9Y5zA6AB86eJl7e0x+tO+PfF+He
         FMCn0nMPErvRcJWT45CzefsPwS3EvdbMq2TgZwH0TZs5Ha7rMmKY/mEuKBgq3RH0xqMg
         p3dgh9oDRgl+gmlNMetSkhIHOGEmRn3WTk6mClH8H1wW/LqumRzUGh3sxF/AasnmJRqw
         HSOwL5UxJqkuBaKbYv2NWgWAln5wsK8aindd3oMf2Xwl3YPAMOgucpp3Jk98Yc9rQpBS
         dpjAOb1ZLhPe+fa43aDMQRLuGDMpZzKdrk1QUedu3R3yosnkRUMpB8/eFVCA/W7ub0nN
         wHzA==
X-Gm-Message-State: AOJu0YwB/ex56s8I+od3nTg0dt8ckq+4DPoYLtrZJ5boUQ9OkDw1hx8Y
	9iNdwtq9NSiAAyX3ZrUmgzcF8d90Z042rmMDGysIdt2TijkSe7MPEUt4jSjV
X-Gm-Gg: ASbGncvzpOg3rQcGXi1QqPl5f4mUelqm4h/pfHwMZLZn5sQoqAiPX8HsXHXZc0A2pL4
	bZvhV141yyptWA12zn/jGR6rOY+jCTWFupywNhuSUUCdSLAXr7hLzySTFQzRhWf1UjAD6xN0dle
	HLSpoIJxjh93mY1P9QlTQ9YfIcm6PGxnImXrMZql/csIX/MNI+n2BDcBtMT7uy9aoQvSE9/m3nH
	3EFAfo5NecvlQw0itqFfHQ2gxu0wuiuaECwdrfmEfAj5Dg90lCBBymnepDxEHD6/47NwE9ErehH
	DCqytg==
X-Google-Smtp-Source: AGHT+IE20Hn9v1nqm5Bju07ovlgr0xfoGJCL0D67GbtXgGnfo3MFtlu5RlCI7PVSuji82OpN5GYG1Q==
X-Received: by 2002:a17:903:41c6:b0:220:bd61:a346 with SMTP id d9443c01a7336-220bd61a46emr4822385ad.40.1739307319542;
        Tue, 11 Feb 2025 12:55:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::8da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36551885sm99852375ad.88.2025.02.11.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:55:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-google-auth: Disable TestDecryptPrivateKey ptest
Date: Tue, 11 Feb 2025 12:55:17 -0800
Message-ID: <20250211205517.3060510-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 20:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115433

We have upgraded py3-openssl module to 24.3.0 in core, which
means this test now fails as py3-openssl has removed the APIs it uses [1]
disable until it is fixed in google-auth module

Fixes
ERROR: 'OpenSSL.crypto' has no attribute 'sign'

[1] https://github.com/googleapis/google-api-python-client/issues/2554

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-google-auth/run-ptest     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth/run-ptest b/meta-python/recipes-devtools/python/python3-google-auth/run-ptest
index f1c8729f0e..e2f6d49fd0 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-google-auth/run-ptest
@@ -1,4 +1,4 @@
 #!/bin/sh
 
-pytest --automake
-
+# Ignore mtls test until https://github.com/googleapis/google-api-python-client/issues/2554 is fixed
+pytest --automake --deselect tests/transport/test__mtls_helper.py::TestDecryptPrivateKey

