Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAFEC4332F
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.1836.1652344931817789301
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=dkz7oTYw;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id p189so2588562wmp.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4TXnxM9gMJ9Oi2RU4Fm5yMyi2qlx6R9jHpjMJ3OxM8M=;
        b=dkz7oTYwWEDLJF5dqQwzGCAdPO39KcbH3EP0Tm0fE9Aou38YUBLaIpVf8uSO358JUe
         nGMrL7pTUYNRXbmb8N2ztfaC5JAI35rHjYuZ2mz9/L1HTI5pfU3+zkdkF9VTr1ws3TgA
         xoTjLsqB6kMuN6uGWmUdJpweKcfMGitb20CZGToyc2NDLQTs9BM59GOL0dufyC6CKIXm
         ILffUUVWCi8tWPrwJ5/ls0A9tOcGUzy83TNM5gPmCw68w/fSTj1HLxSmYGJXLmS0+HJP
         r/tesYiuvksf++o0Fw0RqPtTp7td18xe+s00Q8XXUD13gFx9lOqmiu1bAIpbV4Zliiev
         V5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4TXnxM9gMJ9Oi2RU4Fm5yMyi2qlx6R9jHpjMJ3OxM8M=;
        b=4QLzfryumOMNlE8bny30Sdu5enTFrgGcboLNe6/hEA1H8VQ80c3weXy4EUitBBLXkf
         f7DqDVH6gUJOP5tHG6pqcmg7wuLOGumsaRH6nqwib+2b7AVA6X2XLEQpwciLCtQLe08M
         NLo8GDJDDr9u0bP/0VhZwu/NDewFmXwuRuBk8SaveGO26wsT1BADyKreTczr4WQ4j1R2
         b8QB7bf47h1+IE+7FOyfRlrJsXvGuDaZ0xUh9Xz3gMTeP5vHS29XvcJJV+73gh5o0F5J
         5qfMqVhdkTKMv4AIxCFdHNtNwm8kA3Da2b6Rs//ycS2YBQ0bcV750csCFgww186EyXDI
         JOZA==
X-Gm-Message-State: AOAM532w01ZuLRkMw6GNUQ9DUj8G6VjYapSYOChmz/LACo1Kl9BIp24F
	5d4xP/QLsw9hcsA85lkl9FPofQ==
X-Google-Smtp-Source: 
 ABdhPJz55PG4+zLWzeo8RbZ515CJZmBn5iT6cHhVonhowWI3sY5R50QyNn/CyfQNkyTiOQXGHI7GEg==
X-Received: by 2002:a05:600c:1c1f:b0:394:6950:2bda with SMTP id
 j31-20020a05600c1c1f00b0039469502bdamr9013255wms.52.1652344930433;
        Thu, 12 May 2022 01:42:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 14/16] python3-eth-account: new package
Date: Thu, 12 May 2022 10:41:50 +0200
Message-Id: <20220512084152.1388464-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97062

Add a recipe for python3-eth-account: a tool for signing Ethereum
transactions and messages with local private keys.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb  |  1 +
 .../python/python3-eth-account_0.6.1.bb        | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index db3f8516a..da83aab48 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -111,6 +111,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-engineio \
     python3-et-xmlfile \
     python3-eth-abi \
+    python3-eth-account \
     python3-eth-hash \
     python3-eth-keyfile \
     python3-eth-keys \
diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb
new file mode 100644
index 000000000..9c87d3f5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Assign Ethereum transactions and messages with local private keys."
+HOMEPAGE = "https://github.com/ethereum/eth-account"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+
+SRC_URI[sha256sum] = "54b0b7d661e73f4cd12d508c9baa5c9a6e8c194aa7bafc39277cd673683ae50e"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-bitarray \
+    python3-cytoolz \
+    python3-eth-abi \
+    python3-eth-keyfile \
+    python3-eth-rlp \
+    python3-hexbytes \
+"
-- 
2.34.1


