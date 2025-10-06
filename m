Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1C8CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 17:51:20 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2163.1759773072136567284
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 10:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOKIsfd3;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b472842981fso707981566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759773070; x=1760377870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHUraFcalCHi7Jd/1eQa6eyo02Zl6wqZjtCdn/yGnXc=;
        b=dOKIsfd3ndSGc1y+RjFxATKNggKoQjPvZjrbFNxdM4JxLFB44QhViyoOQSLMIdU7NW
         O94fx4MSgVTiWXhAIIwC7zf5JWptHoXqKvvEFnyqyudsflaNZYZE0LgAc8GNrZvBoJq2
         C5nROm2Gze2hgRNLe6JZFn0DnQFQicyn7FRhE6wME8yjMriFtWFIqH1193oayjXgg2Yz
         OiN+WP1U+xOiebEhRMkuIwWCXu2SQFhoMavgEDSF5/QBqD5JJYzuR8LhMusL5llg98S0
         seWV/JJbwjplrnzSn7Y1kBNhk7zpQXueMGQ8AX1t46x+sEi4e3bhXvqEBHujhEBEsAJu
         4zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773070; x=1760377870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHUraFcalCHi7Jd/1eQa6eyo02Zl6wqZjtCdn/yGnXc=;
        b=NJEfCVp+ut5zNmrOIvHXc+KjVpHRoHfRrlSEN4QS++Vy0iw0ihTwNjvbKyM5gPItw8
         YiHybzLYhTF9Fd0batIo2NjJOI5z4KRrMW5T9Ks3g+tL8aYDenQvjM+lyfYAFXWBYEPr
         58kezE6yNN7XmMOeS5KWJe/5twVmZbfs9VE1hqAEz28jSRM3v1Gw8+WJKdA/5apl8z7X
         uKvrGvAs2H5HumF90M+Mfxsx9iYCIdn9NZvuiJef1nCv8dnL7BXKjrYA8HhgB7svN9AZ
         em/4OUtqTD7aeqfJeBldn41zjWa7g7ZaLD+N2ix2XvppJIr78Mgz+RIkVZKtBsviqhXo
         Cyig==
X-Gm-Message-State: AOJu0YyGt1APncq4gHjvGRJcR1h7WYh/ixSPqOuFoxWnw2RjotB5ei3C
	K2PewUHqR2nfY9oWp+3ZpVsBDvkObegY8/Kso4Jfob7Aj5ULpS8pdNQVY62lww==
X-Gm-Gg: ASbGncs1UgoCFyBQJAe7g0/byus6rFs4WyX1YILY449C3WLTFBNekKLFI06lANV140Q
	w28jGy9ne4lnfveLAdHaOBEe4GXXTJZqchyPE5X7RK6DyycdlDlwba8gmpViyj9jipoKELIY6F6
	V5A2ufRgJTkMuW+8Nu5m2K53+X8lmmIJSHShOFa5VkX8+TQO5Eyh1NjJXuZkLNXAxRU9vpiO6OO
	Wkv/6Cc1mwLdKASTmuTICz+7AdTYV3/XtXk/4qa+5Vzq19mX5x1XRzbu4kNfrKq4IW77TgJNJKQ
	XJ1WRVt/Dp+zNstCJWixywM4zm5OYPRP8k/pZSUlNu4wY00/X4rzVuVCHEKSV8OZIcI6x0wFgxI
	5KkpnY4lU9y+rVcBWWQ3L2IvIVffRwCh3SdBUsAvN8Na6
X-Google-Smtp-Source: AGHT+IGs789OQhnDdVvv+SOcSdz8DMjHeHzhwVH1uqMeryKvQr8n8LK9DXZ0TzDhqA00h4l5nYMbfA==
X-Received: by 2002:a17:907:a08a:b0:b42:9689:cabf with SMTP id a640c23a62f3a-b49c344758emr1632698766b.38.1759773070271;
        Mon, 06 Oct 2025 10:51:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4dea9sm1214628466b.73.2025.10.06.10.51.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 10:51:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iperf2: ignore irrelevant CVEs
Date: Mon,  6 Oct 2025 19:51:09 +0200
Message-ID: <20251006175109.3793898-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 17:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120306

These CVEs are for iperf3 - which is a similar application in its goals (and name),
but an independent project from this, and the projects are independent implementations
also, they share no common code.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index 3d965dac00..d31f4ed634 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -20,3 +20,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 CVE_PRODUCT = "iperf_project:iperf"
+CVE_STATUS[CVE-2025-54349] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
+CVE_STATUS[CVE-2025-54350] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
+CVE_STATUS[CVE-2025-54351] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"

