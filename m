Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6371FC7EE23
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.122290.1683008401459761075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sLXfovpc;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso2572780b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008401; x=1685600401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2L4HHLudo0M/EI8KSd+MqUCO844WS4jPmb4MYo0FOg=;
        b=sLXfovpcraY94QYoZk6FRHPadCrx8ZrxjnM1M6rCFSwAV7DmYkVyh0sP1fopmFRgAp
         m8nwHDq7U+XePa03qVMx+MSECqVMoEzkso7Fg8a+UFFAvb+RWL3vNsS8+uh5PWY3fjbq
         RRElUgLEDGegENTyG5Z5XNfDWu19cmui7P8ghA3exXSyI0KEw8AGvO0Vf2XLPHqxWGZt
         r2Px0RWKNUdRapiQWtR9ButTHRqVs22pBoHJnJalyBIgCL5qN+3/M3xpF3leJAMNd//p
         fzS20LQqr2xVMLc5IPyf8kgznK+ZR12RPjwPUXoVXfYQX3w51ywXR9hyFfaCXj9tGXiX
         /C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008401; x=1685600401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2L4HHLudo0M/EI8KSd+MqUCO844WS4jPmb4MYo0FOg=;
        b=GlwBd8ocdJ0m8CMZg0CfJm8/BWA2yTkWBmG+Vsm+6L7oK8P/BX5iv9gvYAOaC82MdS
         0Np1tBlXoojLEK8wR03ZP2Zi/7d+KueOyBqwD9cjAQM7RY6P1XoKfSwIj+2sdvD+5nYU
         3GGT9/1sGlzMONj08EM58c8GTi91LxftC6pbw4k7DdHeFFQv8nXv67JDOxdoTxKuGvIr
         nIWu/L255aG8UD62kRy/C6UQZqybbi4eQL9Fig5N95M1qFXNSAX4Uqu5jL7BAEBeHy/A
         p6MuL4QvRoiNpmCC/QquDe3lje5+AHMkQISLK2sSSfbE1u9MP82b37+R73oBLYUnJHis
         8aiA==
X-Gm-Message-State: AC+VfDy6nYguWsdOwFW/9jVThWjz6OHBkNIVKjECrZwt381XknRlr2Tv
	03AI58e9KZVezeaGYIoH6vUciI50tO73cg==
X-Google-Smtp-Source: ACHHUZ6HF/4jyL22k5ktpPW73qt2E2jl1GWsn35pPGA8Aqn2kUjMWPo5eVw/X6ol2uLd7nJno5LZ+Q==
X-Received: by 2002:a05:6a20:43a1:b0:ee:73bf:425d with SMTP id i33-20020a056a2043a100b000ee73bf425dmr17441493pzl.39.1683008400706;
        Mon, 01 May 2023 23:20:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:20:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 07/11] faenza-icon-theme: Switch to a valid download location for SRC_URI
Date: Mon,  1 May 2023 23:19:50 -0700
Message-Id: <20230502061954.3782607-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102253

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
index 5ed3375eb0..12d344bff5 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -8,8 +8,7 @@ inherit allarch gtk-icon-cache
 
 S = "${WORKDIR}"
 
-SRC_URI = "http://faenza-icon-theme.googlecode.com/files/${BPN}_${PV}.zip"
-SRC_URI[md5sum] = "e9bd6106d13017ce06d24b586259ae9c"
+SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BPN}_${PV}.zip"
 SRC_URI[sha256sum] = "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf147f0160add8174a"
 
 do_install() {
-- 
2.40.1


