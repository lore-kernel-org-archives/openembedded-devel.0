Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F2FC47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:59:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9669.1706767161515330874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJunM2z7;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so5082955e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 21:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706767159; x=1707371959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irGZZghfAp1k/ANYbMOzGqYtyAjSH5SLpTwZKnMJpMo=;
        b=JJunM2z7XbvCDz5vYV7uyp0gf7lMkmn5Rm3Ff2m3zI4y8D0YOAd1aDTZZ/3QSOY+gt
         WTY9QGmnW75bOlVYh/XE1T/mjv2wrJV5Tv1fJDEEJzb6WIYg5xmiwLez4pBwe1cFKE9O
         utx7nc5fvz9ENf0m2atRzilcW/05Fs96oRviARlMU9q85wj0QwUbSxnI2F3qTnxvf0Dp
         7Tyol5QFlktc7LMKHK5FgN5oVhhOvxJADobzpEthtX8Ws7icpwVp96rj8LDWKGXq/IWY
         ScSDenNG8bPoqu7DOl6P9im+QPKNdrSVH+kHim1rgsAPPF2DNq5Fq6mlbyJ+kucOx6zg
         bfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706767159; x=1707371959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irGZZghfAp1k/ANYbMOzGqYtyAjSH5SLpTwZKnMJpMo=;
        b=jDPTSBHt0XbJOudtwZDH1kS3O+JSK2IljCt9pOx6NbIhQC3Hl9UJcuPHnSrWwhdERe
         4BSlofMNl0L45k/N2oLkbD6S5fXMqw88G515vUzZnd2TTDoSmWIvUtTd7PgECrJUKz8N
         RhAqPto2ttmdJnMUvzmFIS9RUhHsaqfMaqjncf8ewLbcjSkrIMaEQXcheyQIhus431Lw
         K4u8xPvKPZbI1jL7K/8/ogN8yhkCZcg5uPsqiXPVo+xa7fPDJk7a7Tli8r6+Pgx3m2NP
         lnwS/NmIwGlMfz/TUCigBRgsRetM3c+cbQKUcSF1k6WrxIl7Ig67WjGgr4JOrpnJwfbb
         /RTg==
X-Gm-Message-State: AOJu0Yz1GD+WmYqWJI5p5h+m8g1L5f/EBh9AXMVdgbUc050kR+NxP/RG
	pUoFcK8gAZJY9MVTHUda4re9pLKNvYSVHwsLAXR85EihcK/M5YfgHJ0JOQj7Jgo=
X-Google-Smtp-Source: AGHT+IENk4iPwI1qJfTt26LufZ+gvU7kvyWeK1b3Elc4EaIJTtOLawFNqLFc59goP3v0TYh81gHw5Q==
X-Received: by 2002:a5d:6245:0:b0:33a:f105:ea3b with SMTP id m5-20020a5d6245000000b0033af105ea3bmr2582179wrv.22.1706767158943;
        Wed, 31 Jan 2024 21:59:18 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c489700b0040e4733aecbsm3262304wmp.15.2024.01.31.21.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 21:59:18 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-aiohttp: upgrade 3.9.2 -> 3.9.3
Date: Thu,  1 Feb 2024 08:59:13 +0300
Message-Id: <20240201055913.17081-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 05:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108514

Changelog:

Bug fixes

    Fixed backwards compatibility breakage (in 3.9.2) of ssl parameter when set outside
    of ClientSession (e.g. directly in TCPConnector) -- by :user:Dreamsorcerer.

Miscellaneous internal changes

    Improved test suite handling of paths and temp files to consistently use pathlib and pytest fixtures.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{python3-aiohttp_3.9.2.bb => python3-aiohttp_3.9.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.2.bb => python3-aiohttp_3.9.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.9.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
index 42fe66908..99fb84cd5 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "b0ad0a5e86ce73f5368a164c10ada10504bf91869c05ab75d982c6048217fbf7"
+SRC_URI[sha256sum] = "90842933e5d1ff760fae6caca4b2b3edba53ba8f4b71e95dacf2818a2aca06f7"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.25.1


