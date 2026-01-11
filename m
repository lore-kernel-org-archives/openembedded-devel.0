Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E7BD2502F
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 11:50:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9110.1768132224008451431
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 03:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5JV7QlH;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so4107443f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 03:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132222; x=1768737022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kbmqpGoMmvB56Z4lOrsAlmFEJRyBRVq8aigKqnqwaXY=;
        b=M5JV7QlHXR53RAdsh+gzxtCblqsIuG1J20F+q6Dd++7p+OgzEGiXQpnaOHg+v/WOVH
         cmUSXfm9XsMLppoAx1p8INLd1+VwoRQhwxoWbiiim5RRc51Nw3XLL3F4VUCQEbRkgx5P
         HLA5IvusKFYLmiWvW6NamibFPVLXOLivjjt9kivZGSHayPNqpKTrejdquSrtJ4CMl6uJ
         X42m4cSjesSJAX3SfXBYy+LofZB475Be0QIjY4qc9qQl9bK2Nmkyly6MqYeTo7ejcwKe
         qTh2q/95fTWRwrC9Y4T/RaWSliPHSehNQa31X04fN7evpk7wx9FGONcJv/Yg3kaGQikW
         wlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132222; x=1768737022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbmqpGoMmvB56Z4lOrsAlmFEJRyBRVq8aigKqnqwaXY=;
        b=a/+2maJK235ioZk4GQ5rNd0q6G7E75HkN4iz/13kpRIZckF5IQ1MBs9TX/FZguk8mp
         MjadufgSDO/4kyEhx43Md+jP8i4B8vQg81GQjIrJn5LhWHZ777sAEqtTdcl4M8MjatVN
         nJyePndHXCmRMzTrc42AOgRjT0T5sX5GLu3uUhgb4ApL2Qelk5zOFZgFBAyNq7pettRM
         vp3wG34LeYsHz2chXAGMTjMkF+Nle0oG2NUk2XfLgk+Qtw+GWlHj0Ms9WVDN6/ij8NIp
         lG9bsTVdteYSpueXaQby37ZkSXixgIfdOSwVuzs4DDqGjOJNj1A1MwUr6NzavH2SEj+q
         YqZA==
X-Gm-Message-State: AOJu0Yy2ppKITabf0uEBwhidBABtwUo3vHzqBhZc5Vb397t9IXUBogvI
	rq5ZV42DdF+GGcT7QFELpFGgVPKJVbn2/rYvHKi+UNMg1XUOLjbKE4dGYpHXKw==
X-Gm-Gg: AY/fxX48th427+cunb/6bGzlw4NhUfkrIqhFC+30Fjv94YwgfeIs9t4u1PbPUWe9S+s
	kbWk/bwhA4FniPP0pOblc2ZvmfgsFQSUT2rY5CJTpvyHmhNShrDDJS6yrUcoLfow5WAIPOlyVi3
	fZyUNT+PmJRK50/dW5PTkginYBNdAkflIPzkB16j3hPntgFNL8gVuJoTfJF/4Wm/fgtsuz2oL+Z
	BBSnC0RG9m3gy5KlgRX8pgtZYY2mF3e4GBZeaO++wIMwkCJb0mWPd2sVP+lFhq7r6XuTettZWMb
	HgUva+AlqJwK+jF7fusc0OzQAx4rJwHAsWgzGONf7rJy9NkG3tvz7n2UcksUlPkc4SFYNUa09Gf
	D/LKdx2EeWHQlMhFc9bERjPII6c5lfamg5b+tzbbU9h5BPZQal2Qeo6Wz/7kMYU9zbwTX5MzfyK
	1w8DF98MM1
X-Google-Smtp-Source: AGHT+IGvrfzWqFK9o1lCmrz6TysVKowwekYSC/7cEBCEaoLcm1aA85vkRNjqPfyPB1Zkmv7uxB2+5A==
X-Received: by 2002:a5d:5d83:0:b0:432:7068:18a with SMTP id ffacd0b85a97d-432c3760d3dmr18456227f8f.20.1768132222154;
        Sun, 11 Jan 2026 03:50:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e19bfsm32337836f8f.18.2026.01.11.03.50.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 03:50:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] asyncmqtt: set CVE_PRODUCT
Date: Sun, 11 Jan 2026 12:50:15 +0100
Message-ID: <20260111115016.2211938-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 11:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123344

The CVEs are tracked with an underscore in the product name:

sqlite> select * from PRODUCTs where product like '%async%mq%';
CVE-2025-65503|redboltz|async_mqtt|10.2.5|=||

This patch sets the correct CVE_PRODUCT.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
index 6a73543821..47de7a7344 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.6.bb
@@ -4,6 +4,8 @@ LICENSE = "BSL-1.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
+CVE_PRODUCT = "async_mqtt"
+
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
 SRCREV = "cb3d37dc3432b9c03fe631eeba2d548de7457bf9"
 

