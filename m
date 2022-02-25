Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B63C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 18:55:58 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.1141.1645815357176411348
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I/olp1Wq;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id t14so2485473pgr.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFkCPWzReNeIkoO3cORFxA2QzdW8ch5CmxQk9tL0TsI=;
        b=I/olp1WqFREjksnqjwwGu/D3V67XdvVqSlvBg0WODmMOIxQ0VKaTEmrbzs1KK7g4a0
         xyluqF0DPmqLSXiroQS79ShhMgv5Ij7IQ3zyPJ0RhpDPOZJdhtEEy1fQzYRh2EqnIeBx
         uSB1JSvj82ypw2CB/FuNgM/8qwtFDEDkqpOXl7MyDvlov2sjEjezfqW0ZJXKbFsKxa1N
         bHb3FuQxZ9o7ExRYCkac/LfEl6ZSo4wYoliI1D6ViJylE9VlwihxiWBT8jYw5Vk6FBpJ
         pygVxHaqOaq8kytgkZGhVzGPzOMIaDNZeNgecKl59RFFz895gypyheC7Hfyj9hrOuS7t
         9pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFkCPWzReNeIkoO3cORFxA2QzdW8ch5CmxQk9tL0TsI=;
        b=CYshkG7ekGCV8WmmRVbBxuql5kQkTn85QOuQmpsqVp+YFfy2efWoA4DBeWQ+TO3RrO
         uIxkv+9bai74IGwjfGWPWSYSX6xz6Ewvs8qOsLgvWfLCjiPXyNG+XhttqJ2SPWiV6UdJ
         t2zDfTAtjdKo4LTK/tKGXjXcHKa7I5uosZVgxYY4SAlyl1q6v1lm6Rhg5WWSboMyzHPA
         9DD1jXGwoc2jHNPA1QRIYw4Ly+M+l/r2UKlDsbJ17FHr8xU6v2lI/UxqvhIGixusmX78
         ihBJ2rEogJnNvd5+Ym6Uxp2AVn2sj9EF0tWgAwqu1kgzhuGYnMrrR9KnhMEuRXgSLOJu
         ujnA==
X-Gm-Message-State: AOAM531/Yvohtv3SDUH6ZniSawQk0lEoRGzQakhO5tA8VAkuHb6IOY9E
	uou+bFzCJuwdeGezJ1L4u/yioA4YJPpbMQ==
X-Google-Smtp-Source: 
 ABdhPJzqAyCFFKNWhpV0Wvj2GGPehYYWeJZ8j343Sl5/v7TWUTt4L5TO/fNJr3lcVYhTwgBAJDdcbA==
X-Received: by 2002:aa7:9253:0:b0:4e1:53d4:c2c6 with SMTP id
 19-20020aa79253000000b004e153d4c2c6mr8945046pfp.62.1645815356166;
        Fri, 25 Feb 2022 10:55:56 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001bc62ecad28sm9990150pje.41.2022.02.25.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 10:55:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-cryptography: fix wheel build
Date: Fri, 25 Feb 2022 10:55:50 -0800
Message-Id: <20220225185551.1458871-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 18:55:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95525

Like python3-setuptools-rust-native, this is building its wheel in
${S}/dist rather than ${B}/dist. Set PIP_INSTALL_DIST_PATH accordingly.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-cryptography_36.0.1.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
index abb15381f5..00791dce2d 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
@@ -20,6 +20,8 @@ SRC_URI += " \
 
 inherit pypi setuptools3_rust
 
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
 DEPENDS += " \
     ${PYTHON_PN}-asn1crypto-native \
     ${PYTHON_PN}-cffi-native \
-- 
2.30.2


