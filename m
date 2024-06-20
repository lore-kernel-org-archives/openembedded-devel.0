Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E850C2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:53:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.48029.1718891576830987948
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fcLZlscJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so9272725e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718891575; x=1719496375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Okp5BG9xN9RfeyQaww5djwJr1fRiUjOuBxKalgMDhP4=;
        b=fcLZlscJSytZu2GUpRfADXQkZHQxMF5mXv9Uwswte9qN3EfZQjQy29IVfDf9TMZokf
         OMBlvCteyGxqzKJXtTXHWPnetKVWwauJNFnffOflK47qeRZLorgw/u3n+iClOkJ3vP13
         SrYPrDjp6tRmim0oaXZ9dVQavfRo+DgZcBt+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718891575; x=1719496375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Okp5BG9xN9RfeyQaww5djwJr1fRiUjOuBxKalgMDhP4=;
        b=HaD/FZhOu1MdGDBtY1FV2/CDEE+O4WcrUunPau2mitbG7mG1jhotZ7SofrAAHhrUyN
         CXfrgRkG7IEBxgEYiLERt8s1t2XE1oubcFKKluuTsB2MKUdY8uJ2Vj5BWWexrCTDeKQE
         Hk12Z7PSzy7neWdWX7BejKlWwstabAMEhFgB5o+Rzy7B1dSfoJCU+YCb29nnwyR6H1Sm
         qWQs8rQtOUuLkiI0CSHKgyIYzKt64zAHPqWPHtKPLuZPmbmyxEBSoXFiVYO/vL19pKDJ
         ZPn1TSOZV2fPFfqEZlZD6+K2fzi7dUQ1LVL9SwPjWT0H2rSCYPQY84sBHC6eGeafwFF8
         5Yvg==
X-Gm-Message-State: AOJu0Yw8DFoSKWcmX9fH8Szty74KhSUae0V2yiEc9D4qcwNH2WNbuIu6
	2Clb6mExlm/b16TBZ0gVDD5i6w/z0xxfpSXiU9H0ffe3hRqQN8vd/ZUZPYcvPnbOCZQU8hEolHV
	5
X-Google-Smtp-Source: AGHT+IH8uNWLj5f2YfKakzfduVHx6QKB8OyB1Z5IhENtfuQj3kSIR2ogKPwC+7BfQaG1jE/Hl2imeg==
X-Received: by 2002:a05:600c:b4b:b0:41f:ed4b:93f9 with SMTP id 5b1f17b1804b1-42475182a65mr40572025e9.19.1718891574978;
        Thu, 20 Jun 2024 06:52:54 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54besm26353375e9.25.2024.06.20.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 06:52:54 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-eth-utils: Upgrade 3.0.0 -> 4.1.1
Date: Thu, 20 Jun 2024 16:52:49 +0300
Message-Id: <20240620135252.980949-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 13:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110972

Upgrade to version 4.1.1:

- Web3.is_address now returns True for non-checksummed addresses.
- Upgrades from the template with support for Python 3.12 and
  linting with blocklint.
- Remove cached_property dependency, as it was only for <=py37
- Update networks for latest changes and testnets.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-eth-utils_3.0.0.bb => python3-eth-utils_4.1.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_3.0.0.bb => python3-eth-utils_4.1.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_3.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_4.1.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-eth-utils_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_4.1.1.bb
index faca03865..54bd9a67c 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_4.1.1.bb
@@ -4,7 +4,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "8721869568448349bceae63c277b75758d11e0dc190e7ef31e161b89619458f1"
+SRC_URI[sha256sum] = "71c8d10dec7494aeed20fa7a4d52ec2ce4a2e52fdce80aab4f5c3c19f3648b25"
+
+PYPI_PACKAGE = "eth_utils"
 
 inherit pypi setuptools3
 
-- 
2.39.2


