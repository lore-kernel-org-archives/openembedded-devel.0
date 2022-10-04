Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB548C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:25:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7553.1664864710398273922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=E5EUcPh/;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.53,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f53.google.com with SMTP id w18so10992757wro.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1m/RQ+n+EfSHbn/TQaoUjTXzUnt5XXPNIypVXGZOqd4=;
        b=E5EUcPh/H6w5j4dlFgJITcwajaQOadpvE1mjYKD4lk3fWCVVhx+5tH4PpvQ8gAiwMR
         cJd1+vzDryvNBsiQwfFOlILvqkBPWrAH+PObjz/q97Q1kt6s7Gxwihk3Wb2ddyTmZpRP
         WvRcwvy8mHJxs55/QwdYTlMVO9P3xmPtjuF5PMEgjTzNwba52riU89xuPLBD80HWHcJZ
         hiZJpSO2gkolGbVnpxtv7JmWlrTysKAov2zDZkdeFlWKjodhALfy3B3dzHFkHaZ3gsGx
         lcZehtHZ/TqYiXKrJDg0QwDpp4cKfWMOHm+8NuP8HDzf2BqbxzCcuYzjj9Y6IQzuvlvb
         5xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1m/RQ+n+EfSHbn/TQaoUjTXzUnt5XXPNIypVXGZOqd4=;
        b=jzd/xo1b+eB7hqBqxRJhsGv8hYORZw5pFoGRsWOLQi1dkMRrA3O7TrB2dJmCpnlgQb
         8S2TurHAjLM2iJCgBJ9IHJKRjpSzs3V/xu7+4rK3deeS9XRkqj4e7FprfFkU3lCEE3RP
         m2jjsyFvN1Gu1mmok7mIOBzj8nKC4prYNNJMelL8H4danvpWYhL2j8OrGmTYGRVqNNoq
         GXLy3AHM0uQQxs5Kk6bGEVoHc9mIneysq3phD2CTxk87r/px6I566nvfBsd4yYitlllC
         y4yWWgao7KOPiKr+36phSTVWmLqg7fjpvbIc82c4OZPMenRX76E8Gp6ztcaW2zVPpB3c
         4sYQ==
X-Gm-Message-State: ACrzQf0awmSRUHjyKdRjuiNtz4McjMBxAvA1tLlwvTEMJkWuN4X6x2oy
	3QWFDiogWtXdnGj8IaRuFSjASHnVGPKG4xhk0gI=
X-Google-Smtp-Source: 
 AMsMyM5NoLKBUt3Rph0tUmW0+bBPRpCGfBW0SP1e2qfvKdL4XTdYVAwwE//epVzOnjGVQQEgnaEGdg==
X-Received: by 2002:a5d:56c8:0:b0:22e:32c5:d397 with SMTP id
 m8-20020a5d56c8000000b0022e32c5d397mr7396229wrw.462.1664864708166;
        Mon, 03 Oct 2022 23:25:08 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c501f00b003a844885f88sm13802771wmr.22.2022.10.03.23.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:25:07 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	joe@deserted.net,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][PATCH 2/3] mbedtls: Update to 2.28.1 version
Date: Tue,  4 Oct 2022 08:24:36 +0200
Message-Id: <20221004062437.2541052-2-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004062437.2541052-1-mbriand@witekio.com>
References: <20221004062437.2541052-1-mbriand@witekio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 06:25:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99047

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../mbedtls/{mbedtls_2.28.0.bb => mbedtls_2.28.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.0.bb => mbedtls_2.28.1.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
index a3859fbebaed..44b2a5e3c8e1 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "8b3f26a5ac38d4fdccbc5c5366229f3e01dafcc0"
+SRCREV = "dd79db10014d85b26d11fe57218431f2e5ede6f2"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake
-- 
2.34.1


