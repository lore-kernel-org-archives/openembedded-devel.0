Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353A1C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 04:33:44 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.6482.1753245220125297497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 21:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J7rtfhgX;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7600271f3e9so502886b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 21:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753245219; x=1753850019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=buc/Y74CceU5OVBe5ShoSyN7InmwWaveVit4DKFpdHE=;
        b=J7rtfhgXqbFJtC4gDna1LS6d83+flIkp5eleYKluhHce5P/qlsvi/hAXZJuekz34hj
         LWVDlTpBrDwUCWp1fwOa981HAlXgNlGBNf8C9GCbhVhnx2Ia7c4YiBNEiPHNYDWJZJUk
         gIXb0erv2eOmo/UyiDkRiWXl1wAg2qd5kIWVcbvuX06ZZhLzT6swsp68Ogay16B8PDv5
         EGKIB7dpmpez2AQolKJ4CcrXpz3amNGVekiXGOQNt1MR/BtdObw7LVfwphAhymKUHFqT
         OsKtmdSOuCKINwoSzNQajaebBHx5Tm2SmjWrDb8KM/+aAnsy4fH9lnJlkdyEryqb85tL
         DGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753245219; x=1753850019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buc/Y74CceU5OVBe5ShoSyN7InmwWaveVit4DKFpdHE=;
        b=DdjoUmqcFTkoYn3lamaR8n+hJF5mGFPSDFE3+OjASJTxs/5pmP4gARBjKKBzjNJhWy
         pGs89PlNTxNiwV+kv16BPm4PnmVGQI5b9s7WSGOYmJuHHNhI0nenrXyAN1xoglHwWnTT
         mvCCtuk0i5+VofFRi6+V9+7/94nVqZOtuO9hVVr3KQFNgzD+vc69mfXfKpr47crLcgLX
         FuPULG0eoTDTXdzmoBw+Hh/mRWSjRraU9xmW68VrFJkG7BAYhscigZxSrpO9PyBZ85MS
         ZSEFxUhGH8amGDIGU2gxuKsBOxt+q2Gi3jIFQrRmG5muiiBKwoXqjPjw1f6IYRaUa7yp
         TOKw==
X-Gm-Message-State: AOJu0YwzZWbPzYxnvHNgYjDHua5Mb4VTI0LO+ZeKfHAKdqlCul+2PSSx
	RjbIN7dnu+2Oz05jKQIjyiOoPC41LL6WlMIOgppKSN1UE2Ow0LZW6Bz5rAZddhv2fzk=
X-Gm-Gg: ASbGncuF0nXPHDvUpolgIM9n5IOPn6tkA8XhTmypvFh03lVFmKU8V/I7/9b8YkFPsdy
	ZjApvwmW5iVCIGDeMff1K/e25XnylxCfQ6UqLQFJhXaysvx00EjpwZshOJKOYARNhUSesBhI0Ps
	jMu/c+a/rnsyTMo3hxyRXVkJE48V455T2VUPVaRZEhdBJMkfOUE8EgY5HuhuVhv4ZtFYhAGFQf3
	jpWhUjr7D0DiLMqluHRHPjwcXHq+nI69IFgUThF3tCEwh3zXocz9ge8gg8EUR5xw1N4T1F/nnYo
	5dzEGhBmNQw7UlPgv+4Itn6Z3sC3phLdlDYT0F6BCL7BAwMXak9dhmfUDwPn+gUjOOX4Os5ljgU
	vHusFa3IyNz5u6w==
X-Google-Smtp-Source: AGHT+IEbzvUQ18Ba01RUSmW5nvfOzLZ4HpPPYxpcoFVkWDPtE1T41/rKJ6jyjwxL40k2jqq4VFqznw==
X-Received: by 2002:a05:6a00:b56:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-760483aa58amr2068095b3a.0.1753245219080;
        Tue, 22 Jul 2025 21:33:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc6af5esm8056974b3a.156.2025.07.22.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 21:33:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-lief: Upgrade to 0.16.6
Date: Tue, 22 Jul 2025 21:33:34 -0700
Message-ID: <20250723043336.3445593-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 04:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118710

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-lief_0.16.5.bb => python3-lief_0.16.6.bb}     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.16.5.bb => python3-lief_0.16.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.16.6.bb
index 8a0e30133c..2c5aeb6bb6 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.6.bb
@@ -2,16 +2,15 @@ SUMMARY = "Library to instrument executable formats"
 DESCRIPTION = "LIEF: Library to Instrument Executable Formats"
 HOMEPAGE = "https://github.com/lief-project/LIEF"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9ab5db472ff936b441055522f5000547"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=be298b85ef6036ef77810ae0dce93776"
 SECTION = "libs"
 
 SRC_URI = " \
-    git://github.com/lief-project/LIEF.git;protocol=https;branch=main \
+    git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.16.x;tag=${PV} \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
     file://0002-api-python-config-default.toml-Debug.patch \
 "
-SRCREV = "abcf929efb748c7846dd59007cbb807e108db311"
-PV .= "+git"
+SRCREV = "d52c66d6da4d67c69438989df83a5415236ae08b"
 
 PEP517_SOURCE_PATH = "${S}/api/python"
 

