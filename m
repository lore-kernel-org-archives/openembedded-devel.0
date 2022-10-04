Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2109C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:29:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7568.1664864938620291606
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=QCRvY7Mb;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.54,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f54.google.com with SMTP id bq9so19740509wrb.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=EFMFIi7WqOSXUPDXOoH79G3CPKo4mVwFeWMJvHzVS/U=;
        b=QCRvY7Mbk9YIgt/SdttHExhUGw5kinyzinh31JiQ6yCpMQY1BoFRaDkHkROg+5Xuah
         yOWOyMnPU03A9pDENjRXSacE8XT7N3jdom00xLmg0GsEcGFbqdWPs1p3/EKJ+SUH0nxt
         96fhZyZbNoBkCZb03OkfpJkTsDYaX7fkHYEZ4gycQfrk0bxrvd8q+nTB7Ykc70+QWXQF
         vKO+a1Hqj979C93rHFEW0TZ1MTH9R3lgGlgttViZ9f/vU0LjmLQG6RNsZ7HViZnUdWya
         1FQCGlZarSZ3VgrK5r6+sE2YGBeR0RN57RrSuUqxjBfe7hCUHCpVtffCyoeNrHJ/jOIM
         ZHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=EFMFIi7WqOSXUPDXOoH79G3CPKo4mVwFeWMJvHzVS/U=;
        b=PaIx0r9kh/aDnSb+uodX7ogmaIYt2K0lsHqS1ebBKA/XvA8WDKFahERcDVrhkboovk
         R0oqXNkFkwPqqOb1Gy/wq/uBMaoeBwVTYIVTjpoCALkGSh/KT7pZY6GPu5GNk3+6uXNs
         S3wyuGv+9hF1E4V8NqfzYF3Fy05bG76AfroZr4XiO2iTExoVbMU7mr9PeEnt4AzQWh/N
         xLJm233PQ5SYpSvkOoEwPRF0lg/qZxJkRiySirXdWstXqmLaJHH6zqHHjYXpTlEUuCec
         xIyOQM0+dH3od4Vcukk8wSG/Fe9UPNkmTdJAhYyebQtfeD9wLhVGROHKtkmKuYDejfvS
         Aa0Q==
X-Gm-Message-State: ACrzQf33Xkm8ANdSehlII2e63i6FZhBi76Ua7D45fTRor7tumStyZQnr
	l0NRmyN5mUbT0b1JUD0Sv/3H3cu2nOPMszZSPLo=
X-Google-Smtp-Source: 
 AMsMyM4N9g15OiSGN6IeGpyUq5jkClsNIoEqgFdJhcBnSfYXWOF4jRHGB+JV4xb5aG4T5CaiwoLgtg==
X-Received: by 2002:a05:6000:1f96:b0:22e:39e3:7b1 with SMTP id
 bw22-20020a0560001f9600b0022e39e307b1mr5799333wrb.482.1664864936720;
        Mon, 03 Oct 2022 23:28:56 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 l22-20020a056000023600b00225239d9265sm11993296wrz.74.2022.10.03.23.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:28:56 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][dunfell][PATCH 1/4] mbedtls: Fix CVE product name
Date: Tue,  4 Oct 2022 08:28:40 +0200
Message-Id: <20221004062843.2541778-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 06:29:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99050

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
index 12ad39761e9f..0ad1e02630a8 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
@@ -41,3 +41,5 @@ PACKAGES =+ "${PN}-programs"
 FILES_${PN}-programs = "${bindir}/"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "mbed_tls"
-- 
2.34.1


