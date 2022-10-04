Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D09C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:25:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.7679.1664864711184237444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=biIrwJSi;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.45,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f45.google.com with SMTP id r6so19724431wru.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1i0lg0vRFof+HC61F1K9QRomwqrWSJg8h2U1W6MgsNQ=;
        b=biIrwJSiqqmZsLXXTFCAJUAlurbJ8Jt8bodk9tjf8I8CwfgAbTIXEIjP4YomdtPhqT
         T+Rl9DKv/fZ8hYhnaNHh2vYx5rLrPdDx97hG6BrGq4Cd5gM6Tinb3DdK7EI0UhU6psvH
         S2Kf1CikPFyV6UMcyTbDmAHEuQa1SDJz8R2hTIkt7mzW71pxmmx1zsJiuWpNlM0tUhjj
         EYFbhP69oXEHn5cWVwQ107ICx1bQkBNaLcJEx4BOfAvlad+stKjTdG84tQ+/q4qPR2VR
         eJlCDrCDt7GpUbTI6g+2DWFaU0x1Mhpb21tFKd1pJ4T6peEwOqhkMLU9gSx5yJpNhSTs
         tERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1i0lg0vRFof+HC61F1K9QRomwqrWSJg8h2U1W6MgsNQ=;
        b=rHnabIWg0Iy3aL91SawHo8Dw2OkJL6geyc7v9WB8AZuYdpULJhxhfeEGGP9g1ND0kk
         R7EycAZwPHKwzFsPWrsChmLBxaLWH5SIeDHtZhl7Ny5AaWSrRTTGLVVqCwU4AHvsAB0x
         4YRDHVnl5fC7dmFDXQqq5JnSkbugz42kCUnRKrxFa0XcsX3JAtfapX9SkFg40fFAazYY
         RPCkuKKY6b1zYJO+DCL4g3AEp5Q24fdmMJhUwVTEEzQh3ul53A+HvUIXNKkCLzafzdki
         4gIS91CCwkcbvchva3Nm9KyXNvqtoJVo6lt0aHEiaDZOR4AX5OFkbW3OhqiVT0uEabI2
         KsyA==
X-Gm-Message-State: ACrzQf01y7fJJK3uG3kO1MuZgI0AT8MgI4xOgRDLPgsUdRNixf1mEC93
	X9Gt+6NCCHyyvMXp1W/tNkvuJtWpmu4wkZu/hPQ=
X-Google-Smtp-Source: 
 AMsMyM7ynl4pYDQdBMyipCZQfmhp6MtaWj09QbmGw7sSv9qtdmDG5WZMxcOLSfPJ/9JJZBZzXGFgvg==
X-Received: by 2002:a5d:6d4e:0:b0:22c:9dfd:4159 with SMTP id
 k14-20020a5d6d4e000000b0022c9dfd4159mr14527237wri.307.1664864709173;
        Mon, 03 Oct 2022 23:25:09 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c501f00b003a844885f88sm13802771wmr.22.2022.10.03.23.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:25:08 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	joe@deserted.net,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][PATCH 3/3] mbedtls: Whitelist CVE-2021-43666,
 CVE-2021-45451
Date: Tue,  4 Oct 2022 08:24:37 +0200
Message-Id: <20221004062437.2541052-3-mbriand@witekio.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/99049

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../recipes-connectivity/mbedtls/mbedtls_2.28.1.bb           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
index 44b2a5e3c8e1..742414dd8aed 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
@@ -44,3 +44,8 @@ FILES:${PN}-programs = "${bindir}/"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "mbed_tls"
+
+# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
+CVE_CHECK_IGNORE += "CVE-2021-43666"
+# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
+CVE_CHECK_IGNORE += "CVE-2021-45451"
-- 
2.34.1


